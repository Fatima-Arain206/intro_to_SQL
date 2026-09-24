create SEQUENCE doubleseq_
as INT
start with 100
minvalue 100
maxvalue  1100
increment by 1
no cycle

declare @firstvalue sql_variant, @lastvalue sql_variant
exec sp_sequence_get_range
@sequence_name = N'doubleseq_',
@range_size = 100,
@range_first_value = @firstvalue OUTPUT,
@range_last_value =@lastvalue OUTPUT

select convert(int, @firstvalue), convert(int, @lastvalue)