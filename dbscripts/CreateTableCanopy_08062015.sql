USE [Lane]
GO

ALTER TABLE [dbo].[Bid_Canopies] DROP CONSTRAINT [FK_Bid_Canopies_Canopy]
GO

ALTER TABLE [dbo].[Column_Spacing_Lengths] DROP CONSTRAINT [FK_Column_Spacing_Lengths_Canopies]
GO

ALTER TABLE [dbo].[Column_Spacing_Widths] DROP CONSTRAINT [FK_Column_Spacing_Widths_Canopies]
GO

ALTER TABLE [dbo].[Canopies] DROP CONSTRAINT [FK_Measurements_Canopy_Size_Width]
GO

ALTER TABLE [dbo].[Canopies] DROP CONSTRAINT [FK_Measurements_Canopy_Size_Length]
GO

ALTER TABLE [dbo].[Canopies] DROP CONSTRAINT [FK_Measurements_Canopy_Fascia_Height]
GO

ALTER TABLE [dbo].[Canopies] DROP CONSTRAINT [FK_Measurements_Canopy_Deck_Thickness]
GO

ALTER TABLE [dbo].[Canopies] DROP CONSTRAINT [FK_Measurements_Canopy_Column_Size]
GO

ALTER TABLE [dbo].[Canopies] DROP CONSTRAINT [FK_Measurements_Canopy_Clearance_Height]
GO

ALTER TABLE [dbo].[Canopies] DROP CONSTRAINT [FK_Images_Canopy]
GO

ALTER TABLE [dbo].[Canopies] DROP CONSTRAINT [FK_Gutter_Types_Canopy]
GO

ALTER TABLE [dbo].[Canopies] DROP CONSTRAINT [FK_Fascia_Types_Canopy]
GO

ALTER TABLE [dbo].[Canopies] DROP CONSTRAINT [FK_Drainage_Types_Canopy]
GO

ALTER TABLE [dbo].[Canopies] DROP CONSTRAINT [FK_Drainage_Measurement_Canopy]
GO

ALTER TABLE [dbo].[Canopies] DROP CONSTRAINT [FK_Deck_Styles_Canopy]
GO

ALTER TABLE [dbo].[Canopies] DROP CONSTRAINT [FK_Column_Types_Canopy]
GO

ALTER TABLE [dbo].[Canopies] DROP CONSTRAINT [FK_Colors_Canopy_2]
GO

ALTER TABLE [dbo].[Canopies] DROP CONSTRAINT [FK_Colors_Canopy_1]
GO


/****** Object:  Table [dbo].[Canopies]    Script Date: 8/6/2015 9:58:26 PM ******/
DROP TABLE [dbo].[Canopies]
GO

If @@Error <> 0 
Begin
	raiserror('Error Dropping Table', 20, -1) with log
End

