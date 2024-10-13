using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace SetMeetingTask.Models
{
    public class CorporateCustomer
    {
        [Key]
        public int CustomerId { get; set; }

        [DisplayName("Customer Name")]
        [Required(ErrorMessage = "Select Customer Name")]
        public string CustomerName { get; set; } = "";
    }
}
