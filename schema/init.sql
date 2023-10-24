CREATE TABLE data_positions(
    data_position_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    speed DECIMAL(8,4),
    altitude DECIMAL(16,6)
);

CREATE TABLE data_groupings(
    data_grouping_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)
);

CREATE TABLE data_messages(
    data_message_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_grouping_id INT,
    datetime_received DATETIME,
    sender_id INT,
    recipient_id INT,
    data_position_id INT,
    message_contents TEXT,
    original_message TEXT
);

ALTER TABLE data_messages ADD INDEX(data_grouping_id, sender_id);
ALTER TABLE data_messages ADD INDEX(data_grouping_id, recipient_id);

INSERT INTO data_groupings(data_grouping_id, name) VALUES(1, 'APRS');

create table data_parties(data_party_id int not null primary key auto_increment, data_group_id int, identifier VARCHAR(255));
alter table data_parties add index(data_group_id, identifier);
