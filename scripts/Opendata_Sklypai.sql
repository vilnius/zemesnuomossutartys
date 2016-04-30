IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Opendata_Sklypai]'))
DROP VIEW [dbo].[Opendata_Sklypai]
GO

CREATE VIEW [dbo].[Opendata_Sklypai]
AS

SELECT     TOP (100) PERCENT            
		   Sklypo_ID=s.ID,
           Sklypo_kodas=isnull(s.Kodas,''),
           Kadastro_vietoves_kodas=isnull(s.Kadastro_vietoves_kodas,''),
           Kadastro_vietoves_bloko_numeris=isnull(s.Kadastro_vietoves_bloko_numeris,''),
           Sklypo_nr_bloke=s.Sklypo_nr_bloke,
           Anuliavimo_data=cast(s.Anuliavimo_data as date),
           Pagal_pastata=isnull(s.Pastatas,''),
           Sklypo_adresas=a.Adresas,
           Laikotarpis=l.Pavadinimas,
           Bazine_kaina=isnull(REPLACE(CAST(ss.Kaina as varchar),'.', ','),''),
           Plotas=isnull(REPLACE(CAST(ss.Plotas as varchar),'.', ','),''),
           Paskirties_kodas=pt.Kodas,
           Paskirtis=pt.Pavadinimas,
           Charakteristikos_kodas=isnull(ch.Kodas,''),
           Charakteristika=isnull(ch.Pavadinimas,''),
           Turto_grupes_kodas=isnull(tg.Kodas,''),
           Turto_grupe=isnull(tg.Pavadinimas,''),
           Verciu_zona=isnull(vz.Numeris,''),
           Skaitiklis=oss.Skaitiklis,
           Vardiklis=oss.Vardiklis,
           oss.Neapmokestinamas_dydis,
           Objekto_ID=o.ID,
           Moketojo_ID=m.ID,
           Moketojo_kodas= CASE WHEN m.FA_JA=1 THEN m.Kodas ELSE 0 END,
           Moketojo_pavadinimas= CASE WHEN m.FA_JA=1 THEN m.Pavadinimas ELSE dbo.fnFirsties(m.Pavadinimas) END,
           Naudojimo_pradzia=cast(oss.Teises_pradzia as date),
           Naudojimo_pabaiga=cast(oss.Teises_pabaiga as date),
           Taikyti_VRV=isnull(oss.VRV_pozymis,''),
           oss.VRV_visa,
           oss.VRV_dalies,
           Dokumento_data=cast(oss.Dokumento_data as date),
           Dokumento_nr=isnull(oss.Dokumento_nr,''),
           Dokumento_tipas=isnull(dt.Pavadinimas,''),
           Koregavimo_data =cast(oss.Koregavimo_data as date)
FROM sklypai.Sklypai AS s 
	      INNER JOIN sklypai.Sklypo_savybes AS ss ON ss.Sklypai_ID = s.ID 
		  INNER JOIN dbo.Objektai AS o ON o.Sklypai_ID = s.ID 
          INNER JOIN dbo.Moketojai AS m ON m.ID = o.Moketojai_ID 
          INNER JOIN dbo.Adresai AS a ON a.ID = ss.Adresai_ID 
          INNER JOIN dbo.Laikotarpiai AS l ON l.ID = ss.Laikotarpiai_ID 
          LEFT JOIN dbo.Objekto_savybes_sklypai AS oss ON oss.Objektai_ID = o.ID AND oss.Laikotarpiai_ID = 8 
          LEFT OUTER JOIN sklypai.Paskirciu_tipai AS pt ON pt.ID = ss.Paskirciu_tipai_ID 
          LEFT OUTER JOIN sklypai.Naudojimo_charakteristikos AS ch ON ch.ID = ss.Naudojimo_charakteristikos_ID 
          LEFT OUTER JOIN sklypai.Turto_grupes AS tg ON tg.ID = ss.Turto_grupe_ID 
          LEFT OUTER JOIN sklypai.Verciu_zonos AS vz ON vz.ID = ss.Verciu_zonos_ID 
          LEFT OUTER JOIN sklypai.Dokumentu_tipai AS dt ON dt.ID = oss.Dokumentu_tipai_ID
WHERE     (ss.Laikotarpiai_ID = 8)





GO


