drop database if exists crm_db;

create database crm_db
	with 
	owner postgres
	encoding 'utf8'
	lc_collate = 'ru_ru.utf-8'
	lc_ctype = 'ru_ru.utf-8'
	template = template0;

--
--
--

--таблица основных цветов
--
create table colors(
	color_id integer generated always as identity,
	color_position integer,
	color bigint not null,
	
	constraint pk_color_id primary key(color_id),
	constraint color_unique_key unique(color)
);


--справочник jboss устройств
-- generated always as identity (start with 1),
--
create table jboss_devices(
	jboss_device_id integer, 
	device_name varchar(64) not null,
	device_selected bool not null,
	
	constraint pk_jboss_device_id primary key(jboss_device_id),
	constraint device_name_key unique(device_name)
);


create table type_devices(
	type_device_id integer generated always as identity,
	type_device_name varchar(64) not null,
	device_position integer not null,
	price integer not null, 
	type_device_icon text,
	jboss_device_id int not null,
	
	constraint positive_price check (price >= 0),
	
	constraint pk_type_device_id primary key(type_device_id),
	constraint type_device_name_key unique(type_device_name),
	
	constraint device_position_key unique(device_position),
	
	constraint jboss_device_id_key unique(jboss_device_id),
	constraint fk_jboss_device_id foreign key(jboss_device_id) references jboss_devices(jboss_device_id)
);

alter table type_devices
drop constraint device_position_key;

	   
create table devices(
	device_id integer generated always as identity,
	availability bool not null, 
	type_device_id integer not null, 
	color_id integer, 
	
	constraint pk_device_id_id primary key(device_id),
	constraint type_device_id_color_id_key unique(type_device_id, color_id),
	
	constraint fk_devices_type_device_id foreign key(type_device_id) references type_devices(type_device_id),
	constraint fk_devices_color_id foreign key(color_id) references colors(color_id)
);


create or replace function update_type_device_position(old_position integer, new_position integer) 
	returns void as $$
	declare 
	id integer;
	begin
	id := (select type_device_id 
		  from type_devices
		  where device_position = old_position);	
		
	if old_position < new_position then
		--down
		update type_devices
		set device_position = (device_position - 1)
		where device_position <= new_position
		and device_position > old_position;
		
		update type_devices 
		set device_position = new_position
		where type_device_id = id;
    else
    	--up
    	update type_devices 
		set device_position = (device_position + 1)
		where device_position >= new_position
		and device_position < old_position;
		
		update type_devices 
		set device_position = new_position
		where type_device_id = id;
	end if;
end;
$$ language plpgsql;


create or replace function detele_color(id integer) 
	returns void as $$
	begin
		update colors
		set color_position  = (color_position - 1)
		where color_position > (select color_position 
								from colors
								where colors.color_id = id);

		delete 
		from colors
		where colors.color_id = id;	
	end;
$$ language plpgsql;


create or replace function create_new_device(v_type_device_name varchar, v_jboss_device_id integer, v_price integer, v_type_device_icon text, v_colors_id integer array ) 
	returns void as $$
	declare 
		v_color_id integer;
	begin
		insert into type_devices(type_device_name, device_position, jboss_device_id, price, type_device_icon)
		values (v_type_device_name, (select count(device_position)
								   from type_devices), 
								   v_jboss_device_id, v_price, v_type_device_icon);
		
		if array_length(v_colors_id, 1) is null then 
			raise notice '----';
			insert into devices(type_device_id, color_id, availability)
			values ((select type_device_id from type_devices where v_jboss_device_id = type_devices.jboss_device_id), null, true);
		else 
			foreach v_color_id in array v_colors_id 
			loop
				insert into devices(type_device_id, color_id, availability)
				values ((select type_device_id from type_devices where v_jboss_device_id = type_devices.jboss_device_id), v_color_id, true);
  			end loop;
		end if;

	
		update jboss_devices
		SET device_selected = true 
		where v_jboss_device_id = jboss_device_id;
	
	end;
$$ language plpgsql;


