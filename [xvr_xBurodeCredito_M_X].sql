USE [FINANCIERAAPP]
GO

/****** Object:  View [dbo].[xvr_xBurodeCredito_M_X]    Script Date: 15/06/2017 12:02:13 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER  VIEW [dbo].[xvr_xBurodeCredito_M_X] AS 
Select --c.PKOportunity, 
      upper(A.custid) AS 'CUSTID'
	 ,UPPER(A.CName) AS 'NAME'
	 ,CONVERT(Integer,(A.Cur)) AS 'Saldo'
	 ,a.NoContrato
	 ,c.cliente_aval
	 ------------------------------------------------------------------------------------------------------------------------ SEGMENTO HD
	 ------------------------------------------------------------------------------------------------------------------------ SEGMENTO EM
	 ,UPPER(c.new_RFC) AS 'RFC DEL ACREDITADO'
	 --,UPPER(case when c.new_curp is null then '' else c.new_curp end) AS 'CODIGO DE CIUDADANO (CURP DE MEXICO)'
	 ,UPPER('') AS 'CODIGO DE CIUDADANO (CURP DE MEXICO)'
	 ,'0000000000' AS 'RESERVADO'
	 ,UPPER(A.CName) AS 'NOMBRE DE LA COMPAÑIA'
	 --,UPPER(c.new_Nombre) AS 'PRIMER NOMBRE'
	 ,UPPER('') AS 'PRIMER NOMBRE'
	 --,UPPER(c.new_SegundoNombre) AS 'SEGUNDO NOMBRE'
	 ,UPPER('') AS 'SEGUNDO NOMBRE'
	 --,UPPER(c.new_Apellidos ) AS 'APELLIDO PATERNO'
	 ,UPPER('' ) AS 'APELLIDO PATERNO'
	 --,UPPER(c.new_ApellidoMaterno) AS 'APELLIDO MATERNO'
	 ,UPPER('') AS 'APELLIDO MATERNO'
	 --,UPPER((case when D.DESCR = 'MEXICO' then 'MX' else '' end)) as 'NACIONALIDAD'
	 ,UPPER('') as 'NACIONALIDAD'
	 ,UPPER('') AS 'CALIFICACION DE CARTERA'
	 ,UPPER('00009999999') AS 'ACTIVIDAD ECONÓMICA 1 BANXICO / SCIAN'
	 ,UPPER('00000000000') AS 'ACTIVIDAD ECONÓMICA 2 BANXICO / SCIAN'
	 ,UPPER('00000000000') AS 'ACTIVIDAD ECONÓMICA 3 BANXICO / SCIAN'
	 ,UPPER(substring(rtrim(c.Domicilio),0,40)) AS 'PRIMER LINEA DE DIRECCION'
	 --,UPPER(substring(rtrim(c.Domicilio),40,len(rtrim(b.Domicilio)))) AS 'SEGUNDA LINEA DE DIRECCION'
	 ,UPPER('') AS 'SEGUNDA LINEA DE DIRECCION'
	 ,UPPER(c.new_Colonia) AS 'COLONIA O  POBLACION'
	 ,UPPER(c.new_Ciudad) AS 'DELEGACION O MUNICIPIO'
	 ,UPPER(c.new_Ciudad) AS 'CIUDAD'
	 ,UPPER(case when b.state = 'D.F' then 'DF'
	 when b.state = 'EDO' then 'EM'
	 when b.state = 'MCH' then 'MICH'
	 when b.state = 'N.L' then 'NL'
	 when b.state = 'QUI' then 'QR'
	 when b.state = 'CDM' then 'DF'  
	 else B.STATE end) AS 'NOMBRE DE ESTADO PARA DOMICILIOS EN MEXICO'
	 ,UPPER(c.new_cptext) AS 'CODIGO POSTAL'
	 ,UPPER(c.new_telefonocasa) AS 'NUMERO DE TELEFONO'
	 ,UPPER('') AS 'EXTENSION TELEFONICA'
	 ,UPPER('') AS 'NUMERO DE FAX'
	 ,UPPER('1') AS 'TIPO DE CLIENTE'
	 ,UPPER('') AS 'NOMBRE DE ESTADO EN EL PAIS EXTRANJERO'
	 ,UPPER((case when D.DESCR = 'MEXICO' then 'MX' else '' end)) as  'PAIS DE ORIGEN DEL DOMICILIO'
	 ,UPPER('') AS 'CLAVE DE CONSOLIDACION'
	 ,UPPER('') AS 'FILLER'
	 -------------------------------------------------------------------------------------------------------------------------- SEGMENTO AC
	 ----,UPPER(' ') AS 'RFC DEL ACCIONISTA'
	 ----,UPPER(' ') AS 'CODIGO DE CIUDADANO(CURP EN MEXICO) DEL ACCIONISTA'
	 ----,UPPER(' ') AS 'CAMPO RESERVADO'
	 --,UPPER(A.CName) AS 'NOMBRE DE LA COMPAÑIA ACCIONISTA'
	 --,UPPER(' ') AS 'PRIMER NOMBRE DEL ACCIONISTA'
	 ----,UPPER(' ') AS 'SEGUNDO NOMBRE DEL ACCIONISTA'
	 --,UPPER(' ') AS 'APELLIDO PATERNO DEL ACCIONISTA'
	 --,UPPER(' ') AS 'APELLIDO MATERNO DEL ACCIONISTA'
	 --,UPPER(' ') AS 'PORCENTAJE DEL ACCIONISTA'
	 --,UPPER(' ') AS 'PRIMER LINEA DE DIRECCION DEL ACCIONISTA'
	 ----,UPPER(' ') AS 'SEGUNDA LIBEA DE DIRECCION DEL ACCIONISTA'
	 ----,UPPER(' ') AS 'COLONIA O POBLACION'
	 --,UPPER(' ') AS 'DELEGACION O MUNICIPIO*'
	 --,UPPER(' ') AS 'CIUDAD*'
	 ----,UPPER(' ') AS 'NOMBRE DE ESTADO PARA DOMICILIOS EN MEXICO'
	 ----,UPPER(' ') AS 'CODIGO POSTAL'
	 ----,UPPER(' ') AS 'NUMERO DE TELEFONO'
	 ----,UPPER(' ') AS 'EXTENSION TELEFONICA'
	 ----,UPPER(' ') AS 'NUMERO DE FAX'
	 --,UPPER('1') AS 'TIPO DE ACCIONISTA'
	 --,UPPER(' ') AS 'NOMBRE DE ESTADO EN EL PAIS EXTRANJERO*'
	 ----,UPPER(' ') AS 'PAIS DE ORIGEN DEL DOMICILIO'
	 --,UPPER('                         ') AS 'FILLER*'
	 ------------------------------------------------------------------------------------------------------------------------ SEGMENTO CR
	 ,UPPER(c.new_RFC) AS 'RFC DEL ACREDITADO*'
	 ,UPPER('000000') AS 'NUMERO DE EXPERIENCIAS CREDITICIAS'
	 ,UPPER(c.new_numcontrato) AS 'NUMERO DE CUENTA,CREDITO O CONTRATO'
	 ,UPPER('') AS 'NUMERO DE CUENTA, CREDITO O CONTRATO ANTERIOR'
	 ,UPPER(case when REPLACE(CONVERT(VARCHAR(10),c.new_Fechadecontratacion, 103), '/', '') is null 
			then '01011900'
			else REPLACE(CONVERT(VARCHAR(10),c.new_Fechadecontratacion, 103), '/', '') end )  AS 'FECHA DE APERTURA DE CUENTA O CREDITO'
	 ,UPPER(((case when a.terms is null then '1' else a.terms end)/12)*365) AS'PLAZO'
	 ,UPPER('I') AS 'TIPO DE CREDITO'
	 ,CONVERT(Integer,(isnull(G.[TOTAL DEL PAGARE],0) + isnull(G.[SEGURO CONTADO],0) + isnull(G.[SEGURO CREDITO],0) + isnull(G.[COMISION POR APERTURA],0) 
	   + isnull(G.[GASTOS DE INVESTIGACION],0))) AS 'MONTO AUTORIZADO DEL CREDITO'
	 ,UPPER('001') AS 'MONEDA'
	 ,UPPER(case when a.terms is null then '' else a.terms end) AS  'NUMERO DE PAGOS'
	 ,UPPER('30') AS 'FRECUENCIA DE PAGOS'
	 ,CONVERT(Integer,(case when f.OrigDocAmt is null then e.OrigDocAmt else f.OrigDocAmt end)) as  'IMPORTE DE PAGO'
	 ,(select top 1 
				REPLACE(CONVERT(VARCHAR(10),Max(x.DateAppl), 103), '/', '')--,A.CUSTID,a.user5,a.periodo 
				from 
				xvr_xBuroUltimoPagoHecho x
				where x.user5 = a.NoContrato --AND 
				--x.PERIODO <= '200912'
				group by x.CUSTID,x.user5,x.periodo
				order by Max(x.DateAppl) desc
			) 
		AS 'FECHA DE ULTIMO PAGO'
	,UPPER('00000000') AS 'FECHA DE REESTRUCTURA'
	,UPPER('00000000000000000000') AS 'PAGO FINAL PARA CIERRE DE CUENTA MOROSA (PAGO ENEFECTIVO)'
	,UPPER('00000000') AS 'FECHA DE LIQUIDACION'
	,UPPER('00000000000000000000') AS 'QUITA'
	,UPPER('00000000000000000000') AS 'DACION EN PAGO'
	,UPPER('00000000000000000000') AS 'QUEBRANTO O CASTIGO'
	,UPPER('') AS 'CLAVE DE OBSERVACION'
	,UPPER('') AS 'MARCA PARA CREDITO ESPECIAL'
	,UPPER('00000000') AS 'FECHA DE PRIMER INCUMPLIMIENTO'
	,CONVERT(Integer,(isnull(a.CurPerPost,0))) AS 'SALDO INSOLUTO DEL PRINCIPAL'
	,UPPER('') AS 'FILLER**'
	 -------------------------------------------------------------------------------------------------------------------------- SEGMENTO DE 
	 ,UPPER(c.new_RFC) AS 'RFC DEL ACREDITADO**'
	 ,UPPER(c.new_numcontrato) AS 'NUMERO DE CUENTA,CREDITO O CONTRATO*'
	 ,UPPER(H.DiasVencidosDocumento) AS 'NUMERO DE DIAS DE VENCIDO'
	 ,CONVERT(Integer,(isnull(a.CurPerPost,0))) AS 'CANTIDAD(SALDO)'
	 ,UPPER('') AS 'FILLER***'
	 ---------------------------------------------------------------------------------------------------------------------------- SEGMENTO AV
	 --,UPPER(CASE WHEN c.cliente_aval = 'Aval' then c.new_RFC else '' End) AS 'RFC DEL AVAL'
	 ,UPPER(CASE WHEN c.cliente_aval = 'Aval' then c.new_RFC else '' End) AS 'RFC DEL AVAL'
	 ,UPPER(CASE WHEN c.cliente_aval = 'Aval' then c.new_curp else '' End) AS 'CODIGO DE CIUDADANO (CURP EN MEXICO) DEL AVAL'
	 ,UPPER('0000000000') AS 'CAMPO RESERVADO'
	 ,UPPER( CASE WHEN C.new_personalidad = '1' THEN '' 
			 WHEN C.new_personalidad = '3' THEN '' 
			 WHEN C.new_personalidad = '2' THEN C.new_Nombre
			 ELSE '' end) AS 'NOMBRE DE COMPAñA AVAL'
	 ,UPPER(CASE WHEN c.cliente_aval = 'Aval' then c.new_Nombre else '' End) AS 'PRIMER NOMBRE DEL AVAL'
	  --,UPPER(c.new_Nombre) AS 'PRIMER NOMBRE DEL AVAL'
	 ,UPPER(CASE WHEN c.cliente_aval = 'Aval' then c.new_SegundoNombre else '' End) AS 'SEGUNDO NOMBRE DEL AVAL'
	 -- ,UPPER(c.new_SegundoNombre) AS 'SEGUNDO NOMBRE DEL AVAL'
	 ,UPPER(CASE WHEN c.cliente_aval = 'Aval' then c.new_Apellidos else '' End) AS 'APELLIDO PATERNO DEL AVAL'
	 -- ,UPPER(c.new_Apellidos) AS 'APELLIDO PATERNO DEL AVAL'
	 ,UPPER(CASE WHEN c.cliente_aval = 'Aval' then c.new_ApellidoMaterno else '' End) AS 'APELLIDO MATERNO DEL AVAL'
	 -- ,UPPER(c.new_ApellidoMaterno) AS 'APELLIDO MATERNO DEL AVAL'
	 ,UPPER(CASE WHEN c.cliente_aval = 'Aval' then substring(rtrim(c.Domicilio),0,40) else '' End) AS 'PRIMER LINEA DE DIRECCION DEL AVAL'
	 --,UPPER(substring(rtrim(c.Domicilio),0,40)) AS 'PRIMER LINEA DE DIRECCION DEL AVAL'
	 ,UPPER(CASE WHEN c.cliente_aval = 'Aval' then substring(rtrim(c.Domicilio),40,len(rtrim(b.Domicilio))) else '' End) AS 'SEGUNDA LINEA DE DIRECCION DEL AVAL'
	 --,UPPER(substring(rtrim(c.Domicilio),40,len(rtrim(b.Domicilio)))) AS 'SEGUNDA LINEA DE DIRECCION DEL AVAL'
	 ,UPPER(CASE WHEN c.cliente_aval = 'Aval' then c.new_colonia else '' End) AS 'COLONIA O POBLACION'
	 --,UPPER(c.new_colonia) AS 'COLONIA O POBLACION'
	 ,UPPER(CASE WHEN c.cliente_aval = 'Aval' then c.new_Ciudad else '' End) AS 'DELEGACION O MUNICIPIO**'
	 --,UPPER(c.new_Ciudad) AS 'DELEGACION O MUNICIPIO**'
	 ,UPPER(CASE WHEN c.cliente_aval = 'Aval' then c.new_Ciudad else '' End) AS 'CIUDAD**'
	 --,UPPER(c.new_Ciudad) AS 'CIUDAD**'
	 ,UPPER(CASE WHEN c.cliente_aval = 'Aval' then c.new_estadoburocredito else '' End) AS 'NOMBRE DE ESTADO PARA DIRECCIONES EN MEXICO'
	 --,UPPER(c.new_estadoburocredito) AS 'NOMBRE DE ESTADO PARA DIRECCIONES EN MEXICO'
	 ,UPPER(CASE WHEN c.cliente_aval = 'Aval' then C.new_cptext else '' End) AS 'CODIGO POSTAL**'
	 --,UPPER(C.new_cptext) AS 'CODIGO POSTAL**'
	 ,UPPER(CASE WHEN c.cliente_aval = 'Aval' then C.new_telefonocasa else '' End) AS 'NUMERO DE TELEFONO*'
	 --,UPPER(C.new_telefonocasa) AS 'NUMERO DE TELEFONO*'
	 ,UPPER('') AS 'EXTENSION TELEFONICA*'
	 ,UPPER('') AS 'NUMERO DE FAX*'
	 ,UPPER('') AS 'TIPO DE AVAL'
	 ,UPPER('') AS 'NOMBRE DE ESTADO EN EL PAIS EXTRANJERO**'
	 ,UPPER('MX') AS 'PAIS DE ORIGEN DEL DOMICILIO**'
	 ,UPPER('') AS 'FILLER****'
	 -------------------------------------------------------------------------------------------------------------------------- SEGMENTO TS
	 ,UPPER('000') AS 'NOMBRE DE COMPAñIA REPORTADAS'
	 ,UPPER('') AS 'NUMERO DE COMPA;IAS REPORTADAS'
	 ,(SELECT SUM([CANTIDAD(SALDO)]) FROM [dbo].[xvr_xBurodeCredito_M_suma]) AS 'TOTAL DE CANTIDAD(SALDO)'
	 ,UPPER('') AS 'FILLER*****'
	 -------------------------------------------------------------------------------------------------------------------------- SEGMENTO PN
	 --,UPPER(c.new_Apellidos ) AS 'APELLIDO PATERNO'
	 --,UPPER(c.new_ApellidoMaterno) AS 'APELLIDO MATERNO'	
	 --,UPPER(case when C.new_ApellidoAdicional is null then '' else C.new_ApellidoAdicional end) AS 'APELLIDO ADICIONAL'
	 --,UPPER(c.new_Nombre) AS 'PRIMER NOMBRE'
	 --,UPPER(c.new_SegundoNombre) AS 'SEGUNDO NOMBRE'
	 ----,UPPER(REPLACE(CONVERT(VARCHAR(10),B.User7, 103), '/', '')) AS 'FECHA DE NACIMIENTO'
	 --,UPPER(REPLACE(CONVERT(VARCHAR(10),c.new_fECHADENACIMIENTO, 103), '/', '')) AS 'FECHA DE NACIMIENTO'
	 --,UPPER(c.new_RFC) AS 'RFC'
	 --,UPPER(case when c.cliente_aval = 'Cliente' then (case when b.User5 = 'M' then 'SR' WHEN B.USER5 = 'F' THEN 'SRA' end)
	 -- else '' end) AS 'PREFIJO PERSONAL O PROFESIONAL'
	 --,UPPER('') AS 'SUFIJO PERSONAL DEL CLIENTE'
	 --,UPPER((case when D.DESCR = 'MEXICO' then 'MX' else '' end)) as 'NACIONALIDAD'
	 --,UPPER(case when c.new_StatusdeVivienda = '7' then '1' 
		--	when c.new_StatusdeVivienda = '2' then '2'
		--	when c.new_StatusdeVivienda is not null then '3'
		--	when c.new_StatusdeVivienda is null then '' end ) AS 'TIPO DE RESIDENCIA'
		------ propia = 7
		------rentada= 1
		------Padres = 2
		------suegros =3
		------pagando = 4
		------familiares = 5
		------otros= 6
	 --,UPPER(case when c.new_Identificacion = '4' then c.new_foliodeidentificacion
		--	else '' end ) AS 'NUMERO DE LICENCIA DE CONDUCIR'
	 --,UPPER(case when c.new_estadocivil = '3' then 'D'
		--	 when c.new_estadocivil = '4' then 'F'
		--	 when c.new_estadocivil = '1' then 'M'
		--	 when c.new_estadocivil = '2' then 'S'
		--	 when c.new_estadocivil = '5' then 'W'
		--	ELSE '' end ) AS 'ESTADO CIVIL'
	 --,UPPER((case when c.new_sexo = '1' then 'M' WHEN c.new_sexo = '2' THEN 'F' 
		--	 ELSE '' end)) AS 'SEXO'
	 --,UPPER(case when c.new_Identificacion = '3' then c.new_foliodeidentificacion else '' end ) AS 'NUMERO DE CEDULA PROFESIONAL'
	 --,UPPER(case when c.new_Identificacion = '1' then c.new_foliodeidentificacion
		--	else '' end ) AS 'NUMERO DE REGISTRO ELECTORAL'
	 --,UPPER(case when c.new_curp is null then '' else c.new_curp end) AS 'CLAVE DE IDENTIFICACION UNICA'
	 --,UPPER((case when D.DESCR = 'MEXICO' then 'MX' else '' end)) as  'CLAVE DEL PAIS'
	 --,UPPER(case when C.new_dependienteseconomicos is null then '' else C.new_dependienteseconomicos end) AS 'NUMERO DE DEPENDIENTES'
	 --,UPPER('') AS 'EDADES DE LOS DEPENDIENTES'
	 --,UPPER('') AS 'FICHA DE DEFUNCION '
	 -- ,UPPER('') AS 'INDICADOR DE DEFUNCION'
	 -------------------------------------------------------------------------------------------------------------------------- SEGMENTO PA
	 -- ,UPPER(substring(rtrim(c.Domicilio),0,40)) AS 'PRIMER LINEA DE DIRECCION'
	 -- ,UPPER(substring(rtrim(c.Domicilio),40,len(rtrim(b.Domicilio)))) AS 'SEGUNDA LINEA DE DIRECCION'
	 -- ,UPPER(c.new_Colonia) AS 'COLONIA O  POBLACION'
	 -- --,UPPER(c.new_Ciudad) AS 'DELEGACION O MUNICIPIO'
	 -- --,UPPER(c.new_Ciudad) AS 'CIUDAD'
	 -- ,UPPER(case when b.state = 'D.F' then 'DF'
	 -- when b.state = 'EDO' then 'EM'
	 -- when b.state = 'MCH' then 'MICH'
	 -- when b.state = 'N.L' then 'NL'
	 -- when b.state = 'QUI' then 'QR'
	 -- when b.state = 'CDM' then 'DF'  
	 -- else B.STATE end) AS 'ESTADO'
	 -- ,UPPER(c.new_cptext) AS 'CODIGO POSTAL'
	 -- ,UPPER('') AS 'FECHA DE RESIDENCIA'
	 -- ,UPPER(c.new_telefonocasa) AS 'NUMERO DE TELEFONO'
	 -- ,UPPER('') AS 'EXTENSION TELEFONICA'
	 -- ,UPPER('') AS 'NUMERO DE FAX EN ESTA DIRECCION'
	 -- ,UPPER('') AS 'TIPO DE DOMICILIO'
	 -- ,UPPER('') AS 'INDICADOR ESPECIAL DE DOMICILIO'
	 ----  ---------------------------------------------------------------------------------------------------------------------- SEGMENTO PE
	 ----  ---------------------------------------------------------------------------------------------------------------------- SEGMENTO TL
	 --  ,UPPER('FF33890001') AS 'CLAVE DEL USUARIO O MEMBER CODE'
	 --  ,UPPER('CREDIJAL') AS 'NOMBRE DEL USUARIO'
	 --  ,UPPER(c.new_numcontrato) AS 'NUMERO DE CUENTA O CREDITO ACTUAL'
	 -- ,UPPER(case when c.cliente_aval = 'Cliente' then 'I' else 'C' end ) AS 'TIPO DE RESPONSABILIDAD DE LA CUENTA'
		------ AVALES TIPO C 
		------ TODOS LOS DEMAS SON I
		------ NOTA: SE VA HACER UNA UNION ALL CON LOS AVALES 
	 -- ,UPPER('I') AS 'TIPO DE CUENTA'
	 --  ,UPPER(case when c.new_numcontrato like '0%' then 'AU' 
		--		when c.new_numcontrato like 'AV%' then 'AL'
		--		when c.new_numcontrato like 'OE%' then 'LS'
		--		else 'AU'
		--	End) AS 'TIPO DE CONTRATO O PRODUCTO'
	 --  ,UPPER('MX') AS 'MONEDA DEL CREDITO'
	 --  ,UPPER('') AS 'IMPORTE DEL AVALUO'
	 --  ,UPPER(case when a.terms is null then '' else a.terms end) AS 'NUMERO DE PAGOS'
	 --  ,UPPER('M') AS 'FRECUENCIA DE PAGOS'
	 --  ,CONVERT(Integer,(case when f.OrigDocAmt is null then e.OrigDocAmt else f.OrigDocAmt end)) AS 'MONTO A PAGAR'
	 --  ,UPPER(case when REPLACE(CONVERT(VARCHAR(10),c.new_Fechadecontratacion, 103), '/', '') is null 
		--	then '01011900'
		--	else REPLACE(CONVERT(VARCHAR(10),c.new_Fechadecontratacion, 103), '/', '') end )  AS 'FECHA DE APERTURA DE CUENTA O CREDITO'
	 --  ,(select top 1 
		--		REPLACE(CONVERT(VARCHAR(10),Max(x.DateAppl), 103), '/', '')--,A.CUSTID,a.user5,a.periodo 
		--		from 
		--		xvr_xBuroUltimoPagoHecho x
		--		where x.user5 = a.NoContrato --AND 
		--		--x.PERIODO <= '200912'
		--		group by x.CUSTID,x.user5,x.periodo
		--		order by Max(x.DateAppl) desc
		--	) 
		--AS 'FECHA DE ULTIMO PAGO'
	 --  ,UPPER(case when REPLACE(CONVERT(VARCHAR(10),c.new_Fechadecontratacion, 103), '/', '') is null 
		--	then '01011900'
		--	else REPLACE(CONVERT(VARCHAR(10),c.new_Fechadecontratacion, 103), '/', '') end )  AS'FECHA DE ULTIMA COMPRA O DISPOSICION'
	 --  ,UPPER('') AS 'FECHA DE CIERRE'
	 --  ,REPLACE(CONVERT(VARCHAR(10),DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,x.RepEndDate)+1,0)), 103), '/', '') AS 'FECHA DE REPORTE DE INFORMACION'
	 --  ,UPPER('') AS 'GARANTIA'
	 --  ,CONVERT(Integer,(isnull(G.[TOTAL DEL PAGARE],0) + isnull(G.[SEGURO CONTADO],0) + isnull(G.[SEGURO CREDITO],0) + isnull(G.[COMISION POR APERTURA],0) 
	 --  + isnull(G.[GASTOS DE INVESTIGACION],0))) AS 'CREDITO MAXIMO AUTORIZADO'
	 --  ,CONVERT(Integer,(isnull(a.CurPerPost,0))) AS 'SALDO ACTUAL'
	 --  ,CONVERT(Integer,(ISNULL(G.[TOTAL DEL PAGARE],0) + ISNULL(G.[SEGURO CREDITO],0))) AS 'LIMITE DE CREDITO'
	 --  ,CONVERT(Integer,( A.Past00 + A.Past01 + A.Past02 + A.Over02)) AS 'SALDO VENCIDO'
	 --  --,UPPER('') AS 'NUMERO DE PAGOS VENCIDOS'
	 --  ,CASE WHEN H.DiasVencidosDocumento = 99999999 THEN '00' 
		--WHEN H.DiasVencidosDocumento = 0 THEN '01'
		--WHEN H.DiasVencidosDocumento > 0 and H.DiasVencidosDocumento <= 29 THEN '02'
		--WHEN H.DiasVencidosDocumento > 29 and H.DiasVencidosDocumento <= 59 THEN '03'
		--WHEN H.DiasVencidosDocumento > 59 and H.DiasVencidosDocumento <= 89 THEN '04'
		--WHEN H.DiasVencidosDocumento > 89 and H.DiasVencidosDocumento <= 119 THEN '05'
		--WHEN H.DiasVencidosDocumento > 119 and H.DiasVencidosDocumento <= 149 THEN '06'
		--WHEN H.DiasVencidosDocumento > 149 and H.DiasVencidosDocumento <= 365 THEN '07'
		--WHEN H.DiasVencidosDocumento > 365  THEN '96'
		--WHEN I.MOP is not null and i.perpost <= FORMAT(x.RepEndDate, 'yyyyMM')  THEN I.MOP
	 --  ELSE
	 --  CONVERT(varchar(10), H.DiasVencidosDocumento)
	 --  END AS 'FORMA DE PAGO ACTUAL'
	 ----  ,UPPER('') AS 'CLAVE DE OBSERVACION'
	 ----  ,UPPER('') AS 'CLAVE DEL USUARIO ANTERIOR'
	 ----  ,UPPER('') AS 'NOMBRE DEL USUARIO ANTERIOR'
	 ----  ,UPPER('') AS 'NUMERO DE CUENTA ANTERIOR'
	 -- ,case when j.Fecha is null THEN '01011900'
	 --  else 
	 --  UPPER(REPLACE(CONVERT(VARCHAR(10),j.Fecha, 103), '/', '')) end AS'FECHA DE PRIMER INCUMPLIMIENTO'
	 -- ,CONVERT(Integer,(isnull(K.CapitalInsoluto,0))) AS 'SALDO INSOLUTO DEL PRINCIPAL'
	 --,CONVERT(Integer,(ISNULL((select top 1 
		--		x.adjamt
		--		from 
		--		xvr_xBuroUltimoPagoHecho x
		--		where x.user5 = a.NoContrato --AND 
		--		--x.PERIODO <= '200912'
		--		group by x.CUSTID,x.user5,x.periodo,x.adjamt
		--		order by Max(x.DateAppl) desc),0))) AS 'MONTO DE ULTIMO PAGO'
	  from [xRptRuntime_Reportes] x ,
	  [xvr_xBurodeCredito08610] Agit 
	 INNER JOIN xSOAddress B ON A.CUSTID = B.CUSTID
	 INNER JOIN [xvr_xCustomerSL_Opportunity] C ON A.CustID = C.PKCustomerSL
	 AND A.NoContrato COLLATE DATABASE_DEFAULT  = C.new_numcontrato
	 INNER JOIN COUNTRY D ON b.COUNTRY = D.CountryID
	 LEFT OUTER JOIN [xvr_xBuroUltimoPago] E ON A.CustID = E.CUSTID
  				and a.NoContrato = e.contrato
	 left outer join [xvr_xBuroImportePagar] f ON A.CustID = f.CUSTID
  				and a.NoContrato = f.contrato
	 LEFT OUTER JOIN HERMES.CREDIJAL_MSCRM.dbo.[xCreditoMaximo] G ON c.PKOportunity = G.OpportunityId
				AND A.NoContrato COLLATE DATABASE_DEFAULT = G.NEW_NUMCONTRATO
	 LEFT OUTER JOIN xvr_xBuroVencidoFactura H ON a.custid = H.CUSTID
	 and A.NoContrato = H.NoContrato
	 LEFT OUTER JOIN xContratosconcastigo I ON A.CUSTID = I.CUSTID
	 AND A.NoContrato = I.CONTRATO
	 LEFT OUTER JOIN [xvr_xBuroPrimerVencida] J ON A.CUSTID = J.CUSTID AND A.NoContrato = J.NOCONTRATO
	 LEFT OUTER JOIN [xCapitalInsoluto_CRM] K   ON A.CustID = K.CUSTID AND A.NoContrato = K.NOCONTRATO

	 WHERE B.clave = '9'
	





GO


