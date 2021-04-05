#ifndef TGCALLS_SIGNALING_H
#define TGCALLS_SIGNALING_H

#include <string>
#include <vector>

#include "absl/types/variant.h"
#include "absl/types/optional.h"

namespace tgcalls {

namespace signaling {

struct DtlsFingerprint {
    std::string hash;
    std::string setup;
    std::string fingerprint;
};

struct ConnectionAddress {
    std::string ip;
    int port = 0;
};

struct IceCandidate {
    std::string sdpString;
};

struct SsrcGroup {
    std::vector<uint32_t> ssrcs;
    std::string semantics;
};

struct FeedbackType {
    std::string type;
    std::string subtype;
};

struct RtpExtension {
    int id;
    std::string uri;

    RtpExtension(int id_, std::string uri_) :
    id(id_), uri(uri_) {
    }
};

struct PayloadType {
    uint32_t id = 0;
    std::string name;
    uint32_t clockrate = 0;
    uint32_t channels = 0;
    std::vector<FeedbackType> feedbackTypes;
    std::vector<std::pair<std::string, std::string>> parameters;
};

struct MediaContent {
    uint32_t ssrc = 0;
    std::vector<SsrcGroup> ssrcGroups;
    std::vector<PayloadType> payloadTypes;
    std::vector<RtpExtension> rtpExtensions;
};

struct InitialSetupMessage {
    std::string ufrag;
    std::string pwd;
    std::vector<DtlsFingerprint> fingerprints;
    absl::optional<MediaContent> audio;
    absl::optional<MediaContent> video;
};

struct CandidatesMessage {
    std::vector<IceCandidate> iceCandidates;
};

struct MediaStateMessage {
    enum class VideoState {
        Inactive,
        Suspended,
        Active
    };

    bool isMuted = false;
    VideoState videoState = VideoState::Inactive;
    bool isBatteryLow = false;
};

struct Message {
    absl::variant<
        InitialSetupMessage,
        CandidatesMessage,
        MediaStateMessage> data;

    std::vector<uint8_t> serialize() const;
    static absl::optional<Message> parse(const std::vector<uint8_t> &data);
};

};

} // namespace tgcalls

#endif
