
-- =============================================
-- Author:		Robert Stanley
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE BidSearch 
	-- Add the parameters for the stored procedure here
	@BidId int = 0, 
	@BidTypeId int = 0,
	@SiteId int = 0,
	@BidStatusId int = 0,
	@JobTypeId int = 0

AS
BEGIN
	SELECT BI.Bid_ID, BI.Bid_Status_ID, BI.Bid_Type_ID
	FROM Bids BI
		,Bid_Types BT
		,Job_Types JT
		,Sites SI
		,Bid_Statuses BS
		,Addresses AD
	WHERE BI.Bid_Type_ID = BT.Bid_Type_ID
	  AND BI.Bid_Status_ID = BS.Bid_Status_ID
	  AND BI.Site_ID = SI.Site_ID
	  AND BI.Job_Type_ID = JT.Job_Type_ID
	  AND (BI.Shipping_ID = AD.Address_ID 
		OR SI.Address_ID = AD.Address_ID)
	  AND (BI.Bid_ID = @BidId 
	    OR BT.Bid_Type_ID = @BidTypeId 
		OR JT.Job_Type_ID = @JobTypeId 
		OR SI.Site_ID = @SiteId
		OR BS.Bid_Status_ID = @BidStatusId)
	
END
GO
