import Foundation
import SwiftLeedsData
import SwiftLeedsDomain

struct ScheduleMapper: ScheduleMapping {

    func map(conferenceID: UUID, slots: [SwiftLeedsData.SlotDataModel]) -> SwiftLeedsDomain.Schedule {
        SwiftLeedsDomain.Schedule(
            conferenceID: conferenceID,
            timeSlots: slots.compactMap(mapSlot)
        )
    }

}

extension ScheduleMapper {

    private func mapSlot(_ slot: SwiftLeedsData.SlotDataModel) -> SwiftLeedsDomain.TimeSlot? {
        let startDate = slot.date
        let endDate = startDate.addingTimeInterval(slot.duration * 60)

        var optionalItem: SwiftLeedsDomain.TimeSlotItem?
        if let activityDataModel = slot.activity {
            let activity = mapActivity(activityDataModel)
            optionalItem = .activity(activity)
        }

        if let presentationDataModel = slot.presentation, let presentation = mapPresentation(presentationDataModel) {
            optionalItem = .presentation(presentation)
        }

        guard let item = optionalItem else {
            return nil
        }

        return SwiftLeedsDomain.TimeSlot(
            id: slot.id,
            startDate: startDate,
            endDate: endDate,
            item: item
        )
    }

    private func mapActivity(_ activity: SwiftLeedsData.ActivityDataModel) -> SwiftLeedsDomain.Activity {
        let metadataURL: URL? = {
            guard !activity.metadataURL.isEmpty else {
                return nil
            }

            return URL(string: activity.metadataURL)
        }()

        return SwiftLeedsDomain.Activity(
            id: activity.id,
            title: activity.title,
            subtitle: activity.subtitle,
            description: activity.description,
            imageURL: activity.image,
            metadataURL: metadataURL
        )
    }

    private func mapPresentation(
        _ presentation: SwiftLeedsData.PresentationDataModel
    ) -> SwiftLeedsDomain.Presentation? {
        guard let speaker = mapSpeaker(presentation.speakers) else {
            return nil
        }

        return SwiftLeedsDomain.Presentation(
            id: presentation.id,
            title: presentation.title,
            synopsis: presentation.synopsis,
            speaker: speaker,
            slidoURL: presentation.slidoURL
        )
    }

    private func mapSpeaker(_ speakers: [SwiftLeedsData.SpeakerDataModel]) -> SwiftLeedsDomain.Speaker? {
        guard let speaker = speakers.first else {
            return nil
        }

        let organisation: String? = {
            guard !speaker.organisation.isEmpty else {
                return nil
            }

            return speaker.organisation
        }()

        return SwiftLeedsDomain.Speaker(
            id: speaker.id,
            name: speaker.name,
            organisation: organisation,
            biography: speaker.biography,
            profileImageURL: speaker.profileImage,
            twitter: speaker.twitter
        )
    }

}
