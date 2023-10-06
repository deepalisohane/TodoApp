using System.ComponentModel.DataAnnotations;

namespace TodoDemo.Models
{
    public class Filters
    {
        public Filters(string filterstring)
        {
            FilterString = filterstring ?? "all-all-all";
            string[] filters = FilterString.Split('-');
            CategoryId = filters[0];
            DueDate = filters[1];
            StatusId = filters[2];

        }

        public string FilterString { get; set; }
        public string CategoryId { get; }
        [DataType(DataType.Date)]
        public string DueDate { get; }
        public string StatusId { get; }

        public bool HasCategory => CategoryId.ToLower() != "all";

        public bool HasDueDate => DueDate.ToLower() != "all";
        public bool HasStatus => StatusId.ToLower() != "all";

        public static Dictionary<string, string> DueFilterValues =>
            new Dictionary<string, string>
            {
                {"future", "Future" },
                {"past", "Past" },
                {"today", "Today" }
            };
        public bool IsPast => DueDate.ToLower() == "past";
        public bool IsFuture => DueDate.ToLower() == "future";
        public bool IsToday => DueDate.ToLower() == "today";
    }
}
