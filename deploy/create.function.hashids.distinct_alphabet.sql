-- Deploy hashids-plgpsql:create.function.hashids.distinct_alphabet to pg
-- requires: create.schema.hashids

BEGIN;

CREATE OR REPLACE FUNCTION hashids.distinct_alphabet(in p_alphabet text)
  RETURNS text AS
$$
DECLARE 
    p_alphabet ALIAS for $1;
    v_split_alphabet text[] := regexp_split_to_array(p_alphabet, '');
    v_i integer := 2;
    v_length integer := length(p_alphabet);
    v_ret_array text[];
BEGIN
	-- had to add this function because doing this:
	-- p_alphabet := string_agg(distinct chars.split_chars, '') from (select unnest(regexp_split_to_array(p_alphabet, '')) as split_chars) as chars;
	-- doesn't preserve the order of the input, which was causing issues
	if (v_length = 0) then
		RAISE EXCEPTION 'alphabet must contain at least 1 char' USING HINT = 'Please check your alphabet';
	end if;
	v_ret_array := array_append(v_ret_array, v_split_alphabet[1]);

	-- starting at 2 because already appended 1 to it.
	for v_i in 2..v_length loop
		-- raise notice 'v_split_alphabet[%]: % != %', v_i, v_split_alphabet[v_i], v_split_alphabet[v_i] <> all (v_ret_array);
		
		if (v_split_alphabet[v_i] <> all (v_ret_array)) then
			v_ret_array := array_append(v_ret_array, v_split_alphabet[v_i]);
		end if;
	end loop;

	-- raise notice 'v_ret_array: %', array_to_string(v_ret_array, '');
	return array_to_string(v_ret_array, '');
END;
$$
  LANGUAGE plpgsql IMMUTABLE
  COST 200;

COMMIT;
