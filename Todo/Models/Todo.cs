using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;

namespace TodoDemo.Models
{
    public class Todo
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Please enter a Description.")]
        public string Description { get; set; } = string.Empty;

        [Required(ErrorMessage = "Please enter a due date.")]

        [DataType(DataType.Date)]
        public DateTime? DueDate { get; set; }

        [Required(ErrorMessage = "Please select a CategoryId.")]

        public string CategoryId { get; set; } = string.Empty;

        [ValidateNever]

        public Category Category { get; set; } = null!;

        [Required(ErrorMessage = "Please select a status.")]

        public string StatusId { get; set; } = string.Empty;

        [ValidateNever]

        public Status Status { get; set; } = null!;

        public bool OverDue => StatusId == "open" && DueDate < DateTime.Today;
    }
}
