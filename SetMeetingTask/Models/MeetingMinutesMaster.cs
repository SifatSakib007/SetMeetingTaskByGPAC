using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace SetMeetingTask.Models
{
    public class MeetingMinutesMaster
    {
        [Key]
        public int MeetingId { get; set; }
        /*public int CustomerId { get; set; } // Foreign key*/

        // Add the CustomerId property
       
        public string? CustomerName { get; set; } // Foreign key to Corporate/Individual Customer

        [DisplayName("Date")]
        public DateTime MeetingDate { get; set; }

        [DisplayName("Meeting Place")]
        [Required(ErrorMessage = "Enter Meeting Place")]
        [StringLength(50, ErrorMessage = "Address should be less than or equal to fifty characters.")]
        public string MeetingPlace { get; set; } = "";

        [DisplayName("Attends From Client Side")]
        [Required(ErrorMessage = "Enter Client side information")]
        [StringLength(150, ErrorMessage = "Client side information should be less than or equal to hundred and fifty characters.")]
        public string AttendsClient { get; set; } = "";

        [DisplayName("Attends From Host Side")]
        [Required(ErrorMessage = "Enter Host side information")]
        [StringLength(150, ErrorMessage = "Host side information should be less than or equal to hudred and fifty characters.")]
        public string AttendsHost { get; set; } = "";

        [DisplayName("Meeting Agenda")]
        [Required(ErrorMessage = "Enter meeting Agenda")]
        [StringLength(150, ErrorMessage = "Agenda should be less than or equal to hundred and fifty characters.")]
        public string Agenda { get; set; } = "";

        [DisplayName("Meeting Discussion")]
        [Required(ErrorMessage = "Enter meeting Discussion")]
        public string Discussion { get; set; } = "";

        [DisplayName("Meeting Decision")]
        [Required(ErrorMessage = "Enter meeting Decision")]
        public string Decision { get; set; } = "";
    }
}
