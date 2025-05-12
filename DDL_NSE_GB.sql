create table sucursal{
  sucursal_id number(10,0) constraint sucursal_pk primary key,
  anio number(4,0)
};

DML, DDL, DQL,


create table empleado(
    empleado_id number(10,0),
    empleado_director_id,
    nombre varchar2(40) not null,
    ap_pat varchar2(40) not null,
    ap_mat varchar2(40) null,
    fecha_contracion date not null,
    antiguedad generated always as trunc(sysdate-fecha_contracion),
    constraint empleado_pk primary key(empleado_id),
    constraint empleado_empleado_director_id_fk foreign key (empleado_director_id) 
        references empleado(empleado_id)
);



create table auditor(
    auditor_id number(10,0),
    nombre varchar2(40) not null,
    ap_pat varchar2(40) not null,
    ap_mat varchar2(40) null,
    cedula varchar2(8) not null,
    constraint auditor_pk primary key(auditor_id),
    constraint auditor_cedula_uk unique(cedula),
    constraint auditor_cedula_chk check (
        length(cedula) between 7 and 8
    )
);

create table cliente(
    cliente_id number(10,0),
    auditor_id number(10,0),
    nombre varchar2(40) not null,
    ap_pat varchar2(40) not null,
    ap_mat varchar2(40) null,
    sucursal_id,
    constraint cliente_pk primary key(cliente_id),
    constraint cliente_sucursal_id_fk foreign key(sucursal_id) 
        references sucursal(sucursal_id)
);
