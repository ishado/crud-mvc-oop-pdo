CREATE DATABASE IF NOT EXISTS `crud-mvc-oop-pdo`;

USE `crud-mvc-oop-pdo`;

/*
+-----------------+--------------+------+-----+-------------------+-----------------------------+
| Field           | Type         | Null | Key | Default           | Extra                       |
+-----------------+--------------+------+-----+-------------------+-----------------------------+
| user_id         | INT(11)      | NO   | PRI | NULL              | AUTO_INCREMENT              |
| user_registered | DATETIME     | NO   |     | CURRENT_TIMESTAMP |                             |
| user_updated    | DATETIME     | NO   |     | CURRENT_TIMESTAMP | ON UPDATE CURRENT_TIMESTAMP |
| user_name       | VARCHAR(255) | NO   |     | NULL              |                             |
| user_email      | VARCHAR(255) | NO   |     | NULL              |                             |
| user_country    | INT(4)       | NO   |     | NULL              |                             |
+-----------------+--------------+------+-----+-------------------+-----------------------------+
*/
CREATE TABLE IF NOT EXISTS `users` (
	`user_id`         INT(11)      NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`user_registered` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`user_updated`    DATETIME     NOT NULL ON UPDATE CURRENT_TIMESTAMP,
	`user_name`       VARCHAR(255) NOT NULL,
	`user_email`      VARCHAR(255) NOT NULL,
	`user_country`    INT(4)       NOT NULL
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

/* Example */
INSERT INTO `users` (`user_name`, `user_email`, `user_country`) VALUES ('Anonymous',  'mabuhay@anon.me', 16);
INSERT INTO `users` (`user_name`, `user_email`, `user_country`) VALUES ('John Smith', 'yo@smith.io',     64);
INSERT INTO `users` (`user_name`, `user_email`, `user_country`) VALUES ('Alice',      'howdy@alice.xyz', 8);
INSERT INTO `users` (`user_name`, `user_email`, `user_country`) VALUES ('Bob',        'aloha@bob.com',   128);
INSERT INTO `users` (`user_name`, `user_email`, `user_country`) VALUES ('John Doe',   'hi@john.doe',     32);

/*
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| country_id   | INT(4)       | NO   | PRI | NULL    | AUTO_INCREMENT |
| country_code | VARCHAR(2)   | NO   |     | NULL    |                |
| country_name | VARCHAR(255) | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
*/
CREATE TABLE IF NOT EXISTS `countries` (
	`country_id`   INT(4)       NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`country_code` VARCHAR(2)   NOT NULL,
	`country_name` VARCHAR(255) NOT NULL
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('AF', 'Afghanistan');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('AL', 'Albania');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('DZ', 'Algeria');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('DS', 'American Samoa');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('AD', 'Andorra');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('AO', 'Angola');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('AI', 'Anguilla');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('AQ', 'Antarctica');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('AG', 'Antigua and Barbuda');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('AR', 'Argentina');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('AM', 'Armenia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('AW', 'Aruba');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('AU', 'Australia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('AT', 'Austria');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('AZ', 'Azerbaijan');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BS', 'Bahamas');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BH', 'Bahrain');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BD', 'Bangladesh');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BB', 'Barbados');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BY', 'Belarus');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BE', 'Belgium');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BZ', 'Belize');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BJ', 'Benin');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BM', 'Bermuda');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BT', 'Bhutan');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BO', 'Bolivia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BA', 'Bosnia and Herzegovina');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BW', 'Botswana');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BV', 'Bouvet Island');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BR', 'Brazil');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('IO', 'British Indian Ocean Territory');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BN', 'Brunei Darussalam');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BG', 'Bulgaria');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BF', 'Burkina Faso');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('BI', 'Burundi');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('KH', 'Cambodia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('CM', 'Cameroon');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('CA', 'Canada');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('CV', 'Cape Verde');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('KY', 'Cayman Islands');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('CF', 'Central African Republic');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('TD', 'Chad');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('CL', 'Chile');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('CN', 'China');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('CX', 'Christmas Island');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('CC', 'Cocos (Keeling) Islands');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('CO', 'Colombia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('KM', 'Comoros');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('CG', 'Congo');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('CK', 'Cook Islands');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('CR', 'Costa Rica');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('HR', 'Croatia (Hrvatska)');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('CU', 'Cuba');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('CY', 'Cyprus');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('CZ', 'Czech Republic');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('DK', 'Denmark');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('DJ', 'Djibouti');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('DM', 'Dominica');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('DO', 'Dominican Republic');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('TP', 'East Timor');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('EC', 'Ecuador');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('EG', 'Egypt');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SV', 'El Salvador');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GQ', 'Equatorial Guinea');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('ER', 'Eritrea');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('EE', 'Estonia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('ET', 'Ethiopia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('FK', 'Falkland Islands (Malvinas)');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('FO', 'Faroe Islands');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('FJ', 'Fiji');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('FI', 'Finland');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('FR', 'France');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('FX', 'France, Metropolitan');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GF', 'French Guiana');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('PF', 'French Polynesia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('TF', 'French Southern Territories');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GA', 'Gabon');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GM', 'Gambia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GE', 'Georgia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('DE', 'Germany');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GH', 'Ghana');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GI', 'Gibraltar');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GK', 'Guernsey');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GR', 'Greece');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GL', 'Greenland');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GD', 'Grenada');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GP', 'Guadeloupe');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GU', 'Guam');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GT', 'Guatemala');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GN', 'Guinea');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GW', 'Guinea-Bissau');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GY', 'Guyana');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('HT', 'Haiti');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('HM', 'Heard and Mc Donald Islands');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('HN', 'Honduras');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('HK', 'Hong Kong');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('HU', 'Hungary');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('IS', 'Iceland');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('IN', 'India');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('IM', 'Isle of Man');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('ID', 'Indonesia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('IR', 'Iran (Islamic Republic of)');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('IQ', 'Iraq');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('IE', 'Ireland');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('IL', 'Israel');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('IT', 'Italy');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('CI', 'Ivory Coast');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('JE', 'Jersey');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('JM', 'Jamaica');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('JP', 'Japan');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('JO', 'Jordan');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('KZ', 'Kazakhstan');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('KE', 'Kenya');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('KI', 'Kiribati');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('KP', 'Korea, Democratic People''s Republic of');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('KR', 'Korea, Republic of');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('XK', 'Kosovo');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('KW', 'Kuwait');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('KG', 'Kyrgyzstan');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('LA', 'Lao People''s Democratic Republic');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('LV', 'Latvia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('LB', 'Lebanon');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('LS', 'Lesotho');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('LR', 'Liberia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('LY', 'Libyan Arab Jamahiriya');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('LI', 'Liechtenstein');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('LT', 'Lithuania');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('LU', 'Luxembourg');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MO', 'Macau');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MK', 'Macedonia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MG', 'Madagascar');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MW', 'Malawi');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MY', 'Malaysia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MV', 'Maldives');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('ML', 'Mali');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MT', 'Malta');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MH', 'Marshall Islands');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MQ', 'Martinique');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MR', 'Mauritania');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MU', 'Mauritius');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('TY', 'Mayotte');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MX', 'Mexico');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('FM', 'Micronesia, Federated States of');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MD', 'Moldova, Republic of');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MC', 'Monaco');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MN', 'Mongolia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('ME', 'Montenegro');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MS', 'Montserrat');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MA', 'Morocco');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MZ', 'Mozambique');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MM', 'Myanmar');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('NA', 'Namibia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('NR', 'Nauru');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('NP', 'Nepal');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('NL', 'Netherlands');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('AN', 'Netherlands Antilles');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('NC', 'New Caledonia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('NZ', 'New Zealand');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('NI', 'Nicaragua');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('NE', 'Niger');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('NG', 'Nigeria');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('NU', 'Niue');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('NF', 'Norfolk Island');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('MP', 'Northern Mariana Islands');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('NO', 'Norway');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('OM', 'Oman');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('PK', 'Pakistan');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('PW', 'Palau');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('PS', 'Palestine');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('PA', 'Panama');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('PG', 'Papua New Guinea');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('PY', 'Paraguay');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('PE', 'Peru');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('PH', 'Philippines');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('PN', 'Pitcairn');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('PL', 'Poland');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('PT', 'Portugal');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('PR', 'Puerto Rico');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('QA', 'Qatar');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('RE', 'Reunion');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('RO', 'Romania');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('RU', 'Russian Federation');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('RW', 'Rwanda');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('KN', 'Saint Kitts and Nevis');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('LC', 'Saint Lucia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('VC', 'Saint Vincent and the Grenadines');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('WS', 'Samoa');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SM', 'San Marino');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('ST', 'Sao Tome and Principe');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SA', 'Saudi Arabia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SN', 'Senegal');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('RS', 'Serbia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SC', 'Seychelles');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SL', 'Sierra Leone');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SG', 'Singapore');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SK', 'Slovakia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SI', 'Slovenia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SB', 'Solomon Islands');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SO', 'Somalia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('ZA', 'South Africa');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GS', 'South Georgia South Sandwich Islands');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SS', 'South Sudan');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('ES', 'Spain');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('LK', 'Sri Lanka');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SH', 'St. Helena');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('PM', 'St. Pierre and Miquelon');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SD', 'Sudan');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SR', 'Suriname');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SJ', 'Svalbard and Jan Mayen Islands');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SZ', 'Swaziland');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SE', 'Sweden');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('CH', 'Switzerland');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('SY', 'Syrian Arab Republic');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('TW', 'Taiwan');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('TJ', 'Tajikistan');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('TZ', 'Tanzania, United Republic of');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('TH', 'Thailand');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('TG', 'Togo');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('TK', 'Tokelau');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('TO', 'Tonga');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('TT', 'Trinidad and Tobago');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('TN', 'Tunisia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('TR', 'Turkey');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('TM', 'Turkmenistan');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('TC', 'Turks and Caicos Islands');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('TV', 'Tuvalu');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('UG', 'Uganda');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('UA', 'Ukraine');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('AE', 'United Arab Emirates');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('GB', 'United Kingdom');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('US', 'United States');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('UM', 'United States minor outlying islands');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('UY', 'Uruguay');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('UZ', 'Uzbekistan');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('VU', 'Vanuatu');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('VA', 'Vatican City State');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('VE', 'Venezuela');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('VN', 'Vietnam');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('VG', 'Virgin Islands (British)');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('VI', 'Virgin Islands (U.S.)');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('WF', 'Wallis and Futuna Islands');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('EH', 'Western Sahara');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('YE', 'Yemen');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('ZR', 'Zaire');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('ZM', 'Zambia');
INSERT INTO `countries` (`country_code`, `country_name`) VALUES ('ZW', 'Zimbabwe');
