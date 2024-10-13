using System.ComponentModel.DataAnnotations;

namespace SetMeetingTask.Models
{
    public class MeetingMinutesDetail
    {
        [Key]
        public int DetailId { get; set; }
        /*public int MeetingId { get; set; } // Foreign key*/
        /*public int ProductId { get; set; } // Foreign key*/
        public string ProductName { get; set; } 

        [Required(ErrorMessage = "Enter Quantity")]
        [Range(0, 10000, ErrorMessage = "Quantity should be between 1 and 10000")]
        public int Quantity { get; set; } = 0;
        public string Unit { get; set; } = "";
    }
}
