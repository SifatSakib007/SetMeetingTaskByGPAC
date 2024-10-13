using System.ComponentModel.DataAnnotations;

namespace SetMeetingTask.Models
{
    public class ProductService
    {
        [Key]
        public int ProductId { get; set; }

        [Display(Name = "Interested Product/Service")]
        [Required(ErrorMessage = "Select Product Name")]        
        public string ProductName { get; set; } = "";
        
        public string Unit { get; set; } = "";
    }
}
