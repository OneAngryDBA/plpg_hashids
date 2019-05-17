-- Deploy hashids-plgpsql:create.function.hashids.clean_alphabet_from_seps to pg
-- requires: create.schema.hashids

BEGIN;

CREATE OR REPLACE FUNCTION hashids.clean_alphabet_from_seps(
	p_seps text,
	p_alphabet text
)
  RETURNS text AS
$$
DECLARE 
    p_seps ALIAS for $1;
    p_alphabet ALIAS for $2;
    v_split_seps text[] := regexp_split_to_array(p_seps, '');
    v_split_alphabet text[] := regexp_split_to_array(p_alphabet, '');
    v_i integer := 1;
    v_length integer := length(p_alphabet);
    v_ret text := '';
BEGIN
	-- had to add this function because doing this:
	-- p_alphabet := array_to_string(ARRAY( select chars.cha from (select unnest(regexp_split_to_array(p_alphabet, '')) as cha EXCEPT select unnest(regexp_split_to_array(p_seps, '')) as cha) as chars  ), '');
	-- doesn't preserve the order of the input
	
	for v_i in 1..v_length loop
		--raise notice 'v_split_alphabet[%]: % != %', v_i, v_split_alphabet[v_i], v_split_alphabet[v_i] <> all (v_split_seps);
		if (v_split_alphabet[v_i] <> all (v_split_seps)) then
			v_ret = v_ret || v_split_alphabet[v_i];
		end if;
	end loop;

	-- raise notice 'v_ret: %', v_ret;
	return v_ret;
END;
$$
  LANGUAGE plpgsql IMMUTABLE
  COST 200;

COMMIT;
