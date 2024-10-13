namespace SetMeetingTask.Models
{
    public class MeetingViewModel
    {
        public MeetingMinutesMaster MeetingMaster { get; set; }
        public List<MeetingMinutesDetail> MeetingDetails { get; set; }
    }
}
