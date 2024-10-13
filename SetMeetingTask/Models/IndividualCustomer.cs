using System.ComponentModel.DataAnnotations;

namespace SetMeetingTask.Models
{
    public class IndividualCustomer
    {
        [Key]
        public int CustomerId { get; set; }

        [Display(Name = "Customer Name")]
        [Required(ErrorMessage = "Select Customer Name")]
        public string CustomerName { get; set; } = "";
    }
}
