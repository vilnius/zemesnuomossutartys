IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Opendata_Sumos]'))
DROP VIEW [dbo].[Opendata_Sumos]
GO

CREATE VIEW [dbo].[Opendata_Sumos]
AS

select TOP 100 PERCENT
	Moketojo_ID=m.ID,
	Moketojo_kodas=CASE WHEN m.FA_JA=1 THEN m.Kodas ELSE '' END,
	Moketojo_pavadinimas= CASE WHEN m.FA_JA=1 THEN m.Pavadinimas ELSE dbo.fnFirsties(m.Pavadinimas) END,
    SUM(Suma) AS Suma,
    Valiuta
from Moketojai m 
JOIN Pavedimu_operacijos po ON m.ID=Moketojai_ID
GROUP by m.ID,m.Kodas,m.Pavadinimas,po.Valiuta,m.FA_JA
ORDER BY m.ID

GO


