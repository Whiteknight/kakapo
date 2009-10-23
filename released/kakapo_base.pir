.namespace []

.include 'iglobals.pasm'
.include 'interpinfo.pasm'
.include 'sysinfo.pasm'

.sub '' :anon :load :init 
	$P0 = get_hll_global ['Miscellaneous'], '_ONLOAD'
	$P0()
	.return (0)
.end
.namespace []
.sub "_block11"  :anon :subid("10_1256292573.52203")
    get_hll_global $P14, ["Array"], "_block13" 
    .return ($P14)
.end


.namespace ["Array"]
.sub "_block13" :init :load :subid("11_1256292573.52203")
    .const 'Sub' $P397 = "47_1256292573.52203" 
    capture_lex $P397
    .const 'Sub' $P376 = "45_1256292573.52203" 
    capture_lex $P376
    .const 'Sub' $P369 = "44_1256292573.52203" 
    capture_lex $P369
    .const 'Sub' $P343 = "42_1256292573.52203" 
    capture_lex $P343
    .const 'Sub' $P336 = "41_1256292573.52203" 
    capture_lex $P336
    .const 'Sub' $P317 = "39_1256292573.52203" 
    capture_lex $P317
    .const 'Sub' $P309 = "38_1256292573.52203" 
    capture_lex $P309
    .const 'Sub' $P281 = "35_1256292573.52203" 
    capture_lex $P281
    .const 'Sub' $P250 = "32_1256292573.52203" 
    capture_lex $P250
    .const 'Sub' $P223 = "29_1256292573.52203" 
    capture_lex $P223
    .const 'Sub' $P97 = "21_1256292573.52203" 
    capture_lex $P97
    .const 'Sub' $P73 = "18_1256292573.52203" 
    capture_lex $P73
    .const 'Sub' $P49 = "15_1256292573.52203" 
    capture_lex $P49
    .const 'Sub' $P39 = "14_1256292573.52203" 
    capture_lex $P39
    .const 'Sub' $P29 = "13_1256292573.52203" 
    capture_lex $P29
    .const 'Sub' $P16 = "12_1256292573.52203" 
    capture_lex $P16
    get_global $P15, "%Bsearch_compare_func"
    unless_null $P15, vivify_51
    new $P15, "Hash"
  vivify_51:
    "_ONLOAD"()
    .const 'Sub' $P397 = "47_1256292573.52203" 
    capture_lex $P397
    .return ($P397)
.end


.namespace ["Array"]
.sub "_ONLOAD"  :subid("12_1256292573.52203") :outer("11_1256292573.52203")
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(58)
    push_eh $P18
    get_hll_global $P19, ["Parrot"], "IMPORT"
    $P19("Dumper")
    get_hll_global $P20, ["Array"], "cmp_numeric"
    get_global $P21, "%Bsearch_compare_func"
    unless_null $P21, vivify_52
    new $P21, "Hash"
    set_global "%Bsearch_compare_func", $P21
  vivify_52:
    set $P21["<=>"], $P20
    get_hll_global $P22, ["Array"], "cmp_numeric_R"
    get_global $P23, "%Bsearch_compare_func"
    unless_null $P23, vivify_53
    new $P23, "Hash"
    set_global "%Bsearch_compare_func", $P23
  vivify_53:
    set $P23["R<=>"], $P22
    get_hll_global $P24, ["Array"], "cmp_string"
    get_global $P25, "%Bsearch_compare_func"
    unless_null $P25, vivify_54
    new $P25, "Hash"
    set_global "%Bsearch_compare_func", $P25
  vivify_54:
    set $P25["cmp"], $P24
    get_hll_global $P26, ["Array"], "cmp_string_R"
    get_global $P27, "%Bsearch_compare_func"
    unless_null $P27, vivify_55
    new $P27, "Hash"
    set_global "%Bsearch_compare_func", $P27
  vivify_55:
    set $P27["Rcmp"], $P26
    .return ($P26)
  control_17:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P28, exception, "payload"
    .return ($P28)
    rethrow exception
.end


.namespace ["Array"]
.sub "cmp_numeric"  :subid("13_1256292573.52203") :outer("11_1256292573.52203")
    .param pmc param_32
    .param pmc param_33
    new $P31, 'ExceptionHandler'
    set_addr $P31, control_30
    $P31."handle_types"(58)
    push_eh $P31
    .lex "$a", param_32
    .lex "$b", param_33
    new $P34, "Exception"
    set $P34['type'], 58
    find_lex $P35, "$a"
    unless_null $P35, vivify_56
    new $P35, "Undef"
  vivify_56:
    find_lex $P36, "$b"
    unless_null $P36, vivify_57
    new $P36, "Undef"
  vivify_57:
    sub $P37, $P35, $P36
    setattribute $P34, 'payload', $P37
    throw $P34
    .return ()
  control_30:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P38, exception, "payload"
    .return ($P38)
    rethrow exception
.end


.namespace ["Array"]
.sub "cmp_numeric_R"  :subid("14_1256292573.52203") :outer("11_1256292573.52203")
    .param pmc param_42
    .param pmc param_43
    new $P41, 'ExceptionHandler'
    set_addr $P41, control_40
    $P41."handle_types"(58)
    push_eh $P41
    .lex "$a", param_42
    .lex "$b", param_43
    new $P44, "Exception"
    set $P44['type'], 58
    find_lex $P45, "$b"
    unless_null $P45, vivify_58
    new $P45, "Undef"
  vivify_58:
    find_lex $P46, "$a"
    unless_null $P46, vivify_59
    new $P46, "Undef"
  vivify_59:
    sub $P47, $P45, $P46
    setattribute $P44, 'payload', $P47
    throw $P44
    .return ()
  control_40:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P48, exception, "payload"
    .return ($P48)
    rethrow exception
.end


.namespace ["Array"]
.sub "cmp_string"  :subid("15_1256292573.52203") :outer("11_1256292573.52203")
    .param pmc param_52
    .param pmc param_53
    .const 'Sub' $P68 = "17_1256292573.52203" 
    capture_lex $P68
    .const 'Sub' $P62 = "16_1256292573.52203" 
    capture_lex $P62
    new $P51, 'ExceptionHandler'
    set_addr $P51, control_50
    $P51."handle_types"(58)
    push_eh $P51
    .lex "$a", param_52
    .lex "$b", param_53
    find_lex $P56, "$a"
    unless_null $P56, vivify_60
    new $P56, "Undef"
  vivify_60:
    set $S57, $P56
    find_lex $P58, "$b"
    unless_null $P58, vivify_61
    new $P58, "Undef"
  vivify_61:
    set $S59, $P58
    islt $I60, $S57, $S59
    if $I60, if_55
    .const 'Sub' $P68 = "17_1256292573.52203" 
    capture_lex $P68
    $P71 = $P68()
    set $P54, $P71
    goto if_55_end
  if_55:
    .const 'Sub' $P62 = "16_1256292573.52203" 
    capture_lex $P62
    $P66 = $P62()
    set $P54, $P66
  if_55_end:
    .return ($P54)
  control_50:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P72, exception, "payload"
    .return ($P72)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block67"  :anon :subid("17_1256292573.52203") :outer("15_1256292573.52203")
    new $P69, "Exception"
    set $P69['type'], 58
    new $P70, "Integer"
    assign $P70, 1
    setattribute $P69, 'payload', $P70
    throw $P69
    .return ()
.end


.namespace ["Array"]
.sub "_block61"  :anon :subid("16_1256292573.52203") :outer("15_1256292573.52203")
    new $P63, "Exception"
    set $P63['type'], 58
    new $P64, "Integer"
    assign $P64, 1
    neg $P65, $P64
    setattribute $P63, 'payload', $P65
    throw $P63
    .return ()
.end


.namespace ["Array"]
.sub "cmp_string_R"  :subid("18_1256292573.52203") :outer("11_1256292573.52203")
    .param pmc param_76
    .param pmc param_77
    .const 'Sub' $P92 = "20_1256292573.52203" 
    capture_lex $P92
    .const 'Sub' $P86 = "19_1256292573.52203" 
    capture_lex $P86
    new $P75, 'ExceptionHandler'
    set_addr $P75, control_74
    $P75."handle_types"(58)
    push_eh $P75
    .lex "$a", param_76
    .lex "$b", param_77
    find_lex $P80, "$b"
    unless_null $P80, vivify_62
    new $P80, "Undef"
  vivify_62:
    set $S81, $P80
    find_lex $P82, "$a"
    unless_null $P82, vivify_63
    new $P82, "Undef"
  vivify_63:
    set $S83, $P82
    islt $I84, $S81, $S83
    if $I84, if_79
    .const 'Sub' $P92 = "20_1256292573.52203" 
    capture_lex $P92
    $P95 = $P92()
    set $P78, $P95
    goto if_79_end
  if_79:
    .const 'Sub' $P86 = "19_1256292573.52203" 
    capture_lex $P86
    $P90 = $P86()
    set $P78, $P90
  if_79_end:
    .return ($P78)
  control_74:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P96, exception, "payload"
    .return ($P96)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block91"  :anon :subid("20_1256292573.52203") :outer("18_1256292573.52203")
    new $P93, "Exception"
    set $P93['type'], 58
    new $P94, "Integer"
    assign $P94, 1
    setattribute $P93, 'payload', $P94
    throw $P93
    .return ()
.end


.namespace ["Array"]
.sub "_block85"  :anon :subid("19_1256292573.52203") :outer("18_1256292573.52203")
    new $P87, "Exception"
    set $P87['type'], 58
    new $P88, "Integer"
    assign $P88, 1
    neg $P89, $P88
    setattribute $P87, 'payload', $P89
    throw $P87
    .return ()
.end


.namespace ["Array"]
.sub "bsearch"  :subid("21_1256292573.52203") :outer("11_1256292573.52203")
    .param pmc param_100
    .param pmc param_101
    .param pmc param_102 :slurpy :named
    .const 'Sub' $P218 = "28_1256292573.52203" 
    capture_lex $P218
    .const 'Sub' $P170 = "25_1256292573.52203" 
    capture_lex $P170
    .const 'Sub' $P161 = "24_1256292573.52203" 
    capture_lex $P161
    .const 'Sub' $P144 = "23_1256292573.52203" 
    capture_lex $P144
    .const 'Sub' $P134 = "22_1256292573.52203" 
    capture_lex $P134
    new $P99, 'ExceptionHandler'
    set_addr $P99, control_98
    $P99."handle_types"(58)
    push_eh $P99
    .lex "@array", param_100
    .lex "$value", param_101
    .lex "%opts", param_102
    find_lex $P105, "%opts"
    unless_null $P105, vivify_64
    new $P105, "Hash"
  vivify_64:
    set $P106, $P105["cmp"]
    unless_null $P106, vivify_65
    new $P106, "Undef"
  vivify_65:
    if $P106, if_104
    new $P109, "String"
    assign $P109, "<=>"
    set $P103, $P109
    goto if_104_end
  if_104:
    find_lex $P107, "%opts"
    unless_null $P107, vivify_66
    new $P107, "Hash"
  vivify_66:
    set $P108, $P107["cmp"]
    unless_null $P108, vivify_67
    new $P108, "Undef"
  vivify_67:
    set $P103, $P108
  if_104_end:
    .lex "$cmp", $P103
    find_lex $P112, "%opts"
    unless_null $P112, vivify_68
    new $P112, "Hash"
  vivify_68:
    set $P113, $P112["high"]
    unless_null $P113, vivify_69
    new $P113, "Undef"
  vivify_69:
    set $N114, $P113
    new $P115, "Integer"
    assign $P115, 0
    set $N116, $P115
    isgt $I117, $N114, $N116
    if $I117, if_111
    find_lex $P120, "@array"
    unless_null $P120, vivify_70
    new $P120, "ResizablePMCArray"
  vivify_70:
    $P121 = $P120."elements"()
    set $P110, $P121
    goto if_111_end
  if_111:
    find_lex $P118, "%opts"
    unless_null $P118, vivify_71
    new $P118, "Hash"
  vivify_71:
    set $P119, $P118["high"]
    unless_null $P119, vivify_72
    new $P119, "Undef"
  vivify_72:
    set $P110, $P119
  if_111_end:
    .lex "$high", $P110
    new $P122, "Integer"
    assign $P122, 0
    find_lex $P123, "%opts"
    unless_null $P123, vivify_73
    new $P123, "Hash"
  vivify_73:
    set $P124, $P123["low"]
    unless_null $P124, vivify_74
    new $P124, "Undef"
  vivify_74:
    add $P125, $P122, $P124
    .lex "$low", $P125
    find_lex $P126, "$high"
    unless_null $P126, vivify_75
    new $P126, "Undef"
  vivify_75:
    .lex "$top", $P126
    find_lex $P128, "$high"
    unless_null $P128, vivify_76
    new $P128, "Undef"
  vivify_76:
    set $N129, $P128
    find_lex $P130, "@array"
    unless_null $P130, vivify_77
    new $P130, "ResizablePMCArray"
  vivify_77:
    $N131 = $P130."elements"()
    isgt $I132, $N129, $N131
    unless $I132, if_127_end
    .const 'Sub' $P134 = "22_1256292573.52203" 
    capture_lex $P134
    $P134()
  if_127_end:
    find_lex $P138, "$low"
    unless_null $P138, vivify_79
    new $P138, "Undef"
  vivify_79:
    set $N139, $P138
    new $P140, "Integer"
    assign $P140, 0
    set $N141, $P140
    islt $I142, $N139, $N141
    unless $I142, if_137_end
    .const 'Sub' $P144 = "23_1256292573.52203" 
    capture_lex $P144
    $P144()
  if_137_end:
    find_lex $P148, "$cmp"
    unless_null $P148, vivify_82
    new $P148, "Undef"
  vivify_82:
    get_global $P149, "%Bsearch_compare_func"
    unless_null $P149, vivify_83
    new $P149, "Hash"
  vivify_83:
    set $P150, $P149[$P148]
    unless_null $P150, vivify_84
    new $P150, "Undef"
  vivify_84:
    .lex "&compare", $P150
    get_hll_global $P154, ["Parrot"], "isa"
    find_lex $P155, "$cmp"
    unless_null $P155, vivify_85
    new $P155, "Undef"
  vivify_85:
    $P156 = $P154($P155, "Sub")
    unless $P156, unless_153
    set $P152, $P156
    goto unless_153_end
  unless_153:
    get_hll_global $P157, ["Parrot"], "isa"
    find_lex $P158, "$cmp"
    unless_null $P158, vivify_86
    new $P158, "Undef"
  vivify_86:
    $P159 = $P157($P158, "MultiSub")
    set $P152, $P159
  unless_153_end:
    unless $P152, if_151_end
    .const 'Sub' $P161 = "24_1256292573.52203" 
    capture_lex $P161
    $P161()
  if_151_end:
    new $P163, "Undef"
    .lex "$mid", $P163
    new $P194, 'ExceptionHandler'
    set_addr $P194, loop193_handler
    $P194."handle_types"(65, 67, 66)
    push_eh $P194
  loop193_test:
    find_lex $P164, "$low"
    unless_null $P164, vivify_88
    new $P164, "Undef"
  vivify_88:
    set $N165, $P164
    find_lex $P166, "$high"
    unless_null $P166, vivify_89
    new $P166, "Undef"
  vivify_89:
    set $N167, $P166
    islt $I168, $N165, $N167
    unless $I168, loop193_done
  loop193_redo:
    .const 'Sub' $P170 = "25_1256292573.52203" 
    capture_lex $P170
    $P170()
  loop193_next:
    goto loop193_test
  loop193_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P195, exception, 'type'
    eq $P195, 65, loop193_next
    eq $P195, 67, loop193_redo
  loop193_done:
    pop_eh 
    find_lex $P196, "$low"
    unless_null $P196, vivify_97
    new $P196, "Undef"
  vivify_97:
    add $P197, $P196, 1
    neg $P198, $P197
    .lex "$result", $P198
    find_lex $P202, "$low"
    unless_null $P202, vivify_98
    new $P202, "Undef"
  vivify_98:
    set $N203, $P202
    find_lex $P204, "$top"
    unless_null $P204, vivify_99
    new $P204, "Undef"
  vivify_99:
    set $N205, $P204
    islt $I206, $N203, $N205
    if $I206, if_201
    new $P200, 'Integer'
    set $P200, $I206
    goto if_201_end
  if_201:
    find_lex $P207, "&compare"
    unless_null $P207, vivify_100
    new $P207, "Undef"
  vivify_100:
    find_lex $P208, "$low"
    unless_null $P208, vivify_101
    new $P208, "Undef"
  vivify_101:
    set $I209, $P208
    find_lex $P210, "@array"
    unless_null $P210, vivify_102
    new $P210, "ResizablePMCArray"
  vivify_102:
    set $P211, $P210[$I209]
    unless_null $P211, vivify_103
    new $P211, "Undef"
  vivify_103:
    find_lex $P212, "$value"
    unless_null $P212, vivify_104
    new $P212, "Undef"
  vivify_104:
    $N213 = $P207($P211, $P212)
    new $P214, "Integer"
    assign $P214, 0
    set $N215, $P214
    iseq $I216, $N213, $N215
    new $P200, 'Integer'
    set $P200, $I216
  if_201_end:
    unless $P200, if_199_end
    .const 'Sub' $P218 = "28_1256292573.52203" 
    capture_lex $P218
    $P218()
  if_199_end:
    new $P220, "Exception"
    set $P220['type'], 58
    find_lex $P221, "$result"
    unless_null $P221, vivify_106
    new $P221, "Undef"
  vivify_106:
    setattribute $P220, 'payload', $P221
    throw $P220
    .return ()
  control_98:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P222, exception, "payload"
    .return ($P222)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block133"  :anon :subid("22_1256292573.52203") :outer("21_1256292573.52203")
    find_lex $P135, "@array"
    unless_null $P135, vivify_78
    new $P135, "ResizablePMCArray"
  vivify_78:
    $P136 = $P135."elements"()
    store_lex "$high", $P136
    .return ($P136)
.end


.namespace ["Array"]
.sub "_block143"  :anon :subid("23_1256292573.52203") :outer("21_1256292573.52203")
    find_lex $P145, "$low"
    unless_null $P145, vivify_80
    new $P145, "Undef"
  vivify_80:
    find_lex $P146, "@array"
    unless_null $P146, vivify_81
    new $P146, "ResizablePMCArray"
  vivify_81:
    add $P147, $P145, $P146
    store_lex "$low", $P147
    .return ($P147)
.end


.namespace ["Array"]
.sub "_block160"  :anon :subid("24_1256292573.52203") :outer("21_1256292573.52203")
    find_lex $P162, "$cmp"
    unless_null $P162, vivify_87
    new $P162, "Undef"
  vivify_87:
    store_lex "&compare", $P162
    .return ($P162)
.end


.namespace ["Array"]
.sub "_block169"  :anon :subid("25_1256292573.52203") :outer("21_1256292573.52203")
    .const 'Sub' $P190 = "27_1256292573.52203" 
    capture_lex $P190
    .const 'Sub' $P185 = "26_1256292573.52203" 
    capture_lex $P185

			.local int high, low
			$P0 = find_lex '$high'
			high = $P0
			$P0 = find_lex '$low'
			low = $P0
			$I0 = high - low
			$I0 = $I0 / 2
			$I0 = $I0 + low
			$P171 = box $I0
		
    store_lex "$mid", $P171
    find_lex $P174, "&compare"
    unless_null $P174, vivify_90
    new $P174, "Undef"
  vivify_90:
    find_lex $P175, "$mid"
    unless_null $P175, vivify_91
    new $P175, "Undef"
  vivify_91:
    set $I176, $P175
    find_lex $P177, "@array"
    unless_null $P177, vivify_92
    new $P177, "ResizablePMCArray"
  vivify_92:
    set $P178, $P177[$I176]
    unless_null $P178, vivify_93
    new $P178, "Undef"
  vivify_93:
    find_lex $P179, "$value"
    unless_null $P179, vivify_94
    new $P179, "Undef"
  vivify_94:
    $N180 = $P174($P178, $P179)
    new $P181, "Integer"
    assign $P181, 0
    set $N182, $P181
    islt $I183, $N180, $N182
    if $I183, if_173
    .const 'Sub' $P190 = "27_1256292573.52203" 
    capture_lex $P190
    $P192 = $P190()
    set $P172, $P192
    goto if_173_end
  if_173:
    .const 'Sub' $P185 = "26_1256292573.52203" 
    capture_lex $P185
    $P188 = $P185()
    set $P172, $P188
  if_173_end:
    .return ($P172)
.end


.namespace ["Array"]
.sub "_block189"  :anon :subid("27_1256292573.52203") :outer("25_1256292573.52203")
    find_lex $P191, "$mid"
    unless_null $P191, vivify_95
    new $P191, "Undef"
  vivify_95:
    store_lex "$high", $P191
    .return ($P191)
.end


.namespace ["Array"]
.sub "_block184"  :anon :subid("26_1256292573.52203") :outer("25_1256292573.52203")
    find_lex $P186, "$mid"
    unless_null $P186, vivify_96
    new $P186, "Undef"
  vivify_96:
    add $P187, $P186, 1
    store_lex "$low", $P187
    .return ($P187)
.end


.namespace ["Array"]
.sub "_block217"  :anon :subid("28_1256292573.52203") :outer("21_1256292573.52203")
    find_lex $P219, "$low"
    unless_null $P219, vivify_105
    new $P219, "Undef"
  vivify_105:
    store_lex "$result", $P219
    .return ($P219)
.end


.namespace ["Array"]
.sub "clone"  :subid("29_1256292573.52203") :outer("11_1256292573.52203")
    .param pmc param_226
    .const 'Sub' $P233 = "30_1256292573.52203" 
    capture_lex $P233
    new $P225, 'ExceptionHandler'
    set_addr $P225, control_224
    $P225."handle_types"(58)
    push_eh $P225
    .lex "@original", param_226
    get_hll_global $P227, ["Array"], "empty"
    $P228 = $P227()
    .lex "@clone", $P228
    find_lex $P230, "@original"
    unless_null $P230, vivify_107
    new $P230, "ResizablePMCArray"
  vivify_107:
    set $N231, $P230
    unless $N231, if_229_end
    .const 'Sub' $P233 = "30_1256292573.52203" 
    capture_lex $P233
    $P233()
  if_229_end:
    new $P247, "Exception"
    set $P247['type'], 58
    find_lex $P248, "@clone"
    unless_null $P248, vivify_112
    new $P248, "ResizablePMCArray"
  vivify_112:
    setattribute $P247, 'payload', $P248
    throw $P247
    .return ()
  control_224:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P249, exception, "payload"
    .return ($P249)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block232"  :anon :subid("30_1256292573.52203") :outer("29_1256292573.52203")
    .const 'Sub' $P239 = "31_1256292573.52203" 
    capture_lex $P239
    find_lex $P235, "@original"
    unless_null $P235, vivify_108
    new $P235, "ResizablePMCArray"
  vivify_108:
    defined $I236, $P235
    unless $I236, for_undef_109
    iter $P234, $P235
    new $P245, 'ExceptionHandler'
    set_addr $P245, loop244_handler
    $P245."handle_types"(65, 67, 66)
    push_eh $P245
  loop244_test:
    unless $P234, loop244_done
    shift $P237, $P234
  loop244_redo:
    .const 'Sub' $P239 = "31_1256292573.52203" 
    capture_lex $P239
    $P239($P237)
  loop244_next:
    goto loop244_test
  loop244_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P246, exception, 'type'
    eq $P246, 65, loop244_next
    eq $P246, 67, loop244_redo
  loop244_done:
    pop_eh 
  for_undef_109:
    .return ($P234)
.end


.namespace ["Array"]
.sub "_block238"  :anon :subid("31_1256292573.52203") :outer("30_1256292573.52203")
    .param pmc param_240
    .lex "$_", param_240
    find_lex $P241, "@clone"
    unless_null $P241, vivify_110
    new $P241, "ResizablePMCArray"
  vivify_110:
    find_lex $P242, "$_"
    unless_null $P242, vivify_111
    new $P242, "Undef"
  vivify_111:
    $P243 = $P241."push"($P242)
    .return ($P243)
.end


.namespace ["Array"]
.sub "concat"  :subid("32_1256292573.52203") :outer("11_1256292573.52203")
    .param pmc param_253 :slurpy
    .const 'Sub' $P270 = "34_1256292573.52203" 
    capture_lex $P270
    .const 'Sub' $P261 = "33_1256292573.52203" 
    capture_lex $P261
    new $P252, 'ExceptionHandler'
    set_addr $P252, control_251
    $P252."handle_types"(58)
    push_eh $P252
    .lex "@sources", param_253
    find_lex $P255, "@sources"
    unless_null $P255, vivify_113
    new $P255, "ResizablePMCArray"
  vivify_113:
    set $N256, $P255
    new $P257, "Integer"
    assign $P257, 0
    set $N258, $P257
    iseq $I259, $N256, $N258
    unless $I259, if_254_end
    .const 'Sub' $P261 = "33_1256292573.52203" 
    capture_lex $P261
    $P261()
  if_254_end:
    find_lex $P265, "@sources"
    unless_null $P265, vivify_114
    new $P265, "ResizablePMCArray"
  vivify_114:
    $P266 = $P265."shift"()
    $P267 = $P266."clone"()
    .lex "@result", $P267
    new $P276, 'ExceptionHandler'
    set_addr $P276, loop275_handler
    $P276."handle_types"(65, 67, 66)
    push_eh $P276
  loop275_test:
    find_lex $P268, "@sources"
    unless_null $P268, vivify_115
    new $P268, "ResizablePMCArray"
  vivify_115:
    unless $P268, loop275_done
  loop275_redo:
    .const 'Sub' $P270 = "34_1256292573.52203" 
    capture_lex $P270
    $P270()
  loop275_next:
    goto loop275_test
  loop275_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P277, exception, 'type'
    eq $P277, 65, loop275_next
    eq $P277, 67, loop275_redo
  loop275_done:
    pop_eh 
    new $P278, "Exception"
    set $P278['type'], 58
    find_lex $P279, "@result"
    unless_null $P279, vivify_118
    new $P279, "ResizablePMCArray"
  vivify_118:
    setattribute $P278, 'payload', $P279
    throw $P278
    .return ()
  control_251:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P280, exception, "payload"
    .return ($P280)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block260"  :anon :subid("33_1256292573.52203") :outer("32_1256292573.52203")
    new $P262, "Exception"
    set $P262['type'], 58
    get_hll_global $P263, ["Array"], "empty"
    $P264 = $P263()
    setattribute $P262, 'payload', $P264
    throw $P262
    .return ()
.end


.namespace ["Array"]
.sub "_block269"  :anon :subid("34_1256292573.52203") :outer("32_1256292573.52203")
    find_lex $P271, "@result"
    unless_null $P271, vivify_116
    new $P271, "ResizablePMCArray"
  vivify_116:
    find_lex $P272, "@sources"
    unless_null $P272, vivify_117
    new $P272, "ResizablePMCArray"
  vivify_117:
    $P273 = $P272."shift"()
    $P274 = $P271."append"($P273)
    .return ($P274)
.end


.namespace ["Array"]
.sub "contains"  :subid("35_1256292573.52203") :method :outer("11_1256292573.52203")
    .param pmc param_284
    .const 'Sub' $P290 = "36_1256292573.52203" 
    capture_lex $P290
    new $P283, 'ExceptionHandler'
    set_addr $P283, control_282
    $P283."handle_types"(58)
    push_eh $P283
    .lex "self", self
    .lex "$item", param_284
    find_lex $P286, "self"
    defined $I287, $P286
    unless $I287, for_undef_119
    iter $P285, $P286
    new $P304, 'ExceptionHandler'
    set_addr $P304, loop303_handler
    $P304."handle_types"(65, 67, 66)
    push_eh $P304
  loop303_test:
    unless $P285, loop303_done
    shift $P288, $P285
  loop303_redo:
    .const 'Sub' $P290 = "36_1256292573.52203" 
    capture_lex $P290
    $P290($P288)
  loop303_next:
    goto loop303_test
  loop303_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P305, exception, 'type'
    eq $P305, 65, loop303_next
    eq $P305, 67, loop303_redo
  loop303_done:
    pop_eh 
  for_undef_119:
    new $P306, "Exception"
    set $P306['type'], 58
    new $P307, "Integer"
    assign $P307, 0
    setattribute $P306, 'payload', $P307
    throw $P306
    .return ()
  control_282:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P308, exception, "payload"
    .return ($P308)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block289"  :anon :subid("36_1256292573.52203") :outer("35_1256292573.52203")
    .param pmc param_291
    .const 'Sub' $P299 = "37_1256292573.52203" 
    capture_lex $P299
    .lex "$_", param_291
    get_hll_global $P294, ["Parrot"], "iseq"
    find_lex $P295, "$item"
    unless_null $P295, vivify_120
    new $P295, "Undef"
  vivify_120:
    find_lex $P296, "$_"
    unless_null $P296, vivify_121
    new $P296, "Undef"
  vivify_121:
    $P297 = $P294($P295, $P296)
    if $P297, if_293
    set $P292, $P297
    goto if_293_end
  if_293:
    .const 'Sub' $P299 = "37_1256292573.52203" 
    capture_lex $P299
    $P302 = $P299()
    set $P292, $P302
  if_293_end:
    .return ($P292)
.end


.namespace ["Array"]
.sub "_block298"  :anon :subid("37_1256292573.52203") :outer("36_1256292573.52203")
    new $P300, "Exception"
    set $P300['type'], 58
    new $P301, "Integer"
    assign $P301, 1
    setattribute $P300, 'payload', $P301
    throw $P300
    .return ()
.end


.namespace ["Array"]
.sub "elements"  :subid("38_1256292573.52203") :method :outer("11_1256292573.52203")
    .param pmc param_312 :slurpy
    new $P311, 'ExceptionHandler'
    set_addr $P311, control_310
    $P311."handle_types"(58)
    push_eh $P311
    .lex "self", self
    .lex "@value", param_312
    find_lex $P313, "self"
    find_lex $P314, "@value"
    unless_null $P314, vivify_122
    new $P314, "ResizablePMCArray"
  vivify_122:
    $P315 = "elements_"($P313, $P314)
    .return ($P315)
  control_310:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P316, exception, "payload"
    .return ($P316)
    rethrow exception
.end


.namespace ["Array"]
.sub "elements_"  :subid("39_1256292573.52203") :method :outer("11_1256292573.52203")
    .param pmc param_320
    .const 'Sub' $P325 = "40_1256292573.52203" 
    capture_lex $P325
    new $P319, 'ExceptionHandler'
    set_addr $P319, control_318
    $P319."handle_types"(58)
    push_eh $P319
    .lex "self", self
    .lex "@value", param_320
    find_lex $P322, "@value"
    unless_null $P322, vivify_123
    new $P322, "ResizablePMCArray"
  vivify_123:
    set $N323, $P322
    unless $N323, if_321_end
    .const 'Sub' $P325 = "40_1256292573.52203" 
    capture_lex $P325
    $P325()
  if_321_end:
    new $P331, "Exception"
    set $P331['type'], 58
    get_hll_global $P332, ["Parrot"], "elements"
    find_lex $P333, "self"
    $P334 = $P332($P333)
    setattribute $P331, 'payload', $P334
    throw $P331
    .return ()
  control_318:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P335, exception, "payload"
    .return ($P335)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block324"  :anon :subid("40_1256292573.52203") :outer("39_1256292573.52203")
    get_hll_global $P326, ["Parrot"], "set_integer"
    find_lex $P327, "self"
    find_lex $P328, "@value"
    unless_null $P328, vivify_124
    new $P328, "ResizablePMCArray"
  vivify_124:
    $P329 = $P328."shift"()
    $P330 = $P326($P327, $P329)
    .return ($P330)
.end


.namespace ["Array"]
.sub "empty"  :subid("41_1256292573.52203") :outer("11_1256292573.52203")
    new $P338, 'ExceptionHandler'
    set_addr $P338, control_337
    $P338."handle_types"(58)
    push_eh $P338
    new $P339, "Exception"
    set $P339['type'], 58
    get_hll_global $P340, ["Parrot"], "new_pmc"
    $P341 = $P340("ResizablePMCArray")
    setattribute $P339, 'payload', $P341
    throw $P339
    .return ()
  control_337:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P342, exception, "payload"
    .return ($P342)
    rethrow exception
.end


.namespace ["Array"]
.sub "join"  :subid("42_1256292573.52203") :outer("11_1256292573.52203")
    .param pmc param_346
    .param pmc param_347
    .const 'Sub' $P355 = "43_1256292573.52203" 
    capture_lex $P355
    new $P345, 'ExceptionHandler'
    set_addr $P345, control_344
    $P345."handle_types"(58)
    push_eh $P345
    .lex "$_delim", param_346
    .lex "@parts", param_347
    new $P348, "String"
    assign $P348, ""
    .lex "$result", $P348
    new $P349, "String"
    assign $P349, ""
    .lex "$delim", $P349
    find_lex $P351, "@parts"
    unless_null $P351, vivify_125
    new $P351, "ResizablePMCArray"
  vivify_125:
    defined $I352, $P351
    unless $I352, for_undef_126
    iter $P350, $P351
    new $P364, 'ExceptionHandler'
    set_addr $P364, loop363_handler
    $P364."handle_types"(65, 67, 66)
    push_eh $P364
  loop363_test:
    unless $P350, loop363_done
    shift $P353, $P350
  loop363_redo:
    .const 'Sub' $P355 = "43_1256292573.52203" 
    capture_lex $P355
    $P355($P353)
  loop363_next:
    goto loop363_test
  loop363_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P365, exception, 'type'
    eq $P365, 65, loop363_next
    eq $P365, 67, loop363_redo
  loop363_done:
    pop_eh 
  for_undef_126:
    new $P366, "Exception"
    set $P366['type'], 58
    find_lex $P367, "$result"
    unless_null $P367, vivify_131
    new $P367, "Undef"
  vivify_131:
    setattribute $P366, 'payload', $P367
    throw $P366
    .return ()
  control_344:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P368, exception, "payload"
    .return ($P368)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block354"  :anon :subid("43_1256292573.52203") :outer("42_1256292573.52203")
    .param pmc param_356
    .lex "$_", param_356
    find_lex $P357, "$result"
    unless_null $P357, vivify_127
    new $P357, "Undef"
  vivify_127:
    find_lex $P358, "$delim"
    unless_null $P358, vivify_128
    new $P358, "Undef"
  vivify_128:
    concat $P359, $P357, $P358
    find_lex $P360, "$_"
    unless_null $P360, vivify_129
    new $P360, "Undef"
  vivify_129:
    concat $P361, $P359, $P360
    store_lex "$result", $P361
    find_lex $P362, "$_delim"
    unless_null $P362, vivify_130
    new $P362, "Undef"
  vivify_130:
    store_lex "$delim", $P362
    .return ($P362)
.end


.namespace ["Array"]
.sub "new"  :subid("44_1256292573.52203") :outer("11_1256292573.52203")
    .param pmc param_372 :slurpy
    new $P371, 'ExceptionHandler'
    set_addr $P371, control_370
    $P371."handle_types"(58)
    push_eh $P371
    .lex "@elements", param_372
    new $P373, "Exception"
    set $P373['type'], 58
    find_lex $P374, "@elements"
    unless_null $P374, vivify_132
    new $P374, "ResizablePMCArray"
  vivify_132:
    setattribute $P373, 'payload', $P374
    throw $P373
    .return ()
  control_370:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P375, exception, "payload"
    .return ($P375)
    rethrow exception
.end


.namespace ["Array"]
.sub "reverse"  :subid("45_1256292573.52203") :outer("11_1256292573.52203")
    .param pmc param_379
    .const 'Sub' $P386 = "46_1256292573.52203" 
    capture_lex $P386
    new $P378, 'ExceptionHandler'
    set_addr $P378, control_377
    $P378."handle_types"(58)
    push_eh $P378
    .lex "@original", param_379
    $P380 = "empty"()
    .lex "@result", $P380
    find_lex $P382, "@original"
    unless_null $P382, vivify_133
    new $P382, "ResizablePMCArray"
  vivify_133:
    defined $I383, $P382
    unless $I383, for_undef_134
    iter $P381, $P382
    new $P392, 'ExceptionHandler'
    set_addr $P392, loop391_handler
    $P392."handle_types"(65, 67, 66)
    push_eh $P392
  loop391_test:
    unless $P381, loop391_done
    shift $P384, $P381
  loop391_redo:
    .const 'Sub' $P386 = "46_1256292573.52203" 
    capture_lex $P386
    $P386($P384)
  loop391_next:
    goto loop391_test
  loop391_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P393, exception, 'type'
    eq $P393, 65, loop391_next
    eq $P393, 67, loop391_redo
  loop391_done:
    pop_eh 
  for_undef_134:
    new $P394, "Exception"
    set $P394['type'], 58
    find_lex $P395, "@result"
    unless_null $P395, vivify_137
    new $P395, "ResizablePMCArray"
  vivify_137:
    setattribute $P394, 'payload', $P395
    throw $P394
    .return ()
  control_377:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P396, exception, "payload"
    .return ($P396)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block385"  :anon :subid("46_1256292573.52203") :outer("45_1256292573.52203")
    .param pmc param_387
    .lex "$_", param_387
    find_lex $P388, "@result"
    unless_null $P388, vivify_135
    new $P388, "ResizablePMCArray"
  vivify_135:
    find_lex $P389, "$_"
    unless_null $P389, vivify_136
    new $P389, "Undef"
  vivify_136:
    $P390 = $P388."unshift"($P389)
    .return ($P390)
.end


.namespace ["Array"]
.sub "unique"  :subid("47_1256292573.52203") :outer("11_1256292573.52203")
    .param pmc param_400
    .const 'Sub' $P408 = "48_1256292573.52203" 
    capture_lex $P408
    new $P399, 'ExceptionHandler'
    set_addr $P399, control_398
    $P399."handle_types"(58)
    push_eh $P399
    .lex "@original", param_400
    get_hll_global $P401, ["Array"], "empty"
    $P402 = $P401()
    .lex "@result", $P402
    find_lex $P404, "@original"
    unless_null $P404, vivify_138
    new $P404, "ResizablePMCArray"
  vivify_138:
    defined $I405, $P404
    unless $I405, for_undef_139
    iter $P403, $P404
    new $P437, 'ExceptionHandler'
    set_addr $P437, loop436_handler
    $P437."handle_types"(65, 67, 66)
    push_eh $P437
  loop436_test:
    unless $P403, loop436_done
    shift $P406, $P403
  loop436_redo:
    .const 'Sub' $P408 = "48_1256292573.52203" 
    capture_lex $P408
    $P408($P406)
  loop436_next:
    goto loop436_test
  loop436_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P438, exception, 'type'
    eq $P438, 65, loop436_next
    eq $P438, 67, loop436_redo
  loop436_done:
    pop_eh 
  for_undef_139:
    new $P439, "Exception"
    set $P439['type'], 58
    find_lex $P440, "@result"
    unless_null $P440, vivify_148
    new $P440, "ResizablePMCArray"
  vivify_148:
    setattribute $P439, 'payload', $P440
    throw $P439
    .return ()
  control_398:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P441, exception, "payload"
    .return ($P441)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block407"  :anon :subid("48_1256292573.52203") :outer("47_1256292573.52203")
    .param pmc param_409
    .const 'Sub' $P431 = "50_1256292573.52203" 
    capture_lex $P431
    .const 'Sub' $P417 = "49_1256292573.52203" 
    capture_lex $P417
    .lex "$_", param_409
    find_lex $P410, "$_"
    unless_null $P410, vivify_140
    new $P410, "Undef"
  vivify_140:
    .lex "$o", $P410
    new $P411, "Integer"
    assign $P411, 0
    .lex "$found", $P411
    find_lex $P413, "@result"
    unless_null $P413, vivify_141
    new $P413, "ResizablePMCArray"
  vivify_141:
    defined $I414, $P413
    unless $I414, for_undef_142
    iter $P412, $P413
    new $P425, 'ExceptionHandler'
    set_addr $P425, loop424_handler
    $P425."handle_types"(65, 67, 66)
    push_eh $P425
  loop424_test:
    unless $P412, loop424_done
    shift $P415, $P412
  loop424_redo:
    .const 'Sub' $P417 = "49_1256292573.52203" 
    capture_lex $P417
    $P417($P415)
  loop424_next:
    goto loop424_test
  loop424_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P426, exception, 'type'
    eq $P426, 65, loop424_next
    eq $P426, 67, loop424_redo
  loop424_done:
    pop_eh 
  for_undef_142:
    find_lex $P429, "$found"
    unless_null $P429, vivify_145
    new $P429, "Undef"
  vivify_145:
    unless $P429, unless_428
    set $P427, $P429
    goto unless_428_end
  unless_428:
    .const 'Sub' $P431 = "50_1256292573.52203" 
    capture_lex $P431
    $P435 = $P431()
    set $P427, $P435
  unless_428_end:
    .return ($P427)
.end


.namespace ["Array"]
.sub "_block416"  :anon :subid("49_1256292573.52203") :outer("48_1256292573.52203")
    .param pmc param_418
    .lex "$_", param_418

				
				$P0 = find_lex '$_'
				$P1 = find_lex '$o'
				$I0 = cmp $P0, $P1
				not $I0
				$P419 = box $I0
			
    .lex "$match", $P419
    find_lex $P422, "$found"
    unless_null $P422, vivify_143
    new $P422, "Undef"
  vivify_143:
    unless $P422, unless_421
    set $P420, $P422
    goto unless_421_end
  unless_421:
    find_lex $P423, "$match"
    unless_null $P423, vivify_144
    new $P423, "Undef"
  vivify_144:
    set $P420, $P423
  unless_421_end:
    store_lex "$found", $P420
    .return ($P420)
.end


.namespace ["Array"]
.sub "_block430"  :anon :subid("50_1256292573.52203") :outer("48_1256292573.52203")
    find_lex $P432, "@result"
    unless_null $P432, vivify_146
    new $P432, "ResizablePMCArray"
  vivify_146:
    find_lex $P433, "$o"
    unless_null $P433, vivify_147
    new $P433, "Undef"
  vivify_147:
    $P434 = $P432."push"($P433)
    .return ($P434)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256283593.06656")
    get_hll_global $P1156, ["Class";"HashBased"], "_block1155" 
    .return ($P1156)
.end


.namespace ["Class"]
.sub "_block13" :init :load :subid("11_1256283593.06656")
    .const 'Sub' $P784 = "76_1256283593.06656" 
    capture_lex $P784
    .const 'Sub' $P747 = "74_1256283593.06656" 
    capture_lex $P747
    .const 'Sub' $P724 = "71_1256283593.06656" 
    capture_lex $P724
    .const 'Sub' $P699 = "69_1256283593.06656" 
    capture_lex $P699
    .const 'Sub' $P599 = "63_1256283593.06656" 
    capture_lex $P599
    .const 'Sub' $P587 = "62_1256283593.06656" 
    capture_lex $P587
    .const 'Sub' $P567 = "60_1256283593.06656" 
    capture_lex $P567
    .const 'Sub' $P553 = "58_1256283593.06656" 
    capture_lex $P553
    .const 'Sub' $P516 = "54_1256283593.06656" 
    capture_lex $P516
    .const 'Sub' $P495 = "52_1256283593.06656" 
    capture_lex $P495
    .const 'Sub' $P453 = "48_1256283593.06656" 
    capture_lex $P453
    .const 'Sub' $P388 = "45_1256283593.06656" 
    capture_lex $P388
    .const 'Sub' $P345 = "42_1256283593.06656" 
    capture_lex $P345
    .const 'Sub' $P314 = "39_1256283593.06656" 
    capture_lex $P314
    .const 'Sub' $P270 = "35_1256283593.06656" 
    capture_lex $P270
    .const 'Sub' $P259 = "34_1256283593.06656" 
    capture_lex $P259
    .const 'Sub' $P245 = "33_1256283593.06656" 
    capture_lex $P245
    .const 'Sub' $P234 = "32_1256283593.06656" 
    capture_lex $P234
    .const 'Sub' $P173 = "26_1256283593.06656" 
    capture_lex $P173
    .const 'Sub' $P152 = "24_1256283593.06656" 
    capture_lex $P152
    .const 'Sub' $P74 = "17_1256283593.06656" 
    capture_lex $P74
    .const 'Sub' $P44 = "15_1256283593.06656" 
    capture_lex $P44
    .const 'Sub' $P32 = "14_1256283593.06656" 
    capture_lex $P32
    .const 'Sub' $P16 = "12_1256283593.06656" 
    capture_lex $P16
    get_global $P15, "%Class_info"
    unless_null $P15, vivify_116
    new $P15, "Hash"
  vivify_116:
    "_ONLOAD"()
    .const 'Sub' $P784 = "76_1256283593.06656" 
    capture_lex $P784
    .return ($P784)
.end


.namespace ["Class"]
.sub "_ONLOAD"  :subid("12_1256283593.06656") :outer("11_1256283593.06656")
    .const 'Sub' $P22 = "13_1256283593.06656" 
    capture_lex $P22
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(58)
    push_eh $P18
    get_global $P20, "$Onload_done"
    unless_null $P20, vivify_117
    new $P20, "Undef"
  vivify_117:
    unless $P20, if_19_end
    .const 'Sub' $P22 = "13_1256283593.06656" 
    capture_lex $P22
    $P22()
  if_19_end:
    new $P25, "Integer"
    assign $P25, 1
    set_global "$Onload_done", $P25
    get_hll_global $P26, ["Parrot"], "load_bytecode"
    $P26("P6object.pir")
    get_hll_global $P27, ["Dumper"], "_ONLOAD"
    $P27()
    get_hll_global $P28, ["Parrot"], "IMPORT"
    $P28("Dumper")
    get_hll_global $P29, ["Hash"], "empty"
    $P30 = $P29()
    set_global "%Class_info", $P30
    .return ($P30)
  control_17:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P31, exception, "payload"
    .return ($P31)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block21"  :anon :subid("13_1256283593.06656") :outer("12_1256283593.06656")
    new $P23, "Exception"
    set $P23['type'], 58
    new $P24, "Integer"
    assign $P24, 0
    setattribute $P23, 'payload', $P24
    throw $P23
    .return ()
.end


.namespace ["Class"]
.sub "IS_A"  :subid("14_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_35
    .param pmc param_36
    new $P34, 'ExceptionHandler'
    set_addr $P34, control_33
    $P34."handle_types"(58)
    push_eh $P34
    .lex "$object", param_35
    .lex "$type", param_36
    new $P37, "Exception"
    set $P37['type'], 58
    find_lex $P38, "$object"
    unless_null $P38, vivify_118
    new $P38, "Undef"
  vivify_118:
    $P39 = $P38."HOW"()
    find_lex $P40, "$object"
    unless_null $P40, vivify_119
    new $P40, "Undef"
  vivify_119:
    find_lex $P41, "$type"
    unless_null $P41, vivify_120
    new $P41, "Undef"
  vivify_120:
    $P42 = $P39."isa"($P40, $P41)
    setattribute $P37, 'payload', $P42
    throw $P37
    .return ()
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P43, exception, "payload"
    .return ($P43)
    rethrow exception
.end


.namespace ["Class"]
.sub "capture_namespace"  :subid("15_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_47
    .const 'Sub' $P55 = "16_1256283593.06656" 
    capture_lex $P55
    new $P46, 'ExceptionHandler'
    set_addr $P46, control_45
    $P46."handle_types"(58)
    push_eh $P46
    .lex "$nsp", param_47
    get_hll_global $P48, ["Hash"], "empty"
    $P49 = $P48()
    .lex "%sub_addrs", $P49
    find_lex $P51, "$nsp"
    unless_null $P51, vivify_121
    new $P51, "Undef"
  vivify_121:
    defined $I52, $P51
    unless $I52, for_undef_122
    iter $P50, $P51
    new $P69, 'ExceptionHandler'
    set_addr $P69, loop68_handler
    $P69."handle_types"(65, 67, 66)
    push_eh $P69
  loop68_test:
    unless $P50, loop68_done
    shift $P53, $P50
  loop68_redo:
    .const 'Sub' $P55 = "16_1256283593.06656" 
    capture_lex $P55
    $P55($P53)
  loop68_next:
    goto loop68_test
  loop68_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P70, exception, 'type'
    eq $P70, 65, loop68_next
    eq $P70, 67, loop68_redo
  loop68_done:
    pop_eh 
  for_undef_122:
    new $P71, "Exception"
    set $P71['type'], 58
    find_lex $P72, "%sub_addrs"
    unless_null $P72, vivify_130
    new $P72, "Hash"
  vivify_130:
    setattribute $P71, 'payload', $P72
    throw $P71
    .return ()
  control_45:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P73, exception, "payload"
    .return ($P73)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block54"  :anon :subid("16_1256283593.06656") :outer("15_1256283593.06656")
    .param pmc param_56
    .lex "$_", param_56
    find_lex $P57, "$_"
    unless_null $P57, vivify_123
    new $P57, "Undef"
  vivify_123:
    set $S58, $P57
    new $P59, 'String'
    set $P59, $S58
    .lex "$name", $P59
    get_hll_global $P60, ["Parrot"], "get_address_of"
    find_lex $P61, "$_"
    unless_null $P61, vivify_124
    new $P61, "Undef"
  vivify_124:
    find_lex $P62, "$nsp"
    unless_null $P62, vivify_125
    new $P62, "Hash"
  vivify_125:
    set $P63, $P62[$P61]
    unless_null $P63, vivify_126
    new $P63, "Undef"
  vivify_126:
    $P64 = $P60($P63)
    .lex "$addr", $P64
    find_lex $P65, "$addr"
    unless_null $P65, vivify_127
    new $P65, "Undef"
  vivify_127:
    find_lex $P66, "$name"
    unless_null $P66, vivify_128
    new $P66, "Undef"
  vivify_128:
    find_lex $P67, "%sub_addrs"
    unless_null $P67, vivify_129
    new $P67, "Hash"
    store_lex "%sub_addrs", $P67
  vivify_129:
    set $P67[$P66], $P65
    .return ($P65)
.end


.namespace ["Class"]
.sub "check_namespace"  :subid("17_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_77
    .param pmc param_78
    .const 'Sub' $P136 = "22_1256283593.06656" 
    capture_lex $P136
    .const 'Sub' $P87 = "18_1256283593.06656" 
    capture_lex $P87
    new $P76, 'ExceptionHandler'
    set_addr $P76, control_75
    $P76."handle_types"(58)
    push_eh $P76
    .lex "%before", param_77
    .lex "%after", param_78
    new $P79, "Hash"
    .lex "%seen", $P79
    get_hll_global $P81, ["Hash"], "sorted_keys"
    find_lex $P82, "%before"
    unless_null $P82, vivify_131
    new $P82, "Hash"
  vivify_131:
    $P83 = $P81($P82)
    defined $I84, $P83
    unless $I84, for_undef_132
    iter $P80, $P83
    new $P127, 'ExceptionHandler'
    set_addr $P127, loop126_handler
    $P127."handle_types"(65, 67, 66)
    push_eh $P127
  loop126_test:
    unless $P80, loop126_done
    shift $P85, $P80
  loop126_redo:
    .const 'Sub' $P87 = "18_1256283593.06656" 
    capture_lex $P87
    $P87($P85)
  loop126_next:
    goto loop126_test
  loop126_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P128, exception, 'type'
    eq $P128, 65, loop126_next
    eq $P128, 67, loop126_redo
  loop126_done:
    pop_eh 
  for_undef_132:
    get_hll_global $P130, ["Hash"], "sorted_keys"
    find_lex $P131, "%after"
    unless_null $P131, vivify_151
    new $P131, "Hash"
  vivify_151:
    $P132 = $P130($P131)
    defined $I133, $P132
    unless $I133, for_undef_152
    iter $P129, $P132
    new $P149, 'ExceptionHandler'
    set_addr $P149, loop148_handler
    $P149."handle_types"(65, 67, 66)
    push_eh $P149
  loop148_test:
    unless $P129, loop148_done
    shift $P134, $P129
  loop148_redo:
    .const 'Sub' $P136 = "22_1256283593.06656" 
    capture_lex $P136
    $P136($P134)
  loop148_next:
    goto loop148_test
  loop148_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P150, exception, 'type'
    eq $P150, 65, loop148_next
    eq $P150, 67, loop148_redo
  loop148_done:
    pop_eh 
  for_undef_152:
    .return ($P129)
  control_75:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P151, exception, "payload"
    .return ($P151)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block86"  :anon :subid("18_1256283593.06656") :outer("17_1256283593.06656")
    .param pmc param_88
    .const 'Sub' $P120 = "21_1256283593.06656" 
    capture_lex $P120
    .const 'Sub' $P96 = "19_1256283593.06656" 
    capture_lex $P96
    .lex "$_", param_88
    get_hll_global $P90, ["Hash"], "exists"
    find_lex $P91, "%after"
    unless_null $P91, vivify_133
    new $P91, "Hash"
  vivify_133:
    find_lex $P92, "$_"
    unless_null $P92, vivify_134
    new $P92, "Undef"
  vivify_134:
    set $S93, $P92
    $P94 = $P90($P91, $S93)
    if $P94, if_89
    .const 'Sub' $P120 = "21_1256283593.06656" 
    capture_lex $P120
    $P120()
    goto if_89_end
  if_89:
    .const 'Sub' $P96 = "19_1256283593.06656" 
    capture_lex $P96
    $P96()
  if_89_end:
    new $P123, "Integer"
    assign $P123, 1
    find_lex $P124, "$_"
    unless_null $P124, vivify_149
    new $P124, "Undef"
  vivify_149:
    find_lex $P125, "%seen"
    unless_null $P125, vivify_150
    new $P125, "Hash"
    store_lex "%seen", $P125
  vivify_150:
    set $P125[$P124], $P123
    .return ($P123)
.end


.namespace ["Class"]
.sub "_block119"  :anon :subid("21_1256283593.06656") :outer("18_1256283593.06656")
    find_lex $P121, "$_"
    unless_null $P121, vivify_135
    new $P121, "Undef"
  vivify_135:
    $P122 = "say"("Object '", $P121, "' has been removed")
    .return ($P122)
.end


.namespace ["Class"]
.sub "_block95"  :anon :subid("19_1256283593.06656") :outer("18_1256283593.06656")
    .const 'Sub' $P109 = "20_1256283593.06656" 
    capture_lex $P109
    find_lex $P99, "$_"
    unless_null $P99, vivify_136
    new $P99, "Undef"
  vivify_136:
    find_lex $P100, "%before"
    unless_null $P100, vivify_137
    new $P100, "Hash"
  vivify_137:
    set $P101, $P100[$P99]
    unless_null $P101, vivify_138
    new $P101, "Undef"
  vivify_138:
    set $N102, $P101
    find_lex $P103, "$_"
    unless_null $P103, vivify_139
    new $P103, "Undef"
  vivify_139:
    find_lex $P104, "%after"
    unless_null $P104, vivify_140
    new $P104, "Hash"
  vivify_140:
    set $P105, $P104[$P103]
    unless_null $P105, vivify_141
    new $P105, "Undef"
  vivify_141:
    set $N106, $P105
    isne $I107, $N102, $N106
    if $I107, if_98
    new $P97, 'Integer'
    set $P97, $I107
    goto if_98_end
  if_98:
    .const 'Sub' $P109 = "20_1256283593.06656" 
    capture_lex $P109
    $P118 = $P109()
    set $P97, $P118
  if_98_end:
    .return ($P97)
.end


.namespace ["Class"]
.sub "_block108"  :anon :subid("20_1256283593.06656") :outer("19_1256283593.06656")
    find_lex $P110, "$_"
    unless_null $P110, vivify_142
    new $P110, "Undef"
  vivify_142:
    find_lex $P111, "$_"
    unless_null $P111, vivify_143
    new $P111, "Undef"
  vivify_143:
    find_lex $P112, "%before"
    unless_null $P112, vivify_144
    new $P112, "Hash"
  vivify_144:
    set $P113, $P112[$P111]
    unless_null $P113, vivify_145
    new $P113, "Undef"
  vivify_145:
    find_lex $P114, "$_"
    unless_null $P114, vivify_146
    new $P114, "Undef"
  vivify_146:
    find_lex $P115, "%after"
    unless_null $P115, vivify_147
    new $P115, "Hash"
  vivify_147:
    set $P116, $P115[$P114]
    unless_null $P116, vivify_148
    new $P116, "Undef"
  vivify_148:
    $P117 = "say"("Object '", $P110, "' has different address: ", $P113, " -> ", $P116)
    .return ($P117)
.end


.namespace ["Class"]
.sub "_block135"  :anon :subid("22_1256283593.06656") :outer("17_1256283593.06656")
    .param pmc param_137
    .const 'Sub' $P144 = "23_1256283593.06656" 
    capture_lex $P144
    .lex "$_", param_137
    find_lex $P140, "$_"
    unless_null $P140, vivify_153
    new $P140, "Undef"
  vivify_153:
    find_lex $P141, "%seen"
    unless_null $P141, vivify_154
    new $P141, "Hash"
  vivify_154:
    set $P142, $P141[$P140]
    unless_null $P142, vivify_155
    new $P142, "Undef"
  vivify_155:
    unless $P142, unless_139
    set $P138, $P142
    goto unless_139_end
  unless_139:
    .const 'Sub' $P144 = "23_1256283593.06656" 
    capture_lex $P144
    $P147 = $P144()
    set $P138, $P147
  unless_139_end:
    .return ($P138)
.end


.namespace ["Class"]
.sub "_block143"  :anon :subid("23_1256283593.06656") :outer("22_1256283593.06656")
    find_lex $P145, "$_"
    unless_null $P145, vivify_156
    new $P145, "Undef"
  vivify_156:
    $P146 = "say"("Object '", $P145, "' was added")
    .return ($P146)
.end


.namespace ["Class"]
.sub "NEW_CLASS"  :subid("24_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_155
    .const 'Sub' $P162 = "25_1256283593.06656" 
    capture_lex $P162
    new $P154, 'ExceptionHandler'
    set_addr $P154, control_153
    $P154."handle_types"(58)
    push_eh $P154
    .lex "$class_name", param_155
    find_lex $P156, "$class_name"
    unless_null $P156, vivify_157
    new $P156, "Undef"
  vivify_157:
    $P157 = "_class_info"($P156)
    .lex "$class_info", $P157
    find_lex $P159, "$class_info"
    unless_null $P159, vivify_158
    new $P159, "Hash"
  vivify_158:
    set $P160, $P159["created"]
    unless_null $P160, vivify_159
    new $P160, "Undef"
  vivify_159:
    unless $P160, if_158_end
    .const 'Sub' $P162 = "25_1256283593.06656" 
    capture_lex $P162
    $P162()
  if_158_end:
    new $P165, "Integer"
    assign $P165, 1
    find_lex $P166, "$class_info"
    unless_null $P166, vivify_161
    new $P166, "Hash"
    store_lex "$class_info", $P166
  vivify_161:
    set $P166["created"], $P165
    $P167 = "get_meta"()
    find_lex $P168, "$class_name"
    unless_null $P168, vivify_162
    new $P168, "Undef"
  vivify_162:
    $P169 = $P167."new_class"($P168)
    .lex "$new_class", $P169
    new $P170, "Exception"
    set $P170['type'], 58
    find_lex $P171, "$new_class"
    unless_null $P171, vivify_163
    new $P171, "Undef"
  vivify_163:
    setattribute $P170, 'payload', $P171
    throw $P170
    .return ()
  control_153:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P172, exception, "payload"
    .return ($P172)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block161"  :anon :subid("25_1256283593.06656") :outer("24_1256283593.06656")
    find_lex $P163, "$class_name"
    unless_null $P163, vivify_160
    new $P163, "Undef"
  vivify_160:
    $P164 = "DIE"("Class '", $P163, "' already created.")
    .return ($P164)
.end


.namespace ["Class"]
.sub "SUBCLASS"  :subid("26_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_176
    .param pmc param_177 :slurpy
    .const 'Sub' $P222 = "31_1256283593.06656" 
    capture_lex $P222
    .const 'Sub' $P207 = "30_1256283593.06656" 
    capture_lex $P207
    .const 'Sub' $P199 = "29_1256283593.06656" 
    capture_lex $P199
    .const 'Sub' $P188 = "28_1256283593.06656" 
    capture_lex $P188
    .const 'Sub' $P184 = "27_1256283593.06656" 
    capture_lex $P184
    new $P175, 'ExceptionHandler'
    set_addr $P175, control_174
    $P175."handle_types"(58)
    push_eh $P175
    .lex "$class_name", param_176
    .lex "@parents", param_177
    find_lex $P178, "$class_name"
    unless_null $P178, vivify_164
    new $P178, "Undef"
  vivify_164:
    $P179 = "_class_info"($P178)
    .lex "$class_info", $P179
    find_lex $P181, "$class_info"
    unless_null $P181, vivify_165
    new $P181, "Hash"
  vivify_165:
    set $P182, $P181["created"]
    unless_null $P182, vivify_166
    new $P182, "Undef"
  vivify_166:
    if $P182, if_180
    .const 'Sub' $P188 = "28_1256283593.06656" 
    capture_lex $P188
    $P188()
    goto if_180_end
  if_180:
    .const 'Sub' $P184 = "27_1256283593.06656" 
    capture_lex $P184
    $P184()
  if_180_end:
    find_lex $P191, "$class_name"
    unless_null $P191, vivify_169
    new $P191, "Undef"
  vivify_169:
    find_lex $P192, "@parents"
    unless_null $P192, vivify_170
    new $P192, "ResizablePMCArray"
  vivify_170:
    set $N193, $P192
    "NOTE"("Creating subclass ", $P191, " with ", $N193, " parents.")
    $P194 = "get_meta"()
    .lex "$meta", $P194
    find_lex $P196, "@parents"
    unless_null $P196, vivify_171
    new $P196, "ResizablePMCArray"
  vivify_171:
    set $N197, $P196
    if $N197, unless_195_end
    .const 'Sub' $P199 = "29_1256283593.06656" 
    capture_lex $P199
    $P199()
  unless_195_end:
    "NOTE"("Running _ONLOAD method of all parents")
    find_lex $P203, "@parents"
    unless_null $P203, vivify_173
    new $P203, "ResizablePMCArray"
  vivify_173:
    defined $I204, $P203
    unless $I204, for_undef_174
    iter $P202, $P203
    new $P213, 'ExceptionHandler'
    set_addr $P213, loop212_handler
    $P213."handle_types"(65, 67, 66)
    push_eh $P213
  loop212_test:
    unless $P202, loop212_done
    shift $P205, $P202
  loop212_redo:
    .const 'Sub' $P207 = "30_1256283593.06656" 
    capture_lex $P207
    $P207($P205)
  loop212_next:
    goto loop212_test
  loop212_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P214, exception, 'type'
    eq $P214, 65, loop212_next
    eq $P214, 67, loop212_redo
  loop212_done:
    pop_eh 
  for_undef_174:
    "NOTE"("Creating class with first parent")
    find_lex $P215, "$meta"
    unless_null $P215, vivify_177
    new $P215, "Undef"
  vivify_177:
    find_lex $P216, "$class_name"
    unless_null $P216, vivify_178
    new $P216, "Undef"
  vivify_178:
    find_lex $P217, "@parents"
    unless_null $P217, vivify_179
    new $P217, "ResizablePMCArray"
  vivify_179:
    $P218 = $P217."shift"()
    $P219 = $P215."new_class"($P216, $P218 :named("parent"))
    .lex "$class", $P219
    "NOTE"("Attaching other parents to new class")
    new $P229, 'ExceptionHandler'
    set_addr $P229, loop228_handler
    $P229."handle_types"(65, 67, 66)
    push_eh $P229
  loop228_test:
    find_lex $P220, "@parents"
    unless_null $P220, vivify_180
    new $P220, "ResizablePMCArray"
  vivify_180:
    unless $P220, loop228_done
  loop228_redo:
    .const 'Sub' $P222 = "31_1256283593.06656" 
    capture_lex $P222
    $P222()
  loop228_next:
    goto loop228_test
  loop228_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P230, exception, 'type'
    eq $P230, 65, loop228_next
    eq $P230, 67, loop228_redo
  loop228_done:
    pop_eh 
    new $P231, "Exception"
    set $P231['type'], 58
    find_lex $P232, "$class"
    unless_null $P232, vivify_184
    new $P232, "Undef"
  vivify_184:
    setattribute $P231, 'payload', $P232
    throw $P231
    .return ()
  control_174:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P233, exception, "payload"
    .return ($P233)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block187"  :anon :subid("28_1256283593.06656") :outer("26_1256283593.06656")
    new $P189, "Integer"
    assign $P189, 1
    find_lex $P190, "$class_info"
    unless_null $P190, vivify_167
    new $P190, "Hash"
    store_lex "$class_info", $P190
  vivify_167:
    set $P190["created"], $P189
    .return ($P189)
.end


.namespace ["Class"]
.sub "_block183"  :anon :subid("27_1256283593.06656") :outer("26_1256283593.06656")
    find_lex $P185, "$class_name"
    unless_null $P185, vivify_168
    new $P185, "Undef"
  vivify_168:
    $P186 = "DIE"("Class '", $P185, "' already created.")
    .return ($P186)
.end


.namespace ["Class"]
.sub "_block198"  :anon :subid("29_1256283593.06656") :outer("26_1256283593.06656")
    "NOTE"("Adding parent class 'Class::HashBased'")
    find_lex $P200, "@parents"
    unless_null $P200, vivify_172
    new $P200, "ResizablePMCArray"
  vivify_172:
    $P201 = $P200."push"("Class::HashBased")
    .return ($P201)
.end


.namespace ["Class"]
.sub "_block206"  :anon :subid("30_1256283593.06656") :outer("26_1256283593.06656")
    .param pmc param_208
    .lex "$_", param_208
    find_lex $P209, "$_"
    unless_null $P209, vivify_175
    new $P209, "Undef"
  vivify_175:
    "NOTE"($P209)
    find_lex $P210, "$_"
    unless_null $P210, vivify_176
    new $P210, "Undef"
  vivify_176:
    $P211 = "call_onload_of_class"($P210)
    .return ($P211)
.end


.namespace ["Class"]
.sub "_block221"  :anon :subid("31_1256283593.06656") :outer("26_1256283593.06656")
    find_lex $P223, "$meta"
    unless_null $P223, vivify_181
    new $P223, "Undef"
  vivify_181:
    find_lex $P224, "$class"
    unless_null $P224, vivify_182
    new $P224, "Undef"
  vivify_182:
    find_lex $P225, "@parents"
    unless_null $P225, vivify_183
    new $P225, "ResizablePMCArray"
  vivify_183:
    $P226 = $P225."shift"()
    $P227 = $P223."add_parent"($P224, $P226)
    .return ($P227)
.end


.namespace ["Class"]
.sub "already_created"  :subid("32_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_237
    new $P236, 'ExceptionHandler'
    set_addr $P236, control_235
    $P236."handle_types"(58)
    push_eh $P236
    .lex "$name", param_237
    get_global $P238, "%already_created"
    unless_null $P238, vivify_185
    new $P238, "Hash"
  vivify_185:
    new $P239, "Exception"
    set $P239['type'], 58
    find_lex $P240, "$name"
    unless_null $P240, vivify_186
    new $P240, "Undef"
  vivify_186:
    get_global $P241, "%already_created"
    unless_null $P241, vivify_187
    new $P241, "Hash"
  vivify_187:
    set $P242, $P241[$P240]
    unless_null $P242, vivify_188
    new $P242, "Undef"
  vivify_188:
        ##  inline postfix:++
        clone $P243, $P242
        inc $P242
    setattribute $P239, 'payload', $P243
    throw $P239
    .return ()
  control_235:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P244, exception, "payload"
    .return ($P244)
    rethrow exception
.end


.namespace ["Class"]
.sub "call_method"  :subid("33_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_248
    .param pmc param_249
    .param pmc param_250 :slurpy
    .param pmc param_251 :slurpy :named
    new $P247, 'ExceptionHandler'
    set_addr $P247, control_246
    $P247."handle_types"(58)
    push_eh $P247
    .lex "$object", param_248
    .lex "$method", param_249
    .lex "@args", param_250
    .lex "%opts", param_251
    new $P252, "Exception"
    set $P252['type'], 58
    find_lex $P253, "$object"
    unless_null $P253, vivify_189
    new $P253, "Undef"
  vivify_189:
    find_lex $P254, "$method"
    unless_null $P254, vivify_190
    new $P254, "Undef"
  vivify_190:
    find_lex $P255, "@args"
    unless_null $P255, vivify_191
    new $P255, "ResizablePMCArray"
  vivify_191:
    find_lex $P256, "%opts"
    unless_null $P256, vivify_192
    new $P256, "Hash"
  vivify_192:
    $P257 = "call_method_"($P253, $P254, $P255, $P256)
    setattribute $P252, 'payload', $P257
    throw $P252
    .return ()
  control_246:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P258, exception, "payload"
    .return ($P258)
    rethrow exception
.end


.namespace ["Class"]
.sub "call_method_"  :subid("34_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_262
    .param pmc param_263
    .param pmc param_264
    .param pmc param_265
    new $P261, 'ExceptionHandler'
    set_addr $P261, control_260
    $P261."handle_types"(58)
    push_eh $P261
    .lex "$object", param_262
    .lex "$method", param_263
    .lex "@args", param_264
    .lex "%opts", param_265

			.local pmc object, meth, args, opts
			object	= find_lex '$object'
			meth	= find_lex '$method'
			args	= find_lex '@args'
			opts	= find_lex '%opts'
			
			$I0 = isa meth, 'Sub'
			unless $I0 goto call_string
			
			$P266 = object.meth(args :flat, opts :named :flat)
			goto done
			
		call_string:
			$S0 = meth
			$P266 = object.$S0(args :flat, opts :named :flat)
			
		done:
		
    .lex "$result", $P266
    new $P267, "Exception"
    set $P267['type'], 58
    find_lex $P268, "$result"
    unless_null $P268, vivify_193
    new $P268, "Undef"
  vivify_193:
    setattribute $P267, 'payload', $P268
    throw $P267
    .return ()
  control_260:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P269, exception, "payload"
    .return ($P269)
    rethrow exception
.end


.namespace ["Class"]
.sub "call_onload_of_class"  :subid("35_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_273
    .const 'Sub' $P309 = "38_1256283593.06656" 
    capture_lex $P309
    .const 'Sub' $P303 = "37_1256283593.06656" 
    capture_lex $P303
    .const 'Sub' $P286 = "36_1256283593.06656" 
    capture_lex $P286
    new $P272, 'ExceptionHandler'
    set_addr $P272, control_271
    $P272."handle_types"(58)
    push_eh $P272
    .lex "$class", param_273
    find_lex $P274, "$class"
    unless_null $P274, vivify_194
    new $P274, "Undef"
  vivify_194:
    set $S275, $P274
    new $P276, 'String'
    set $P276, $S275
    .lex "$classname", $P276
    new $P278, "Integer"
    assign $P278, 1
    neg $P279, $P278
    set $I280, $P279
    find_lex $P281, "$classname"
    unless_null $P281, vivify_195
    new $P281, "ResizablePMCArray"
  vivify_195:
    set $P282, $P281[$I280]
    unless_null $P282, vivify_196
    new $P282, "Undef"
  vivify_196:
    set $S283, $P282
    iseq $I284, $S283, ")"
    unless $I284, if_277_end
    .const 'Sub' $P286 = "36_1256283593.06656" 
    capture_lex $P286
    $P286()
  if_277_end:
    find_lex $P292, "$classname"
    unless_null $P292, vivify_198
    new $P292, "Undef"
  vivify_198:
    set $S293, $P292
    new $P294, 'String'
    set $P294, $S293
    concat $P295, $P294, "::_ONLOAD"
    .lex "$sub_name", $P295
    get_hll_global $P296, ["Parrot"], "get_sub"
    find_lex $P297, "$sub_name"
    unless_null $P297, vivify_199
    new $P297, "Undef"
  vivify_199:
    $P298 = $P296($P297)
    .lex "&onload", $P298
    find_lex $P301, "&onload"
    unless_null $P301, vivify_200
    new $P301, "Undef"
  vivify_200:
    if $P301, if_300
    .const 'Sub' $P309 = "38_1256283593.06656" 
    capture_lex $P309
    $P312 = $P309()
    set $P299, $P312
    goto if_300_end
  if_300:
    .const 'Sub' $P303 = "37_1256283593.06656" 
    capture_lex $P303
    $P307 = $P303()
    set $P299, $P307
  if_300_end:
    .return ($P299)
  control_271:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P313, exception, "payload"
    .return ($P313)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block285"  :anon :subid("36_1256283593.06656") :outer("35_1256283593.06656")
    get_hll_global $P287, ["String"], "substr"
    find_lex $P288, "$classname"
    unless_null $P288, vivify_197
    new $P288, "Undef"
  vivify_197:
    new $P289, "Integer"
    assign $P289, 2
    neg $P290, $P289
    $P291 = $P287($P288, 0, $P290)
    store_lex "$classname", $P291
    .return ($P291)
.end


.namespace ["Class"]
.sub "_block308"  :anon :subid("38_1256283593.06656") :outer("35_1256283593.06656")
    find_lex $P310, "$classname"
    unless_null $P310, vivify_201
    new $P310, "Undef"
  vivify_201:
    $P311 = "NOTE"("No onload sub for: ", $P310)
    .return ($P311)
.end


.namespace ["Class"]
.sub "_block302"  :anon :subid("37_1256283593.06656") :outer("35_1256283593.06656")
    find_lex $P304, "&onload"
    unless_null $P304, vivify_202
    new $P304, "Undef"
  vivify_202:
    $P304()
    find_lex $P305, "$classname"
    unless_null $P305, vivify_203
    new $P305, "Undef"
  vivify_203:
    $P306 = "NOTE"("Onload-ed: ", $P305)
    .return ($P306)
.end


.namespace ["Class"]
.sub "_class_info"  :subid("39_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_317
    .const 'Sub' $P329 = "41_1256283593.06656" 
    capture_lex $P329
    .const 'Sub' $P321 = "40_1256283593.06656" 
    capture_lex $P321
    new $P316, 'ExceptionHandler'
    set_addr $P316, control_315
    $P316."handle_types"(58)
    push_eh $P316
    .lex "$class_name", param_317
    get_global $P319, "$Onload_done"
    unless_null $P319, vivify_204
    new $P319, "Undef"
  vivify_204:
    if $P319, unless_318_end
    .const 'Sub' $P321 = "40_1256283593.06656" 
    capture_lex $P321
    $P321()
  unless_318_end:
    find_lex $P325, "$class_name"
    unless_null $P325, vivify_205
    new $P325, "Undef"
  vivify_205:
    get_global $P326, "%Class_info"
    unless_null $P326, vivify_206
    new $P326, "Hash"
  vivify_206:
    set $P327, $P326[$P325]
    unless_null $P327, vivify_207
    new $P327, "Undef"
  vivify_207:
    if $P327, unless_324_end
    .const 'Sub' $P329 = "41_1256283593.06656" 
    capture_lex $P329
    $P329()
  unless_324_end:
    new $P340, "Exception"
    set $P340['type'], 58
    find_lex $P341, "$class_name"
    unless_null $P341, vivify_214
    new $P341, "Undef"
  vivify_214:
    get_global $P342, "%Class_info"
    unless_null $P342, vivify_215
    new $P342, "Hash"
  vivify_215:
    set $P343, $P342[$P341]
    unless_null $P343, vivify_216
    new $P343, "Undef"
  vivify_216:
    setattribute $P340, 'payload', $P343
    throw $P340
    .return ()
  control_315:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P344, exception, "payload"
    .return ($P344)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block320"  :anon :subid("40_1256283593.06656") :outer("39_1256283593.06656")
    get_hll_global $P322, ["Class"], "_ONLOAD"
    $P323 = $P322()
    .return ($P323)
.end


.namespace ["Class"]
.sub "_block328"  :anon :subid("41_1256283593.06656") :outer("39_1256283593.06656")
    get_hll_global $P330, ["Hash"], "new"
    $P331 = $P330()
    find_lex $P332, "$class_name"
    unless_null $P332, vivify_208
    new $P332, "Undef"
  vivify_208:
    get_global $P333, "%Class_info"
    unless_null $P333, vivify_209
    new $P333, "Hash"
    set_global "%Class_info", $P333
  vivify_209:
    set $P333[$P332], $P331
    find_lex $P334, "$class_name"
    unless_null $P334, vivify_210
    new $P334, "Undef"
  vivify_210:
    get_global $P335, "%Class_info"
    unless_null $P335, vivify_211
    new $P335, "Hash"
  vivify_211:
    set $P336, $P335[$P334]
    unless_null $P336, vivify_212
    new $P336, "Undef"
  vivify_212:
    .lex "$info", $P336
    get_hll_global $P337, ["Hash"], "empty"
    $P338 = $P337()
    find_lex $P339, "$info"
    unless_null $P339, vivify_213
    new $P339, "Hash"
    store_lex "$info", $P339
  vivify_213:
    set $P339["multisubs"], $P338
    .return ($P338)
.end


.namespace ["Class"]
.sub "compile_default_multi"  :subid("42_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_348
    .param pmc param_349
    .param pmc param_350 :optional :named("is_method")
    .param int has_param_350 :opt_flag
    .const 'Sub' $P378 = "44_1256283593.06656" 
    capture_lex $P378
    .const 'Sub' $P368 = "43_1256283593.06656" 
    capture_lex $P368
    new $P347, 'ExceptionHandler'
    set_addr $P347, control_346
    $P347."handle_types"(58)
    push_eh $P347
    .lex "$class_name", param_348
    .lex "$multi_name", param_349
    if has_param_350, optparam_217
    new $P351, "Undef"
    set param_350, $P351
  optparam_217:
    .lex "$is_method", param_350
    find_lex $P354, "$is_method"
    unless_null $P354, vivify_218
    new $P354, "Undef"
  vivify_218:
    if $P354, if_353
    new $P356, "String"
    assign $P356, "multisub"
    set $P352, $P356
    goto if_353_end
  if_353:
    new $P355, "String"
    assign $P355, "multimethod"
    set $P352, $P355
  if_353_end:
    .lex "$kind", $P352
    find_lex $P357, "$kind"
    unless_null $P357, vivify_219
    new $P357, "Undef"
  vivify_219:
    find_lex $P358, "$class_name"
    unless_null $P358, vivify_220
    new $P358, "Undef"
  vivify_220:
    find_lex $P359, "$multi_name"
    unless_null $P359, vivify_221
    new $P359, "Undef"
  vivify_221:
    "NOTE"("Compiling default ", $P357, " for: ", $P358, " :: ", $P359)
    "NOTE"("Looking for fallback method in parent class(es)")
    get_hll_global $P360, ["Class"], "find_method_named"
    find_lex $P361, "$class_name"
    unless_null $P361, vivify_222
    new $P361, "Undef"
  vivify_222:
    find_lex $P362, "$multi_name"
    unless_null $P362, vivify_223
    new $P362, "Undef"
  vivify_223:
    $P363 = $P360($P361, $P362)
    .lex "$default_method", $P363
    new $P372, 'ExceptionHandler'
    set_addr $P372, loop371_handler
    $P372."handle_types"(65, 67, 66)
    push_eh $P372
  loop371_test:
    get_hll_global $P364, ["Parrot"], "isa"
    find_lex $P365, "$default_method"
    unless_null $P365, vivify_224
    new $P365, "Undef"
  vivify_224:
    $P366 = $P364($P365, "MultiSub")
    unless $P366, loop371_done
  loop371_redo:
    .const 'Sub' $P368 = "43_1256283593.06656" 
    capture_lex $P368
    $P368()
  loop371_next:
    goto loop371_test
  loop371_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P373, exception, 'type'
    eq $P373, 65, loop371_next
    eq $P373, 67, loop371_redo
  loop371_done:
    pop_eh 
    new $P374, "ResizablePMCArray"
    .lex "@actions", $P374
    find_lex $P376, "$default_method"
    unless_null $P376, vivify_227
    new $P376, "Undef"
  vivify_227:
    if $P376, unless_375_end
    .const 'Sub' $P378 = "44_1256283593.06656" 
    capture_lex $P378
    $P378()
  unless_375_end:
    find_lex $P381, "$class_name"
    unless_null $P381, vivify_229
    new $P381, "Undef"
  vivify_229:
    find_lex $P382, "$multi_name"
    unless_null $P382, vivify_230
    new $P382, "Undef"
  vivify_230:
    find_lex $P383, "@actions"
    unless_null $P383, vivify_231
    new $P383, "ResizablePMCArray"
  vivify_231:
    find_lex $P384, "$is_method"
    unless_null $P384, vivify_232
    new $P384, "Undef"
  vivify_232:
    find_lex $P385, "$default_method"
    unless_null $P385, vivify_233
    new $P385, "Undef"
  vivify_233:
    $P386 = "compile_multi"($P381, $P382, $P383 :named("actions"), $P384 :named("is_method"), $P385 :named("target"))
    .return ($P386)
  control_346:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P387, exception, "payload"
    .return ($P387)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block367"  :anon :subid("43_1256283593.06656") :outer("42_1256283593.06656")
    "NOTE"("I don't think nesting multisubs is possible, but...")
    find_lex $P369, "$default_method"
    unless_null $P369, vivify_225
    new $P369, "ResizablePMCArray"
  vivify_225:
    set $P370, $P369[0]
    unless_null $P370, vivify_226
    new $P370, "Undef"
  vivify_226:
    store_lex "$default_method", $P370
    .return ($P370)
.end


.namespace ["Class"]
.sub "_block377"  :anon :subid("44_1256283593.06656") :outer("42_1256283593.06656")
    find_lex $P379, "@actions"
    unless_null $P379, vivify_228
    new $P379, "ResizablePMCArray"
  vivify_228:
    $P380 = $P379."push"("die 'No method available that will accept the parameters given'")
    .return ($P380)
.end


.namespace ["Class"]
.sub "compile_multi"  :subid("45_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_391
    .param pmc param_392
    .param pmc param_393 :slurpy
    .param pmc param_394 :optional :named("target")
    .param int has_param_394 :opt_flag
    .param pmc param_396 :optional :named("actions")
    .param int has_param_396 :opt_flag
    .param pmc param_398 :optional :named("is_method")
    .param int has_param_398 :opt_flag
    .const 'Sub' $P429 = "47_1256283593.06656" 
    capture_lex $P429
    .const 'Sub' $P414 = "46_1256283593.06656" 
    capture_lex $P414
    new $P390, 'ExceptionHandler'
    set_addr $P390, control_389
    $P390."handle_types"(58)
    push_eh $P390
    .lex "$class_name", param_391
    .lex "$multi_name", param_392
    .lex "@param_types", param_393
    if has_param_394, optparam_234
    new $P395, "Undef"
    set param_394, $P395
  optparam_234:
    .lex "$target", param_394
    if has_param_396, optparam_235
    new $P397, "Undef"
    set param_396, $P397
  optparam_235:
    .lex "@actions", param_396
    if has_param_398, optparam_236
    new $P399, "Undef"
    set param_398, $P399
  optparam_236:
    .lex "$is_method", param_398
    find_lex $P402, "$is_method"
    unless_null $P402, vivify_237
    new $P402, "Undef"
  vivify_237:
    if $P402, if_401
    new $P404, "String"
    assign $P404, "multisub"
    set $P400, $P404
    goto if_401_end
  if_401:
    new $P403, "String"
    assign $P403, "multimethod"
    set $P400, $P403
  if_401_end:
    .lex "$kind", $P400
    find_lex $P405, "$kind"
    unless_null $P405, vivify_238
    new $P405, "Undef"
  vivify_238:
    find_lex $P406, "$class_name"
    unless_null $P406, vivify_239
    new $P406, "Undef"
  vivify_239:
    find_lex $P407, "$multi_name"
    unless_null $P407, vivify_240
    new $P407, "Undef"
  vivify_240:
    find_lex $P408, "@param_types"
    unless_null $P408, vivify_241
    new $P408, "ResizablePMCArray"
  vivify_241:
    $P409 = $P408."join"(", ")
    find_lex $P410, "$target"
    unless_null $P410, vivify_242
    new $P410, "Undef"
  vivify_242:
    "NOTE"("Compiling ", $P405, " trampoline [", $P406, "::", $P407, "(", $P409, ", ...) -> ", $P410)
    find_lex $P412, "$is_method"
    unless_null $P412, vivify_243
    new $P412, "Undef"
  vivify_243:
    unless $P412, if_411_end
    .const 'Sub' $P414 = "46_1256283593.06656" 
    capture_lex $P414
    $P414()
  if_411_end:
    find_lex $P417, "$class_name"
    unless_null $P417, vivify_245
    new $P417, "Undef"
  vivify_245:
    $P418 = "_class_info"($P417)
    .lex "$class_info", $P418
    find_lex $P419, "@param_types"
    unless_null $P419, vivify_246
    new $P419, "ResizablePMCArray"
  vivify_246:
    $P420 = "signature"($P419)
    .lex "$signature", $P420
    find_lex $P422, "$signature"
    unless_null $P422, vivify_247
    new $P422, "Undef"
  vivify_247:
    find_lex $P423, "$multi_name"
    unless_null $P423, vivify_248
    new $P423, "Undef"
  vivify_248:
    find_lex $P424, "$class_info"
    unless_null $P424, vivify_249
    new $P424, "Hash"
  vivify_249:
    set $P425, $P424["multisubs"]
    unless_null $P425, vivify_250
    new $P425, "Hash"
  vivify_250:
    set $P426, $P425[$P423]
    unless_null $P426, vivify_251
    new $P426, "Hash"
  vivify_251:
    set $P427, $P426[$P422]
    unless_null $P427, vivify_252
    new $P427, "Undef"
  vivify_252:
    unless $P427, if_421_end
    .const 'Sub' $P429 = "47_1256283593.06656" 
    capture_lex $P429
    $P429()
  if_421_end:
    new $P432, "Integer"
    assign $P432, 1
    find_lex $P433, "$signature"
    unless_null $P433, vivify_253
    new $P433, "Undef"
  vivify_253:
    find_lex $P434, "$multi_name"
    unless_null $P434, vivify_254
    new $P434, "Undef"
  vivify_254:
    find_lex $P435, "$class_info"
    unless_null $P435, vivify_255
    new $P435, "Hash"
    store_lex "$class_info", $P435
  vivify_255:
    set $P436, $P435["multisubs"]
    unless_null $P436, vivify_256
    new $P436, "Hash"
    set $P435["multisubs"], $P436
  vivify_256:
    set $P437, $P436[$P434]
    unless_null $P437, vivify_257
    new $P437, "Hash"
    set $P436[$P434], $P437
  vivify_257:
    set $P437[$P433], $P432
    find_lex $P438, "$class_name"
    unless_null $P438, vivify_258
    new $P438, "Undef"
  vivify_258:
    find_lex $P439, "$multi_name"
    unless_null $P439, vivify_259
    new $P439, "Undef"
  vivify_259:
    find_lex $P440, "@actions"
    unless_null $P440, vivify_260
    new $P440, "ResizablePMCArray"
  vivify_260:
    new $P441, "String"
    assign $P441, ":multi("
    find_lex $P442, "$signature"
    unless_null $P442, vivify_261
    new $P442, "Undef"
  vivify_261:
    concat $P443, $P441, $P442
    concat $P444, $P443, ")"
    find_lex $P447, "$is_method"
    unless_null $P447, vivify_262
    new $P447, "Undef"
  vivify_262:
    if $P447, if_446
    set $S445, ""
    goto if_446_end
  if_446:
    set $S445, " :method"
  if_446_end:
    concat $P448, $P444, $S445
    find_lex $P449, "$is_method"
    unless_null $P449, vivify_263
    new $P449, "Undef"
  vivify_263:
    find_lex $P450, "$target"
    unless_null $P450, vivify_264
    new $P450, "Undef"
  vivify_264:
    $P451 = "trampoline"($P438, $P439, $P440 :named("actions"), $P448 :named("adverbs"), $P449 :named("is_method"), $P450 :named("target"))
    .return ($P451)
  control_389:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P452, exception, "payload"
    .return ($P452)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block413"  :anon :subid("46_1256283593.06656") :outer("45_1256283593.06656")
    find_lex $P415, "@param_types"
    unless_null $P415, vivify_244
    new $P415, "ResizablePMCArray"
  vivify_244:
    $P416 = $P415."unshift"("_")
    .return ($P416)
.end


.namespace ["Class"]
.sub "_block428"  :anon :subid("47_1256283593.06656") :outer("45_1256283593.06656")
    "NOTE"("This trampoline has already been compiled.")
    new $P430, "Exception"
    set $P430['type'], 58
    new $P431, "Integer"
    assign $P431, 0
    setattribute $P430, 'payload', $P431
    throw $P430
    .return ()
.end


.namespace ["Class"]
.sub "dispatch_method"  :subid("48_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_456
    .param pmc param_457
    .param pmc param_458
    .param pmc param_459
    .const 'Sub' $P483 = "51_1256283593.06656" 
    capture_lex $P483
    .const 'Sub' $P476 = "50_1256283593.06656" 
    capture_lex $P476
    .const 'Sub' $P470 = "49_1256283593.06656" 
    capture_lex $P470
    new $P455, 'ExceptionHandler'
    set_addr $P455, control_454
    $P455."handle_types"(58)
    push_eh $P455
    .lex "$object", param_456
    .lex "%dispatch", param_457
    .lex "@args", param_458
    .lex "%opts", param_459
    new $P460, "Undef"
    .lex "$type", $P460
    find_lex $P461, "$object"
    unless_null $P461, vivify_265
    new $P461, "Undef"
  vivify_265:
    "NOTE"("Dispatching method of ", $P461, " based on type of first arg.")
    find_lex $P462, "$object"
    unless_null $P462, vivify_266
    new $P462, "Undef"
  vivify_266:
    find_lex $P463, "%dispatch"
    unless_null $P463, vivify_267
    new $P463, "Hash"
  vivify_267:
    find_lex $P464, "@args"
    unless_null $P464, vivify_268
    new $P464, "ResizablePMCArray"
  vivify_268:
    find_lex $P465, "%opts"
    unless_null $P465, vivify_269
    new $P465, "Hash"
  vivify_269:
    "DUMP"($P462, $P463, $P464, $P465)
    find_lex $P467, "@args"
    unless_null $P467, vivify_270
    new $P467, "ResizablePMCArray"
  vivify_270:
    set $N468, $P467
    if $N468, if_466
    .const 'Sub' $P476 = "50_1256283593.06656" 
    capture_lex $P476
    $P476()
    goto if_466_end
  if_466:
    .const 'Sub' $P470 = "49_1256283593.06656" 
    capture_lex $P470
    $P470()
  if_466_end:
    find_lex $P479, "$type"
    unless_null $P479, vivify_273
    new $P479, "Undef"
  vivify_273:
    find_lex $P480, "%dispatch"
    unless_null $P480, vivify_274
    new $P480, "Hash"
  vivify_274:
    set $P481, $P480[$P479]
    unless_null $P481, vivify_275
    new $P481, "Undef"
  vivify_275:
    .lex "$method_name", $P481
    if $P481, unless_478_end
    .const 'Sub' $P483 = "51_1256283593.06656" 
    capture_lex $P483
    $P483()
  unless_478_end:
    find_lex $P486, "$method_name"
    unless_null $P486, vivify_278
    new $P486, "Undef"
  vivify_278:
    find_lex $P487, "$type"
    unless_null $P487, vivify_279
    new $P487, "Undef"
  vivify_279:
    "ASSERT"($P486, "Unable to dispatch method for type ", $P487)
    new $P488, "Exception"
    set $P488['type'], 58
    find_lex $P489, "$object"
    unless_null $P489, vivify_280
    new $P489, "Undef"
  vivify_280:
    find_lex $P490, "$method_name"
    unless_null $P490, vivify_281
    new $P490, "Undef"
  vivify_281:
    find_lex $P491, "@args"
    unless_null $P491, vivify_282
    new $P491, "ResizablePMCArray"
  vivify_282:
    find_lex $P492, "%opts"
    unless_null $P492, vivify_283
    new $P492, "Hash"
  vivify_283:
    $P493 = "call_method_"($P489, $P490, $P491, $P492)
    setattribute $P488, 'payload', $P493
    throw $P488
    .return ()
  control_454:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P494, exception, "payload"
    .return ($P494)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block475"  :anon :subid("50_1256283593.06656") :outer("48_1256283593.06656")
    new $P477, "String"
    assign $P477, "NULLARY"
    store_lex "$type", $P477
    .return ($P477)
.end


.namespace ["Class"]
.sub "_block469"  :anon :subid("49_1256283593.06656") :outer("48_1256283593.06656")
    get_hll_global $P471, ["Class"], "name_of"
    find_lex $P472, "@args"
    unless_null $P472, vivify_271
    new $P472, "ResizablePMCArray"
  vivify_271:
    set $P473, $P472[0]
    unless_null $P473, vivify_272
    new $P473, "Undef"
  vivify_272:
    $P474 = $P471($P473, "" :named("delimiter"))
    store_lex "$type", $P474
    .return ($P474)
.end


.namespace ["Class"]
.sub "_block482"  :anon :subid("51_1256283593.06656") :outer("48_1256283593.06656")
    find_lex $P484, "%dispatch"
    unless_null $P484, vivify_276
    new $P484, "Hash"
  vivify_276:
    set $P485, $P484["DEFAULT"]
    unless_null $P485, vivify_277
    new $P485, "Undef"
  vivify_277:
    store_lex "$method_name", $P485
    .return ($P485)
.end


.namespace ["Class"]
.sub "find_class_named"  :subid("52_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_498
    .const 'Sub' $P507 = "53_1256283593.06656" 
    capture_lex $P507
    new $P497, 'ExceptionHandler'
    set_addr $P497, control_496
    $P497."handle_types"(58)
    push_eh $P497
    .lex "$class_name", param_498
    get_hll_global $P499, ["Parrot"], "get_class"
    find_lex $P500, "$class_name"
    unless_null $P500, vivify_284
    new $P500, "Undef"
  vivify_284:
    $P501 = $P499($P500)
    .lex "$class", $P501
    get_hll_global $P503, ["Parrot"], "defined"
    find_lex $P504, "$class"
    unless_null $P504, vivify_285
    new $P504, "Undef"
  vivify_285:
    $P505 = $P503($P504)
    if $P505, unless_502_end
    .const 'Sub' $P507 = "53_1256283593.06656" 
    capture_lex $P507
    $P507()
  unless_502_end:
    new $P513, "Exception"
    set $P513['type'], 58
    find_lex $P514, "$class"
    unless_null $P514, vivify_287
    new $P514, "Undef"
  vivify_287:
    setattribute $P513, 'payload', $P514
    throw $P513
    .return ()
  control_496:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P515, exception, "payload"
    .return ($P515)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block506"  :anon :subid("53_1256283593.06656") :outer("52_1256283593.06656")
    get_hll_global $P508, ["Parrot"], "get_class"
    get_hll_global $P509, ["Parrot"], "get_namespace"
    find_lex $P510, "$class_name"
    unless_null $P510, vivify_286
    new $P510, "Undef"
  vivify_286:
    $P511 = $P509($P510)
    $P512 = $P508($P511)
    store_lex "$class", $P512
    .return ($P512)
.end


.namespace ["Class"]
.sub "find_method_named"  :subid("54_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_519
    .param pmc param_520
    .const 'Sub' $P544 = "57_1256283593.06656" 
    capture_lex $P544
    .const 'Sub' $P536 = "56_1256283593.06656" 
    capture_lex $P536
    .const 'Sub' $P526 = "55_1256283593.06656" 
    capture_lex $P526
    new $P518, 'ExceptionHandler'
    set_addr $P518, control_517
    $P518."handle_types"(58)
    push_eh $P518
    .lex "$class", param_519
    .lex "$method", param_520
    get_hll_global $P522, ["Parrot"], "isa"
    find_lex $P523, "$class"
    unless_null $P523, vivify_288
    new $P523, "Undef"
  vivify_288:
    $P524 = $P522($P523, "String")
    if $P524, if_521
    get_hll_global $P531, ["Parrot"], "isa"
    find_lex $P532, "$class"
    unless_null $P532, vivify_289
    new $P532, "Undef"
  vivify_289:
    $P533 = $P531($P532, "Class")
    isfalse $I534, $P533
    if $I534, if_530
    .const 'Sub' $P544 = "57_1256283593.06656" 
    capture_lex $P544
    $P544()
    goto if_530_end
  if_530:
    .const 'Sub' $P536 = "56_1256283593.06656" 
    capture_lex $P536
    $P536()
  if_530_end:
    goto if_521_end
  if_521:
    .const 'Sub' $P526 = "55_1256283593.06656" 
    capture_lex $P526
    $P526()
  if_521_end:
    find_lex $P547, "$class"
    unless_null $P547, vivify_296
    new $P547, "Undef"
  vivify_296:
    find_lex $P548, "$method"
    unless_null $P548, vivify_297
    new $P548, "Undef"
  vivify_297:
    $P549 = $P547."find_method"($P548)
    .lex "$result", $P549
    new $P550, "Exception"
    set $P550['type'], 58
    find_lex $P551, "$result"
    unless_null $P551, vivify_298
    new $P551, "Undef"
  vivify_298:
    setattribute $P550, 'payload', $P551
    throw $P550
    .return ()
  control_517:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P552, exception, "payload"
    .return ($P552)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block543"  :anon :subid("57_1256283593.06656") :outer("54_1256283593.06656")
    find_lex $P545, "$class"
    unless_null $P545, vivify_290
    new $P545, "Undef"
  vivify_290:
    $P546 = "NOTE"("Got Class PMC: ", $P545)
    .return ($P546)
.end


.namespace ["Class"]
.sub "_block535"  :anon :subid("56_1256283593.06656") :outer("54_1256283593.06656")
    find_lex $P537, "$class"
    unless_null $P537, vivify_291
    new $P537, "Undef"
  vivify_291:
    "NOTE"("Got object PMC: ", $P537)
    get_hll_global $P538, ["Parrot"], "typeof"
    find_lex $P539, "$class"
    unless_null $P539, vivify_292
    new $P539, "Undef"
  vivify_292:
    $P540 = $P538($P539)
    store_lex "$class", $P540
    find_lex $P541, "$class"
    unless_null $P541, vivify_293
    new $P541, "Undef"
  vivify_293:
    $P542 = "NOTE"("Resolved to Class PMC: ", $P541)
    .return ($P542)
.end


.namespace ["Class"]
.sub "_block525"  :anon :subid("55_1256283593.06656") :outer("54_1256283593.06656")
    find_lex $P527, "$class"
    unless_null $P527, vivify_294
    new $P527, "Undef"
  vivify_294:
    "NOTE"("Got class name: ", $P527)
    find_lex $P528, "$class"
    unless_null $P528, vivify_295
    new $P528, "Undef"
  vivify_295:
    $P529 = "find_class_named"($P528)
    store_lex "$class", $P529
    .return ($P529)
.end


.namespace ["Class"]
.sub "get_meta"  :subid("58_1256283593.06656") :outer("11_1256283593.06656")
    .const 'Sub' $P562 = "59_1256283593.06656" 
    capture_lex $P562
    new $P555, 'ExceptionHandler'
    set_addr $P555, control_554
    $P555."handle_types"(58)
    push_eh $P555
    get_global $P556, "$meta"
    unless_null $P556, vivify_299
    new $P556, "Undef"
  vivify_299:
    get_hll_global $P558, ["Parrot"], "defined"
    get_global $P559, "$meta"
    unless_null $P559, vivify_300
    new $P559, "Undef"
  vivify_300:
    $P560 = $P558($P559)
    if $P560, unless_557_end
    .const 'Sub' $P562 = "59_1256283593.06656" 
    capture_lex $P562
    $P562()
  unless_557_end:
    new $P564, "Exception"
    set $P564['type'], 58
    get_global $P565, "$meta"
    unless_null $P565, vivify_301
    new $P565, "Undef"
  vivify_301:
    setattribute $P564, 'payload', $P565
    throw $P564
    .return ()
  control_554:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P566, exception, "payload"
    .return ($P566)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block561"  :anon :subid("59_1256283593.06656") :outer("58_1256283593.06656")
 $P563 = new 'P6metaclass' 
    set_global "$meta", $P563
    .return ($P563)
.end


.namespace ["Class"]
.sub "get_method_list"  :subid("60_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_570
    .const 'Sub' $P579 = "61_1256283593.06656" 
    capture_lex $P579
    new $P569, 'ExceptionHandler'
    set_addr $P569, control_568
    $P569."handle_types"(58)
    push_eh $P569
    .lex "$obj", param_570
    get_hll_global $P571, ["Class"], "of"
    find_lex $P572, "$obj"
    unless_null $P572, vivify_302
    new $P572, "Undef"
  vivify_302:
    $P573 = $P571($P572)
    .lex "$class", $P573
    get_hll_global $P575, ["Parrot"], "defined"
    find_lex $P576, "$class"
    unless_null $P576, vivify_303
    new $P576, "Undef"
  vivify_303:
    $P577 = $P575($P576)
    if $P577, unless_574_end
    .const 'Sub' $P579 = "61_1256283593.06656" 
    capture_lex $P579
    $P579()
  unless_574_end:
    find_lex $P581, "$class"
    unless_null $P581, vivify_304
    new $P581, "Undef"
  vivify_304:
    $P582 = $P581."methods"()
    $P583 = $P582."keys"()
    .lex "@methods", $P583
    new $P584, "Exception"
    set $P584['type'], 58
    find_lex $P585, "@methods"
    unless_null $P585, vivify_305
    new $P585, "ResizablePMCArray"
  vivify_305:
    setattribute $P584, 'payload', $P585
    throw $P584
    .return ()
  control_568:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P586, exception, "payload"
    .return ($P586)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block578"  :anon :subid("61_1256283593.06656") :outer("60_1256283593.06656")
    $P580 = "die"("No class. Don't know what to do.")
    .return ($P580)
.end


.namespace ["Class"]
.sub "multi_method"  :subid("62_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_590
    .param pmc param_591
    .param pmc param_592 :optional :named("starting_with")
    .param int has_param_592 :opt_flag
    new $P589, 'ExceptionHandler'
    set_addr $P589, control_588
    $P589."handle_types"(58)
    push_eh $P589
    .lex "$class_name", param_590
    .lex "$multi_name", param_591
    if has_param_592, optparam_306
    new $P593, "Undef"
    set param_592, $P593
  optparam_306:
    .lex "$starting_with", param_592
    find_lex $P594, "$class_name"
    unless_null $P594, vivify_307
    new $P594, "Undef"
  vivify_307:
    find_lex $P595, "$multi_name"
    unless_null $P595, vivify_308
    new $P595, "Undef"
  vivify_308:
    find_lex $P596, "$starting_with"
    unless_null $P596, vivify_309
    new $P596, "Undef"
  vivify_309:
    $P597 = "multi_sub"($P594, $P595, $P596 :named("starting_with"), 1 :named("is_method"))
    .return ($P597)
  control_588:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P598, exception, "payload"
    .return ($P598)
    rethrow exception
.end


.namespace ["Class"]
.sub "multi_sub"  :subid("63_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_602
    .param pmc param_603
    .param pmc param_604 :optional :named("starting_with")
    .param int has_param_604 :opt_flag
    .param pmc param_606 :optional :named("is_method")
    .param int has_param_606 :opt_flag
    .const 'Sub' $P691 = "68_1256283593.06656" 
    capture_lex $P691
    .const 'Sub' $P651 = "66_1256283593.06656" 
    capture_lex $P651
    .const 'Sub' $P640 = "65_1256283593.06656" 
    capture_lex $P640
    .const 'Sub' $P623 = "64_1256283593.06656" 
    capture_lex $P623
    new $P601, 'ExceptionHandler'
    set_addr $P601, control_600
    $P601."handle_types"(58)
    push_eh $P601
    .lex "$class_name", param_602
    .lex "$multi_name", param_603
    if has_param_604, optparam_310
    new $P605, "Undef"
    set param_604, $P605
  optparam_310:
    .lex "$starting_with", param_604
    if has_param_606, optparam_311
    new $P607, "Undef"
    set param_606, $P607
  optparam_311:
    .lex "$is_method", param_606
    find_lex $P610, "$is_method"
    unless_null $P610, vivify_312
    new $P610, "Undef"
  vivify_312:
    if $P610, if_609
    new $P612, "String"
    assign $P612, "multisub"
    set $P608, $P612
    goto if_609_end
  if_609:
    new $P611, "String"
    assign $P611, "multimethod"
    set $P608, $P611
  if_609_end:
    .lex "$kind", $P608
    find_lex $P613, "$kind"
    unless_null $P613, vivify_313
    new $P613, "Undef"
  vivify_313:
    find_lex $P614, "$multi_name"
    unless_null $P614, vivify_314
    new $P614, "Undef"
  vivify_314:
    find_lex $P615, "$class_name"
    unless_null $P615, vivify_315
    new $P615, "Undef"
  vivify_315:
    find_lex $P616, "$starting_with"
    unless_null $P616, vivify_316
    new $P616, "Undef"
  vivify_316:
    "NOTE"("Creating new ", $P613, " '", $P614, "' for class ", $P615, ", out of methods starting with ", $P616)
    find_lex $P617, "$class_name"
    unless_null $P617, vivify_317
    new $P617, "Undef"
  vivify_317:
    $P618 = "_class_info"($P617)
    .lex "$class_info", $P618
    find_lex $P620, "$class_info"
    unless_null $P620, vivify_318
    new $P620, "Hash"
  vivify_318:
    set $P621, $P620["created"]
    unless_null $P621, vivify_319
    new $P621, "Undef"
  vivify_319:
    if $P621, unless_619_end
    .const 'Sub' $P623 = "64_1256283593.06656" 
    capture_lex $P623
    $P623()
  unless_619_end:
    find_lex $P626, "$class_info"
    unless_null $P626, vivify_321
    new $P626, "Undef"
  vivify_321:
    "DUMP"($P626)
    get_hll_global $P627, ["Parrot"], "get_namespace"
    find_lex $P628, "$class_name"
    unless_null $P628, vivify_322
    new $P628, "Undef"
  vivify_322:
    $P629 = $P627($P628)
    .lex "$nsp", $P629
    find_lex $P630, "$starting_with"
    unless_null $P630, vivify_323
    new $P630, "Undef"
  vivify_323:
    $P631 = $P630."length"()
    .lex "$prefix_len", $P631
    get_hll_global $P633, ["Parrot"], "defined"
    find_lex $P634, "$multi_name"
    unless_null $P634, vivify_324
    new $P634, "Undef"
  vivify_324:
    find_lex $P635, "$class_info"
    unless_null $P635, vivify_325
    new $P635, "Hash"
  vivify_325:
    set $P636, $P635["multisubs"]
    unless_null $P636, vivify_326
    new $P636, "Hash"
  vivify_326:
    set $P637, $P636[$P634]
    unless_null $P637, vivify_327
    new $P637, "Undef"
  vivify_327:
    $P638 = $P633($P637)
    if $P638, unless_632_end
    .const 'Sub' $P640 = "65_1256283593.06656" 
    capture_lex $P640
    $P640()
  unless_632_end:
    find_lex $P647, "$nsp"
    unless_null $P647, vivify_331
    new $P647, "Undef"
  vivify_331:
    defined $I648, $P647
    unless $I648, for_undef_332
    iter $P646, $P647
    new $P683, 'ExceptionHandler'
    set_addr $P683, loop682_handler
    $P683."handle_types"(65, 67, 66)
    push_eh $P683
  loop682_test:
    unless $P646, loop682_done
    shift $P649, $P646
  loop682_redo:
    .const 'Sub' $P651 = "66_1256283593.06656" 
    capture_lex $P651
    $P651($P649)
  loop682_next:
    goto loop682_test
  loop682_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P684, exception, 'type'
    eq $P684, 65, loop682_next
    eq $P684, 67, loop682_redo
  loop682_done:
    pop_eh 
  for_undef_332:
    "NOTE"("All matching trampolines built. Adding method to class.")
    find_lex $P685, "$multi_name"
    unless_null $P685, vivify_347
    new $P685, "Undef"
  vivify_347:
    find_lex $P686, "$nsp"
    unless_null $P686, vivify_348
    new $P686, "Hash"
  vivify_348:
    set $P687, $P686[$P685]
    unless_null $P687, vivify_349
    new $P687, "Undef"
  vivify_349:
    .lex "$multi_sub", $P687
    find_lex $P689, "$is_method"
    unless_null $P689, vivify_350
    new $P689, "Undef"
  vivify_350:
    unless $P689, if_688_end
    .const 'Sub' $P691 = "68_1256283593.06656" 
    capture_lex $P691
    $P691()
  if_688_end:
    $P697 = "NOTE"("done")
    .return ($P697)
  control_600:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P698, exception, "payload"
    .return ($P698)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block622"  :anon :subid("64_1256283593.06656") :outer("63_1256283593.06656")
    find_lex $P624, "$class_name"
    unless_null $P624, vivify_320
    new $P624, "Undef"
  vivify_320:
    $P625 = "DIE"("Class '", $P624, "' has not been created yet.")
    .return ($P625)
.end


.namespace ["Class"]
.sub "_block639"  :anon :subid("65_1256283593.06656") :outer("63_1256283593.06656")
    get_hll_global $P641, ["Class"], "compile_default_multi"
    find_lex $P642, "$class_name"
    unless_null $P642, vivify_328
    new $P642, "Undef"
  vivify_328:
    find_lex $P643, "$multi_name"
    unless_null $P643, vivify_329
    new $P643, "Undef"
  vivify_329:
    find_lex $P644, "$is_method"
    unless_null $P644, vivify_330
    new $P644, "Undef"
  vivify_330:
    $P645 = $P641($P642, $P643, $P644 :named("is_method"))
    .return ($P645)
.end


.namespace ["Class"]
.sub "_block650"  :anon :subid("66_1256283593.06656") :outer("63_1256283593.06656")
    .param pmc param_652
    .const 'Sub' $P665 = "67_1256283593.06656" 
    capture_lex $P665
    .lex "$_", param_652
    find_lex $P653, "$_"
    unless_null $P653, vivify_333
    new $P653, "Undef"
  vivify_333:
    set $S654, $P653
    new $P655, 'String'
    set $P655, $S654
    .lex "$name", $P655
    find_lex $P658, "$name"
    unless_null $P658, vivify_334
    new $P658, "Undef"
  vivify_334:
    find_lex $P659, "$prefix_len"
    unless_null $P659, vivify_335
    new $P659, "Undef"
  vivify_335:
    $S660 = $P658."substr"(0, $P659)
    find_lex $P661, "$starting_with"
    unless_null $P661, vivify_336
    new $P661, "Undef"
  vivify_336:
    set $S662, $P661
    iseq $I663, $S660, $S662
    if $I663, if_657
    new $P656, 'Integer'
    set $P656, $I663
    goto if_657_end
  if_657:
    .const 'Sub' $P665 = "67_1256283593.06656" 
    capture_lex $P665
    $P681 = $P665()
    set $P656, $P681
  if_657_end:
    .return ($P656)
.end


.namespace ["Class"]
.sub "_block664"  :anon :subid("67_1256283593.06656") :outer("66_1256283593.06656")
    find_lex $P666, "$name"
    unless_null $P666, vivify_337
    new $P666, "Undef"
  vivify_337:
    find_lex $P667, "$prefix_len"
    unless_null $P667, vivify_338
    new $P667, "Undef"
  vivify_338:
    $P668 = $P666."substr"($P667)
    .lex "$param_class", $P668
    find_lex $P669, "$param_class"
    unless_null $P669, vivify_339
    new $P669, "Undef"
  vivify_339:
    $P670 = $P669."split"("_")
    $P671 = $P670."join"("::")
    .lex "$param1_class", $P671
    find_lex $P672, "$multi_name"
    unless_null $P672, vivify_340
    new $P672, "Undef"
  vivify_340:
    find_lex $P673, "$param1_class"
    unless_null $P673, vivify_341
    new $P673, "Undef"
  vivify_341:
    "NOTE"("Compiling '", $P672, "' handler for (_, ", $P673, ")")
    get_hll_global $P674, ["Class"], "compile_multi"
    find_lex $P675, "$class_name"
    unless_null $P675, vivify_342
    new $P675, "Undef"
  vivify_342:
    find_lex $P676, "$multi_name"
    unless_null $P676, vivify_343
    new $P676, "Undef"
  vivify_343:
    find_lex $P677, "$param1_class"
    unless_null $P677, vivify_344
    new $P677, "Undef"
  vivify_344:
    find_lex $P678, "$is_method"
    unless_null $P678, vivify_345
    new $P678, "Undef"
  vivify_345:
    find_lex $P679, "$name"
    unless_null $P679, vivify_346
    new $P679, "Undef"
  vivify_346:
    $P680 = $P674($P675, $P676, $P677, $P678 :named("is_method"), $P679 :named("target"))
    .return ($P680)
.end


.namespace ["Class"]
.sub "_block690"  :anon :subid("68_1256283593.06656") :outer("63_1256283593.06656")
    $P692 = "get_meta"()
    find_lex $P693, "$class_name"
    unless_null $P693, vivify_351
    new $P693, "Undef"
  vivify_351:
    find_lex $P694, "$multi_name"
    unless_null $P694, vivify_352
    new $P694, "Undef"
  vivify_352:
    find_lex $P695, "$multi_sub"
    unless_null $P695, vivify_353
    new $P695, "Undef"
  vivify_353:
    $P696 = $P692."add_method"($P693, $P694, $P695)
    .return ($P696)
.end


.namespace ["Class"]
.sub "name_of"  :subid("69_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_702
    .param pmc param_703 :optional :named("delimiter")
    .param int has_param_703 :opt_flag
    .const 'Sub' $P710 = "70_1256283593.06656" 
    capture_lex $P710
    new $P701, 'ExceptionHandler'
    set_addr $P701, control_700
    $P701."handle_types"(58)
    push_eh $P701
    .lex "$object", param_702
    if has_param_703, optparam_354
    new $P704, "Undef"
    set param_703, $P704
  optparam_354:
    .lex "$delimiter", param_703
    get_hll_global $P706, ["Parrot"], "defined"
    find_lex $P707, "$delimiter"
    unless_null $P707, vivify_355
    new $P707, "Undef"
  vivify_355:
    $P708 = $P706($P707)
    if $P708, unless_705_end
    .const 'Sub' $P710 = "70_1256283593.06656" 
    capture_lex $P710
    $P710()
  unless_705_end:
    get_hll_global $P712, ["Class"], "of"
    find_lex $P713, "$object"
    unless_null $P713, vivify_356
    new $P713, "Undef"
  vivify_356:
    $P714 = $P712($P713)
    set $S715, $P714
    new $P716, 'String'
    set $P716, $S715
    .lex "$class", $P716
    find_lex $P717, "$class"
    unless_null $P717, vivify_357
    new $P717, "Undef"
  vivify_357:
    $P718 = $P717."split"(";")
    find_lex $P719, "$delimiter"
    unless_null $P719, vivify_358
    new $P719, "Undef"
  vivify_358:
    $P720 = $P718."join"($P719)
    store_lex "$class", $P720
    new $P721, "Exception"
    set $P721['type'], 58
    find_lex $P722, "$class"
    unless_null $P722, vivify_359
    new $P722, "Undef"
  vivify_359:
    setattribute $P721, 'payload', $P722
    throw $P721
    .return ()
  control_700:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P723, exception, "payload"
    .return ($P723)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block709"  :anon :subid("70_1256283593.06656") :outer("69_1256283593.06656")
    new $P711, "String"
    assign $P711, "::"
    store_lex "$delimiter", $P711
    .return ($P711)
.end


.namespace ["Class"]
.sub "of"  :subid("71_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_727
    .const 'Sub' $P740 = "73_1256283593.06656" 
    capture_lex $P740
    .const 'Sub' $P734 = "72_1256283593.06656" 
    capture_lex $P734
    new $P726, 'ExceptionHandler'
    set_addr $P726, control_725
    $P726."handle_types"(58)
    push_eh $P726
    .lex "$object", param_727
    new $P728, "Undef"
    .lex "$class", $P728
    get_hll_global $P730, ["Parrot"], "isa"
    find_lex $P731, "$object"
    unless_null $P731, vivify_360
    new $P731, "Undef"
  vivify_360:
    $P732 = $P730($P731, "P6object")
    if $P732, if_729
    .const 'Sub' $P740 = "73_1256283593.06656" 
    capture_lex $P740
    $P740()
    goto if_729_end
  if_729:
    .const 'Sub' $P734 = "72_1256283593.06656" 
    capture_lex $P734
    $P734()
  if_729_end:
    new $P744, "Exception"
    set $P744['type'], 58
    find_lex $P745, "$class"
    unless_null $P745, vivify_363
    new $P745, "Undef"
  vivify_363:
    setattribute $P744, 'payload', $P745
    throw $P744
    .return ()
  control_725:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P746, exception, "payload"
    .return ($P746)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block739"  :anon :subid("73_1256283593.06656") :outer("71_1256283593.06656")
    get_hll_global $P741, ["Parrot"], "typeof"
    find_lex $P742, "$object"
    unless_null $P742, vivify_361
    new $P742, "Undef"
  vivify_361:
    $P743 = $P741($P742)
    store_lex "$class", $P743
    .return ($P743)
.end


.namespace ["Class"]
.sub "_block733"  :anon :subid("72_1256283593.06656") :outer("71_1256283593.06656")
    get_hll_global $P735, ["Parrot"], "get_attribute"
    find_lex $P736, "$object"
    unless_null $P736, vivify_362
    new $P736, "Undef"
  vivify_362:
    $P737 = $P736."HOW"()
    $P738 = $P735($P737, "parrotclass")
    store_lex "$class", $P738
    .return ($P738)
.end


.namespace ["Class"]
.sub "signature"  :subid("74_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_750
    .const 'Sub' $P757 = "75_1256283593.06656" 
    capture_lex $P757
    new $P749, 'ExceptionHandler'
    set_addr $P749, control_748
    $P749."handle_types"(58)
    push_eh $P749
    .lex "@types", param_750
    new $P751, "ResizablePMCArray"
    .lex "@sig_names", $P751
    find_lex $P753, "@types"
    unless_null $P753, vivify_364
    new $P753, "ResizablePMCArray"
  vivify_364:
    defined $I754, $P753
    unless $I754, for_undef_365
    iter $P752, $P753
    new $P778, 'ExceptionHandler'
    set_addr $P778, loop777_handler
    $P778."handle_types"(65, 67, 66)
    push_eh $P778
  loop777_test:
    unless $P752, loop777_done
    shift $P755, $P752
  loop777_redo:
    .const 'Sub' $P757 = "75_1256283593.06656" 
    capture_lex $P757
    $P757($P755)
  loop777_next:
    goto loop777_test
  loop777_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P779, exception, 'type'
    eq $P779, 65, loop777_next
    eq $P779, 67, loop777_redo
  loop777_done:
    pop_eh 
  for_undef_365:
    new $P780, "Exception"
    set $P780['type'], 58
    find_lex $P781, "@sig_names"
    unless_null $P781, vivify_372
    new $P781, "ResizablePMCArray"
  vivify_372:
    $P782 = $P781."join"(", ")
    setattribute $P780, 'payload', $P782
    throw $P780
    .return ()
  control_748:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P783, exception, "payload"
    .return ($P783)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block756"  :anon :subid("75_1256283593.06656") :outer("74_1256283593.06656")
    .param pmc param_758
    .lex "$_", param_758
    find_lex $P759, "$_"
    unless_null $P759, vivify_366
    new $P759, "Undef"
  vivify_366:
    set $S760, $P759
    new $P761, 'String'
    set $P761, $S760
    .lex "$type", $P761
    find_lex $P764, "$type"
    unless_null $P764, vivify_367
    new $P764, "Undef"
  vivify_367:
    set $S765, $P764
    iseq $I766, $S765, "_"
    if $I766, if_763
    new $P768, "String"
    assign $P768, "['"
    find_lex $P769, "$type"
    unless_null $P769, vivify_368
    new $P769, "Undef"
  vivify_368:
    $P770 = $P769."split"("::")
    $S771 = $P770."join"("';'")
    concat $P772, $P768, $S771
    concat $P773, $P772, "']"
    set $P762, $P773
    goto if_763_end
  if_763:
    find_lex $P767, "$type"
    unless_null $P767, vivify_369
    new $P767, "Undef"
  vivify_369:
    set $P762, $P767
  if_763_end:
    .lex "$type_sig", $P762
    find_lex $P774, "@sig_names"
    unless_null $P774, vivify_370
    new $P774, "ResizablePMCArray"
  vivify_370:
    find_lex $P775, "$type_sig"
    unless_null $P775, vivify_371
    new $P775, "Undef"
  vivify_371:
    $P776 = $P774."push"($P775)
    .return ($P776)
.end


.namespace ["Class"]
.sub "trampoline"  :subid("76_1256283593.06656") :outer("11_1256283593.06656")
    .param pmc param_787
    .param pmc param_788
    .param pmc param_789 :optional :named("target")
    .param int has_param_789 :opt_flag
    .param pmc param_791 :optional :named("actions")
    .param int has_param_791 :opt_flag
    .param pmc param_793 :optional :named("adverbs")
    .param int has_param_793 :opt_flag
    .param pmc param_795 :optional :named("is_method")
    .param int has_param_795 :opt_flag
    .const 'Sub' $P806 = "77_1256283593.06656" 
    capture_lex $P806
    new $P786, 'ExceptionHandler'
    set_addr $P786, control_785
    $P786."handle_types"(58)
    push_eh $P786
    .lex "$namespace", param_787
    .lex "$name", param_788
    if has_param_789, optparam_373
    new $P790, "Undef"
    set param_789, $P790
  optparam_373:
    .lex "$target", param_789
    if has_param_791, optparam_374
    new $P792, "Undef"
    set param_791, $P792
  optparam_374:
    .lex "@actions", param_791
    if has_param_793, optparam_375
    new $P794, "Undef"
    set param_793, $P794
  optparam_375:
    .lex "$adverbs", param_793
    if has_param_795, optparam_376
    new $P796, "Undef"
    set param_795, $P796
  optparam_376:
    .lex "$is_method", param_795
    find_lex $P797, "$namespace"
    unless_null $P797, vivify_377
    new $P797, "Undef"
  vivify_377:
    find_lex $P798, "$name"
    unless_null $P798, vivify_378
    new $P798, "Undef"
  vivify_378:
    find_lex $P799, "$target"
    unless_null $P799, vivify_379
    new $P799, "Undef"
  vivify_379:
    "NOTE"("Building trampoline [", $P797, "::", $P798, "] -> ", $P799)
    find_lex $P800, "$is_method"
    unless_null $P800, vivify_380
    new $P800, "Undef"
  vivify_380:
    "NOTE"("is_method? ", $P800)
    find_lex $P801, "$adverbs"
    unless_null $P801, vivify_381
    new $P801, "Undef"
  vivify_381:
    "NOTE"("With adverbs: ", $P801)
    find_lex $P803, "@actions"
    unless_null $P803, vivify_382
    new $P803, "ResizablePMCArray"
  vivify_382:
    set $N804, $P803
    if $N804, unless_802_end
    .const 'Sub' $P806 = "77_1256283593.06656" 
    capture_lex $P806
    $P806()
  unless_802_end:
    get_hll_global $P865, ["Array"], "new"
    new $P866, "String"
    assign $P866, ".namespace [ '"
    find_lex $P867, "$namespace"
    unless_null $P867, vivify_399
    new $P867, "Undef"
  vivify_399:
    $P868 = $P867."split"("::")
    $S869 = $P868."join"("' ; '")
    concat $P870, $P866, $S869
    concat $P871, $P870, "' ]"
    new $P872, "String"
    assign $P872, ".sub '"
    find_lex $P873, "$name"
    unless_null $P873, vivify_400
    new $P873, "Undef"
  vivify_400:
    concat $P874, $P872, $P873
    concat $P875, $P874, "' "
    find_lex $P876, "$adverbs"
    unless_null $P876, vivify_401
    new $P876, "Undef"
  vivify_401:
    concat $P877, $P875, $P876
    new $P878, "String"
    assign $P878, "\t"
    concat $P879, $P878, ".param pmc pos :slurpy"
    new $P880, "String"
    assign $P880, "\t"
    concat $P881, $P880, ".param pmc adv :slurpy :named"
    $P882 = $P865($P871, $P877, $P879, $P881)
    .lex "@code", $P882
    find_lex $P883, "@code"
    unless_null $P883, vivify_402
    new $P883, "ResizablePMCArray"
  vivify_402:
    find_lex $P884, "@actions"
    unless_null $P884, vivify_403
    new $P884, "ResizablePMCArray"
  vivify_403:
    $P883."append"($P884)
    find_lex $P885, "@code"
    unless_null $P885, vivify_404
    new $P885, "ResizablePMCArray"
  vivify_404:
    $P885."push"(".end")
    find_lex $P886, "@code"
    unless_null $P886, vivify_405
    new $P886, "ResizablePMCArray"
  vivify_405:
    $P887 = $P886."join"("\n")
    .lex "$trampoline", $P887
    find_lex $P888, "$trampoline"
    unless_null $P888, vivify_406
    new $P888, "Undef"
  vivify_406:
    "NOTE"("Trampoline is:\n", $P888)
    get_hll_global $P889, ["Parrot"], "compile"
    find_lex $P890, "$trampoline"
    unless_null $P890, vivify_407
    new $P890, "Undef"
  vivify_407:
    $P889($P890)
    $P891 = "NOTE"("Trampoline compiled okay.")
    .return ($P891)
  control_785:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P892, exception, "payload"
    .return ($P892)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block805"  :anon :subid("77_1256283593.06656") :outer("76_1256283593.06656")
    .const 'Sub' $P848 = "80_1256283593.06656" 
    capture_lex $P848
    .const 'Sub' $P816 = "78_1256283593.06656" 
    capture_lex $P816
    get_hll_global $P807, ["Array"], "empty"
    $P808 = $P807()
    store_lex "@actions", $P808
    find_lex $P809, "$namespace"
    unless_null $P809, vivify_383
    new $P809, "Undef"
  vivify_383:
    .lex "$target_nsp", $P809
    get_hll_global $P811, ["Parrot"], "isa"
    find_lex $P812, "$target"
    unless_null $P812, vivify_384
    new $P812, "Undef"
  vivify_384:
    $P813 = $P811($P812, "String")
    isfalse $I814, $P813
    if $I814, if_810
    .const 'Sub' $P848 = "80_1256283593.06656" 
    capture_lex $P848
    $P848()
    goto if_810_end
  if_810:
    .const 'Sub' $P816 = "78_1256283593.06656" 
    capture_lex $P816
    $P816()
  if_810_end:
    find_lex $P853, "@actions"
    unless_null $P853, vivify_396
    new $P853, "ResizablePMCArray"
  vivify_396:
    new $P854, "String"
    assign $P854, "\t"
    concat $P855, $P854, ".tailcall "
    find_lex $P856, "$target"
    unless_null $P856, vivify_397
    new $P856, "Undef"
  vivify_397:
    concat $P857, $P855, $P856
    concat $P858, $P857, "("
    find_lex $P861, "$is_method"
    unless_null $P861, vivify_398
    new $P861, "Undef"
  vivify_398:
    if $P861, if_860
    set $S859, ""
    goto if_860_end
  if_860:
    set $S859, "self, "
  if_860_end:
    concat $P862, $P858, $S859
    concat $P863, $P862, "pos :flat, adv :flat :named)"
    $P864 = $P853."push"($P863)
    .return ($P864)
.end


.namespace ["Class"]
.sub "_block847"  :anon :subid("80_1256283593.06656") :outer("77_1256283593.06656")
    new $P849, "String"
    assign $P849, "'"
    find_lex $P850, "$target"
    unless_null $P850, vivify_385
    new $P850, "Undef"
  vivify_385:
    concat $P851, $P849, $P850
    concat $P852, $P851, "'"
    store_lex "$target", $P852
    .return ($P852)
.end


.namespace ["Class"]
.sub "_block815"  :anon :subid("78_1256283593.06656") :outer("77_1256283593.06656")
    .const 'Sub' $P831 = "79_1256283593.06656" 
    capture_lex $P831
    find_lex $P817, "$target"
    unless_null $P817, vivify_386
    new $P817, "Undef"
  vivify_386:
    $P818 = $P817."get_namespace"()
    $P819 = $P818."get_name"()
    .lex "@parts", $P819
    find_lex $P820, "@parts"
    unless_null $P820, vivify_387
    new $P820, "ResizablePMCArray"
  vivify_387:
    $P820."shift"()
    find_lex $P821, "@parts"
    unless_null $P821, vivify_388
    new $P821, "ResizablePMCArray"
  vivify_388:
    $P822 = $P821."join"("::")
    store_lex "$target_nsp", $P822
    find_lex $P825, "$target_nsp"
    unless_null $P825, vivify_389
    new $P825, "Undef"
  vivify_389:
    set $S826, $P825
    find_lex $P827, "$namespace"
    unless_null $P827, vivify_390
    new $P827, "Undef"
  vivify_390:
    set $S828, $P827
    isne $I829, $S826, $S828
    if $I829, if_824
    new $P823, 'Integer'
    set $P823, $I829
    goto if_824_end
  if_824:
    .const 'Sub' $P831 = "79_1256283593.06656" 
    capture_lex $P831
    $P846 = $P831()
    set $P823, $P846
  if_824_end:
    .return ($P823)
.end


.namespace ["Class"]
.sub "_block830"  :anon :subid("79_1256283593.06656") :outer("78_1256283593.06656")
    new $P832, "String"
    assign $P832, "\t"
    concat $P833, $P832, "$P0 = get_hll_global "
    .lex "$load_p0", $P833
    find_lex $P834, "$load_p0"
    unless_null $P834, vivify_391
    new $P834, "Undef"
  vivify_391:
    concat $P835, $P834, "[ '"
    find_lex $P836, "@parts"
    unless_null $P836, vivify_392
    new $P836, "ResizablePMCArray"
  vivify_392:
    $S837 = $P836."join"("' ; '")
    concat $P838, $P835, $S837
    concat $P839, $P838, "' ], '"
    find_lex $P840, "$target"
    unless_null $P840, vivify_393
    new $P840, "Undef"
  vivify_393:
    concat $P841, $P839, $P840
    concat $P842, $P841, "'"
    store_lex "$load_p0", $P842
    find_lex $P843, "@actions"
    unless_null $P843, vivify_394
    new $P843, "ResizablePMCArray"
  vivify_394:
    find_lex $P844, "$load_p0"
    unless_null $P844, vivify_395
    new $P844, "Undef"
  vivify_395:
    $P843."push"($P844)
    new $P845, "String"
    assign $P845, "$P0"
    store_lex "$target", $P845
    .return ($P845)
.end


.namespace ["Class";"ArrayBased"]
.sub "_block893" :init :load :subid("81_1256283593.06656")
    .const 'Sub' $P908 = "84_1256283593.06656" 
    capture_lex $P908
    .const 'Sub' $P895 = "82_1256283593.06656" 
    capture_lex $P895
    "_ONLOAD"()
    .const 'Sub' $P908 = "84_1256283593.06656" 
    capture_lex $P908
    .return ($P908)
.end


.namespace ["Class";"ArrayBased"]
.sub "_ONLOAD"  :subid("82_1256283593.06656") :outer("81_1256283593.06656")
    .const 'Sub' $P901 = "83_1256283593.06656" 
    capture_lex $P901
    new $P897, 'ExceptionHandler'
    set_addr $P897, control_896
    $P897."handle_types"(58)
    push_eh $P897
    get_global $P899, "$Onload_done"
    unless_null $P899, vivify_408
    new $P899, "Undef"
  vivify_408:
    unless $P899, if_898_end
    .const 'Sub' $P901 = "83_1256283593.06656" 
    capture_lex $P901
    $P901()
  if_898_end:
    new $P904, "Integer"
    assign $P904, 1
    set_global "$Onload_done", $P904
    get_hll_global $P905, ["Parrot"], "IMPORT"
    $P906 = $P905("Dumper")
    .return ($P906)
  control_896:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P907, exception, "payload"
    .return ($P907)
    rethrow exception
.end


.namespace ["Class";"ArrayBased"]
.sub "_block900"  :anon :subid("83_1256283593.06656") :outer("82_1256283593.06656")
    new $P902, "Exception"
    set $P902['type'], 58
    new $P903, "Integer"
    assign $P903, 0
    setattribute $P902, 'payload', $P903
    throw $P902
    .return ()
.end


.namespace ["Class";"ArrayBased"]
.sub "init"  :subid("84_1256283593.06656") :method :outer("81_1256283593.06656")
    .param pmc param_911
    .param pmc param_912
    new $P910, 'ExceptionHandler'
    set_addr $P910, control_909
    $P910."handle_types"(58)
    push_eh $P910
    .lex "self", self
    .lex "@children", param_911
    .lex "%attributes", param_912
    $P913 = "DIE"("NOT IMPLEMENTED. This class is but a shell.")
    .return ($P913)
  control_909:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P914, exception, "payload"
    .return ($P914)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_block915" :init :load :subid("85_1256283593.06656")
    .const 'Sub' $P1137 = "105_1256283593.06656" 
    capture_lex $P1137
    .const 'Sub' $P1126 = "104_1256283593.06656" 
    capture_lex $P1126
    .const 'Sub' $P1100 = "102_1256283593.06656" 
    capture_lex $P1100
    .const 'Sub' $P1087 = "101_1256283593.06656" 
    capture_lex $P1087
    .const 'Sub' $P1081 = "100_1256283593.06656" 
    capture_lex $P1081
    .const 'Sub' $P1055 = "98_1256283593.06656" 
    capture_lex $P1055
    .const 'Sub' $P1029 = "96_1256283593.06656" 
    capture_lex $P1029
    .const 'Sub' $P1003 = "94_1256283593.06656" 
    capture_lex $P1003
    .const 'Sub' $P977 = "92_1256283593.06656" 
    capture_lex $P977
    .const 'Sub' $P951 = "90_1256283593.06656" 
    capture_lex $P951
    .const 'Sub' $P943 = "89_1256283593.06656" 
    capture_lex $P943
    .const 'Sub' $P938 = "88_1256283593.06656" 
    capture_lex $P938
    .const 'Sub' $P918 = "86_1256283593.06656" 
    capture_lex $P918
    get_global $P917, "@empty"
    unless_null $P917, vivify_409
    new $P917, "ResizablePMCArray"
  vivify_409:
    "_ONLOAD"()
    .const 'Sub' $P1137 = "105_1256283593.06656" 
    capture_lex $P1137
    .return ($P1137)
.end


.namespace ["Class";"BaseBehavior"]
.sub "_ONLOAD"  :subid("86_1256283593.06656") :outer("85_1256283593.06656")
    .const 'Sub' $P924 = "87_1256283593.06656" 
    capture_lex $P924
    new $P920, 'ExceptionHandler'
    set_addr $P920, control_919
    $P920."handle_types"(58)
    push_eh $P920
    get_global $P922, "$Onload_done"
    unless_null $P922, vivify_410
    new $P922, "Undef"
  vivify_410:
    unless $P922, if_921_end
    .const 'Sub' $P924 = "87_1256283593.06656" 
    capture_lex $P924
    $P924()
  if_921_end:
    new $P927, "Integer"
    assign $P927, 1
    set_global "$Onload_done", $P927
    new $P928, "String"
    assign $P928, "\r\n.namespace [ 'Class' ; 'BaseBehavior' ]\r\n.sub '__get_bool' :vtable('get_bool') :method\r\n\t$I0 = self.'get_bool'()\r\n\t.return ($I0)\r\n.end"
    .lex "$get_bool", $P928
    get_hll_global $P929, ["Parrot"], "compile"
    find_lex $P930, "$get_bool"
    unless_null $P930, vivify_411
    new $P930, "Undef"
  vivify_411:
    $P929($P930)
    new $P931, "String"
    assign $P931, "\r\n.namespace [ 'Class' ; 'BaseBehavior' ]\r\n.sub '__get_string' :vtable('get_string') :method\r\n\t$S0 = self.'get_string'()\r\n\t.return ($S0)\r\n.end"
    .lex "$get_string", $P931
    get_hll_global $P932, ["Parrot"], "compile"
    find_lex $P933, "$get_string"
    unless_null $P933, vivify_412
    new $P933, "Undef"
  vivify_412:
    $P932($P933)
    get_hll_global $P934, ["Parrot"], "IMPORT"
    $P934("Dumper")
    get_hll_global $P935, ["Class"], "NEW_CLASS"
    $P936 = $P935("Class::BaseBehavior")
    .return ($P936)
  control_919:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P937, exception, "payload"
    .return ($P937)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_block923"  :anon :subid("87_1256283593.06656") :outer("86_1256283593.06656")
    new $P925, "Exception"
    set $P925['type'], 58
    new $P926, "Integer"
    assign $P926, 0
    setattribute $P925, 'payload', $P926
    throw $P925
    .return ()
.end


.namespace ["Class";"BaseBehavior"]
.sub "_ABSTRACT_METHOD"  :subid("88_1256283593.06656") :method :outer("85_1256283593.06656")
    new $P940, 'ExceptionHandler'
    set_addr $P940, control_939
    $P940."handle_types"(58)
    push_eh $P940
    .lex "self", self
    $P941 = "DIE"("A subclass must override this abstract method.")
    .return ($P941)
  control_939:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P942, exception, "payload"
    .return ($P942)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_ATTR"  :subid("89_1256283593.06656") :method :outer("85_1256283593.06656")
    .param pmc param_946
    .param pmc param_947
    new $P945, 'ExceptionHandler'
    set_addr $P945, control_944
    $P945."handle_types"(58)
    push_eh $P945
    .lex "self", self
    .lex "$name", param_946
    .lex "@value", param_947
    find_lex $P948, "self"
    $P949 = $P948."_ABSTRACT_METHOD"()
    .return ($P949)
  control_944:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P950, exception, "payload"
    .return ($P950)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_ATTR_ARRAY"  :subid("90_1256283593.06656") :method :outer("85_1256283593.06656")
    .param pmc param_954
    .param pmc param_955
    .const 'Sub' $P966 = "91_1256283593.06656" 
    capture_lex $P966
    new $P953, 'ExceptionHandler'
    set_addr $P953, control_952
    $P953."handle_types"(58)
    push_eh $P953
    .lex "self", self
    .lex "$name", param_954
    .lex "@value", param_955
    find_lex $P956, "self"
    find_lex $P957, "$name"
    unless_null $P957, vivify_413
    new $P957, "Undef"
  vivify_413:
    find_lex $P958, "@value"
    unless_null $P958, vivify_414
    new $P958, "ResizablePMCArray"
  vivify_414:
    $P959 = $P956."_ATTR"($P957, $P958)
    .lex "$result", $P959
    get_hll_global $P961, ["Parrot"], "defined"
    find_lex $P962, "$result"
    unless_null $P962, vivify_415
    new $P962, "Undef"
  vivify_415:
    $P963 = $P961($P962)
    isfalse $I964, $P963
    unless $I964, if_960_end
    .const 'Sub' $P966 = "91_1256283593.06656" 
    capture_lex $P966
    $P966()
  if_960_end:
    new $P974, "Exception"
    set $P974['type'], 58
    find_lex $P975, "$result"
    unless_null $P975, vivify_417
    new $P975, "Undef"
  vivify_417:
    setattribute $P974, 'payload', $P975
    throw $P974
    .return ()
  control_952:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P976, exception, "payload"
    .return ($P976)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_block965"  :anon :subid("91_1256283593.06656") :outer("90_1256283593.06656")
    find_lex $P967, "self"
    find_lex $P968, "$name"
    unless_null $P968, vivify_416
    new $P968, "Undef"
  vivify_416:
    get_hll_global $P969, ["Array"], "new"
    get_hll_global $P970, ["Array"], "empty"
    $P971 = $P970()
    $P972 = $P969($P971)
    $P973 = $P967."_ATTR"($P968, $P972)
    store_lex "$result", $P973
    .return ($P973)
.end


.namespace ["Class";"BaseBehavior"]
.sub "_ATTR_DEFAULT"  :subid("92_1256283593.06656") :method :outer("85_1256283593.06656")
    .param pmc param_980
    .param pmc param_981
    .param pmc param_982
    .const 'Sub' $P993 = "93_1256283593.06656" 
    capture_lex $P993
    new $P979, 'ExceptionHandler'
    set_addr $P979, control_978
    $P979."handle_types"(58)
    push_eh $P979
    .lex "self", self
    .lex "$name", param_980
    .lex "@value", param_981
    .lex "$default", param_982
    find_lex $P983, "self"
    find_lex $P984, "$name"
    unless_null $P984, vivify_418
    new $P984, "Undef"
  vivify_418:
    find_lex $P985, "@value"
    unless_null $P985, vivify_419
    new $P985, "ResizablePMCArray"
  vivify_419:
    $P986 = $P983."_ATTR"($P984, $P985)
    .lex "$result", $P986
    get_hll_global $P988, ["Parrot"], "defined"
    find_lex $P989, "$result"
    unless_null $P989, vivify_420
    new $P989, "Undef"
  vivify_420:
    $P990 = $P988($P989)
    isfalse $I991, $P990
    unless $I991, if_987_end
    .const 'Sub' $P993 = "93_1256283593.06656" 
    capture_lex $P993
    $P993()
  if_987_end:
    new $P1000, "Exception"
    set $P1000['type'], 58
    find_lex $P1001, "$result"
    unless_null $P1001, vivify_423
    new $P1001, "Undef"
  vivify_423:
    setattribute $P1000, 'payload', $P1001
    throw $P1000
    .return ()
  control_978:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1002, exception, "payload"
    .return ($P1002)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_block992"  :anon :subid("93_1256283593.06656") :outer("92_1256283593.06656")
    find_lex $P994, "self"
    find_lex $P995, "$name"
    unless_null $P995, vivify_421
    new $P995, "Undef"
  vivify_421:
    get_hll_global $P996, ["Array"], "new"
    find_lex $P997, "$default"
    unless_null $P997, vivify_422
    new $P997, "Undef"
  vivify_422:
    $P998 = $P996($P997)
    $P999 = $P994."_ATTR"($P995, $P998)
    store_lex "$result", $P999
    .return ($P999)
.end


.namespace ["Class";"BaseBehavior"]
.sub "_ATTR_CONST"  :subid("94_1256283593.06656") :method :outer("85_1256283593.06656")
    .param pmc param_1006
    .param pmc param_1007
    .const 'Sub' $P1020 = "95_1256283593.06656" 
    capture_lex $P1020
    new $P1005, 'ExceptionHandler'
    set_addr $P1005, control_1004
    $P1005."handle_types"(58)
    push_eh $P1005
    .lex "self", self
    .lex "$name", param_1006
    .lex "@value", param_1007
    find_lex $P1011, "@value"
    unless_null $P1011, vivify_424
    new $P1011, "ResizablePMCArray"
  vivify_424:
    set $N1012, $P1011
    if $N1012, if_1010
    new $P1009, 'Float'
    set $P1009, $N1012
    goto if_1010_end
  if_1010:
    get_hll_global $P1013, ["Parrot"], "defined"
    find_lex $P1014, "self"
    find_lex $P1015, "$name"
    unless_null $P1015, vivify_425
    new $P1015, "Undef"
  vivify_425:
    get_global $P1016, "@empty"
    unless_null $P1016, vivify_426
    new $P1016, "ResizablePMCArray"
  vivify_426:
    $P1017 = $P1014."_ATTR"($P1015, $P1016)
    $P1018 = $P1013($P1017)
    set $P1009, $P1018
  if_1010_end:
    unless $P1009, if_1008_end
    .const 'Sub' $P1020 = "95_1256283593.06656" 
    capture_lex $P1020
    $P1020()
  if_1008_end:
    new $P1023, "Exception"
    set $P1023['type'], 58
    find_lex $P1024, "self"
    find_lex $P1025, "$name"
    unless_null $P1025, vivify_428
    new $P1025, "Undef"
  vivify_428:
    find_lex $P1026, "@value"
    unless_null $P1026, vivify_429
    new $P1026, "ResizablePMCArray"
  vivify_429:
    $P1027 = $P1024."_ATTR"($P1025, $P1026)
    setattribute $P1023, 'payload', $P1027
    throw $P1023
    .return ()
  control_1004:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1028, exception, "payload"
    .return ($P1028)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_block1019"  :anon :subid("95_1256283593.06656") :outer("94_1256283593.06656")
    find_lex $P1021, "$name"
    unless_null $P1021, vivify_427
    new $P1021, "Undef"
  vivify_427:
    $P1022 = "DIE"("You cannot reset the value of the '", $P1021, "' attribute.")
    .return ($P1022)
.end


.namespace ["Class";"BaseBehavior"]
.sub "_ATTR_HASH"  :subid("96_1256283593.06656") :method :outer("85_1256283593.06656")
    .param pmc param_1032
    .param pmc param_1033
    .const 'Sub' $P1044 = "97_1256283593.06656" 
    capture_lex $P1044
    new $P1031, 'ExceptionHandler'
    set_addr $P1031, control_1030
    $P1031."handle_types"(58)
    push_eh $P1031
    .lex "self", self
    .lex "$name", param_1032
    .lex "@value", param_1033
    find_lex $P1034, "self"
    find_lex $P1035, "$name"
    unless_null $P1035, vivify_430
    new $P1035, "Undef"
  vivify_430:
    find_lex $P1036, "@value"
    unless_null $P1036, vivify_431
    new $P1036, "ResizablePMCArray"
  vivify_431:
    $P1037 = $P1034."_ATTR"($P1035, $P1036)
    .lex "$result", $P1037
    get_hll_global $P1039, ["Parrot"], "defined"
    find_lex $P1040, "$result"
    unless_null $P1040, vivify_432
    new $P1040, "Undef"
  vivify_432:
    $P1041 = $P1039($P1040)
    isfalse $I1042, $P1041
    unless $I1042, if_1038_end
    .const 'Sub' $P1044 = "97_1256283593.06656" 
    capture_lex $P1044
    $P1044()
  if_1038_end:
    new $P1052, "Exception"
    set $P1052['type'], 58
    find_lex $P1053, "$result"
    unless_null $P1053, vivify_434
    new $P1053, "Undef"
  vivify_434:
    setattribute $P1052, 'payload', $P1053
    throw $P1052
    .return ()
  control_1030:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1054, exception, "payload"
    .return ($P1054)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_block1043"  :anon :subid("97_1256283593.06656") :outer("96_1256283593.06656")
    find_lex $P1045, "self"
    find_lex $P1046, "$name"
    unless_null $P1046, vivify_433
    new $P1046, "Undef"
  vivify_433:
    get_hll_global $P1047, ["Array"], "new"
    get_hll_global $P1048, ["Hash"], "empty"
    $P1049 = $P1048()
    $P1050 = $P1047($P1049)
    $P1051 = $P1045."_ATTR"($P1046, $P1050)
    store_lex "$result", $P1051
    .return ($P1051)
.end


.namespace ["Class";"BaseBehavior"]
.sub "_ATTR_SETBY"  :subid("98_1256283593.06656") :method :outer("85_1256283593.06656")
    .param pmc param_1058
    .param pmc param_1059
    .const 'Sub' $P1070 = "99_1256283593.06656" 
    capture_lex $P1070
    new $P1057, 'ExceptionHandler'
    set_addr $P1057, control_1056
    $P1057."handle_types"(58)
    push_eh $P1057
    .lex "self", self
    .lex "$name", param_1058
    .lex "$method_name", param_1059
    find_lex $P1060, "self"
    find_lex $P1061, "$name"
    unless_null $P1061, vivify_435
    new $P1061, "Undef"
  vivify_435:
    get_global $P1062, "@empty"
    unless_null $P1062, vivify_436
    new $P1062, "ResizablePMCArray"
  vivify_436:
    $P1063 = $P1060."_ATTR"($P1061, $P1062)
    .lex "$result", $P1063
    get_hll_global $P1065, ["Parrot"], "defined"
    find_lex $P1066, "$result"
    unless_null $P1066, vivify_437
    new $P1066, "Undef"
  vivify_437:
    $P1067 = $P1065($P1066)
    isfalse $I1068, $P1067
    unless $I1068, if_1064_end
    .const 'Sub' $P1070 = "99_1256283593.06656" 
    capture_lex $P1070
    $P1070()
  if_1064_end:
    new $P1078, "Exception"
    set $P1078['type'], 58
    find_lex $P1079, "$result"
    unless_null $P1079, vivify_441
    new $P1079, "Undef"
  vivify_441:
    setattribute $P1078, 'payload', $P1079
    throw $P1078
    .return ()
  control_1056:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1080, exception, "payload"
    .return ($P1080)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_block1069"  :anon :subid("99_1256283593.06656") :outer("98_1256283593.06656")
    get_hll_global $P1071, ["Class"], "call_method"
    find_lex $P1072, "self"
    find_lex $P1073, "$method_name"
    unless_null $P1073, vivify_438
    new $P1073, "Undef"
  vivify_438:
    $P1071($P1072, $P1073)
    find_lex $P1074, "self"
    find_lex $P1075, "$name"
    unless_null $P1075, vivify_439
    new $P1075, "Undef"
  vivify_439:
    get_global $P1076, "@empty"
    unless_null $P1076, vivify_440
    new $P1076, "ResizablePMCArray"
  vivify_440:
    $P1077 = $P1074."_ATTR"($P1075, $P1076)
    store_lex "$result", $P1077
    .return ($P1077)
.end


.namespace ["Class";"BaseBehavior"]
.sub "get_bool"  :subid("100_1256283593.06656") :method :outer("85_1256283593.06656")
    new $P1083, 'ExceptionHandler'
    set_addr $P1083, control_1082
    $P1083."handle_types"(58)
    push_eh $P1083
    .lex "self", self
    new $P1084, "Exception"
    set $P1084['type'], 58
    new $P1085, "Integer"
    assign $P1085, 1
    setattribute $P1084, 'payload', $P1085
    throw $P1084
    .return ()
  control_1082:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1086, exception, "payload"
    .return ($P1086)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "get_string"  :subid("101_1256283593.06656") :method :outer("85_1256283593.06656")
    new $P1089, 'ExceptionHandler'
    set_addr $P1089, control_1088
    $P1089."handle_types"(58)
    push_eh $P1089
    .lex "self", self
    new $P1090, "Exception"
    set $P1090['type'], 58
    get_hll_global $P1091, ["Class"], "name_of"
    find_lex $P1092, "self"
    $P1093 = $P1091($P1092)
    concat $P1094, $P1093, " @"
    get_hll_global $P1095, ["Parrot"], "get_address_of"
    find_lex $P1096, "self"
    $S1097 = $P1095($P1096)
    concat $P1098, $P1094, $S1097
    setattribute $P1090, 'payload', $P1098
    throw $P1090
    .return ()
  control_1088:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1099, exception, "payload"
    .return ($P1099)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "init"  :subid("102_1256283593.06656") :method :outer("85_1256283593.06656")
    .param pmc param_1103
    .param pmc param_1104
    .const 'Sub' $P1110 = "103_1256283593.06656" 
    capture_lex $P1110
    new $P1102, 'ExceptionHandler'
    set_addr $P1102, control_1101
    $P1102."handle_types"(58)
    push_eh $P1102
    .lex "self", self
    .lex "@children", param_1103
    .lex "%attributes", param_1104
    find_lex $P1106, "%attributes"
    unless_null $P1106, vivify_442
    new $P1106, "Hash"
  vivify_442:
    defined $I1107, $P1106
    unless $I1107, for_undef_443
    iter $P1105, $P1106
    new $P1123, 'ExceptionHandler'
    set_addr $P1123, loop1122_handler
    $P1123."handle_types"(65, 67, 66)
    push_eh $P1123
  loop1122_test:
    unless $P1105, loop1122_done
    shift $P1108, $P1105
  loop1122_redo:
    .const 'Sub' $P1110 = "103_1256283593.06656" 
    capture_lex $P1110
    $P1110($P1108)
  loop1122_next:
    goto loop1122_test
  loop1122_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1124, exception, 'type'
    eq $P1124, 65, loop1122_next
    eq $P1124, 67, loop1122_redo
  loop1122_done:
    pop_eh 
  for_undef_443:
    .return ($P1105)
  control_1101:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1125, exception, "payload"
    .return ($P1125)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_block1109"  :anon :subid("103_1256283593.06656") :outer("102_1256283593.06656")
    .param pmc param_1111
    .lex "$_", param_1111
    find_lex $P1112, "$_"
    unless_null $P1112, vivify_444
    new $P1112, "Undef"
  vivify_444:
    set $S1113, $P1112
    "NOTE"("Setting attribute: '", $S1113, "'")
    get_hll_global $P1114, ["Class"], "call_method"
    find_lex $P1115, "self"
    find_lex $P1116, "$_"
    unless_null $P1116, vivify_445
    new $P1116, "Undef"
  vivify_445:
    set $S1117, $P1116
    find_lex $P1118, "$_"
    unless_null $P1118, vivify_446
    new $P1118, "Undef"
  vivify_446:
    find_lex $P1119, "%attributes"
    unless_null $P1119, vivify_447
    new $P1119, "Hash"
  vivify_447:
    set $P1120, $P1119[$P1118]
    unless_null $P1120, vivify_448
    new $P1120, "Undef"
  vivify_448:
    $P1121 = $P1114($P1115, $S1117, $P1120)
    .return ($P1121)
.end


.namespace ["Class";"BaseBehavior"]
.sub "isa"  :subid("104_1256283593.06656") :method :outer("85_1256283593.06656")
    .param pmc param_1129
    new $P1128, 'ExceptionHandler'
    set_addr $P1128, control_1127
    $P1128."handle_types"(58)
    push_eh $P1128
    .lex "self", self
    .lex "$type", param_1129
    new $P1130, "Exception"
    set $P1130['type'], 58
    find_lex $P1131, "self"
    $P1132 = $P1131."HOW"()
    find_lex $P1133, "self"
    find_lex $P1134, "$type"
    unless_null $P1134, vivify_449
    new $P1134, "Undef"
  vivify_449:
    $P1135 = $P1132."isa"($P1133, $P1134)
    setattribute $P1130, 'payload', $P1135
    throw $P1130
    .return ()
  control_1127:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1136, exception, "payload"
    .return ($P1136)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "new"  :subid("105_1256283593.06656") :method :outer("85_1256283593.06656")
    .param pmc param_1140 :slurpy
    .param pmc param_1141 :slurpy :named
    new $P1139, 'ExceptionHandler'
    set_addr $P1139, control_1138
    $P1139."handle_types"(58)
    push_eh $P1139
    .lex "self", self
    .lex "@children", param_1140
    .lex "%attributes", param_1141
    get_hll_global $P1142, ["Parrot"], "get_attribute"
    find_lex $P1143, "self"
    $P1144 = $P1143."HOW"()
    $P1145 = $P1142($P1144, "parrotclass")
    .lex "$class", $P1145
    get_hll_global $P1146, ["Parrot"], "new_pmc"
    find_lex $P1147, "$class"
    unless_null $P1147, vivify_450
    new $P1147, "Undef"
  vivify_450:
    $P1148 = $P1146($P1147)
    .lex "$new_object", $P1148
    find_lex $P1149, "$new_object"
    unless_null $P1149, vivify_451
    new $P1149, "Undef"
  vivify_451:
    find_lex $P1150, "@children"
    unless_null $P1150, vivify_452
    new $P1150, "ResizablePMCArray"
  vivify_452:
    find_lex $P1151, "%attributes"
    unless_null $P1151, vivify_453
    new $P1151, "Hash"
  vivify_453:
    $P1149."init"($P1150, $P1151)
    new $P1152, "Exception"
    set $P1152['type'], 58
    find_lex $P1153, "$new_object"
    unless_null $P1153, vivify_454
    new $P1153, "Undef"
  vivify_454:
    setattribute $P1152, 'payload', $P1153
    throw $P1152
    .return ()
  control_1138:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1154, exception, "payload"
    .return ($P1154)
    rethrow exception
.end


.namespace ["Class";"HashBased"]
.sub "_block1155" :init :load :subid("106_1256283593.06656")
    .const 'Sub' $P1190 = "111_1256283593.06656" 
    capture_lex $P1190
    .const 'Sub' $P1171 = "109_1256283593.06656" 
    capture_lex $P1171
    .const 'Sub' $P1157 = "107_1256283593.06656" 
    capture_lex $P1157
    "_ONLOAD"()
    .const 'Sub' $P1190 = "111_1256283593.06656" 
    capture_lex $P1190
    .return ($P1190)
.end


.namespace ["Class";"HashBased"]
.sub "_ONLOAD"  :subid("107_1256283593.06656") :outer("106_1256283593.06656")
    .const 'Sub' $P1163 = "108_1256283593.06656" 
    capture_lex $P1163
    new $P1159, 'ExceptionHandler'
    set_addr $P1159, control_1158
    $P1159."handle_types"(58)
    push_eh $P1159
    get_global $P1161, "$Onload_done"
    unless_null $P1161, vivify_455
    new $P1161, "Undef"
  vivify_455:
    unless $P1161, if_1160_end
    .const 'Sub' $P1163 = "108_1256283593.06656" 
    capture_lex $P1163
    $P1163()
  if_1160_end:
    new $P1166, "Integer"
    assign $P1166, 1
    set_global "$Onload_done", $P1166
    get_hll_global $P1167, ["Parrot"], "IMPORT"
    $P1167("Dumper")
    get_hll_global $P1168, ["Class"], "SUBCLASS"
    $P1169 = $P1168("Class::HashBased", "Class::BaseBehavior", "Hash")
    .return ($P1169)
  control_1158:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1170, exception, "payload"
    .return ($P1170)
    rethrow exception
.end


.namespace ["Class";"HashBased"]
.sub "_block1162"  :anon :subid("108_1256283593.06656") :outer("107_1256283593.06656")
    new $P1164, "Exception"
    set $P1164['type'], 58
    new $P1165, "Integer"
    assign $P1165, 0
    setattribute $P1164, 'payload', $P1165
    throw $P1164
    .return ()
.end


.namespace ["Class";"HashBased"]
.sub "_ATTR"  :subid("109_1256283593.06656") :method :outer("106_1256283593.06656")
    .param pmc param_1174
    .param pmc param_1175
    .const 'Sub' $P1180 = "110_1256283593.06656" 
    capture_lex $P1180
    new $P1173, 'ExceptionHandler'
    set_addr $P1173, control_1172
    $P1173."handle_types"(58)
    push_eh $P1173
    .lex "self", self
    .lex "$name", param_1174
    .lex "@value", param_1175
    find_lex $P1177, "@value"
    unless_null $P1177, vivify_456
    new $P1177, "ResizablePMCArray"
  vivify_456:
    set $N1178, $P1177
    unless $N1178, if_1176_end
    .const 'Sub' $P1180 = "110_1256283593.06656" 
    capture_lex $P1180
    $P1180()
  if_1176_end:
    new $P1185, "Exception"
    set $P1185['type'], 58
    find_lex $P1186, "$name"
    unless_null $P1186, vivify_461
    new $P1186, "Undef"
  vivify_461:
    find_lex $P1187, "self"
    unless_null $P1187, vivify_462
    new $P1187, "Hash"
  vivify_462:
    set $P1188, $P1187[$P1186]
    unless_null $P1188, vivify_463
    new $P1188, "Undef"
  vivify_463:
    setattribute $P1185, 'payload', $P1188
    throw $P1185
    .return ()
  control_1172:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1189, exception, "payload"
    .return ($P1189)
    rethrow exception
.end


.namespace ["Class";"HashBased"]
.sub "_block1179"  :anon :subid("110_1256283593.06656") :outer("109_1256283593.06656")
    find_lex $P1181, "@value"
    unless_null $P1181, vivify_457
    new $P1181, "ResizablePMCArray"
  vivify_457:
    set $P1182, $P1181[0]
    unless_null $P1182, vivify_458
    new $P1182, "Undef"
  vivify_458:
    find_lex $P1183, "$name"
    unless_null $P1183, vivify_459
    new $P1183, "Undef"
  vivify_459:
    find_lex $P1184, "self"
    unless_null $P1184, vivify_460
    new $P1184, "Hash"
    store_lex "self", $P1184
  vivify_460:
    set $P1184[$P1183], $P1182
    .return ($P1182)
.end


.namespace ["Class";"HashBased"]
.sub "__dump"  :subid("111_1256283593.06656") :method :outer("106_1256283593.06656")
    .param pmc param_1193
    .param pmc param_1194
    .const 'Sub' $P1244 = "115_1256283593.06656" 
    capture_lex $P1244
    .const 'Sub' $P1241 = "114_1256283593.06656" 
    capture_lex $P1241
    .const 'Sub' $P1219 = "113_1256283593.06656" 
    capture_lex $P1219
    .const 'Sub' $P1204 = "112_1256283593.06656" 
    capture_lex $P1204
    new $P1192, 'ExceptionHandler'
    set_addr $P1192, control_1191
    $P1192."handle_types"(58)
    push_eh $P1192
    .lex "self", self
    .lex "$dumper", param_1193
    .lex "$label", param_1194
    new $P1195, "Undef"
    .lex "$subindent", $P1195
    new $P1196, "Undef"
    .lex "$indent", $P1196

			.local string indent, subindent
			$P0 = find_lex '$dumper'
			(subindent, indent) = $P0.'newIndent'()
			$P0 = box subindent
			store_lex '$subindent', $P0
			$P0 = box indent
			store_lex '$indent', $P0
		
    new $P1197, "String"
    assign $P1197, "{"
    .lex "$brace", $P1197
    new $P1198, "ResizablePMCArray"
    .lex "@keys", $P1198
    find_lex $P1200, "self"
    defined $I1201, $P1200
    unless $I1201, for_undef_464
    iter $P1199, $P1200
    new $P1211, 'ExceptionHandler'
    set_addr $P1211, loop1210_handler
    $P1211."handle_types"(65, 67, 66)
    push_eh $P1211
  loop1210_test:
    unless $P1199, loop1210_done
    shift $P1202, $P1199
  loop1210_redo:
    .const 'Sub' $P1204 = "112_1256283593.06656" 
    capture_lex $P1204
    $P1204($P1202)
  loop1210_next:
    goto loop1210_test
  loop1210_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1212, exception, 'type'
    eq $P1212, 65, loop1210_next
    eq $P1212, 67, loop1210_redo
  loop1210_done:
    pop_eh 
  for_undef_464:
    find_lex $P1213, "@keys"
    unless_null $P1213, vivify_467
    new $P1213, "ResizablePMCArray"
  vivify_467:
    $P1213."sort"()
    find_lex $P1215, "@keys"
    unless_null $P1215, vivify_468
    new $P1215, "ResizablePMCArray"
  vivify_468:
    defined $I1216, $P1215
    unless $I1216, for_undef_469
    iter $P1214, $P1215
    new $P1236, 'ExceptionHandler'
    set_addr $P1236, loop1235_handler
    $P1236."handle_types"(65, 67, 66)
    push_eh $P1236
  loop1235_test:
    unless $P1214, loop1235_done
    shift $P1217, $P1214
  loop1235_redo:
    .const 'Sub' $P1219 = "113_1256283593.06656" 
    capture_lex $P1219
    $P1219($P1217)
  loop1235_next:
    goto loop1235_test
  loop1235_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1237, exception, 'type'
    eq $P1237, 65, loop1235_next
    eq $P1237, 67, loop1235_redo
  loop1235_done:
    pop_eh 
  for_undef_469:
    find_lex $P1239, "$brace"
    unless_null $P1239, vivify_480
    new $P1239, "Undef"
  vivify_480:
    if $P1239, if_1238
    .const 'Sub' $P1244 = "115_1256283593.06656" 
    capture_lex $P1244
    $P1244()
    goto if_1238_end
  if_1238:
    .const 'Sub' $P1241 = "114_1256283593.06656" 
    capture_lex $P1241
    $P1241()
  if_1238_end:
    find_lex $P1247, "$dumper"
    unless_null $P1247, vivify_482
    new $P1247, "Undef"
  vivify_482:
    $P1248 = $P1247."deleteIndent"()
    .return ($P1248)
  control_1191:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1249, exception, "payload"
    .return ($P1249)
    rethrow exception
.end


.namespace ["Class";"HashBased"]
.sub "_block1203"  :anon :subid("112_1256283593.06656") :outer("111_1256283593.06656")
    .param pmc param_1205
    .lex "$_", param_1205
    find_lex $P1206, "@keys"
    unless_null $P1206, vivify_465
    new $P1206, "ResizablePMCArray"
  vivify_465:
    find_lex $P1207, "$_"
    unless_null $P1207, vivify_466
    new $P1207, "Undef"
  vivify_466:
    set $S1208, $P1207
    $P1209 = $P1206."push"($S1208)
    .return ($P1209)
.end


.namespace ["Class";"HashBased"]
.sub "_block1218"  :anon :subid("113_1256283593.06656") :outer("111_1256283593.06656")
    .param pmc param_1220
    .lex "$_", param_1220
    find_lex $P1221, "$brace"
    unless_null $P1221, vivify_470
    new $P1221, "Undef"
  vivify_470:
    find_lex $P1222, "$subindent"
    unless_null $P1222, vivify_471
    new $P1222, "Undef"
  vivify_471:
    "print"($P1221, "\n", $P1222)
    new $P1223, "String"
    assign $P1223, ""
    store_lex "$brace", $P1223
    find_lex $P1224, "$_"
    unless_null $P1224, vivify_472
    new $P1224, "Undef"
  vivify_472:
    set $S1225, $P1224
    new $P1226, 'String'
    set $P1226, $S1225
    .lex "$key", $P1226
    find_lex $P1227, "$key"
    unless_null $P1227, vivify_473
    new $P1227, "Undef"
  vivify_473:
    find_lex $P1228, "self"
    unless_null $P1228, vivify_474
    new $P1228, "Hash"
  vivify_474:
    set $P1229, $P1228[$P1227]
    unless_null $P1229, vivify_475
    new $P1229, "Undef"
  vivify_475:
    .lex "$val", $P1229
    find_lex $P1230, "$key"
    unless_null $P1230, vivify_476
    new $P1230, "Undef"
  vivify_476:
    "print"("<", $P1230, "> => ")
    find_lex $P1231, "$dumper"
    unless_null $P1231, vivify_477
    new $P1231, "Undef"
  vivify_477:
    find_lex $P1232, "$label"
    unless_null $P1232, vivify_478
    new $P1232, "Undef"
  vivify_478:
    find_lex $P1233, "$val"
    unless_null $P1233, vivify_479
    new $P1233, "Undef"
  vivify_479:
    $P1234 = $P1231."dump"($P1232, $P1233)
    .return ($P1234)
.end


.namespace ["Class";"HashBased"]
.sub "_block1243"  :anon :subid("115_1256283593.06656") :outer("111_1256283593.06656")
    find_lex $P1245, "$indent"
    unless_null $P1245, vivify_481
    new $P1245, "Undef"
  vivify_481:
    $P1246 = "print"("\n", $P1245, "}")
    .return ($P1246)
.end


.namespace ["Class";"HashBased"]
.sub "_block1240"  :anon :subid("114_1256283593.06656") :outer("111_1256283593.06656")
    $P1242 = "print"("(no attributes set)")
    .return ($P1242)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256214668.75224")
    get_hll_global $P14, ["Config"], "_block13" 
    .return ($P14)
.end


.namespace ["Config"]
.sub "_block13" :init :load :subid("11_1256214668.75224")
    .const 'Sub' $P73 = "18_1256214668.75224" 
    capture_lex $P73
    .const 'Sub' $P59 = "16_1256214668.75224" 
    capture_lex $P59
    .const 'Sub' $P43 = "15_1256214668.75224" 
    capture_lex $P43
    .const 'Sub' $P26 = "14_1256214668.75224" 
    capture_lex $P26
    .const 'Sub' $P15 = "12_1256214668.75224" 
    capture_lex $P15
    "_ONLOAD"()
    get_global $P58, "$_Pmc"
    unless_null $P58, vivify_29
    new $P58, "Undef"
  vivify_29:
    .const 'Sub' $P73 = "18_1256214668.75224" 
    capture_lex $P73
    .return ($P73)
.end


.namespace ["Config"]
.sub "_ONLOAD"  :subid("12_1256214668.75224") :outer("11_1256214668.75224")
    .const 'Sub' $P21 = "13_1256214668.75224" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_19
    new $P19, "Undef"
  vivify_19:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256214668.75224" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    .return ($P24)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P25, exception, "payload"
    .return ($P25)
    rethrow exception
.end


.namespace ["Config"]
.sub "_block20"  :anon :subid("13_1256214668.75224") :outer("12_1256214668.75224")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Config"]
.sub "DUMPold"  :subid("14_1256214668.75224") :outer("11_1256214668.75224")
    .param pmc param_29 :slurpy
    .param pmc param_30 :slurpy :named
    new $P28, 'ExceptionHandler'
    set_addr $P28, control_27
    $P28."handle_types"(58)
    push_eh $P28
    .lex "@pos", param_29
    .lex "%what", param_30
    get_hll_global $P31, ["Dumper"], "info"
    $P32 = $P31()
    .lex "@info", $P32
    find_lex $P35, "@info"
    unless_null $P35, vivify_20
    new $P35, "ResizablePMCArray"
  vivify_20:
    set $P36, $P35[0]
    unless_null $P36, vivify_21
    new $P36, "Undef"
  vivify_21:
    if $P36, if_34
    set $P33, $P36
    goto if_34_end
  if_34:
    get_hll_global $P37, ["Dumper"], "DUMPold"
    find_lex $P38, "@info"
    unless_null $P38, vivify_22
    new $P38, "ResizablePMCArray"
  vivify_22:
    find_lex $P39, "@pos"
    unless_null $P39, vivify_23
    new $P39, "ResizablePMCArray"
  vivify_23:
    find_lex $P40, "%what"
    unless_null $P40, vivify_24
    new $P40, "Hash"
  vivify_24:
    $P41 = $P37($P38, $P39, $P40)
    set $P33, $P41
  if_34_end:
    .return ($P33)
  control_27:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P42, exception, "payload"
    .return ($P42)
    rethrow exception
.end


.namespace ["Config"]
.sub "NOTEold"  :subid("15_1256214668.75224") :outer("11_1256214668.75224")
    .param pmc param_46 :slurpy
    new $P45, 'ExceptionHandler'
    set_addr $P45, control_44
    $P45."handle_types"(58)
    push_eh $P45
    .lex "@parts", param_46
    get_hll_global $P47, ["Dumper"], "info"
    $P48 = $P47()
    .lex "@info", $P48
    find_lex $P51, "@info"
    unless_null $P51, vivify_25
    new $P51, "ResizablePMCArray"
  vivify_25:
    set $P52, $P51[0]
    unless_null $P52, vivify_26
    new $P52, "Undef"
  vivify_26:
    if $P52, if_50
    set $P49, $P52
    goto if_50_end
  if_50:
    get_hll_global $P53, ["Dumper"], "NOTEold"
    find_lex $P54, "@info"
    unless_null $P54, vivify_27
    new $P54, "ResizablePMCArray"
  vivify_27:
    find_lex $P55, "@parts"
    unless_null $P55, vivify_28
    new $P55, "ResizablePMCArray"
  vivify_28:
    $P56 = $P53($P54, $P55)
    set $P49, $P56
  if_50_end:
    .return ($P49)
  control_44:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P57, exception, "payload"
    .return ($P57)
    rethrow exception
.end


.namespace ["Config"]
.sub "_get_pmc"  :subid("16_1256214668.75224") :outer("11_1256214668.75224")
    .const 'Sub' $P67 = "17_1256214668.75224" 
    capture_lex $P67
    new $P61, 'ExceptionHandler'
    set_addr $P61, control_60
    $P61."handle_types"(58)
    push_eh $P61
    get_hll_global $P63, ["Parrot"], "defined"
    get_global $P64, "$_Pmc"
    unless_null $P64, vivify_30
    new $P64, "Undef"
  vivify_30:
    $P65 = $P63($P64)
    if $P65, unless_62_end
    .const 'Sub' $P67 = "17_1256214668.75224" 
    capture_lex $P67
    $P67()
  unless_62_end:
    get_global $P69, "$_Pmc"
    unless_null $P69, vivify_31
    new $P69, "Undef"
  vivify_31:
    "DUMPold"($P69)
    new $P70, "Exception"
    set $P70['type'], 58
    get_global $P71, "$_Pmc"
    unless_null $P71, vivify_32
    new $P71, "Undef"
  vivify_32:
    setattribute $P70, 'payload', $P71
    throw $P70
    .return ()
  control_60:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P72, exception, "payload"
    .return ($P72)
    rethrow exception
.end


.namespace ["Config"]
.sub "_block66"  :anon :subid("17_1256214668.75224") :outer("16_1256214668.75224")

			load_bytecode "config.pbc"
			$P68 = _config()
		
    set_global "$_Pmc", $P68
    .return ($P68)
.end


.namespace ["Config"]
.sub "query"  :subid("18_1256214668.75224") :outer("11_1256214668.75224")
    .param pmc param_76
    new $P75, 'ExceptionHandler'
    set_addr $P75, control_74
    $P75."handle_types"(58)
    push_eh $P75
    .lex "$key", param_76
    find_lex $P77, "$key"
    unless_null $P77, vivify_33
    new $P77, "Undef"
  vivify_33:
    "NOTEold"("Querying for Config setting: '", $P77, "'")
    find_lex $P78, "$key"
    unless_null $P78, vivify_34
    new $P78, "Undef"
  vivify_34:
    $P79 = "_get_pmc"()
    set $P80, $P79[$P78]
    unless_null $P80, vivify_35
    new $P80, "Undef"
  vivify_35:
    .lex "$result", $P80
    find_lex $P81, "$result"
    unless_null $P81, vivify_36
    new $P81, "Undef"
  vivify_36:
    "DUMPold"($P81)
    new $P82, "Exception"
    set $P82['type'], 58
    find_lex $P83, "$result"
    unless_null $P83, vivify_37
    new $P83, "Undef"
  vivify_37:
    setattribute $P82, 'payload', $P83
    throw $P82
    .return ()
  control_74:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P84, exception, "payload"
    .return ($P84)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256272536.61978")
    get_hll_global $P14, ["ConfigFile"], "_block13" 
    .return ($P14)
.end


.namespace ["ConfigFile"]
.sub "_block13" :init :load :subid("11_1256272536.61978")
    .const 'Sub' $P178 = "23_1256272536.61978" 
    capture_lex $P178
    .const 'Sub' $P163 = "22_1256272536.61978" 
    capture_lex $P163
    .const 'Sub' $P83 = "17_1256272536.61978" 
    capture_lex $P83
    .const 'Sub' $P73 = "16_1256272536.61978" 
    capture_lex $P73
    .const 'Sub' $P39 = "14_1256272536.61978" 
    capture_lex $P39
    .const 'Sub' $P15 = "12_1256272536.61978" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P178 = "23_1256272536.61978" 
    capture_lex $P178
    .return ($P178)
.end


.namespace ["ConfigFile"]
.sub "_ONLOAD"  :subid("12_1256272536.61978") :outer("11_1256272536.61978")
    .const 'Sub' $P21 = "13_1256272536.61978" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_24
    new $P19, "Undef"
  vivify_24:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256272536.61978" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Registry"], "_ONLOAD"
    $P25()
    get_hll_global $P26, ["Parrot"], "IMPORT"
    $P26("Dumper")
    get_hll_global $P27, ["Class"], "SUBCLASS"
    $P27("ConfigFile", "Class::HashBased")
    get_hll_global $P28, "ConfigFile"
    $P29 = $P28."new"()
    .lex "$config", $P29
    find_lex $P30, "$config"
    unless_null $P30, vivify_25
    new $P30, "Undef"
  vivify_25:
    get_hll_global $P31, "Registry"
    unless_null $P31, vivify_26
    new $P31, "Hash"
    set_hll_global "Registry", $P31
  vivify_26:
    set $P31["CONFIG"], $P30
    find_lex $P32, "$config"
    unless_null $P32, vivify_27
    new $P32, "Undef"
  vivify_27:
    $P32."store"("Dump::ConfigFile::_onload", 0)
    find_lex $P33, "$config"
    unless_null $P33, vivify_28
    new $P33, "Undef"
  vivify_28:
    $P33."store"("Dump::ConfigFile::parse_config", 0)
    find_lex $P34, "$config"
    unless_null $P34, vivify_29
    new $P34, "Undef"
  vivify_29:
    $P34."store"("Dump::ConfigFile::query", 0)
    find_lex $P35, "$config"
    unless_null $P35, vivify_30
    new $P35, "Undef"
  vivify_30:
    $P35."store"("Dump::Parrot::defined", 7)
    find_lex $P36, "$config"
    unless_null $P36, vivify_31
    new $P36, "Undef"
  vivify_31:
    $P36."store"("Dump::Stack::Root", "parrot::close::Compiler::main")
    $P37 = "NOTE"("ConfigFile::_onload: done")
    .return ($P37)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P38, exception, "payload"
    .return ($P38)
    rethrow exception
.end


.namespace ["ConfigFile"]
.sub "_block20"  :anon :subid("13_1256272536.61978") :outer("12_1256272536.61978")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["ConfigFile"]
.sub "file"  :subid("14_1256272536.61978") :method :outer("11_1256272536.61978")
    .param pmc param_42 :optional
    .param int has_param_42 :opt_flag
    .const 'Sub' $P55 = "15_1256272536.61978" 
    capture_lex $P55
    new $P41, 'ExceptionHandler'
    set_addr $P41, control_40
    $P41."handle_types"(58)
    push_eh $P41
    .lex "self", self
    if has_param_42, optparam_32
    new $P43, "Undef"
    set param_42, $P43
  optparam_32:
    .lex "$filename", param_42
    find_lex $P47, "$filename"
    unless_null $P47, vivify_33
    new $P47, "Undef"
  vivify_33:
    if $P47, if_46
    set $P45, $P47
    goto if_46_end
  if_46:
    find_lex $P48, "self"
    unless_null $P48, vivify_34
    new $P48, "Hash"
  vivify_34:
    set $P49, $P48["_filename"]
    unless_null $P49, vivify_35
    new $P49, "Undef"
  vivify_35:
    set $S50, $P49
    find_lex $P51, "$filename"
    unless_null $P51, vivify_36
    new $P51, "Undef"
  vivify_36:
    set $S52, $P51
    isne $I53, $S50, $S52
    new $P45, 'Integer'
    set $P45, $I53
  if_46_end:
    unless $P45, if_44_end
    .const 'Sub' $P55 = "15_1256272536.61978" 
    capture_lex $P55
    $P55()
  if_44_end:
    new $P69, "Exception"
    set $P69['type'], 58
    find_lex $P70, "self"
    unless_null $P70, vivify_43
    new $P70, "Hash"
  vivify_43:
    set $P71, $P70["_filename"]
    unless_null $P71, vivify_44
    new $P71, "Undef"
  vivify_44:
    setattribute $P69, 'payload', $P71
    throw $P69
    .return ()
  control_40:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P72, exception, "payload"
    .return ($P72)
    rethrow exception
.end


.namespace ["ConfigFile"]
.sub "_block54"  :anon :subid("15_1256272536.61978") :outer("14_1256272536.61978")
    find_lex $P56, "$filename"
    unless_null $P56, vivify_37
    new $P56, "Undef"
  vivify_37:
    "NOTE"("Reading filename: ", $P56)
    get_hll_global $P57, ["File"], "slurp"
    find_lex $P58, "$filename"
    unless_null $P58, vivify_38
    new $P58, "Undef"
  vivify_38:
    $P59 = $P57($P58)
    .lex "$data", $P59
    get_hll_global $P60, ["Hash"], "empty"
    $P61 = $P60()
    find_lex $P62, "self"
    unless_null $P62, vivify_39
    new $P62, "Hash"
    store_lex "self", $P62
  vivify_39:
    set $P62["_data"], $P61
    find_lex $P63, "self"
    find_lex $P64, "$data"
    unless_null $P64, vivify_40
    new $P64, "Undef"
  vivify_40:
    $P63."parse_config"($P64)
    find_lex $P65, "$filename"
    unless_null $P65, vivify_41
    new $P65, "Undef"
  vivify_41:
    find_lex $P66, "self"
    unless_null $P66, vivify_42
    new $P66, "Hash"
    store_lex "self", $P66
  vivify_42:
    set $P66["_filename"], $P65
    find_lex $P67, "self"
    $P68 = "DUMP"($P67)
    .return ($P68)
.end


.namespace ["ConfigFile"]
.sub "init"  :subid("16_1256272536.61978") :method :outer("11_1256272536.61978")
    .param pmc param_76
    .param pmc param_77
    new $P75, 'ExceptionHandler'
    set_addr $P75, control_74
    $P75."handle_types"(58)
    push_eh $P75
    .lex "self", self
    .lex "@children", param_76
    .lex "%attributes", param_77
    new $P78, "String"
    assign $P78, "<no filename set>"
    find_lex $P79, "self"
    unless_null $P79, vivify_45
    new $P79, "Hash"
    store_lex "self", $P79
  vivify_45:
    set $P79["_filename"], $P78
    new $P80, "Exception"
    set $P80['type'], 58
    find_lex $P81, "self"
    setattribute $P80, 'payload', $P81
    throw $P80
    .return ()
  control_74:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P82, exception, "payload"
    .return ($P82)
    rethrow exception
.end


.namespace ["ConfigFile"]
.sub "parse_config"  :subid("17_1256272536.61978") :method :outer("11_1256272536.61978")
    .param pmc param_86
    .const 'Sub' $P96 = "18_1256272536.61978" 
    capture_lex $P96
    new $P85, 'ExceptionHandler'
    set_addr $P85, control_84
    $P85."handle_types"(58)
    push_eh $P85
    .lex "self", self
    .lex "$data", param_86
    find_lex $P87, "$data"
    unless_null $P87, vivify_46
    new $P87, "Undef"
  vivify_46:
    $P88 = $P87."split"("\n")
    .lex "@lines", $P88
    find_lex $P89, "@lines"
    unless_null $P89, vivify_47
    new $P89, "ResizablePMCArray"
  vivify_47:
    "DUMP"($P89)
    new $P90, "Integer"
    assign $P90, 0
    .lex "$line_number", $P90
    find_lex $P92, "@lines"
    unless_null $P92, vivify_48
    new $P92, "ResizablePMCArray"
  vivify_48:
    defined $I93, $P92
    unless $I93, for_undef_49
    iter $P91, $P92
    new $P158, 'ExceptionHandler'
    set_addr $P158, loop157_handler
    $P158."handle_types"(65, 67, 66)
    push_eh $P158
  loop157_test:
    unless $P91, loop157_done
    shift $P94, $P91
  loop157_redo:
    .const 'Sub' $P96 = "18_1256272536.61978" 
    capture_lex $P96
    $P96($P94)
  loop157_next:
    goto loop157_test
  loop157_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P159, exception, 'type'
    eq $P159, 65, loop157_next
    eq $P159, 67, loop157_redo
  loop157_done:
    pop_eh 
  for_undef_49:
    find_lex $P160, "self"
    $P161 = "DUMP"($P160)
    .return ($P161)
  control_84:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P162, exception, "payload"
    .return ($P162)
    rethrow exception
.end


.namespace ["ConfigFile"]
.sub "_block95"  :anon :subid("18_1256272536.61978") :outer("17_1256272536.61978")
    .param pmc param_97
    .const 'Sub' $P120 = "19_1256272536.61978" 
    capture_lex $P120
    .lex "$_", param_97
    find_lex $P98, "$line_number"
    unless_null $P98, vivify_50
    new $P98, "Undef"
  vivify_50:
        ##  inline postfix:++
        clone $P99, $P98
        inc $P98
    new $P100, "String"
    assign $P100, "    "
    find_lex $P101, "$line_number"
    unless_null $P101, vivify_51
    new $P101, "Undef"
  vivify_51:
    concat $P102, $P100, $P101
    new $P103, "Integer"
    assign $P103, 4
    neg $P104, $P103
    $P105 = $P102."substr"($P104)
    find_lex $P106, "$_"
    unless_null $P106, vivify_52
    new $P106, "Undef"
  vivify_52:
    "NOTE"($P105, ": ", $P106)
    get_hll_global $P107, ["String"], "trim"
    find_lex $P108, "$_"
    unless_null $P108, vivify_53
    new $P108, "Undef"
  vivify_53:
    $P109 = $P107($P108)
    .lex "$line", $P109
    find_lex $P114, "$line"
    unless_null $P114, vivify_54
    new $P114, "Undef"
  vivify_54:
    if $P114, if_113
    set $P112, $P114
    goto if_113_end
  if_113:
    find_lex $P115, "$line"
    unless_null $P115, vivify_55
    new $P115, "ResizablePMCArray"
  vivify_55:
    set $P116, $P115[0]
    unless_null $P116, vivify_56
    new $P116, "Undef"
  vivify_56:
    set $S117, $P116
    isne $I118, $S117, "#"
    new $P112, 'Integer'
    set $P112, $I118
  if_113_end:
    if $P112, if_111
    set $P110, $P112
    goto if_111_end
  if_111:
    .const 'Sub' $P120 = "19_1256272536.61978" 
    capture_lex $P120
    $P156 = $P120()
    set $P110, $P156
  if_111_end:
    .return ($P110)
.end


.namespace ["ConfigFile"]
.sub "_block119"  :anon :subid("19_1256272536.61978") :outer("18_1256272536.61978")
    .const 'Sub' $P144 = "21_1256272536.61978" 
    capture_lex $P144
    .const 'Sub' $P136 = "20_1256272536.61978" 
    capture_lex $P136
    find_lex $P121, "$line"
    unless_null $P121, vivify_57
    new $P121, "Undef"
  vivify_57:
    $P122 = $P121."split"("=")
    .lex "@kv", $P122
    get_hll_global $P123, ["String"], "trim"
    find_lex $P124, "@kv"
    unless_null $P124, vivify_58
    new $P124, "ResizablePMCArray"
  vivify_58:
    $P125 = $P124."shift"()
    $P126 = $P123($P125)
    .lex "$key", $P126
    get_hll_global $P129, ["String"], "length"
    find_lex $P130, "$key"
    unless_null $P130, vivify_59
    new $P130, "Undef"
  vivify_59:
    $N131 = $P129($P130)
    new $P132, "Integer"
    assign $P132, 0
    set $N133, $P132
    iseq $I134, $N131, $N133
    if $I134, if_128
    .const 'Sub' $P144 = "21_1256272536.61978" 
    capture_lex $P144
    $P155 = $P144()
    set $P127, $P155
    goto if_128_end
  if_128:
    .const 'Sub' $P136 = "20_1256272536.61978" 
    capture_lex $P136
    $P142 = $P136()
    set $P127, $P142
  if_128_end:
    .return ($P127)
.end


.namespace ["ConfigFile"]
.sub "_block143"  :anon :subid("21_1256272536.61978") :outer("19_1256272536.61978")
    get_hll_global $P145, ["String"], "trim"
    find_lex $P146, "@kv"
    unless_null $P146, vivify_60
    new $P146, "ResizablePMCArray"
  vivify_60:
    $P147 = $P146."join"("=")
    $P148 = $P145($P147)
    .lex "$value", $P148
    find_lex $P149, "$key"
    unless_null $P149, vivify_61
    new $P149, "Undef"
  vivify_61:
    "NOTE"("Key:\t", $P149)
    find_lex $P150, "$value"
    unless_null $P150, vivify_62
    new $P150, "Undef"
  vivify_62:
    "NOTE"("Value:\t", $P150)
    find_lex $P151, "self"
    find_lex $P152, "$key"
    unless_null $P152, vivify_63
    new $P152, "Undef"
  vivify_63:
    find_lex $P153, "$value"
    unless_null $P153, vivify_64
    new $P153, "Undef"
  vivify_64:
    $P154 = $P151."store"($P152, $P153)
    .return ($P154)
.end


.namespace ["ConfigFile"]
.sub "_block135"  :anon :subid("20_1256272536.61978") :outer("19_1256272536.61978")
    find_lex $P137, "self"
    unless_null $P137, vivify_65
    new $P137, "Hash"
  vivify_65:
    set $P138, $P137["_filename"]
    unless_null $P138, vivify_66
    new $P138, "Undef"
  vivify_66:
    find_lex $P139, "$line_number"
    unless_null $P139, vivify_67
    new $P139, "Undef"
  vivify_67:
    "say"("Warning: in file '", $P138, "', line #", $P139, ": zero-length keys are not allowed.")
    find_lex $P140, "$line"
    unless_null $P140, vivify_68
    new $P140, "Undef"
  vivify_68:
    $P141 = "say"($P140)
    .return ($P141)
.end


.namespace ["ConfigFile"]
.sub "query"  :subid("22_1256272536.61978") :method :outer("11_1256272536.61978")
    .param pmc param_166 :slurpy
    new $P165, 'ExceptionHandler'
    set_addr $P165, control_164
    $P165."handle_types"(58)
    push_eh $P165
    .lex "self", self
    .lex "@keys", param_166
    find_lex $P167, "@keys"
    unless_null $P167, vivify_69
    new $P167, "ResizablePMCArray"
  vivify_69:
    $P168 = $P167."join"("::")
    .lex "$key", $P168
    find_lex $P169, "$key"
    unless_null $P169, vivify_70
    new $P169, "Undef"
  vivify_70:
    "NOTE"("Querying for key: ", $P169)
    find_lex $P170, "$key"
    unless_null $P170, vivify_71
    new $P170, "Undef"
  vivify_71:
    find_lex $P171, "self"
    unless_null $P171, vivify_72
    new $P171, "Hash"
  vivify_72:
    set $P172, $P171["_data"]
    unless_null $P172, vivify_73
    new $P172, "Hash"
  vivify_73:
    set $P173, $P172[$P170]
    unless_null $P173, vivify_74
    new $P173, "Undef"
  vivify_74:
    .lex "$value", $P173
    find_lex $P174, "$value"
    unless_null $P174, vivify_75
    new $P174, "Undef"
  vivify_75:
    "NOTE"("Value: ", $P174)
    new $P175, "Exception"
    set $P175['type'], 58
    find_lex $P176, "$value"
    unless_null $P176, vivify_76
    new $P176, "Undef"
  vivify_76:
    setattribute $P175, 'payload', $P176
    throw $P175
    .return ()
  control_164:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P177, exception, "payload"
    .return ($P177)
    rethrow exception
.end


.namespace ["ConfigFile"]
.sub "store"  :subid("23_1256272536.61978") :method :outer("11_1256272536.61978")
    .param pmc param_181
    .param pmc param_182
    new $P180, 'ExceptionHandler'
    set_addr $P180, control_179
    $P180."handle_types"(58)
    push_eh $P180
    .lex "self", self
    .lex "$key", param_181
    .lex "$value", param_182
    find_lex $P183, "$key"
    unless_null $P183, vivify_77
    new $P183, "Undef"
  vivify_77:
    find_lex $P184, "$value"
    unless_null $P184, vivify_78
    new $P184, "Undef"
  vivify_78:
    "NOTE"("ConfigFile: Storing key '", $P183, "' value: ", $P184)
    new $P185, "Exception"
    set $P185['type'], 58
    find_lex $P186, "$value"
    unless_null $P186, vivify_79
    new $P186, "Undef"
  vivify_79:
    find_lex $P187, "$key"
    unless_null $P187, vivify_80
    new $P187, "Undef"
  vivify_80:
    find_lex $P188, "self"
    unless_null $P188, vivify_81
    new $P188, "Hash"
    store_lex "self", $P188
  vivify_81:
    set $P189, $P188["_data"]
    unless_null $P189, vivify_82
    new $P189, "Hash"
    set $P188["_data"], $P189
  vivify_82:
    set $P189[$P187], $P186
    setattribute $P185, 'payload', $P186
    throw $P185
    .return ()
  control_179:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P190, exception, "payload"
    .return ($P190)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256253310.45975")
    get_hll_global $P14, ["Dumper"], "_block13" 
    .return ($P14)
.end


.namespace ["Dumper"]
.sub "_block13" :init :load :subid("11_1256253310.45975")
    .const 'Sub' $P569 = "63_1256253310.45975" 
    capture_lex $P569
    .const 'Sub' $P556 = "62_1256253310.45975" 
    capture_lex $P556
    .const 'Sub' $P524 = "60_1256253310.45975" 
    capture_lex $P524
    .const 'Sub' $P465 = "55_1256253310.45975" 
    capture_lex $P465
    .const 'Sub' $P407 = "51_1256253310.45975" 
    capture_lex $P407
    .const 'Sub' $P389 = "49_1256253310.45975" 
    capture_lex $P389
    .const 'Sub' $P370 = "47_1256253310.45975" 
    capture_lex $P370
    .const 'Sub' $P351 = "45_1256253310.45975" 
    capture_lex $P351
    .const 'Sub' $P333 = "43_1256253310.45975" 
    capture_lex $P333
    .const 'Sub' $P322 = "42_1256253310.45975" 
    capture_lex $P322
    .const 'Sub' $P272 = "37_1256253310.45975" 
    capture_lex $P272
    .const 'Sub' $P253 = "35_1256253310.45975" 
    capture_lex $P253
    .const 'Sub' $P241 = "34_1256253310.45975" 
    capture_lex $P241
    .const 'Sub' $P167 = "27_1256253310.45975" 
    capture_lex $P167
    .const 'Sub' $P145 = "25_1256253310.45975" 
    capture_lex $P145
    .const 'Sub' $P141 = "24_1256253310.45975" 
    capture_lex $P141
    .const 'Sub' $P103 = "19_1256253310.45975" 
    capture_lex $P103
    .const 'Sub' $P53 = "14_1256253310.45975" 
    capture_lex $P53
    .const 'Sub' $P20 = "12_1256253310.45975" 
    capture_lex $P20
$P15 = get_root_global ["parrot"], "P6metaclass"
    $P15."new_class"("Dumper")
    get_global $P16, "%Already_in"
    unless_null $P16, vivify_67
    new $P16, "Hash"
  vivify_67:
    get_global $P17, "%Bits"
    unless_null $P17, vivify_68
    new $P17, "Hash"
  vivify_68:
    get_global $P18, "$Caller_depth"
    unless_null $P18, vivify_69
    new $P18, "Undef"
  vivify_69:
    get_global $P19, "$Prefix"
    unless_null $P19, vivify_70
    new $P19, "Undef"
  vivify_70:
    "_ONLOAD"()
    get_hll_global $P461, ["Array"], "new"
    new $P462, "Integer"
    assign $P462, 1
    neg $P463, $P462
    $P464 = $P461(0, $P463, "null")
    set_global "@Info_rejected", $P464
    new $P520, "String"
    assign $P520, ":.."
    set_global "$Prefix_string", $P520
    get_hll_global $P521, ["String"], "length"
    get_global $P522, "$Prefix_string"
    unless_null $P522, vivify_237
    new $P522, "Undef"
  vivify_237:
    $P523 = $P521($P522)
    set_global "$Prefix_string_len", $P523
    .const 'Sub' $P569 = "63_1256253310.45975" 
    capture_lex $P569
    .return ($P569)
.end


.namespace ["Dumper"]
.sub "_ONLOAD"  :subid("12_1256253310.45975") :outer("11_1256253310.45975")
    .const 'Sub' $P26 = "13_1256253310.45975" 
    capture_lex $P26
    new $P22, 'ExceptionHandler'
    set_addr $P22, control_21
    $P22."handle_types"(58)
    push_eh $P22
    get_global $P24, "$onload_done"
    unless_null $P24, vivify_71
    new $P24, "Undef"
  vivify_71:
    unless $P24, if_23_end
    .const 'Sub' $P26 = "13_1256253310.45975" 
    capture_lex $P26
    $P26()
  if_23_end:
    new $P29, "Integer"
    assign $P29, 1
    set_global "$onload_done", $P29
    get_hll_global $P30, ["Parrot"], "_ONLOAD"
    $P30()
    new $P31, "Integer"
    assign $P31, 0
    get_global $P32, "%Already_in"
    unless_null $P32, vivify_72
    new $P32, "Hash"
    set_global "%Already_in", $P32
  vivify_72:
    set $P32["ASSERTold"], $P31
    new $P33, "Integer"
    assign $P33, 0
    get_global $P34, "%Already_in"
    unless_null $P34, vivify_73
    new $P34, "Hash"
    set_global "%Already_in", $P34
  vivify_73:
    set $P34["ASSERT"], $P33
    new $P35, "Integer"
    assign $P35, 0
    get_global $P36, "%Already_in"
    unless_null $P36, vivify_74
    new $P36, "Hash"
    set_global "%Already_in", $P36
  vivify_74:
    set $P36["DIE"], $P35
    new $P37, "Integer"
    assign $P37, 0
    get_global $P38, "%Already_in"
    unless_null $P38, vivify_75
    new $P38, "Hash"
    set_global "%Already_in", $P38
  vivify_75:
    set $P38["DUMP"], $P37
    new $P39, "Integer"
    assign $P39, 0
    get_global $P40, "%Already_in"
    unless_null $P40, vivify_76
    new $P40, "Hash"
    set_global "%Already_in", $P40
  vivify_76:
    set $P40["INFO"], $P39
    new $P41, "Integer"
    assign $P41, 0
    get_global $P42, "%Already_in"
    unless_null $P42, vivify_77
    new $P42, "Hash"
    set_global "%Already_in", $P42
  vivify_77:
    set $P42["NOTE"], $P41
    new $P43, "Integer"
    assign $P43, 1
    get_global $P44, "%Bits"
    unless_null $P44, vivify_78
    new $P44, "Hash"
    set_global "%Bits", $P44
  vivify_78:
    set $P44["NOTE"], $P43
    new $P45, "Integer"
    assign $P45, 2
    get_global $P46, "%Bits"
    unless_null $P46, vivify_79
    new $P46, "Hash"
    set_global "%Bits", $P46
  vivify_79:
    set $P46["DUMP"], $P45
    new $P47, "Integer"
    assign $P47, 4
    get_global $P48, "%Bits"
    unless_null $P48, vivify_80
    new $P48, "Hash"
    set_global "%Bits", $P48
  vivify_80:
    set $P48["ASSERT"], $P47
    new $P49, "Integer"
    assign $P49, 0
    set_global "$Caller_depth", $P49
    get_hll_global $P50, ["Parrot"], "load_bytecode"
    $P51 = $P50("dumper.pbc")
    .return ($P51)
  control_21:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P52, exception, "payload"
    .return ($P52)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "_block25"  :anon :subid("13_1256253310.45975") :outer("12_1256253310.45975")
    new $P27, "Exception"
    set $P27['type'], 58
    new $P28, "Integer"
    assign $P28, 0
    setattribute $P27, 'payload', $P28
    throw $P27
    .return ()
.end


.namespace ["Dumper"]
.sub "ASSERTold"  :subid("14_1256253310.45975") :outer("11_1256253310.45975")
    .param pmc param_56
    .param pmc param_57
    .param pmc param_58
    .const 'Sub' $P94 = "18_1256253310.45975" 
    capture_lex $P94
    .const 'Sub' $P72 = "16_1256253310.45975" 
    capture_lex $P72
    .const 'Sub' $P63 = "15_1256253310.45975" 
    capture_lex $P63
    new $P55, 'ExceptionHandler'
    set_addr $P55, control_54
    $P55."handle_types"(58)
    push_eh $P55
    .lex "@info", param_56
    .lex "$condition", param_57
    .lex "@message", param_58
    get_global $P60, "%Already_in"
    unless_null $P60, vivify_81
    new $P60, "Hash"
  vivify_81:
    set $P61, $P60["ASSERTold"]
    unless_null $P61, vivify_82
    new $P61, "Undef"
  vivify_82:
    unless $P61, if_59_end
    .const 'Sub' $P63 = "15_1256253310.45975" 
    capture_lex $P63
    $P63()
  if_59_end:
    get_global $P66, "%Already_in"
    unless_null $P66, vivify_84
    new $P66, "Hash"
  vivify_84:
    set $P67, $P66["ASSERTold"]
    unless_null $P67, vivify_85
    new $P67, "Undef"
  vivify_85:
        ##  inline postfix:++
        clone $P68, $P67
        inc $P67
    find_lex $P70, "$condition"
    unless_null $P70, vivify_86
    new $P70, "Undef"
  vivify_86:
    if $P70, if_69
    .const 'Sub' $P94 = "18_1256253310.45975" 
    capture_lex $P94
    $P94()
    goto if_69_end
  if_69:
    .const 'Sub' $P72 = "16_1256253310.45975" 
    capture_lex $P72
    $P72()
  if_69_end:
    get_global $P99, "%Already_in"
    unless_null $P99, vivify_97
    new $P99, "Hash"
  vivify_97:
    set $P100, $P99["ASSERTold"]
    unless_null $P100, vivify_98
    new $P100, "Undef"
  vivify_98:
        ##  inline postfix:--
        clone $P101, $P100
        dec $P100
    .return ($P101)
  control_54:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "_block62"  :anon :subid("15_1256253310.45975") :outer("14_1256253310.45975")
    new $P64, "Exception"
    set $P64['type'], 58
    find_lex $P65, "$condition"
    unless_null $P65, vivify_83
    new $P65, "Undef"
  vivify_83:
    setattribute $P64, 'payload', $P65
    throw $P64
    .return ()
.end


.namespace ["Dumper"]
.sub "_block93"  :anon :subid("18_1256253310.45975") :outer("14_1256253310.45975")
    find_lex $P95, "@message"
    unless_null $P95, vivify_87
    new $P95, "ResizablePMCArray"
  vivify_87:
    $P95."unshift"("ASSERT FAILED: ")
    find_lex $P96, "@info"
    unless_null $P96, vivify_88
    new $P96, "ResizablePMCArray"
  vivify_88:
    find_lex $P97, "@message"
    unless_null $P97, vivify_89
    new $P97, "ResizablePMCArray"
  vivify_89:
    $P98 = "DIE"($P96, $P97)
    .return ($P98)
.end


.namespace ["Dumper"]
.sub "_block71"  :anon :subid("16_1256253310.45975") :outer("14_1256253310.45975")
    .const 'Sub' $P87 = "17_1256253310.45975" 
    capture_lex $P87
    find_lex $P77, "@info"
    unless_null $P77, vivify_90
    new $P77, "ResizablePMCArray"
  vivify_90:
    set $P78, $P77[0]
    unless_null $P78, vivify_91
    new $P78, "Undef"
  vivify_91:
    if $P78, if_76
    set $P75, $P78
    goto if_76_end
  if_76:
    find_lex $P79, "@info"
    unless_null $P79, vivify_92
    new $P79, "ResizablePMCArray"
  vivify_92:
    set $P80, $P79[0]
    unless_null $P80, vivify_93
    new $P80, "Undef"
  vivify_93:
    mod $P81, $P80, 8
    set $N82, $P81
    new $P83, "Integer"
    assign $P83, 4
    set $N84, $P83
    isge $I85, $N82, $N84
    new $P75, 'Integer'
    set $P75, $I85
  if_76_end:
    if $P75, if_74
    set $P73, $P75
    goto if_74_end
  if_74:
    .const 'Sub' $P87 = "17_1256253310.45975" 
    capture_lex $P87
    $P92 = $P87()
    set $P73, $P92
  if_74_end:
    .return ($P73)
.end


.namespace ["Dumper"]
.sub "_block86"  :anon :subid("17_1256253310.45975") :outer("16_1256253310.45975")
    find_lex $P88, "@message"
    unless_null $P88, vivify_94
    new $P88, "ResizablePMCArray"
  vivify_94:
    $P88."unshift"("ASSERT PASSED: ")
    find_lex $P89, "@info"
    unless_null $P89, vivify_95
    new $P89, "ResizablePMCArray"
  vivify_95:
    find_lex $P90, "@message"
    unless_null $P90, vivify_96
    new $P90, "ResizablePMCArray"
  vivify_96:
    $P91 = "NOTEold"($P89, $P90)
    .return ($P91)
.end


.namespace ["Dumper"]
.sub "ASSERT"  :subid("19_1256253310.45975") :outer("11_1256253310.45975")
    .param pmc param_106
    .param pmc param_107 :slurpy
    .param pmc param_108 :optional :named("caller_level")
    .param int has_param_108 :opt_flag
    .const 'Sub' $P134 = "23_1256253310.45975" 
    capture_lex $P134
    .const 'Sub' $P129 = "22_1256253310.45975" 
    capture_lex $P129
    .const 'Sub' $P125 = "21_1256253310.45975" 
    capture_lex $P125
    .const 'Sub' $P114 = "20_1256253310.45975" 
    capture_lex $P114
    new $P105, 'ExceptionHandler'
    set_addr $P105, control_104
    $P105."handle_types"(58)
    push_eh $P105
    .lex "$condition", param_106
    .lex "@message", param_107
    if has_param_108, optparam_99
    new $P109, "Undef"
    set param_108, $P109
  optparam_99:
    .lex "$caller_level", param_108
    get_global $P111, "%Already_in"
    unless_null $P111, vivify_100
    new $P111, "Hash"
  vivify_100:
    set $P112, $P111["ASSERT"]
    unless_null $P112, vivify_101
    new $P112, "Undef"
  vivify_101:
    unless $P112, if_110_end
    .const 'Sub' $P114 = "20_1256253310.45975" 
    capture_lex $P114
    $P114()
  if_110_end:
    get_global $P117, "%Already_in"
    unless_null $P117, vivify_103
    new $P117, "Hash"
  vivify_103:
    set $P118, $P117["ASSERT"]
    unless_null $P118, vivify_104
    new $P118, "Undef"
  vivify_104:
        ##  inline postfix:++
        clone $P119, $P118
        inc $P118
    new $P120, "Undef"
    .lex "$message", $P120
    find_lex $P122, "@message"
    unless_null $P122, vivify_105
    new $P122, "ResizablePMCArray"
  vivify_105:
    set $N123, $P122
    if $N123, if_121
    .const 'Sub' $P129 = "22_1256253310.45975" 
    capture_lex $P129
    $P129()
    goto if_121_end
  if_121:
    .const 'Sub' $P125 = "21_1256253310.45975" 
    capture_lex $P125
    $P125()
  if_121_end:
    find_lex $P132, "$condition"
    unless_null $P132, vivify_107
    new $P132, "Undef"
  vivify_107:
    if $P132, unless_131_end
    .const 'Sub' $P134 = "23_1256253310.45975" 
    capture_lex $P134
    $P134()
  unless_131_end:
    get_global $P135, "%Already_in"
    unless_null $P135, vivify_108
    new $P135, "Hash"
  vivify_108:
    set $P136, $P135["ASSERT"]
    unless_null $P136, vivify_109
    new $P136, "Undef"
  vivify_109:
        ##  inline postfix:--
        clone $P137, $P136
        dec $P136
    new $P138, "Exception"
    set $P138['type'], 58
    find_lex $P139, "$condition"
    unless_null $P139, vivify_110
    new $P139, "Undef"
  vivify_110:
    setattribute $P138, 'payload', $P139
    throw $P138
    .return ()
  control_104:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P140, exception, "payload"
    .return ($P140)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "_block113"  :anon :subid("20_1256253310.45975") :outer("19_1256253310.45975")
    new $P115, "Exception"
    set $P115['type'], 58
    find_lex $P116, "$condition"
    unless_null $P116, vivify_102
    new $P116, "Undef"
  vivify_102:
    setattribute $P115, 'payload', $P116
    throw $P115
    .return ()
.end


.namespace ["Dumper"]
.sub "_block128"  :anon :subid("22_1256253310.45975") :outer("19_1256253310.45975")
    new $P130, "String"
    assign $P130, "ASSERTION FAILED"
    store_lex "$message", $P130
    .return ($P130)
.end


.namespace ["Dumper"]
.sub "_block124"  :anon :subid("21_1256253310.45975") :outer("19_1256253310.45975")
    find_lex $P126, "@message"
    unless_null $P126, vivify_106
    new $P126, "ResizablePMCArray"
  vivify_106:
    $P127 = $P126."join"()
    store_lex "$message", $P127
    .return ($P127)
.end


.namespace ["Dumper"]
.sub "_block133"  :anon :subid("23_1256253310.45975") :outer("19_1256253310.45975")

			$P0 = find_lex '$message'
			$S0 = $P0
			die $S0
		
    .return ()
.end


.namespace ["Dumper"]
.sub "BACKTRACE"  :subid("24_1256253310.45975") :outer("11_1256253310.45975")
    new $P143, 'ExceptionHandler'
    set_addr $P143, control_142
    $P143."handle_types"(58)
    push_eh $P143

		backtrace
	
    .return ()
  control_142:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P144, exception, "payload"
    .return ($P144)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "DIE"  :subid("25_1256253310.45975") :outer("11_1256253310.45975")
    .param pmc param_148 :slurpy
    .const 'Sub' $P153 = "26_1256253310.45975" 
    capture_lex $P153
    new $P147, 'ExceptionHandler'
    set_addr $P147, control_146
    $P147."handle_types"(58)
    push_eh $P147
    .lex "@msg", param_148
    get_global $P150, "%Already_in"
    unless_null $P150, vivify_111
    new $P150, "Hash"
  vivify_111:
    set $P151, $P150["DIE"]
    unless_null $P151, vivify_112
    new $P151, "Undef"
  vivify_112:
    unless $P151, if_149_end
    .const 'Sub' $P153 = "26_1256253310.45975" 
    capture_lex $P153
    $P153()
  if_149_end:
    get_global $P156, "%Already_in"
    unless_null $P156, vivify_113
    new $P156, "Hash"
  vivify_113:
    set $P157, $P156["DIE"]
    unless_null $P157, vivify_114
    new $P157, "Undef"
  vivify_114:
        ##  inline postfix:++
        clone $P158, $P157
        inc $P157
    new $P159, "String"
    assign $P159, "DIE: "
    find_lex $P160, "@msg"
    unless_null $P160, vivify_115
    new $P160, "ResizablePMCArray"
  vivify_115:
    $S161 = $P160."join"()
    concat $P162, $P159, $S161
    .lex "$message", $P162

		$P0 = find_lex '$message'
		$S0 = $P0
		die $S0
	
    get_global $P163, "%Already_in"
    unless_null $P163, vivify_116
    new $P163, "Hash"
  vivify_116:
    set $P164, $P163["DIE"]
    unless_null $P164, vivify_117
    new $P164, "Undef"
  vivify_117:
        ##  inline postfix:--
        clone $P165, $P164
        dec $P164
    .return ($P165)
  control_146:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P166, exception, "payload"
    .return ($P166)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "_block152"  :anon :subid("26_1256253310.45975") :outer("25_1256253310.45975")
    new $P154, "Exception"
    set $P154['type'], 58
    new $P155, "Integer"
    assign $P155, 0
    setattribute $P154, 'payload', $P155
    throw $P154
    .return ()
.end


.namespace ["Dumper"]
.sub "DUMP"  :subid("27_1256253310.45975") :outer("11_1256253310.45975")
    .param pmc param_170 :slurpy
    .param pmc param_171 :optional :named("caller_level")
    .param int has_param_171 :opt_flag
    .param pmc param_173 :optional :named("info")
    .param int has_param_173 :opt_flag
    .param pmc param_175 :slurpy :named
    .const 'Sub' $P211 = "31_1256253310.45975" 
    capture_lex $P211
    .const 'Sub' $P194 = "30_1256253310.45975" 
    capture_lex $P194
    .const 'Sub' $P189 = "29_1256253310.45975" 
    capture_lex $P189
    .const 'Sub' $P180 = "28_1256253310.45975" 
    capture_lex $P180
    new $P169, 'ExceptionHandler'
    set_addr $P169, control_168
    $P169."handle_types"(58)
    push_eh $P169
    .lex "@pos", param_170
    if has_param_171, optparam_118
    new $P172, "Undef"
    set param_171, $P172
  optparam_118:
    .lex "$caller_level", param_171
    if has_param_173, optparam_119
    new $P174, "Undef"
    set param_173, $P174
  optparam_119:
    .lex "@info", param_173
    .lex "%named", param_175
    get_global $P177, "%Already_in"
    unless_null $P177, vivify_120
    new $P177, "Hash"
  vivify_120:
    set $P178, $P177["DUMP"]
    unless_null $P178, vivify_121
    new $P178, "Undef"
  vivify_121:
    unless $P178, if_176_end
    .const 'Sub' $P180 = "28_1256253310.45975" 
    capture_lex $P180
    $P180()
  if_176_end:
    get_global $P183, "%Already_in"
    unless_null $P183, vivify_122
    new $P183, "Hash"
  vivify_122:
    set $P184, $P183["DUMP"]
    unless_null $P184, vivify_123
    new $P184, "Undef"
  vivify_123:
        ##  inline postfix:++
        clone $P185, $P184
        inc $P184
    find_lex $P187, "$caller_level"
    unless_null $P187, vivify_124
    new $P187, "Undef"
  vivify_124:
    if $P187, unless_186_end
    .const 'Sub' $P189 = "29_1256253310.45975" 
    capture_lex $P189
    $P189()
  unless_186_end:
    find_lex $P192, "@info"
    unless_null $P192, vivify_125
    new $P192, "ResizablePMCArray"
  vivify_125:
    if $P192, unless_191_end
    .const 'Sub' $P194 = "30_1256253310.45975" 
    capture_lex $P194
    $P194()
  unless_191_end:
    find_lex $P201, "@info"
    unless_null $P201, vivify_127
    new $P201, "ResizablePMCArray"
  vivify_127:
    set $P202, $P201[0]
    unless_null $P202, vivify_128
    new $P202, "Undef"
  vivify_128:
    if $P202, if_200
    set $P199, $P202
    goto if_200_end
  if_200:
    find_lex $P203, "@info"
    unless_null $P203, vivify_129
    new $P203, "ResizablePMCArray"
  vivify_129:
    set $P204, $P203[0]
    unless_null $P204, vivify_130
    new $P204, "Undef"
  vivify_130:
    mod $P205, $P204, 4
    set $N206, $P205
    new $P207, "Integer"
    assign $P207, 1
    set $N208, $P207
    isgt $I209, $N206, $N208
    new $P199, 'Integer'
    set $P199, $I209
  if_200_end:
    unless $P199, if_198_end
    .const 'Sub' $P211 = "31_1256253310.45975" 
    capture_lex $P211
    $P211()
  if_198_end:
    get_global $P237, "%Already_in"
    unless_null $P237, vivify_143
    new $P237, "Hash"
  vivify_143:
    set $P238, $P237["DUMP"]
    unless_null $P238, vivify_144
    new $P238, "Undef"
  vivify_144:
        ##  inline postfix:--
        clone $P239, $P238
        dec $P238
    .return ($P239)
  control_168:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P240, exception, "payload"
    .return ($P240)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "_block179"  :anon :subid("28_1256253310.45975") :outer("27_1256253310.45975")
    new $P181, "Exception"
    set $P181['type'], 58
    new $P182, "Integer"
    assign $P182, 0
    setattribute $P181, 'payload', $P182
    throw $P181
    .return ()
.end


.namespace ["Dumper"]
.sub "_block188"  :anon :subid("29_1256253310.45975") :outer("27_1256253310.45975")
    new $P190, "Integer"
    assign $P190, 0
    store_lex "$caller_level", $P190
    .return ($P190)
.end


.namespace ["Dumper"]
.sub "_block193"  :anon :subid("30_1256253310.45975") :outer("27_1256253310.45975")
    find_lex $P195, "$caller_level"
    unless_null $P195, vivify_126
    new $P195, "Undef"
  vivify_126:
    add $P196, $P195, 2
    $P197 = "info"($P196 :named("caller_level"))
    store_lex "@info", $P197
    .return ($P197)
.end


.namespace ["Dumper"]
.sub "_block210"  :anon :subid("31_1256253310.45975") :outer("27_1256253310.45975")
    .const 'Sub' $P230 = "33_1256253310.45975" 
    capture_lex $P230
    .const 'Sub' $P219 = "32_1256253310.45975" 
    capture_lex $P219
    find_lex $P212, "@info"
    unless_null $P212, vivify_131
    new $P212, "ResizablePMCArray"
  vivify_131:
    set $P213, $P212[1]
    unless_null $P213, vivify_132
    new $P213, "Undef"
  vivify_132:
    $P214 = "make_bare_prefix"($P213)
    set_global "$Prefix", $P214
    find_lex $P216, "@pos"
    unless_null $P216, vivify_133
    new $P216, "ResizablePMCArray"
  vivify_133:
    set $N217, $P216
    unless $N217, if_215_end
    .const 'Sub' $P219 = "32_1256253310.45975" 
    capture_lex $P219
    $P219()
  if_215_end:
    find_lex $P227, "%named"
    unless_null $P227, vivify_138
    new $P227, "Hash"
  vivify_138:
    set $N228, $P227
    if $N228, if_226
    new $P225, 'Float'
    set $P225, $N228
    goto if_226_end
  if_226:
    .const 'Sub' $P230 = "33_1256253310.45975" 
    capture_lex $P230
    $P236 = $P230()
    set $P225, $P236
  if_226_end:
    .return ($P225)
.end


.namespace ["Dumper"]
.sub "_block218"  :anon :subid("32_1256253310.45975") :outer("31_1256253310.45975")
    get_global $P220, "$Prefix"
    unless_null $P220, vivify_134
    new $P220, "Undef"
  vivify_134:
    "print"($P220)
    find_lex $P221, "@pos"
    unless_null $P221, vivify_135
    new $P221, "ResizablePMCArray"
  vivify_135:
    find_lex $P222, "@info"
    unless_null $P222, vivify_136
    new $P222, "ResizablePMCArray"
  vivify_136:
    set $P223, $P222[2]
    unless_null $P223, vivify_137
    new $P223, "Undef"
  vivify_137:
    $P224 = "_dumper"($P221, $P223)
    .return ($P224)
.end


.namespace ["Dumper"]
.sub "_block229"  :anon :subid("33_1256253310.45975") :outer("31_1256253310.45975")
    get_global $P231, "$Prefix"
    unless_null $P231, vivify_139
    new $P231, "Undef"
  vivify_139:
    "print"($P231)
    find_lex $P232, "@pos"
    unless_null $P232, vivify_140
    new $P232, "ResizablePMCArray"
  vivify_140:
    find_lex $P233, "@info"
    unless_null $P233, vivify_141
    new $P233, "ResizablePMCArray"
  vivify_141:
    set $P234, $P233[2]
    unless_null $P234, vivify_142
    new $P234, "Undef"
  vivify_142:
    $P235 = "_dumper"($P232, $P234)
    .return ($P235)
.end


.namespace ["Dumper"]
.sub "DUMPold"  :subid("34_1256253310.45975") :outer("11_1256253310.45975")
    .param pmc param_244
    .param pmc param_245
    .param pmc param_246
    new $P243, 'ExceptionHandler'
    set_addr $P243, control_242
    $P243."handle_types"(58)
    push_eh $P243
    .lex "@info", param_244
    .lex "@pos", param_245
    .lex "%named", param_246
    find_lex $P247, "@pos"
    unless_null $P247, vivify_145
    new $P247, "ResizablePMCArray"
  vivify_145:
    find_lex $P248, "%named"
    unless_null $P248, vivify_146
    new $P248, "Hash"
  vivify_146:
    set $N249, 1
    find_lex $P250, "@info"
    unless_null $P250, vivify_147
    new $P250, "ResizablePMCArray"
  vivify_147:
    $P251 = "DUMP"($P247, $P248, $N249 :named("caller_level"), $P250 :named("info"))
    .return ($P251)
  control_242:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P252, exception, "payload"
    .return ($P252)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "DUMP_"  :subid("35_1256253310.45975") :outer("11_1256253310.45975")
    .param pmc param_256 :slurpy
    .param pmc param_257 :optional :named("label")
    .param int has_param_257 :opt_flag
    .param pmc param_259 :optional :named("prefix")
    .param int has_param_259 :opt_flag
    .const 'Sub' $P264 = "36_1256253310.45975" 
    capture_lex $P264
    new $P255, 'ExceptionHandler'
    set_addr $P255, control_254
    $P255."handle_types"(58)
    push_eh $P255
    .lex "@what", param_256
    if has_param_257, optparam_148
    new $P258, "Undef"
    set param_257, $P258
  optparam_148:
    .lex "$label", param_257
    if has_param_259, optparam_149
    new $P260, "Undef"
    set param_259, $P260
  optparam_149:
    .lex "$prefix", param_259
    find_lex $P262, "$label"
    unless_null $P262, vivify_150
    new $P262, "Undef"
  vivify_150:
    if $P262, unless_261_end
    .const 'Sub' $P264 = "36_1256253310.45975" 
    capture_lex $P264
    $P264()
  unless_261_end:
    find_lex $P266, "$prefix"
    unless_null $P266, vivify_151
    new $P266, "Undef"
  vivify_151:
    "print"($P266)
    get_hll_global $P267, ["PCT"], "HLLCompiler"
    find_lex $P268, "@what"
    unless_null $P268, vivify_152
    new $P268, "ResizablePMCArray"
  vivify_152:
    find_lex $P269, "$label"
    unless_null $P269, vivify_153
    new $P269, "Undef"
  vivify_153:
    $P270 = $P267."dumper"($P268, $P269)
    .return ($P270)
  control_254:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P271, exception, "payload"
    .return ($P271)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "_block263"  :anon :subid("36_1256253310.45975") :outer("35_1256253310.45975")
    new $P265, "String"
    assign $P265, "$VAR"
    store_lex "$label", $P265
    .return ($P265)
.end


.namespace ["Dumper"]
.sub "NOTE"  :subid("37_1256253310.45975") :outer("11_1256253310.45975")
    .param pmc param_275 :slurpy
    .param pmc param_276 :optional :named("caller_level")
    .param int has_param_276 :opt_flag
    .param pmc param_278 :optional :named("info")
    .param int has_param_278 :opt_flag
    .const 'Sub' $P311 = "41_1256253310.45975" 
    capture_lex $P311
    .const 'Sub' $P298 = "40_1256253310.45975" 
    capture_lex $P298
    .const 'Sub' $P293 = "39_1256253310.45975" 
    capture_lex $P293
    .const 'Sub' $P284 = "38_1256253310.45975" 
    capture_lex $P284
    new $P274, 'ExceptionHandler'
    set_addr $P274, control_273
    $P274."handle_types"(58)
    push_eh $P274
    .lex "@parts", param_275
    if has_param_276, optparam_154
    new $P277, "Undef"
    set param_276, $P277
  optparam_154:
    .lex "$caller_level", param_276
    if has_param_278, optparam_155
    new $P279, "Undef"
    set param_278, $P279
  optparam_155:
    .lex "@info", param_278
    get_global $P281, "%Already_in"
    unless_null $P281, vivify_156
    new $P281, "Hash"
  vivify_156:
    set $P282, $P281["NOTE"]
    unless_null $P282, vivify_157
    new $P282, "Undef"
  vivify_157:
    unless $P282, if_280_end
    .const 'Sub' $P284 = "38_1256253310.45975" 
    capture_lex $P284
    $P284()
  if_280_end:
    get_global $P287, "%Already_in"
    unless_null $P287, vivify_158
    new $P287, "Hash"
  vivify_158:
    set $P288, $P287["NOTE"]
    unless_null $P288, vivify_159
    new $P288, "Undef"
  vivify_159:
        ##  inline postfix:++
        clone $P289, $P288
        inc $P288
    find_lex $P291, "$caller_level"
    unless_null $P291, vivify_160
    new $P291, "Undef"
  vivify_160:
    if $P291, unless_290_end
    .const 'Sub' $P293 = "39_1256253310.45975" 
    capture_lex $P293
    $P293()
  unless_290_end:
    find_lex $P296, "@info"
    unless_null $P296, vivify_161
    new $P296, "ResizablePMCArray"
  vivify_161:
    if $P296, unless_295_end
    .const 'Sub' $P298 = "40_1256253310.45975" 
    capture_lex $P298
    $P298()
  unless_295_end:
    find_lex $P305, "@info"
    unless_null $P305, vivify_163
    new $P305, "ResizablePMCArray"
  vivify_163:
    set $P306, $P305[0]
    unless_null $P306, vivify_164
    new $P306, "Undef"
  vivify_164:
    if $P306, if_304
    set $P303, $P306
    goto if_304_end
  if_304:
    find_lex $P307, "@info"
    unless_null $P307, vivify_165
    new $P307, "ResizablePMCArray"
  vivify_165:
    set $P308, $P307[0]
    unless_null $P308, vivify_166
    new $P308, "Undef"
  vivify_166:
    mod $P309, $P308, 2
    set $P303, $P309
  if_304_end:
    unless $P303, if_302_end
    .const 'Sub' $P311 = "41_1256253310.45975" 
    capture_lex $P311
    $P311()
  if_302_end:
    get_global $P318, "%Already_in"
    unless_null $P318, vivify_170
    new $P318, "Hash"
  vivify_170:
    set $P319, $P318["NOTE"]
    unless_null $P319, vivify_171
    new $P319, "Undef"
  vivify_171:
        ##  inline postfix:--
        clone $P320, $P319
        dec $P319
    .return ($P320)
  control_273:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P321, exception, "payload"
    .return ($P321)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "_block283"  :anon :subid("38_1256253310.45975") :outer("37_1256253310.45975")
    new $P285, "Exception"
    set $P285['type'], 58
    new $P286, "Integer"
    assign $P286, 0
    setattribute $P285, 'payload', $P286
    throw $P285
    .return ()
.end


.namespace ["Dumper"]
.sub "_block292"  :anon :subid("39_1256253310.45975") :outer("37_1256253310.45975")
    new $P294, "Integer"
    assign $P294, 0
    store_lex "$caller_level", $P294
    .return ($P294)
.end


.namespace ["Dumper"]
.sub "_block297"  :anon :subid("40_1256253310.45975") :outer("37_1256253310.45975")
    find_lex $P299, "$caller_level"
    unless_null $P299, vivify_162
    new $P299, "Undef"
  vivify_162:
    add $P300, $P299, 2
    $P301 = "info"($P300 :named("caller_level"))
    store_lex "@info", $P301
    .return ($P301)
.end


.namespace ["Dumper"]
.sub "_block310"  :anon :subid("41_1256253310.45975") :outer("37_1256253310.45975")
    find_lex $P312, "@info"
    unless_null $P312, vivify_167
    new $P312, "ResizablePMCArray"
  vivify_167:
    $P313 = "make_named_prefix"($P312)
    set_global "$Prefix", $P313
    get_global $P314, "$Prefix"
    unless_null $P314, vivify_168
    new $P314, "Undef"
  vivify_168:
    find_lex $P315, "@parts"
    unless_null $P315, vivify_169
    new $P315, "ResizablePMCArray"
  vivify_169:
    $P316 = $P315."join"()
    $P317 = "say"($P314, ": ", $P316)
    .return ($P317)
.end


.namespace ["Dumper"]
.sub "NOTEold"  :subid("42_1256253310.45975") :outer("11_1256253310.45975")
    .param pmc param_325
    .param pmc param_326
    new $P324, 'ExceptionHandler'
    set_addr $P324, control_323
    $P324."handle_types"(58)
    push_eh $P324
    .lex "@info", param_325
    .lex "@parts", param_326
    find_lex $P327, "@parts"
    unless_null $P327, vivify_172
    new $P327, "ResizablePMCArray"
  vivify_172:
    $P328 = $P327."join"()
    set $N329, 1
    find_lex $P330, "@info"
    unless_null $P330, vivify_173
    new $P330, "ResizablePMCArray"
  vivify_173:
    $P331 = "NOTE"($P328, $N329 :named("caller_level"), $P330 :named("info"))
    .return ($P331)
  control_323:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P332, exception, "payload"
    .return ($P332)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "caller_depth_below"  :subid("43_1256253310.45975") :outer("11_1256253310.45975")
    .param pmc param_336
    .param pmc param_337
    .param pmc param_338 :optional :named("starting")
    .param int has_param_338 :opt_flag
    .param pmc param_340 :optional :named("limit")
    .param int has_param_340 :opt_flag
    .const 'Sub' $P345 = "44_1256253310.45975" 
    capture_lex $P345
    new $P335, 'ExceptionHandler'
    set_addr $P335, control_334
    $P335."handle_types"(58)
    push_eh $P335
    .lex "$namespace", param_336
    .lex "$name", param_337
    if has_param_338, optparam_174
    new $P339, "Undef"
    set param_338, $P339
  optparam_174:
    .lex "$starting", param_338
    if has_param_340, optparam_175
    new $P341, "Undef"
    set param_340, $P341
  optparam_175:
    .lex "$limit", param_340
    find_lex $P343, "$limit"
    unless_null $P343, vivify_176
    new $P343, "Undef"
  vivify_176:
    if $P343, unless_342_end
    .const 'Sub' $P345 = "44_1256253310.45975" 
    capture_lex $P345
    $P345()
  unless_342_end:

		.local pmc interp
		interp = getinterp
		
		.local int depth, show_depth, show_limit
		$P0 = find_lex '$starting'
		depth = $P0

		show_depth = 1
		$P0 = find_lex '$limit'
		show_limit = $P0
		
		.local string sub_name, nsp_name
		$P0 = find_lex '$name'
		sub_name = $P0
		$P0 = find_lex '$namespace'
		nsp_name = $P0
		
		.local pmc key, namespace, caller
		.local string caller_name
		
		push_eh handler
		
	while_not_root:
		
		inc depth
		
		# Make a [ 'sub' , $depth ] key
		key = new 'Key'
		key = 'sub'
		$P0 = new 'Key'
		$P0 = depth
		push key, $P0
		
		caller = interp[ key ]
		
		caller_name = caller
		$S1 = substr caller_name, 0, 6

		if $S1 == '_block' goto while_not_root

		inc show_depth		
		if show_depth >= show_limit goto  done

		unless caller_name == sub_name goto while_not_root
		
		namespace = caller.'get_namespace'()
		
		$P0 = namespace.'get_name'()
		$S0 = join '::', $P0

		unless $S0 == nsp_name goto while_not_root
	
		goto done

	handler:
		say "Suppressed exception in caller_depth_below"
		backtrace
		
	done:
		pop_eh
		# Done: depth indicates depth from "parrot::Slam::main" to present.
		$P347 = box show_depth
	
    .lex "$depth", $P347
    new $P348, "Exception"
    set $P348['type'], 58
    find_lex $P349, "$depth"
    unless_null $P349, vivify_177
    new $P349, "Undef"
  vivify_177:
    setattribute $P348, 'payload', $P349
    throw $P348
    .return ()
  control_334:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P350, exception, "payload"
    .return ($P350)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "_block344"  :anon :subid("44_1256253310.45975") :outer("43_1256253310.45975")
    new $P346, "Integer"
    assign $P346, 80
    store_lex "$limit", $P346
    .return ($P346)
.end


.namespace ["Dumper"]
.sub "find_named_caller"  :subid("45_1256253310.45975") :outer("11_1256253310.45975")
    .param pmc param_354 :optional :named("nth")
    .param int has_param_354 :opt_flag
    .param pmc param_356 :optional :named("starting")
    .param int has_param_356 :opt_flag
    .const 'Sub' $P361 = "46_1256253310.45975" 
    capture_lex $P361
    new $P353, 'ExceptionHandler'
    set_addr $P353, control_352
    $P353."handle_types"(58)
    push_eh $P353
    if has_param_354, optparam_178
    new $P355, "Undef"
    set param_354, $P355
  optparam_178:
    .lex "$nth", param_354
    if has_param_356, optparam_179
    new $P357, "Undef"
    set param_356, $P357
  optparam_179:
    .lex "$starting", param_356
    find_lex $P359, "$nth"
    unless_null $P359, vivify_180
    new $P359, "Undef"
  vivify_180:
    if $P359, unless_358_end
    .const 'Sub' $P361 = "46_1256253310.45975" 
    capture_lex $P361
    $P361()
  unless_358_end:
    new $P363, "Integer"
    assign $P363, 0
    find_lex $P364, "$starting"
    unless_null $P364, vivify_181
    new $P364, "Undef"
  vivify_181:
    add $P365, $P363, $P364
    store_lex "$starting", $P365

		.local pmc interp
		interp = getinterp
		
		.local int how_many
		$P0 = find_lex '$nth'
		how_many = $P0
		
		.local int num_found
		num_found = 0

		.local int depth
		$P0 = find_lex '$starting'
		depth = $P0
		
		.local pmc caller, key, namespace
		.local string caller_name		
	
	find_named_caller:
	
	skip_over_blocks:	# Skip over '_block...' lexical scopes
		inc depth
		
		# Make a [ 'sub'; $depth ] key
		key = new 'Key'
		key = 'sub'
		$P0 = new 'Key'
		$P0 = depth
		push key, $P0
		
		caller = interp [ key ]
		caller_name = caller
		$S0 = substr caller_name, 0, 6
		
		if $S0 == '_block' goto skip_over_blocks
		
		# Found one. Is that enough?
		inc num_found
		if num_found < how_many goto done
		
	done:		
		# Remember the caller depth for stack_depth
		$P0 = get_global '$Caller_depth'
		$P0 = depth
		
		# Now we have a sub named other than '_block'
		$P366 = caller
	
    .lex "$caller", $P366
    new $P367, "Exception"
    set $P367['type'], 58
    find_lex $P368, "$caller"
    unless_null $P368, vivify_182
    new $P368, "Undef"
  vivify_182:
    setattribute $P367, 'payload', $P368
    throw $P367
    .return ()
  control_352:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P369, exception, "payload"
    .return ($P369)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "_block360"  :anon :subid("46_1256253310.45975") :outer("45_1256253310.45975")
    new $P362, "Integer"
    assign $P362, 1
    store_lex "$nth", $P362
    .return ($P362)
.end


.namespace ["Dumper"]
.sub "get_caller"  :subid("47_1256253310.45975") :outer("11_1256253310.45975")
    .param pmc param_373 :optional
    .param int has_param_373 :opt_flag
    .param pmc param_375 :optional :named("attr")
    .param int has_param_375 :opt_flag
    .const 'Sub' $P383 = "48_1256253310.45975" 
    capture_lex $P383
    new $P372, 'ExceptionHandler'
    set_addr $P372, control_371
    $P372."handle_types"(58)
    push_eh $P372
    if has_param_373, optparam_183
    new $P374, "Undef"
    set param_373, $P374
  optparam_183:
    .lex "$level", param_373
    if has_param_375, optparam_184
    new $P376, "Undef"
    set param_375, $P376
  optparam_184:
    .lex "$attr", param_375
    new $P377, "Integer"
    assign $P377, 1
    find_lex $P378, "$level"
    unless_null $P378, vivify_185
    new $P378, "Undef"
  vivify_185:
    add $P379, $P377, $P378
    store_lex "$level", $P379
    find_lex $P381, "$attr"
    unless_null $P381, vivify_186
    new $P381, "Undef"
  vivify_186:
    if $P381, unless_380_end
    .const 'Sub' $P383 = "48_1256253310.45975" 
    capture_lex $P383
    $P383()
  unless_380_end:

		.local string attr
		$P0 = find_lex '$attr'
		attr = $P0
		
		.local pmc interp, key
		interp = getinterp
		
		key = new 'Key'
		key = attr
		
		.local int level
		$P0 = find_lex '$level'
		level = $P0
		
		$P0 = new 'Key'
		$P0 = level
		
		push key, $P0
		
		$P385 = interp [ key ]
	
    .lex "$caller", $P385
    new $P386, "Exception"
    set $P386['type'], 58
    find_lex $P387, "$caller"
    unless_null $P387, vivify_187
    new $P387, "Undef"
  vivify_187:
    setattribute $P386, 'payload', $P387
    throw $P386
    .return ()
  control_371:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P388, exception, "payload"
    .return ($P388)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "_block382"  :anon :subid("48_1256253310.45975") :outer("47_1256253310.45975")
    new $P384, "String"
    assign $P384, "sub"
    store_lex "$attr", $P384
    .return ($P384)
.end


.namespace ["Dumper"]
.sub "get_config"  :subid("49_1256253310.45975") :outer("11_1256253310.45975")
    .param pmc param_392 :slurpy
    .const 'Sub' $P398 = "50_1256253310.45975" 
    capture_lex $P398
    new $P391, 'ExceptionHandler'
    set_addr $P391, control_390
    $P391."handle_types"(58)
    push_eh $P391
    .lex "@key", param_392
    new $P393, "Undef"
    .lex "$result", $P393
    get_hll_global $P395, "Registry"
    unless_null $P395, vivify_188
    new $P395, "Hash"
  vivify_188:
    set $P396, $P395["CONFIG"]
    unless_null $P396, vivify_189
    new $P396, "Undef"
  vivify_189:
    unless $P396, if_394_end
    .const 'Sub' $P398 = "50_1256253310.45975" 
    capture_lex $P398
    $P398()
  if_394_end:
    new $P404, "Exception"
    set $P404['type'], 58
    find_lex $P405, "$result"
    unless_null $P405, vivify_193
    new $P405, "Undef"
  vivify_193:
    setattribute $P404, 'payload', $P405
    throw $P404
    .return ()
  control_390:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P406, exception, "payload"
    .return ($P406)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "_block397"  :anon :subid("50_1256253310.45975") :outer("49_1256253310.45975")
    get_hll_global $P399, "Registry"
    unless_null $P399, vivify_190
    new $P399, "Hash"
  vivify_190:
    set $P400, $P399["CONFIG"]
    unless_null $P400, vivify_191
    new $P400, "Undef"
  vivify_191:
    find_lex $P401, "@key"
    unless_null $P401, vivify_192
    new $P401, "ResizablePMCArray"
  vivify_192:
    $P402 = $P401."join"("::")
    $P403 = $P400."query"($P402)
    store_lex "$result", $P403
    .return ($P403)
.end


.namespace ["Dumper"]
.sub "get_dumper_config"  :subid("51_1256253310.45975") :outer("11_1256253310.45975")
    .param pmc param_410
    .param pmc param_411 :optional :named("starting")
    .param int has_param_411 :opt_flag
    .const 'Sub' $P453 = "54_1256253310.45975" 
    capture_lex $P453
    .const 'Sub' $P427 = "53_1256253310.45975" 
    capture_lex $P427
    .const 'Sub' $P416 = "52_1256253310.45975" 
    capture_lex $P416
    new $P409, 'ExceptionHandler'
    set_addr $P409, control_408
    $P409."handle_types"(58)
    push_eh $P409
    .lex "$named_caller", param_410
    if has_param_411, optparam_194
    new $P412, "Undef"
    set param_411, $P412
  optparam_194:
    .lex "$starting", param_411
    get_global $P414, "%_dumper_config_cache"
    unless_null $P414, vivify_195
    new $P414, "Hash"
  vivify_195:
    if $P414, unless_413_end
    .const 'Sub' $P416 = "52_1256253310.45975" 
    capture_lex $P416
    $P416()
  unless_413_end:
    get_hll_global $P419, ["Parrot"], "get_address_of"
    find_lex $P420, "$named_caller"
    unless_null $P420, vivify_196
    new $P420, "Undef"
  vivify_196:
    $P421 = $P419($P420)
    .lex "$addr", $P421
    find_lex $P423, "$addr"
    unless_null $P423, vivify_197
    new $P423, "Undef"
  vivify_197:
    get_global $P424, "%_dumper_config_cache"
    unless_null $P424, vivify_198
    new $P424, "Hash"
  vivify_198:
    set $P425, $P424[$P423]
    unless_null $P425, vivify_199
    new $P425, "Undef"
  vivify_199:
    .lex "@config", $P425
    if $P425, unless_422_end
    .const 'Sub' $P427 = "53_1256253310.45975" 
    capture_lex $P427
    $P427()
  unless_422_end:
    find_lex $P450, "@config"
    unless_null $P450, vivify_211
    new $P450, "ResizablePMCArray"
  vivify_211:
    set $P451, $P450[0]
    unless_null $P451, vivify_212
    new $P451, "Undef"
  vivify_212:
    unless $P451, if_449_end
    .const 'Sub' $P453 = "54_1256253310.45975" 
    capture_lex $P453
    $P453()
  if_449_end:
    new $P458, "Exception"
    set $P458['type'], 58
    find_lex $P459, "@config"
    unless_null $P459, vivify_215
    new $P459, "ResizablePMCArray"
  vivify_215:
    setattribute $P458, 'payload', $P459
    throw $P458
    .return ()
  control_408:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P460, exception, "payload"
    .return ($P460)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "_block415"  :anon :subid("52_1256253310.45975") :outer("51_1256253310.45975")
    get_hll_global $P417, ["Hash"], "empty"
    $P418 = $P417()
    set_global "%_dumper_config_cache", $P418
    .return ($P418)
.end


.namespace ["Dumper"]
.sub "_block426"  :anon :subid("53_1256253310.45975") :outer("51_1256253310.45975")
    find_lex $P428, "$named_caller"
    unless_null $P428, vivify_200
    new $P428, "Undef"
  vivify_200:
    set $S429, $P428
    new $P430, 'String'
    set $P430, $S429
    .lex "$name", $P430
    find_lex $P431, "$named_caller"
    unless_null $P431, vivify_201
    new $P431, "Undef"
  vivify_201:
    $P432 = $P431."get_namespace"()
    $P433 = $P432."get_name"()
    $P434 = $P433."clone"()
    .lex "@namespace", $P434
    new $P435, "String"
    assign $P435, "Dump"
    find_lex $P436, "@namespace"
    unless_null $P436, vivify_202
    new $P436, "ResizablePMCArray"
    store_lex "@namespace", $P436
  vivify_202:
    set $P436[0], $P435
    find_lex $P437, "@namespace"
    unless_null $P437, vivify_203
    new $P437, "ResizablePMCArray"
  vivify_203:
    find_lex $P438, "$name"
    unless_null $P438, vivify_204
    new $P438, "Undef"
  vivify_204:
    $P437."push"($P438)
    find_lex $P439, "@namespace"
    unless_null $P439, vivify_205
    new $P439, "ResizablePMCArray"
  vivify_205:
    $P440 = $P439."join"("::")
    .lex "$key", $P440
    get_hll_global $P441, ["Array"], "new"
    find_lex $P442, "$key"
    unless_null $P442, vivify_206
    new $P442, "Undef"
  vivify_206:
    $P443 = "get_config"($P442)
    find_lex $P444, "$key"
    unless_null $P444, vivify_207
    new $P444, "Undef"
  vivify_207:
    $P445 = $P441($P443, 0, $P444)
    store_lex "@config", $P445
    find_lex $P446, "@config"
    unless_null $P446, vivify_208
    new $P446, "ResizablePMCArray"
  vivify_208:
    find_lex $P447, "$addr"
    unless_null $P447, vivify_209
    new $P447, "Undef"
  vivify_209:
    get_global $P448, "%_dumper_config_cache"
    unless_null $P448, vivify_210
    new $P448, "Hash"
    set_global "%_dumper_config_cache", $P448
  vivify_210:
    set $P448[$P447], $P446
    .return ($P446)
.end


.namespace ["Dumper"]
.sub "_block452"  :anon :subid("54_1256253310.45975") :outer("51_1256253310.45975")
    find_lex $P454, "$starting"
    unless_null $P454, vivify_213
    new $P454, "Undef"
  vivify_213:
    add $P455, $P454, 2
    $P456 = "stack_depth"($P455 :named("starting"))
    find_lex $P457, "@config"
    unless_null $P457, vivify_214
    new $P457, "ResizablePMCArray"
    store_lex "@config", $P457
  vivify_214:
    set $P457[1], $P456
    .return ($P456)
.end


.namespace ["Dumper"]
.sub "info"  :subid("55_1256253310.45975") :outer("11_1256253310.45975")
    .param pmc param_468 :optional :named("caller_level")
    .param int has_param_468 :opt_flag
    .const 'Sub' $P506 = "59_1256253310.45975" 
    capture_lex $P506
    .const 'Sub' $P504 = "58_1256253310.45975" 
    capture_lex $P504
    .const 'Sub' $P483 = "57_1256253310.45975" 
    capture_lex $P483
    .const 'Sub' $P474 = "56_1256253310.45975" 
    capture_lex $P474
    new $P467, 'ExceptionHandler'
    set_addr $P467, control_466
    $P467."handle_types"(58)
    push_eh $P467
    if has_param_468, optparam_216
    new $P469, "Undef"
    set param_468, $P469
  optparam_216:
    .lex "$caller_level", param_468
    get_global $P471, "%Already_in"
    unless_null $P471, vivify_217
    new $P471, "Hash"
  vivify_217:
    set $P472, $P471["INFO"]
    unless_null $P472, vivify_218
    new $P472, "Undef"
  vivify_218:
    unless $P472, if_470_end
    .const 'Sub' $P474 = "56_1256253310.45975" 
    capture_lex $P474
    $P474()
  if_470_end:
    get_global $P477, "%Already_in"
    unless_null $P477, vivify_220
    new $P477, "Hash"
  vivify_220:
    set $P478, $P477["INFO"]
    unless_null $P478, vivify_221
    new $P478, "Undef"
  vivify_221:
        ##  inline postfix:++
        clone $P479, $P478
        inc $P478
    find_lex $P481, "$caller_level"
    unless_null $P481, vivify_222
    new $P481, "Undef"
  vivify_222:
    if $P481, unless_480_end
    .const 'Sub' $P483 = "57_1256253310.45975" 
    capture_lex $P483
    $P483()
  unless_480_end:
    find_lex $P486, "$caller_level"
    unless_null $P486, vivify_223
    new $P486, "Undef"
  vivify_223:
        ##  inline postfix:++
        clone $P487, $P486
        inc $P486
    get_global $P488, "$last_lexpad_addr"
    unless_null $P488, vivify_224
    new $P488, "Undef"
  vivify_224:
    get_global $P489, "@result"
    unless_null $P489, vivify_225
    new $P489, "ResizablePMCArray"
  vivify_225:
    get_hll_global $P490, ["Parrot"], "get_address_of"
    find_lex $P491, "$caller_level"
    unless_null $P491, vivify_226
    new $P491, "Undef"
  vivify_226:
    $P492 = "get_caller"($P491, "lexpad" :named("attr"))
    $P493 = $P490($P492)
    .lex "$lexpad_addr", $P493
    find_lex $P497, "$lexpad_addr"
    unless_null $P497, vivify_227
    new $P497, "Undef"
  vivify_227:
    if $P497, if_496
    set $P495, $P497
    goto if_496_end
  if_496:
    find_lex $P498, "$lexpad_addr"
    unless_null $P498, vivify_228
    new $P498, "Undef"
  vivify_228:
    set $N499, $P498
    get_global $P500, "$last_lexpad_addr"
    unless_null $P500, vivify_229
    new $P500, "Undef"
  vivify_229:
    set $N501, $P500
    iseq $I502, $N499, $N501
    new $P495, 'Integer'
    set $P495, $I502
  if_496_end:
    if $P495, if_494
    .const 'Sub' $P506 = "59_1256253310.45975" 
    capture_lex $P506
    $P506()
    goto if_494_end
  if_494:
    .const 'Sub' $P504 = "58_1256253310.45975" 
    capture_lex $P504
    $P504()
  if_494_end:
    get_global $P514, "%Already_in"
    unless_null $P514, vivify_234
    new $P514, "Hash"
  vivify_234:
    set $P515, $P514["INFO"]
    unless_null $P515, vivify_235
    new $P515, "Undef"
  vivify_235:
        ##  inline postfix:--
        clone $P516, $P515
        dec $P515
    new $P517, "Exception"
    set $P517['type'], 58
    get_global $P518, "@result"
    unless_null $P518, vivify_236
    new $P518, "ResizablePMCArray"
  vivify_236:
    setattribute $P517, 'payload', $P518
    throw $P517
    .return ()
  control_466:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P519, exception, "payload"
    .return ($P519)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "_block473"  :anon :subid("56_1256253310.45975") :outer("55_1256253310.45975")
    new $P475, "Exception"
    set $P475['type'], 58
    get_global $P476, "@Info_rejected"
    unless_null $P476, vivify_219
    new $P476, "ResizablePMCArray"
  vivify_219:
    setattribute $P475, 'payload', $P476
    throw $P475
    .return ()
.end


.namespace ["Dumper"]
.sub "_block482"  :anon :subid("57_1256253310.45975") :outer("55_1256253310.45975")
    set $N484, 1
    new $P485, 'Float'
    set $P485, $N484
    store_lex "$caller_level", $P485
    .return ($P485)
.end


.namespace ["Dumper"]
.sub "_block505"  :anon :subid("59_1256253310.45975") :outer("55_1256253310.45975")
    find_lex $P507, "$lexpad_addr"
    unless_null $P507, vivify_230
    new $P507, "Undef"
  vivify_230:
    set_global "$last_lexpad_addr", $P507
    find_lex $P508, "$caller_level"
    unless_null $P508, vivify_231
    new $P508, "Undef"
  vivify_231:
    add $P509, $P508, 1
    $P510 = "find_named_caller"($P509 :named("starting"))
    .lex "$caller", $P510
    find_lex $P511, "$caller"
    unless_null $P511, vivify_232
    new $P511, "Undef"
  vivify_232:
    get_global $P512, "$Caller_depth"
    unless_null $P512, vivify_233
    new $P512, "Undef"
  vivify_233:
    $P513 = "get_dumper_config"($P511, $P512 :named("starting"))
    set_global "@result", $P513
    .return ($P513)
.end


.namespace ["Dumper"]
.sub "_block503"  :anon :subid("58_1256253310.45975") :outer("55_1256253310.45975")
    .return ()
.end


.namespace ["Dumper"]
.sub "make_bare_prefix"  :subid("60_1256253310.45975") :outer("11_1256253310.45975")
    .param pmc param_527
    .const 'Sub' $P535 = "61_1256253310.45975" 
    capture_lex $P535
    new $P526, 'ExceptionHandler'
    set_addr $P526, control_525
    $P526."handle_types"(58)
    push_eh $P526
    .lex "$depth", param_527
    find_lex $P529, "$depth"
    unless_null $P529, vivify_238
    new $P529, "Undef"
  vivify_238:
    set $N530, $P529
    new $P531, "Integer"
    assign $P531, 1
    set $N532, $P531
    islt $I533, $N530, $N532
    unless $I533, if_528_end
    .const 'Sub' $P535 = "61_1256253310.45975" 
    capture_lex $P535
    $P535()
  if_528_end:
    find_lex $P537, "$depth"
    unless_null $P537, vivify_239
    new $P537, "Undef"
  vivify_239:
        ##  inline postfix:--
        clone $P538, $P537
        dec $P537
    get_hll_global $P539, ["String"], "repeat"
    get_global $P540, "$Prefix_string"
    unless_null $P540, vivify_240
    new $P540, "Undef"
  vivify_240:
    find_lex $P541, "$depth"
    unless_null $P541, vivify_241
    new $P541, "Undef"
  vivify_241:
    get_global $P542, "$Prefix_string_len"
    unless_null $P542, vivify_242
    new $P542, "Undef"
  vivify_242:
    div $P543, $P541, $P542
    $P544 = $P539($P540, $P543)
    .lex "$prefix", $P544
    find_lex $P545, "$prefix"
    unless_null $P545, vivify_243
    new $P545, "Undef"
  vivify_243:
    get_hll_global $P546, ["String"], "substr"
    get_global $P547, "$Prefix_string"
    unless_null $P547, vivify_244
    new $P547, "Undef"
  vivify_244:
    find_lex $P548, "$depth"
    unless_null $P548, vivify_245
    new $P548, "Undef"
  vivify_245:
    mod $P549, $P548, 3
    $S550 = $P546($P547, 0, $P549)
    concat $P551, $P545, $S550
    store_lex "$prefix", $P551
    new $P552, "Exception"
    set $P552['type'], 58
    find_lex $P553, "$prefix"
    unless_null $P553, vivify_246
    new $P553, "Undef"
  vivify_246:
    concat $P554, $P553, "+-"
    setattribute $P552, 'payload', $P554
    throw $P552
    .return ()
  control_525:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P555, exception, "payload"
    .return ($P555)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "_block534"  :anon :subid("61_1256253310.45975") :outer("60_1256253310.45975")
    new $P536, "Integer"
    assign $P536, 1
    store_lex "$depth", $P536
    .return ($P536)
.end


.namespace ["Dumper"]
.sub "make_named_prefix"  :subid("62_1256253310.45975") :outer("11_1256253310.45975")
    .param pmc param_559
    new $P558, 'ExceptionHandler'
    set_addr $P558, control_557
    $P558."handle_types"(58)
    push_eh $P558
    .lex "@info", param_559
    find_lex $P560, "@info"
    unless_null $P560, vivify_247
    new $P560, "ResizablePMCArray"
  vivify_247:
    set $P561, $P560[1]
    unless_null $P561, vivify_248
    new $P561, "Undef"
  vivify_248:
    $P562 = "make_bare_prefix"($P561)
    find_lex $P563, "@info"
    unless_null $P563, vivify_249
    new $P563, "ResizablePMCArray"
  vivify_249:
    set $P564, $P563[2]
    unless_null $P564, vivify_250
    new $P564, "Undef"
  vivify_250:
    concat $P565, $P562, $P564
    .lex "$prefix", $P565
    new $P566, "Exception"
    set $P566['type'], 58
    find_lex $P567, "$prefix"
    unless_null $P567, vivify_251
    new $P567, "Undef"
  vivify_251:
    setattribute $P566, 'payload', $P567
    throw $P566
    .return ()
  control_557:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P568, exception, "payload"
    .return ($P568)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "stack_depth"  :subid("63_1256253310.45975") :outer("11_1256253310.45975")
    .param pmc param_572 :optional :named("starting")
    .param int has_param_572 :opt_flag
    .const 'Sub' $P601 = "66_1256253310.45975" 
    capture_lex $P601
    .const 'Sub' $P581 = "64_1256253310.45975" 
    capture_lex $P581
    new $P571, 'ExceptionHandler'
    set_addr $P571, control_570
    $P571."handle_types"(58)
    push_eh $P571
    if has_param_572, optparam_252
    new $P573, "Undef"
    set param_572, $P573
  optparam_252:
    .lex "$starting", param_572
    get_global $P574, "$Stack_root_offset"
    unless_null $P574, vivify_253
    new $P574, "Undef"
  vivify_253:
    get_global $P575, "$Root_sub"
    unless_null $P575, vivify_254
    new $P575, "Undef"
  vivify_254:
    get_global $P576, "$Root_nsp"
    unless_null $P576, vivify_255
    new $P576, "Undef"
  vivify_255:
    new $P577, "Integer"
    assign $P577, 0
    .lex "$depth", $P577
    get_global $P579, "$Root_sub"
    unless_null $P579, vivify_256
    new $P579, "Undef"
  vivify_256:
    if $P579, unless_578_end
    .const 'Sub' $P581 = "64_1256253310.45975" 
    capture_lex $P581
    $P581()
  unless_578_end:
    get_global $P599, "$Root_sub"
    unless_null $P599, vivify_261
    new $P599, "Undef"
  vivify_261:
    unless $P599, if_598_end
    .const 'Sub' $P601 = "66_1256253310.45975" 
    capture_lex $P601
    $P601()
  if_598_end:
    new $P612, "Exception"
    set $P612['type'], 58
    find_lex $P613, "$depth"
    unless_null $P613, vivify_269
    new $P613, "Undef"
  vivify_269:
    setattribute $P612, 'payload', $P613
    throw $P612
    .return ()
  control_570:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P614, exception, "payload"
    .return ($P614)
    rethrow exception
.end


.namespace ["Dumper"]
.sub "_block580"  :anon :subid("64_1256253310.45975") :outer("63_1256253310.45975")
    .const 'Sub' $P590 = "65_1256253310.45975" 
    capture_lex $P590
    $P582 = "get_config"("Dump", "Stack", "Root")
    .lex "$stack_root", $P582
    new $P583, "Integer"
    assign $P583, 0
    $N584 = "get_config"("Dump", "Stack", "Root_offset")
    add $P585, $P583, $N584
    set_global "$Stack_root_offset", $P585
    find_lex $P588, "$stack_root"
    unless_null $P588, vivify_257
    new $P588, "Undef"
  vivify_257:
    if $P588, if_587
    set $P586, $P588
    goto if_587_end
  if_587:
    .const 'Sub' $P590 = "65_1256253310.45975" 
    capture_lex $P590
    $P597 = $P590()
    set $P586, $P597
  if_587_end:
    .return ($P586)
.end


.namespace ["Dumper"]
.sub "_block589"  :anon :subid("65_1256253310.45975") :outer("64_1256253310.45975")
    find_lex $P591, "$stack_root"
    unless_null $P591, vivify_258
    new $P591, "Undef"
  vivify_258:
    $P592 = $P591."split"("::")
    .lex "@parts", $P592
    find_lex $P593, "@parts"
    unless_null $P593, vivify_259
    new $P593, "ResizablePMCArray"
  vivify_259:
    $P594 = $P593."pop"()
    set_global "$Root_sub", $P594
    find_lex $P595, "@parts"
    unless_null $P595, vivify_260
    new $P595, "ResizablePMCArray"
  vivify_260:
    $P596 = $P595."join"("::")
    set_global "$Root_nsp", $P596
    .return ($P596)
.end


.namespace ["Dumper"]
.sub "_block600"  :anon :subid("66_1256253310.45975") :outer("63_1256253310.45975")
    get_global $P602, "$Root_nsp"
    unless_null $P602, vivify_262
    new $P602, "Undef"
  vivify_262:
    get_global $P603, "$Root_sub"
    unless_null $P603, vivify_263
    new $P603, "Undef"
  vivify_263:
    "say"("Root sub: ", $P602, " :: ", $P603)
    get_global $P604, "$Root_nsp"
    unless_null $P604, vivify_264
    new $P604, "Undef"
  vivify_264:
    get_global $P605, "$Root_sub"
    unless_null $P605, vivify_265
    new $P605, "Undef"
  vivify_265:
    find_lex $P606, "$starting"
    unless_null $P606, vivify_266
    new $P606, "Undef"
  vivify_266:
    add $P607, $P606, 2
    $P608 = "caller_depth_below"($P604, $P605, $P607 :named("starting"))
    store_lex "$depth", $P608
    find_lex $P609, "$depth"
    unless_null $P609, vivify_267
    new $P609, "Undef"
  vivify_267:
    get_global $P610, "$Stack_root_offset"
    unless_null $P610, vivify_268
    new $P610, "Undef"
  vivify_268:
    sub $P611, $P609, $P610
    store_lex "$depth", $P611
    .return ($P611)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256214674.67233")
    get_hll_global $P14, ["File"], "_block13" 
    .return ($P14)
.end


.namespace ["File"]
.sub "_block13" :init :load :subid("11_1256214674.67233")
    .const 'Sub' $P152 = "26_1256214674.67233" 
    capture_lex $P152
    .const 'Sub' $P142 = "25_1256214674.67233" 
    capture_lex $P142
    .const 'Sub' $P133 = "24_1256214674.67233" 
    capture_lex $P133
    .const 'Sub' $P124 = "23_1256214674.67233" 
    capture_lex $P124
    .const 'Sub' $P115 = "22_1256214674.67233" 
    capture_lex $P115
    .const 'Sub' $P104 = "21_1256214674.67233" 
    capture_lex $P104
    .const 'Sub' $P50 = "16_1256214674.67233" 
    capture_lex $P50
    .const 'Sub' $P41 = "15_1256214674.67233" 
    capture_lex $P41
    .const 'Sub' $P31 = "14_1256214674.67233" 
    capture_lex $P31
    .const 'Sub' $P18 = "12_1256214674.67233" 
    capture_lex $P18
$P15 = get_root_global ["parrot"], "P6metaclass"
    $P15."new_class"("File")
    get_hll_global $P16, ["Parrot"], "IMPORT"
    $P16("Dumper")
    get_global $P17, "$_Pmc"
    unless_null $P17, vivify_27
    new $P17, "Undef"
  vivify_27:
    .const 'Sub' $P152 = "26_1256214674.67233" 
    capture_lex $P152
    .return ($P152)
.end


.namespace ["File"]
.sub "_get_pmc"  :subid("12_1256214674.67233") :outer("11_1256214674.67233")
    .const 'Sub' $P26 = "13_1256214674.67233" 
    capture_lex $P26
    new $P20, 'ExceptionHandler'
    set_addr $P20, control_19
    $P20."handle_types"(58)
    push_eh $P20
    get_hll_global $P22, ["Parrot"], "defined"
    get_global $P23, "$_Pmc"
    unless_null $P23, vivify_28
    new $P23, "Undef"
  vivify_28:
    $P24 = $P22($P23)
    if $P24, unless_21_end
    .const 'Sub' $P26 = "13_1256214674.67233" 
    capture_lex $P26
    $P26()
  unless_21_end:
    new $P28, "Exception"
    set $P28['type'], 58
    get_global $P29, "$_Pmc"
    unless_null $P29, vivify_29
    new $P29, "Undef"
  vivify_29:
    setattribute $P28, 'payload', $P29
    throw $P28
    .return ()
  control_19:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P30, exception, "payload"
    .return ($P30)
    rethrow exception
.end


.namespace ["File"]
.sub "_block25"  :anon :subid("13_1256214674.67233") :outer("12_1256214674.67233")

			$P27 = root_new [ 'parrot' ; 'File' ]
		
    set_global "$_Pmc", $P27
    .return ($P27)
.end


.namespace ["File"]
.sub "copy"  :subid("14_1256214674.67233") :outer("11_1256214674.67233")
    .param pmc param_34
    .param pmc param_35
    new $P33, 'ExceptionHandler'
    set_addr $P33, control_32
    $P33."handle_types"(58)
    push_eh $P33
    .lex "$from", param_34
    .lex "$to", param_35
    $P36 = "_get_pmc"()
    find_lex $P37, "$from"
    unless_null $P37, vivify_30
    new $P37, "Undef"
  vivify_30:
    find_lex $P38, "$to"
    unless_null $P38, vivify_31
    new $P38, "Undef"
  vivify_31:
    $P39 = $P36."copy"($P37, $P38)
    .return ($P39)
  control_32:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P40, exception, "payload"
    .return ($P40)
    rethrow exception
.end


.namespace ["File"]
.sub "exists"  :subid("15_1256214674.67233") :outer("11_1256214674.67233")
    .param pmc param_44
    new $P43, 'ExceptionHandler'
    set_addr $P43, control_42
    $P43."handle_types"(58)
    push_eh $P43
    .lex "$path", param_44
    new $P45, "Exception"
    set $P45['type'], 58
    $P46 = "_get_pmc"()
    find_lex $P47, "$path"
    unless_null $P47, vivify_32
    new $P47, "Undef"
  vivify_32:
    $P48 = $P46."exists"($P47)
    setattribute $P45, 'payload', $P48
    throw $P45
    .return ()
  control_42:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P49, exception, "payload"
    .return ($P49)
    rethrow exception
.end


.namespace ["File"]
.sub "find_all"  :subid("16_1256214674.67233") :outer("11_1256214674.67233")
    .param pmc param_53
    .param pmc param_54
    .const 'Sub' $P79 = "19_1256214674.67233" 
    capture_lex $P79
    .const 'Sub' $P70 = "18_1256214674.67233" 
    capture_lex $P70
    .const 'Sub' $P66 = "17_1256214674.67233" 
    capture_lex $P66
    new $P52, 'ExceptionHandler'
    set_addr $P52, control_51
    $P52."handle_types"(58)
    push_eh $P52
    .lex "$path", param_53
    .lex "@search_list", param_54
    find_lex $P55, "$path"
    unless_null $P55, vivify_33
    new $P55, "Undef"
  vivify_33:
    find_lex $P56, "@search_list"
    unless_null $P56, vivify_34
    new $P56, "ResizablePMCArray"
  vivify_34:
    set $N57, $P56
    "NOTE"("Finding all paths matching '", $P55, "' in ", $N57, " directories")
    get_hll_global $P58, ["Array"], "empty"
    $P59 = $P58()
    .lex "@results", $P59
    get_hll_global $P61, ["String"], "char_at"
    find_lex $P62, "$path"
    unless_null $P62, vivify_35
    new $P62, "Undef"
  vivify_35:
    $S63 = $P61($P62, 0)
    iseq $I64, $S63, "/"
    if $I64, if_60
    .const 'Sub' $P70 = "18_1256214674.67233" 
    capture_lex $P70
    $P70()
    goto if_60_end
  if_60:
    .const 'Sub' $P66 = "17_1256214674.67233" 
    capture_lex $P66
    $P66()
  if_60_end:
    find_lex $P75, "@search_list"
    unless_null $P75, vivify_37
    new $P75, "ResizablePMCArray"
  vivify_37:
    defined $I76, $P75
    unless $I76, for_undef_38
    iter $P74, $P75
    new $P96, 'ExceptionHandler'
    set_addr $P96, loop95_handler
    $P96."handle_types"(65, 67, 66)
    push_eh $P96
  loop95_test:
    unless $P74, loop95_done
    shift $P77, $P74
  loop95_redo:
    .const 'Sub' $P79 = "19_1256214674.67233" 
    capture_lex $P79
    $P79($P77)
  loop95_next:
    goto loop95_test
  loop95_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P97, exception, 'type'
    eq $P97, 65, loop95_next
    eq $P97, 67, loop95_redo
  loop95_done:
    pop_eh 
  for_undef_38:
    find_lex $P98, "@results"
    unless_null $P98, vivify_45
    new $P98, "ResizablePMCArray"
  vivify_45:
    set $N99, $P98
    "NOTE"("Found ", $N99, " results")
    find_lex $P100, "@results"
    unless_null $P100, vivify_46
    new $P100, "ResizablePMCArray"
  vivify_46:
    "DUMP"($P100)
    new $P101, "Exception"
    set $P101['type'], 58
    find_lex $P102, "@results"
    unless_null $P102, vivify_47
    new $P102, "ResizablePMCArray"
  vivify_47:
    setattribute $P101, 'payload', $P102
    throw $P101
    .return ()
  control_51:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
    rethrow exception
.end


.namespace ["File"]
.sub "_block69"  :anon :subid("18_1256214674.67233") :outer("16_1256214674.67233")
    new $P71, "String"
    assign $P71, "/"
    find_lex $P72, "$path"
    unless_null $P72, vivify_36
    new $P72, "Undef"
  vivify_36:
    concat $P73, $P71, $P72
    store_lex "$path", $P73
    .return ($P73)
.end


.namespace ["File"]
.sub "_block65"  :anon :subid("17_1256214674.67233") :outer("16_1256214674.67233")
    "NOTE"("Path is rooted - not using search paths")
    get_hll_global $P67, ["Array"], "new"
    $P68 = $P67("")
    store_lex "@search_list", $P68
    .return ($P68)
.end


.namespace ["File"]
.sub "_block78"  :anon :subid("19_1256214674.67233") :outer("16_1256214674.67233")
    .param pmc param_80
    .const 'Sub' $P90 = "20_1256214674.67233" 
    capture_lex $P90
    .lex "$_", param_80
    find_lex $P81, "$_"
    unless_null $P81, vivify_39
    new $P81, "Undef"
  vivify_39:
    find_lex $P82, "$path"
    unless_null $P82, vivify_40
    new $P82, "Undef"
  vivify_40:
    concat $P83, $P81, $P82
    .lex "$name", $P83
    find_lex $P84, "$name"
    unless_null $P84, vivify_41
    new $P84, "Undef"
  vivify_41:
    "NOTE"("Trying ", $P84)
    find_lex $P87, "$name"
    unless_null $P87, vivify_42
    new $P87, "Undef"
  vivify_42:
    $P88 = "exists"($P87)
    if $P88, if_86
    set $P85, $P88
    goto if_86_end
  if_86:
    .const 'Sub' $P90 = "20_1256214674.67233" 
    capture_lex $P90
    $P94 = $P90()
    set $P85, $P94
  if_86_end:
    .return ($P85)
.end


.namespace ["File"]
.sub "_block89"  :anon :subid("20_1256214674.67233") :outer("19_1256214674.67233")
    "NOTE"("Success! it's a match")
    find_lex $P91, "@results"
    unless_null $P91, vivify_43
    new $P91, "ResizablePMCArray"
  vivify_43:
    find_lex $P92, "$name"
    unless_null $P92, vivify_44
    new $P92, "Undef"
  vivify_44:
    $P93 = $P91."push"($P92)
    .return ($P93)
.end


.namespace ["File"]
.sub "find_first"  :subid("21_1256214674.67233") :outer("11_1256214674.67233")
    .param pmc param_107
    .param pmc param_108
    new $P106, 'ExceptionHandler'
    set_addr $P106, control_105
    $P106."handle_types"(58)
    push_eh $P106
    .lex "$path", param_107
    .lex "@search_list", param_108
    new $P109, "Exception"
    set $P109['type'], 58
    find_lex $P110, "$path"
    unless_null $P110, vivify_48
    new $P110, "Undef"
  vivify_48:
    find_lex $P111, "@search_list"
    unless_null $P111, vivify_49
    new $P111, "ResizablePMCArray"
  vivify_49:
    $P112 = "find_all"($P110, $P111)
    set $P113, $P112[0]
    unless_null $P113, vivify_50
    new $P113, "Undef"
  vivify_50:
    setattribute $P109, 'payload', $P113
    throw $P109
    .return ()
  control_105:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
    rethrow exception
.end


.namespace ["File"]
.sub "is_dir"  :subid("22_1256214674.67233") :outer("11_1256214674.67233")
    .param pmc param_118
    new $P117, 'ExceptionHandler'
    set_addr $P117, control_116
    $P117."handle_types"(58)
    push_eh $P117
    .lex "$path", param_118
    new $P119, "Exception"
    set $P119['type'], 58
    $P120 = "_get_pmc"()
    find_lex $P121, "$path"
    unless_null $P121, vivify_51
    new $P121, "Undef"
  vivify_51:
    $P122 = $P120."is_dir"($P121)
    setattribute $P119, 'payload', $P122
    throw $P119
    .return ()
  control_116:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P123, exception, "payload"
    .return ($P123)
    rethrow exception
.end


.namespace ["File"]
.sub "is_file"  :subid("23_1256214674.67233") :outer("11_1256214674.67233")
    .param pmc param_127
    new $P126, 'ExceptionHandler'
    set_addr $P126, control_125
    $P126."handle_types"(58)
    push_eh $P126
    .lex "$path", param_127
    new $P128, "Exception"
    set $P128['type'], 58
    $P129 = "_get_pmc"()
    find_lex $P130, "$path"
    unless_null $P130, vivify_52
    new $P130, "Undef"
  vivify_52:
    $P131 = $P129."is_file"($P130)
    setattribute $P128, 'payload', $P131
    throw $P128
    .return ()
  control_125:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P132, exception, "payload"
    .return ($P132)
    rethrow exception
.end


.namespace ["File"]
.sub "is_link"  :subid("24_1256214674.67233") :outer("11_1256214674.67233")
    .param pmc param_136
    new $P135, 'ExceptionHandler'
    set_addr $P135, control_134
    $P135."handle_types"(58)
    push_eh $P135
    .lex "$path", param_136
    new $P137, "Exception"
    set $P137['type'], 58
    $P138 = "_get_pmc"()
    find_lex $P139, "$path"
    unless_null $P139, vivify_53
    new $P139, "Undef"
  vivify_53:
    $P140 = $P138."is_link"($P139)
    setattribute $P137, 'payload', $P140
    throw $P137
    .return ()
  control_134:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P141, exception, "payload"
    .return ($P141)
    rethrow exception
.end


.namespace ["File"]
.sub "rename"  :subid("25_1256214674.67233") :outer("11_1256214674.67233")
    .param pmc param_145
    .param pmc param_146
    new $P144, 'ExceptionHandler'
    set_addr $P144, control_143
    $P144."handle_types"(58)
    push_eh $P144
    .lex "$from", param_145
    .lex "$to", param_146
    $P147 = "_get_pmc"()
    find_lex $P148, "$from"
    unless_null $P148, vivify_54
    new $P148, "Undef"
  vivify_54:
    find_lex $P149, "$to"
    unless_null $P149, vivify_55
    new $P149, "Undef"
  vivify_55:
    $P150 = $P147."rename"($P148, $P149)
    .return ($P150)
  control_143:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P151, exception, "payload"
    .return ($P151)
    rethrow exception
.end


.namespace ["File"]
.sub "slurp"  :subid("26_1256214674.67233") :outer("11_1256214674.67233")
    .param pmc param_155
    new $P154, 'ExceptionHandler'
    set_addr $P154, control_153
    $P154."handle_types"(58)
    push_eh $P154
    .lex "$path", param_155
    find_lex $P156, "$path"
    unless_null $P156, vivify_56
    new $P156, "Undef"
  vivify_56:
    "NOTE"("Slurping contents of file: ", $P156)

		$P0 = new 'FileHandle'
		$P1 = find_lex '$path'
		$S0 = $P0.'readall'($P1)
		$P157 = box $S0
	
    .lex "$data", $P157
    "NOTE"("done")
    find_lex $P158, "$data"
    unless_null $P158, vivify_57
    new $P158, "Undef"
  vivify_57:
    "DUMP"($P158)
    new $P159, "Exception"
    set $P159['type'], 58
    find_lex $P160, "$data"
    unless_null $P160, vivify_58
    new $P160, "Undef"
  vivify_58:
    setattribute $P159, 'payload', $P160
    throw $P159
    .return ()
  control_153:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P161, exception, "payload"
    .return ($P161)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256214676.53236")
    get_hll_global $P14, ["Hash"], "_block13" 
    .return ($P14)
.end


.namespace ["Hash"]
.sub "_block13" :init :load :subid("11_1256214676.53236")
    .const 'Sub' $P269 = "37_1256214676.53236" 
    capture_lex $P269
    .const 'Sub' $P252 = "35_1256214676.53236" 
    capture_lex $P252
    .const 'Sub' $P164 = "28_1256214676.53236" 
    capture_lex $P164
    .const 'Sub' $P84 = "21_1256214676.53236" 
    capture_lex $P84
    .const 'Sub' $P62 = "19_1256214676.53236" 
    capture_lex $P62
    .const 'Sub' $P43 = "16_1256214676.53236" 
    capture_lex $P43
    .const 'Sub' $P36 = "15_1256214676.53236" 
    capture_lex $P36
    .const 'Sub' $P28 = "14_1256214676.53236" 
    capture_lex $P28
    .const 'Sub' $P23 = "13_1256214676.53236" 
    capture_lex $P23
    .const 'Sub' $P15 = "12_1256214676.53236" 
    capture_lex $P15
    .const 'Sub' $P269 = "37_1256214676.53236" 
    capture_lex $P269
    .return ($P269)
.end


.namespace ["Hash"]
.sub "contains"  :subid("12_1256214676.53236") :method :outer("11_1256214676.53236")
    .param pmc param_18
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
    .lex "$key", param_18

		$P0 = find_lex 'self'
		$P1 = find_lex '$key'
		$I0 = exists $P0[$P1]
		$P19 = box $I0
	
    .lex "$result", $P19
    new $P20, "Exception"
    set $P20['type'], 58
    find_lex $P21, "$result"
    unless_null $P21, vivify_38
    new $P21, "Undef"
  vivify_38:
    setattribute $P20, 'payload', $P21
    throw $P20
    .return ()
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P22, exception, "payload"
    .return ($P22)
    rethrow exception
.end


.namespace ["Hash"]
.sub "delete"  :subid("13_1256214676.53236") :method :outer("11_1256214676.53236")
    .param pmc param_26
    new $P25, 'ExceptionHandler'
    set_addr $P25, control_24
    $P25."handle_types"(58)
    push_eh $P25
    .lex "self", self
    .lex "$key", param_26

		$P0 = find_lex 'self'
		$P1 = find_lex '$key'
		delete $P0[$P1]
	
    .return ()
  control_24:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P27, exception, "payload"
    .return ($P27)
    rethrow exception
.end


.namespace ["Hash"]
.sub "elements"  :subid("14_1256214676.53236") :outer("11_1256214676.53236")
    .param pmc param_31
    new $P30, 'ExceptionHandler'
    set_addr $P30, control_29
    $P30."handle_types"(58)
    push_eh $P30
    .lex "%hash", param_31

		$P0 = find_lex '%hash'
		$I0 = elements $P0
		$P32 = box $I0
	
    .lex "%results", $P32
    new $P33, "Exception"
    set $P33['type'], 58
    find_lex $P34, "%results"
    unless_null $P34, vivify_39
    new $P34, "Hash"
  vivify_39:
    setattribute $P33, 'payload', $P34
    throw $P33
    .return ()
  control_29:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P35, exception, "payload"
    .return ($P35)
    rethrow exception
.end


.namespace ["Hash"]
.sub "empty"  :subid("15_1256214676.53236") :outer("11_1256214676.53236")
    new $P38, 'ExceptionHandler'
    set_addr $P38, control_37
    $P38."handle_types"(58)
    push_eh $P38
    new $P39, "Hash"
    .lex "%empty", $P39
    new $P40, "Exception"
    set $P40['type'], 58
    find_lex $P41, "%empty"
    unless_null $P41, vivify_40
    new $P41, "Hash"
  vivify_40:
    setattribute $P40, 'payload', $P41
    throw $P40
    .return ()
  control_37:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P42, exception, "payload"
    .return ($P42)
    rethrow exception
.end


.namespace ["Hash"]
.sub "exists"  :subid("16_1256214676.53236") :outer("11_1256214676.53236")
    .param pmc param_46
    .param pmc param_47
    .const 'Sub' $P57 = "18_1256214676.53236" 
    capture_lex $P57
    .const 'Sub' $P52 = "17_1256214676.53236" 
    capture_lex $P52
    new $P45, 'ExceptionHandler'
    set_addr $P45, control_44
    $P45."handle_types"(58)
    push_eh $P45
    .lex "%hash", param_46
    .lex "$key", param_47
    new $P48, "Undef"
    .lex "$result", $P48
    find_lex $P50, "%hash"
    unless_null $P50, vivify_41
    new $P50, "Hash"
  vivify_41:
    if $P50, if_49
    .const 'Sub' $P57 = "18_1256214676.53236" 
    capture_lex $P57
    $P57()
    goto if_49_end
  if_49:
    .const 'Sub' $P52 = "17_1256214676.53236" 
    capture_lex $P52
    $P52()
  if_49_end:
    new $P59, "Exception"
    set $P59['type'], 58
    find_lex $P60, "$result"
    unless_null $P60, vivify_44
    new $P60, "Undef"
  vivify_44:
    setattribute $P59, 'payload', $P60
    throw $P59
    .return ()
  control_44:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P61, exception, "payload"
    .return ($P61)
    rethrow exception
.end


.namespace ["Hash"]
.sub "_block56"  :anon :subid("18_1256214676.53236") :outer("16_1256214676.53236")
    new $P58, "Integer"
    assign $P58, 0
    store_lex "$result", $P58
    .return ($P58)
.end


.namespace ["Hash"]
.sub "_block51"  :anon :subid("17_1256214676.53236") :outer("16_1256214676.53236")
    find_lex $P53, "%hash"
    unless_null $P53, vivify_42
    new $P53, "Hash"
  vivify_42:
    find_lex $P54, "$key"
    unless_null $P54, vivify_43
    new $P54, "Undef"
  vivify_43:
    $P55 = $P53."contains"($P54)
    store_lex "$result", $P55
    .return ($P55)
.end


.namespace ["Hash"]
.sub "keys"  :subid("19_1256214676.53236") :method :outer("11_1256214676.53236")
    .const 'Sub' $P72 = "20_1256214676.53236" 
    capture_lex $P72
    new $P64, 'ExceptionHandler'
    set_addr $P64, control_63
    $P64."handle_types"(58)
    push_eh $P64
    .lex "self", self
    get_hll_global $P65, ["Array"], "empty"
    $P66 = $P65()
    .lex "@keys", $P66
    find_lex $P68, "self"
    defined $I69, $P68
    unless $I69, for_undef_45
    iter $P67, $P68
    new $P79, 'ExceptionHandler'
    set_addr $P79, loop78_handler
    $P79."handle_types"(65, 67, 66)
    push_eh $P79
  loop78_test:
    unless $P67, loop78_done
    shift $P70, $P67
  loop78_redo:
    .const 'Sub' $P72 = "20_1256214676.53236" 
    capture_lex $P72
    $P72($P70)
  loop78_next:
    goto loop78_test
  loop78_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P80, exception, 'type'
    eq $P80, 65, loop78_next
    eq $P80, 67, loop78_redo
  loop78_done:
    pop_eh 
  for_undef_45:
    new $P81, "Exception"
    set $P81['type'], 58
    find_lex $P82, "@keys"
    unless_null $P82, vivify_48
    new $P82, "ResizablePMCArray"
  vivify_48:
    setattribute $P81, 'payload', $P82
    throw $P81
    .return ()
  control_63:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P83, exception, "payload"
    .return ($P83)
    rethrow exception
.end


.namespace ["Hash"]
.sub "_block71"  :anon :subid("20_1256214676.53236") :outer("19_1256214676.53236")
    .param pmc param_73
    .lex "$_", param_73
    find_lex $P74, "@keys"
    unless_null $P74, vivify_46
    new $P74, "ResizablePMCArray"
  vivify_46:
    find_lex $P75, "$_"
    unless_null $P75, vivify_47
    new $P75, "Undef"
  vivify_47:
    set $S76, $P75
    $P77 = $P74."push"($S76)
    .return ($P77)
.end


.namespace ["Hash"]
.sub "merge"  :subid("21_1256214676.53236") :outer("11_1256214676.53236")
    .param pmc param_87
    .param pmc param_88 :slurpy
    .param pmc param_89 :optional :named("into")
    .param int has_param_89 :opt_flag
    .param pmc param_91 :optional :named("use_last")
    .param int has_param_91 :opt_flag
    .const 'Sub' $P128 = "25_1256214676.53236" 
    capture_lex $P128
    .const 'Sub' $P117 = "24_1256214676.53236" 
    capture_lex $P117
    .const 'Sub' $P100 = "22_1256214676.53236" 
    capture_lex $P100
    new $P86, 'ExceptionHandler'
    set_addr $P86, control_85
    $P86."handle_types"(58)
    push_eh $P86
    .lex "%first", param_87
    .lex "@hashes", param_88
    if has_param_89, optparam_49
    new $P90, "Undef"
    set param_89, $P90
  optparam_49:
    .lex "%into", param_89
    if has_param_91, optparam_50
    new $P92, "Undef"
    set param_91, $P92
  optparam_50:
    .lex "$use_last", param_91
    find_lex $P93, "@hashes"
    unless_null $P93, vivify_51
    new $P93, "ResizablePMCArray"
  vivify_51:
    find_lex $P94, "%first"
    unless_null $P94, vivify_52
    new $P94, "Hash"
  vivify_52:
    $P93."unshift"($P94)
    get_hll_global $P96, ["Parrot"], "defined"
    find_lex $P97, "%into"
    unless_null $P97, vivify_53
    new $P97, "Hash"
  vivify_53:
    $P98 = $P96($P97)
    if $P98, unless_95_end
    .const 'Sub' $P100 = "22_1256214676.53236" 
    capture_lex $P100
    $P100()
  unless_95_end:
    find_lex $P113, "%into"
    unless_null $P113, vivify_56
    new $P113, "Hash"
  vivify_56:
    .lex "%stored", $P113
    find_lex $P115, "$use_last"
    unless_null $P115, vivify_57
    new $P115, "Undef"
  vivify_57:
    unless $P115, if_114_end
    .const 'Sub' $P117 = "24_1256214676.53236" 
    capture_lex $P117
    $P117()
  if_114_end:
    find_lex $P124, "@hashes"
    unless_null $P124, vivify_59
    new $P124, "ResizablePMCArray"
  vivify_59:
    defined $I125, $P124
    unless $I125, for_undef_60
    iter $P123, $P124
    new $P159, 'ExceptionHandler'
    set_addr $P159, loop158_handler
    $P159."handle_types"(65, 67, 66)
    push_eh $P159
  loop158_test:
    unless $P123, loop158_done
    shift $P126, $P123
  loop158_redo:
    .const 'Sub' $P128 = "25_1256214676.53236" 
    capture_lex $P128
    $P128($P126)
  loop158_next:
    goto loop158_test
  loop158_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P160, exception, 'type'
    eq $P160, 65, loop158_next
    eq $P160, 67, loop158_redo
  loop158_done:
    pop_eh 
  for_undef_60:
    new $P161, "Exception"
    set $P161['type'], 58
    find_lex $P162, "%into"
    unless_null $P162, vivify_74
    new $P162, "Hash"
  vivify_74:
    setattribute $P161, 'payload', $P162
    throw $P161
    .return ()
  control_85:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P163, exception, "payload"
    .return ($P163)
    rethrow exception
.end


.namespace ["Hash"]
.sub "_block99"  :anon :subid("22_1256214676.53236") :outer("21_1256214676.53236")
    .const 'Sub' $P109 = "23_1256214676.53236" 
    capture_lex $P109
    find_lex $P101, "@hashes"
    unless_null $P101, vivify_54
    new $P101, "ResizablePMCArray"
  vivify_54:
    $P102 = $P101."shift"()
    store_lex "%into", $P102
    get_hll_global $P105, ["Parrot"], "defined"
    find_lex $P106, "%into"
    unless_null $P106, vivify_55
    new $P106, "Hash"
  vivify_55:
    $P107 = $P105($P106)
    unless $P107, unless_104
    set $P103, $P107
    goto unless_104_end
  unless_104:
    .const 'Sub' $P109 = "23_1256214676.53236" 
    capture_lex $P109
    $P112 = $P109()
    set $P103, $P112
  unless_104_end:
    .return ($P103)
.end


.namespace ["Hash"]
.sub "_block108"  :anon :subid("23_1256214676.53236") :outer("22_1256214676.53236")
    get_hll_global $P110, ["Hash"], "new"
    $P111 = $P110()
    store_lex "%into", $P111
    .return ($P111)
.end


.namespace ["Hash"]
.sub "_block116"  :anon :subid("24_1256214676.53236") :outer("21_1256214676.53236")
    get_hll_global $P118, ["Array"], "reverse"
    find_lex $P119, "@hashes"
    unless_null $P119, vivify_58
    new $P119, "ResizablePMCArray"
  vivify_58:
    $P120 = $P118($P119)
    store_lex "@hashes", $P120
    get_hll_global $P121, ["Hash"], "empty"
    $P122 = $P121()
    store_lex "%stored", $P122
    .return ($P122)
.end


.namespace ["Hash"]
.sub "_block127"  :anon :subid("25_1256214676.53236") :outer("21_1256214676.53236")
    .param pmc param_129
    .const 'Sub' $P136 = "26_1256214676.53236" 
    capture_lex $P136
    .lex "$_", param_129
    find_lex $P130, "$_"
    unless_null $P130, vivify_61
    new $P130, "Undef"
  vivify_61:
    .lex "$hash", $P130
    find_lex $P132, "$hash"
    unless_null $P132, vivify_62
    new $P132, "Undef"
  vivify_62:
    defined $I133, $P132
    unless $I133, for_undef_63
    iter $P131, $P132
    new $P156, 'ExceptionHandler'
    set_addr $P156, loop155_handler
    $P156."handle_types"(65, 67, 66)
    push_eh $P156
  loop155_test:
    unless $P131, loop155_done
    shift $P134, $P131
  loop155_redo:
    .const 'Sub' $P136 = "26_1256214676.53236" 
    capture_lex $P136
    $P136($P134)
  loop155_next:
    goto loop155_test
  loop155_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P157, exception, 'type'
    eq $P157, 65, loop155_next
    eq $P157, 67, loop155_redo
  loop155_done:
    pop_eh 
  for_undef_63:
    .return ($P131)
.end


.namespace ["Hash"]
.sub "_block135"  :anon :subid("26_1256214676.53236") :outer("25_1256214676.53236")
    .param pmc param_137
    .const 'Sub' $P145 = "27_1256214676.53236" 
    capture_lex $P145
    .lex "$_", param_137
    get_hll_global $P140, ["Hash"], "exists"
    find_lex $P141, "%stored"
    unless_null $P141, vivify_64
    new $P141, "Hash"
  vivify_64:
    find_lex $P142, "$_"
    unless_null $P142, vivify_65
    new $P142, "Undef"
  vivify_65:
    $P143 = $P140($P141, $P142)
    unless $P143, unless_139
    set $P138, $P143
    goto unless_139_end
  unless_139:
    .const 'Sub' $P145 = "27_1256214676.53236" 
    capture_lex $P145
    $P154 = $P145()
    set $P138, $P154
  unless_139_end:
    .return ($P138)
.end


.namespace ["Hash"]
.sub "_block144"  :anon :subid("27_1256214676.53236") :outer("26_1256214676.53236")
    find_lex $P146, "$_"
    unless_null $P146, vivify_66
    new $P146, "Undef"
  vivify_66:
    find_lex $P147, "$hash"
    unless_null $P147, vivify_67
    new $P147, "Hash"
  vivify_67:
    set $P148, $P147[$P146]
    unless_null $P148, vivify_68
    new $P148, "Undef"
  vivify_68:
    find_lex $P149, "$_"
    unless_null $P149, vivify_69
    new $P149, "Undef"
  vivify_69:
    find_lex $P150, "%stored"
    unless_null $P150, vivify_70
    new $P150, "Hash"
  vivify_70:
    set $P151, $P150[$P149]
    unless_null $P151, vivify_71
    new $P151, "Undef"
  vivify_71:
    find_lex $P152, "$_"
    unless_null $P152, vivify_72
    new $P152, "Undef"
  vivify_72:
    find_lex $P153, "%into"
    unless_null $P153, vivify_73
    new $P153, "Hash"
    store_lex "%into", $P153
  vivify_73:
    set $P153[$P152], $P151
    .return ($P151)
.end


.namespace ["Hash"]
.sub "merge_keys"  :subid("28_1256214676.53236") :outer("11_1256214676.53236")
    .param pmc param_167
    .param pmc param_168 :slurpy
    .param pmc param_169 :named("keys")
    .param pmc param_170 :optional :named("into")
    .param int has_param_170 :opt_flag
    .param pmc param_172 :optional :named("use_last")
    .param int has_param_172 :opt_flag
    .const 'Sub' $P209 = "32_1256214676.53236" 
    capture_lex $P209
    .const 'Sub' $P198 = "31_1256214676.53236" 
    capture_lex $P198
    .const 'Sub' $P181 = "29_1256214676.53236" 
    capture_lex $P181
    new $P166, 'ExceptionHandler'
    set_addr $P166, control_165
    $P166."handle_types"(58)
    push_eh $P166
    .lex "%first", param_167
    .lex "@hashes", param_168
    .lex "@keys", param_169
    if has_param_170, optparam_75
    new $P171, "Undef"
    set param_170, $P171
  optparam_75:
    .lex "%into", param_170
    if has_param_172, optparam_76
    new $P173, "Undef"
    set param_172, $P173
  optparam_76:
    .lex "$use_last", param_172
    find_lex $P174, "@hashes"
    unless_null $P174, vivify_77
    new $P174, "ResizablePMCArray"
  vivify_77:
    find_lex $P175, "%first"
    unless_null $P175, vivify_78
    new $P175, "Hash"
  vivify_78:
    $P174."unshift"($P175)
    get_hll_global $P177, ["Parrot"], "defined"
    find_lex $P178, "%into"
    unless_null $P178, vivify_79
    new $P178, "Hash"
  vivify_79:
    $P179 = $P177($P178)
    if $P179, unless_176_end
    .const 'Sub' $P181 = "29_1256214676.53236" 
    capture_lex $P181
    $P181()
  unless_176_end:
    find_lex $P194, "%into"
    unless_null $P194, vivify_82
    new $P194, "Hash"
  vivify_82:
    .lex "%stored", $P194
    find_lex $P196, "$use_last"
    unless_null $P196, vivify_83
    new $P196, "Undef"
  vivify_83:
    unless $P196, if_195_end
    .const 'Sub' $P198 = "31_1256214676.53236" 
    capture_lex $P198
    $P198()
  if_195_end:
    find_lex $P205, "@hashes"
    unless_null $P205, vivify_85
    new $P205, "ResizablePMCArray"
  vivify_85:
    defined $I206, $P205
    unless $I206, for_undef_86
    iter $P204, $P205
    new $P247, 'ExceptionHandler'
    set_addr $P247, loop246_handler
    $P247."handle_types"(65, 67, 66)
    push_eh $P247
  loop246_test:
    unless $P204, loop246_done
    shift $P207, $P204
  loop246_redo:
    .const 'Sub' $P209 = "32_1256214676.53236" 
    capture_lex $P209
    $P209($P207)
  loop246_next:
    goto loop246_test
  loop246_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P248, exception, 'type'
    eq $P248, 65, loop246_next
    eq $P248, 67, loop246_redo
  loop246_done:
    pop_eh 
  for_undef_86:
    new $P249, "Exception"
    set $P249['type'], 58
    find_lex $P250, "%into"
    unless_null $P250, vivify_102
    new $P250, "Hash"
  vivify_102:
    setattribute $P249, 'payload', $P250
    throw $P249
    .return ()
  control_165:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P251, exception, "payload"
    .return ($P251)
    rethrow exception
.end


.namespace ["Hash"]
.sub "_block180"  :anon :subid("29_1256214676.53236") :outer("28_1256214676.53236")
    .const 'Sub' $P190 = "30_1256214676.53236" 
    capture_lex $P190
    find_lex $P182, "@hashes"
    unless_null $P182, vivify_80
    new $P182, "ResizablePMCArray"
  vivify_80:
    $P183 = $P182."shift"()
    store_lex "%into", $P183
    get_hll_global $P186, ["Parrot"], "defined"
    find_lex $P187, "%into"
    unless_null $P187, vivify_81
    new $P187, "Hash"
  vivify_81:
    $P188 = $P186($P187)
    unless $P188, unless_185
    set $P184, $P188
    goto unless_185_end
  unless_185:
    .const 'Sub' $P190 = "30_1256214676.53236" 
    capture_lex $P190
    $P193 = $P190()
    set $P184, $P193
  unless_185_end:
    .return ($P184)
.end


.namespace ["Hash"]
.sub "_block189"  :anon :subid("30_1256214676.53236") :outer("29_1256214676.53236")
    get_hll_global $P191, ["Hash"], "new"
    $P192 = $P191()
    store_lex "%into", $P192
    .return ($P192)
.end


.namespace ["Hash"]
.sub "_block197"  :anon :subid("31_1256214676.53236") :outer("28_1256214676.53236")
    get_hll_global $P199, ["Array"], "reverse"
    find_lex $P200, "@hashes"
    unless_null $P200, vivify_84
    new $P200, "ResizablePMCArray"
  vivify_84:
    $P201 = $P199($P200)
    store_lex "@hashes", $P201
    get_hll_global $P202, ["Hash"], "empty"
    $P203 = $P202()
    store_lex "%stored", $P203
    .return ($P203)
.end


.namespace ["Hash"]
.sub "_block208"  :anon :subid("32_1256214676.53236") :outer("28_1256214676.53236")
    .param pmc param_210
    .const 'Sub' $P217 = "33_1256214676.53236" 
    capture_lex $P217
    .lex "$_", param_210
    find_lex $P211, "$_"
    unless_null $P211, vivify_87
    new $P211, "Undef"
  vivify_87:
    .lex "$hash", $P211
    find_lex $P213, "@keys"
    unless_null $P213, vivify_88
    new $P213, "ResizablePMCArray"
  vivify_88:
    defined $I214, $P213
    unless $I214, for_undef_89
    iter $P212, $P213
    new $P244, 'ExceptionHandler'
    set_addr $P244, loop243_handler
    $P244."handle_types"(65, 67, 66)
    push_eh $P244
  loop243_test:
    unless $P212, loop243_done
    shift $P215, $P212
  loop243_redo:
    .const 'Sub' $P217 = "33_1256214676.53236" 
    capture_lex $P217
    $P217($P215)
  loop243_next:
    goto loop243_test
  loop243_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P245, exception, 'type'
    eq $P245, 65, loop243_next
    eq $P245, 67, loop243_redo
  loop243_done:
    pop_eh 
  for_undef_89:
    .return ($P212)
.end


.namespace ["Hash"]
.sub "_block216"  :anon :subid("33_1256214676.53236") :outer("32_1256214676.53236")
    .param pmc param_218
    .const 'Sub' $P233 = "34_1256214676.53236" 
    capture_lex $P233
    .lex "$_", param_218
    get_hll_global $P223, ["Hash"], "exists"
    find_lex $P224, "%stored"
    unless_null $P224, vivify_90
    new $P224, "Hash"
  vivify_90:
    find_lex $P225, "$_"
    unless_null $P225, vivify_91
    new $P225, "Undef"
  vivify_91:
    $P226 = $P223($P224, $P225)
    isfalse $I227, $P226
    if $I227, if_222
    new $P221, 'Integer'
    set $P221, $I227
    goto if_222_end
  if_222:
    get_hll_global $P228, ["Hash"], "exists"
    find_lex $P229, "$hash"
    unless_null $P229, vivify_92
    new $P229, "Undef"
  vivify_92:
    find_lex $P230, "$_"
    unless_null $P230, vivify_93
    new $P230, "Undef"
  vivify_93:
    $P231 = $P228($P229, $P230)
    set $P221, $P231
  if_222_end:
    if $P221, if_220
    set $P219, $P221
    goto if_220_end
  if_220:
    .const 'Sub' $P233 = "34_1256214676.53236" 
    capture_lex $P233
    $P242 = $P233()
    set $P219, $P242
  if_220_end:
    .return ($P219)
.end


.namespace ["Hash"]
.sub "_block232"  :anon :subid("34_1256214676.53236") :outer("33_1256214676.53236")
    find_lex $P234, "$_"
    unless_null $P234, vivify_94
    new $P234, "Undef"
  vivify_94:
    find_lex $P235, "$hash"
    unless_null $P235, vivify_95
    new $P235, "Hash"
  vivify_95:
    set $P236, $P235[$P234]
    unless_null $P236, vivify_96
    new $P236, "Undef"
  vivify_96:
    find_lex $P237, "$_"
    unless_null $P237, vivify_97
    new $P237, "Undef"
  vivify_97:
    find_lex $P238, "%stored"
    unless_null $P238, vivify_98
    new $P238, "Hash"
  vivify_98:
    set $P239, $P238[$P237]
    unless_null $P239, vivify_99
    new $P239, "Undef"
  vivify_99:
    find_lex $P240, "$_"
    unless_null $P240, vivify_100
    new $P240, "Undef"
  vivify_100:
    find_lex $P241, "%into"
    unless_null $P241, vivify_101
    new $P241, "Hash"
    store_lex "%into", $P241
  vivify_101:
    set $P241[$P240], $P239
    .return ($P239)
.end


.namespace ["Hash"]
.sub "new"  :subid("35_1256214676.53236") :outer("11_1256214676.53236")
    .param pmc param_255 :slurpy
    .param pmc param_256 :slurpy :named
    .const 'Sub' $P261 = "36_1256214676.53236" 
    capture_lex $P261
    new $P254, 'ExceptionHandler'
    set_addr $P254, control_253
    $P254."handle_types"(58)
    push_eh $P254
    .lex "@pos", param_255
    .lex "%pairs", param_256
    find_lex $P258, "@pos"
    unless_null $P258, vivify_103
    new $P258, "ResizablePMCArray"
  vivify_103:
    set $N259, $P258
    unless $N259, if_257_end
    .const 'Sub' $P261 = "36_1256214676.53236" 
    capture_lex $P261
    $P261()
  if_257_end:
    new $P266, "Exception"
    set $P266['type'], 58
    find_lex $P267, "%pairs"
    unless_null $P267, vivify_105
    new $P267, "Hash"
  vivify_105:
    setattribute $P266, 'payload', $P267
    throw $P266
    .return ()
  control_253:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P268, exception, "payload"
    .return ($P268)
    rethrow exception
.end


.namespace ["Hash"]
.sub "_block260"  :anon :subid("36_1256214676.53236") :outer("35_1256214676.53236")
    get_hll_global $P262, ["PCT"], "HLLCompiler"
    find_lex $P263, "@pos"
    unless_null $P263, vivify_104
    new $P263, "ResizablePMCArray"
  vivify_104:
    $P262."dumper"($P263, "positional args to Hash::new")
    get_hll_global $P264, ["Dumper"], "DIE"
    $P265 = $P264("WTF? Remember Hash is the default class.")
    .return ($P265)
.end


.namespace ["Hash"]
.sub "sorted_keys"  :subid("37_1256214676.53236") :outer("11_1256214676.53236")
    .param pmc param_272
    new $P271, 'ExceptionHandler'
    set_addr $P271, control_270
    $P271."handle_types"(58)
    push_eh $P271
    .lex "%hash", param_272
    new $P273, "Exception"
    set $P273['type'], 58
    find_lex $P274, "%hash"
    unless_null $P274, vivify_106
    new $P274, "Hash"
  vivify_106:
    $P275 = $P274."keys"()
    $P276 = $P275."sort"()
    setattribute $P273, 'payload', $P276
    throw $P273
    .return ()
  control_270:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P277, exception, "payload"
    .return ($P277)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256253383.13085")
    get_hll_global $P14, ["Miscellaneous"], "_block13" 
    .return ($P14)
.end


.namespace ["Miscellaneous"]
.sub "_block13" :init :load :subid("11_1256253383.13085")
    .const 'Sub' $P15 = "12_1256253383.13085" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P15 = "12_1256253383.13085" 
    capture_lex $P15
    .return ($P15)
.end


.namespace ["Miscellaneous"]
.sub "_ONLOAD"  :subid("12_1256253383.13085") :outer("11_1256253383.13085")
    .const 'Sub' $P30 = "14_1256253383.13085" 
    capture_lex $P30
    .const 'Sub' $P21 = "13_1256253383.13085" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_15
    new $P19, "Undef"
  vivify_15:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256253383.13085" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, "say"
    .lex "$say", $P25
    find_lex $P28, "$say"
    unless_null $P28, vivify_16
    new $P28, "Undef"
  vivify_16:
    unless $P28, unless_27
    set $P26, $P28
    goto unless_27_end
  unless_27:
    .const 'Sub' $P30 = "14_1256253383.13085" 
    capture_lex $P30
    $P31 = $P30()
    set $P26, $P31
  unless_27_end:
    .return ($P26)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P32, exception, "payload"
    .return ($P32)
    rethrow exception
.end


.namespace ["Miscellaneous"]
.sub "_block20"  :anon :subid("13_1256253383.13085") :outer("12_1256253383.13085")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Miscellaneous"]
.sub "_block29"  :anon :subid("14_1256253383.13085") :outer("12_1256253383.13085")
 load_language 'nqp' 
    .return ()
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256214678.06238")
    get_hll_global $P14, ["OS"], "_block13" 
    .return ($P14)
.end


.namespace ["OS"]
.sub "_block13" :init :load :subid("11_1256214678.06238")
    .const 'Sub' $P137 = "26_1256214678.06238" 
    capture_lex $P137
    .const 'Sub' $P130 = "25_1256214678.06238" 
    capture_lex $P130
    .const 'Sub' $P120 = "24_1256214678.06238" 
    capture_lex $P120
    .const 'Sub' $P111 = "23_1256214678.06238" 
    capture_lex $P111
    .const 'Sub' $P103 = "22_1256214678.06238" 
    capture_lex $P103
    .const 'Sub' $P92 = "21_1256214678.06238" 
    capture_lex $P92
    .const 'Sub' $P83 = "20_1256214678.06238" 
    capture_lex $P83
    .const 'Sub' $P73 = "19_1256214678.06238" 
    capture_lex $P73
    .const 'Sub' $P64 = "18_1256214678.06238" 
    capture_lex $P64
    .const 'Sub' $P54 = "17_1256214678.06238" 
    capture_lex $P54
    .const 'Sub' $P47 = "16_1256214678.06238" 
    capture_lex $P47
    .const 'Sub' $P38 = "15_1256214678.06238" 
    capture_lex $P38
    .const 'Sub' $P30 = "14_1256214678.06238" 
    capture_lex $P30
    .const 'Sub' $P16 = "12_1256214678.06238" 
    capture_lex $P16
$P15 = get_root_global ["parrot"], "P6metaclass"
    $P15."new_class"("OS")
    .const 'Sub' $P137 = "26_1256214678.06238" 
    capture_lex $P137
    .return ($P137)
.end


.namespace ["OS"]
.sub "_get_pmc"  :subid("12_1256214678.06238") :outer("11_1256214678.06238")
    .const 'Sub' $P25 = "13_1256214678.06238" 
    capture_lex $P25
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(58)
    push_eh $P18
    get_global $P19, "$_Pmc"
    unless_null $P19, vivify_27
    new $P19, "Undef"
  vivify_27:
    get_hll_global $P21, ["Parrot"], "defined"
    get_global $P22, "$_Pmc"
    unless_null $P22, vivify_28
    new $P22, "Undef"
  vivify_28:
    $P23 = $P21($P22)
    if $P23, unless_20_end
    .const 'Sub' $P25 = "13_1256214678.06238" 
    capture_lex $P25
    $P25()
  unless_20_end:
    new $P27, "Exception"
    set $P27['type'], 58
    get_global $P28, "$_Pmc"
    unless_null $P28, vivify_29
    new $P28, "Undef"
  vivify_29:
    setattribute $P27, 'payload', $P28
    throw $P27
    .return ()
  control_17:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P29, exception, "payload"
    .return ($P29)
    rethrow exception
.end


.namespace ["OS"]
.sub "_block24"  :anon :subid("13_1256214678.06238") :outer("12_1256214678.06238")

			$P26 = root_new [ 'parrot' ; 'OS' ]
		
    set_global "$_Pmc", $P26
    .return ($P26)
.end


.namespace ["OS"]
.sub "chdir"  :subid("14_1256214678.06238") :outer("11_1256214678.06238")
    .param pmc param_33
    new $P32, 'ExceptionHandler'
    set_addr $P32, control_31
    $P32."handle_types"(58)
    push_eh $P32
    .lex "$path", param_33
    $P34 = "_get_pmc"()
    find_lex $P35, "$path"
    unless_null $P35, vivify_30
    new $P35, "Undef"
  vivify_30:
    $P36 = $P34."chdir"($P35)
    .return ($P36)
  control_31:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P37, exception, "payload"
    .return ($P37)
    rethrow exception
.end


.namespace ["OS"]
.sub "chroot"  :subid("15_1256214678.06238") :outer("11_1256214678.06238")
    .param pmc param_41
    new $P40, 'ExceptionHandler'
    set_addr $P40, control_39
    $P40."handle_types"(58)
    push_eh $P40
    .lex "$path", param_41
    new $P42, "Exception"
    set $P42['type'], 58
    $P43 = "_get_pmc"()
    find_lex $P44, "$path"
    unless_null $P44, vivify_31
    new $P44, "Undef"
  vivify_31:
    $P45 = $P43."chroot"($P44)
    setattribute $P42, 'payload', $P45
    throw $P42
    .return ()
  control_39:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P46, exception, "payload"
    .return ($P46)
    rethrow exception
.end


.namespace ["OS"]
.sub "cwd"  :subid("16_1256214678.06238") :outer("11_1256214678.06238")
    new $P49, 'ExceptionHandler'
    set_addr $P49, control_48
    $P49."handle_types"(58)
    push_eh $P49
    new $P50, "Exception"
    set $P50['type'], 58
    $P51 = "_get_pmc"()
    $P52 = $P51."cwd"()
    setattribute $P50, 'payload', $P52
    throw $P50
    .return ()
  control_48:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P53, exception, "payload"
    .return ($P53)
    rethrow exception
.end


.namespace ["OS"]
.sub "link"  :subid("17_1256214678.06238") :outer("11_1256214678.06238")
    .param pmc param_57
    .param pmc param_58
    new $P56, 'ExceptionHandler'
    set_addr $P56, control_55
    $P56."handle_types"(58)
    push_eh $P56
    .lex "$from", param_57
    .lex "$to", param_58
    $P59 = "_get_pmc"()
    find_lex $P60, "$from"
    unless_null $P60, vivify_32
    new $P60, "Undef"
  vivify_32:
    find_lex $P61, "$to"
    unless_null $P61, vivify_33
    new $P61, "Undef"
  vivify_33:
    $P62 = $P59."link"($P60, $P61)
    .return ($P62)
  control_55:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P63, exception, "payload"
    .return ($P63)
    rethrow exception
.end


.namespace ["OS"]
.sub "lstat"  :subid("18_1256214678.06238") :outer("11_1256214678.06238")
    .param pmc param_67
    new $P66, 'ExceptionHandler'
    set_addr $P66, control_65
    $P66."handle_types"(58)
    push_eh $P66
    .lex "$path", param_67
    new $P68, "Exception"
    set $P68['type'], 58
    $P69 = "_get_pmc"()
    find_lex $P70, "$path"
    unless_null $P70, vivify_34
    new $P70, "Undef"
  vivify_34:
    $P71 = $P69."lstat"($P70)
    setattribute $P68, 'payload', $P71
    throw $P68
    .return ()
  control_65:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P72, exception, "payload"
    .return ($P72)
    rethrow exception
.end


.namespace ["OS"]
.sub "mkdir"  :subid("19_1256214678.06238") :outer("11_1256214678.06238")
    .param pmc param_76
    .param pmc param_77
    new $P75, 'ExceptionHandler'
    set_addr $P75, control_74
    $P75."handle_types"(58)
    push_eh $P75
    .lex "$path", param_76
    .lex "$mode", param_77
    $P78 = "_get_pmc"()
    find_lex $P79, "$path"
    unless_null $P79, vivify_35
    new $P79, "Undef"
  vivify_35:
    find_lex $P80, "$mode"
    unless_null $P80, vivify_36
    new $P80, "Undef"
  vivify_36:
    $P81 = $P78."mkdir"($P79, $P80)
    .return ($P81)
  control_74:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P82, exception, "payload"
    .return ($P82)
    rethrow exception
.end


.namespace ["OS"]
.sub "readdir"  :subid("20_1256214678.06238") :outer("11_1256214678.06238")
    .param pmc param_86
    new $P85, 'ExceptionHandler'
    set_addr $P85, control_84
    $P85."handle_types"(58)
    push_eh $P85
    .lex "$path", param_86
    new $P87, "Exception"
    set $P87['type'], 58
    $P88 = "_get_pmc"()
    find_lex $P89, "$path"
    unless_null $P89, vivify_37
    new $P89, "Undef"
  vivify_37:
    $P90 = $P88."readdir"($P89)
    setattribute $P87, 'payload', $P90
    throw $P87
    .return ()
  control_84:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P91, exception, "payload"
    .return ($P91)
    rethrow exception
.end


.namespace ["OS"]
.sub "rename"  :subid("21_1256214678.06238") :outer("11_1256214678.06238")
    .param pmc param_95
    .param pmc param_96
    new $P94, 'ExceptionHandler'
    set_addr $P94, control_93
    $P94."handle_types"(58)
    push_eh $P94
    .lex "$oldpath", param_95
    .lex "$newpath", param_96
    new $P97, "Exception"
    set $P97['type'], 58
    $P98 = "_get_pmc"()
    find_lex $P99, "$oldpath"
    unless_null $P99, vivify_38
    new $P99, "Undef"
  vivify_38:
    find_lex $P100, "$newpath"
    unless_null $P100, vivify_39
    new $P100, "Undef"
  vivify_39:
    $P101 = $P98."rename"($P99, $P100)
    setattribute $P97, 'payload', $P101
    throw $P97
    .return ()
  control_93:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
    rethrow exception
.end


.namespace ["OS"]
.sub "rm"  :subid("22_1256214678.06238") :outer("11_1256214678.06238")
    .param pmc param_106
    new $P105, 'ExceptionHandler'
    set_addr $P105, control_104
    $P105."handle_types"(58)
    push_eh $P105
    .lex "$path", param_106
    $P107 = "_get_pmc"()
    find_lex $P108, "$path"
    unless_null $P108, vivify_40
    new $P108, "Undef"
  vivify_40:
    $P109 = $P107."rm"($P108)
    .return ($P109)
  control_104:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
    rethrow exception
.end


.namespace ["OS"]
.sub "stat"  :subid("23_1256214678.06238") :outer("11_1256214678.06238")
    .param pmc param_114
    new $P113, 'ExceptionHandler'
    set_addr $P113, control_112
    $P113."handle_types"(58)
    push_eh $P113
    .lex "$path", param_114
    new $P115, "Exception"
    set $P115['type'], 58
    $P116 = "_get_pmc"()
    find_lex $P117, "$path"
    unless_null $P117, vivify_41
    new $P117, "Undef"
  vivify_41:
    $P118 = $P116."stat"($P117)
    setattribute $P115, 'payload', $P118
    throw $P115
    .return ()
  control_112:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P119, exception, "payload"
    .return ($P119)
    rethrow exception
.end


.namespace ["OS"]
.sub "symlink"  :subid("24_1256214678.06238") :outer("11_1256214678.06238")
    .param pmc param_123
    .param pmc param_124
    new $P122, 'ExceptionHandler'
    set_addr $P122, control_121
    $P122."handle_types"(58)
    push_eh $P122
    .lex "$from", param_123
    .lex "$to", param_124
    $P125 = "_get_pmc"()
    find_lex $P126, "$from"
    unless_null $P126, vivify_42
    new $P126, "Undef"
  vivify_42:
    find_lex $P127, "$to"
    unless_null $P127, vivify_43
    new $P127, "Undef"
  vivify_43:
    $P128 = $P125."symlink"($P126, $P127)
    .return ($P128)
  control_121:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P129, exception, "payload"
    .return ($P129)
    rethrow exception
.end


.namespace ["OS"]
.sub "time"  :subid("25_1256214678.06238") :outer("11_1256214678.06238")
    new $P132, 'ExceptionHandler'
    set_addr $P132, control_131
    $P132."handle_types"(58)
    push_eh $P132

		$N0 = time
		$P133 = box $N0
	
    .lex "$result", $P133
    new $P134, "Exception"
    set $P134['type'], 58
    find_lex $P135, "$result"
    unless_null $P135, vivify_44
    new $P135, "Undef"
  vivify_44:
    setattribute $P134, 'payload', $P135
    throw $P134
    .return ()
  control_131:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P136, exception, "payload"
    .return ($P136)
    rethrow exception
.end


.namespace ["OS"]
.sub "umask"  :subid("26_1256214678.06238") :outer("11_1256214678.06238")
    .param pmc param_140
    new $P139, 'ExceptionHandler'
    set_addr $P139, control_138
    $P139."handle_types"(58)
    push_eh $P139
    .lex "$mask", param_140
    new $P141, "Exception"
    set $P141['type'], 58
    $P142 = "_get_pmc"()
    find_lex $P143, "$mask"
    unless_null $P143, vivify_45
    new $P143, "Undef"
  vivify_45:
    $P144 = $P142."umask"($P143)
    setattribute $P141, 'payload', $P144
    throw $P141
    .return ()
  control_138:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P145, exception, "payload"
    .return ($P145)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256278672.46233")
    get_hll_global $P14, ["Parrot"], "_block13" 
    .return ($P14)
.end


.namespace ["Parrot"]
.sub "_block13" :init :load :subid("11_1256278672.46233")
    .const 'Sub' $P423 = "60_1256278672.46233" 
    capture_lex $P423
    .const 'Sub' $P418 = "59_1256278672.46233" 
    capture_lex $P418
    .const 'Sub' $P410 = "58_1256278672.46233" 
    capture_lex $P410
    .const 'Sub' $P402 = "57_1256278672.46233" 
    capture_lex $P402
    .const 'Sub' $P397 = "56_1256278672.46233" 
    capture_lex $P397
    .const 'Sub' $P388 = "55_1256278672.46233" 
    capture_lex $P388
    .const 'Sub' $P379 = "54_1256278672.46233" 
    capture_lex $P379
    .const 'Sub' $P370 = "53_1256278672.46233" 
    capture_lex $P370
    .const 'Sub' $P356 = "51_1256278672.46233" 
    capture_lex $P356
    .const 'Sub' $P347 = "50_1256278672.46233" 
    capture_lex $P347
    .const 'Sub' $P326 = "48_1256278672.46233" 
    capture_lex $P326
    .const 'Sub' $P318 = "47_1256278672.46233" 
    capture_lex $P318
    .const 'Sub' $P306 = "46_1256278672.46233" 
    capture_lex $P306
    .const 'Sub' $P295 = "45_1256278672.46233" 
    capture_lex $P295
    .const 'Sub' $P284 = "43_1256278672.46233" 
    capture_lex $P284
    .const 'Sub' $P276 = "42_1256278672.46233" 
    capture_lex $P276
    .const 'Sub' $P265 = "40_1256278672.46233" 
    capture_lex $P265
    .const 'Sub' $P257 = "39_1256278672.46233" 
    capture_lex $P257
    .const 'Sub' $P248 = "38_1256278672.46233" 
    capture_lex $P248
    .const 'Sub' $P240 = "37_1256278672.46233" 
    capture_lex $P240
    .const 'Sub' $P232 = "36_1256278672.46233" 
    capture_lex $P232
    .const 'Sub' $P223 = "35_1256278672.46233" 
    capture_lex $P223
    .const 'Sub' $P218 = "34_1256278672.46233" 
    capture_lex $P218
    .const 'Sub' $P210 = "33_1256278672.46233" 
    capture_lex $P210
    .const 'Sub' $P202 = "32_1256278672.46233" 
    capture_lex $P202
    .const 'Sub' $P194 = "31_1256278672.46233" 
    capture_lex $P194
    .const 'Sub' $P186 = "30_1256278672.46233" 
    capture_lex $P186
    .const 'Sub' $P177 = "29_1256278672.46233" 
    capture_lex $P177
    .const 'Sub' $P163 = "27_1256278672.46233" 
    capture_lex $P163
    .const 'Sub' $P149 = "25_1256278672.46233" 
    capture_lex $P149
    .const 'Sub' $P26 = "14_1256278672.46233" 
    capture_lex $P26
    .const 'Sub' $P15 = "12_1256278672.46233" 
    capture_lex $P15
    "_ONLOAD"()
    get_hll_global $P432, ["Parrot";"Globals"], "_block431" 
    .return ($P432)
.end


.namespace ["Parrot"]
.sub "_ONLOAD"  :subid("12_1256278672.46233") :outer("11_1256278672.46233")
    .const 'Sub' $P21 = "13_1256278672.46233" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_66
    new $P19, "Undef"
  vivify_66:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256278672.46233" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24

		.include 'iglobals.pasm'
		.include 'interpinfo.pasm'
		.include 'sysinfo.pasm'
	
    .return ()
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P25, exception, "payload"
    .return ($P25)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "_block20"  :anon :subid("13_1256278672.46233") :outer("12_1256278672.46233")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Parrot"]
.sub "IMPORT"  :subid("14_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_29
    .param pmc param_30 :optional
    .param int has_param_30 :opt_flag
    .const 'Sub' $P123 = "22_1256278672.46233" 
    capture_lex $P123
    .const 'Sub' $P54 = "17_1256278672.46233" 
    capture_lex $P54
    .const 'Sub' $P50 = "16_1256278672.46233" 
    capture_lex $P50
    .const 'Sub' $P38 = "15_1256278672.46233" 
    capture_lex $P38
    new $P28, 'ExceptionHandler'
    set_addr $P28, control_27
    $P28."handle_types"(58)
    push_eh $P28
    .lex "$namespace", param_29
    if has_param_30, optparam_67
    new $P31, "Undef"
    set param_30, $P31
  optparam_67:
    .lex "$names", param_30
    $P32 = "caller_namespace"(2)
    .lex "$caller_nsp", $P32
    find_lex $P33, "$namespace"
    unless_null $P33, vivify_68
    new $P33, "Undef"
  vivify_68:
    $P34 = "get_namespace"($P33)
    .lex "$from_nsp", $P34
    find_lex $P36, "$from_nsp"
    unless_null $P36, vivify_69
    new $P36, "Undef"
  vivify_69:
    if $P36, unless_35_end
    .const 'Sub' $P38 = "15_1256278672.46233" 
    capture_lex $P38
    $P38()
  unless_35_end:
    find_lex $P45, "$from_nsp"
    unless_null $P45, vivify_73
    new $P45, "Undef"
  vivify_73:
    "call_onload"($P45)
    new $P46, "ResizablePMCArray"
    .lex "@names", $P46
    find_lex $P48, "$names"
    unless_null $P48, vivify_74
    new $P48, "Undef"
  vivify_74:
    if $P48, if_47
    .const 'Sub' $P54 = "17_1256278672.46233" 
    capture_lex $P54
    $P54()
    goto if_47_end
  if_47:
    .const 'Sub' $P50 = "16_1256278672.46233" 
    capture_lex $P50
    $P50()
  if_47_end:
    get_hll_global $P116, ["Array"], "empty"
    $P117 = $P116()
    .lex "@new_names", $P117
    find_lex $P119, "@names"
    unless_null $P119, vivify_90
    new $P119, "ResizablePMCArray"
  vivify_90:
    defined $I120, $P119
    unless $I120, for_undef_91
    iter $P118, $P119
    new $P142, 'ExceptionHandler'
    set_addr $P142, loop141_handler
    $P142."handle_types"(65, 67, 66)
    push_eh $P142
  loop141_test:
    unless $P118, loop141_done
    shift $P121, $P118
  loop141_redo:
    .const 'Sub' $P123 = "22_1256278672.46233" 
    capture_lex $P123
    $P123($P121)
  loop141_next:
    goto loop141_test
  loop141_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P143, exception, 'type'
    eq $P143, 65, loop141_next
    eq $P143, 67, loop141_redo
  loop141_done:
    pop_eh 
  for_undef_91:
    find_lex $P144, "$from_nsp"
    unless_null $P144, vivify_97
    new $P144, "Undef"
  vivify_97:
    find_lex $P145, "$caller_nsp"
    unless_null $P145, vivify_98
    new $P145, "Undef"
  vivify_98:
    find_lex $P146, "@names"
    unless_null $P146, vivify_99
    new $P146, "ResizablePMCArray"
  vivify_99:
    $P147 = $P144."export_to"($P145, $P146)
    .return ($P147)
  control_27:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P148, exception, "payload"
    .return ($P148)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "_block37"  :anon :subid("15_1256278672.46233") :outer("14_1256278672.46233")
    find_lex $P39, "$namespace"
    unless_null $P39, vivify_70
    new $P39, "Undef"
  vivify_70:
    "say"("Namespace: ", $P39)
    get_hll_global $P40, ["Dumper"], "DUMP_"
    find_lex $P41, "$namespace"
    unless_null $P41, vivify_71
    new $P41, "Undef"
  vivify_71:
    $P40($P41)
    get_hll_global $P42, ["Dumper"], "DUMP_"
    find_lex $P43, "$from_nsp"
    unless_null $P43, vivify_72
    new $P43, "Undef"
  vivify_72:
    $P44 = $P42($P43)
    .return ($P44)
.end


.namespace ["Parrot"]
.sub "_block53"  :anon :subid("17_1256278672.46233") :outer("14_1256278672.46233")
    .const 'Sub' $P60 = "18_1256278672.46233" 
    capture_lex $P60
    find_lex $P56, "$from_nsp"
    unless_null $P56, vivify_75
    new $P56, "Undef"
  vivify_75:
    defined $I57, $P56
    unless $I57, for_undef_76
    iter $P55, $P56
    new $P114, 'ExceptionHandler'
    set_addr $P114, loop113_handler
    $P114."handle_types"(65, 67, 66)
    push_eh $P114
  loop113_test:
    unless $P55, loop113_done
    shift $P58, $P55
  loop113_redo:
    .const 'Sub' $P60 = "18_1256278672.46233" 
    capture_lex $P60
    $P60($P58)
  loop113_next:
    goto loop113_test
  loop113_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, 65, loop113_next
    eq $P115, 67, loop113_redo
  loop113_done:
    pop_eh 
  for_undef_76:
    .return ($P55)
.end


.namespace ["Parrot"]
.sub "_block59"  :anon :subid("18_1256278672.46233") :outer("17_1256278672.46233")
    .param pmc param_61
    .const 'Sub' $P107 = "21_1256278672.46233" 
    capture_lex $P107
    .const 'Sub' $P101 = "20_1256278672.46233" 
    capture_lex $P101
    .const 'Sub' $P93 = "19_1256278672.46233" 
    capture_lex $P93
    .lex "$_", param_61
    find_lex $P62, "$_"
    unless_null $P62, vivify_77
    new $P62, "Undef"
  vivify_77:
    set $S63, $P62
    new $P64, 'String'
    set $P64, $S63
    .lex "$name", $P64
    find_lex $P65, "$name"
    unless_null $P65, vivify_78
    new $P65, "ResizablePMCArray"
  vivify_78:
    set $P66, $P65[0]
    unless_null $P66, vivify_79
    new $P66, "Undef"
  vivify_79:
    .lex "$first_char", $P66
    new $P67, "Integer"
    assign $P67, 0
    .lex "$skip", $P67
    find_lex $P77, "$first_char"
    unless_null $P77, vivify_80
    new $P77, "Undef"
  vivify_80:
    set $S78, $P77
    iseq $I79, $S78, "$"
    unless $I79, unless_76
    new $P75, 'Integer'
    set $P75, $I79
    goto unless_76_end
  unless_76:
    find_lex $P80, "$first_char"
    unless_null $P80, vivify_81
    new $P80, "Undef"
  vivify_81:
    set $S81, $P80
    iseq $I82, $S81, "@"
    new $P75, 'Integer'
    set $P75, $I82
  unless_76_end:
    unless $P75, unless_74
    set $P73, $P75
    goto unless_74_end
  unless_74:
    find_lex $P83, "$first_char"
    unless_null $P83, vivify_82
    new $P83, "Undef"
  vivify_82:
    set $S84, $P83
    iseq $I85, $S84, "%"
    new $P73, 'Integer'
    set $P73, $I85
  unless_74_end:
    unless $P73, unless_72
    set $P71, $P73
    goto unless_72_end
  unless_72:
    find_lex $P86, "$first_char"
    unless_null $P86, vivify_83
    new $P86, "Undef"
  vivify_83:
    set $S87, $P86
    iseq $I88, $S87, "&"
    new $P71, 'Integer'
    set $P71, $I88
  unless_72_end:
    unless $P71, unless_70
    set $P69, $P71
    goto unless_70_end
  unless_70:
    find_lex $P89, "$first_char"
    unless_null $P89, vivify_84
    new $P89, "Undef"
  vivify_84:
    set $S90, $P89
    iseq $I91, $S90, "_"
    new $P69, 'Integer'
    set $P69, $I91
  unless_70_end:
    if $P69, if_68
    get_hll_global $P96, ["String"], "substr"
    find_lex $P97, "$name"
    unless_null $P97, vivify_85
    new $P97, "Undef"
  vivify_85:
    $S98 = $P96($P97, 0, 6)
    iseq $I99, $S98, "_block"
    unless $I99, if_95_end
    .const 'Sub' $P101 = "20_1256278672.46233" 
    capture_lex $P101
    $P101()
  if_95_end:
    goto if_68_end
  if_68:
    .const 'Sub' $P93 = "19_1256278672.46233" 
    capture_lex $P93
    $P93()
  if_68_end:
    find_lex $P105, "$skip"
    unless_null $P105, vivify_86
    new $P105, "Undef"
  vivify_86:
    unless $P105, unless_104
    set $P103, $P105
    goto unless_104_end
  unless_104:
    .const 'Sub' $P107 = "21_1256278672.46233" 
    capture_lex $P107
    $P112 = $P107()
    set $P103, $P112
  unless_104_end:
    .return ($P103)
.end


.namespace ["Parrot"]
.sub "_block100"  :anon :subid("20_1256278672.46233") :outer("18_1256278672.46233")
    new $P102, "Integer"
    assign $P102, 1
    store_lex "$skip", $P102
    .return ($P102)
.end


.namespace ["Parrot"]
.sub "_block92"  :anon :subid("19_1256278672.46233") :outer("18_1256278672.46233")
    new $P94, "Integer"
    assign $P94, 1
    store_lex "$skip", $P94
    .return ($P94)
.end


.namespace ["Parrot"]
.sub "_block106"  :anon :subid("21_1256278672.46233") :outer("18_1256278672.46233")
    find_lex $P108, "@names"
    unless_null $P108, vivify_87
    new $P108, "ResizablePMCArray"
  vivify_87:
    find_lex $P109, "$_"
    unless_null $P109, vivify_88
    new $P109, "Undef"
  vivify_88:
    set $S110, $P109
    $P111 = $P108."push"($S110)
    .return ($P111)
.end


.namespace ["Parrot"]
.sub "_block49"  :anon :subid("16_1256278672.46233") :outer("14_1256278672.46233")
    find_lex $P51, "$names"
    unless_null $P51, vivify_89
    new $P51, "Undef"
  vivify_89:
    $P52 = $P51."split"(" ")
    store_lex "@names", $P52
    .return ($P52)
.end


.namespace ["Parrot"]
.sub "_block122"  :anon :subid("22_1256278672.46233") :outer("14_1256278672.46233")
    .param pmc param_124
    .const 'Sub' $P135 = "24_1256278672.46233" 
    capture_lex $P135
    .const 'Sub' $P132 = "23_1256278672.46233" 
    capture_lex $P132
    .lex "$_", param_124
    find_lex $P127, "$_"
    unless_null $P127, vivify_92
    new $P127, "Undef"
  vivify_92:
    set $S128, $P127
    find_lex $P129, "$caller_nsp"
    unless_null $P129, vivify_93
    new $P129, "Hash"
  vivify_93:
    set $P130, $P129[$S128]
    unless_null $P130, vivify_94
    new $P130, "Undef"
  vivify_94:
    if $P130, if_126
    .const 'Sub' $P135 = "24_1256278672.46233" 
    capture_lex $P135
    $P140 = $P135()
    set $P125, $P140
    goto if_126_end
  if_126:
    .const 'Sub' $P132 = "23_1256278672.46233" 
    capture_lex $P132
    $P133 = $P132()
    set $P125, $P133
  if_126_end:
    .return ($P125)
.end


.namespace ["Parrot"]
.sub "_block134"  :anon :subid("24_1256278672.46233") :outer("22_1256278672.46233")
    find_lex $P136, "@new_names"
    unless_null $P136, vivify_95
    new $P136, "ResizablePMCArray"
  vivify_95:
    find_lex $P137, "$_"
    unless_null $P137, vivify_96
    new $P137, "Undef"
  vivify_96:
    set $S138, $P137
    $P139 = $P136."push"($S138)
    .return ($P139)
.end


.namespace ["Parrot"]
.sub "_block131"  :anon :subid("23_1256278672.46233") :outer("22_1256278672.46233")
    .return ()
.end


.namespace ["Parrot"]
.sub "call_onload"  :subid("25_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_152
    .const 'Sub' $P158 = "26_1256278672.46233" 
    capture_lex $P158
    new $P151, 'ExceptionHandler'
    set_addr $P151, control_150
    $P151."handle_types"(58)
    push_eh $P151
    .lex "$nsp", param_152
    find_lex $P155, "$nsp"
    unless_null $P155, vivify_100
    new $P155, "Hash"
  vivify_100:
    set $P156, $P155["_ONLOAD"]
    unless_null $P156, vivify_101
    new $P156, "Undef"
  vivify_101:
    .lex "&onload", $P156
    if $P156, if_154
    set $P153, $P156
    goto if_154_end
  if_154:
    .const 'Sub' $P158 = "26_1256278672.46233" 
    capture_lex $P158
    $P161 = $P158()
    set $P153, $P161
  if_154_end:
    .return ($P153)
  control_150:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P162, exception, "payload"
    .return ($P162)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "_block157"  :anon :subid("26_1256278672.46233") :outer("25_1256278672.46233")
    find_lex $P159, "&onload"
    unless_null $P159, vivify_102
    new $P159, "Undef"
  vivify_102:
    $P160 = $P159()
    .return ($P160)
.end


.namespace ["Parrot"]
.sub "caller_namespace"  :subid("27_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_166 :optional
    .param int has_param_166 :opt_flag
    .const 'Sub' $P171 = "28_1256278672.46233" 
    capture_lex $P171
    new $P165, 'ExceptionHandler'
    set_addr $P165, control_164
    $P165."handle_types"(58)
    push_eh $P165
    if has_param_166, optparam_103
    new $P167, "Undef"
    set param_166, $P167
  optparam_103:
    .lex "$index", param_166
    find_lex $P169, "$index"
    unless_null $P169, vivify_104
    new $P169, "Undef"
  vivify_104:
    if $P169, unless_168_end
    .const 'Sub' $P171 = "28_1256278672.46233" 
    capture_lex $P171
    $P171()
  unless_168_end:

		.local pmc key
		key = new 'Key'
		key = 'namespace'
		$P0 = find_lex '$index'
		$S0 = $P0
		$P1 = new 'Key'
		$P1 = $S0
		push key, $P1
		
		$P0 = getinterp
		$P173 = $P0[ key ]
	
    .lex "$nsp", $P173
    new $P174, "Exception"
    set $P174['type'], 58
    find_lex $P175, "$nsp"
    unless_null $P175, vivify_105
    new $P175, "Undef"
  vivify_105:
    setattribute $P174, 'payload', $P175
    throw $P174
    .return ()
  control_164:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P176, exception, "payload"
    .return ($P176)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "_block170"  :anon :subid("28_1256278672.46233") :outer("27_1256278672.46233")
    new $P172, "Integer"
    assign $P172, 1
    store_lex "$index", $P172
    .return ($P172)
.end


.namespace ["Parrot"]
.sub "can"  :subid("29_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_180
    .param pmc param_181
    new $P179, 'ExceptionHandler'
    set_addr $P179, control_178
    $P179."handle_types"(58)
    push_eh $P179
    .lex "$object", param_180
    .lex "$method_name", param_181

		$P0 = find_lex '$object'
		$P1 = find_lex '$method_name'
		$S1 = $P1
		$I0 = can $P0, $S1
		$P182 = box $I0
	
    .lex "$result", $P182
    new $P183, "Exception"
    set $P183['type'], 58
    find_lex $P184, "$result"
    unless_null $P184, vivify_106
    new $P184, "Undef"
  vivify_106:
    setattribute $P183, 'payload', $P184
    throw $P183
    .return ()
  control_178:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P185, exception, "payload"
    .return ($P185)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "clone"  :subid("30_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_189
    new $P188, 'ExceptionHandler'
    set_addr $P188, control_187
    $P188."handle_types"(58)
    push_eh $P188
    .lex "$pmc", param_189

		$P0 = find_lex '$pmc'
		$P190 = clone $P0
	
    .lex "$clone", $P190
    new $P191, "Exception"
    set $P191['type'], 58
    find_lex $P192, "$clone"
    unless_null $P192, vivify_107
    new $P192, "Undef"
  vivify_107:
    setattribute $P191, 'payload', $P192
    throw $P191
    .return ()
  control_187:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P193, exception, "payload"
    .return ($P193)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "compile"  :subid("31_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_197
    new $P196, 'ExceptionHandler'
    set_addr $P196, control_195
    $P196."handle_types"(58)
    push_eh $P196
    .lex "$string", param_197

		.local pmc comp
		comp = compreg 'PIR'
		
		$P0 = find_lex '$string'
		$P198 = comp($P0)
	
    .lex "$result", $P198
    new $P199, "Exception"
    set $P199['type'], 58
    find_lex $P200, "$result"
    unless_null $P200, vivify_108
    new $P200, "Undef"
  vivify_108:
    setattribute $P199, 'payload', $P200
    throw $P199
    .return ()
  control_195:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P201, exception, "payload"
    .return ($P201)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "defined"  :subid("32_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_205 :slurpy
    new $P204, 'ExceptionHandler'
    set_addr $P204, control_203
    $P204."handle_types"(58)
    push_eh $P204
    .lex "@what", param_205

		$P0 = find_lex '@what'
		$I0 = defined $P0[0]
		$P206 = box $I0
	
    .lex "$result", $P206
    new $P207, "Exception"
    set $P207['type'], 58
    find_lex $P208, "$result"
    unless_null $P208, vivify_109
    new $P208, "Undef"
  vivify_109:
    setattribute $P207, 'payload', $P208
    throw $P207
    .return ()
  control_203:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P209, exception, "payload"
    .return ($P209)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "delete"  :subid("33_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_213
    .param pmc param_214
    new $P212, 'ExceptionHandler'
    set_addr $P212, control_211
    $P212."handle_types"(58)
    push_eh $P212
    .lex "$pmc", param_213
    .lex "$key", param_214

		$P0 = find_lex '$pmc'
		$P1 = find_lex '$key'
		$I0 = $P1
		delete $P0[$I0]
	
    new $P215, "Exception"
    set $P215['type'], 58
    find_lex $P216, "$pmc"
    unless_null $P216, vivify_110
    new $P216, "Undef"
  vivify_110:
    setattribute $P215, 'payload', $P216
    throw $P215
    .return ()
  control_211:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P217, exception, "payload"
    .return ($P217)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "die"  :subid("34_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_221
    new $P220, 'ExceptionHandler'
    set_addr $P220, control_219
    $P220."handle_types"(58)
    push_eh $P220
    .lex "$message", param_221

		$P0 = find_lex '$message'
		$S0 = $P0
		die $S0
	
    .return ()
  control_219:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P222, exception, "payload"
    .return ($P222)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "does"  :subid("35_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_226
    .param pmc param_227
    new $P225, 'ExceptionHandler'
    set_addr $P225, control_224
    $P225."handle_types"(58)
    push_eh $P225
    .lex "$object", param_226
    .lex "$role", param_227

		$P0 = find_lex '$object'
		$P1 = find_lex '$role'
		$S1 = $P1
		$I0 = does $P0, $S1
		$P228 = box $I0
	
    .lex "$result", $P228
    new $P229, "Exception"
    set $P229['type'], 58
    find_lex $P230, "$result"
    unless_null $P230, vivify_111
    new $P230, "Undef"
  vivify_111:
    setattribute $P229, 'payload', $P230
    throw $P229
    .return ()
  control_224:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P231, exception, "payload"
    .return ($P231)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "elements"  :subid("36_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_235
    new $P234, 'ExceptionHandler'
    set_addr $P234, control_233
    $P234."handle_types"(58)
    push_eh $P234
    .lex "$item", param_235

		$P0 = find_lex '$item'
		$I0 = elements $P0
		$P236 = box $I0
	
    .lex "$result", $P236
    new $P237, "Exception"
    set $P237['type'], 58
    find_lex $P238, "$result"
    unless_null $P238, vivify_112
    new $P238, "Undef"
  vivify_112:
    setattribute $P237, 'payload', $P238
    throw $P237
    .return ()
  control_233:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P239, exception, "payload"
    .return ($P239)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "get_address_of"  :subid("37_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_243
    new $P242, 'ExceptionHandler'
    set_addr $P242, control_241
    $P242."handle_types"(58)
    push_eh $P242
    .lex "$what", param_243

		$P0 = find_lex '$what'
		if null $P0 goto null_object
		$I0 = get_addr $P0
		goto done
	null_object:
		$I0 = 0
	done:
		$P244 = box $I0
	
    .lex "$address", $P244
    new $P245, "Exception"
    set $P245['type'], 58
    find_lex $P246, "$address"
    unless_null $P246, vivify_113
    new $P246, "Undef"
  vivify_113:
    setattribute $P245, 'payload', $P246
    throw $P245
    .return ()
  control_241:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P247, exception, "payload"
    .return ($P247)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "get_attribute"  :subid("38_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_251
    .param pmc param_252
    new $P250, 'ExceptionHandler'
    set_addr $P250, control_249
    $P250."handle_types"(58)
    push_eh $P250
    .lex "$pmc", param_251
    .lex "$attribute_name", param_252

		$P0 = find_lex '$pmc'
		$P1 = find_lex '$attribute_name'
		$S0 = $P1
		$P253 = getattribute $P0, $S0
	
    .lex "$result", $P253
    new $P254, "Exception"
    set $P254['type'], 58
    find_lex $P255, "$result"
    unless_null $P255, vivify_114
    new $P255, "Undef"
  vivify_114:
    setattribute $P254, 'payload', $P255
    throw $P254
    .return ()
  control_249:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P256, exception, "payload"
    .return ($P256)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "get_class"  :subid("39_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_260
    new $P259, 'ExceptionHandler'
    set_addr $P259, control_258
    $P259."handle_types"(58)
    push_eh $P259
    .lex "$pmc", param_260

		$P0 = find_lex '$pmc'
		$P261 = get_class $P0
	
    .lex "$result", $P261
    new $P262, "Exception"
    set $P262['type'], 58
    find_lex $P263, "$result"
    unless_null $P263, vivify_115
    new $P263, "Undef"
  vivify_115:
    setattribute $P262, 'payload', $P263
    throw $P262
    .return ()
  control_258:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P264, exception, "payload"
    .return ($P264)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "get_compiler"  :subid("40_1256278672.46233") :outer("11_1256278672.46233")
    .const 'Sub' $P271 = "41_1256278672.46233" 
    capture_lex $P271
    new $P267, 'ExceptionHandler'
    set_addr $P267, control_266
    $P267."handle_types"(58)
    push_eh $P267
    get_global $P269, "$Parrot_compiler"
    unless_null $P269, vivify_116
    new $P269, "Undef"
  vivify_116:
    if $P269, unless_268_end
    .const 'Sub' $P271 = "41_1256278672.46233" 
    capture_lex $P271
    $P271()
  unless_268_end:
    new $P273, "Exception"
    set $P273['type'], 58
    get_global $P274, "$Parrot_compiler"
    unless_null $P274, vivify_117
    new $P274, "Undef"
  vivify_117:
    setattribute $P273, 'payload', $P274
    throw $P273
    .return ()
  control_266:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P275, exception, "payload"
    .return ($P275)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "_block270"  :anon :subid("41_1256278672.46233") :outer("40_1256278672.46233")

			load_language 'parrot'
			$P272 = compreg 'parrot'
		
    set_global "$Parrot_compiler", $P272
    .return ($P272)
.end


.namespace ["Parrot"]
.sub "get_integer"  :subid("42_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_279
    new $P278, 'ExceptionHandler'
    set_addr $P278, control_277
    $P278."handle_types"(58)
    push_eh $P278
    .lex "$pmc", param_279

		$P0 = find_lex '$pmc'
		$I0 = $P0
		$P280 = box $I0
	
    .lex "$result", $P280
    new $P281, "Exception"
    set $P281['type'], 58
    find_lex $P282, "$result"
    unless_null $P282, vivify_118
    new $P282, "Undef"
  vivify_118:
    setattribute $P281, 'payload', $P282
    throw $P281
    .return ()
  control_277:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P283, exception, "payload"
    .return ($P283)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "get_interpreter"  :subid("43_1256278672.46233") :outer("11_1256278672.46233")
    .const 'Sub' $P290 = "44_1256278672.46233" 
    capture_lex $P290
    new $P286, 'ExceptionHandler'
    set_addr $P286, control_285
    $P286."handle_types"(58)
    push_eh $P286
    get_global $P288, "$Parrot_interpreter"
    unless_null $P288, vivify_119
    new $P288, "Undef"
  vivify_119:
    if $P288, unless_287_end
    .const 'Sub' $P290 = "44_1256278672.46233" 
    capture_lex $P290
    $P290()
  unless_287_end:
    new $P292, "Exception"
    set $P292['type'], 58
    get_global $P293, "$Parrot_interpreter"
    unless_null $P293, vivify_120
    new $P293, "Undef"
  vivify_120:
    setattribute $P292, 'payload', $P293
    throw $P292
    .return ()
  control_285:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P294, exception, "payload"
    .return ($P294)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "_block289"  :anon :subid("44_1256278672.46233") :outer("43_1256278672.46233")

			$P291 = getinterp
		
    set_global "$Parrot_interpreter", $P291
    .return ($P291)
.end


.namespace ["Parrot"]
.sub "get_namespace"  :subid("45_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_298
    new $P297, 'ExceptionHandler'
    set_addr $P297, control_296
    $P297."handle_types"(58)
    push_eh $P297
    .lex "$name", param_298
    find_lex $P299, "$name"
    unless_null $P299, vivify_121
    new $P299, "Undef"
  vivify_121:
    $P300 = $P299."split"("::")
    .lex "@namespace", $P300
    find_lex $P301, "@namespace"
    unless_null $P301, vivify_122
    new $P301, "ResizablePMCArray"
  vivify_122:
    $P302 = "get_hll_namespace"($P301)
    .lex "$namespace", $P302
    new $P303, "Exception"
    set $P303['type'], 58
    find_lex $P304, "$namespace"
    unless_null $P304, vivify_123
    new $P304, "Undef"
  vivify_123:
    setattribute $P303, 'payload', $P304
    throw $P303
    .return ()
  control_296:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P305, exception, "payload"
    .return ($P305)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "get_hll_global"  :subid("46_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_309
    new $P308, 'ExceptionHandler'
    set_addr $P308, control_307
    $P308."handle_types"(58)
    push_eh $P308
    .lex "$path", param_309
    find_lex $P310, "$path"
    unless_null $P310, vivify_124
    new $P310, "Undef"
  vivify_124:
    $P311 = $P310."split"("::")
    .lex "@parts", $P311
    find_lex $P312, "@parts"
    unless_null $P312, vivify_125
    new $P312, "ResizablePMCArray"
  vivify_125:
    $P313 = $P312."pop"()
    .lex "$name", $P313

		$P0 = find_lex '@parts'
		$P1 = find_lex '$name'
		$S1 = $P1
		$P314 = get_hll_global [$P0], $S1
	
    .lex "$result", $P314
    new $P315, "Exception"
    set $P315['type'], 58
    find_lex $P316, "$result"
    unless_null $P316, vivify_126
    new $P316, "Undef"
  vivify_126:
    setattribute $P315, 'payload', $P316
    throw $P315
    .return ()
  control_307:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P317, exception, "payload"
    .return ($P317)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "get_hll_namespace"  :subid("47_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_321
    new $P320, 'ExceptionHandler'
    set_addr $P320, control_319
    $P320."handle_types"(58)
    push_eh $P320
    .lex "@parts", param_321

		$P0 = find_lex '@parts'
		$P322 = get_hll_namespace $P0
	
    .lex "$namespace", $P322
    new $P323, "Exception"
    set $P323['type'], 58
    find_lex $P324, "$namespace"
    unless_null $P324, vivify_127
    new $P324, "Undef"
  vivify_127:
    setattribute $P323, 'payload', $P324
    throw $P323
    .return ()
  control_319:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P325, exception, "payload"
    .return ($P325)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "get_sub"  :subid("48_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_329
    .const 'Sub' $P340 = "49_1256278672.46233" 
    capture_lex $P340
    new $P328, 'ExceptionHandler'
    set_addr $P328, control_327
    $P328."handle_types"(58)
    push_eh $P328
    .lex "$path", param_329
    find_lex $P330, "$path"
    unless_null $P330, vivify_128
    new $P330, "Undef"
  vivify_128:
    $P331 = $P330."split"("::")
    .lex "@parts", $P331
    find_lex $P332, "@parts"
    unless_null $P332, vivify_129
    new $P332, "ResizablePMCArray"
  vivify_129:
    $P333 = $P332."pop"()
    .lex "$name", $P333
    find_lex $P334, "@parts"
    unless_null $P334, vivify_130
    new $P334, "ResizablePMCArray"
  vivify_130:
    $P335 = "get_hll_namespace"($P334)
    .lex "$namespace", $P335
    new $P336, "Undef"
    .lex "$sub", $P336
    find_lex $P338, "$namespace"
    unless_null $P338, vivify_131
    new $P338, "Undef"
  vivify_131:
    unless $P338, if_337_end
    .const 'Sub' $P340 = "49_1256278672.46233" 
    capture_lex $P340
    $P340()
  if_337_end:
    new $P344, "Exception"
    set $P344['type'], 58
    find_lex $P345, "$sub"
    unless_null $P345, vivify_134
    new $P345, "Undef"
  vivify_134:
    setattribute $P344, 'payload', $P345
    throw $P344
    .return ()
  control_327:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P346, exception, "payload"
    .return ($P346)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "_block339"  :anon :subid("49_1256278672.46233") :outer("48_1256278672.46233")
    find_lex $P341, "$namespace"
    unless_null $P341, vivify_132
    new $P341, "Undef"
  vivify_132:
    find_lex $P342, "$name"
    unless_null $P342, vivify_133
    new $P342, "Undef"
  vivify_133:
    $P343 = $P341."find_sub"($P342)
    store_lex "$sub", $P343
    .return ($P343)
.end


.namespace ["Parrot"]
.sub "inspect"  :subid("50_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_350
    .param pmc param_351
    new $P349, 'ExceptionHandler'
    set_addr $P349, control_348
    $P349."handle_types"(58)
    push_eh $P349
    .lex "$pmc", param_350
    .lex "$key", param_351

		$P0 = find_lex '$pmc'
		$P1 = find_lex '$key'
		$S1 = $P1
		$P352 = inspect $P0, $S1
	
    .lex "$result", $P352
    new $P353, "Exception"
    set $P353['type'], 58
    find_lex $P354, "$result"
    unless_null $P354, vivify_135
    new $P354, "Undef"
  vivify_135:
    setattribute $P353, 'payload', $P354
    throw $P353
    .return ()
  control_348:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P355, exception, "payload"
    .return ($P355)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "is_null"  :subid("51_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_359 :slurpy
    .const 'Sub' $P365 = "52_1256278672.46233" 
    capture_lex $P365
    new $P358, 'ExceptionHandler'
    set_addr $P358, control_357
    $P358."handle_types"(58)
    push_eh $P358
    .lex "@what", param_359
    new $P360, "Integer"
    assign $P360, 0
    .lex "$result", $P360
    find_lex $P362, "@what"
    unless_null $P362, vivify_136
    new $P362, "ResizablePMCArray"
  vivify_136:
    set $N363, $P362
    unless $N363, if_361_end
    .const 'Sub' $P365 = "52_1256278672.46233" 
    capture_lex $P365
    $P365()
  if_361_end:
    new $P367, "Exception"
    set $P367['type'], 58
    find_lex $P368, "$result"
    unless_null $P368, vivify_137
    new $P368, "Undef"
  vivify_137:
    setattribute $P367, 'payload', $P368
    throw $P367
    .return ()
  control_357:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P369, exception, "payload"
    .return ($P369)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "_block364"  :anon :subid("52_1256278672.46233") :outer("51_1256278672.46233")

			$P0 = find_lex '@what'
			$P1 = shift $P0
			$I0 = isnull $P1
			$P366 = box $I0
		
    store_lex "$result", $P366
    .return ($P366)
.end


.namespace ["Parrot"]
.sub "isa"  :subid("53_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_373
    .param pmc param_374
    new $P372, 'ExceptionHandler'
    set_addr $P372, control_371
    $P372."handle_types"(58)
    push_eh $P372
    .lex "$pmc", param_373
    .lex "$class", param_374

		$P0 = find_lex '$pmc'
		$P1 = find_lex '$class'
		$S1 = $P1
		$I0 = isa $P0, $S1
		$P375 = box $I0
	
    .lex "$result", $P375
    new $P376, "Exception"
    set $P376['type'], 58
    find_lex $P377, "$result"
    unless_null $P377, vivify_138
    new $P377, "Undef"
  vivify_138:
    setattribute $P376, 'payload', $P377
    throw $P376
    .return ()
  control_371:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P378, exception, "payload"
    .return ($P378)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "iseq"  :subid("54_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_382
    .param pmc param_383
    new $P381, 'ExceptionHandler'
    set_addr $P381, control_380
    $P381."handle_types"(58)
    push_eh $P381
    .lex "$a", param_382
    .lex "$b", param_383

		$P0 = find_lex '$a'
		$P1 = find_lex '$b'
		$I0 = iseq $P0, $P1
		$P384 = box $I0
	
    .lex "$result", $P384
    new $P385, "Exception"
    set $P385['type'], 58
    find_lex $P386, "$result"
    unless_null $P386, vivify_139
    new $P386, "Undef"
  vivify_139:
    setattribute $P385, 'payload', $P386
    throw $P385
    .return ()
  control_380:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P387, exception, "payload"
    .return ($P387)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "join"  :subid("55_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_391
    .param pmc param_392
    new $P390, 'ExceptionHandler'
    set_addr $P390, control_389
    $P390."handle_types"(58)
    push_eh $P390
    .lex "$pmc", param_391
    .lex "$delim", param_392

		.local pmc aggregate
		aggregate = find_lex '$pmc'
		
		.local string delim
		$P0 = find_lex '$delim'
		delim = $P0
		
		$S0 = join delim, aggregate
		$P393 = box $S0
	
    .lex "$result", $P393
    new $P394, "Exception"
    set $P394['type'], 58
    find_lex $P395, "$result"
    unless_null $P395, vivify_140
    new $P395, "Undef"
  vivify_140:
    setattribute $P394, 'payload', $P395
    throw $P394
    .return ()
  control_389:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P396, exception, "payload"
    .return ($P396)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "load_bytecode"  :subid("56_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_400
    new $P399, 'ExceptionHandler'
    set_addr $P399, control_398
    $P399."handle_types"(58)
    push_eh $P399
    .lex "$file", param_400

		$P0 = find_lex '$file'
		$S0 = $P0
		load_bytecode $S0
	
    .return ()
  control_398:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P401, exception, "payload"
    .return ($P401)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "new_pmc"  :subid("57_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_405
    new $P404, 'ExceptionHandler'
    set_addr $P404, control_403
    $P404."handle_types"(58)
    push_eh $P404
    .lex "$type", param_405

		$P0 = find_lex '$type'
		$P406 = new $P0
	
    .lex "$result", $P406
    new $P407, "Exception"
    set $P407['type'], 58
    find_lex $P408, "$result"
    unless_null $P408, vivify_141
    new $P408, "Undef"
  vivify_141:
    setattribute $P407, 'payload', $P408
    throw $P407
    .return ()
  control_403:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P409, exception, "payload"
    .return ($P409)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "set_integer"  :subid("58_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_413
    .param pmc param_414
    new $P412, 'ExceptionHandler'
    set_addr $P412, control_411
    $P412."handle_types"(58)
    push_eh $P412
    .lex "$pmc", param_413
    .lex "$int", param_414

		$P0 = find_lex '$pmc'
		$P1 = find_lex '$int'
		$I1 = $P1
		$P0 = $I1
	
    new $P415, "Exception"
    set $P415['type'], 58
    find_lex $P416, "$pmc"
    unless_null $P416, vivify_142
    new $P416, "Undef"
  vivify_142:
    setattribute $P415, 'payload', $P416
    throw $P415
    .return ()
  control_411:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P417, exception, "payload"
    .return ($P417)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "trace"  :subid("59_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_421
    new $P420, 'ExceptionHandler'
    set_addr $P420, control_419
    $P420."handle_types"(58)
    push_eh $P420
    .lex "$value", param_421

		$P0 = find_lex '$value'
		$I0 = $P0
		trace $I0
	
    .return ()
  control_419:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P422, exception, "payload"
    .return ($P422)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "typeof"  :subid("60_1256278672.46233") :outer("11_1256278672.46233")
    .param pmc param_426
    new $P425, 'ExceptionHandler'
    set_addr $P425, control_424
    $P425."handle_types"(58)
    push_eh $P425
    .lex "$pmc", param_426

		$P0 = find_lex '$pmc'
		$S0 = typeof $P0
		$P427 = box $S0
	
    .lex "$result", $P427
    new $P428, "Exception"
    set $P428['type'], 58
    find_lex $P429, "$result"
    unless_null $P429, vivify_143
    new $P429, "Undef"
  vivify_143:
    setattribute $P428, 'payload', $P429
    throw $P428
    .return ()
  control_424:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P430, exception, "payload"
    .return ($P430)
    rethrow exception
.end


.namespace ["Parrot";"Globals"]
.sub "_block431" :init :load :subid("61_1256278672.46233")
    .const 'Sub' $P456 = "65_1256278672.46233" 
    capture_lex $P456
    .const 'Sub' $P445 = "64_1256278672.46233" 
    capture_lex $P445
    .const 'Sub' $P434 = "62_1256278672.46233" 
    capture_lex $P434
    get_global $P433, "%_Global_index"
    unless_null $P433, vivify_144
    new $P433, "Hash"
  vivify_144:
    "_ONLOAD"()
    .const 'Sub' $P456 = "65_1256278672.46233" 
    capture_lex $P456
    .return ($P456)
.end


.namespace ["Parrot";"Globals"]
.sub "_ONLOAD"  :subid("62_1256278672.46233") :outer("61_1256278672.46233")
    .const 'Sub' $P440 = "63_1256278672.46233" 
    capture_lex $P440
    new $P436, 'ExceptionHandler'
    set_addr $P436, control_435
    $P436."handle_types"(58)
    push_eh $P436
    get_global $P438, "$onload_done"
    unless_null $P438, vivify_145
    new $P438, "Undef"
  vivify_145:
    unless $P438, if_437_end
    .const 'Sub' $P440 = "63_1256278672.46233" 
    capture_lex $P440
    $P440()
  if_437_end:
    new $P443, "Integer"
    assign $P443, 1
    set_global "$onload_done", $P443

			.include 'iglobals.pasm' 
			
			$P0 = new 'Hash'
			
			$P1 = box .IGLOBALS_CLASSNAME_HASH
			$P0['IGLOBALS_CLASSNAME_HASH'] = $P1
			
			$P1 = box .IGLOBALS_COMPREG_HASH
			$P0['IGLOBALS_COMPREG_HASH'] = $P1
			
			$P1 = box .IGLOBALS_ARGV_LIST
			$P0['IGLOBALS_ARGV_LIST'] = $P1
			
			$P1 = box .IGLOBALS_NCI_FUNCS
			$P0['IGLOBALS_NCI_FUNCS'] = $P1
			
			$P1 = box .IGLOBALS_INTERPRETER
			$P0['IGLOBALS_INTERPRETER'] = $P1
			
			$P1 = box .IGLOBALS_DYN_LIBS
			$P0['IGLOBALS_DYN_LIBS'] = $P1
			
			$P1 = box .IGLOBALS_CONFIG_HASH
			$P0['IGLOBALS_CONFIG_HASH'] = $P1
			
			$P1 = box .IGLOBALS_LIB_PATHS
			$P0['IGLOBALS_LIB_PATHS'] = $P1
			
			$P1 = box .IGLOBALS_PBC_LIBS
			$P0['IGLOBALS_PBC_LIBS'] = $P1
			
			$P1 = box .IGLOBALS_EXECUTABLE
			$P0['IGLOBALS_EXECUTABLE'] = $P1
			
			$P1 = box .IGLOBALS_SIZE
			$P0['IGLOBALS_SIZE'] = $P1
			
			set_global '%_Global_index', $P0
		
    .return ()
  control_435:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P444, exception, "payload"
    .return ($P444)
    rethrow exception
.end


.namespace ["Parrot";"Globals"]
.sub "_block439"  :anon :subid("63_1256278672.46233") :outer("62_1256278672.46233")
    new $P441, "Exception"
    set $P441['type'], 58
    new $P442, "Integer"
    assign $P442, 0
    setattribute $P441, 'payload', $P442
    throw $P441
    .return ()
.end


.namespace ["Parrot";"Globals"]
.sub "_fetch"  :subid("64_1256278672.46233") :outer("61_1256278672.46233")
    .param pmc param_448
    new $P447, 'ExceptionHandler'
    set_addr $P447, control_446
    $P447."handle_types"(58)
    push_eh $P447
    .lex "$key", param_448
    new $P449, "Exception"
    set $P449['type'], 58
    find_lex $P450, "$key"
    unless_null $P450, vivify_146
    new $P450, "Undef"
  vivify_146:
    set $I451, $P450
    get_hll_global $P452, ["Parrot"], "_get_interpreter"
    $P453 = $P452()
    set $P454, $P453[$I451]
    unless_null $P454, vivify_147
    new $P454, "Undef"
  vivify_147:
    setattribute $P449, 'payload', $P454
    throw $P449
    .return ()
  control_446:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P455, exception, "payload"
    .return ($P455)
    rethrow exception
.end


.namespace ["Parrot";"Globals"]
.sub "get_global"  :subid("65_1256278672.46233") :outer("61_1256278672.46233")
    .param pmc param_459
    new $P458, 'ExceptionHandler'
    set_addr $P458, control_457
    $P458."handle_types"(58)
    push_eh $P458
    .lex "$key", param_459
    new $P460, "Exception"
    set $P460['type'], 58
    find_lex $P461, "$key"
    unless_null $P461, vivify_148
    new $P461, "Undef"
  vivify_148:
    get_global $P462, "%_Global_index"
    unless_null $P462, vivify_149
    new $P462, "Hash"
  vivify_149:
    set $P463, $P462[$P461]
    unless_null $P463, vivify_150
    new $P463, "Undef"
  vivify_150:
    $P464 = "_fetch"($P463)
    setattribute $P460, 'payload', $P464
    throw $P460
    .return ()
  control_457:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P465, exception, "payload"
    .return ($P465)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256214681.88244")
    get_hll_global $P14, ["Registry"], "_block13" 
    .return ($P14)
.end


.namespace ["Registry"]
.sub "_block13" :init :load :subid("11_1256214681.88244")
    .const 'Sub' $P15 = "12_1256214681.88244" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P15 = "12_1256214681.88244" 
    capture_lex $P15
    .return ($P15)
.end


.namespace ["Registry"]
.sub "_ONLOAD"  :subid("12_1256214681.88244") :outer("11_1256214681.88244")
    .const 'Sub' $P21 = "13_1256214681.88244" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_14
    new $P19, "Undef"
  vivify_14:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256214681.88244" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Hash"], "new"
    $P26 = $P25()
    set_hll_global "Registry", $P26
    .return ($P26)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P27, exception, "payload"
    .return ($P27)
    rethrow exception
.end


.namespace ["Registry"]
.sub "_block20"  :anon :subid("13_1256214681.88244") :outer("12_1256214681.88244")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256278910.60593")
    get_hll_global $P14, ["ResizablePMCArray"], "_block13" 
    .return ($P14)
.end


.namespace ["ResizablePMCArray"]
.sub "_block13" :init :load :subid("11_1256278910.60593")
    .const 'Sub' $P65 = "17_1256278910.60593" 
    capture_lex $P65
    .const 'Sub' $P49 = "16_1256278910.60593" 
    capture_lex $P49
    .const 'Sub' $P40 = "15_1256278910.60593" 
    capture_lex $P40
    .const 'Sub' $P31 = "14_1256278910.60593" 
    capture_lex $P31
    .const 'Sub' $P22 = "13_1256278910.60593" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1256278910.60593" 
    capture_lex $P15
    .const 'Sub' $P65 = "17_1256278910.60593" 
    capture_lex $P65
    .return ($P65)
.end


.namespace ["ResizablePMCArray"]
.sub "clone"  :subid("12_1256278910.60593") :method :outer("11_1256278910.60593")
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
    get_hll_global $P18, ["Parrot"], "clone"
    find_lex $P19, "self"
    $P20 = $P18($P19)
    .return ($P20)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P21, exception, "payload"
    .return ($P21)
    rethrow exception
.end


.namespace ["ResizablePMCArray"]
.sub "contains"  :subid("13_1256278910.60593") :method :outer("11_1256278910.60593")
    .param pmc param_25
    new $P24, 'ExceptionHandler'
    set_addr $P24, control_23
    $P24."handle_types"(58)
    push_eh $P24
    .lex "self", self
    .lex "$what", param_25
    get_hll_global $P26, ["Array"], "contains"
    find_lex $P27, "self"
    find_lex $P28, "$what"
    unless_null $P28, vivify_18
    new $P28, "Undef"
  vivify_18:
    $P29 = $P26($P27, $P28)
    .return ($P29)
  control_23:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P30, exception, "payload"
    .return ($P30)
    rethrow exception
.end


.namespace ["ResizablePMCArray"]
.sub "delete"  :subid("14_1256278910.60593") :method :outer("11_1256278910.60593")
    .param pmc param_34
    new $P33, 'ExceptionHandler'
    set_addr $P33, control_32
    $P33."handle_types"(58)
    push_eh $P33
    .lex "self", self
    .lex "$key", param_34
    get_hll_global $P35, ["Parrot"], "delete"
    find_lex $P36, "self"
    find_lex $P37, "$key"
    unless_null $P37, vivify_19
    new $P37, "Undef"
  vivify_19:
    $P38 = $P35($P36, $P37)
    .return ($P38)
  control_32:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P39, exception, "payload"
    .return ($P39)
    rethrow exception
.end


.namespace ["ResizablePMCArray"]
.sub "elements"  :subid("15_1256278910.60593") :method :outer("11_1256278910.60593")
    .param pmc param_43 :slurpy
    new $P42, 'ExceptionHandler'
    set_addr $P42, control_41
    $P42."handle_types"(58)
    push_eh $P42
    .lex "self", self
    .lex "@value", param_43
    get_hll_global $P44, ["Array"], "elements_"
    find_lex $P45, "self"
    find_lex $P46, "@value"
    unless_null $P46, vivify_20
    new $P46, "ResizablePMCArray"
  vivify_20:
    $P47 = $P44($P45, $P46)
    .return ($P47)
  control_41:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P48, exception, "payload"
    .return ($P48)
    rethrow exception
.end


.namespace ["ResizablePMCArray"]
.sub "join"  :subid("16_1256278910.60593") :method :outer("11_1256278910.60593")
    .param pmc param_52 :slurpy
    new $P51, 'ExceptionHandler'
    set_addr $P51, control_50
    $P51."handle_types"(58)
    push_eh $P51
    .lex "self", self
    .lex "@delim", param_52
    new $P53, "Exception"
    set $P53['type'], 58
    get_hll_global $P54, ["Parrot"], "join"
    find_lex $P55, "self"
    find_lex $P58, "@delim"
    unless_null $P58, vivify_21
    new $P58, "ResizablePMCArray"
  vivify_21:
    set $N59, $P58
    if $N59, if_57
    new $P62, "String"
    assign $P62, ""
    set $P56, $P62
    goto if_57_end
  if_57:
    find_lex $P60, "@delim"
    unless_null $P60, vivify_22
    new $P60, "ResizablePMCArray"
  vivify_22:
    $P61 = $P60."shift"()
    set $P56, $P61
  if_57_end:
    $P63 = $P54($P55, $P56)
    setattribute $P53, 'payload', $P63
    throw $P53
    .return ()
  control_50:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P64, exception, "payload"
    .return ($P64)
    rethrow exception
.end


.namespace ["ResizablePMCArray"]
.sub "new"  :subid("17_1256278910.60593") :outer("11_1256278910.60593")
    .param pmc param_68 :slurpy
    new $P67, 'ExceptionHandler'
    set_addr $P67, control_66
    $P67."handle_types"(58)
    push_eh $P67
    .lex "@contents", param_68
    new $P69, "Exception"
    set $P69['type'], 58
    find_lex $P72, "@contents"
    unless_null $P72, vivify_23
    new $P72, "ResizablePMCArray"
  vivify_23:
    set $N73, $P72
    if $N73, if_71
    get_hll_global $P75, ["Parrot"], "new_pmc"
    $P76 = $P75("ResizablePMCArray")
    set $P70, $P76
    goto if_71_end
  if_71:
    find_lex $P74, "@contents"
    unless_null $P74, vivify_24
    new $P74, "ResizablePMCArray"
  vivify_24:
    set $P70, $P74
  if_71_end:
    setattribute $P69, 'payload', $P70
    throw $P69
    .return ()
  control_66:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P77, exception, "payload"
    .return ($P77)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256278911.57594")
    get_hll_global $P14, ["ResizableStringArray"], "_block13" 
    .return ($P14)
.end


.namespace ["ResizableStringArray"]
.sub "_block13" :init :load :subid("11_1256278911.57594")
    .const 'Sub' $P81 = "19_1256278911.57594" 
    capture_lex $P81
    .const 'Sub' $P68 = "18_1256278911.57594" 
    capture_lex $P68
    .const 'Sub' $P59 = "17_1256278911.57594" 
    capture_lex $P59
    .const 'Sub' $P50 = "16_1256278911.57594" 
    capture_lex $P50
    .const 'Sub' $P41 = "15_1256278911.57594" 
    capture_lex $P41
    .const 'Sub' $P34 = "14_1256278911.57594" 
    capture_lex $P34
    .const 'Sub' $P15 = "12_1256278911.57594" 
    capture_lex $P15
    .const 'Sub' $P81 = "19_1256278911.57594" 
    capture_lex $P81
    .return ($P81)
.end


.namespace ["ResizableStringArray"]
.sub "append"  :subid("12_1256278911.57594") :method :outer("11_1256278911.57594")
    .param pmc param_18
    .const 'Sub' $P24 = "13_1256278911.57594" 
    capture_lex $P24
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
    .lex "@other", param_18
    find_lex $P20, "@other"
    unless_null $P20, vivify_21
    new $P20, "ResizablePMCArray"
  vivify_21:
    defined $I21, $P20
    unless $I21, for_undef_22
    iter $P19, $P20
    new $P31, 'ExceptionHandler'
    set_addr $P31, loop30_handler
    $P31."handle_types"(65, 67, 66)
    push_eh $P31
  loop30_test:
    unless $P19, loop30_done
    shift $P22, $P19
  loop30_redo:
    .const 'Sub' $P24 = "13_1256278911.57594" 
    capture_lex $P24
    $P24($P22)
  loop30_next:
    goto loop30_test
  loop30_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P32, exception, 'type'
    eq $P32, 65, loop30_next
    eq $P32, 67, loop30_redo
  loop30_done:
    pop_eh 
  for_undef_22:
    .return ($P19)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P33, exception, "payload"
    .return ($P33)
    rethrow exception
.end


.namespace ["ResizableStringArray"]
.sub "_block23"  :anon :subid("13_1256278911.57594") :outer("12_1256278911.57594")
    .param pmc param_25
    .lex "$_", param_25
    find_lex $P26, "self"
    find_lex $P27, "$_"
    unless_null $P27, vivify_23
    new $P27, "Undef"
  vivify_23:
    set $S28, $P27
    $P29 = $P26."push"($S28)
    .return ($P29)
.end


.namespace ["ResizableStringArray"]
.sub "clone"  :subid("14_1256278911.57594") :method :outer("11_1256278911.57594")
    new $P36, 'ExceptionHandler'
    set_addr $P36, control_35
    $P36."handle_types"(58)
    push_eh $P36
    .lex "self", self
    get_hll_global $P37, ["Parrot"], "clone"
    find_lex $P38, "self"
    $P39 = $P37($P38)
    .return ($P39)
  control_35:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P40, exception, "payload"
    .return ($P40)
    rethrow exception
.end


.namespace ["ResizableStringArray"]
.sub "contains"  :subid("15_1256278911.57594") :method :outer("11_1256278911.57594")
    .param pmc param_44
    new $P43, 'ExceptionHandler'
    set_addr $P43, control_42
    $P43."handle_types"(58)
    push_eh $P43
    .lex "self", self
    .lex "$what", param_44
    get_hll_global $P45, ["Array"], "contains"
    find_lex $P46, "self"
    find_lex $P47, "$what"
    unless_null $P47, vivify_24
    new $P47, "Undef"
  vivify_24:
    $P48 = $P45($P46, $P47)
    .return ($P48)
  control_42:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P49, exception, "payload"
    .return ($P49)
    rethrow exception
.end


.namespace ["ResizableStringArray"]
.sub "delete"  :subid("16_1256278911.57594") :method :outer("11_1256278911.57594")
    .param pmc param_53
    new $P52, 'ExceptionHandler'
    set_addr $P52, control_51
    $P52."handle_types"(58)
    push_eh $P52
    .lex "self", self
    .lex "$key", param_53
    get_hll_global $P54, ["Parrot"], "delete"
    find_lex $P55, "self"
    find_lex $P56, "$key"
    unless_null $P56, vivify_25
    new $P56, "Undef"
  vivify_25:
    $P57 = $P54($P55, $P56)
    .return ($P57)
  control_51:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P58, exception, "payload"
    .return ($P58)
    rethrow exception
.end


.namespace ["ResizableStringArray"]
.sub "elements"  :subid("17_1256278911.57594") :method :outer("11_1256278911.57594")
    .param pmc param_62 :slurpy
    new $P61, 'ExceptionHandler'
    set_addr $P61, control_60
    $P61."handle_types"(58)
    push_eh $P61
    .lex "self", self
    .lex "@value", param_62
    get_hll_global $P63, ["Array"], "elements_"
    find_lex $P64, "self"
    find_lex $P65, "@value"
    unless_null $P65, vivify_26
    new $P65, "ResizablePMCArray"
  vivify_26:
    $P66 = $P63($P64, $P65)
    .return ($P66)
  control_60:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P67, exception, "payload"
    .return ($P67)
    rethrow exception
.end


.namespace ["ResizableStringArray"]
.sub "join"  :subid("18_1256278911.57594") :method :outer("11_1256278911.57594")
    .param pmc param_71 :slurpy
    new $P70, 'ExceptionHandler'
    set_addr $P70, control_69
    $P70."handle_types"(58)
    push_eh $P70
    .lex "self", self
    .lex "@delim", param_71
    find_lex $P72, "@delim"
    unless_null $P72, vivify_27
    new $P72, "ResizablePMCArray"
  vivify_27:
    $P72."push"("")
    find_lex $P73, "@delim"
    unless_null $P73, vivify_28
    new $P73, "ResizablePMCArray"
  vivify_28:
    $P74 = $P73."shift"()
    .lex "$delim", $P74
    new $P75, "Exception"
    set $P75['type'], 58
    get_hll_global $P76, ["Parrot"], "join"
    find_lex $P77, "self"
    find_lex $P78, "$delim"
    unless_null $P78, vivify_29
    new $P78, "Undef"
  vivify_29:
    $P79 = $P76($P77, $P78)
    setattribute $P75, 'payload', $P79
    throw $P75
    .return ()
  control_69:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P80, exception, "payload"
    .return ($P80)
    rethrow exception
.end


.namespace ["ResizableStringArray"]
.sub "new"  :subid("19_1256278911.57594") :outer("11_1256278911.57594")
    .param pmc param_84 :slurpy
    .const 'Sub' $P92 = "20_1256278911.57594" 
    capture_lex $P92
    new $P83, 'ExceptionHandler'
    set_addr $P83, control_82
    $P83."handle_types"(58)
    push_eh $P83
    .lex "@contents", param_84
    get_hll_global $P85, ["Parrot"], "new_pmc"
    $P86 = $P85("ResizableStringArray")
    .lex "@array", $P86
    find_lex $P88, "@contents"
    unless_null $P88, vivify_30
    new $P88, "ResizablePMCArray"
  vivify_30:
    defined $I89, $P88
    unless $I89, for_undef_31
    iter $P87, $P88
    new $P99, 'ExceptionHandler'
    set_addr $P99, loop98_handler
    $P99."handle_types"(65, 67, 66)
    push_eh $P99
  loop98_test:
    unless $P87, loop98_done
    shift $P90, $P87
  loop98_redo:
    .const 'Sub' $P92 = "20_1256278911.57594" 
    capture_lex $P92
    $P92($P90)
  loop98_next:
    goto loop98_test
  loop98_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, 'type'
    eq $P100, 65, loop98_next
    eq $P100, 67, loop98_redo
  loop98_done:
    pop_eh 
  for_undef_31:
    new $P101, "Exception"
    set $P101['type'], 58
    find_lex $P102, "@array"
    unless_null $P102, vivify_34
    new $P102, "ResizablePMCArray"
  vivify_34:
    setattribute $P101, 'payload', $P102
    throw $P101
    .return ()
  control_82:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
    rethrow exception
.end


.namespace ["ResizableStringArray"]
.sub "_block91"  :anon :subid("20_1256278911.57594") :outer("19_1256278911.57594")
    .param pmc param_93
    .lex "$_", param_93
    find_lex $P94, "@array"
    unless_null $P94, vivify_32
    new $P94, "ResizablePMCArray"
  vivify_32:
    find_lex $P95, "$_"
    unless_null $P95, vivify_33
    new $P95, "Undef"
  vivify_33:
    set $S96, $P95
    $P97 = $P94."push"($S96)
    .return ($P97)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256214686.79251")
    get_hll_global $P14, ["String"], "_block13" 
    .return ($P14)
.end


.namespace ["String"]
.sub "_block13" :init :load :subid("11_1256214686.79251")
    .const 'Sub' $P497 = "50_1256214686.79251" 
    capture_lex $P497
    .const 'Sub' $P433 = "44_1256214686.79251" 
    capture_lex $P433
    .const 'Sub' $P419 = "42_1256214686.79251" 
    capture_lex $P419
    .const 'Sub' $P411 = "41_1256214686.79251" 
    capture_lex $P411
    .const 'Sub' $P361 = "37_1256214686.79251" 
    capture_lex $P361
    .const 'Sub' $P313 = "33_1256214686.79251" 
    capture_lex $P313
    .const 'Sub' $P277 = "31_1256214686.79251" 
    capture_lex $P277
    .const 'Sub' $P253 = "29_1256214686.79251" 
    capture_lex $P253
    .const 'Sub' $P234 = "28_1256214686.79251" 
    capture_lex $P234
    .const 'Sub' $P220 = "27_1256214686.79251" 
    capture_lex $P220
    .const 'Sub' $P188 = "24_1256214686.79251" 
    capture_lex $P188
    .const 'Sub' $P159 = "22_1256214686.79251" 
    capture_lex $P159
    .const 'Sub' $P151 = "21_1256214686.79251" 
    capture_lex $P151
    .const 'Sub' $P108 = "16_1256214686.79251" 
    capture_lex $P108
    .const 'Sub' $P60 = "13_1256214686.79251" 
    capture_lex $P60
    .const 'Sub' $P49 = "12_1256214686.79251" 
    capture_lex $P49
    get_hll_global $P15, ["Parrot"], "IMPORT"
    $P15("Dumper")
    get_global $P16, "%Cclass_id"
    unless_null $P16, vivify_53
    new $P16, "Hash"
  vivify_53:
    new $P17, "Integer"
    assign $P17, 65535
    get_global $P18, "%Cclass_id"
    unless_null $P18, vivify_54
    new $P18, "Hash"
    set_global "%Cclass_id", $P18
  vivify_54:
    set $P18["ANY"], $P17
    new $P19, "Integer"
    assign $P19, 0
    get_global $P20, "%Cclass_id"
    unless_null $P20, vivify_55
    new $P20, "Hash"
    set_global "%Cclass_id", $P20
  vivify_55:
    set $P20["NONE"], $P19
    new $P21, "Integer"
    assign $P21, 1
    get_global $P22, "%Cclass_id"
    unless_null $P22, vivify_56
    new $P22, "Hash"
    set_global "%Cclass_id", $P22
  vivify_56:
    set $P22["UPPERCASE"], $P21
    new $P23, "Integer"
    assign $P23, 2
    get_global $P24, "%Cclass_id"
    unless_null $P24, vivify_57
    new $P24, "Hash"
    set_global "%Cclass_id", $P24
  vivify_57:
    set $P24["LOWERCASE"], $P23
    new $P25, "Integer"
    assign $P25, 4
    get_global $P26, "%Cclass_id"
    unless_null $P26, vivify_58
    new $P26, "Hash"
    set_global "%Cclass_id", $P26
  vivify_58:
    set $P26["ALPHABETIC"], $P25
    new $P27, "Integer"
    assign $P27, 8
    get_global $P28, "%Cclass_id"
    unless_null $P28, vivify_59
    new $P28, "Hash"
    set_global "%Cclass_id", $P28
  vivify_59:
    set $P28["NUMERIC"], $P27
    new $P29, "Integer"
    assign $P29, 16
    get_global $P30, "%Cclass_id"
    unless_null $P30, vivify_60
    new $P30, "Hash"
    set_global "%Cclass_id", $P30
  vivify_60:
    set $P30["HEXADECIMAL"], $P29
    new $P31, "Integer"
    assign $P31, 32
    get_global $P32, "%Cclass_id"
    unless_null $P32, vivify_61
    new $P32, "Hash"
    set_global "%Cclass_id", $P32
  vivify_61:
    set $P32["WHITESPACE"], $P31
    new $P33, "Integer"
    assign $P33, 64
    get_global $P34, "%Cclass_id"
    unless_null $P34, vivify_62
    new $P34, "Hash"
    set_global "%Cclass_id", $P34
  vivify_62:
    set $P34["PRINTING"], $P33
    new $P35, "Integer"
    assign $P35, 128
    get_global $P36, "%Cclass_id"
    unless_null $P36, vivify_63
    new $P36, "Hash"
    set_global "%Cclass_id", $P36
  vivify_63:
    set $P36["GRAPHICAL"], $P35
    new $P37, "Integer"
    assign $P37, 256
    get_global $P38, "%Cclass_id"
    unless_null $P38, vivify_64
    new $P38, "Hash"
    set_global "%Cclass_id", $P38
  vivify_64:
    set $P38["BLANK"], $P37
    new $P39, "Integer"
    assign $P39, 512
    get_global $P40, "%Cclass_id"
    unless_null $P40, vivify_65
    new $P40, "Hash"
    set_global "%Cclass_id", $P40
  vivify_65:
    set $P40["CONTROL"], $P39
    new $P41, "Integer"
    assign $P41, 1024
    get_global $P42, "%Cclass_id"
    unless_null $P42, vivify_66
    new $P42, "Hash"
    set_global "%Cclass_id", $P42
  vivify_66:
    set $P42["PUNCTUATION"], $P41
    new $P43, "Integer"
    assign $P43, 2048
    get_global $P44, "%Cclass_id"
    unless_null $P44, vivify_67
    new $P44, "Hash"
    set_global "%Cclass_id", $P44
  vivify_67:
    set $P44["ALPHANUMERIC"], $P43
    new $P45, "Integer"
    assign $P45, 4096
    get_global $P46, "%Cclass_id"
    unless_null $P46, vivify_68
    new $P46, "Hash"
    set_global "%Cclass_id", $P46
  vivify_68:
    set $P46["NEWLINE"], $P45
    new $P47, "Integer"
    assign $P47, 8192
    get_global $P48, "%Cclass_id"
    unless_null $P48, vivify_69
    new $P48, "Hash"
    set_global "%Cclass_id", $P48
  vivify_69:
    set $P48["WORD"], $P47
    .const 'Sub' $P497 = "50_1256214686.79251" 
    capture_lex $P497
    .return ($P497)
.end


.namespace ["String"]
.sub "char_at"  :subid("12_1256214686.79251") :outer("11_1256214686.79251")
    .param pmc param_52
    .param pmc param_53
    new $P51, 'ExceptionHandler'
    set_addr $P51, control_50
    $P51."handle_types"(58)
    push_eh $P51
    .lex "$str", param_52
    .lex "$index", param_53
    new $P54, "Exception"
    set $P54['type'], 58
    find_lex $P55, "$index"
    unless_null $P55, vivify_70
    new $P55, "Undef"
  vivify_70:
    set $I56, $P55
    find_lex $P57, "$str"
    unless_null $P57, vivify_71
    new $P57, "ResizablePMCArray"
  vivify_71:
    set $P58, $P57[$I56]
    unless_null $P58, vivify_72
    new $P58, "Undef"
  vivify_72:
    setattribute $P54, 'payload', $P58
    throw $P54
    .return ()
  control_50:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P59, exception, "payload"
    .return ($P59)
    rethrow exception
.end


.namespace ["String"]
.sub "character_offset_of"  :subid("13_1256214686.79251") :outer("11_1256214686.79251")
    .param pmc param_63
    .param pmc param_64 :slurpy :named
    .const 'Sub' $P85 = "15_1256214686.79251" 
    capture_lex $P85
    .const 'Sub' $P73 = "14_1256214686.79251" 
    capture_lex $P73
    new $P62, 'ExceptionHandler'
    set_addr $P62, control_61
    $P62."handle_types"(58)
    push_eh $P62
    .lex "$string", param_63
    .lex "%opts", param_64
    find_lex $P65, "$string"
    unless_null $P65, vivify_73
    new $P65, "Undef"
  vivify_73:
    find_lex $P66, "%opts"
    unless_null $P66, vivify_74
    new $P66, "Hash"
  vivify_74:
    "DUMP"($P65 :named("string"), $P66 :named("options"))
    get_global $P67, "%Line_number_info"
    unless_null $P67, vivify_75
    new $P67, "Hash"
  vivify_75:
    find_lex $P69, "$string"
    unless_null $P69, vivify_76
    new $P69, "Undef"
  vivify_76:
    get_global $P70, "%Line_number_info"
    unless_null $P70, vivify_77
    new $P70, "Hash"
  vivify_77:
    set $P71, $P70[$P69]
    unless_null $P71, vivify_78
    new $P71, "Undef"
  vivify_78:
    if $P71, unless_68_end
    .const 'Sub' $P73 = "14_1256214686.79251" 
    capture_lex $P73
    $P73()
  unless_68_end:
    new $P76, "Integer"
    assign $P76, 0
    find_lex $P77, "%opts"
    unless_null $P77, vivify_80
    new $P77, "Hash"
  vivify_80:
    set $P78, $P77["offset"]
    unless_null $P78, vivify_81
    new $P78, "Undef"
  vivify_81:
    add $P79, $P76, $P78
    .lex "$offset", $P79
    get_hll_global $P81, ["Hash"], "exists"
    find_lex $P82, "%opts"
    unless_null $P82, vivify_82
    new $P82, "Hash"
  vivify_82:
    $P83 = $P81($P82, "line")
    if $P83, unless_80_end
    .const 'Sub' $P85 = "15_1256214686.79251" 
    capture_lex $P85
    $P85()
  unless_80_end:
    new $P90, "Integer"
    assign $P90, 1
    neg $P91, $P90
    find_lex $P92, "%opts"
    unless_null $P92, vivify_86
    new $P92, "Hash"
  vivify_86:
    set $P93, $P92["line"]
    unless_null $P93, vivify_87
    new $P93, "Undef"
  vivify_87:
    add $P94, $P91, $P93
    .lex "$line", $P94
    find_lex $P95, "$line"
    unless_null $P95, vivify_88
    new $P95, "Undef"
  vivify_88:
    set $I96, $P95
    find_lex $P97, "$string"
    unless_null $P97, vivify_89
    new $P97, "Undef"
  vivify_89:
    get_global $P98, "%Line_number_info"
    unless_null $P98, vivify_90
    new $P98, "Hash"
  vivify_90:
    set $P99, $P98[$P97]
    unless_null $P99, vivify_91
    new $P99, "ResizablePMCArray"
  vivify_91:
    set $P100, $P99[$I96]
    unless_null $P100, vivify_92
    new $P100, "Undef"
  vivify_92:
    .lex "$line_offset", $P100
    find_lex $P101, "$line_offset"
    unless_null $P101, vivify_93
    new $P101, "Undef"
  vivify_93:
    "NOTE"("Line number offset is: ", $P101)
    find_lex $P102, "$offset"
    unless_null $P102, vivify_94
    new $P102, "Undef"
  vivify_94:
    find_lex $P103, "$line_offset"
    unless_null $P103, vivify_95
    new $P103, "Undef"
  vivify_95:
    sub $P104, $P102, $P103
    .lex "$result", $P104
    new $P105, "Exception"
    set $P105['type'], 58
    find_lex $P106, "$result"
    unless_null $P106, vivify_96
    new $P106, "Undef"
  vivify_96:
    setattribute $P105, 'payload', $P106
    throw $P105
    .return ()
  control_61:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
    rethrow exception
.end


.namespace ["String"]
.sub "_block72"  :anon :subid("14_1256214686.79251") :outer("13_1256214686.79251")
    find_lex $P74, "$string"
    unless_null $P74, vivify_79
    new $P74, "Undef"
  vivify_79:
    $P75 = "_init_line_number_info"($P74)
    .return ($P75)
.end


.namespace ["String"]
.sub "_block84"  :anon :subid("15_1256214686.79251") :outer("13_1256214686.79251")
    find_lex $P86, "$string"
    unless_null $P86, vivify_83
    new $P86, "Undef"
  vivify_83:
    find_lex $P87, "$offset"
    unless_null $P87, vivify_84
    new $P87, "Undef"
  vivify_84:
    $P88 = "line_number_of"($P86, $P87 :named("offset"))
    find_lex $P89, "%opts"
    unless_null $P89, vivify_85
    new $P89, "Hash"
    store_lex "%opts", $P89
  vivify_85:
    set $P89["line"], $P88
    .return ($P88)
.end


.namespace ["String"]
.sub "display_width"  :subid("16_1256214686.79251") :outer("11_1256214686.79251")
    .param pmc param_111
    .const 'Sub' $P116 = "17_1256214686.79251" 
    capture_lex $P116
    new $P110, 'ExceptionHandler'
    set_addr $P110, control_109
    $P110."handle_types"(58)
    push_eh $P110
    .lex "$str", param_111
    new $P112, "Integer"
    assign $P112, 0
    .lex "$width", $P112
    find_lex $P114, "$str"
    unless_null $P114, vivify_97
    new $P114, "Undef"
  vivify_97:
    unless $P114, if_113_end
    .const 'Sub' $P116 = "17_1256214686.79251" 
    capture_lex $P116
    $P116()
  if_113_end:
    new $P148, "Exception"
    set $P148['type'], 58
    find_lex $P149, "$width"
    unless_null $P149, vivify_107
    new $P149, "Undef"
  vivify_107:
    setattribute $P148, 'payload', $P149
    throw $P148
    .return ()
  control_109:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P150, exception, "payload"
    .return ($P150)
    rethrow exception
.end


.namespace ["String"]
.sub "_block115"  :anon :subid("17_1256214686.79251") :outer("16_1256214686.79251")
    .const 'Sub' $P126 = "18_1256214686.79251" 
    capture_lex $P126
    new $P117, "Integer"
    assign $P117, 0
    .lex "$i", $P117
    find_lex $P118, "$str"
    unless_null $P118, vivify_98
    new $P118, "Undef"
  vivify_98:
    $P119 = "length"($P118)
    .lex "$len", $P119
    new $P146, 'ExceptionHandler'
    set_addr $P146, loop145_handler
    $P146."handle_types"(65, 67, 66)
    push_eh $P146
  loop145_test:
    find_lex $P120, "$i"
    unless_null $P120, vivify_99
    new $P120, "Undef"
  vivify_99:
    set $N121, $P120
    find_lex $P122, "$len"
    unless_null $P122, vivify_100
    new $P122, "Undef"
  vivify_100:
    set $N123, $P122
    islt $I124, $N121, $N123
    unless $I124, loop145_done
  loop145_redo:
    .const 'Sub' $P126 = "18_1256214686.79251" 
    capture_lex $P126
    $P126()
  loop145_next:
    goto loop145_test
  loop145_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P147, exception, 'type'
    eq $P147, 65, loop145_next
    eq $P147, 67, loop145_redo
  loop145_done:
    pop_eh 
    .return ($I124)
.end


.namespace ["String"]
.sub "_block125"  :anon :subid("18_1256214686.79251") :outer("17_1256214686.79251")
    .const 'Sub' $P140 = "20_1256214686.79251" 
    capture_lex $P140
    .const 'Sub' $P133 = "19_1256214686.79251" 
    capture_lex $P133
    find_lex $P128, "$str"
    unless_null $P128, vivify_101
    new $P128, "Undef"
  vivify_101:
    find_lex $P129, "$i"
    unless_null $P129, vivify_102
    new $P129, "Undef"
  vivify_102:
    $S130 = "char_at"($P128, $P129)
    iseq $I131, $S130, "\t"
    if $I131, if_127
    .const 'Sub' $P140 = "20_1256214686.79251" 
    capture_lex $P140
    $P140()
    goto if_127_end
  if_127:
    .const 'Sub' $P133 = "19_1256214686.79251" 
    capture_lex $P133
    $P133()
  if_127_end:
    find_lex $P143, "$i"
    unless_null $P143, vivify_106
    new $P143, "Undef"
  vivify_106:
        ##  inline postfix:++
        clone $P144, $P143
        inc $P143
    .return ($P144)
.end


.namespace ["String"]
.sub "_block139"  :anon :subid("20_1256214686.79251") :outer("18_1256214686.79251")
    find_lex $P141, "$width"
    unless_null $P141, vivify_103
    new $P141, "Undef"
  vivify_103:
        ##  inline postfix:++
        clone $P142, $P141
        inc $P141
    .return ($P142)
.end


.namespace ["String"]
.sub "_block132"  :anon :subid("19_1256214686.79251") :outer("18_1256214686.79251")
    find_lex $P134, "$width"
    unless_null $P134, vivify_104
    new $P134, "Undef"
  vivify_104:
    add $P135, $P134, 8
    find_lex $P136, "$width"
    unless_null $P136, vivify_105
    new $P136, "Undef"
  vivify_105:
    mod $P137, $P136, 8
    sub $P138, $P135, $P137
    store_lex "$width", $P138
    .return ($P138)
.end


.namespace ["String"]
.sub "downcase"  :subid("21_1256214686.79251") :outer("11_1256214686.79251")
    .param pmc param_154
    new $P153, 'ExceptionHandler'
    set_addr $P153, control_152
    $P153."handle_types"(58)
    push_eh $P153
    .lex "$str", param_154

		$P0 = find_lex '$str'
		$S0 = $P0
		$S0 = downcase $S0
		$P155 = box $S0
	
    .lex "$result", $P155
    new $P156, "Exception"
    set $P156['type'], 58
    find_lex $P157, "$result"
    unless_null $P157, vivify_108
    new $P157, "Undef"
  vivify_108:
    setattribute $P156, 'payload', $P157
    throw $P156
    .return ()
  control_152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P158, exception, "payload"
    .return ($P158)
    rethrow exception
.end


.namespace ["String"]
.sub "find_cclass"  :subid("22_1256214686.79251") :outer("11_1256214686.79251")
    .param pmc param_162
    .param pmc param_163
    .param pmc param_164 :slurpy :named
    .const 'Sub' $P174 = "23_1256214686.79251" 
    capture_lex $P174
    new $P161, 'ExceptionHandler'
    set_addr $P161, control_160
    $P161."handle_types"(58)
    push_eh $P161
    .lex "$class_name", param_162
    .lex "$str", param_163
    .lex "%opts", param_164
    new $P165, "Integer"
    assign $P165, 0
    find_lex $P166, "%opts"
    unless_null $P166, vivify_109
    new $P166, "Hash"
  vivify_109:
    set $P167, $P166["offset"]
    unless_null $P167, vivify_110
    new $P167, "Undef"
  vivify_110:
    add $P168, $P165, $P167
    .lex "$offset", $P168
    find_lex $P169, "%opts"
    unless_null $P169, vivify_111
    new $P169, "Hash"
  vivify_111:
    set $P170, $P169["count"]
    unless_null $P170, vivify_112
    new $P170, "Undef"
  vivify_112:
    .lex "$count", $P170
    find_lex $P172, "$count"
    unless_null $P172, vivify_113
    new $P172, "Undef"
  vivify_113:
    if $P172, unless_171_end
    .const 'Sub' $P174 = "23_1256214686.79251" 
    capture_lex $P174
    $P174()
  unless_171_end:
    new $P179, "Integer"
    assign $P179, 0
    find_lex $P180, "$class_name"
    unless_null $P180, vivify_116
    new $P180, "Undef"
  vivify_116:
    get_global $P181, "%Cclass_id"
    unless_null $P181, vivify_117
    new $P181, "Hash"
  vivify_117:
    set $P182, $P181[$P180]
    unless_null $P182, vivify_118
    new $P182, "Undef"
  vivify_118:
    add $P183, $P179, $P182
    .lex "$cclass", $P183

		.local int cclass, offset, count
		$P0 = find_lex '$cclass'
		cclass = $P0
		$P0 = find_lex '$offset'
		offset = $P0
		$P0 = find_lex '$count'
		count = $P0
		
		.local string str
		$P0 = find_lex '$str'
		str = $P0
	
		$I0 = find_cclass cclass, str, offset, count
		$P184 = box $I0
		
	
    .lex "$result", $P184
    new $P185, "Exception"
    set $P185['type'], 58
    find_lex $P186, "$result"
    unless_null $P186, vivify_119
    new $P186, "Undef"
  vivify_119:
    setattribute $P185, 'payload', $P186
    throw $P185
    .return ()
  control_160:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P187, exception, "payload"
    .return ($P187)
    rethrow exception
.end


.namespace ["String"]
.sub "_block173"  :anon :subid("23_1256214686.79251") :outer("22_1256214686.79251")
    find_lex $P175, "$str"
    unless_null $P175, vivify_114
    new $P175, "Undef"
  vivify_114:
    $P176 = "length"($P175)
    find_lex $P177, "$offset"
    unless_null $P177, vivify_115
    new $P177, "Undef"
  vivify_115:
    sub $P178, $P176, $P177
    store_lex "$count", $P178
    .return ($P178)
.end


.namespace ["String"]
.sub "find_not_cclass"  :subid("24_1256214686.79251") :outer("11_1256214686.79251")
    .param pmc param_191
    .param pmc param_192
    .param pmc param_193 :slurpy :named
    .const 'Sub' $P206 = "26_1256214686.79251" 
    capture_lex $P206
    .const 'Sub' $P199 = "25_1256214686.79251" 
    capture_lex $P199
    new $P190, 'ExceptionHandler'
    set_addr $P190, control_189
    $P190."handle_types"(58)
    push_eh $P190
    .lex "$class_name", param_191
    .lex "$str", param_192
    .lex "%opts", param_193
    find_lex $P194, "%opts"
    unless_null $P194, vivify_120
    new $P194, "Hash"
  vivify_120:
    set $P195, $P194["offset"]
    unless_null $P195, vivify_121
    new $P195, "Undef"
  vivify_121:
    .lex "$offset", $P195
    find_lex $P197, "$offset"
    unless_null $P197, vivify_122
    new $P197, "Undef"
  vivify_122:
    if $P197, unless_196_end
    .const 'Sub' $P199 = "25_1256214686.79251" 
    capture_lex $P199
    $P199()
  unless_196_end:
    find_lex $P201, "%opts"
    unless_null $P201, vivify_123
    new $P201, "Hash"
  vivify_123:
    set $P202, $P201["count"]
    unless_null $P202, vivify_124
    new $P202, "Undef"
  vivify_124:
    .lex "$count", $P202
    find_lex $P204, "$count"
    unless_null $P204, vivify_125
    new $P204, "Undef"
  vivify_125:
    if $P204, unless_203_end
    .const 'Sub' $P206 = "26_1256214686.79251" 
    capture_lex $P206
    $P206()
  unless_203_end:
    new $P211, "Integer"
    assign $P211, 0
    find_lex $P212, "$class_name"
    unless_null $P212, vivify_128
    new $P212, "Undef"
  vivify_128:
    get_global $P213, "%Cclass_id"
    unless_null $P213, vivify_129
    new $P213, "Hash"
  vivify_129:
    set $P214, $P213[$P212]
    unless_null $P214, vivify_130
    new $P214, "Undef"
  vivify_130:
    add $P215, $P211, $P214
    .lex "$class", $P215

		$P0 = find_lex '$class'
		$I1 = $P0
		$P0 = find_lex '$str'
		$S2 = $P0
		$P0 = find_lex '$offset'
		$I3 = $P0
		$P0 = find_lex '$count'
		$I4 = $P0
		$I0 = find_not_cclass $I1, $S2, $I3, $I4
		$P216 = box $I0
	
    .lex "$result", $P216
    new $P217, "Exception"
    set $P217['type'], 58
    find_lex $P218, "$result"
    unless_null $P218, vivify_131
    new $P218, "Undef"
  vivify_131:
    setattribute $P217, 'payload', $P218
    throw $P217
    .return ()
  control_189:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P219, exception, "payload"
    .return ($P219)
    rethrow exception
.end


.namespace ["String"]
.sub "_block198"  :anon :subid("25_1256214686.79251") :outer("24_1256214686.79251")
    new $P200, "Integer"
    assign $P200, 0
    store_lex "$offset", $P200
    .return ($P200)
.end


.namespace ["String"]
.sub "_block205"  :anon :subid("26_1256214686.79251") :outer("24_1256214686.79251")
    find_lex $P207, "$str"
    unless_null $P207, vivify_126
    new $P207, "Undef"
  vivify_126:
    $P208 = "length"($P207)
    find_lex $P209, "$offset"
    unless_null $P209, vivify_127
    new $P209, "Undef"
  vivify_127:
    sub $P210, $P208, $P209
    store_lex "$count", $P210
    .return ($P210)
.end


.namespace ["String"]
.sub "index"  :subid("27_1256214686.79251") :outer("11_1256214686.79251")
    .param pmc param_223
    .param pmc param_224
    .param pmc param_225 :slurpy :named
    new $P222, 'ExceptionHandler'
    set_addr $P222, control_221
    $P222."handle_types"(58)
    push_eh $P222
    .lex "$haystack", param_223
    .lex "$needle", param_224
    .lex "%opts", param_225
    new $P226, "Integer"
    assign $P226, 0
    find_lex $P227, "%opts"
    unless_null $P227, vivify_132
    new $P227, "Hash"
  vivify_132:
    set $P228, $P227["offset"]
    unless_null $P228, vivify_133
    new $P228, "Undef"
  vivify_133:
    add $P229, $P226, $P228
    .lex "$offset", $P229

		.local string haystack		
		$P0 = find_lex '$haystack'
		haystack = $P0
		
		.local string needle
		$P0 = find_lex '$needle'
		needle = $P0
		
		.local int offset
		$P0 = find_lex '$offset'
		offset = $P0
		
		$I0 = index haystack, needle, offset
		$P230 = box $I0
	
    .lex "$result", $P230
    new $P231, "Exception"
    set $P231['type'], 58
    find_lex $P232, "$result"
    unless_null $P232, vivify_134
    new $P232, "Undef"
  vivify_134:
    setattribute $P231, 'payload', $P232
    throw $P231
    .return ()
  control_221:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P233, exception, "payload"
    .return ($P233)
    rethrow exception
.end


.namespace ["String"]
.sub "is_cclass"  :subid("28_1256214686.79251") :outer("11_1256214686.79251")
    .param pmc param_237
    .param pmc param_238
    .param pmc param_239 :slurpy :named
    new $P236, 'ExceptionHandler'
    set_addr $P236, control_235
    $P236."handle_types"(58)
    push_eh $P236
    .lex "$class_name", param_237
    .lex "$str", param_238
    .lex "%opts", param_239
    new $P240, "Integer"
    assign $P240, 0
    find_lex $P241, "%opts"
    unless_null $P241, vivify_135
    new $P241, "Hash"
  vivify_135:
    set $P242, $P241["offset"]
    unless_null $P242, vivify_136
    new $P242, "Undef"
  vivify_136:
    add $P243, $P240, $P242
    .lex "$offset", $P243
    new $P244, "Integer"
    assign $P244, 0
    find_lex $P245, "$class_name"
    unless_null $P245, vivify_137
    new $P245, "Undef"
  vivify_137:
    get_global $P246, "%Cclass_id"
    unless_null $P246, vivify_138
    new $P246, "Hash"
  vivify_138:
    set $P247, $P246[$P245]
    unless_null $P247, vivify_139
    new $P247, "Undef"
  vivify_139:
    add $P248, $P244, $P247
    .lex "$class", $P248

		$P0 = find_lex '$class'
		$I1 = $P0
		$P0 = find_lex '$str'
		$S2 = $P0
		$P0 = find_lex '$offset'
		$I3 = $P0
		$I0 = is_cclass $I1, $S2, $I3
		$P249 = box $I0
	
    .lex "$result", $P249
    new $P250, "Exception"
    set $P250['type'], 58
    find_lex $P251, "$result"
    unless_null $P251, vivify_140
    new $P251, "Undef"
  vivify_140:
    setattribute $P250, 'payload', $P251
    throw $P250
    .return ()
  control_235:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P252, exception, "payload"
    .return ($P252)
    rethrow exception
.end


.namespace ["String"]
.sub "length"  :subid("29_1256214686.79251") :method :outer("11_1256214686.79251")
    .param pmc param_256 :slurpy :named
    .const 'Sub' $P269 = "30_1256214686.79251" 
    capture_lex $P269
    new $P255, 'ExceptionHandler'
    set_addr $P255, control_254
    $P255."handle_types"(58)
    push_eh $P255
    .lex "self", self
    .lex "%opts", param_256
    new $P257, "Integer"
    assign $P257, 0
    find_lex $P258, "%opts"
    unless_null $P258, vivify_141
    new $P258, "Hash"
  vivify_141:
    set $P259, $P258["offset"]
    unless_null $P259, vivify_142
    new $P259, "Undef"
  vivify_142:
    add $P260, $P257, $P259
    .lex "$offset", $P260

		$P0 = find_lex 'self'
		$S0 = $P0
		$I0 = length $S0
		$P261 = box $I0
	
    .lex "$result", $P261
    find_lex $P263, "$offset"
    unless_null $P263, vivify_143
    new $P263, "Undef"
  vivify_143:
    set $N264, $P263
    find_lex $P265, "$result"
    unless_null $P265, vivify_144
    new $P265, "Undef"
  vivify_144:
    set $N266, $P265
    isgt $I267, $N264, $N266
    unless $I267, if_262_end
    .const 'Sub' $P269 = "30_1256214686.79251" 
    capture_lex $P269
    $P269()
  if_262_end:
    find_lex $P271, "$result"
    unless_null $P271, vivify_146
    new $P271, "Undef"
  vivify_146:
    find_lex $P272, "$offset"
    unless_null $P272, vivify_147
    new $P272, "Undef"
  vivify_147:
    sub $P273, $P271, $P272
    store_lex "$result", $P273
    new $P274, "Exception"
    set $P274['type'], 58
    find_lex $P275, "$result"
    unless_null $P275, vivify_148
    new $P275, "Undef"
  vivify_148:
    setattribute $P274, 'payload', $P275
    throw $P274
    .return ()
  control_254:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P276, exception, "payload"
    .return ($P276)
    rethrow exception
.end


.namespace ["String"]
.sub "_block268"  :anon :subid("30_1256214686.79251") :outer("29_1256214686.79251")
    find_lex $P270, "$result"
    unless_null $P270, vivify_145
    new $P270, "Undef"
  vivify_145:
    store_lex "$offset", $P270
    .return ($P270)
.end


.namespace ["String"]
.sub "_init_line_number_info"  :subid("31_1256214686.79251") :outer("11_1256214686.79251")
    .param pmc param_280
    .const 'Sub' $P296 = "32_1256214686.79251" 
    capture_lex $P296
    new $P279, 'ExceptionHandler'
    set_addr $P279, control_278
    $P279."handle_types"(58)
    push_eh $P279
    .lex "$string", param_280
    get_hll_global $P281, ["Array"], "new"
    new $P282, "Integer"
    assign $P282, 1
    neg $P283, $P282
    $P284 = $P281($P283)
    .lex "@lines", $P284
    get_hll_global $P285, ["String"], "length"
    find_lex $P286, "$string"
    unless_null $P286, vivify_149
    new $P286, "Undef"
  vivify_149:
    $P287 = $P285($P286)
    .lex "$len", $P287
    new $P288, "Integer"
    assign $P288, 1
    neg $P289, $P288
    .lex "$i", $P289
    new $P306, 'ExceptionHandler'
    set_addr $P306, loop305_handler
    $P306."handle_types"(65, 67, 66)
    push_eh $P306
  loop305_test:
    find_lex $P290, "$i"
    unless_null $P290, vivify_150
    new $P290, "Undef"
  vivify_150:
    set $N291, $P290
    find_lex $P292, "$len"
    unless_null $P292, vivify_151
    new $P292, "Undef"
  vivify_151:
    set $N293, $P292
    islt $I294, $N291, $N293
    unless $I294, loop305_done
  loop305_redo:
    .const 'Sub' $P296 = "32_1256214686.79251" 
    capture_lex $P296
    $P296()
  loop305_next:
    goto loop305_test
  loop305_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P307, exception, 'type'
    eq $P307, 65, loop305_next
    eq $P307, 67, loop305_redo
  loop305_done:
    pop_eh 
    get_global $P308, "%Line_number_info"
    unless_null $P308, vivify_156
    new $P308, "Hash"
  vivify_156:
    find_lex $P309, "@lines"
    unless_null $P309, vivify_157
    new $P309, "ResizablePMCArray"
  vivify_157:
    find_lex $P310, "$string"
    unless_null $P310, vivify_158
    new $P310, "Undef"
  vivify_158:
    get_global $P311, "%Line_number_info"
    unless_null $P311, vivify_159
    new $P311, "Hash"
    set_global "%Line_number_info", $P311
  vivify_159:
    set $P311[$P310], $P309
    .return ($P309)
  control_278:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P312, exception, "payload"
    .return ($P312)
    rethrow exception
.end


.namespace ["String"]
.sub "_block295"  :anon :subid("32_1256214686.79251") :outer("31_1256214686.79251")
    get_hll_global $P297, ["String"], "find_cclass"
    find_lex $P298, "$string"
    unless_null $P298, vivify_152
    new $P298, "Undef"
  vivify_152:
    find_lex $P299, "$i"
    unless_null $P299, vivify_153
    new $P299, "Undef"
  vivify_153:
    add $P300, $P299, 1
    $P301 = $P297("NEWLINE", $P298, $P300 :named("offset"))
    store_lex "$i", $P301
    find_lex $P302, "@lines"
    unless_null $P302, vivify_154
    new $P302, "ResizablePMCArray"
  vivify_154:
    find_lex $P303, "$i"
    unless_null $P303, vivify_155
    new $P303, "Undef"
  vivify_155:
    $P304 = $P302."push"($P303)
    .return ($P304)
.end


.namespace ["String"]
.sub "line_number_of"  :subid("33_1256214686.79251") :outer("11_1256214686.79251")
    .param pmc param_316
    .param pmc param_317 :slurpy :named
    .const 'Sub' $P353 = "36_1256214686.79251" 
    capture_lex $P353
    .const 'Sub' $P332 = "35_1256214686.79251" 
    capture_lex $P332
    .const 'Sub' $P323 = "34_1256214686.79251" 
    capture_lex $P323
    new $P315, 'ExceptionHandler'
    set_addr $P315, control_314
    $P315."handle_types"(58)
    push_eh $P315
    .lex "$string", param_316
    .lex "%opts", param_317
    find_lex $P318, "$string"
    unless_null $P318, vivify_160
    new $P318, "Undef"
  vivify_160:
    find_lex $P319, "%opts"
    unless_null $P319, vivify_161
    new $P319, "Hash"
  vivify_161:
    "DUMP"($P318 :named("string"), $P319 :named("options"))
    find_lex $P321, "$string"
    unless_null $P321, vivify_162
    new $P321, "Undef"
  vivify_162:
    if $P321, unless_320_end
    .const 'Sub' $P323 = "34_1256214686.79251" 
    capture_lex $P323
    $P323()
  unless_320_end:
    get_global $P326, "%Line_number_info"
    unless_null $P326, vivify_163
    new $P326, "Hash"
  vivify_163:
    find_lex $P328, "$string"
    unless_null $P328, vivify_164
    new $P328, "Undef"
  vivify_164:
    get_global $P329, "%Line_number_info"
    unless_null $P329, vivify_165
    new $P329, "Hash"
  vivify_165:
    set $P330, $P329[$P328]
    unless_null $P330, vivify_166
    new $P330, "Undef"
  vivify_166:
    if $P330, unless_327_end
    .const 'Sub' $P332 = "35_1256214686.79251" 
    capture_lex $P332
    $P332()
  unless_327_end:
    new $P335, "Integer"
    assign $P335, 0
    find_lex $P336, "%opts"
    unless_null $P336, vivify_168
    new $P336, "Hash"
  vivify_168:
    set $P337, $P336["offset"]
    unless_null $P337, vivify_169
    new $P337, "Undef"
  vivify_169:
    add $P338, $P335, $P337
    .lex "$offset", $P338
    find_lex $P339, "$offset"
    unless_null $P339, vivify_170
    new $P339, "Undef"
  vivify_170:
    "NOTE"("Bsearching for line number of ", $P339, " in string")
    get_hll_global $P340, ["Array"], "bsearch"
    find_lex $P341, "$string"
    unless_null $P341, vivify_171
    new $P341, "Undef"
  vivify_171:
    get_global $P342, "%Line_number_info"
    unless_null $P342, vivify_172
    new $P342, "Hash"
  vivify_172:
    set $P343, $P342[$P341]
    unless_null $P343, vivify_173
    new $P343, "Undef"
  vivify_173:
    find_lex $P344, "$offset"
    unless_null $P344, vivify_174
    new $P344, "Undef"
  vivify_174:
    $P345 = $P340($P343, $P344, "<=>" :named("cmp"))
    .lex "$line", $P345
    find_lex $P347, "$line"
    unless_null $P347, vivify_175
    new $P347, "Undef"
  vivify_175:
    set $N348, $P347
    new $P349, "Integer"
    assign $P349, 0
    set $N350, $P349
    islt $I351, $N348, $N350
    unless $I351, if_346_end
    .const 'Sub' $P353 = "36_1256214686.79251" 
    capture_lex $P353
    $P353()
  if_346_end:
    find_lex $P357, "$line"
    unless_null $P357, vivify_177
    new $P357, "Undef"
  vivify_177:
    "NOTE"("Returning line number (1-based): ", $P357)
    new $P358, "Exception"
    set $P358['type'], 58
    find_lex $P359, "$line"
    unless_null $P359, vivify_178
    new $P359, "Undef"
  vivify_178:
    setattribute $P358, 'payload', $P359
    throw $P358
    .return ()
  control_314:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P360, exception, "payload"
    .return ($P360)
    rethrow exception
.end


.namespace ["String"]
.sub "_block322"  :anon :subid("34_1256214686.79251") :outer("33_1256214686.79251")
    "NOTE"("String is empty or undef. Returning 1")
    new $P324, "Exception"
    set $P324['type'], 58
    new $P325, "Integer"
    assign $P325, 1
    setattribute $P324, 'payload', $P325
    throw $P324
    .return ()
.end


.namespace ["String"]
.sub "_block331"  :anon :subid("35_1256214686.79251") :outer("33_1256214686.79251")
    find_lex $P333, "$string"
    unless_null $P333, vivify_167
    new $P333, "Undef"
  vivify_167:
    $P334 = "_init_line_number_info"($P333)
    .return ($P334)
.end


.namespace ["String"]
.sub "_block352"  :anon :subid("36_1256214686.79251") :outer("33_1256214686.79251")
    find_lex $P354, "$line"
    unless_null $P354, vivify_176
    new $P354, "Undef"
  vivify_176:
    neg $P355, $P354
    sub $P356, $P355, 1
    store_lex "$line", $P356
    .return ($P356)
.end


.namespace ["String"]
.sub "ltrim_indent"  :subid("37_1256214686.79251") :outer("11_1256214686.79251")
    .param pmc param_364
    .param pmc param_365
    .const 'Sub' $P383 = "38_1256214686.79251" 
    capture_lex $P383
    new $P363, 'ExceptionHandler'
    set_addr $P363, control_362
    $P363."handle_types"(58)
    push_eh $P363
    .lex "$str", param_364
    .lex "$indent", param_365
    find_lex $P366, "$str"
    unless_null $P366, vivify_179
    new $P366, "Undef"
  vivify_179:
    $P367 = "find_not_cclass"("WHITESPACE", $P366)
    .lex "$limit", $P367
    new $P368, "Integer"
    assign $P368, 0
    .lex "$i", $P368
    new $P369, "Integer"
    assign $P369, 0
    .lex "$prefix", $P369
    new $P404, 'ExceptionHandler'
    set_addr $P404, loop403_handler
    $P404."handle_types"(65, 67, 66)
    push_eh $P404
  loop403_test:
    find_lex $P372, "$i"
    unless_null $P372, vivify_180
    new $P372, "Undef"
  vivify_180:
    set $N373, $P372
    find_lex $P374, "$limit"
    unless_null $P374, vivify_181
    new $P374, "Undef"
  vivify_181:
    set $N375, $P374
    islt $I376, $N373, $N375
    if $I376, if_371
    new $P370, 'Integer'
    set $P370, $I376
    goto if_371_end
  if_371:
    find_lex $P377, "$prefix"
    unless_null $P377, vivify_182
    new $P377, "Undef"
  vivify_182:
    set $N378, $P377
    find_lex $P379, "$indent"
    unless_null $P379, vivify_183
    new $P379, "Undef"
  vivify_183:
    set $N380, $P379
    islt $I381, $N378, $N380
    new $P370, 'Integer'
    set $P370, $I381
  if_371_end:
    unless $P370, loop403_done
  loop403_redo:
    .const 'Sub' $P383 = "38_1256214686.79251" 
    capture_lex $P383
    $P383()
  loop403_next:
    goto loop403_test
  loop403_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P405, exception, 'type'
    eq $P405, 65, loop403_next
    eq $P405, 67, loop403_redo
  loop403_done:
    pop_eh 
    new $P406, "Exception"
    set $P406['type'], 58
    find_lex $P407, "$str"
    unless_null $P407, vivify_189
    new $P407, "Undef"
  vivify_189:
    find_lex $P408, "$i"
    unless_null $P408, vivify_190
    new $P408, "Undef"
  vivify_190:
    $P409 = "substr"($P407, $P408)
    setattribute $P406, 'payload', $P409
    throw $P406
    .return ()
  control_362:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P410, exception, "payload"
    .return ($P410)
    rethrow exception
.end


.namespace ["String"]
.sub "_block382"  :anon :subid("38_1256214686.79251") :outer("37_1256214686.79251")
    .const 'Sub' $P399 = "40_1256214686.79251" 
    capture_lex $P399
    .const 'Sub' $P391 = "39_1256214686.79251" 
    capture_lex $P391
    find_lex $P386, "$str"
    unless_null $P386, vivify_184
    new $P386, "Undef"
  vivify_184:
    find_lex $P387, "$i"
    unless_null $P387, vivify_185
    new $P387, "Undef"
  vivify_185:
    $S388 = "char_at"($P386, $P387)
    iseq $I389, $S388, "\t"
    if $I389, if_385
    .const 'Sub' $P399 = "40_1256214686.79251" 
    capture_lex $P399
    $P402 = $P399()
    set $P384, $P402
    goto if_385_end
  if_385:
    .const 'Sub' $P391 = "39_1256214686.79251" 
    capture_lex $P391
    $P397 = $P391()
    set $P384, $P397
  if_385_end:
    .return ($P384)
.end


.namespace ["String"]
.sub "_block398"  :anon :subid("40_1256214686.79251") :outer("38_1256214686.79251")
    find_lex $P400, "$prefix"
    unless_null $P400, vivify_186
    new $P400, "Undef"
  vivify_186:
        ##  inline postfix:++
        clone $P401, $P400
        inc $P400
    .return ($P401)
.end


.namespace ["String"]
.sub "_block390"  :anon :subid("39_1256214686.79251") :outer("38_1256214686.79251")
    find_lex $P392, "$prefix"
    unless_null $P392, vivify_187
    new $P392, "Undef"
  vivify_187:
    add $P393, $P392, 8
    find_lex $P394, "$prefix"
    unless_null $P394, vivify_188
    new $P394, "Undef"
  vivify_188:
    mod $P395, $P394, 8
    sub $P396, $P393, $P395
    store_lex "$prefix", $P396
    .return ($P396)
.end


.namespace ["String"]
.sub "repeat"  :subid("41_1256214686.79251") :method :outer("11_1256214686.79251")
    .param pmc param_414
    new $P413, 'ExceptionHandler'
    set_addr $P413, control_412
    $P413."handle_types"(58)
    push_eh $P413
    .lex "self", self
    .lex "$times", param_414

		$P0 = find_lex 'self'
		$S0 = $P0
		$P0 = find_lex '$times'
		$I0 = $P0
		$S1 = repeat $S0, $I0
		$P415 = box $S1
	
    .lex "$result", $P415
    new $P416, "Exception"
    set $P416['type'], 58
    find_lex $P417, "$result"
    unless_null $P417, vivify_191
    new $P417, "Undef"
  vivify_191:
    setattribute $P416, 'payload', $P417
    throw $P416
    .return ()
  control_412:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P418, exception, "payload"
    .return ($P418)
    rethrow exception
.end


.namespace ["String"]
.sub "split"  :subid("42_1256214686.79251") :method :outer("11_1256214686.79251")
    .param pmc param_422 :optional
    .param int has_param_422 :opt_flag
    .const 'Sub' $P427 = "43_1256214686.79251" 
    capture_lex $P427
    new $P421, 'ExceptionHandler'
    set_addr $P421, control_420
    $P421."handle_types"(58)
    push_eh $P421
    .lex "self", self
    if has_param_422, optparam_192
    new $P423, "Undef"
    set param_422, $P423
  optparam_192:
    .lex "$delim", param_422
    find_lex $P425, "$delim"
    unless_null $P425, vivify_193
    new $P425, "Undef"
  vivify_193:
    if $P425, unless_424_end
    .const 'Sub' $P427 = "43_1256214686.79251" 
    capture_lex $P427
    $P427()
  unless_424_end:

		$P0 = find_lex '$delim'
		$S0 = $P0
		$P1 = find_lex 'self'
		$S1 = $P1
		$P429 = split $S0, $S1
	
    .lex "@array", $P429
    new $P430, "Exception"
    set $P430['type'], 58
    find_lex $P431, "@array"
    unless_null $P431, vivify_194
    new $P431, "ResizablePMCArray"
  vivify_194:
    setattribute $P430, 'payload', $P431
    throw $P430
    .return ()
  control_420:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P432, exception, "payload"
    .return ($P432)
    rethrow exception
.end


.namespace ["String"]
.sub "_block426"  :anon :subid("43_1256214686.79251") :outer("42_1256214686.79251")
    new $P428, "String"
    assign $P428, " "
    store_lex "$delim", $P428
    .return ($P428)
.end


.namespace ["String"]
.sub "substr"  :subid("44_1256214686.79251") :method :outer("11_1256214686.79251")
    .param pmc param_436
    .param pmc param_437 :slurpy
    .const 'Sub' $P468 = "47_1256214686.79251" 
    capture_lex $P468
    .const 'Sub' $P458 = "46_1256214686.79251" 
    capture_lex $P458
    .const 'Sub' $P447 = "45_1256214686.79251" 
    capture_lex $P447
    new $P435, 'ExceptionHandler'
    set_addr $P435, control_434
    $P435."handle_types"(58)
    push_eh $P435
    .lex "self", self
    .lex "$start", param_436
    .lex "@rest", param_437
    find_lex $P438, "self"
    $P439 = "length"($P438)
    .lex "$len", $P439
    find_lex $P441, "$start"
    unless_null $P441, vivify_195
    new $P441, "Undef"
  vivify_195:
    set $N442, $P441
    new $P443, "Integer"
    assign $P443, 0
    set $N444, $P443
    islt $I445, $N442, $N444
    unless $I445, if_440_end
    .const 'Sub' $P447 = "45_1256214686.79251" 
    capture_lex $P447
    $P447()
  if_440_end:
    find_lex $P452, "$start"
    unless_null $P452, vivify_198
    new $P452, "Undef"
  vivify_198:
    set $N453, $P452
    find_lex $P454, "$len"
    unless_null $P454, vivify_199
    new $P454, "Undef"
  vivify_199:
    set $N455, $P454
    isgt $I456, $N453, $N455
    unless $I456, if_451_end
    .const 'Sub' $P458 = "46_1256214686.79251" 
    capture_lex $P458
    $P458()
  if_451_end:
    find_lex $P460, "$len"
    unless_null $P460, vivify_201
    new $P460, "Undef"
  vivify_201:
    find_lex $P461, "$start"
    unless_null $P461, vivify_202
    new $P461, "Undef"
  vivify_202:
    sub $P462, $P460, $P461
    store_lex "$len", $P462
    find_lex $P463, "$len"
    unless_null $P463, vivify_203
    new $P463, "Undef"
  vivify_203:
    .lex "$limit", $P463
    find_lex $P465, "@rest"
    unless_null $P465, vivify_204
    new $P465, "ResizablePMCArray"
  vivify_204:
    set $N466, $P465
    unless $N466, if_464_end
    .const 'Sub' $P468 = "47_1256214686.79251" 
    capture_lex $P468
    $P468()
  if_464_end:

		$P0 = find_lex 'self'
		$S0 = $P0
		$P0 = find_lex '$start'
		$I0 = $P0
		$P0 = find_lex '$limit'
		$I1 = $P0
		$S1 = substr $S0, $I0, $I1
		$P493 = box $S1
	
    .lex "$result", $P493
    new $P494, "Exception"
    set $P494['type'], 58
    find_lex $P495, "$result"
    unless_null $P495, vivify_212
    new $P495, "Undef"
  vivify_212:
    setattribute $P494, 'payload', $P495
    throw $P494
    .return ()
  control_434:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P496, exception, "payload"
    .return ($P496)
    rethrow exception
.end


.namespace ["String"]
.sub "_block446"  :anon :subid("45_1256214686.79251") :outer("44_1256214686.79251")
    find_lex $P448, "$start"
    unless_null $P448, vivify_196
    new $P448, "Undef"
  vivify_196:
    find_lex $P449, "$len"
    unless_null $P449, vivify_197
    new $P449, "Undef"
  vivify_197:
    add $P450, $P448, $P449
    store_lex "$start", $P450
    .return ($P450)
.end


.namespace ["String"]
.sub "_block457"  :anon :subid("46_1256214686.79251") :outer("44_1256214686.79251")
    find_lex $P459, "$len"
    unless_null $P459, vivify_200
    new $P459, "Undef"
  vivify_200:
    store_lex "$start", $P459
    .return ($P459)
.end


.namespace ["String"]
.sub "_block467"  :anon :subid("47_1256214686.79251") :outer("44_1256214686.79251")
    .const 'Sub' $P490 = "49_1256214686.79251" 
    capture_lex $P490
    .const 'Sub' $P478 = "48_1256214686.79251" 
    capture_lex $P478
    find_lex $P469, "@rest"
    unless_null $P469, vivify_205
    new $P469, "ResizablePMCArray"
  vivify_205:
    $P470 = $P469."shift"()
    store_lex "$limit", $P470
    find_lex $P472, "$limit"
    unless_null $P472, vivify_206
    new $P472, "Undef"
  vivify_206:
    set $N473, $P472
    new $P474, "Integer"
    assign $P474, 0
    set $N475, $P474
    islt $I476, $N473, $N475
    unless $I476, if_471_end
    .const 'Sub' $P478 = "48_1256214686.79251" 
    capture_lex $P478
    $P478()
  if_471_end:
    find_lex $P484, "$limit"
    unless_null $P484, vivify_209
    new $P484, "Undef"
  vivify_209:
    set $N485, $P484
    find_lex $P486, "$len"
    unless_null $P486, vivify_210
    new $P486, "Undef"
  vivify_210:
    set $N487, $P486
    isgt $I488, $N485, $N487
    if $I488, if_483
    new $P482, 'Integer'
    set $P482, $I488
    goto if_483_end
  if_483:
    .const 'Sub' $P490 = "49_1256214686.79251" 
    capture_lex $P490
    $P492 = $P490()
    set $P482, $P492
  if_483_end:
    .return ($P482)
.end


.namespace ["String"]
.sub "_block477"  :anon :subid("48_1256214686.79251") :outer("47_1256214686.79251")
    find_lex $P479, "$limit"
    unless_null $P479, vivify_207
    new $P479, "Undef"
  vivify_207:
    find_lex $P480, "$len"
    unless_null $P480, vivify_208
    new $P480, "Undef"
  vivify_208:
    add $P481, $P479, $P480
    store_lex "$limit", $P481
    .return ($P481)
.end


.namespace ["String"]
.sub "_block489"  :anon :subid("49_1256214686.79251") :outer("47_1256214686.79251")
    find_lex $P491, "$len"
    unless_null $P491, vivify_211
    new $P491, "Undef"
  vivify_211:
    store_lex "$limit", $P491
    .return ($P491)
.end


.namespace ["String"]
.sub "trim"  :subid("50_1256214686.79251") :method :outer("11_1256214686.79251")
    .const 'Sub' $P512 = "51_1256214686.79251" 
    capture_lex $P512
    new $P499, 'ExceptionHandler'
    set_addr $P499, control_498
    $P499."handle_types"(58)
    push_eh $P499
    .lex "self", self
    new $P500, "String"
    assign $P500, ""
    .lex "$result", $P500
    find_lex $P501, "self"
    $P502 = "find_not_cclass"("WHITESPACE", $P501)
    .lex "$left", $P502
    find_lex $P503, "self"
    $P504 = "length"($P503)
    .lex "$len", $P504
    find_lex $P506, "$left"
    unless_null $P506, vivify_213
    new $P506, "Undef"
  vivify_213:
    set $N507, $P506
    find_lex $P508, "$len"
    unless_null $P508, vivify_214
    new $P508, "Undef"
  vivify_214:
    set $N509, $P508
    islt $I510, $N507, $N509
    unless $I510, if_505_end
    .const 'Sub' $P512 = "51_1256214686.79251" 
    capture_lex $P512
    $P512()
  if_505_end:
    new $P532, "Exception"
    set $P532['type'], 58
    find_lex $P533, "$result"
    unless_null $P533, vivify_221
    new $P533, "Undef"
  vivify_221:
    setattribute $P532, 'payload', $P533
    throw $P532
    .return ()
  control_498:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P534, exception, "payload"
    .return ($P534)
    rethrow exception
.end


.namespace ["String"]
.sub "_block511"  :anon :subid("51_1256214686.79251") :outer("50_1256214686.79251")
    .const 'Sub' $P519 = "52_1256214686.79251" 
    capture_lex $P519
    find_lex $P513, "$len"
    unless_null $P513, vivify_215
    new $P513, "Undef"
  vivify_215:
    sub $P514, $P513, 1
    .lex "$right", $P514
    new $P523, 'ExceptionHandler'
    set_addr $P523, loop522_handler
    $P523."handle_types"(65, 67, 66)
    push_eh $P523
  loop522_test:
    find_lex $P515, "self"
    find_lex $P516, "$right"
    unless_null $P516, vivify_216
    new $P516, "Undef"
  vivify_216:
    $P517 = "is_cclass"("WHITESPACE", $P515, $P516 :named("offset"))
    unless $P517, loop522_done
  loop522_redo:
    .const 'Sub' $P519 = "52_1256214686.79251" 
    capture_lex $P519
    $P519()
  loop522_next:
    goto loop522_test
  loop522_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P524, exception, 'type'
    eq $P524, 65, loop522_next
    eq $P524, 67, loop522_redo
  loop522_done:
    pop_eh 
    find_lex $P525, "self"
    find_lex $P526, "$left"
    unless_null $P526, vivify_218
    new $P526, "Undef"
  vivify_218:
    find_lex $P527, "$right"
    unless_null $P527, vivify_219
    new $P527, "Undef"
  vivify_219:
    find_lex $P528, "$left"
    unless_null $P528, vivify_220
    new $P528, "Undef"
  vivify_220:
    sub $P529, $P527, $P528
    add $P530, $P529, 1
    $P531 = "substr"($P525, $P526, $P530)
    store_lex "$result", $P531
    .return ($P531)
.end


.namespace ["String"]
.sub "_block518"  :anon :subid("52_1256214686.79251") :outer("51_1256214686.79251")
    find_lex $P520, "$right"
    unless_null $P520, vivify_217
    new $P520, "Undef"
  vivify_217:
        ##  inline postfix:--
        clone $P521, $P520
        dec $P520
    .return ($P521)
.end

# Nothing here yet.
