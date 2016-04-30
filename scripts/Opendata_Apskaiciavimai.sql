IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Opendata_Apskaiciavimai]'))
DROP VIEW [dbo].[Opendata_Apskaiciavimai]
GO

CREATE VIEW [dbo].[Opendata_Apskaiciavimai]
AS

SELECT A.[ID]
      ,[Objektai_ID]
      ,O.Sklypai_ID
      ,[Kiekis]
      ,[Tarifas]
      ,A.[Lengvata]
      ,[Suma]
      ,[Suma_be_lengvatos]
      ,[Paslaugos_pradzia]
      ,[Paslaugos_pabaiga]
      ,[Plotas]
      ,[ND_plotas]
      ,[TG_kodas]
      ,[VZ_numeris]
      ,[VRV_pozymis]
  FROM [dbo].[Apskaiciavimai] A
  JOIN [dbo].[Objektai] O ON O.ID=A.Objektai_ID 
  JOIN [dbo].Deklaracijos D ON A.Deklaracijos_ID=D.ID AND D.Patvirtinimo_data IS NOT NULL AND D.Anuliavimo_data IS NULL
  
  
GO


