SET FOREIGN_KEY_CHECKS = 0;
drop table if exists Patients;
SET FOREIGN_KEY_CHECKS = 1;

create table if not exists Patients (
	PatientID varchar(50),
	primary key (PatientID)
);

SET FOREIGN_KEY_CHECKS = 0;
drop table if exists Songs;
SET FOREIGN_KEY_CHECKS = 1;

create table if not exists Songs (
	URI varchar(50),
	Acousticness float(5),
	AnalysisURL varchar(100),
	Danceability float(5),
	DurationMS int(10),
	Energy float(5),
	SongID varchar(50),
	Instrumentalness float(5),
	SongKey int(1),
	Liveness float(5),
	Loudness float(5),
	SongMode int(1),
	Speechiness float(5),
	Tempo float(5),
	TimeSignature int(5),
	TrackHref varchar(100),
	Valence float(5),
	Progressions varchar(50),
	primary key (URI)
);

SET FOREIGN_KEY_CHECKS = 0;
drop table if exists Sessions;
SET FOREIGN_KEY_CHECKS = 1;

create table if not exists Sessions (
	SessionID char(36),
	PatientID varchar(50),
	SongURI varchar(50),
	BreakMED varchar(50),
	SessionDURATION	datetime,
	primary key (sessionID),
	FOREIGN KEY (PatientID)
		REFERENCES Patients (PatientID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (SongURI)
		REFERENCES Songs (URI)
		ON UPDATE CASCADE ON DELETE CASCADE
);

SET FOREIGN_KEY_CHECKS = 0;
drop table if exists PainLog;
SET FOREIGN_KEY_CHECKS = 1;

create table if not exists PainLog (
	SessionID char(36),
	SessionTime datetime,
	PainLVL int(2),
	FOREIGN KEY (SessionID) 
		REFERENCES Sessions (SessionID)
		ON UPDATE CASCADE ON DELETE CASCADE
);










