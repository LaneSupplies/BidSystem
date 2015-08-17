using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LaneBids.Models;

namespace LaneBids.Sources
{
    public class CanopyServices
    {
        public CanopyDetailsModel CanopyLoadData(BidDetailsModel bidDetails)
        {
            var entities = new LaneEntities();
            var canopyInfo = new CanopyDetailsModel();
            canopyInfo.BidId = bidDetails.BidId;
            canopyInfo.StructureId = bidDetails.StructureId;

            //canopyInfo.ColorList = entities.Colors.ToList().Select(x => new SelectListItem
            //    {
            //        Value = x.Color_ID.ToString(),
            //        Text = x.Name
            //    }).ToList();
            //canopyInfo.ColorList.Add(new SelectListItem { Selected = true, Text = " -- Select Color -- ", Value = "0" });

            
            canopyInfo.FasciaTypeList = entities.Fascia_Types.ToList().Select(x => new SelectListItem
            {
                Value = x.Fascia_Type_ID.ToString(),
                Text = x.Name
            }).ToList();
            canopyInfo.FasciaTypeList.Add(new SelectListItem { Selected = true, Text = " -- Select -- ", Value = "0" });

            canopyInfo.ColumnTypeList = entities.Column_Types.ToList().Select(x => new SelectListItem
            {
                Value = x.Column_Type_ID.ToString(),
                Text = x.Name
            }).ToList();
            canopyInfo.ColumnTypeList.Add(new SelectListItem { Selected = true, Text = " -- Select -- ", Value = "0" });

            canopyInfo.ImageList = entities.Images.ToList().Select(x => new SelectListItem
            {
                Value = x.Image_ID.ToString(),
                Text = x.Image_Path
            }).ToList();
            canopyInfo.ImageList.Add(new SelectListItem { Selected = true, Text = " -- Select -- ", Value = "0" });



            canopyInfo.DeckStyleList = entities.Deck_Styles.ToList().Select(x => new SelectListItem
            {
                Value = x.Deck_Style_ID.ToString(),
                Text = x.Name
            }).ToList();
            canopyInfo.DeckStyleList.Add(new SelectListItem { Selected = true, Text = " -- Select -- ", Value = "0" });

            canopyInfo.DrainageList = entities.Drainage_Types.ToList().Select(x => new SelectListItem
            {
                Value = x.Drainage_Type_ID.ToString(),
                Text = x.Name
            }).ToList();
            canopyInfo.DrainageList.Add(new SelectListItem { Selected = true, Text = " -- Select -- ", Value = "0" });

            //Colors
            canopyInfo.FaciaColors = new ColorModel
            {
                FasciaColorList = entities.Colors.ToList().Select(x => new SelectListItem
                {
                    Value = x.Color_ID.ToString(),
                    Text = x.Name
                }).ToList()
            };

            return canopyInfo;
        }
    }
}