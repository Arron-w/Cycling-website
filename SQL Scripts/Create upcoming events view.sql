CREATE VIEW [dbo].[vwUpcomingEvents]
	AS SELECT TOP 5  [Event].[Description], [Event].Title, [Event].EventDate, [Event].[Image], [Event].EventId, [Event].[Location], [Event].VenueOpen,[Event].StartTime,[Event].EndTime
	FROM [Event]
	ORDER BY EventDate DESC