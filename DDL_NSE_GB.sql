--empleado
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


----Para ubicacion ---
create table estado(
    estado_id number(10,0),
    nombre varchar2(40) not null,
    constraint estado_pk primary key(estado_id)
);

create table delegacion(
    delegacion_id number(10,0),
    nombre varchar2(40),
    calle varchar2(40),
    lote number(3,0),
    cp number(5,0),
    estado_id,
    constraint delegacion_pk primary key(delegacion_id),
    constraint delegacion_estado_id_fk foreign key(estado_id)
        references estado(estado_id)
);

-----sucursal----

create table sucursal{
  sucursal_id number(10,0) constraint sucursal_pk primary key,
  anio number(4,0) not null,
  delegacion_id,
  empleado_director_id,
  constraint sucursal_empleado_director_id_fk foreign key(empleado_director_id)
    references references empleado(empleado_director_id)
};

----cliente-------

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



----------servicios -------------
create table servicio(
    servicio_id number(10,0),
    tipo_servicio number(1,0) not null,
    cliente_id,
    sucursal_id,
    constraint servicio_pk primary key(servicio_id),
    constraint servicio_cliente_id_fk foreign key(cliente_id)
        references cliente(cliente_id),
    constraint servicio_sucursal_id_fk foreign key(sucursal_id)
        references sucursal(sucursal_id)
);

---servicio prestamo --

create table prestamo(
    servicio_id,    
    es_inicial bit not null,
    monto number(8.2) not null ,
    plazo number(2,0) not null,
    fecha date not null,
    constraint prestamo_pk primary key(servicio_id),
    constraint prestamos_servicio_id_fk foreign key(servicio_id)
        references servicio(servicio_id)
);

create table pago_prestamo(
    servicio_id,
    num_pago number(10,0),
    monto number(6,0),
    constraint pago_prestamo_servicoi_id_fk foreign key(servicio_id)
        references prestamo(servicio_id),
    constraint pago_prestamo_pk primary key(servicio_id, num_pago)    
);

--servicio cuenta---
create table cuenta(
    servicio_id,
    cuenta_id,
    tipo_cuenta bit not null,
    saldo_inicial number(8,2),
    numero_cuenta varchar2(25),
    constraint cuenta_servicio_id_fk foreign key(servicio_id)
        references servicio(servicio_id),
    constraint cuenta_pk primary key(servicio_id),
    constraint cuenta_cuenta_id_uk unique(cuenta_id)
);

create table cuenta_ahorro(
    servicio_id,
    duracion number(3,0) not null,
    intereses number(5,2) not null,
    constraint cuenta_ahorro_servicio_id_fk foreign key(servicio_id)
        references cuenta(servicio_id),
    constraint cuenta_ahorro_pk primary key(servicio_id)
);

create table cuenta_corriente(
    servicio_id,
    chequera number(5,0) not null,
    saldo_minimo number(8,2) not null,
    constraint cuenta_corriente_servicio_id_fk foreign key(servicio_id)
        references cuenta(servicio_id),
    constraint cuenta_corriente_pk primary key(servicio_id)
);


----- servicio inversoin ----

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


create table inversion(
    servicio_id,
    monto number(8,2) not null,
    gat varchar2(3) not null,
    codigo varchar2(10) not null,
    auditor_id,
    constraint inversion_servicio_id_fk foreign key(servicio_id)
        references servicio(servicio_id),
    constraint inversion_pk primary key(servicio_id),
    constraint inversion auditor_id_fk foreign key(auditor_id)
        references auditor(auditor_id)
);

create table inversion_deuda_publica(
    servicio_id,
    pais_bono varchar2(40) not null,
    moneda varchar2(3) not null,
    constraint inversion_deuda_pulica_servicio_id_fk foreign key(servicio_id)
        references inversion(servicio_id),
    constraint inversion_deuda_publica_pk primary key(servicio_id)
);

create table cnb(
    transaccion_id number(10,0),
    tipo varchar2(40) not null,
    nombre_banco varchar2(40) not null,
    fecha date not null,
    constraint transaccion_pk primary key(transaccion_id)
);

create table inversion_bolsa_valores(
    servicio_id,
    indice_bursatil number(5,2) not null,
    nombre_fondo_inversion varchar2(40) not null,
    transaccion_id,
    constraint inversion_bolsa_valores_servicio_id_fk foreign key(servicio_id)
        references inversion(servicio_id),
    constraint inversion_bolsa_valores_pk primary key(servicio_id),
    constraint inversoin_transaccion_id foreign key(transaccion_id)
        references cnb(transaccion_id)
);