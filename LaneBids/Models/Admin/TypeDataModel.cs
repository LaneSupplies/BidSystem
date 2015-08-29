using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LaneBids.Models.Admin
{
    public class TypeDataAllModel
    {
        public List<TypeDataGridModel> AllTypes { get; set; }
    }

    public class TypeDataGridModel
    {
        public string Title { get; set; }
        public bool HasCode { get; set; }
        public TypeDataEnum TypeDataEnum { get; set; }
        public List<TypeDataModel> DataTypes { get; set; }
    }

    public class TypeDataModel
    {
        [Display(Name = "ID")]
        public int ID { get; set; }

        [Display(Name = "Name")]
        public string Name { get; set; }

        [Display(Name = "Code")]
        public string Code { get; set; }

        public TypeDataEnum TypeDataEnum { get; set; }

        public string Create_Date { get; set; }

        public string FullName { get; set; }

    }
}