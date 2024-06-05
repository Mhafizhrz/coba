/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     05/06/2024 16:46:09                          */
/*==============================================================*/


drop table if exists DOSEN;

drop table if exists MAHASISWA;

drop table if exists MATKUL;

drop table if exists MENGAMBIL;

drop table if exists PRODI;

/*==============================================================*/
/* Table: DOSEN                                                 */
/*==============================================================*/
create table DOSEN
(
   NIDN                 int not null,
   ID_PRODI             int,
   NAMA_DOSEN           char(30),
   ALAMAT               text,
   JABATAN              char(20),
   primary key (NIDN)
);

/*==============================================================*/
/* Table: MAHASISWA                                             */
/*==============================================================*/
create table MAHASISWA
(
   NPM                  int not null,
   NAMA_MHS             char(30),
   JK                   char(20),
   ALAMAT_MHS           text,
   TELP                 char(15),
   primary key (NPM)
);

/*==============================================================*/
/* Table: MATKUL                                                */
/*==============================================================*/
create table MATKUL
(
   ID_MATKUL            int not null,
   NIDN                 int,
   NAMA_MATKUL          char(30),
   SKS                  char(3),
   primary key (ID_MATKUL)
);

/*==============================================================*/
/* Table: MENGAMBIL                                             */
/*==============================================================*/
create table MENGAMBIL
(
   ID_MATKUL            int not null,
   NPM                  int not null,
   RUANGAN              char(10),
   WAKTU                datetime,
   primary key (ID_MATKUL, NPM)
);

/*==============================================================*/
/* Table: PRODI                                                 */
/*==============================================================*/
create table PRODI
(
   ID_PRODI             int not null,
   NIDN                 int,
   NAMA_PRODI           char(30),
   primary key (ID_PRODI)
);

alter table DOSEN add constraint FK_MENGEPALAI foreign key (ID_PRODI)
      references PRODI (ID_PRODI) on delete restrict on update restrict;

alter table MATKUL add constraint FK_MENGAJAR foreign key (NIDN)
      references DOSEN (NIDN) on delete restrict on update restrict;

alter table MENGAMBIL add constraint FK_MENGAMBIL foreign key (ID_MATKUL)
      references MATKUL (ID_MATKUL) on delete restrict on update restrict;

alter table MENGAMBIL add constraint FK_MENGAMBIL2 foreign key (NPM)
      references MAHASISWA (NPM) on delete restrict on update restrict;

alter table PRODI add constraint FK_MENGEPALAI2 foreign key (NIDN)
      references DOSEN (NIDN) on delete restrict on update restrict;