--
--
--
--	  
--
insert into jboss_devices 
values (1,'Mifare', false), 
	   (5, 'Транспортная карта', false),
	   (6, 'Банковская карта', false),
	   (7, 'Соц. карта учащегося', false),
	   (8, 'Соц. карта москвича', false),
	   (9, 'Браслет (Mifare)', false),
	   (10, 'Часы (Mifare)', false),
	   (11, 'Брелок (Mifare)', false),
	   (12, 'Тройка-москвёнок карта', false),
	   (13, 'Тройка-москвёнок браслет', false),
	   (14, 'Тройка-москвёнок брелок', false), 
	   (15, 'Фитнес-браслет', false),
	   (16, 'Смарт-кольцо', false);


--
--
insert into colors(color_position, color) 
values (0, 1137534976),
	   (1, 1125046286),
	   (2, 1132924632),
	   (3, 1132924333);



	  

insert into type_devices(type_device_name, device_position, jboss_device_id, price)
values ('карта', 0, 1, 600),
	   ('браслет', 1, 9, 1300),
	   ('брелок', 2, 11, 1300);
	   --('устройство 1', 3, 5, 700),
	   --('устройство 88', 4, 6, 800),
	   --('устройство 6', 5, 7, 300);

insert into devices(type_device_id, color_id, availability)
values (1, null, true),
	   (2, 1, true),
	   (2, 3, true),
	   (3, null, true);
	  

insert into colors (color_position, color)
values (
	   (select count(color_position)
		from colors
	   ), 4270190092);
	  
	  
--	  
--
--
--
--
	  
	  
select devices.device_id, availability, type_device_name, jboss_devices.jboss_device_id, color
from devices 
join type_devices on type_devices.type_device_id = devices.type_device_id
join jboss_devices on jboss_devices.jboss_device_id = type_devices.jboss_device_id
left join colors on colors.color_id = devices.color_id;

select * 
from type_devices;

--получить цвета
select devices.device_id, colors.color 
from devices
join colors on colors.color_id = devices.color_id
where type_device_id = 2 and availability = true
order by color_position;


--получить конечный id устройства
select devices.device_id
from devices
where type_device_id = 2;


--список устройств в настройках
select type_device_id, device_position, type_device_name, device_name, price, type_device_icon
from type_devices
join jboss_devices on type_devices.jboss_device_id = jboss_devices.jboss_device_id
order by device_position;


--список доступных jboss устройств
select jboss_device_id, device_name, device_selected
from jboss_devices
where device_selected = false 
order by jboss_device_id;


select 
from update_type_device_position(0, 2);


select type_devices.type_device_id, type_device_name, type_device_icon 
from ( 
	   select  
	   distinct type_device_id
	   from devices
	   where availability = true
	 ) 
	 as d
join type_devices on type_devices.type_device_id = d.type_device_id
order by device_position;


--взаимодействие с цветами(colors)
select color_id, color
from colors 
order by color_position;


select 
from create_new_device('Карта--', 11, 950, '<svg height="150" width="480"><path d="m0 35.5l6.5-13 9.5 14.5 7-13 11.8 19.7 7.7-13.7 7.8 17 9.4-19.3 9.3 19.3 16-29.3 13.3 21.3 14.7-29.3 14.7 32.6 8.6-18.6 10.7 20.6 11.3-24 12 20 7.4-14.6 12 17.3 10-22 8 14 11.3-24 14 26 7.3-13.3 10.7 19.3 12-24.7 9.7 15 10.3-23.3 12 22.3 6.3-9.3 10.4 14 12-29.3 15.6 31.3 7-13.3 10 16.6 13.4-27.3 6.6 10.7 7.7-16.7 9 19.3 7.3-9.3 11.4 19.3 9.3-17.3 13.3 22 10.7-18 8 11.3 11.3-18 11.9 22 3.8-6.8v181.5h-480v-179.5z" fill="#175720"/></svg>
');

select 
from create_new_device('Карта++---', 9, 888, null, '{ }');
