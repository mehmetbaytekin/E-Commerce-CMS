USE [proje]
GO
/****** Object:  Table [dbo].[Uyeler]    Script Date: 10/03/2018 20:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uyeler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Sifre] [nvarchar](50) NULL,
	[Ad] [nvarchar](50) NULL,
	[Soyad] [nvarchar](50) NULL,
	[Cinsiyet] [bit] NULL,
	[DogumTarihi] [date] NULL,
	[Adres] [nvarchar](50) NULL,
	[Telefon] [nvarchar](50) NULL,
 CONSTRAINT [PK_Uyeler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunKategorileri]    Script Date: 10/03/2018 20:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunKategorileri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_UrunKategorileri] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunDetaylari]    Script Date: 10/03/2018 20:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunDetaylari](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UrunID] [int] NULL,
	[UrunDetayID] [int] NULL,
	[Detay] [nvarchar](50) NULL,
 CONSTRAINT [PK_UrunDetaylari] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparislerim]    Script Date: 10/03/2018 20:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparislerim](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UrunID] [int] NULL,
	[UyeID] [int] NULL,
	[Tarih] [datetime] NULL,
	[SiparisDurumu] [int] NULL,
	[Tutar] [float] NULL,
	[KargoFirmai] [int] NULL,
	[KargoTutari] [float] NULL,
	[ToplamTutar] [float] NULL,
 CONSTRAINT [PK_Siparislerim] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiparisDurumlari]    Script Date: 10/03/2018 20:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiparisDurumlari](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SiparisDurumu] [nvarchar](50) NULL,
 CONSTRAINT [PK_SiparisDurumlari] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 10/03/2018 20:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[sifre] [nvarchar](50) NULL,
	[Ad] [nvarchar](50) NULL,
	[Soyad] [nvarchar](50) NULL,
	[Yetki] [int] NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KampanyaBanner]    Script Date: 10/03/2018 20:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KampanyaBanner](
	[bannerID] [int] IDENTITY(1,1) NOT NULL,
	[bannerResim] [nvarchar](200) NULL,
	[bannerAciklama] [nvarchar](300) NULL,
	[bannerTarih] [date] NULL,
	[aktiflik] [bit] NULL,
 CONSTRAINT [PK_KampanyaBanner] PRIMARY KEY CLUSTERED 
(
	[bannerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetayTanimlari]    Script Date: 10/03/2018 20:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetayTanimlari](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriID] [int] NULL,
	[DetayAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_DetayTanimlari] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunResimleri]    Script Date: 10/03/2018 20:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunResimleri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UrunID] [int] NULL,
	[Resim] [nvarchar](100) NULL,
	[Vitrin] [bit] NULL,
 CONSTRAINT [PK_UrunResimleri] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 10/03/2018 20:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UrunAdi] [nvarchar](50) NULL,
	[UrunKategorisi] [int] NULL,
	[UrunMarkasi] [nvarchar](50) NULL,
	[UrunFiyati] [float] NULL,
	[IndirimOrani] [float] NULL,
	[UrunOrijinalFiyati] [float] NULL,
	[StokMiktari] [float] NULL,
	[UrunAciklamasi] [ntext] NULL,
	[DegerlendirmePuani] [float] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[Olusturan] [int] NULL,
	[DegisiklikTarihi] [datetime] NULL,
	[Degistiren] [int] NULL,
	[Aktif] [bit] NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiparisDetay]    Script Date: 10/03/2018 20:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiparisDetay](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SiparisID] [int] NULL,
	[UrunID] [int] NULL,
	[Miktar] [float] NULL,
	[Fiyat] [float] NULL,
 CONSTRAINT [PK_SiparisDetay] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunYorumlari]    Script Date: 10/03/2018 20:25:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunYorumlari](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UrunID] [int] NULL,
	[Tarih] [datetime] NULL,
	[UyeID] [int] NULL,
	[Yorum] [nvarchar](500) NULL,
	[YorumDurum] [int] NULL,
 CONSTRAINT [PK_UrunYorumlari] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_Urunler_OlusturmaTarihi]    Script Date: 10/03/2018 20:25:53 ******/
ALTER TABLE [dbo].[Urunler] ADD  CONSTRAINT [DF_Urunler_OlusturmaTarihi]  DEFAULT (getdate()) FOR [OlusturmaTarihi]
GO
/****** Object:  Default [DF_Urunler_Aktif]    Script Date: 10/03/2018 20:25:53 ******/
ALTER TABLE [dbo].[Urunler] ADD  CONSTRAINT [DF_Urunler_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
/****** Object:  ForeignKey [FK_SiparisDetay_Siparislerim]    Script Date: 10/03/2018 20:25:53 ******/
ALTER TABLE [dbo].[SiparisDetay]  WITH CHECK ADD  CONSTRAINT [FK_SiparisDetay_Siparislerim] FOREIGN KEY([SiparisID])
REFERENCES [dbo].[Siparislerim] ([ID])
GO
ALTER TABLE [dbo].[SiparisDetay] CHECK CONSTRAINT [FK_SiparisDetay_Siparislerim]
GO
/****** Object:  ForeignKey [FK_Urunler_UrunKategorileri]    Script Date: 10/03/2018 20:25:53 ******/
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_UrunKategorileri] FOREIGN KEY([UrunKategorisi])
REFERENCES [dbo].[UrunKategorileri] ([ID])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_UrunKategorileri]
GO
/****** Object:  ForeignKey [FK_UrunYorumlari_Urunler]    Script Date: 10/03/2018 20:25:53 ******/
ALTER TABLE [dbo].[UrunYorumlari]  WITH CHECK ADD  CONSTRAINT [FK_UrunYorumlari_Urunler] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urunler] ([ID])
GO
ALTER TABLE [dbo].[UrunYorumlari] CHECK CONSTRAINT [FK_UrunYorumlari_Urunler]
GO
