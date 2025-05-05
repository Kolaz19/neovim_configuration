return {
	--C HEADER FILE
	s({
			trig = "ifndef",
			dscr = "Initialize C header"
		},
		fmt(
			[[
			#ifndef <>
			#define <>
			<>
			#endif
			]],
			{ i(1, "HEADER_DEFINITION"), rep(1), i(0) },
			{ delimiters = "<>" }
		)),
	--C STRUCT
	s({
			trig = "struc",
			dscr = "Initialize struct"
		},
		fmt(
			[[
			typedef struct <> {
				<>
			} <>;
			]],
			{ i(1, "STRUCT_TECHNICAL_NAME"), i(0), i(2, "STRUCT_NAME") },
			{ delimiters = "<>" }
		))
}
