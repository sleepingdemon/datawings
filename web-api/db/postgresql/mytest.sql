-- Item
CREATE TABLE item
(
	id varchar(64) NOT NULL,
	part_number varchar(128) NOT NULL UNIQUE
	PRIMARY KEY (id)
) WITHOUT OIDS;

-- 零部件
CREATE TABLE item_revision
(
	id varchar(64) NOT NULL,
	item varchar(64) NOT NULL,
	revision_id varchar(128) NOT NULL,
	version varchar(64) NOT NULL,
	name varchar(512) NOT NULL,
	description varchar(2048),
	unit_of_measure varchar(64),
	owning_user varchar(64),
	owning_group varchar(64),
	release_date timestamp,
	
	status char(1) DEFAULT '0' NOT NULL,
	create_by varchar(64) NOT NULL,
	create_date timestamp NOT NULL,
	update_by varchar(64) NOT NULL,
	update_date timestamp NOT NULL,
	remarks varchar(512),
	PRIMARY KEY (id)
) WITHOUT OIDS;

-- 文件
CREATE TABLE file_data
(
	id varchar(64) NOT NULL,
	version varchar(64) NOT NULL,
	name varchar(512) NOT NULL,
	file_extension varchar(64),
	status char(1) DEFAULT '0' NOT NULL,
	create_by varchar(64) NOT NULL,
	create_date timestamp NOT NULL,
	update_by varchar(64) NOT NULL,
	update_date timestamp NOT NULL,
	remarks varchar(512),
	PRIMARY KEY (id)
) WITHOUT OIDS;

-- 零部件文件关联表
CREATE TABLE item_revision_file_data
(
	item_revision_id varchar(64) NOT NULL,
	file_data_id varchar(64) NOT NULL,
	PRIMARY KEY (item_revision_id, file_data_id)
) WITHOUT OIDS;

-- BOMLine
CREATE TABLE bom_line
(
	id varchar(64) NOT NULL,
	childItem varchar(64) NOT NULL,
	quantity DECIMAL(19,4),
	unit_of_measure varchar(64),
	status char(1) DEFAULT '0' NOT NULL,
	create_by varchar(64) NOT NULL,
	create_date timestamp NOT NULL,
	update_by varchar(64) NOT NULL,
	update_date timestamp NOT NULL,
	remarks varchar(512),
	PRIMARY KEY (id)
) WITHOUT OIDS;

-- 零部件BOMLine关联表
CREATE TABLE item_revision_bom_line
(
	item_revision_id varchar(64) NOT NULL,
	bom_line_id varchar(64) NOT NULL,
	PRIMARY KEY (item_revision_id, bom_line_id)
) WITHOUT OIDS;

/* Comments */

COMMENT ON TABLE item IS 'Item';
COMMENT ON COLUMN item.id IS '编号';
COMMENT ON COLUMN item.part_number IS '零部件编号';

COMMENT ON TABLE item_revision IS '零部件';
COMMENT ON COLUMN item_revision.id IS '编号';
COMMENT ON COLUMN item_revision.item IS 'Item';
COMMENT ON COLUMN item_revision.revision_id IS '版本号';
COMMENT ON COLUMN item_revision.version IS '小版本号';
COMMENT ON COLUMN item_revision.name IS '名称';
COMMENT ON COLUMN item_revision.description IS '描述';
COMMENT ON COLUMN item_revision.unit_of_measure IS '单位';
COMMENT ON COLUMN item_revision.owning_user IS '所有者';
COMMENT ON COLUMN item_revision.owning_group IS '所属组';
COMMENT ON COLUMN item_revision.release_date IS '发布日期';
COMMENT ON COLUMN item_revision.status IS '状态（0正常 1删除 2停用）';
COMMENT ON COLUMN item_revision.create_by IS '创建者';
COMMENT ON COLUMN item_revision.create_date IS '创建时间';
COMMENT ON COLUMN item_revision.update_by IS '更新者';
COMMENT ON COLUMN item_revision.update_date IS '更新时间';
COMMENT ON COLUMN item_revision.remarks IS '备注信息';

COMMENT ON TABLE file_data IS '文件';
COMMENT ON COLUMN file_data.id IS '编号';
COMMENT ON COLUMN file_data.version IS '小版本号';
COMMENT ON COLUMN file_data.name IS '名称';
COMMENT ON COLUMN file_data.file_extension IS '文件名后缀';
COMMENT ON COLUMN file_data.status IS '状态（0正常 1删除 2停用）';
COMMENT ON COLUMN file_data.create_by IS '创建者';
COMMENT ON COLUMN file_data.create_date IS '创建时间';
COMMENT ON COLUMN file_data.update_by IS '更新者';
COMMENT ON COLUMN file_data.update_date IS '更新时间';
COMMENT ON COLUMN file_data.remarks IS '备注信息';

COMMENT ON TABLE item_revision_file_data IS '零部件文件关联表';
COMMENT ON COLUMN item_revision_file_data.item_revision_id IS '零部件编号';
COMMENT ON COLUMN item_revision_file_data.file_data_id IS '文件编号';

COMMENT ON TABLE bom_line IS 'BOMLine';
COMMENT ON COLUMN bom_line.id IS 'BOMLine编号';
COMMENT ON COLUMN bom_line.childItem IS '子件零部件号';

COMMENT ON TABLE item_revision_bom_line IS '零部件BOMLine关联表';
COMMENT ON COLUMN item_revision_bom_line.item_revision_id IS '零部件编号';
COMMENT ON COLUMN item_revision_bom_line.bom_line_id IS 'BOMLine编号';

GRANT SELECT, INSERT, UPDATE, DELETE ON item TO jeesite;
GRANT SELECT, INSERT, UPDATE, DELETE ON item_revision TO jeesite;
GRANT SELECT, INSERT, UPDATE, DELETE ON file_data TO jeesite;
GRANT SELECT, INSERT, UPDATE, DELETE ON item_revision_file_data TO jeesite;
GRANT SELECT, INSERT, UPDATE, DELETE ON bom_line TO jeesite;
GRANT SELECT, INSERT, UPDATE, DELETE ON item_revision_bom_line TO jeesite;