/****** Object:  Table [dbo].[Canopies]    Script Date: 8/6/2015 9:58:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Canopies](
	[Canopy_ID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[Size_Width_Measure_ID] [int] NOT NULL,
	[Size_Length_Measure_ID] [int] NOT NULL,
	[Clearance_Height_Measure_ID] [int] NOT NULL,
	[Column_Quantity] [int] NULL,
	[Column_Type_ID] [int] NOT NULL,
	[Column_Size_Measure_ID] [int] NOT NULL,
	[Column_Spacing_Notes] [varchar](1000) NULL,
	[Deck_Style_ID] [int] NOT NULL,
	[Deck_Color_ID] [int] NULL,
	[Deck_Thickness_Measure_ID] [int] NOT NULL,
	[Image_ID] [int] NOT NULL,
	[Facia_Image] [varchar](100) NULL,
	[Fascia_Height_Measure_ID] [int] NULL,
	[Fascia_Type_ID] [int] NOT NULL,
	[Fascia_Color_ID] [int] NULL,
	[Fascia_Info] [varchar](2000) NULL,
	[Facia_Thickness] [int] NULL,
	[Drainage_Type_ID] [int] NOT NULL,
	[Drainage_Measure_ID] [int] NULL,
	[Gutter_Type_ID] [int] NULL,
	[Other_Notes] [varchar](2000) NULL,
	[Inclusion_Notes] [varchar](2000) NULL,
	[Exclusion_Notes] [varchar](2000) NULL,
	[General_Inclusion_Notes] [varchar](2000) NULL,
	[General_Exclusion_Notes] [varchar](2000) NULL,
	[Base_Price] [decimal](19, 4) NULL,
	[Material_Price] [decimal](19, 4) NULL,
	[Labor_Price] [decimal](19, 4) NULL,
	[Freight_Price] [decimal](19, 4) NULL,
	[Tax_Price] [decimal](19, 4) NULL,
	[Total_Price] [decimal](19, 4) NULL,
	[Alt_Base_Price] [decimal](19, 4) NULL,
	[Design_Loads_Live_Psf] [int] NULL,
	[Design_Load_Wind_Mph] [int] NULL,
	[Design_Load_Wind_Psf] [int] NULL,
	[Design_Load_Snow] [varchar](1000) NULL,
	[Design_Load_Spec] [varchar](1000) NULL,
	[Design_Load_Notes] [varchar](1000) NULL,
	[Drawing_Sealed] [varchar](1) NULL,
	[Drawing_State] [varchar](20) NULL,
	[Drawing_Code] [varchar](20) NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modifed_Date] [datetime] NULL,
 CONSTRAINT [PK_Canopies] PRIMARY KEY CLUSTERED 
(
	[Canopy_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Colors_Canopy_1] FOREIGN KEY([Deck_Color_ID])
REFERENCES [dbo].[Colors] ([Color_ID])
GO

ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Colors_Canopy_1]
GO

ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Colors_Canopy_2] FOREIGN KEY([Fascia_Color_ID])
REFERENCES [dbo].[Colors] ([Color_ID])
GO

ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Colors_Canopy_2]
GO

ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Column_Types_Canopy] FOREIGN KEY([Column_Type_ID])
REFERENCES [dbo].[Column_Types] ([Column_Type_ID])
GO

ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Column_Types_Canopy]
GO

ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Deck_Styles_Canopy] FOREIGN KEY([Deck_Style_ID])
REFERENCES [dbo].[Deck_Styles] ([Deck_Style_ID])
GO

ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Deck_Styles_Canopy]
GO

ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Drainage_Measurement_Canopy] FOREIGN KEY([Drainage_Measure_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO

ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Drainage_Measurement_Canopy]
GO

ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Drainage_Types_Canopy] FOREIGN KEY([Drainage_Type_ID])
REFERENCES [dbo].[Drainage_Types] ([Drainage_Type_ID])
GO

ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Drainage_Types_Canopy]
GO

ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Fascia_Types_Canopy] FOREIGN KEY([Fascia_Type_ID])
REFERENCES [dbo].[Fascia_Types] ([Fascia_Type_ID])
GO

ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Fascia_Types_Canopy]
GO

ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Gutter_Types_Canopy] FOREIGN KEY([Gutter_Type_ID])
REFERENCES [dbo].[Gutter_Types] ([Gutter_Type_ID])
GO

ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Gutter_Types_Canopy]
GO

ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Images_Canopy] FOREIGN KEY([Image_ID])
REFERENCES [dbo].[Images] ([Image_ID])
GO

ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Images_Canopy]
GO

ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Measurements_Canopy_Clearance_Height] FOREIGN KEY([Clearance_Height_Measure_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO

ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Measurements_Canopy_Clearance_Height]
GO

ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Measurements_Canopy_Column_Size] FOREIGN KEY([Column_Size_Measure_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO

ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Measurements_Canopy_Column_Size]
GO

ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Measurements_Canopy_Deck_Thickness] FOREIGN KEY([Deck_Thickness_Measure_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO

ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Measurements_Canopy_Deck_Thickness]
GO

ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Measurements_Canopy_Fascia_Height] FOREIGN KEY([Fascia_Height_Measure_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO

ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Measurements_Canopy_Fascia_Height]
GO

ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Measurements_Canopy_Size_Length] FOREIGN KEY([Size_Length_Measure_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO

ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Measurements_Canopy_Size_Length]
GO

ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Measurements_Canopy_Size_Width] FOREIGN KEY([Size_Width_Measure_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO

ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Measurements_Canopy_Size_Width]
GO

ALTER TABLE [dbo].[Bid_Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Bid_Canopies_Canopy] FOREIGN KEY([Canopies_Canopy_ID])
REFERENCES [dbo].[Canopies] ([Canopy_ID])
GO

ALTER TABLE [dbo].[Bid_Canopies] CHECK CONSTRAINT [FK_Bid_Canopies_Canopy]
GO

ALTER TABLE [dbo].[Column_Spacing_Lengths]  WITH CHECK ADD  CONSTRAINT [FK_Column_Spacing_Lengths_Canopies] FOREIGN KEY([Canopy_ID])
REFERENCES [dbo].[Canopies] ([Canopy_ID])
GO

ALTER TABLE [dbo].[Column_Spacing_Lengths] CHECK CONSTRAINT [FK_Column_Spacing_Lengths_Canopies]
GO

ALTER TABLE [dbo].[Column_Spacing_Widths]  WITH CHECK ADD  CONSTRAINT [FK_Column_Spacing_Widths_Canopies] FOREIGN KEY([Canopy_ID])
REFERENCES [dbo].[Canopies] ([Canopy_ID])
GO

ALTER TABLE [dbo].[Column_Spacing_Widths] CHECK CONSTRAINT [FK_Column_Spacing_Widths_Canopies]
GO

