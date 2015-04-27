using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LaneBids.Models.Admin
{
    public class TypeDataCodeListModel
    {
        public IEnumerable<TypeDataModel> Types { get; set; }

        public string GridTitle { get; set; }

        public TypeDataEnum TypeDataEnum { get; set; }
    }

    public class TypeDataCodeModel
    {
        [Display(Name = "ID")]
        public int ID { get; set; }

        [Display(Name = "Name")]
        public string Name { get; set; }

        [Display(Name = "Code")]
        public string Code { get; set; }

        public DateTime? Create_Date { get; set; }
        public string FullName { get; set; }

    }
}