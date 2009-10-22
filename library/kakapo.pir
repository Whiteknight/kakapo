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
.sub "_block11"  :anon :subid("10_1256214657.25207")
    get_hll_global $P14, ["Array"], "_block13" 
    .return ($P14)
.end


.namespace ["Array"]
.sub "_block13" :init :load :subid("11_1256214657.25207")
    .const 'Sub' $P366 = "45_1256214657.25207" 
    capture_lex $P366
    .const 'Sub' $P345 = "43_1256214657.25207" 
    capture_lex $P345
    .const 'Sub' $P338 = "42_1256214657.25207" 
    capture_lex $P338
    .const 'Sub' $P312 = "40_1256214657.25207" 
    capture_lex $P312
    .const 'Sub' $P305 = "39_1256214657.25207" 
    capture_lex $P305
    .const 'Sub' $P299 = "38_1256214657.25207" 
    capture_lex $P299
    .const 'Sub' $P272 = "35_1256214657.25207" 
    capture_lex $P272
    .const 'Sub' $P241 = "32_1256214657.25207" 
    capture_lex $P241
    .const 'Sub' $P214 = "29_1256214657.25207" 
    capture_lex $P214
    .const 'Sub' $P93 = "20_1256214657.25207" 
    capture_lex $P93
    .const 'Sub' $P60 = "17_1256214657.25207" 
    capture_lex $P60
    .const 'Sub' $P36 = "14_1256214657.25207" 
    capture_lex $P36
    .const 'Sub' $P26 = "13_1256214657.25207" 
    capture_lex $P26
    .const 'Sub' $P16 = "12_1256214657.25207" 
    capture_lex $P16
    get_hll_global $P15, ["Parrot"], "IMPORT"
    $P15("Dumper")
    get_global $P84, "%Bsearch_compare_func"
    unless_null $P84, vivify_73
    new $P84, "Hash"
  vivify_73:
    get_hll_global $P85, ["Array"], "cmp_numeric"
    get_global $P86, "%Bsearch_compare_func"
    unless_null $P86, vivify_74
    new $P86, "Hash"
    set_global "%Bsearch_compare_func", $P86
  vivify_74:
    set $P86["<=>"], $P85
    get_hll_global $P87, ["Array"], "cmp_numeric_R"
    get_global $P88, "%Bsearch_compare_func"
    unless_null $P88, vivify_75
    new $P88, "Hash"
    set_global "%Bsearch_compare_func", $P88
  vivify_75:
    set $P88["R<=>"], $P87
    get_hll_global $P89, ["Array"], "cmp_string"
    get_global $P90, "%Bsearch_compare_func"
    unless_null $P90, vivify_76
    new $P90, "Hash"
    set_global "%Bsearch_compare_func", $P90
  vivify_76:
    set $P90["cmp"], $P89
    get_hll_global $P91, ["Array"], "cmp_string_R"
    get_global $P92, "%Bsearch_compare_func"
    unless_null $P92, vivify_77
    new $P92, "Hash"
    set_global "%Bsearch_compare_func", $P92
  vivify_77:
    set $P92["Rcmp"], $P91
    get_hll_global $P462, ["ResizableStringArray"], "_block461" 
    .return ($P462)
.end


.namespace ["Array"]
.sub "cmp_numeric"  :subid("12_1256214657.25207") :outer("11_1256214657.25207")
    .param pmc param_19
    .param pmc param_20
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(58)
    push_eh $P18
    .lex "$a", param_19
    .lex "$b", param_20
    new $P21, "Exception"
    set $P21['type'], 58
    find_lex $P22, "$b"
    unless_null $P22, vivify_65
    new $P22, "Undef"
  vivify_65:
    find_lex $P23, "$a"
    unless_null $P23, vivify_66
    new $P23, "Undef"
  vivify_66:
    sub $P24, $P22, $P23
    setattribute $P21, 'payload', $P24
    throw $P21
    .return ()
  control_17:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P25, exception, "payload"
    .return ($P25)
    rethrow exception
.end


.namespace ["Array"]
.sub "cmp_numeric_R"  :subid("13_1256214657.25207") :outer("11_1256214657.25207")
    .param pmc param_29
    .param pmc param_30
    new $P28, 'ExceptionHandler'
    set_addr $P28, control_27
    $P28."handle_types"(58)
    push_eh $P28
    .lex "$a", param_29
    .lex "$b", param_30
    new $P31, "Exception"
    set $P31['type'], 58
    find_lex $P32, "$a"
    unless_null $P32, vivify_67
    new $P32, "Undef"
  vivify_67:
    find_lex $P33, "$b"
    unless_null $P33, vivify_68
    new $P33, "Undef"
  vivify_68:
    sub $P34, $P32, $P33
    setattribute $P31, 'payload', $P34
    throw $P31
    .return ()
  control_27:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P35, exception, "payload"
    .return ($P35)
    rethrow exception
.end


.namespace ["Array"]
.sub "cmp_string"  :subid("14_1256214657.25207") :outer("11_1256214657.25207")
    .param pmc param_39
    .param pmc param_40
    .const 'Sub' $P55 = "16_1256214657.25207" 
    capture_lex $P55
    .const 'Sub' $P49 = "15_1256214657.25207" 
    capture_lex $P49
    new $P38, 'ExceptionHandler'
    set_addr $P38, control_37
    $P38."handle_types"(58)
    push_eh $P38
    .lex "$a", param_39
    .lex "$b", param_40
    find_lex $P43, "$a"
    unless_null $P43, vivify_69
    new $P43, "Undef"
  vivify_69:
    set $S44, $P43
    find_lex $P45, "$b"
    unless_null $P45, vivify_70
    new $P45, "Undef"
  vivify_70:
    set $S46, $P45
    islt $I47, $S44, $S46
    if $I47, if_42
    .const 'Sub' $P55 = "16_1256214657.25207" 
    capture_lex $P55
    $P58 = $P55()
    set $P41, $P58
    goto if_42_end
  if_42:
    .const 'Sub' $P49 = "15_1256214657.25207" 
    capture_lex $P49
    $P53 = $P49()
    set $P41, $P53
  if_42_end:
    .return ($P41)
  control_37:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P59, exception, "payload"
    .return ($P59)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block54"  :anon :subid("16_1256214657.25207") :outer("14_1256214657.25207")
    new $P56, "Exception"
    set $P56['type'], 58
    new $P57, "Integer"
    assign $P57, 1
    setattribute $P56, 'payload', $P57
    throw $P56
    .return ()
.end


.namespace ["Array"]
.sub "_block48"  :anon :subid("15_1256214657.25207") :outer("14_1256214657.25207")
    new $P50, "Exception"
    set $P50['type'], 58
    new $P51, "Integer"
    assign $P51, 1
    neg $P52, $P51
    setattribute $P50, 'payload', $P52
    throw $P50
    .return ()
.end


.namespace ["Array"]
.sub "cmp_string_R"  :subid("17_1256214657.25207") :outer("11_1256214657.25207")
    .param pmc param_63
    .param pmc param_64
    .const 'Sub' $P79 = "19_1256214657.25207" 
    capture_lex $P79
    .const 'Sub' $P73 = "18_1256214657.25207" 
    capture_lex $P73
    new $P62, 'ExceptionHandler'
    set_addr $P62, control_61
    $P62."handle_types"(58)
    push_eh $P62
    .lex "$a", param_63
    .lex "$b", param_64
    find_lex $P67, "$b"
    unless_null $P67, vivify_71
    new $P67, "Undef"
  vivify_71:
    set $S68, $P67
    find_lex $P69, "$a"
    unless_null $P69, vivify_72
    new $P69, "Undef"
  vivify_72:
    set $S70, $P69
    islt $I71, $S68, $S70
    if $I71, if_66
    .const 'Sub' $P79 = "19_1256214657.25207" 
    capture_lex $P79
    $P82 = $P79()
    set $P65, $P82
    goto if_66_end
  if_66:
    .const 'Sub' $P73 = "18_1256214657.25207" 
    capture_lex $P73
    $P77 = $P73()
    set $P65, $P77
  if_66_end:
    .return ($P65)
  control_61:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P83, exception, "payload"
    .return ($P83)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block78"  :anon :subid("19_1256214657.25207") :outer("17_1256214657.25207")
    new $P80, "Exception"
    set $P80['type'], 58
    new $P81, "Integer"
    assign $P81, 1
    setattribute $P80, 'payload', $P81
    throw $P80
    .return ()
.end


.namespace ["Array"]
.sub "_block72"  :anon :subid("18_1256214657.25207") :outer("17_1256214657.25207")
    new $P74, "Exception"
    set $P74['type'], 58
    new $P75, "Integer"
    assign $P75, 1
    neg $P76, $P75
    setattribute $P74, 'payload', $P76
    throw $P74
    .return ()
.end


.namespace ["Array"]
.sub "bsearch"  :subid("20_1256214657.25207") :outer("11_1256214657.25207")
    .param pmc param_96
    .param pmc param_97
    .param pmc param_98 :slurpy :named
    .const 'Sub' $P208 = "28_1256214657.25207" 
    capture_lex $P208
    .const 'Sub' $P160 = "25_1256214657.25207" 
    capture_lex $P160
    .const 'Sub' $P149 = "24_1256214657.25207" 
    capture_lex $P149
    .const 'Sub' $P140 = "23_1256214657.25207" 
    capture_lex $P140
    .const 'Sub' $P130 = "22_1256214657.25207" 
    capture_lex $P130
    .const 'Sub' $P112 = "21_1256214657.25207" 
    capture_lex $P112
    new $P95, 'ExceptionHandler'
    set_addr $P95, control_94
    $P95."handle_types"(58)
    push_eh $P95
    .lex "@array", param_96
    .lex "$value", param_97
    .lex "%adverbs", param_98
    find_lex $P99, "@array"
    unless_null $P99, vivify_78
    new $P99, "ResizablePMCArray"
  vivify_78:
    "DUMP"($P99 :named("array"))
    find_lex $P100, "$value"
    unless_null $P100, vivify_79
    new $P100, "Undef"
  vivify_79:
    "NOTE"("bsearch: for value ", $P100)
    new $P101, "Integer"
    assign $P101, 0
    find_lex $P102, "%adverbs"
    unless_null $P102, vivify_80
    new $P102, "Hash"
  vivify_80:
    set $P103, $P102["low"]
    unless_null $P103, vivify_81
    new $P103, "Undef"
  vivify_81:
    add $P104, $P101, $P103
    .lex "$low", $P104
    find_lex $P106, "$low"
    unless_null $P106, vivify_82
    new $P106, "Undef"
  vivify_82:
    set $N107, $P106
    new $P108, "Integer"
    assign $P108, 0
    set $N109, $P108
    islt $I110, $N107, $N109
    unless $I110, if_105_end
    .const 'Sub' $P112 = "21_1256214657.25207" 
    capture_lex $P112
    $P112()
  if_105_end:
    find_lex $P116, "$low"
    unless_null $P116, vivify_85
    new $P116, "Undef"
  vivify_85:
    "NOTE"("low end: ", $P116)
    find_lex $P117, "@array"
    unless_null $P117, vivify_86
    new $P117, "ResizablePMCArray"
  vivify_86:
    set $N118, $P117
    new $P119, 'Float'
    set $P119, $N118
    find_lex $P120, "%adverbs"
    unless_null $P120, vivify_87
    new $P120, "Hash"
  vivify_87:
    set $P121, $P120["high"]
    unless_null $P121, vivify_88
    new $P121, "Undef"
  vivify_88:
    add $P122, $P119, $P121
    .lex "$high", $P122
    find_lex $P124, "$high"
    unless_null $P124, vivify_89
    new $P124, "Undef"
  vivify_89:
    set $N125, $P124
    find_lex $P126, "@array"
    unless_null $P126, vivify_90
    new $P126, "ResizablePMCArray"
  vivify_90:
    set $N127, $P126
    isgt $I128, $N125, $N127
    unless $I128, if_123_end
    .const 'Sub' $P130 = "22_1256214657.25207" 
    capture_lex $P130
    $P130()
  if_123_end:
    find_lex $P133, "$high"
    unless_null $P133, vivify_93
    new $P133, "Undef"
  vivify_93:
    "NOTE"("high end: ", $P133)
    find_lex $P134, "$high"
    unless_null $P134, vivify_94
    new $P134, "Undef"
  vivify_94:
    .lex "$top", $P134
    new $P135, "String"
    assign $P135, "=="
    .lex "$cmp", $P135
    find_lex $P137, "%adverbs"
    unless_null $P137, vivify_95
    new $P137, "Hash"
  vivify_95:
    set $P138, $P137["cmp"]
    unless_null $P138, vivify_96
    new $P138, "Undef"
  vivify_96:
    unless $P138, if_136_end
    .const 'Sub' $P140 = "23_1256214657.25207" 
    capture_lex $P140
    $P140()
  if_136_end:
    find_lex $P143, "$cmp"
    unless_null $P143, vivify_99
    new $P143, "Undef"
  vivify_99:
    get_global $P144, "%Bsearch_compare_func"
    unless_null $P144, vivify_100
    new $P144, "Hash"
  vivify_100:
    set $P145, $P144[$P143]
    unless_null $P145, vivify_101
    new $P145, "Undef"
  vivify_101:
    .lex "&compare", $P145
    find_lex $P147, "&compare"
    unless_null $P147, vivify_102
    new $P147, "Undef"
  vivify_102:
    if $P147, unless_146_end
    .const 'Sub' $P149 = "24_1256214657.25207" 
    capture_lex $P149
    $P149()
  unless_146_end:
    find_lex $P152, "&compare"
    unless_null $P152, vivify_105
    new $P152, "Undef"
  vivify_105:
    "NOTE"("Compare function is: ", $P152)
    new $P153, "Undef"
    .lex "$mid", $P153
    new $P184, 'ExceptionHandler'
    set_addr $P184, loop183_handler
    $P184."handle_types"(65, 67, 66)
    push_eh $P184
  loop183_test:
    find_lex $P154, "$low"
    unless_null $P154, vivify_106
    new $P154, "Undef"
  vivify_106:
    set $N155, $P154
    find_lex $P156, "$high"
    unless_null $P156, vivify_107
    new $P156, "Undef"
  vivify_107:
    set $N157, $P156
    islt $I158, $N155, $N157
    unless $I158, loop183_done
  loop183_redo:
    .const 'Sub' $P160 = "25_1256214657.25207" 
    capture_lex $P160
    $P160()
  loop183_next:
    goto loop183_test
  loop183_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P185, exception, 'type'
    eq $P185, 65, loop183_next
    eq $P185, 67, loop183_redo
  loop183_done:
    pop_eh 
    find_lex $P186, "$low"
    unless_null $P186, vivify_115
    new $P186, "Undef"
  vivify_115:
    add $P187, $P186, 1
    neg $P188, $P187
    .lex "$result", $P188
    find_lex $P192, "$low"
    unless_null $P192, vivify_116
    new $P192, "Undef"
  vivify_116:
    set $N193, $P192
    find_lex $P194, "$top"
    unless_null $P194, vivify_117
    new $P194, "Undef"
  vivify_117:
    set $N195, $P194
    islt $I196, $N193, $N195
    if $I196, if_191
    new $P190, 'Integer'
    set $P190, $I196
    goto if_191_end
  if_191:
    find_lex $P197, "&compare"
    unless_null $P197, vivify_118
    new $P197, "Undef"
  vivify_118:
    find_lex $P198, "$mid"
    unless_null $P198, vivify_119
    new $P198, "Undef"
  vivify_119:
    set $I199, $P198
    find_lex $P200, "@array"
    unless_null $P200, vivify_120
    new $P200, "ResizablePMCArray"
  vivify_120:
    set $P201, $P200[$I199]
    unless_null $P201, vivify_121
    new $P201, "Undef"
  vivify_121:
    find_lex $P202, "$value"
    unless_null $P202, vivify_122
    new $P202, "Undef"
  vivify_122:
    $N203 = $P197($P201, $P202)
    new $P204, "Integer"
    assign $P204, 0
    set $N205, $P204
    iseq $I206, $N203, $N205
    new $P190, 'Integer'
    set $P190, $I206
  if_191_end:
    unless $P190, if_189_end
    .const 'Sub' $P208 = "28_1256214657.25207" 
    capture_lex $P208
    $P208()
  if_189_end:
    find_lex $P210, "$result"
    unless_null $P210, vivify_124
    new $P210, "Undef"
  vivify_124:
    "NOTE"("Returning ", $P210)
    new $P211, "Exception"
    set $P211['type'], 58
    find_lex $P212, "$result"
    unless_null $P212, vivify_125
    new $P212, "Undef"
  vivify_125:
    setattribute $P211, 'payload', $P212
    throw $P211
    .return ()
  control_94:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P213, exception, "payload"
    .return ($P213)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block111"  :anon :subid("21_1256214657.25207") :outer("20_1256214657.25207")
    find_lex $P113, "$low"
    unless_null $P113, vivify_83
    new $P113, "Undef"
  vivify_83:
    find_lex $P114, "@array"
    unless_null $P114, vivify_84
    new $P114, "ResizablePMCArray"
  vivify_84:
    add $P115, $P113, $P114
    store_lex "$low", $P115
    .return ($P115)
.end


.namespace ["Array"]
.sub "_block129"  :anon :subid("22_1256214657.25207") :outer("20_1256214657.25207")
    find_lex $P131, "%adverbs"
    unless_null $P131, vivify_91
    new $P131, "Hash"
  vivify_91:
    set $P132, $P131["high"]
    unless_null $P132, vivify_92
    new $P132, "Undef"
  vivify_92:
    store_lex "$high", $P132
    .return ($P132)
.end


.namespace ["Array"]
.sub "_block139"  :anon :subid("23_1256214657.25207") :outer("20_1256214657.25207")
    find_lex $P141, "%adverbs"
    unless_null $P141, vivify_97
    new $P141, "Hash"
  vivify_97:
    set $P142, $P141["cmp"]
    unless_null $P142, vivify_98
    new $P142, "Undef"
  vivify_98:
    store_lex "$cmp", $P142
    .return ($P142)
.end


.namespace ["Array"]
.sub "_block148"  :anon :subid("24_1256214657.25207") :outer("20_1256214657.25207")
    find_lex $P150, "%adverbs"
    unless_null $P150, vivify_103
    new $P150, "Hash"
  vivify_103:
    set $P151, $P150["cmp"]
    unless_null $P151, vivify_104
    new $P151, "Undef"
  vivify_104:
    store_lex "&compare", $P151
    .return ($P151)
.end


.namespace ["Array"]
.sub "_block159"  :anon :subid("25_1256214657.25207") :outer("20_1256214657.25207")
    .const 'Sub' $P180 = "27_1256214657.25207" 
    capture_lex $P180
    .const 'Sub' $P175 = "26_1256214657.25207" 
    capture_lex $P175

			.local int high, low
			$P0 = find_lex '$high'
			high = $P0
			$P0 = find_lex '$low'
			low = $P0
			$I0 = high - low
			$I0 = $I0 / 2
			$I0 = $I0 + low
			$P161 = box $I0
		
    store_lex "$mid", $P161
    find_lex $P164, "&compare"
    unless_null $P164, vivify_108
    new $P164, "Undef"
  vivify_108:
    find_lex $P165, "$value"
    unless_null $P165, vivify_109
    new $P165, "Undef"
  vivify_109:
    find_lex $P166, "$mid"
    unless_null $P166, vivify_110
    new $P166, "Undef"
  vivify_110:
    set $I167, $P166
    find_lex $P168, "@array"
    unless_null $P168, vivify_111
    new $P168, "ResizablePMCArray"
  vivify_111:
    set $P169, $P168[$I167]
    unless_null $P169, vivify_112
    new $P169, "Undef"
  vivify_112:
    $N170 = $P164($P165, $P169)
    new $P171, "Integer"
    assign $P171, 0
    set $N172, $P171
    islt $I173, $N170, $N172
    if $I173, if_163
    .const 'Sub' $P180 = "27_1256214657.25207" 
    capture_lex $P180
    $P182 = $P180()
    set $P162, $P182
    goto if_163_end
  if_163:
    .const 'Sub' $P175 = "26_1256214657.25207" 
    capture_lex $P175
    $P178 = $P175()
    set $P162, $P178
  if_163_end:
    .return ($P162)
.end


.namespace ["Array"]
.sub "_block179"  :anon :subid("27_1256214657.25207") :outer("25_1256214657.25207")
    find_lex $P181, "$mid"
    unless_null $P181, vivify_113
    new $P181, "Undef"
  vivify_113:
    store_lex "$high", $P181
    .return ($P181)
.end


.namespace ["Array"]
.sub "_block174"  :anon :subid("26_1256214657.25207") :outer("25_1256214657.25207")
    find_lex $P176, "$mid"
    unless_null $P176, vivify_114
    new $P176, "Undef"
  vivify_114:
    add $P177, $P176, 1
    store_lex "$low", $P177
    .return ($P177)
.end


.namespace ["Array"]
.sub "_block207"  :anon :subid("28_1256214657.25207") :outer("20_1256214657.25207")
    find_lex $P209, "$low"
    unless_null $P209, vivify_123
    new $P209, "Undef"
  vivify_123:
    store_lex "$result", $P209
    .return ($P209)
.end


.namespace ["Array"]
.sub "clone"  :subid("29_1256214657.25207") :outer("11_1256214657.25207")
    .param pmc param_217
    .const 'Sub' $P224 = "30_1256214657.25207" 
    capture_lex $P224
    new $P216, 'ExceptionHandler'
    set_addr $P216, control_215
    $P216."handle_types"(58)
    push_eh $P216
    .lex "@original", param_217
    get_hll_global $P218, ["Array"], "empty"
    $P219 = $P218()
    .lex "@clone", $P219
    find_lex $P221, "@original"
    unless_null $P221, vivify_126
    new $P221, "ResizablePMCArray"
  vivify_126:
    set $N222, $P221
    unless $N222, if_220_end
    .const 'Sub' $P224 = "30_1256214657.25207" 
    capture_lex $P224
    $P224()
  if_220_end:
    new $P238, "Exception"
    set $P238['type'], 58
    find_lex $P239, "@clone"
    unless_null $P239, vivify_131
    new $P239, "ResizablePMCArray"
  vivify_131:
    setattribute $P238, 'payload', $P239
    throw $P238
    .return ()
  control_215:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P240, exception, "payload"
    .return ($P240)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block223"  :anon :subid("30_1256214657.25207") :outer("29_1256214657.25207")
    .const 'Sub' $P230 = "31_1256214657.25207" 
    capture_lex $P230
    find_lex $P226, "@original"
    unless_null $P226, vivify_127
    new $P226, "ResizablePMCArray"
  vivify_127:
    defined $I227, $P226
    unless $I227, for_undef_128
    iter $P225, $P226
    new $P236, 'ExceptionHandler'
    set_addr $P236, loop235_handler
    $P236."handle_types"(65, 67, 66)
    push_eh $P236
  loop235_test:
    unless $P225, loop235_done
    shift $P228, $P225
  loop235_redo:
    .const 'Sub' $P230 = "31_1256214657.25207" 
    capture_lex $P230
    $P230($P228)
  loop235_next:
    goto loop235_test
  loop235_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P237, exception, 'type'
    eq $P237, 65, loop235_next
    eq $P237, 67, loop235_redo
  loop235_done:
    pop_eh 
  for_undef_128:
    .return ($P225)
.end


.namespace ["Array"]
.sub "_block229"  :anon :subid("31_1256214657.25207") :outer("30_1256214657.25207")
    .param pmc param_231
    .lex "$_", param_231
    find_lex $P232, "@clone"
    unless_null $P232, vivify_129
    new $P232, "ResizablePMCArray"
  vivify_129:
    find_lex $P233, "$_"
    unless_null $P233, vivify_130
    new $P233, "Undef"
  vivify_130:
    $P234 = $P232."push"($P233)
    .return ($P234)
.end


.namespace ["Array"]
.sub "concat"  :subid("32_1256214657.25207") :outer("11_1256214657.25207")
    .param pmc param_244 :slurpy
    .const 'Sub' $P251 = "33_1256214657.25207" 
    capture_lex $P251
    new $P243, 'ExceptionHandler'
    set_addr $P243, control_242
    $P243."handle_types"(58)
    push_eh $P243
    .lex "@sources", param_244
    $P245 = "empty"()
    .lex "@result", $P245
    find_lex $P247, "@sources"
    unless_null $P247, vivify_132
    new $P247, "ResizablePMCArray"
  vivify_132:
    defined $I248, $P247
    unless $I248, for_undef_133
    iter $P246, $P247
    new $P267, 'ExceptionHandler'
    set_addr $P267, loop266_handler
    $P267."handle_types"(65, 67, 66)
    push_eh $P267
  loop266_test:
    unless $P246, loop266_done
    shift $P249, $P246
  loop266_redo:
    .const 'Sub' $P251 = "33_1256214657.25207" 
    capture_lex $P251
    $P251($P249)
  loop266_next:
    goto loop266_test
  loop266_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P268, exception, 'type'
    eq $P268, 65, loop266_next
    eq $P268, 67, loop266_redo
  loop266_done:
    pop_eh 
  for_undef_133:
    new $P269, "Exception"
    set $P269['type'], 58
    find_lex $P270, "@result"
    unless_null $P270, vivify_138
    new $P270, "ResizablePMCArray"
  vivify_138:
    setattribute $P269, 'payload', $P270
    throw $P269
    .return ()
  control_242:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P271, exception, "payload"
    .return ($P271)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block250"  :anon :subid("33_1256214657.25207") :outer("32_1256214657.25207")
    .param pmc param_252
    .const 'Sub' $P258 = "34_1256214657.25207" 
    capture_lex $P258
    .lex "$_", param_252
    find_lex $P254, "$_"
    unless_null $P254, vivify_134
    new $P254, "Undef"
  vivify_134:
    defined $I255, $P254
    unless $I255, for_undef_135
    iter $P253, $P254
    new $P264, 'ExceptionHandler'
    set_addr $P264, loop263_handler
    $P264."handle_types"(65, 67, 66)
    push_eh $P264
  loop263_test:
    unless $P253, loop263_done
    shift $P256, $P253
  loop263_redo:
    .const 'Sub' $P258 = "34_1256214657.25207" 
    capture_lex $P258
    $P258($P256)
  loop263_next:
    goto loop263_test
  loop263_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P265, exception, 'type'
    eq $P265, 65, loop263_next
    eq $P265, 67, loop263_redo
  loop263_done:
    pop_eh 
  for_undef_135:
    .return ($P253)
.end


.namespace ["Array"]
.sub "_block257"  :anon :subid("34_1256214657.25207") :outer("33_1256214657.25207")
    .param pmc param_259
    .lex "$_", param_259
    find_lex $P260, "@result"
    unless_null $P260, vivify_136
    new $P260, "ResizablePMCArray"
  vivify_136:
    find_lex $P261, "$_"
    unless_null $P261, vivify_137
    new $P261, "Undef"
  vivify_137:
    $P262 = $P260."push"($P261)
    .return ($P262)
.end


.namespace ["Array"]
.sub "contains"  :subid("35_1256214657.25207") :method :outer("11_1256214657.25207")
    .param pmc param_275
    .const 'Sub' $P281 = "36_1256214657.25207" 
    capture_lex $P281
    new $P274, 'ExceptionHandler'
    set_addr $P274, control_273
    $P274."handle_types"(58)
    push_eh $P274
    .lex "self", self
    .lex "$item", param_275
    find_lex $P277, "self"
    defined $I278, $P277
    unless $I278, for_undef_139
    iter $P276, $P277
    new $P294, 'ExceptionHandler'
    set_addr $P294, loop293_handler
    $P294."handle_types"(65, 67, 66)
    push_eh $P294
  loop293_test:
    unless $P276, loop293_done
    shift $P279, $P276
  loop293_redo:
    .const 'Sub' $P281 = "36_1256214657.25207" 
    capture_lex $P281
    $P281($P279)
  loop293_next:
    goto loop293_test
  loop293_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P295, exception, 'type'
    eq $P295, 65, loop293_next
    eq $P295, 67, loop293_redo
  loop293_done:
    pop_eh 
  for_undef_139:
    new $P296, "Exception"
    set $P296['type'], 58
    new $P297, "Integer"
    assign $P297, 0
    setattribute $P296, 'payload', $P297
    throw $P296
    .return ()
  control_273:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P298, exception, "payload"
    .return ($P298)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block280"  :anon :subid("36_1256214657.25207") :outer("35_1256214657.25207")
    .param pmc param_282
    .const 'Sub' $P289 = "37_1256214657.25207" 
    capture_lex $P289
    .lex "$_", param_282
    find_lex $P285, "$_"
    unless_null $P285, vivify_140
    new $P285, "Undef"
  vivify_140:
    find_lex $P286, "$item"
    unless_null $P286, vivify_141
    new $P286, "Undef"
  vivify_141:
    issame $I287, $P285, $P286
    if $I287, if_284
    new $P283, 'Integer'
    set $P283, $I287
    goto if_284_end
  if_284:
    .const 'Sub' $P289 = "37_1256214657.25207" 
    capture_lex $P289
    $P292 = $P289()
    set $P283, $P292
  if_284_end:
    .return ($P283)
.end


.namespace ["Array"]
.sub "_block288"  :anon :subid("37_1256214657.25207") :outer("36_1256214657.25207")
    new $P290, "Exception"
    set $P290['type'], 58
    new $P291, "Integer"
    assign $P291, 1
    setattribute $P290, 'payload', $P291
    throw $P290
    .return ()
.end


.namespace ["Array"]
.sub "delete"  :subid("38_1256214657.25207") :outer("11_1256214657.25207")
    .param pmc param_302
    .param pmc param_303
    new $P301, 'ExceptionHandler'
    set_addr $P301, control_300
    $P301."handle_types"(58)
    push_eh $P301
    .lex "@array", param_302
    .lex "$index", param_303

		$P0 = find_lex '@array'
		$P1 = find_lex '$index'
		$I0 = $P1
		delete $P0[$I0]
	
    .return ()
  control_300:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P304, exception, "payload"
    .return ($P304)
    rethrow exception
.end


.namespace ["Array"]
.sub "empty"  :subid("39_1256214657.25207") :outer("11_1256214657.25207")
    new $P307, 'ExceptionHandler'
    set_addr $P307, control_306
    $P307."handle_types"(58)
    push_eh $P307
 $P308 = new 'ResizablePMCArray' 
    .lex "@empty", $P308
    new $P309, "Exception"
    set $P309['type'], 58
    find_lex $P310, "@empty"
    unless_null $P310, vivify_142
    new $P310, "ResizablePMCArray"
  vivify_142:
    setattribute $P309, 'payload', $P310
    throw $P309
    .return ()
  control_306:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P311, exception, "payload"
    .return ($P311)
    rethrow exception
.end


.namespace ["Array"]
.sub "join"  :subid("40_1256214657.25207") :outer("11_1256214657.25207")
    .param pmc param_315
    .param pmc param_316
    .const 'Sub' $P324 = "41_1256214657.25207" 
    capture_lex $P324
    new $P314, 'ExceptionHandler'
    set_addr $P314, control_313
    $P314."handle_types"(58)
    push_eh $P314
    .lex "$_delim", param_315
    .lex "@parts", param_316
    "BACKTRACE"()
    new $P317, "String"
    assign $P317, ""
    .lex "$result", $P317
    new $P318, "String"
    assign $P318, ""
    .lex "$delim", $P318
    find_lex $P320, "@parts"
    unless_null $P320, vivify_143
    new $P320, "ResizablePMCArray"
  vivify_143:
    defined $I321, $P320
    unless $I321, for_undef_144
    iter $P319, $P320
    new $P333, 'ExceptionHandler'
    set_addr $P333, loop332_handler
    $P333."handle_types"(65, 67, 66)
    push_eh $P333
  loop332_test:
    unless $P319, loop332_done
    shift $P322, $P319
  loop332_redo:
    .const 'Sub' $P324 = "41_1256214657.25207" 
    capture_lex $P324
    $P324($P322)
  loop332_next:
    goto loop332_test
  loop332_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P334, exception, 'type'
    eq $P334, 65, loop332_next
    eq $P334, 67, loop332_redo
  loop332_done:
    pop_eh 
  for_undef_144:
    new $P335, "Exception"
    set $P335['type'], 58
    find_lex $P336, "$result"
    unless_null $P336, vivify_149
    new $P336, "Undef"
  vivify_149:
    setattribute $P335, 'payload', $P336
    throw $P335
    .return ()
  control_313:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P337, exception, "payload"
    .return ($P337)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block323"  :anon :subid("41_1256214657.25207") :outer("40_1256214657.25207")
    .param pmc param_325
    .lex "$_", param_325
    find_lex $P326, "$result"
    unless_null $P326, vivify_145
    new $P326, "Undef"
  vivify_145:
    find_lex $P327, "$delim"
    unless_null $P327, vivify_146
    new $P327, "Undef"
  vivify_146:
    concat $P328, $P326, $P327
    find_lex $P329, "$_"
    unless_null $P329, vivify_147
    new $P329, "Undef"
  vivify_147:
    concat $P330, $P328, $P329
    store_lex "$result", $P330
    find_lex $P331, "$_delim"
    unless_null $P331, vivify_148
    new $P331, "Undef"
  vivify_148:
    store_lex "$delim", $P331
    .return ($P331)
.end


.namespace ["Array"]
.sub "new"  :subid("42_1256214657.25207") :outer("11_1256214657.25207")
    .param pmc param_341 :slurpy
    new $P340, 'ExceptionHandler'
    set_addr $P340, control_339
    $P340."handle_types"(58)
    push_eh $P340
    .lex "@elements", param_341
    new $P342, "Exception"
    set $P342['type'], 58
    find_lex $P343, "@elements"
    unless_null $P343, vivify_150
    new $P343, "ResizablePMCArray"
  vivify_150:
    setattribute $P342, 'payload', $P343
    throw $P342
    .return ()
  control_339:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P344, exception, "payload"
    .return ($P344)
    rethrow exception
.end


.namespace ["Array"]
.sub "reverse"  :subid("43_1256214657.25207") :outer("11_1256214657.25207")
    .param pmc param_348
    .const 'Sub' $P355 = "44_1256214657.25207" 
    capture_lex $P355
    new $P347, 'ExceptionHandler'
    set_addr $P347, control_346
    $P347."handle_types"(58)
    push_eh $P347
    .lex "@original", param_348
    $P349 = "empty"()
    .lex "@result", $P349
    find_lex $P351, "@original"
    unless_null $P351, vivify_151
    new $P351, "ResizablePMCArray"
  vivify_151:
    defined $I352, $P351
    unless $I352, for_undef_152
    iter $P350, $P351
    new $P361, 'ExceptionHandler'
    set_addr $P361, loop360_handler
    $P361."handle_types"(65, 67, 66)
    push_eh $P361
  loop360_test:
    unless $P350, loop360_done
    shift $P353, $P350
  loop360_redo:
    .const 'Sub' $P355 = "44_1256214657.25207" 
    capture_lex $P355
    $P355($P353)
  loop360_next:
    goto loop360_test
  loop360_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P362, exception, 'type'
    eq $P362, 65, loop360_next
    eq $P362, 67, loop360_redo
  loop360_done:
    pop_eh 
  for_undef_152:
    new $P363, "Exception"
    set $P363['type'], 58
    find_lex $P364, "@result"
    unless_null $P364, vivify_155
    new $P364, "ResizablePMCArray"
  vivify_155:
    setattribute $P363, 'payload', $P364
    throw $P363
    .return ()
  control_346:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P365, exception, "payload"
    .return ($P365)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block354"  :anon :subid("44_1256214657.25207") :outer("43_1256214657.25207")
    .param pmc param_356
    .lex "$_", param_356
    find_lex $P357, "@result"
    unless_null $P357, vivify_153
    new $P357, "ResizablePMCArray"
  vivify_153:
    find_lex $P358, "$_"
    unless_null $P358, vivify_154
    new $P358, "Undef"
  vivify_154:
    $P359 = $P357."unshift"($P358)
    .return ($P359)
.end


.namespace ["Array"]
.sub "unique"  :subid("45_1256214657.25207") :outer("11_1256214657.25207")
    .param pmc param_369
    .const 'Sub' $P377 = "46_1256214657.25207" 
    capture_lex $P377
    new $P368, 'ExceptionHandler'
    set_addr $P368, control_367
    $P368."handle_types"(58)
    push_eh $P368
    .lex "@original", param_369
    get_hll_global $P370, ["Array"], "empty"
    $P371 = $P370()
    .lex "@result", $P371
    find_lex $P373, "@original"
    unless_null $P373, vivify_156
    new $P373, "ResizablePMCArray"
  vivify_156:
    defined $I374, $P373
    unless $I374, for_undef_157
    iter $P372, $P373
    new $P410, 'ExceptionHandler'
    set_addr $P410, loop409_handler
    $P410."handle_types"(65, 67, 66)
    push_eh $P410
  loop409_test:
    unless $P372, loop409_done
    shift $P375, $P372
  loop409_redo:
    .const 'Sub' $P377 = "46_1256214657.25207" 
    capture_lex $P377
    $P377($P375)
  loop409_next:
    goto loop409_test
  loop409_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P411, exception, 'type'
    eq $P411, 65, loop409_next
    eq $P411, 67, loop409_redo
  loop409_done:
    pop_eh 
  for_undef_157:
    new $P412, "Exception"
    set $P412['type'], 58
    find_lex $P413, "@result"
    unless_null $P413, vivify_166
    new $P413, "ResizablePMCArray"
  vivify_166:
    setattribute $P412, 'payload', $P413
    throw $P412
    .return ()
  control_367:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P414, exception, "payload"
    .return ($P414)
    rethrow exception
.end


.namespace ["Array"]
.sub "_block376"  :anon :subid("46_1256214657.25207") :outer("45_1256214657.25207")
    .param pmc param_378
    .const 'Sub' $P404 = "49_1256214657.25207" 
    capture_lex $P404
    .const 'Sub' $P386 = "47_1256214657.25207" 
    capture_lex $P386
    .lex "$_", param_378
    find_lex $P379, "$_"
    unless_null $P379, vivify_158
    new $P379, "Undef"
  vivify_158:
    .lex "$o", $P379
    new $P380, "Integer"
    assign $P380, 0
    .lex "$found", $P380
    find_lex $P382, "@result"
    unless_null $P382, vivify_159
    new $P382, "ResizablePMCArray"
  vivify_159:
    defined $I383, $P382
    unless $I383, for_undef_160
    iter $P381, $P382
    new $P398, 'ExceptionHandler'
    set_addr $P398, loop397_handler
    $P398."handle_types"(65, 67, 66)
    push_eh $P398
  loop397_test:
    unless $P381, loop397_done
    shift $P384, $P381
  loop397_redo:
    .const 'Sub' $P386 = "47_1256214657.25207" 
    capture_lex $P386
    $P386($P384)
  loop397_next:
    goto loop397_test
  loop397_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P399, exception, 'type'
    eq $P399, 65, loop397_next
    eq $P399, 67, loop397_redo
  loop397_done:
    pop_eh 
  for_undef_160:
    find_lex $P402, "$found"
    unless_null $P402, vivify_163
    new $P402, "Undef"
  vivify_163:
    unless $P402, unless_401
    set $P400, $P402
    goto unless_401_end
  unless_401:
    .const 'Sub' $P404 = "49_1256214657.25207" 
    capture_lex $P404
    $P408 = $P404()
    set $P400, $P408
  unless_401_end:
    .return ($P400)
.end


.namespace ["Array"]
.sub "_block385"  :anon :subid("47_1256214657.25207") :outer("46_1256214657.25207")
    .param pmc param_387
    .const 'Sub' $P394 = "48_1256214657.25207" 
    capture_lex $P394
    .lex "$_", param_387
    find_lex $P390, "$o"
    unless_null $P390, vivify_161
    new $P390, "Undef"
  vivify_161:
    find_lex $P391, "$_"
    unless_null $P391, vivify_162
    new $P391, "Undef"
  vivify_162:
    issame $I392, $P390, $P391
    if $I392, if_389
    new $P388, 'Integer'
    set $P388, $I392
    goto if_389_end
  if_389:
    .const 'Sub' $P394 = "48_1256214657.25207" 
    capture_lex $P394
    $P396 = $P394()
    set $P388, $P396
  if_389_end:
    .return ($P388)
.end


.namespace ["Array"]
.sub "_block393"  :anon :subid("48_1256214657.25207") :outer("47_1256214657.25207")
    new $P395, "Integer"
    assign $P395, 1
    store_lex "$found", $P395
    .return ($P395)
.end


.namespace ["Array"]
.sub "_block403"  :anon :subid("49_1256214657.25207") :outer("46_1256214657.25207")
    find_lex $P405, "@result"
    unless_null $P405, vivify_164
    new $P405, "ResizablePMCArray"
  vivify_164:
    find_lex $P406, "$o"
    unless_null $P406, vivify_165
    new $P406, "Undef"
  vivify_165:
    $P407 = $P405."push"($P406)
    .return ($P407)
.end


.namespace ["ResizablePMCArray"]
.sub "_block415" :init :load :subid("50_1256214657.25207")
    .const 'Sub' $P450 = "56_1256214657.25207" 
    capture_lex $P450
    .const 'Sub' $P432 = "53_1256214657.25207" 
    capture_lex $P432
    .const 'Sub' $P424 = "52_1256214657.25207" 
    capture_lex $P424
    .const 'Sub' $P417 = "51_1256214657.25207" 
    capture_lex $P417
    .const 'Sub' $P450 = "56_1256214657.25207" 
    capture_lex $P450
    .return ($P450)
.end


.namespace ["ResizablePMCArray"]
.sub "clone"  :subid("51_1256214657.25207") :method :outer("50_1256214657.25207")
    new $P419, 'ExceptionHandler'
    set_addr $P419, control_418
    $P419."handle_types"(58)
    push_eh $P419
    .lex "self", self

			$P0 = find_lex 'self'
			$P420 = clone $P0
		
    .lex "@clone", $P420
    new $P421, "Exception"
    set $P421['type'], 58
    find_lex $P422, "@clone"
    unless_null $P422, vivify_167
    new $P422, "ResizablePMCArray"
  vivify_167:
    setattribute $P421, 'payload', $P422
    throw $P421
    .return ()
  control_418:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P423, exception, "payload"
    .return ($P423)
    rethrow exception
.end


.namespace ["ResizablePMCArray"]
.sub "contains"  :subid("52_1256214657.25207") :method :outer("50_1256214657.25207")
    .param pmc param_427
    new $P426, 'ExceptionHandler'
    set_addr $P426, control_425
    $P426."handle_types"(58)
    push_eh $P426
    .lex "self", self
    .lex "$what", param_427

			.local pmc it, what
			$P0	= find_lex 'self'
			it	= iter $P0
			$P428	= box 0
			what	= find_lex '$what'
			
		foreach:
			unless it goto done
			
			$P0	= shift it
			ne_addr $P0, what, foreach
			
			$P428	= box 1
		
		done:
		
    .lex "$result", $P428
    new $P429, "Exception"
    set $P429['type'], 58
    find_lex $P430, "$result"
    unless_null $P430, vivify_168
    new $P430, "Undef"
  vivify_168:
    setattribute $P429, 'payload', $P430
    throw $P429
    .return ()
  control_425:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P431, exception, "payload"
    .return ($P431)
    rethrow exception
.end


.namespace ["ResizablePMCArray"]
.sub "elements"  :subid("53_1256214657.25207") :method :outer("50_1256214657.25207")
    .param pmc param_435 :slurpy
    .const 'Sub' $P445 = "55_1256214657.25207" 
    capture_lex $P445
    .const 'Sub' $P441 = "54_1256214657.25207" 
    capture_lex $P441
    new $P434, 'ExceptionHandler'
    set_addr $P434, control_433
    $P434."handle_types"(58)
    push_eh $P434
    .lex "self", self
    .lex "@value", param_435
    new $P436, "Undef"
    .lex "$elements", $P436
    find_lex $P438, "@value"
    unless_null $P438, vivify_169
    new $P438, "ResizablePMCArray"
  vivify_169:
    set $N439, $P438
    if $N439, if_437
    .const 'Sub' $P445 = "55_1256214657.25207" 
    capture_lex $P445
    $P445()
    goto if_437_end
  if_437:
    .const 'Sub' $P441 = "54_1256214657.25207" 
    capture_lex $P441
    $P441()
  if_437_end:
    new $P447, "Exception"
    set $P447['type'], 58
    find_lex $P448, "$elements"
    unless_null $P448, vivify_171
    new $P448, "Undef"
  vivify_171:
    setattribute $P447, 'payload', $P448
    throw $P447
    .return ()
  control_433:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P449, exception, "payload"
    .return ($P449)
    rethrow exception
.end


.namespace ["ResizablePMCArray"]
.sub "_block444"  :anon :subid("55_1256214657.25207") :outer("53_1256214657.25207")

				$P0 = find_lex 'self'
				$I0 = elements $P0
				$P446 = box $I0
			
    store_lex "$elements", $P446
    .return ($P446)
.end


.namespace ["ResizablePMCArray"]
.sub "_block440"  :anon :subid("54_1256214657.25207") :outer("53_1256214657.25207")
    find_lex $P442, "@value"
    unless_null $P442, vivify_170
    new $P442, "ResizablePMCArray"
  vivify_170:
    $P443 = $P442."shift"()
    store_lex "$elements", $P443

				$P0 = find_lex '$elements'
				$I0 = $P0
				$P0 = find_lex 'self'
				$P0 = $I0
			
    .return ()
.end


.namespace ["ResizablePMCArray"]
.sub "join"  :subid("56_1256214657.25207") :method :outer("50_1256214657.25207")
    .param pmc param_453 :slurpy
    new $P452, 'ExceptionHandler'
    set_addr $P452, control_451
    $P452."handle_types"(58)
    push_eh $P452
    .lex "self", self
    .lex "@delim", param_453
    find_lex $P454, "@delim"
    unless_null $P454, vivify_172
    new $P454, "ResizablePMCArray"
  vivify_172:
    $P454."push"("")
    find_lex $P455, "@delim"
    unless_null $P455, vivify_173
    new $P455, "ResizablePMCArray"
  vivify_173:
    $P456 = $P455."shift"()
    .lex "$delim", $P456

			.local pmc array
			array = find_lex 'self'
			.local string delim
			$P0 = find_lex '$delim'
			delim = $P0
			$S0 = join delim, array
			$P457 = box $S0
		
    .lex "$result", $P457
    new $P458, "Exception"
    set $P458['type'], 58
    find_lex $P459, "$result"
    unless_null $P459, vivify_174
    new $P459, "Undef"
  vivify_174:
    setattribute $P458, 'payload', $P459
    throw $P458
    .return ()
  control_451:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P460, exception, "payload"
    .return ($P460)
    rethrow exception
.end


.namespace ["ResizableStringArray"]
.sub "_block461" :init :load :subid("57_1256214657.25207")
    .const 'Sub' $P502 = "64_1256214657.25207" 
    capture_lex $P502
    .const 'Sub' $P484 = "61_1256214657.25207" 
    capture_lex $P484
    .const 'Sub' $P476 = "60_1256214657.25207" 
    capture_lex $P476
    .const 'Sub' $P469 = "59_1256214657.25207" 
    capture_lex $P469
    .const 'Sub' $P463 = "58_1256214657.25207" 
    capture_lex $P463
    .const 'Sub' $P502 = "64_1256214657.25207" 
    capture_lex $P502
    .return ($P502)
.end


.namespace ["ResizableStringArray"]
.sub "append"  :subid("58_1256214657.25207") :method :outer("57_1256214657.25207")
    new $P465, 'ExceptionHandler'
    set_addr $P465, control_464
    $P465."handle_types"(58)
    push_eh $P465
    .lex "self", self
    get_hll_global $P466, ["Dumper"], "DIE"
    $P467 = $P466("Didn't think this would be needed.")
    .return ($P467)
  control_464:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P468, exception, "payload"
    .return ($P468)
    rethrow exception
.end


.namespace ["ResizableStringArray"]
.sub "clone"  :subid("59_1256214657.25207") :method :outer("57_1256214657.25207")
    new $P471, 'ExceptionHandler'
    set_addr $P471, control_470
    $P471."handle_types"(58)
    push_eh $P471
    .lex "self", self

			$P0 = find_lex 'self'
			$P472 = clone $P0
		
    .lex "@clone", $P472
    new $P473, "Exception"
    set $P473['type'], 58
    find_lex $P474, "@clone"
    unless_null $P474, vivify_175
    new $P474, "ResizablePMCArray"
  vivify_175:
    setattribute $P473, 'payload', $P474
    throw $P473
    .return ()
  control_470:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P475, exception, "payload"
    .return ($P475)
    rethrow exception
.end


.namespace ["ResizableStringArray"]
.sub "contains"  :subid("60_1256214657.25207") :method :outer("57_1256214657.25207")
    .param pmc param_479
    new $P478, 'ExceptionHandler'
    set_addr $P478, control_477
    $P478."handle_types"(58)
    push_eh $P478
    .lex "self", self
    .lex "$what", param_479

			.local pmc it
			$P0	= find_lex 'self'
			it	= iter $P0
			
			$P480	= box 0
			
			.local string what
			$P0	= find_lex '$what'
			what	= $P0
			
		foreach:
			unless it goto done
			$S0	= shift it
			unless $S0 == what goto foreach
			$P480	= box 1
		
		done:
		
    .lex "$result", $P480
    new $P481, "Exception"
    set $P481['type'], 58
    find_lex $P482, "$result"
    unless_null $P482, vivify_176
    new $P482, "Undef"
  vivify_176:
    setattribute $P481, 'payload', $P482
    throw $P481
    .return ()
  control_477:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P483, exception, "payload"
    .return ($P483)
    rethrow exception
.end


.namespace ["ResizableStringArray"]
.sub "elements"  :subid("61_1256214657.25207") :method :outer("57_1256214657.25207")
    .param pmc param_487 :slurpy
    .const 'Sub' $P497 = "63_1256214657.25207" 
    capture_lex $P497
    .const 'Sub' $P493 = "62_1256214657.25207" 
    capture_lex $P493
    new $P486, 'ExceptionHandler'
    set_addr $P486, control_485
    $P486."handle_types"(58)
    push_eh $P486
    .lex "self", self
    .lex "@value", param_487
    new $P488, "Undef"
    .lex "$elements", $P488
    find_lex $P490, "@value"
    unless_null $P490, vivify_177
    new $P490, "ResizablePMCArray"
  vivify_177:
    set $N491, $P490
    if $N491, if_489
    .const 'Sub' $P497 = "63_1256214657.25207" 
    capture_lex $P497
    $P497()
    goto if_489_end
  if_489:
    .const 'Sub' $P493 = "62_1256214657.25207" 
    capture_lex $P493
    $P493()
  if_489_end:
    new $P499, "Exception"
    set $P499['type'], 58
    find_lex $P500, "$elements"
    unless_null $P500, vivify_179
    new $P500, "Undef"
  vivify_179:
    setattribute $P499, 'payload', $P500
    throw $P499
    .return ()
  control_485:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P501, exception, "payload"
    .return ($P501)
    rethrow exception
.end


.namespace ["ResizableStringArray"]
.sub "_block496"  :anon :subid("63_1256214657.25207") :outer("61_1256214657.25207")

				$P0 = find_lex 'self'
				$I0 = elements $P0
				$P498 = box $I0
			
    store_lex "$elements", $P498
    .return ($P498)
.end


.namespace ["ResizableStringArray"]
.sub "_block492"  :anon :subid("62_1256214657.25207") :outer("61_1256214657.25207")
    find_lex $P494, "@value"
    unless_null $P494, vivify_178
    new $P494, "ResizablePMCArray"
  vivify_178:
    $P495 = $P494."shift"()
    store_lex "$elements", $P495

				$P0 = find_lex '$elements'
				$I0 = $P0
				$P0 = find_lex 'self'
				$P0 = $I0
			
    .return ()
.end


.namespace ["ResizableStringArray"]
.sub "join"  :subid("64_1256214657.25207") :method :outer("57_1256214657.25207")
    .param pmc param_505 :slurpy
    new $P504, 'ExceptionHandler'
    set_addr $P504, control_503
    $P504."handle_types"(58)
    push_eh $P504
    .lex "self", self
    .lex "@delim", param_505
    find_lex $P506, "@delim"
    unless_null $P506, vivify_180
    new $P506, "ResizablePMCArray"
  vivify_180:
    $P506."push"("")
    find_lex $P507, "@delim"
    unless_null $P507, vivify_181
    new $P507, "ResizablePMCArray"
  vivify_181:
    $P508 = $P507."shift"()
    .lex "$delim", $P508

			.local pmc array
			array = find_lex 'self'
			.local string delim
			$P0 = find_lex '$delim'
			delim = $P0
			$S0 = join delim, array
			$P509 = box $S0
		
    .lex "$result", $P509
    new $P510, "Exception"
    set $P510['type'], 58
    find_lex $P511, "$result"
    unless_null $P511, vivify_182
    new $P511, "Undef"
  vivify_182:
    setattribute $P510, 'payload', $P511
    throw $P510
    .return ()
  control_503:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P512, exception, "payload"
    .return ($P512)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256214664.66218")
    get_hll_global $P1150, ["Class";"HashBased"], "_block1149" 
    .return ($P1150)
.end


.namespace ["Class"]
.sub "_block13" :init :load :subid("11_1256214664.66218")
    .const 'Sub' $P778 = "75_1256214664.66218" 
    capture_lex $P778
    .const 'Sub' $P741 = "73_1256214664.66218" 
    capture_lex $P741
    .const 'Sub' $P718 = "70_1256214664.66218" 
    capture_lex $P718
    .const 'Sub' $P693 = "68_1256214664.66218" 
    capture_lex $P693
    .const 'Sub' $P593 = "62_1256214664.66218" 
    capture_lex $P593
    .const 'Sub' $P581 = "61_1256214664.66218" 
    capture_lex $P581
    .const 'Sub' $P561 = "59_1256214664.66218" 
    capture_lex $P561
    .const 'Sub' $P547 = "57_1256214664.66218" 
    capture_lex $P547
    .const 'Sub' $P510 = "53_1256214664.66218" 
    capture_lex $P510
    .const 'Sub' $P489 = "51_1256214664.66218" 
    capture_lex $P489
    .const 'Sub' $P447 = "47_1256214664.66218" 
    capture_lex $P447
    .const 'Sub' $P382 = "44_1256214664.66218" 
    capture_lex $P382
    .const 'Sub' $P339 = "41_1256214664.66218" 
    capture_lex $P339
    .const 'Sub' $P313 = "39_1256214664.66218" 
    capture_lex $P313
    .const 'Sub' $P269 = "35_1256214664.66218" 
    capture_lex $P269
    .const 'Sub' $P258 = "34_1256214664.66218" 
    capture_lex $P258
    .const 'Sub' $P244 = "33_1256214664.66218" 
    capture_lex $P244
    .const 'Sub' $P233 = "32_1256214664.66218" 
    capture_lex $P233
    .const 'Sub' $P172 = "26_1256214664.66218" 
    capture_lex $P172
    .const 'Sub' $P151 = "24_1256214664.66218" 
    capture_lex $P151
    .const 'Sub' $P73 = "17_1256214664.66218" 
    capture_lex $P73
    .const 'Sub' $P43 = "15_1256214664.66218" 
    capture_lex $P43
    .const 'Sub' $P31 = "14_1256214664.66218" 
    capture_lex $P31
    .const 'Sub' $P15 = "12_1256214664.66218" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P778 = "75_1256214664.66218" 
    capture_lex $P778
    .return ($P778)
.end


.namespace ["Class"]
.sub "_ONLOAD"  :subid("12_1256214664.66218") :outer("11_1256214664.66218")
    .const 'Sub' $P21 = "13_1256214664.66218" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_115
    new $P19, "Undef"
  vivify_115:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256214664.66218" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "load_bytecode"
    $P25("P6object.pir")
    get_hll_global $P26, ["Dumper"], "_ONLOAD"
    $P26()
    get_hll_global $P27, ["Parrot"], "IMPORT"
    $P27("Dumper")
    get_hll_global $P28, ["Hash"], "empty"
    $P29 = $P28()
    set_global "%Class_info", $P29
    .return ($P29)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P30, exception, "payload"
    .return ($P30)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block20"  :anon :subid("13_1256214664.66218") :outer("12_1256214664.66218")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Class"]
.sub "IS_A"  :subid("14_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_34
    .param pmc param_35
    new $P33, 'ExceptionHandler'
    set_addr $P33, control_32
    $P33."handle_types"(58)
    push_eh $P33
    .lex "$object", param_34
    .lex "$type", param_35
    new $P36, "Exception"
    set $P36['type'], 58
    find_lex $P37, "$object"
    unless_null $P37, vivify_116
    new $P37, "Undef"
  vivify_116:
    $P38 = $P37."HOW"()
    find_lex $P39, "$object"
    unless_null $P39, vivify_117
    new $P39, "Undef"
  vivify_117:
    find_lex $P40, "$type"
    unless_null $P40, vivify_118
    new $P40, "Undef"
  vivify_118:
    $P41 = $P38."isa"($P39, $P40)
    setattribute $P36, 'payload', $P41
    throw $P36
    .return ()
  control_32:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P42, exception, "payload"
    .return ($P42)
    rethrow exception
.end


.namespace ["Class"]
.sub "capture_namespace"  :subid("15_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_46
    .const 'Sub' $P54 = "16_1256214664.66218" 
    capture_lex $P54
    new $P45, 'ExceptionHandler'
    set_addr $P45, control_44
    $P45."handle_types"(58)
    push_eh $P45
    .lex "$nsp", param_46
    get_hll_global $P47, ["Hash"], "empty"
    $P48 = $P47()
    .lex "%sub_addrs", $P48
    find_lex $P50, "$nsp"
    unless_null $P50, vivify_119
    new $P50, "Undef"
  vivify_119:
    defined $I51, $P50
    unless $I51, for_undef_120
    iter $P49, $P50
    new $P68, 'ExceptionHandler'
    set_addr $P68, loop67_handler
    $P68."handle_types"(65, 67, 66)
    push_eh $P68
  loop67_test:
    unless $P49, loop67_done
    shift $P52, $P49
  loop67_redo:
    .const 'Sub' $P54 = "16_1256214664.66218" 
    capture_lex $P54
    $P54($P52)
  loop67_next:
    goto loop67_test
  loop67_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P69, exception, 'type'
    eq $P69, 65, loop67_next
    eq $P69, 67, loop67_redo
  loop67_done:
    pop_eh 
  for_undef_120:
    new $P70, "Exception"
    set $P70['type'], 58
    find_lex $P71, "%sub_addrs"
    unless_null $P71, vivify_128
    new $P71, "Hash"
  vivify_128:
    setattribute $P70, 'payload', $P71
    throw $P70
    .return ()
  control_44:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P72, exception, "payload"
    .return ($P72)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block53"  :anon :subid("16_1256214664.66218") :outer("15_1256214664.66218")
    .param pmc param_55
    .lex "$_", param_55
    find_lex $P56, "$_"
    unless_null $P56, vivify_121
    new $P56, "Undef"
  vivify_121:
    set $S57, $P56
    new $P58, 'String'
    set $P58, $S57
    .lex "$name", $P58
    get_hll_global $P59, ["Parrot"], "get_address_of"
    find_lex $P60, "$_"
    unless_null $P60, vivify_122
    new $P60, "Undef"
  vivify_122:
    find_lex $P61, "$nsp"
    unless_null $P61, vivify_123
    new $P61, "Hash"
  vivify_123:
    set $P62, $P61[$P60]
    unless_null $P62, vivify_124
    new $P62, "Undef"
  vivify_124:
    $P63 = $P59($P62)
    .lex "$addr", $P63
    find_lex $P64, "$addr"
    unless_null $P64, vivify_125
    new $P64, "Undef"
  vivify_125:
    find_lex $P65, "$name"
    unless_null $P65, vivify_126
    new $P65, "Undef"
  vivify_126:
    find_lex $P66, "%sub_addrs"
    unless_null $P66, vivify_127
    new $P66, "Hash"
    store_lex "%sub_addrs", $P66
  vivify_127:
    set $P66[$P65], $P64
    .return ($P64)
.end


.namespace ["Class"]
.sub "check_namespace"  :subid("17_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_76
    .param pmc param_77
    .const 'Sub' $P135 = "22_1256214664.66218" 
    capture_lex $P135
    .const 'Sub' $P86 = "18_1256214664.66218" 
    capture_lex $P86
    new $P75, 'ExceptionHandler'
    set_addr $P75, control_74
    $P75."handle_types"(58)
    push_eh $P75
    .lex "%before", param_76
    .lex "%after", param_77
    new $P78, "Hash"
    .lex "%seen", $P78
    get_hll_global $P80, ["Hash"], "sorted_keys"
    find_lex $P81, "%before"
    unless_null $P81, vivify_129
    new $P81, "Hash"
  vivify_129:
    $P82 = $P80($P81)
    defined $I83, $P82
    unless $I83, for_undef_130
    iter $P79, $P82
    new $P126, 'ExceptionHandler'
    set_addr $P126, loop125_handler
    $P126."handle_types"(65, 67, 66)
    push_eh $P126
  loop125_test:
    unless $P79, loop125_done
    shift $P84, $P79
  loop125_redo:
    .const 'Sub' $P86 = "18_1256214664.66218" 
    capture_lex $P86
    $P86($P84)
  loop125_next:
    goto loop125_test
  loop125_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P127, exception, 'type'
    eq $P127, 65, loop125_next
    eq $P127, 67, loop125_redo
  loop125_done:
    pop_eh 
  for_undef_130:
    get_hll_global $P129, ["Hash"], "sorted_keys"
    find_lex $P130, "%after"
    unless_null $P130, vivify_149
    new $P130, "Hash"
  vivify_149:
    $P131 = $P129($P130)
    defined $I132, $P131
    unless $I132, for_undef_150
    iter $P128, $P131
    new $P148, 'ExceptionHandler'
    set_addr $P148, loop147_handler
    $P148."handle_types"(65, 67, 66)
    push_eh $P148
  loop147_test:
    unless $P128, loop147_done
    shift $P133, $P128
  loop147_redo:
    .const 'Sub' $P135 = "22_1256214664.66218" 
    capture_lex $P135
    $P135($P133)
  loop147_next:
    goto loop147_test
  loop147_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P149, exception, 'type'
    eq $P149, 65, loop147_next
    eq $P149, 67, loop147_redo
  loop147_done:
    pop_eh 
  for_undef_150:
    .return ($P128)
  control_74:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P150, exception, "payload"
    .return ($P150)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block85"  :anon :subid("18_1256214664.66218") :outer("17_1256214664.66218")
    .param pmc param_87
    .const 'Sub' $P119 = "21_1256214664.66218" 
    capture_lex $P119
    .const 'Sub' $P95 = "19_1256214664.66218" 
    capture_lex $P95
    .lex "$_", param_87
    get_hll_global $P89, ["Hash"], "exists"
    find_lex $P90, "%after"
    unless_null $P90, vivify_131
    new $P90, "Hash"
  vivify_131:
    find_lex $P91, "$_"
    unless_null $P91, vivify_132
    new $P91, "Undef"
  vivify_132:
    set $S92, $P91
    $P93 = $P89($P90, $S92)
    if $P93, if_88
    .const 'Sub' $P119 = "21_1256214664.66218" 
    capture_lex $P119
    $P119()
    goto if_88_end
  if_88:
    .const 'Sub' $P95 = "19_1256214664.66218" 
    capture_lex $P95
    $P95()
  if_88_end:
    new $P122, "Integer"
    assign $P122, 1
    find_lex $P123, "$_"
    unless_null $P123, vivify_147
    new $P123, "Undef"
  vivify_147:
    find_lex $P124, "%seen"
    unless_null $P124, vivify_148
    new $P124, "Hash"
    store_lex "%seen", $P124
  vivify_148:
    set $P124[$P123], $P122
    .return ($P122)
.end


.namespace ["Class"]
.sub "_block118"  :anon :subid("21_1256214664.66218") :outer("18_1256214664.66218")
    find_lex $P120, "$_"
    unless_null $P120, vivify_133
    new $P120, "Undef"
  vivify_133:
    $P121 = "say"("Object '", $P120, "' has been removed")
    .return ($P121)
.end


.namespace ["Class"]
.sub "_block94"  :anon :subid("19_1256214664.66218") :outer("18_1256214664.66218")
    .const 'Sub' $P108 = "20_1256214664.66218" 
    capture_lex $P108
    find_lex $P98, "$_"
    unless_null $P98, vivify_134
    new $P98, "Undef"
  vivify_134:
    find_lex $P99, "%before"
    unless_null $P99, vivify_135
    new $P99, "Hash"
  vivify_135:
    set $P100, $P99[$P98]
    unless_null $P100, vivify_136
    new $P100, "Undef"
  vivify_136:
    set $N101, $P100
    find_lex $P102, "$_"
    unless_null $P102, vivify_137
    new $P102, "Undef"
  vivify_137:
    find_lex $P103, "%after"
    unless_null $P103, vivify_138
    new $P103, "Hash"
  vivify_138:
    set $P104, $P103[$P102]
    unless_null $P104, vivify_139
    new $P104, "Undef"
  vivify_139:
    set $N105, $P104
    isne $I106, $N101, $N105
    if $I106, if_97
    new $P96, 'Integer'
    set $P96, $I106
    goto if_97_end
  if_97:
    .const 'Sub' $P108 = "20_1256214664.66218" 
    capture_lex $P108
    $P117 = $P108()
    set $P96, $P117
  if_97_end:
    .return ($P96)
.end


.namespace ["Class"]
.sub "_block107"  :anon :subid("20_1256214664.66218") :outer("19_1256214664.66218")
    find_lex $P109, "$_"
    unless_null $P109, vivify_140
    new $P109, "Undef"
  vivify_140:
    find_lex $P110, "$_"
    unless_null $P110, vivify_141
    new $P110, "Undef"
  vivify_141:
    find_lex $P111, "%before"
    unless_null $P111, vivify_142
    new $P111, "Hash"
  vivify_142:
    set $P112, $P111[$P110]
    unless_null $P112, vivify_143
    new $P112, "Undef"
  vivify_143:
    find_lex $P113, "$_"
    unless_null $P113, vivify_144
    new $P113, "Undef"
  vivify_144:
    find_lex $P114, "%after"
    unless_null $P114, vivify_145
    new $P114, "Hash"
  vivify_145:
    set $P115, $P114[$P113]
    unless_null $P115, vivify_146
    new $P115, "Undef"
  vivify_146:
    $P116 = "say"("Object '", $P109, "' has different address: ", $P112, " -> ", $P115)
    .return ($P116)
.end


.namespace ["Class"]
.sub "_block134"  :anon :subid("22_1256214664.66218") :outer("17_1256214664.66218")
    .param pmc param_136
    .const 'Sub' $P143 = "23_1256214664.66218" 
    capture_lex $P143
    .lex "$_", param_136
    find_lex $P139, "$_"
    unless_null $P139, vivify_151
    new $P139, "Undef"
  vivify_151:
    find_lex $P140, "%seen"
    unless_null $P140, vivify_152
    new $P140, "Hash"
  vivify_152:
    set $P141, $P140[$P139]
    unless_null $P141, vivify_153
    new $P141, "Undef"
  vivify_153:
    unless $P141, unless_138
    set $P137, $P141
    goto unless_138_end
  unless_138:
    .const 'Sub' $P143 = "23_1256214664.66218" 
    capture_lex $P143
    $P146 = $P143()
    set $P137, $P146
  unless_138_end:
    .return ($P137)
.end


.namespace ["Class"]
.sub "_block142"  :anon :subid("23_1256214664.66218") :outer("22_1256214664.66218")
    find_lex $P144, "$_"
    unless_null $P144, vivify_154
    new $P144, "Undef"
  vivify_154:
    $P145 = "say"("Object '", $P144, "' was added")
    .return ($P145)
.end


.namespace ["Class"]
.sub "NEW_CLASS"  :subid("24_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_154
    .const 'Sub' $P161 = "25_1256214664.66218" 
    capture_lex $P161
    new $P153, 'ExceptionHandler'
    set_addr $P153, control_152
    $P153."handle_types"(58)
    push_eh $P153
    .lex "$class_name", param_154
    find_lex $P155, "$class_name"
    unless_null $P155, vivify_155
    new $P155, "Undef"
  vivify_155:
    $P156 = "_class_info"($P155)
    .lex "$class_info", $P156
    find_lex $P158, "$class_info"
    unless_null $P158, vivify_156
    new $P158, "Hash"
  vivify_156:
    set $P159, $P158["created"]
    unless_null $P159, vivify_157
    new $P159, "Undef"
  vivify_157:
    unless $P159, if_157_end
    .const 'Sub' $P161 = "25_1256214664.66218" 
    capture_lex $P161
    $P161()
  if_157_end:
    new $P164, "Integer"
    assign $P164, 1
    find_lex $P165, "$class_info"
    unless_null $P165, vivify_159
    new $P165, "Hash"
    store_lex "$class_info", $P165
  vivify_159:
    set $P165["created"], $P164
    $P166 = "get_meta"()
    find_lex $P167, "$class_name"
    unless_null $P167, vivify_160
    new $P167, "Undef"
  vivify_160:
    $P168 = $P166."new_class"($P167)
    .lex "$new_class", $P168
    new $P169, "Exception"
    set $P169['type'], 58
    find_lex $P170, "$new_class"
    unless_null $P170, vivify_161
    new $P170, "Undef"
  vivify_161:
    setattribute $P169, 'payload', $P170
    throw $P169
    .return ()
  control_152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P171, exception, "payload"
    .return ($P171)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block160"  :anon :subid("25_1256214664.66218") :outer("24_1256214664.66218")
    find_lex $P162, "$class_name"
    unless_null $P162, vivify_158
    new $P162, "Undef"
  vivify_158:
    $P163 = "DIE"("Class '", $P162, "' already created.")
    .return ($P163)
.end


.namespace ["Class"]
.sub "SUBCLASS"  :subid("26_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_175
    .param pmc param_176 :slurpy
    .const 'Sub' $P221 = "31_1256214664.66218" 
    capture_lex $P221
    .const 'Sub' $P206 = "30_1256214664.66218" 
    capture_lex $P206
    .const 'Sub' $P198 = "29_1256214664.66218" 
    capture_lex $P198
    .const 'Sub' $P187 = "28_1256214664.66218" 
    capture_lex $P187
    .const 'Sub' $P183 = "27_1256214664.66218" 
    capture_lex $P183
    new $P174, 'ExceptionHandler'
    set_addr $P174, control_173
    $P174."handle_types"(58)
    push_eh $P174
    .lex "$class_name", param_175
    .lex "@parents", param_176
    find_lex $P177, "$class_name"
    unless_null $P177, vivify_162
    new $P177, "Undef"
  vivify_162:
    $P178 = "_class_info"($P177)
    .lex "$class_info", $P178
    find_lex $P180, "$class_info"
    unless_null $P180, vivify_163
    new $P180, "Hash"
  vivify_163:
    set $P181, $P180["created"]
    unless_null $P181, vivify_164
    new $P181, "Undef"
  vivify_164:
    if $P181, if_179
    .const 'Sub' $P187 = "28_1256214664.66218" 
    capture_lex $P187
    $P187()
    goto if_179_end
  if_179:
    .const 'Sub' $P183 = "27_1256214664.66218" 
    capture_lex $P183
    $P183()
  if_179_end:
    find_lex $P190, "$class_name"
    unless_null $P190, vivify_167
    new $P190, "Undef"
  vivify_167:
    find_lex $P191, "@parents"
    unless_null $P191, vivify_168
    new $P191, "ResizablePMCArray"
  vivify_168:
    set $N192, $P191
    "NOTE"("Creating subclass ", $P190, " with ", $N192, " parents.")
    $P193 = "get_meta"()
    .lex "$meta", $P193
    find_lex $P195, "@parents"
    unless_null $P195, vivify_169
    new $P195, "ResizablePMCArray"
  vivify_169:
    set $N196, $P195
    if $N196, unless_194_end
    .const 'Sub' $P198 = "29_1256214664.66218" 
    capture_lex $P198
    $P198()
  unless_194_end:
    "NOTE"("Running _ONLOAD method of all parents")
    find_lex $P202, "@parents"
    unless_null $P202, vivify_171
    new $P202, "ResizablePMCArray"
  vivify_171:
    defined $I203, $P202
    unless $I203, for_undef_172
    iter $P201, $P202
    new $P212, 'ExceptionHandler'
    set_addr $P212, loop211_handler
    $P212."handle_types"(65, 67, 66)
    push_eh $P212
  loop211_test:
    unless $P201, loop211_done
    shift $P204, $P201
  loop211_redo:
    .const 'Sub' $P206 = "30_1256214664.66218" 
    capture_lex $P206
    $P206($P204)
  loop211_next:
    goto loop211_test
  loop211_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P213, exception, 'type'
    eq $P213, 65, loop211_next
    eq $P213, 67, loop211_redo
  loop211_done:
    pop_eh 
  for_undef_172:
    "NOTE"("Creating class with first parent")
    find_lex $P214, "$meta"
    unless_null $P214, vivify_175
    new $P214, "Undef"
  vivify_175:
    find_lex $P215, "$class_name"
    unless_null $P215, vivify_176
    new $P215, "Undef"
  vivify_176:
    find_lex $P216, "@parents"
    unless_null $P216, vivify_177
    new $P216, "ResizablePMCArray"
  vivify_177:
    $P217 = $P216."shift"()
    $P218 = $P214."new_class"($P215, $P217 :named("parent"))
    .lex "$class", $P218
    "NOTE"("Attaching other parents to new class")
    new $P228, 'ExceptionHandler'
    set_addr $P228, loop227_handler
    $P228."handle_types"(65, 67, 66)
    push_eh $P228
  loop227_test:
    find_lex $P219, "@parents"
    unless_null $P219, vivify_178
    new $P219, "ResizablePMCArray"
  vivify_178:
    unless $P219, loop227_done
  loop227_redo:
    .const 'Sub' $P221 = "31_1256214664.66218" 
    capture_lex $P221
    $P221()
  loop227_next:
    goto loop227_test
  loop227_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P229, exception, 'type'
    eq $P229, 65, loop227_next
    eq $P229, 67, loop227_redo
  loop227_done:
    pop_eh 
    new $P230, "Exception"
    set $P230['type'], 58
    find_lex $P231, "$class"
    unless_null $P231, vivify_182
    new $P231, "Undef"
  vivify_182:
    setattribute $P230, 'payload', $P231
    throw $P230
    .return ()
  control_173:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P232, exception, "payload"
    .return ($P232)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block186"  :anon :subid("28_1256214664.66218") :outer("26_1256214664.66218")
    new $P188, "Integer"
    assign $P188, 1
    find_lex $P189, "$class_info"
    unless_null $P189, vivify_165
    new $P189, "Hash"
    store_lex "$class_info", $P189
  vivify_165:
    set $P189["created"], $P188
    .return ($P188)
.end


.namespace ["Class"]
.sub "_block182"  :anon :subid("27_1256214664.66218") :outer("26_1256214664.66218")
    find_lex $P184, "$class_name"
    unless_null $P184, vivify_166
    new $P184, "Undef"
  vivify_166:
    $P185 = "DIE"("Class '", $P184, "' already created.")
    .return ($P185)
.end


.namespace ["Class"]
.sub "_block197"  :anon :subid("29_1256214664.66218") :outer("26_1256214664.66218")
    "NOTE"("Adding parent class 'Class::HashBased'")
    find_lex $P199, "@parents"
    unless_null $P199, vivify_170
    new $P199, "ResizablePMCArray"
  vivify_170:
    $P200 = $P199."push"("Class::HashBased")
    .return ($P200)
.end


.namespace ["Class"]
.sub "_block205"  :anon :subid("30_1256214664.66218") :outer("26_1256214664.66218")
    .param pmc param_207
    .lex "$_", param_207
    find_lex $P208, "$_"
    unless_null $P208, vivify_173
    new $P208, "Undef"
  vivify_173:
    "NOTE"($P208)
    find_lex $P209, "$_"
    unless_null $P209, vivify_174
    new $P209, "Undef"
  vivify_174:
    $P210 = "call_onload_of_class"($P209)
    .return ($P210)
.end


.namespace ["Class"]
.sub "_block220"  :anon :subid("31_1256214664.66218") :outer("26_1256214664.66218")
    find_lex $P222, "$meta"
    unless_null $P222, vivify_179
    new $P222, "Undef"
  vivify_179:
    find_lex $P223, "$class"
    unless_null $P223, vivify_180
    new $P223, "Undef"
  vivify_180:
    find_lex $P224, "@parents"
    unless_null $P224, vivify_181
    new $P224, "ResizablePMCArray"
  vivify_181:
    $P225 = $P224."shift"()
    $P226 = $P222."add_parent"($P223, $P225)
    .return ($P226)
.end


.namespace ["Class"]
.sub "already_created"  :subid("32_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_236
    new $P235, 'ExceptionHandler'
    set_addr $P235, control_234
    $P235."handle_types"(58)
    push_eh $P235
    .lex "$name", param_236
    get_global $P237, "%already_created"
    unless_null $P237, vivify_183
    new $P237, "Hash"
  vivify_183:
    new $P238, "Exception"
    set $P238['type'], 58
    find_lex $P239, "$name"
    unless_null $P239, vivify_184
    new $P239, "Undef"
  vivify_184:
    get_global $P240, "%already_created"
    unless_null $P240, vivify_185
    new $P240, "Hash"
  vivify_185:
    set $P241, $P240[$P239]
    unless_null $P241, vivify_186
    new $P241, "Undef"
  vivify_186:
        ##  inline postfix:++
        clone $P242, $P241
        inc $P241
    setattribute $P238, 'payload', $P242
    throw $P238
    .return ()
  control_234:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P243, exception, "payload"
    .return ($P243)
    rethrow exception
.end


.namespace ["Class"]
.sub "call_method"  :subid("33_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_247
    .param pmc param_248
    .param pmc param_249 :slurpy
    .param pmc param_250 :slurpy :named
    new $P246, 'ExceptionHandler'
    set_addr $P246, control_245
    $P246."handle_types"(58)
    push_eh $P246
    .lex "$object", param_247
    .lex "$method", param_248
    .lex "@args", param_249
    .lex "%opts", param_250
    new $P251, "Exception"
    set $P251['type'], 58
    find_lex $P252, "$object"
    unless_null $P252, vivify_187
    new $P252, "Undef"
  vivify_187:
    find_lex $P253, "$method"
    unless_null $P253, vivify_188
    new $P253, "Undef"
  vivify_188:
    find_lex $P254, "@args"
    unless_null $P254, vivify_189
    new $P254, "ResizablePMCArray"
  vivify_189:
    find_lex $P255, "%opts"
    unless_null $P255, vivify_190
    new $P255, "Hash"
  vivify_190:
    $P256 = "call_method_"($P252, $P253, $P254, $P255)
    setattribute $P251, 'payload', $P256
    throw $P251
    .return ()
  control_245:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P257, exception, "payload"
    .return ($P257)
    rethrow exception
.end


.namespace ["Class"]
.sub "call_method_"  :subid("34_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_261
    .param pmc param_262
    .param pmc param_263
    .param pmc param_264
    new $P260, 'ExceptionHandler'
    set_addr $P260, control_259
    $P260."handle_types"(58)
    push_eh $P260
    .lex "$object", param_261
    .lex "$method", param_262
    .lex "@args", param_263
    .lex "%opts", param_264

			.local pmc object, meth, args, opts
			object	= find_lex '$object'
			meth	= find_lex '$method'
			args	= find_lex '@args'
			opts	= find_lex '%opts'
			
			$I0 = isa meth, 'Sub'
			unless $I0 goto call_string
			
			$P265 = object.meth(args :flat, opts :named :flat)
			goto done
			
		call_string:
			$S0 = meth
			$P265 = object.$S0(args :flat, opts :named :flat)
			
		done:
		
    .lex "$result", $P265
    new $P266, "Exception"
    set $P266['type'], 58
    find_lex $P267, "$result"
    unless_null $P267, vivify_191
    new $P267, "Undef"
  vivify_191:
    setattribute $P266, 'payload', $P267
    throw $P266
    .return ()
  control_259:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P268, exception, "payload"
    .return ($P268)
    rethrow exception
.end


.namespace ["Class"]
.sub "call_onload_of_class"  :subid("35_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_272
    .const 'Sub' $P308 = "38_1256214664.66218" 
    capture_lex $P308
    .const 'Sub' $P302 = "37_1256214664.66218" 
    capture_lex $P302
    .const 'Sub' $P285 = "36_1256214664.66218" 
    capture_lex $P285
    new $P271, 'ExceptionHandler'
    set_addr $P271, control_270
    $P271."handle_types"(58)
    push_eh $P271
    .lex "$class", param_272
    find_lex $P273, "$class"
    unless_null $P273, vivify_192
    new $P273, "Undef"
  vivify_192:
    set $S274, $P273
    new $P275, 'String'
    set $P275, $S274
    .lex "$classname", $P275
    new $P277, "Integer"
    assign $P277, 1
    neg $P278, $P277
    set $I279, $P278
    find_lex $P280, "$classname"
    unless_null $P280, vivify_193
    new $P280, "ResizablePMCArray"
  vivify_193:
    set $P281, $P280[$I279]
    unless_null $P281, vivify_194
    new $P281, "Undef"
  vivify_194:
    set $S282, $P281
    iseq $I283, $S282, ")"
    unless $I283, if_276_end
    .const 'Sub' $P285 = "36_1256214664.66218" 
    capture_lex $P285
    $P285()
  if_276_end:
    find_lex $P291, "$classname"
    unless_null $P291, vivify_196
    new $P291, "Undef"
  vivify_196:
    set $S292, $P291
    new $P293, 'String'
    set $P293, $S292
    concat $P294, $P293, "::_ONLOAD"
    .lex "$sub_name", $P294
    get_hll_global $P295, ["Parrot"], "get_sub"
    find_lex $P296, "$sub_name"
    unless_null $P296, vivify_197
    new $P296, "Undef"
  vivify_197:
    $P297 = $P295($P296)
    .lex "&onload", $P297
    find_lex $P300, "&onload"
    unless_null $P300, vivify_198
    new $P300, "Undef"
  vivify_198:
    if $P300, if_299
    .const 'Sub' $P308 = "38_1256214664.66218" 
    capture_lex $P308
    $P311 = $P308()
    set $P298, $P311
    goto if_299_end
  if_299:
    .const 'Sub' $P302 = "37_1256214664.66218" 
    capture_lex $P302
    $P306 = $P302()
    set $P298, $P306
  if_299_end:
    .return ($P298)
  control_270:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P312, exception, "payload"
    .return ($P312)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block284"  :anon :subid("36_1256214664.66218") :outer("35_1256214664.66218")
    get_hll_global $P286, ["String"], "substr"
    find_lex $P287, "$classname"
    unless_null $P287, vivify_195
    new $P287, "Undef"
  vivify_195:
    new $P288, "Integer"
    assign $P288, 2
    neg $P289, $P288
    $P290 = $P286($P287, 0, $P289)
    store_lex "$classname", $P290
    .return ($P290)
.end


.namespace ["Class"]
.sub "_block307"  :anon :subid("38_1256214664.66218") :outer("35_1256214664.66218")
    find_lex $P309, "$classname"
    unless_null $P309, vivify_199
    new $P309, "Undef"
  vivify_199:
    $P310 = "NOTE"("No onload sub for: ", $P309)
    .return ($P310)
.end


.namespace ["Class"]
.sub "_block301"  :anon :subid("37_1256214664.66218") :outer("35_1256214664.66218")
    find_lex $P303, "&onload"
    unless_null $P303, vivify_200
    new $P303, "Undef"
  vivify_200:
    $P303()
    find_lex $P304, "$classname"
    unless_null $P304, vivify_201
    new $P304, "Undef"
  vivify_201:
    $P305 = "NOTE"("Onload-ed: ", $P304)
    .return ($P305)
.end


.namespace ["Class"]
.sub "_class_info"  :subid("39_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_316
    .const 'Sub' $P323 = "40_1256214664.66218" 
    capture_lex $P323
    new $P315, 'ExceptionHandler'
    set_addr $P315, control_314
    $P315."handle_types"(58)
    push_eh $P315
    .lex "$class_name", param_316
    get_global $P317, "%Class_info"
    unless_null $P317, vivify_202
    new $P317, "Hash"
  vivify_202:
    find_lex $P319, "$class_name"
    unless_null $P319, vivify_203
    new $P319, "Undef"
  vivify_203:
    get_global $P320, "%Class_info"
    unless_null $P320, vivify_204
    new $P320, "Hash"
  vivify_204:
    set $P321, $P320[$P319]
    unless_null $P321, vivify_205
    new $P321, "Undef"
  vivify_205:
    if $P321, unless_318_end
    .const 'Sub' $P323 = "40_1256214664.66218" 
    capture_lex $P323
    $P323()
  unless_318_end:
    new $P334, "Exception"
    set $P334['type'], 58
    find_lex $P335, "$class_name"
    unless_null $P335, vivify_212
    new $P335, "Undef"
  vivify_212:
    get_global $P336, "%Class_info"
    unless_null $P336, vivify_213
    new $P336, "Hash"
  vivify_213:
    set $P337, $P336[$P335]
    unless_null $P337, vivify_214
    new $P337, "Undef"
  vivify_214:
    setattribute $P334, 'payload', $P337
    throw $P334
    .return ()
  control_314:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P338, exception, "payload"
    .return ($P338)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block322"  :anon :subid("40_1256214664.66218") :outer("39_1256214664.66218")
    get_hll_global $P324, ["Hash"], "new"
    $P325 = $P324()
    find_lex $P326, "$class_name"
    unless_null $P326, vivify_206
    new $P326, "Undef"
  vivify_206:
    get_global $P327, "%Class_info"
    unless_null $P327, vivify_207
    new $P327, "Hash"
    set_global "%Class_info", $P327
  vivify_207:
    set $P327[$P326], $P325
    find_lex $P328, "$class_name"
    unless_null $P328, vivify_208
    new $P328, "Undef"
  vivify_208:
    get_global $P329, "%Class_info"
    unless_null $P329, vivify_209
    new $P329, "Hash"
  vivify_209:
    set $P330, $P329[$P328]
    unless_null $P330, vivify_210
    new $P330, "Undef"
  vivify_210:
    .lex "$info", $P330
    get_hll_global $P331, ["Hash"], "empty"
    $P332 = $P331()
    find_lex $P333, "$info"
    unless_null $P333, vivify_211
    new $P333, "Hash"
    store_lex "$info", $P333
  vivify_211:
    set $P333["multisubs"], $P332
    .return ($P332)
.end


.namespace ["Class"]
.sub "compile_default_multi"  :subid("41_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_342
    .param pmc param_343
    .param pmc param_344 :optional :named("is_method")
    .param int has_param_344 :opt_flag
    .const 'Sub' $P372 = "43_1256214664.66218" 
    capture_lex $P372
    .const 'Sub' $P362 = "42_1256214664.66218" 
    capture_lex $P362
    new $P341, 'ExceptionHandler'
    set_addr $P341, control_340
    $P341."handle_types"(58)
    push_eh $P341
    .lex "$class_name", param_342
    .lex "$multi_name", param_343
    if has_param_344, optparam_215
    new $P345, "Undef"
    set param_344, $P345
  optparam_215:
    .lex "$is_method", param_344
    find_lex $P348, "$is_method"
    unless_null $P348, vivify_216
    new $P348, "Undef"
  vivify_216:
    if $P348, if_347
    new $P350, "String"
    assign $P350, "multisub"
    set $P346, $P350
    goto if_347_end
  if_347:
    new $P349, "String"
    assign $P349, "multimethod"
    set $P346, $P349
  if_347_end:
    .lex "$kind", $P346
    find_lex $P351, "$kind"
    unless_null $P351, vivify_217
    new $P351, "Undef"
  vivify_217:
    find_lex $P352, "$class_name"
    unless_null $P352, vivify_218
    new $P352, "Undef"
  vivify_218:
    find_lex $P353, "$multi_name"
    unless_null $P353, vivify_219
    new $P353, "Undef"
  vivify_219:
    "NOTE"("Compiling default ", $P351, " for: ", $P352, " :: ", $P353)
    "NOTE"("Looking for fallback method in parent class(es)")
    get_hll_global $P354, ["Class"], "find_method_named"
    find_lex $P355, "$class_name"
    unless_null $P355, vivify_220
    new $P355, "Undef"
  vivify_220:
    find_lex $P356, "$multi_name"
    unless_null $P356, vivify_221
    new $P356, "Undef"
  vivify_221:
    $P357 = $P354($P355, $P356)
    .lex "$default_method", $P357
    new $P366, 'ExceptionHandler'
    set_addr $P366, loop365_handler
    $P366."handle_types"(65, 67, 66)
    push_eh $P366
  loop365_test:
    get_hll_global $P358, ["Parrot"], "isa"
    find_lex $P359, "$default_method"
    unless_null $P359, vivify_222
    new $P359, "Undef"
  vivify_222:
    $P360 = $P358($P359, "MultiSub")
    unless $P360, loop365_done
  loop365_redo:
    .const 'Sub' $P362 = "42_1256214664.66218" 
    capture_lex $P362
    $P362()
  loop365_next:
    goto loop365_test
  loop365_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P367, exception, 'type'
    eq $P367, 65, loop365_next
    eq $P367, 67, loop365_redo
  loop365_done:
    pop_eh 
    new $P368, "ResizablePMCArray"
    .lex "@actions", $P368
    find_lex $P370, "$default_method"
    unless_null $P370, vivify_225
    new $P370, "Undef"
  vivify_225:
    if $P370, unless_369_end
    .const 'Sub' $P372 = "43_1256214664.66218" 
    capture_lex $P372
    $P372()
  unless_369_end:
    find_lex $P375, "$class_name"
    unless_null $P375, vivify_227
    new $P375, "Undef"
  vivify_227:
    find_lex $P376, "$multi_name"
    unless_null $P376, vivify_228
    new $P376, "Undef"
  vivify_228:
    find_lex $P377, "@actions"
    unless_null $P377, vivify_229
    new $P377, "ResizablePMCArray"
  vivify_229:
    find_lex $P378, "$is_method"
    unless_null $P378, vivify_230
    new $P378, "Undef"
  vivify_230:
    find_lex $P379, "$default_method"
    unless_null $P379, vivify_231
    new $P379, "Undef"
  vivify_231:
    $P380 = "compile_multi"($P375, $P376, $P377 :named("actions"), $P378 :named("is_method"), $P379 :named("target"))
    .return ($P380)
  control_340:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P381, exception, "payload"
    .return ($P381)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block361"  :anon :subid("42_1256214664.66218") :outer("41_1256214664.66218")
    "NOTE"("I don't think nesting multisubs is possible, but...")
    find_lex $P363, "$default_method"
    unless_null $P363, vivify_223
    new $P363, "ResizablePMCArray"
  vivify_223:
    set $P364, $P363[0]
    unless_null $P364, vivify_224
    new $P364, "Undef"
  vivify_224:
    store_lex "$default_method", $P364
    .return ($P364)
.end


.namespace ["Class"]
.sub "_block371"  :anon :subid("43_1256214664.66218") :outer("41_1256214664.66218")
    find_lex $P373, "@actions"
    unless_null $P373, vivify_226
    new $P373, "ResizablePMCArray"
  vivify_226:
    $P374 = $P373."push"("die 'No method available that will accept the parameters given'")
    .return ($P374)
.end


.namespace ["Class"]
.sub "compile_multi"  :subid("44_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_385
    .param pmc param_386
    .param pmc param_387 :slurpy
    .param pmc param_388 :optional :named("target")
    .param int has_param_388 :opt_flag
    .param pmc param_390 :optional :named("actions")
    .param int has_param_390 :opt_flag
    .param pmc param_392 :optional :named("is_method")
    .param int has_param_392 :opt_flag
    .const 'Sub' $P423 = "46_1256214664.66218" 
    capture_lex $P423
    .const 'Sub' $P408 = "45_1256214664.66218" 
    capture_lex $P408
    new $P384, 'ExceptionHandler'
    set_addr $P384, control_383
    $P384."handle_types"(58)
    push_eh $P384
    .lex "$class_name", param_385
    .lex "$multi_name", param_386
    .lex "@param_types", param_387
    if has_param_388, optparam_232
    new $P389, "Undef"
    set param_388, $P389
  optparam_232:
    .lex "$target", param_388
    if has_param_390, optparam_233
    new $P391, "Undef"
    set param_390, $P391
  optparam_233:
    .lex "@actions", param_390
    if has_param_392, optparam_234
    new $P393, "Undef"
    set param_392, $P393
  optparam_234:
    .lex "$is_method", param_392
    find_lex $P396, "$is_method"
    unless_null $P396, vivify_235
    new $P396, "Undef"
  vivify_235:
    if $P396, if_395
    new $P398, "String"
    assign $P398, "multisub"
    set $P394, $P398
    goto if_395_end
  if_395:
    new $P397, "String"
    assign $P397, "multimethod"
    set $P394, $P397
  if_395_end:
    .lex "$kind", $P394
    find_lex $P399, "$kind"
    unless_null $P399, vivify_236
    new $P399, "Undef"
  vivify_236:
    find_lex $P400, "$class_name"
    unless_null $P400, vivify_237
    new $P400, "Undef"
  vivify_237:
    find_lex $P401, "$multi_name"
    unless_null $P401, vivify_238
    new $P401, "Undef"
  vivify_238:
    find_lex $P402, "@param_types"
    unless_null $P402, vivify_239
    new $P402, "ResizablePMCArray"
  vivify_239:
    $P403 = $P402."join"(", ")
    find_lex $P404, "$target"
    unless_null $P404, vivify_240
    new $P404, "Undef"
  vivify_240:
    "NOTE"("Compiling ", $P399, " trampoline [", $P400, "::", $P401, "(", $P403, ", ...) -> ", $P404)
    find_lex $P406, "$is_method"
    unless_null $P406, vivify_241
    new $P406, "Undef"
  vivify_241:
    unless $P406, if_405_end
    .const 'Sub' $P408 = "45_1256214664.66218" 
    capture_lex $P408
    $P408()
  if_405_end:
    find_lex $P411, "$class_name"
    unless_null $P411, vivify_243
    new $P411, "Undef"
  vivify_243:
    $P412 = "_class_info"($P411)
    .lex "$class_info", $P412
    find_lex $P413, "@param_types"
    unless_null $P413, vivify_244
    new $P413, "ResizablePMCArray"
  vivify_244:
    $P414 = "signature"($P413)
    .lex "$signature", $P414
    find_lex $P416, "$signature"
    unless_null $P416, vivify_245
    new $P416, "Undef"
  vivify_245:
    find_lex $P417, "$multi_name"
    unless_null $P417, vivify_246
    new $P417, "Undef"
  vivify_246:
    find_lex $P418, "$class_info"
    unless_null $P418, vivify_247
    new $P418, "Hash"
  vivify_247:
    set $P419, $P418["multisubs"]
    unless_null $P419, vivify_248
    new $P419, "Hash"
  vivify_248:
    set $P420, $P419[$P417]
    unless_null $P420, vivify_249
    new $P420, "Hash"
  vivify_249:
    set $P421, $P420[$P416]
    unless_null $P421, vivify_250
    new $P421, "Undef"
  vivify_250:
    unless $P421, if_415_end
    .const 'Sub' $P423 = "46_1256214664.66218" 
    capture_lex $P423
    $P423()
  if_415_end:
    new $P426, "Integer"
    assign $P426, 1
    find_lex $P427, "$signature"
    unless_null $P427, vivify_251
    new $P427, "Undef"
  vivify_251:
    find_lex $P428, "$multi_name"
    unless_null $P428, vivify_252
    new $P428, "Undef"
  vivify_252:
    find_lex $P429, "$class_info"
    unless_null $P429, vivify_253
    new $P429, "Hash"
    store_lex "$class_info", $P429
  vivify_253:
    set $P430, $P429["multisubs"]
    unless_null $P430, vivify_254
    new $P430, "Hash"
    set $P429["multisubs"], $P430
  vivify_254:
    set $P431, $P430[$P428]
    unless_null $P431, vivify_255
    new $P431, "Hash"
    set $P430[$P428], $P431
  vivify_255:
    set $P431[$P427], $P426
    find_lex $P432, "$class_name"
    unless_null $P432, vivify_256
    new $P432, "Undef"
  vivify_256:
    find_lex $P433, "$multi_name"
    unless_null $P433, vivify_257
    new $P433, "Undef"
  vivify_257:
    find_lex $P434, "@actions"
    unless_null $P434, vivify_258
    new $P434, "ResizablePMCArray"
  vivify_258:
    new $P435, "String"
    assign $P435, ":multi("
    find_lex $P436, "$signature"
    unless_null $P436, vivify_259
    new $P436, "Undef"
  vivify_259:
    concat $P437, $P435, $P436
    concat $P438, $P437, ")"
    find_lex $P441, "$is_method"
    unless_null $P441, vivify_260
    new $P441, "Undef"
  vivify_260:
    if $P441, if_440
    set $S439, ""
    goto if_440_end
  if_440:
    set $S439, " :method"
  if_440_end:
    concat $P442, $P438, $S439
    find_lex $P443, "$is_method"
    unless_null $P443, vivify_261
    new $P443, "Undef"
  vivify_261:
    find_lex $P444, "$target"
    unless_null $P444, vivify_262
    new $P444, "Undef"
  vivify_262:
    $P445 = "trampoline"($P432, $P433, $P434 :named("actions"), $P442 :named("adverbs"), $P443 :named("is_method"), $P444 :named("target"))
    .return ($P445)
  control_383:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P446, exception, "payload"
    .return ($P446)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block407"  :anon :subid("45_1256214664.66218") :outer("44_1256214664.66218")
    find_lex $P409, "@param_types"
    unless_null $P409, vivify_242
    new $P409, "ResizablePMCArray"
  vivify_242:
    $P410 = $P409."unshift"("_")
    .return ($P410)
.end


.namespace ["Class"]
.sub "_block422"  :anon :subid("46_1256214664.66218") :outer("44_1256214664.66218")
    "NOTE"("This trampoline has already been compiled.")
    new $P424, "Exception"
    set $P424['type'], 58
    new $P425, "Integer"
    assign $P425, 0
    setattribute $P424, 'payload', $P425
    throw $P424
    .return ()
.end


.namespace ["Class"]
.sub "dispatch_method"  :subid("47_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_450
    .param pmc param_451
    .param pmc param_452
    .param pmc param_453
    .const 'Sub' $P477 = "50_1256214664.66218" 
    capture_lex $P477
    .const 'Sub' $P470 = "49_1256214664.66218" 
    capture_lex $P470
    .const 'Sub' $P464 = "48_1256214664.66218" 
    capture_lex $P464
    new $P449, 'ExceptionHandler'
    set_addr $P449, control_448
    $P449."handle_types"(58)
    push_eh $P449
    .lex "$object", param_450
    .lex "%dispatch", param_451
    .lex "@args", param_452
    .lex "%opts", param_453
    new $P454, "Undef"
    .lex "$type", $P454
    find_lex $P455, "$object"
    unless_null $P455, vivify_263
    new $P455, "Undef"
  vivify_263:
    "NOTE"("Dispatching method of ", $P455, " based on type of first arg.")
    find_lex $P456, "$object"
    unless_null $P456, vivify_264
    new $P456, "Undef"
  vivify_264:
    find_lex $P457, "%dispatch"
    unless_null $P457, vivify_265
    new $P457, "Hash"
  vivify_265:
    find_lex $P458, "@args"
    unless_null $P458, vivify_266
    new $P458, "ResizablePMCArray"
  vivify_266:
    find_lex $P459, "%opts"
    unless_null $P459, vivify_267
    new $P459, "Hash"
  vivify_267:
    "DUMP"($P456, $P457, $P458, $P459)
    find_lex $P461, "@args"
    unless_null $P461, vivify_268
    new $P461, "ResizablePMCArray"
  vivify_268:
    set $N462, $P461
    if $N462, if_460
    .const 'Sub' $P470 = "49_1256214664.66218" 
    capture_lex $P470
    $P470()
    goto if_460_end
  if_460:
    .const 'Sub' $P464 = "48_1256214664.66218" 
    capture_lex $P464
    $P464()
  if_460_end:
    find_lex $P473, "$type"
    unless_null $P473, vivify_271
    new $P473, "Undef"
  vivify_271:
    find_lex $P474, "%dispatch"
    unless_null $P474, vivify_272
    new $P474, "Hash"
  vivify_272:
    set $P475, $P474[$P473]
    unless_null $P475, vivify_273
    new $P475, "Undef"
  vivify_273:
    .lex "$method_name", $P475
    if $P475, unless_472_end
    .const 'Sub' $P477 = "50_1256214664.66218" 
    capture_lex $P477
    $P477()
  unless_472_end:
    find_lex $P480, "$method_name"
    unless_null $P480, vivify_276
    new $P480, "Undef"
  vivify_276:
    find_lex $P481, "$type"
    unless_null $P481, vivify_277
    new $P481, "Undef"
  vivify_277:
    "ASSERT"($P480, "Unable to dispatch method for type ", $P481)
    new $P482, "Exception"
    set $P482['type'], 58
    find_lex $P483, "$object"
    unless_null $P483, vivify_278
    new $P483, "Undef"
  vivify_278:
    find_lex $P484, "$method_name"
    unless_null $P484, vivify_279
    new $P484, "Undef"
  vivify_279:
    find_lex $P485, "@args"
    unless_null $P485, vivify_280
    new $P485, "ResizablePMCArray"
  vivify_280:
    find_lex $P486, "%opts"
    unless_null $P486, vivify_281
    new $P486, "Hash"
  vivify_281:
    $P487 = "call_method_"($P483, $P484, $P485, $P486)
    setattribute $P482, 'payload', $P487
    throw $P482
    .return ()
  control_448:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P488, exception, "payload"
    .return ($P488)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block469"  :anon :subid("49_1256214664.66218") :outer("47_1256214664.66218")
    new $P471, "String"
    assign $P471, "NULLARY"
    store_lex "$type", $P471
    .return ($P471)
.end


.namespace ["Class"]
.sub "_block463"  :anon :subid("48_1256214664.66218") :outer("47_1256214664.66218")
    get_hll_global $P465, ["Class"], "name_of"
    find_lex $P466, "@args"
    unless_null $P466, vivify_269
    new $P466, "ResizablePMCArray"
  vivify_269:
    set $P467, $P466[0]
    unless_null $P467, vivify_270
    new $P467, "Undef"
  vivify_270:
    $P468 = $P465($P467, "" :named("delimiter"))
    store_lex "$type", $P468
    .return ($P468)
.end


.namespace ["Class"]
.sub "_block476"  :anon :subid("50_1256214664.66218") :outer("47_1256214664.66218")
    find_lex $P478, "%dispatch"
    unless_null $P478, vivify_274
    new $P478, "Hash"
  vivify_274:
    set $P479, $P478["DEFAULT"]
    unless_null $P479, vivify_275
    new $P479, "Undef"
  vivify_275:
    store_lex "$method_name", $P479
    .return ($P479)
.end


.namespace ["Class"]
.sub "find_class_named"  :subid("51_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_492
    .const 'Sub' $P501 = "52_1256214664.66218" 
    capture_lex $P501
    new $P491, 'ExceptionHandler'
    set_addr $P491, control_490
    $P491."handle_types"(58)
    push_eh $P491
    .lex "$class_name", param_492
    get_hll_global $P493, ["Parrot"], "get_class"
    find_lex $P494, "$class_name"
    unless_null $P494, vivify_282
    new $P494, "Undef"
  vivify_282:
    $P495 = $P493($P494)
    .lex "$class", $P495
    get_hll_global $P497, ["Parrot"], "defined"
    find_lex $P498, "$class"
    unless_null $P498, vivify_283
    new $P498, "Undef"
  vivify_283:
    $P499 = $P497($P498)
    if $P499, unless_496_end
    .const 'Sub' $P501 = "52_1256214664.66218" 
    capture_lex $P501
    $P501()
  unless_496_end:
    new $P507, "Exception"
    set $P507['type'], 58
    find_lex $P508, "$class"
    unless_null $P508, vivify_285
    new $P508, "Undef"
  vivify_285:
    setattribute $P507, 'payload', $P508
    throw $P507
    .return ()
  control_490:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P509, exception, "payload"
    .return ($P509)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block500"  :anon :subid("52_1256214664.66218") :outer("51_1256214664.66218")
    get_hll_global $P502, ["Parrot"], "get_class"
    get_hll_global $P503, ["Parrot"], "get_namespace"
    find_lex $P504, "$class_name"
    unless_null $P504, vivify_284
    new $P504, "Undef"
  vivify_284:
    $P505 = $P503($P504)
    $P506 = $P502($P505)
    store_lex "$class", $P506
    .return ($P506)
.end


.namespace ["Class"]
.sub "find_method_named"  :subid("53_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_513
    .param pmc param_514
    .const 'Sub' $P538 = "56_1256214664.66218" 
    capture_lex $P538
    .const 'Sub' $P530 = "55_1256214664.66218" 
    capture_lex $P530
    .const 'Sub' $P520 = "54_1256214664.66218" 
    capture_lex $P520
    new $P512, 'ExceptionHandler'
    set_addr $P512, control_511
    $P512."handle_types"(58)
    push_eh $P512
    .lex "$class", param_513
    .lex "$method", param_514
    get_hll_global $P516, ["Parrot"], "isa"
    find_lex $P517, "$class"
    unless_null $P517, vivify_286
    new $P517, "Undef"
  vivify_286:
    $P518 = $P516($P517, "String")
    if $P518, if_515
    get_hll_global $P525, ["Parrot"], "isa"
    find_lex $P526, "$class"
    unless_null $P526, vivify_287
    new $P526, "Undef"
  vivify_287:
    $P527 = $P525($P526, "Class")
    isfalse $I528, $P527
    if $I528, if_524
    .const 'Sub' $P538 = "56_1256214664.66218" 
    capture_lex $P538
    $P538()
    goto if_524_end
  if_524:
    .const 'Sub' $P530 = "55_1256214664.66218" 
    capture_lex $P530
    $P530()
  if_524_end:
    goto if_515_end
  if_515:
    .const 'Sub' $P520 = "54_1256214664.66218" 
    capture_lex $P520
    $P520()
  if_515_end:
    find_lex $P541, "$class"
    unless_null $P541, vivify_294
    new $P541, "Undef"
  vivify_294:
    find_lex $P542, "$method"
    unless_null $P542, vivify_295
    new $P542, "Undef"
  vivify_295:
    $P543 = $P541."find_method"($P542)
    .lex "$result", $P543
    new $P544, "Exception"
    set $P544['type'], 58
    find_lex $P545, "$result"
    unless_null $P545, vivify_296
    new $P545, "Undef"
  vivify_296:
    setattribute $P544, 'payload', $P545
    throw $P544
    .return ()
  control_511:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P546, exception, "payload"
    .return ($P546)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block537"  :anon :subid("56_1256214664.66218") :outer("53_1256214664.66218")
    find_lex $P539, "$class"
    unless_null $P539, vivify_288
    new $P539, "Undef"
  vivify_288:
    $P540 = "NOTE"("Got Class PMC: ", $P539)
    .return ($P540)
.end


.namespace ["Class"]
.sub "_block529"  :anon :subid("55_1256214664.66218") :outer("53_1256214664.66218")
    find_lex $P531, "$class"
    unless_null $P531, vivify_289
    new $P531, "Undef"
  vivify_289:
    "NOTE"("Got object PMC: ", $P531)
    get_hll_global $P532, ["Parrot"], "typeof"
    find_lex $P533, "$class"
    unless_null $P533, vivify_290
    new $P533, "Undef"
  vivify_290:
    $P534 = $P532($P533)
    store_lex "$class", $P534
    find_lex $P535, "$class"
    unless_null $P535, vivify_291
    new $P535, "Undef"
  vivify_291:
    $P536 = "NOTE"("Resolved to Class PMC: ", $P535)
    .return ($P536)
.end


.namespace ["Class"]
.sub "_block519"  :anon :subid("54_1256214664.66218") :outer("53_1256214664.66218")
    find_lex $P521, "$class"
    unless_null $P521, vivify_292
    new $P521, "Undef"
  vivify_292:
    "NOTE"("Got class name: ", $P521)
    find_lex $P522, "$class"
    unless_null $P522, vivify_293
    new $P522, "Undef"
  vivify_293:
    $P523 = "find_class_named"($P522)
    store_lex "$class", $P523
    .return ($P523)
.end


.namespace ["Class"]
.sub "get_meta"  :subid("57_1256214664.66218") :outer("11_1256214664.66218")
    .const 'Sub' $P556 = "58_1256214664.66218" 
    capture_lex $P556
    new $P549, 'ExceptionHandler'
    set_addr $P549, control_548
    $P549."handle_types"(58)
    push_eh $P549
    get_global $P550, "$meta"
    unless_null $P550, vivify_297
    new $P550, "Undef"
  vivify_297:
    get_hll_global $P552, ["Parrot"], "defined"
    get_global $P553, "$meta"
    unless_null $P553, vivify_298
    new $P553, "Undef"
  vivify_298:
    $P554 = $P552($P553)
    if $P554, unless_551_end
    .const 'Sub' $P556 = "58_1256214664.66218" 
    capture_lex $P556
    $P556()
  unless_551_end:
    new $P558, "Exception"
    set $P558['type'], 58
    get_global $P559, "$meta"
    unless_null $P559, vivify_299
    new $P559, "Undef"
  vivify_299:
    setattribute $P558, 'payload', $P559
    throw $P558
    .return ()
  control_548:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P560, exception, "payload"
    .return ($P560)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block555"  :anon :subid("58_1256214664.66218") :outer("57_1256214664.66218")
 $P557 = new 'P6metaclass' 
    set_global "$meta", $P557
    .return ($P557)
.end


.namespace ["Class"]
.sub "get_method_list"  :subid("59_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_564
    .const 'Sub' $P573 = "60_1256214664.66218" 
    capture_lex $P573
    new $P563, 'ExceptionHandler'
    set_addr $P563, control_562
    $P563."handle_types"(58)
    push_eh $P563
    .lex "$obj", param_564
    get_hll_global $P565, ["Class"], "of"
    find_lex $P566, "$obj"
    unless_null $P566, vivify_300
    new $P566, "Undef"
  vivify_300:
    $P567 = $P565($P566)
    .lex "$class", $P567
    get_hll_global $P569, ["Parrot"], "defined"
    find_lex $P570, "$class"
    unless_null $P570, vivify_301
    new $P570, "Undef"
  vivify_301:
    $P571 = $P569($P570)
    if $P571, unless_568_end
    .const 'Sub' $P573 = "60_1256214664.66218" 
    capture_lex $P573
    $P573()
  unless_568_end:
    find_lex $P575, "$class"
    unless_null $P575, vivify_302
    new $P575, "Undef"
  vivify_302:
    $P576 = $P575."methods"()
    $P577 = $P576."keys"()
    .lex "@methods", $P577
    new $P578, "Exception"
    set $P578['type'], 58
    find_lex $P579, "@methods"
    unless_null $P579, vivify_303
    new $P579, "ResizablePMCArray"
  vivify_303:
    setattribute $P578, 'payload', $P579
    throw $P578
    .return ()
  control_562:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P580, exception, "payload"
    .return ($P580)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block572"  :anon :subid("60_1256214664.66218") :outer("59_1256214664.66218")
    $P574 = "die"("No class. Don't know what to do.")
    .return ($P574)
.end


.namespace ["Class"]
.sub "multi_method"  :subid("61_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_584
    .param pmc param_585
    .param pmc param_586 :optional :named("starting_with")
    .param int has_param_586 :opt_flag
    new $P583, 'ExceptionHandler'
    set_addr $P583, control_582
    $P583."handle_types"(58)
    push_eh $P583
    .lex "$class_name", param_584
    .lex "$multi_name", param_585
    if has_param_586, optparam_304
    new $P587, "Undef"
    set param_586, $P587
  optparam_304:
    .lex "$starting_with", param_586
    find_lex $P588, "$class_name"
    unless_null $P588, vivify_305
    new $P588, "Undef"
  vivify_305:
    find_lex $P589, "$multi_name"
    unless_null $P589, vivify_306
    new $P589, "Undef"
  vivify_306:
    find_lex $P590, "$starting_with"
    unless_null $P590, vivify_307
    new $P590, "Undef"
  vivify_307:
    $P591 = "multi_sub"($P588, $P589, $P590 :named("starting_with"), 1 :named("is_method"))
    .return ($P591)
  control_582:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P592, exception, "payload"
    .return ($P592)
    rethrow exception
.end


.namespace ["Class"]
.sub "multi_sub"  :subid("62_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_596
    .param pmc param_597
    .param pmc param_598 :optional :named("starting_with")
    .param int has_param_598 :opt_flag
    .param pmc param_600 :optional :named("is_method")
    .param int has_param_600 :opt_flag
    .const 'Sub' $P685 = "67_1256214664.66218" 
    capture_lex $P685
    .const 'Sub' $P645 = "65_1256214664.66218" 
    capture_lex $P645
    .const 'Sub' $P634 = "64_1256214664.66218" 
    capture_lex $P634
    .const 'Sub' $P617 = "63_1256214664.66218" 
    capture_lex $P617
    new $P595, 'ExceptionHandler'
    set_addr $P595, control_594
    $P595."handle_types"(58)
    push_eh $P595
    .lex "$class_name", param_596
    .lex "$multi_name", param_597
    if has_param_598, optparam_308
    new $P599, "Undef"
    set param_598, $P599
  optparam_308:
    .lex "$starting_with", param_598
    if has_param_600, optparam_309
    new $P601, "Undef"
    set param_600, $P601
  optparam_309:
    .lex "$is_method", param_600
    find_lex $P604, "$is_method"
    unless_null $P604, vivify_310
    new $P604, "Undef"
  vivify_310:
    if $P604, if_603
    new $P606, "String"
    assign $P606, "multisub"
    set $P602, $P606
    goto if_603_end
  if_603:
    new $P605, "String"
    assign $P605, "multimethod"
    set $P602, $P605
  if_603_end:
    .lex "$kind", $P602
    find_lex $P607, "$kind"
    unless_null $P607, vivify_311
    new $P607, "Undef"
  vivify_311:
    find_lex $P608, "$multi_name"
    unless_null $P608, vivify_312
    new $P608, "Undef"
  vivify_312:
    find_lex $P609, "$class_name"
    unless_null $P609, vivify_313
    new $P609, "Undef"
  vivify_313:
    find_lex $P610, "$starting_with"
    unless_null $P610, vivify_314
    new $P610, "Undef"
  vivify_314:
    "NOTE"("Creating new ", $P607, " '", $P608, "' for class ", $P609, ", out of methods starting with ", $P610)
    find_lex $P611, "$class_name"
    unless_null $P611, vivify_315
    new $P611, "Undef"
  vivify_315:
    $P612 = "_class_info"($P611)
    .lex "$class_info", $P612
    find_lex $P614, "$class_info"
    unless_null $P614, vivify_316
    new $P614, "Hash"
  vivify_316:
    set $P615, $P614["created"]
    unless_null $P615, vivify_317
    new $P615, "Undef"
  vivify_317:
    if $P615, unless_613_end
    .const 'Sub' $P617 = "63_1256214664.66218" 
    capture_lex $P617
    $P617()
  unless_613_end:
    find_lex $P620, "$class_info"
    unless_null $P620, vivify_319
    new $P620, "Undef"
  vivify_319:
    "DUMP"($P620)
    get_hll_global $P621, ["Parrot"], "get_namespace"
    find_lex $P622, "$class_name"
    unless_null $P622, vivify_320
    new $P622, "Undef"
  vivify_320:
    $P623 = $P621($P622)
    .lex "$nsp", $P623
    find_lex $P624, "$starting_with"
    unless_null $P624, vivify_321
    new $P624, "Undef"
  vivify_321:
    $P625 = $P624."length"()
    .lex "$prefix_len", $P625
    get_hll_global $P627, ["Parrot"], "defined"
    find_lex $P628, "$multi_name"
    unless_null $P628, vivify_322
    new $P628, "Undef"
  vivify_322:
    find_lex $P629, "$class_info"
    unless_null $P629, vivify_323
    new $P629, "Hash"
  vivify_323:
    set $P630, $P629["multisubs"]
    unless_null $P630, vivify_324
    new $P630, "Hash"
  vivify_324:
    set $P631, $P630[$P628]
    unless_null $P631, vivify_325
    new $P631, "Undef"
  vivify_325:
    $P632 = $P627($P631)
    if $P632, unless_626_end
    .const 'Sub' $P634 = "64_1256214664.66218" 
    capture_lex $P634
    $P634()
  unless_626_end:
    find_lex $P641, "$nsp"
    unless_null $P641, vivify_329
    new $P641, "Undef"
  vivify_329:
    defined $I642, $P641
    unless $I642, for_undef_330
    iter $P640, $P641
    new $P677, 'ExceptionHandler'
    set_addr $P677, loop676_handler
    $P677."handle_types"(65, 67, 66)
    push_eh $P677
  loop676_test:
    unless $P640, loop676_done
    shift $P643, $P640
  loop676_redo:
    .const 'Sub' $P645 = "65_1256214664.66218" 
    capture_lex $P645
    $P645($P643)
  loop676_next:
    goto loop676_test
  loop676_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P678, exception, 'type'
    eq $P678, 65, loop676_next
    eq $P678, 67, loop676_redo
  loop676_done:
    pop_eh 
  for_undef_330:
    "NOTE"("All matching trampolines built. Adding method to class.")
    find_lex $P679, "$multi_name"
    unless_null $P679, vivify_345
    new $P679, "Undef"
  vivify_345:
    find_lex $P680, "$nsp"
    unless_null $P680, vivify_346
    new $P680, "Hash"
  vivify_346:
    set $P681, $P680[$P679]
    unless_null $P681, vivify_347
    new $P681, "Undef"
  vivify_347:
    .lex "$multi_sub", $P681
    find_lex $P683, "$is_method"
    unless_null $P683, vivify_348
    new $P683, "Undef"
  vivify_348:
    unless $P683, if_682_end
    .const 'Sub' $P685 = "67_1256214664.66218" 
    capture_lex $P685
    $P685()
  if_682_end:
    $P691 = "NOTE"("done")
    .return ($P691)
  control_594:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P692, exception, "payload"
    .return ($P692)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block616"  :anon :subid("63_1256214664.66218") :outer("62_1256214664.66218")
    find_lex $P618, "$class_name"
    unless_null $P618, vivify_318
    new $P618, "Undef"
  vivify_318:
    $P619 = "DIE"("Class '", $P618, "' has not been created yet.")
    .return ($P619)
.end


.namespace ["Class"]
.sub "_block633"  :anon :subid("64_1256214664.66218") :outer("62_1256214664.66218")
    get_hll_global $P635, ["Class"], "compile_default_multi"
    find_lex $P636, "$class_name"
    unless_null $P636, vivify_326
    new $P636, "Undef"
  vivify_326:
    find_lex $P637, "$multi_name"
    unless_null $P637, vivify_327
    new $P637, "Undef"
  vivify_327:
    find_lex $P638, "$is_method"
    unless_null $P638, vivify_328
    new $P638, "Undef"
  vivify_328:
    $P639 = $P635($P636, $P637, $P638 :named("is_method"))
    .return ($P639)
.end


.namespace ["Class"]
.sub "_block644"  :anon :subid("65_1256214664.66218") :outer("62_1256214664.66218")
    .param pmc param_646
    .const 'Sub' $P659 = "66_1256214664.66218" 
    capture_lex $P659
    .lex "$_", param_646
    find_lex $P647, "$_"
    unless_null $P647, vivify_331
    new $P647, "Undef"
  vivify_331:
    set $S648, $P647
    new $P649, 'String'
    set $P649, $S648
    .lex "$name", $P649
    find_lex $P652, "$name"
    unless_null $P652, vivify_332
    new $P652, "Undef"
  vivify_332:
    find_lex $P653, "$prefix_len"
    unless_null $P653, vivify_333
    new $P653, "Undef"
  vivify_333:
    $S654 = $P652."substr"(0, $P653)
    find_lex $P655, "$starting_with"
    unless_null $P655, vivify_334
    new $P655, "Undef"
  vivify_334:
    set $S656, $P655
    iseq $I657, $S654, $S656
    if $I657, if_651
    new $P650, 'Integer'
    set $P650, $I657
    goto if_651_end
  if_651:
    .const 'Sub' $P659 = "66_1256214664.66218" 
    capture_lex $P659
    $P675 = $P659()
    set $P650, $P675
  if_651_end:
    .return ($P650)
.end


.namespace ["Class"]
.sub "_block658"  :anon :subid("66_1256214664.66218") :outer("65_1256214664.66218")
    find_lex $P660, "$name"
    unless_null $P660, vivify_335
    new $P660, "Undef"
  vivify_335:
    find_lex $P661, "$prefix_len"
    unless_null $P661, vivify_336
    new $P661, "Undef"
  vivify_336:
    $P662 = $P660."substr"($P661)
    .lex "$param_class", $P662
    find_lex $P663, "$param_class"
    unless_null $P663, vivify_337
    new $P663, "Undef"
  vivify_337:
    $P664 = $P663."split"("_")
    $P665 = $P664."join"("::")
    .lex "$param1_class", $P665
    find_lex $P666, "$multi_name"
    unless_null $P666, vivify_338
    new $P666, "Undef"
  vivify_338:
    find_lex $P667, "$param1_class"
    unless_null $P667, vivify_339
    new $P667, "Undef"
  vivify_339:
    "NOTE"("Compiling '", $P666, "' handler for (_, ", $P667, ")")
    get_hll_global $P668, ["Class"], "compile_multi"
    find_lex $P669, "$class_name"
    unless_null $P669, vivify_340
    new $P669, "Undef"
  vivify_340:
    find_lex $P670, "$multi_name"
    unless_null $P670, vivify_341
    new $P670, "Undef"
  vivify_341:
    find_lex $P671, "$param1_class"
    unless_null $P671, vivify_342
    new $P671, "Undef"
  vivify_342:
    find_lex $P672, "$is_method"
    unless_null $P672, vivify_343
    new $P672, "Undef"
  vivify_343:
    find_lex $P673, "$name"
    unless_null $P673, vivify_344
    new $P673, "Undef"
  vivify_344:
    $P674 = $P668($P669, $P670, $P671, $P672 :named("is_method"), $P673 :named("target"))
    .return ($P674)
.end


.namespace ["Class"]
.sub "_block684"  :anon :subid("67_1256214664.66218") :outer("62_1256214664.66218")
    $P686 = "get_meta"()
    find_lex $P687, "$class_name"
    unless_null $P687, vivify_349
    new $P687, "Undef"
  vivify_349:
    find_lex $P688, "$multi_name"
    unless_null $P688, vivify_350
    new $P688, "Undef"
  vivify_350:
    find_lex $P689, "$multi_sub"
    unless_null $P689, vivify_351
    new $P689, "Undef"
  vivify_351:
    $P690 = $P686."add_method"($P687, $P688, $P689)
    .return ($P690)
.end


.namespace ["Class"]
.sub "name_of"  :subid("68_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_696
    .param pmc param_697 :optional :named("delimiter")
    .param int has_param_697 :opt_flag
    .const 'Sub' $P704 = "69_1256214664.66218" 
    capture_lex $P704
    new $P695, 'ExceptionHandler'
    set_addr $P695, control_694
    $P695."handle_types"(58)
    push_eh $P695
    .lex "$object", param_696
    if has_param_697, optparam_352
    new $P698, "Undef"
    set param_697, $P698
  optparam_352:
    .lex "$delimiter", param_697
    get_hll_global $P700, ["Parrot"], "defined"
    find_lex $P701, "$delimiter"
    unless_null $P701, vivify_353
    new $P701, "Undef"
  vivify_353:
    $P702 = $P700($P701)
    if $P702, unless_699_end
    .const 'Sub' $P704 = "69_1256214664.66218" 
    capture_lex $P704
    $P704()
  unless_699_end:
    get_hll_global $P706, ["Class"], "of"
    find_lex $P707, "$object"
    unless_null $P707, vivify_354
    new $P707, "Undef"
  vivify_354:
    $P708 = $P706($P707)
    set $S709, $P708
    new $P710, 'String'
    set $P710, $S709
    .lex "$class", $P710
    find_lex $P711, "$class"
    unless_null $P711, vivify_355
    new $P711, "Undef"
  vivify_355:
    $P712 = $P711."split"(";")
    find_lex $P713, "$delimiter"
    unless_null $P713, vivify_356
    new $P713, "Undef"
  vivify_356:
    $P714 = $P712."join"($P713)
    store_lex "$class", $P714
    new $P715, "Exception"
    set $P715['type'], 58
    find_lex $P716, "$class"
    unless_null $P716, vivify_357
    new $P716, "Undef"
  vivify_357:
    setattribute $P715, 'payload', $P716
    throw $P715
    .return ()
  control_694:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P717, exception, "payload"
    .return ($P717)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block703"  :anon :subid("69_1256214664.66218") :outer("68_1256214664.66218")
    new $P705, "String"
    assign $P705, "::"
    store_lex "$delimiter", $P705
    .return ($P705)
.end


.namespace ["Class"]
.sub "of"  :subid("70_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_721
    .const 'Sub' $P734 = "72_1256214664.66218" 
    capture_lex $P734
    .const 'Sub' $P728 = "71_1256214664.66218" 
    capture_lex $P728
    new $P720, 'ExceptionHandler'
    set_addr $P720, control_719
    $P720."handle_types"(58)
    push_eh $P720
    .lex "$object", param_721
    new $P722, "Undef"
    .lex "$class", $P722
    get_hll_global $P724, ["Parrot"], "isa"
    find_lex $P725, "$object"
    unless_null $P725, vivify_358
    new $P725, "Undef"
  vivify_358:
    $P726 = $P724($P725, "P6object")
    if $P726, if_723
    .const 'Sub' $P734 = "72_1256214664.66218" 
    capture_lex $P734
    $P734()
    goto if_723_end
  if_723:
    .const 'Sub' $P728 = "71_1256214664.66218" 
    capture_lex $P728
    $P728()
  if_723_end:
    new $P738, "Exception"
    set $P738['type'], 58
    find_lex $P739, "$class"
    unless_null $P739, vivify_361
    new $P739, "Undef"
  vivify_361:
    setattribute $P738, 'payload', $P739
    throw $P738
    .return ()
  control_719:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P740, exception, "payload"
    .return ($P740)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block733"  :anon :subid("72_1256214664.66218") :outer("70_1256214664.66218")
    get_hll_global $P735, ["Parrot"], "typeof"
    find_lex $P736, "$object"
    unless_null $P736, vivify_359
    new $P736, "Undef"
  vivify_359:
    $P737 = $P735($P736)
    store_lex "$class", $P737
    .return ($P737)
.end


.namespace ["Class"]
.sub "_block727"  :anon :subid("71_1256214664.66218") :outer("70_1256214664.66218")
    get_hll_global $P729, ["Parrot"], "get_attribute"
    find_lex $P730, "$object"
    unless_null $P730, vivify_360
    new $P730, "Undef"
  vivify_360:
    $P731 = $P730."HOW"()
    $P732 = $P729($P731, "parrotclass")
    store_lex "$class", $P732
    .return ($P732)
.end


.namespace ["Class"]
.sub "signature"  :subid("73_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_744
    .const 'Sub' $P751 = "74_1256214664.66218" 
    capture_lex $P751
    new $P743, 'ExceptionHandler'
    set_addr $P743, control_742
    $P743."handle_types"(58)
    push_eh $P743
    .lex "@types", param_744
    new $P745, "ResizablePMCArray"
    .lex "@sig_names", $P745
    find_lex $P747, "@types"
    unless_null $P747, vivify_362
    new $P747, "ResizablePMCArray"
  vivify_362:
    defined $I748, $P747
    unless $I748, for_undef_363
    iter $P746, $P747
    new $P772, 'ExceptionHandler'
    set_addr $P772, loop771_handler
    $P772."handle_types"(65, 67, 66)
    push_eh $P772
  loop771_test:
    unless $P746, loop771_done
    shift $P749, $P746
  loop771_redo:
    .const 'Sub' $P751 = "74_1256214664.66218" 
    capture_lex $P751
    $P751($P749)
  loop771_next:
    goto loop771_test
  loop771_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P773, exception, 'type'
    eq $P773, 65, loop771_next
    eq $P773, 67, loop771_redo
  loop771_done:
    pop_eh 
  for_undef_363:
    new $P774, "Exception"
    set $P774['type'], 58
    find_lex $P775, "@sig_names"
    unless_null $P775, vivify_370
    new $P775, "ResizablePMCArray"
  vivify_370:
    $P776 = $P775."join"(", ")
    setattribute $P774, 'payload', $P776
    throw $P774
    .return ()
  control_742:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P777, exception, "payload"
    .return ($P777)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block750"  :anon :subid("74_1256214664.66218") :outer("73_1256214664.66218")
    .param pmc param_752
    .lex "$_", param_752
    find_lex $P753, "$_"
    unless_null $P753, vivify_364
    new $P753, "Undef"
  vivify_364:
    set $S754, $P753
    new $P755, 'String'
    set $P755, $S754
    .lex "$type", $P755
    find_lex $P758, "$type"
    unless_null $P758, vivify_365
    new $P758, "Undef"
  vivify_365:
    set $S759, $P758
    iseq $I760, $S759, "_"
    if $I760, if_757
    new $P762, "String"
    assign $P762, "['"
    find_lex $P763, "$type"
    unless_null $P763, vivify_366
    new $P763, "Undef"
  vivify_366:
    $P764 = $P763."split"("::")
    $S765 = $P764."join"("';'")
    concat $P766, $P762, $S765
    concat $P767, $P766, "']"
    set $P756, $P767
    goto if_757_end
  if_757:
    find_lex $P761, "$type"
    unless_null $P761, vivify_367
    new $P761, "Undef"
  vivify_367:
    set $P756, $P761
  if_757_end:
    .lex "$type_sig", $P756
    find_lex $P768, "@sig_names"
    unless_null $P768, vivify_368
    new $P768, "ResizablePMCArray"
  vivify_368:
    find_lex $P769, "$type_sig"
    unless_null $P769, vivify_369
    new $P769, "Undef"
  vivify_369:
    $P770 = $P768."push"($P769)
    .return ($P770)
.end


.namespace ["Class"]
.sub "trampoline"  :subid("75_1256214664.66218") :outer("11_1256214664.66218")
    .param pmc param_781
    .param pmc param_782
    .param pmc param_783 :optional :named("target")
    .param int has_param_783 :opt_flag
    .param pmc param_785 :optional :named("actions")
    .param int has_param_785 :opt_flag
    .param pmc param_787 :optional :named("adverbs")
    .param int has_param_787 :opt_flag
    .param pmc param_789 :optional :named("is_method")
    .param int has_param_789 :opt_flag
    .const 'Sub' $P800 = "76_1256214664.66218" 
    capture_lex $P800
    new $P780, 'ExceptionHandler'
    set_addr $P780, control_779
    $P780."handle_types"(58)
    push_eh $P780
    .lex "$namespace", param_781
    .lex "$name", param_782
    if has_param_783, optparam_371
    new $P784, "Undef"
    set param_783, $P784
  optparam_371:
    .lex "$target", param_783
    if has_param_785, optparam_372
    new $P786, "Undef"
    set param_785, $P786
  optparam_372:
    .lex "@actions", param_785
    if has_param_787, optparam_373
    new $P788, "Undef"
    set param_787, $P788
  optparam_373:
    .lex "$adverbs", param_787
    if has_param_789, optparam_374
    new $P790, "Undef"
    set param_789, $P790
  optparam_374:
    .lex "$is_method", param_789
    find_lex $P791, "$namespace"
    unless_null $P791, vivify_375
    new $P791, "Undef"
  vivify_375:
    find_lex $P792, "$name"
    unless_null $P792, vivify_376
    new $P792, "Undef"
  vivify_376:
    find_lex $P793, "$target"
    unless_null $P793, vivify_377
    new $P793, "Undef"
  vivify_377:
    "NOTE"("Building trampoline [", $P791, "::", $P792, "] -> ", $P793)
    find_lex $P794, "$is_method"
    unless_null $P794, vivify_378
    new $P794, "Undef"
  vivify_378:
    "NOTE"("is_method? ", $P794)
    find_lex $P795, "$adverbs"
    unless_null $P795, vivify_379
    new $P795, "Undef"
  vivify_379:
    "NOTE"("With adverbs: ", $P795)
    find_lex $P797, "@actions"
    unless_null $P797, vivify_380
    new $P797, "ResizablePMCArray"
  vivify_380:
    set $N798, $P797
    if $N798, unless_796_end
    .const 'Sub' $P800 = "76_1256214664.66218" 
    capture_lex $P800
    $P800()
  unless_796_end:
    get_hll_global $P859, ["Array"], "new"
    new $P860, "String"
    assign $P860, ".namespace [ '"
    find_lex $P861, "$namespace"
    unless_null $P861, vivify_397
    new $P861, "Undef"
  vivify_397:
    $P862 = $P861."split"("::")
    $S863 = $P862."join"("' ; '")
    concat $P864, $P860, $S863
    concat $P865, $P864, "' ]"
    new $P866, "String"
    assign $P866, ".sub '"
    find_lex $P867, "$name"
    unless_null $P867, vivify_398
    new $P867, "Undef"
  vivify_398:
    concat $P868, $P866, $P867
    concat $P869, $P868, "' "
    find_lex $P870, "$adverbs"
    unless_null $P870, vivify_399
    new $P870, "Undef"
  vivify_399:
    concat $P871, $P869, $P870
    new $P872, "String"
    assign $P872, "\t"
    concat $P873, $P872, ".param pmc pos :slurpy"
    new $P874, "String"
    assign $P874, "\t"
    concat $P875, $P874, ".param pmc adv :slurpy :named"
    $P876 = $P859($P865, $P871, $P873, $P875)
    .lex "@code", $P876
    find_lex $P877, "@code"
    unless_null $P877, vivify_400
    new $P877, "ResizablePMCArray"
  vivify_400:
    find_lex $P878, "@actions"
    unless_null $P878, vivify_401
    new $P878, "ResizablePMCArray"
  vivify_401:
    $P877."append"($P878)
    find_lex $P879, "@code"
    unless_null $P879, vivify_402
    new $P879, "ResizablePMCArray"
  vivify_402:
    $P879."push"(".end")
    find_lex $P880, "@code"
    unless_null $P880, vivify_403
    new $P880, "ResizablePMCArray"
  vivify_403:
    $P881 = $P880."join"("\n")
    .lex "$trampoline", $P881
    find_lex $P882, "$trampoline"
    unless_null $P882, vivify_404
    new $P882, "Undef"
  vivify_404:
    "NOTE"("Trampoline is:\n", $P882)
    get_hll_global $P883, ["Parrot"], "compile"
    find_lex $P884, "$trampoline"
    unless_null $P884, vivify_405
    new $P884, "Undef"
  vivify_405:
    $P883($P884)
    $P885 = "NOTE"("Trampoline compiled okay.")
    .return ($P885)
  control_779:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P886, exception, "payload"
    .return ($P886)
    rethrow exception
.end


.namespace ["Class"]
.sub "_block799"  :anon :subid("76_1256214664.66218") :outer("75_1256214664.66218")
    .const 'Sub' $P842 = "79_1256214664.66218" 
    capture_lex $P842
    .const 'Sub' $P810 = "77_1256214664.66218" 
    capture_lex $P810
    get_hll_global $P801, ["Array"], "empty"
    $P802 = $P801()
    store_lex "@actions", $P802
    find_lex $P803, "$namespace"
    unless_null $P803, vivify_381
    new $P803, "Undef"
  vivify_381:
    .lex "$target_nsp", $P803
    get_hll_global $P805, ["Parrot"], "isa"
    find_lex $P806, "$target"
    unless_null $P806, vivify_382
    new $P806, "Undef"
  vivify_382:
    $P807 = $P805($P806, "String")
    isfalse $I808, $P807
    if $I808, if_804
    .const 'Sub' $P842 = "79_1256214664.66218" 
    capture_lex $P842
    $P842()
    goto if_804_end
  if_804:
    .const 'Sub' $P810 = "77_1256214664.66218" 
    capture_lex $P810
    $P810()
  if_804_end:
    find_lex $P847, "@actions"
    unless_null $P847, vivify_394
    new $P847, "ResizablePMCArray"
  vivify_394:
    new $P848, "String"
    assign $P848, "\t"
    concat $P849, $P848, ".tailcall "
    find_lex $P850, "$target"
    unless_null $P850, vivify_395
    new $P850, "Undef"
  vivify_395:
    concat $P851, $P849, $P850
    concat $P852, $P851, "("
    find_lex $P855, "$is_method"
    unless_null $P855, vivify_396
    new $P855, "Undef"
  vivify_396:
    if $P855, if_854
    set $S853, ""
    goto if_854_end
  if_854:
    set $S853, "self, "
  if_854_end:
    concat $P856, $P852, $S853
    concat $P857, $P856, "pos :flat, adv :flat :named)"
    $P858 = $P847."push"($P857)
    .return ($P858)
.end


.namespace ["Class"]
.sub "_block841"  :anon :subid("79_1256214664.66218") :outer("76_1256214664.66218")
    new $P843, "String"
    assign $P843, "'"
    find_lex $P844, "$target"
    unless_null $P844, vivify_383
    new $P844, "Undef"
  vivify_383:
    concat $P845, $P843, $P844
    concat $P846, $P845, "'"
    store_lex "$target", $P846
    .return ($P846)
.end


.namespace ["Class"]
.sub "_block809"  :anon :subid("77_1256214664.66218") :outer("76_1256214664.66218")
    .const 'Sub' $P825 = "78_1256214664.66218" 
    capture_lex $P825
    find_lex $P811, "$target"
    unless_null $P811, vivify_384
    new $P811, "Undef"
  vivify_384:
    $P812 = $P811."get_namespace"()
    $P813 = $P812."get_name"()
    .lex "@parts", $P813
    find_lex $P814, "@parts"
    unless_null $P814, vivify_385
    new $P814, "ResizablePMCArray"
  vivify_385:
    $P814."shift"()
    find_lex $P815, "@parts"
    unless_null $P815, vivify_386
    new $P815, "ResizablePMCArray"
  vivify_386:
    $P816 = $P815."join"("::")
    store_lex "$target_nsp", $P816
    find_lex $P819, "$target_nsp"
    unless_null $P819, vivify_387
    new $P819, "Undef"
  vivify_387:
    set $S820, $P819
    find_lex $P821, "$namespace"
    unless_null $P821, vivify_388
    new $P821, "Undef"
  vivify_388:
    set $S822, $P821
    isne $I823, $S820, $S822
    if $I823, if_818
    new $P817, 'Integer'
    set $P817, $I823
    goto if_818_end
  if_818:
    .const 'Sub' $P825 = "78_1256214664.66218" 
    capture_lex $P825
    $P840 = $P825()
    set $P817, $P840
  if_818_end:
    .return ($P817)
.end


.namespace ["Class"]
.sub "_block824"  :anon :subid("78_1256214664.66218") :outer("77_1256214664.66218")
    new $P826, "String"
    assign $P826, "\t"
    concat $P827, $P826, "$P0 = get_hll_global "
    .lex "$load_p0", $P827
    find_lex $P828, "$load_p0"
    unless_null $P828, vivify_389
    new $P828, "Undef"
  vivify_389:
    concat $P829, $P828, "[ '"
    find_lex $P830, "@parts"
    unless_null $P830, vivify_390
    new $P830, "ResizablePMCArray"
  vivify_390:
    $S831 = $P830."join"("' ; '")
    concat $P832, $P829, $S831
    concat $P833, $P832, "' ], '"
    find_lex $P834, "$target"
    unless_null $P834, vivify_391
    new $P834, "Undef"
  vivify_391:
    concat $P835, $P833, $P834
    concat $P836, $P835, "'"
    store_lex "$load_p0", $P836
    find_lex $P837, "@actions"
    unless_null $P837, vivify_392
    new $P837, "ResizablePMCArray"
  vivify_392:
    find_lex $P838, "$load_p0"
    unless_null $P838, vivify_393
    new $P838, "Undef"
  vivify_393:
    $P837."push"($P838)
    new $P839, "String"
    assign $P839, "$P0"
    store_lex "$target", $P839
    .return ($P839)
.end


.namespace ["Class";"ArrayBased"]
.sub "_block887" :init :load :subid("80_1256214664.66218")
    .const 'Sub' $P902 = "83_1256214664.66218" 
    capture_lex $P902
    .const 'Sub' $P889 = "81_1256214664.66218" 
    capture_lex $P889
    "_ONLOAD"()
    .const 'Sub' $P902 = "83_1256214664.66218" 
    capture_lex $P902
    .return ($P902)
.end


.namespace ["Class";"ArrayBased"]
.sub "_ONLOAD"  :subid("81_1256214664.66218") :outer("80_1256214664.66218")
    .const 'Sub' $P895 = "82_1256214664.66218" 
    capture_lex $P895
    new $P891, 'ExceptionHandler'
    set_addr $P891, control_890
    $P891."handle_types"(58)
    push_eh $P891
    get_global $P893, "$onload_done"
    unless_null $P893, vivify_406
    new $P893, "Undef"
  vivify_406:
    unless $P893, if_892_end
    .const 'Sub' $P895 = "82_1256214664.66218" 
    capture_lex $P895
    $P895()
  if_892_end:
    new $P898, "Integer"
    assign $P898, 1
    set_global "$onload_done", $P898
    get_hll_global $P899, ["Parrot"], "IMPORT"
    $P900 = $P899("Dumper")
    .return ($P900)
  control_890:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P901, exception, "payload"
    .return ($P901)
    rethrow exception
.end


.namespace ["Class";"ArrayBased"]
.sub "_block894"  :anon :subid("82_1256214664.66218") :outer("81_1256214664.66218")
    new $P896, "Exception"
    set $P896['type'], 58
    new $P897, "Integer"
    assign $P897, 0
    setattribute $P896, 'payload', $P897
    throw $P896
    .return ()
.end


.namespace ["Class";"ArrayBased"]
.sub "init"  :subid("83_1256214664.66218") :method :outer("80_1256214664.66218")
    .param pmc param_905
    .param pmc param_906
    new $P904, 'ExceptionHandler'
    set_addr $P904, control_903
    $P904."handle_types"(58)
    push_eh $P904
    .lex "self", self
    .lex "@children", param_905
    .lex "%attributes", param_906
    $P907 = "DIE"("NOT IMPLEMENTED. This class is but a shell.")
    .return ($P907)
  control_903:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P908, exception, "payload"
    .return ($P908)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_block909" :init :load :subid("84_1256214664.66218")
    .const 'Sub' $P1131 = "104_1256214664.66218" 
    capture_lex $P1131
    .const 'Sub' $P1120 = "103_1256214664.66218" 
    capture_lex $P1120
    .const 'Sub' $P1094 = "101_1256214664.66218" 
    capture_lex $P1094
    .const 'Sub' $P1081 = "100_1256214664.66218" 
    capture_lex $P1081
    .const 'Sub' $P1075 = "99_1256214664.66218" 
    capture_lex $P1075
    .const 'Sub' $P1049 = "97_1256214664.66218" 
    capture_lex $P1049
    .const 'Sub' $P1023 = "95_1256214664.66218" 
    capture_lex $P1023
    .const 'Sub' $P997 = "93_1256214664.66218" 
    capture_lex $P997
    .const 'Sub' $P971 = "91_1256214664.66218" 
    capture_lex $P971
    .const 'Sub' $P945 = "89_1256214664.66218" 
    capture_lex $P945
    .const 'Sub' $P937 = "88_1256214664.66218" 
    capture_lex $P937
    .const 'Sub' $P932 = "87_1256214664.66218" 
    capture_lex $P932
    .const 'Sub' $P912 = "85_1256214664.66218" 
    capture_lex $P912
    get_global $P911, "@empty"
    unless_null $P911, vivify_407
    new $P911, "ResizablePMCArray"
  vivify_407:
    "_ONLOAD"()
    .const 'Sub' $P1131 = "104_1256214664.66218" 
    capture_lex $P1131
    .return ($P1131)
.end


.namespace ["Class";"BaseBehavior"]
.sub "_ONLOAD"  :subid("85_1256214664.66218") :outer("84_1256214664.66218")
    .const 'Sub' $P918 = "86_1256214664.66218" 
    capture_lex $P918
    new $P914, 'ExceptionHandler'
    set_addr $P914, control_913
    $P914."handle_types"(58)
    push_eh $P914
    get_global $P916, "$onload_done"
    unless_null $P916, vivify_408
    new $P916, "Undef"
  vivify_408:
    unless $P916, if_915_end
    .const 'Sub' $P918 = "86_1256214664.66218" 
    capture_lex $P918
    $P918()
  if_915_end:
    new $P921, "Integer"
    assign $P921, 1
    set_global "$onload_done", $P921
    new $P922, "String"
    assign $P922, "\r\n.namespace [ 'Class' ; 'BaseBehavior' ]\r\n.sub '__get_bool' :vtable('get_bool') :method\r\n\t$I0 = self.'get_bool'()\r\n\t.return ($I0)\r\n.end"
    .lex "$get_bool", $P922
    get_hll_global $P923, ["Parrot"], "compile"
    find_lex $P924, "$get_bool"
    unless_null $P924, vivify_409
    new $P924, "Undef"
  vivify_409:
    $P923($P924)
    new $P925, "String"
    assign $P925, "\r\n.namespace [ 'Class' ; 'BaseBehavior' ]\r\n.sub '__get_string' :vtable('get_string') :method\r\n\t$S0 = self.'get_string'()\r\n\t.return ($S0)\r\n.end"
    .lex "$get_string", $P925
    get_hll_global $P926, ["Parrot"], "compile"
    find_lex $P927, "$get_string"
    unless_null $P927, vivify_410
    new $P927, "Undef"
  vivify_410:
    $P926($P927)
    get_hll_global $P928, ["Parrot"], "IMPORT"
    $P928("Dumper")
    get_hll_global $P929, ["Class"], "NEW_CLASS"
    $P930 = $P929("Class::BaseBehavior")
    .return ($P930)
  control_913:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P931, exception, "payload"
    .return ($P931)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_block917"  :anon :subid("86_1256214664.66218") :outer("85_1256214664.66218")
    new $P919, "Exception"
    set $P919['type'], 58
    new $P920, "Integer"
    assign $P920, 0
    setattribute $P919, 'payload', $P920
    throw $P919
    .return ()
.end


.namespace ["Class";"BaseBehavior"]
.sub "_ABSTRACT_METHOD"  :subid("87_1256214664.66218") :method :outer("84_1256214664.66218")
    new $P934, 'ExceptionHandler'
    set_addr $P934, control_933
    $P934."handle_types"(58)
    push_eh $P934
    .lex "self", self
    $P935 = "DIE"("A subclass must override this abstract method.")
    .return ($P935)
  control_933:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P936, exception, "payload"
    .return ($P936)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_ATTR"  :subid("88_1256214664.66218") :method :outer("84_1256214664.66218")
    .param pmc param_940
    .param pmc param_941
    new $P939, 'ExceptionHandler'
    set_addr $P939, control_938
    $P939."handle_types"(58)
    push_eh $P939
    .lex "self", self
    .lex "$name", param_940
    .lex "@value", param_941
    find_lex $P942, "self"
    $P943 = $P942."_ABSTRACT_METHOD"()
    .return ($P943)
  control_938:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P944, exception, "payload"
    .return ($P944)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_ATTR_ARRAY"  :subid("89_1256214664.66218") :method :outer("84_1256214664.66218")
    .param pmc param_948
    .param pmc param_949
    .const 'Sub' $P960 = "90_1256214664.66218" 
    capture_lex $P960
    new $P947, 'ExceptionHandler'
    set_addr $P947, control_946
    $P947."handle_types"(58)
    push_eh $P947
    .lex "self", self
    .lex "$name", param_948
    .lex "@value", param_949
    find_lex $P950, "self"
    find_lex $P951, "$name"
    unless_null $P951, vivify_411
    new $P951, "Undef"
  vivify_411:
    find_lex $P952, "@value"
    unless_null $P952, vivify_412
    new $P952, "ResizablePMCArray"
  vivify_412:
    $P953 = $P950."_ATTR"($P951, $P952)
    .lex "$result", $P953
    get_hll_global $P955, ["Parrot"], "defined"
    find_lex $P956, "$result"
    unless_null $P956, vivify_413
    new $P956, "Undef"
  vivify_413:
    $P957 = $P955($P956)
    isfalse $I958, $P957
    unless $I958, if_954_end
    .const 'Sub' $P960 = "90_1256214664.66218" 
    capture_lex $P960
    $P960()
  if_954_end:
    new $P968, "Exception"
    set $P968['type'], 58
    find_lex $P969, "$result"
    unless_null $P969, vivify_415
    new $P969, "Undef"
  vivify_415:
    setattribute $P968, 'payload', $P969
    throw $P968
    .return ()
  control_946:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P970, exception, "payload"
    .return ($P970)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_block959"  :anon :subid("90_1256214664.66218") :outer("89_1256214664.66218")
    find_lex $P961, "self"
    find_lex $P962, "$name"
    unless_null $P962, vivify_414
    new $P962, "Undef"
  vivify_414:
    get_hll_global $P963, ["Array"], "new"
    get_hll_global $P964, ["Array"], "empty"
    $P965 = $P964()
    $P966 = $P963($P965)
    $P967 = $P961."_ATTR"($P962, $P966)
    store_lex "$result", $P967
    .return ($P967)
.end


.namespace ["Class";"BaseBehavior"]
.sub "_ATTR_DEFAULT"  :subid("91_1256214664.66218") :method :outer("84_1256214664.66218")
    .param pmc param_974
    .param pmc param_975
    .param pmc param_976
    .const 'Sub' $P987 = "92_1256214664.66218" 
    capture_lex $P987
    new $P973, 'ExceptionHandler'
    set_addr $P973, control_972
    $P973."handle_types"(58)
    push_eh $P973
    .lex "self", self
    .lex "$name", param_974
    .lex "@value", param_975
    .lex "$default", param_976
    find_lex $P977, "self"
    find_lex $P978, "$name"
    unless_null $P978, vivify_416
    new $P978, "Undef"
  vivify_416:
    find_lex $P979, "@value"
    unless_null $P979, vivify_417
    new $P979, "ResizablePMCArray"
  vivify_417:
    $P980 = $P977."_ATTR"($P978, $P979)
    .lex "$result", $P980
    get_hll_global $P982, ["Parrot"], "defined"
    find_lex $P983, "$result"
    unless_null $P983, vivify_418
    new $P983, "Undef"
  vivify_418:
    $P984 = $P982($P983)
    isfalse $I985, $P984
    unless $I985, if_981_end
    .const 'Sub' $P987 = "92_1256214664.66218" 
    capture_lex $P987
    $P987()
  if_981_end:
    new $P994, "Exception"
    set $P994['type'], 58
    find_lex $P995, "$result"
    unless_null $P995, vivify_421
    new $P995, "Undef"
  vivify_421:
    setattribute $P994, 'payload', $P995
    throw $P994
    .return ()
  control_972:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P996, exception, "payload"
    .return ($P996)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_block986"  :anon :subid("92_1256214664.66218") :outer("91_1256214664.66218")
    find_lex $P988, "self"
    find_lex $P989, "$name"
    unless_null $P989, vivify_419
    new $P989, "Undef"
  vivify_419:
    get_hll_global $P990, ["Array"], "new"
    find_lex $P991, "$default"
    unless_null $P991, vivify_420
    new $P991, "Undef"
  vivify_420:
    $P992 = $P990($P991)
    $P993 = $P988."_ATTR"($P989, $P992)
    store_lex "$result", $P993
    .return ($P993)
.end


.namespace ["Class";"BaseBehavior"]
.sub "_ATTR_CONST"  :subid("93_1256214664.66218") :method :outer("84_1256214664.66218")
    .param pmc param_1000
    .param pmc param_1001
    .const 'Sub' $P1014 = "94_1256214664.66218" 
    capture_lex $P1014
    new $P999, 'ExceptionHandler'
    set_addr $P999, control_998
    $P999."handle_types"(58)
    push_eh $P999
    .lex "self", self
    .lex "$name", param_1000
    .lex "@value", param_1001
    find_lex $P1005, "@value"
    unless_null $P1005, vivify_422
    new $P1005, "ResizablePMCArray"
  vivify_422:
    set $N1006, $P1005
    if $N1006, if_1004
    new $P1003, 'Float'
    set $P1003, $N1006
    goto if_1004_end
  if_1004:
    get_hll_global $P1007, ["Parrot"], "defined"
    find_lex $P1008, "self"
    find_lex $P1009, "$name"
    unless_null $P1009, vivify_423
    new $P1009, "Undef"
  vivify_423:
    get_global $P1010, "@empty"
    unless_null $P1010, vivify_424
    new $P1010, "ResizablePMCArray"
  vivify_424:
    $P1011 = $P1008."_ATTR"($P1009, $P1010)
    $P1012 = $P1007($P1011)
    set $P1003, $P1012
  if_1004_end:
    unless $P1003, if_1002_end
    .const 'Sub' $P1014 = "94_1256214664.66218" 
    capture_lex $P1014
    $P1014()
  if_1002_end:
    new $P1017, "Exception"
    set $P1017['type'], 58
    find_lex $P1018, "self"
    find_lex $P1019, "$name"
    unless_null $P1019, vivify_426
    new $P1019, "Undef"
  vivify_426:
    find_lex $P1020, "@value"
    unless_null $P1020, vivify_427
    new $P1020, "ResizablePMCArray"
  vivify_427:
    $P1021 = $P1018."_ATTR"($P1019, $P1020)
    setattribute $P1017, 'payload', $P1021
    throw $P1017
    .return ()
  control_998:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1022, exception, "payload"
    .return ($P1022)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_block1013"  :anon :subid("94_1256214664.66218") :outer("93_1256214664.66218")
    find_lex $P1015, "$name"
    unless_null $P1015, vivify_425
    new $P1015, "Undef"
  vivify_425:
    $P1016 = "DIE"("You cannot reset the value of the '", $P1015, "' attribute.")
    .return ($P1016)
.end


.namespace ["Class";"BaseBehavior"]
.sub "_ATTR_HASH"  :subid("95_1256214664.66218") :method :outer("84_1256214664.66218")
    .param pmc param_1026
    .param pmc param_1027
    .const 'Sub' $P1038 = "96_1256214664.66218" 
    capture_lex $P1038
    new $P1025, 'ExceptionHandler'
    set_addr $P1025, control_1024
    $P1025."handle_types"(58)
    push_eh $P1025
    .lex "self", self
    .lex "$name", param_1026
    .lex "@value", param_1027
    find_lex $P1028, "self"
    find_lex $P1029, "$name"
    unless_null $P1029, vivify_428
    new $P1029, "Undef"
  vivify_428:
    find_lex $P1030, "@value"
    unless_null $P1030, vivify_429
    new $P1030, "ResizablePMCArray"
  vivify_429:
    $P1031 = $P1028."_ATTR"($P1029, $P1030)
    .lex "$result", $P1031
    get_hll_global $P1033, ["Parrot"], "defined"
    find_lex $P1034, "$result"
    unless_null $P1034, vivify_430
    new $P1034, "Undef"
  vivify_430:
    $P1035 = $P1033($P1034)
    isfalse $I1036, $P1035
    unless $I1036, if_1032_end
    .const 'Sub' $P1038 = "96_1256214664.66218" 
    capture_lex $P1038
    $P1038()
  if_1032_end:
    new $P1046, "Exception"
    set $P1046['type'], 58
    find_lex $P1047, "$result"
    unless_null $P1047, vivify_432
    new $P1047, "Undef"
  vivify_432:
    setattribute $P1046, 'payload', $P1047
    throw $P1046
    .return ()
  control_1024:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1048, exception, "payload"
    .return ($P1048)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_block1037"  :anon :subid("96_1256214664.66218") :outer("95_1256214664.66218")
    find_lex $P1039, "self"
    find_lex $P1040, "$name"
    unless_null $P1040, vivify_431
    new $P1040, "Undef"
  vivify_431:
    get_hll_global $P1041, ["Array"], "new"
    get_hll_global $P1042, ["Hash"], "empty"
    $P1043 = $P1042()
    $P1044 = $P1041($P1043)
    $P1045 = $P1039."_ATTR"($P1040, $P1044)
    store_lex "$result", $P1045
    .return ($P1045)
.end


.namespace ["Class";"BaseBehavior"]
.sub "_ATTR_SETBY"  :subid("97_1256214664.66218") :method :outer("84_1256214664.66218")
    .param pmc param_1052
    .param pmc param_1053
    .const 'Sub' $P1064 = "98_1256214664.66218" 
    capture_lex $P1064
    new $P1051, 'ExceptionHandler'
    set_addr $P1051, control_1050
    $P1051."handle_types"(58)
    push_eh $P1051
    .lex "self", self
    .lex "$name", param_1052
    .lex "$method_name", param_1053
    find_lex $P1054, "self"
    find_lex $P1055, "$name"
    unless_null $P1055, vivify_433
    new $P1055, "Undef"
  vivify_433:
    get_global $P1056, "@empty"
    unless_null $P1056, vivify_434
    new $P1056, "ResizablePMCArray"
  vivify_434:
    $P1057 = $P1054."_ATTR"($P1055, $P1056)
    .lex "$result", $P1057
    get_hll_global $P1059, ["Parrot"], "defined"
    find_lex $P1060, "$result"
    unless_null $P1060, vivify_435
    new $P1060, "Undef"
  vivify_435:
    $P1061 = $P1059($P1060)
    isfalse $I1062, $P1061
    unless $I1062, if_1058_end
    .const 'Sub' $P1064 = "98_1256214664.66218" 
    capture_lex $P1064
    $P1064()
  if_1058_end:
    new $P1072, "Exception"
    set $P1072['type'], 58
    find_lex $P1073, "$result"
    unless_null $P1073, vivify_439
    new $P1073, "Undef"
  vivify_439:
    setattribute $P1072, 'payload', $P1073
    throw $P1072
    .return ()
  control_1050:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1074, exception, "payload"
    .return ($P1074)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_block1063"  :anon :subid("98_1256214664.66218") :outer("97_1256214664.66218")
    get_hll_global $P1065, ["Class"], "call_method"
    find_lex $P1066, "self"
    find_lex $P1067, "$method_name"
    unless_null $P1067, vivify_436
    new $P1067, "Undef"
  vivify_436:
    $P1065($P1066, $P1067)
    find_lex $P1068, "self"
    find_lex $P1069, "$name"
    unless_null $P1069, vivify_437
    new $P1069, "Undef"
  vivify_437:
    get_global $P1070, "@empty"
    unless_null $P1070, vivify_438
    new $P1070, "ResizablePMCArray"
  vivify_438:
    $P1071 = $P1068."_ATTR"($P1069, $P1070)
    store_lex "$result", $P1071
    .return ($P1071)
.end


.namespace ["Class";"BaseBehavior"]
.sub "get_bool"  :subid("99_1256214664.66218") :method :outer("84_1256214664.66218")
    new $P1077, 'ExceptionHandler'
    set_addr $P1077, control_1076
    $P1077."handle_types"(58)
    push_eh $P1077
    .lex "self", self
    new $P1078, "Exception"
    set $P1078['type'], 58
    new $P1079, "Integer"
    assign $P1079, 1
    setattribute $P1078, 'payload', $P1079
    throw $P1078
    .return ()
  control_1076:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1080, exception, "payload"
    .return ($P1080)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "get_string"  :subid("100_1256214664.66218") :method :outer("84_1256214664.66218")
    new $P1083, 'ExceptionHandler'
    set_addr $P1083, control_1082
    $P1083."handle_types"(58)
    push_eh $P1083
    .lex "self", self
    new $P1084, "Exception"
    set $P1084['type'], 58
    get_hll_global $P1085, ["Class"], "name_of"
    find_lex $P1086, "self"
    $P1087 = $P1085($P1086)
    concat $P1088, $P1087, " @"
    get_hll_global $P1089, ["Parrot"], "get_address_of"
    find_lex $P1090, "self"
    $S1091 = $P1089($P1090)
    concat $P1092, $P1088, $S1091
    setattribute $P1084, 'payload', $P1092
    throw $P1084
    .return ()
  control_1082:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1093, exception, "payload"
    .return ($P1093)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "init"  :subid("101_1256214664.66218") :method :outer("84_1256214664.66218")
    .param pmc param_1097
    .param pmc param_1098
    .const 'Sub' $P1104 = "102_1256214664.66218" 
    capture_lex $P1104
    new $P1096, 'ExceptionHandler'
    set_addr $P1096, control_1095
    $P1096."handle_types"(58)
    push_eh $P1096
    .lex "self", self
    .lex "@children", param_1097
    .lex "%attributes", param_1098
    find_lex $P1100, "%attributes"
    unless_null $P1100, vivify_440
    new $P1100, "Hash"
  vivify_440:
    defined $I1101, $P1100
    unless $I1101, for_undef_441
    iter $P1099, $P1100
    new $P1117, 'ExceptionHandler'
    set_addr $P1117, loop1116_handler
    $P1117."handle_types"(65, 67, 66)
    push_eh $P1117
  loop1116_test:
    unless $P1099, loop1116_done
    shift $P1102, $P1099
  loop1116_redo:
    .const 'Sub' $P1104 = "102_1256214664.66218" 
    capture_lex $P1104
    $P1104($P1102)
  loop1116_next:
    goto loop1116_test
  loop1116_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1118, exception, 'type'
    eq $P1118, 65, loop1116_next
    eq $P1118, 67, loop1116_redo
  loop1116_done:
    pop_eh 
  for_undef_441:
    .return ($P1099)
  control_1095:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1119, exception, "payload"
    .return ($P1119)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "_block1103"  :anon :subid("102_1256214664.66218") :outer("101_1256214664.66218")
    .param pmc param_1105
    .lex "$_", param_1105
    find_lex $P1106, "$_"
    unless_null $P1106, vivify_442
    new $P1106, "Undef"
  vivify_442:
    set $S1107, $P1106
    "NOTE"("Setting attribute: '", $S1107, "'")
    get_hll_global $P1108, ["Class"], "call_method"
    find_lex $P1109, "self"
    find_lex $P1110, "$_"
    unless_null $P1110, vivify_443
    new $P1110, "Undef"
  vivify_443:
    set $S1111, $P1110
    find_lex $P1112, "$_"
    unless_null $P1112, vivify_444
    new $P1112, "Undef"
  vivify_444:
    find_lex $P1113, "%attributes"
    unless_null $P1113, vivify_445
    new $P1113, "Hash"
  vivify_445:
    set $P1114, $P1113[$P1112]
    unless_null $P1114, vivify_446
    new $P1114, "Undef"
  vivify_446:
    $P1115 = $P1108($P1109, $S1111, $P1114)
    .return ($P1115)
.end


.namespace ["Class";"BaseBehavior"]
.sub "isa"  :subid("103_1256214664.66218") :method :outer("84_1256214664.66218")
    .param pmc param_1123
    new $P1122, 'ExceptionHandler'
    set_addr $P1122, control_1121
    $P1122."handle_types"(58)
    push_eh $P1122
    .lex "self", self
    .lex "$type", param_1123
    new $P1124, "Exception"
    set $P1124['type'], 58
    find_lex $P1125, "self"
    $P1126 = $P1125."HOW"()
    find_lex $P1127, "self"
    find_lex $P1128, "$type"
    unless_null $P1128, vivify_447
    new $P1128, "Undef"
  vivify_447:
    $P1129 = $P1126."isa"($P1127, $P1128)
    setattribute $P1124, 'payload', $P1129
    throw $P1124
    .return ()
  control_1121:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1130, exception, "payload"
    .return ($P1130)
    rethrow exception
.end


.namespace ["Class";"BaseBehavior"]
.sub "new"  :subid("104_1256214664.66218") :method :outer("84_1256214664.66218")
    .param pmc param_1134 :slurpy
    .param pmc param_1135 :slurpy :named
    new $P1133, 'ExceptionHandler'
    set_addr $P1133, control_1132
    $P1133."handle_types"(58)
    push_eh $P1133
    .lex "self", self
    .lex "@children", param_1134
    .lex "%attributes", param_1135
    get_hll_global $P1136, ["Parrot"], "get_attribute"
    find_lex $P1137, "self"
    $P1138 = $P1137."HOW"()
    $P1139 = $P1136($P1138, "parrotclass")
    .lex "$class", $P1139
    get_hll_global $P1140, ["Parrot"], "new_pmc"
    find_lex $P1141, "$class"
    unless_null $P1141, vivify_448
    new $P1141, "Undef"
  vivify_448:
    $P1142 = $P1140($P1141)
    .lex "$new_object", $P1142
    find_lex $P1143, "$new_object"
    unless_null $P1143, vivify_449
    new $P1143, "Undef"
  vivify_449:
    find_lex $P1144, "@children"
    unless_null $P1144, vivify_450
    new $P1144, "ResizablePMCArray"
  vivify_450:
    find_lex $P1145, "%attributes"
    unless_null $P1145, vivify_451
    new $P1145, "Hash"
  vivify_451:
    $P1143."init"($P1144, $P1145)
    new $P1146, "Exception"
    set $P1146['type'], 58
    find_lex $P1147, "$new_object"
    unless_null $P1147, vivify_452
    new $P1147, "Undef"
  vivify_452:
    setattribute $P1146, 'payload', $P1147
    throw $P1146
    .return ()
  control_1132:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1148, exception, "payload"
    .return ($P1148)
    rethrow exception
.end


.namespace ["Class";"HashBased"]
.sub "_block1149" :init :load :subid("105_1256214664.66218")
    .const 'Sub' $P1184 = "110_1256214664.66218" 
    capture_lex $P1184
    .const 'Sub' $P1165 = "108_1256214664.66218" 
    capture_lex $P1165
    .const 'Sub' $P1151 = "106_1256214664.66218" 
    capture_lex $P1151
    "_ONLOAD"()
    .const 'Sub' $P1184 = "110_1256214664.66218" 
    capture_lex $P1184
    .return ($P1184)
.end


.namespace ["Class";"HashBased"]
.sub "_ONLOAD"  :subid("106_1256214664.66218") :outer("105_1256214664.66218")
    .const 'Sub' $P1157 = "107_1256214664.66218" 
    capture_lex $P1157
    new $P1153, 'ExceptionHandler'
    set_addr $P1153, control_1152
    $P1153."handle_types"(58)
    push_eh $P1153
    get_global $P1155, "$onload_done"
    unless_null $P1155, vivify_453
    new $P1155, "Undef"
  vivify_453:
    unless $P1155, if_1154_end
    .const 'Sub' $P1157 = "107_1256214664.66218" 
    capture_lex $P1157
    $P1157()
  if_1154_end:
    new $P1160, "Integer"
    assign $P1160, 1
    set_global "$onload_done", $P1160
    get_hll_global $P1161, ["Parrot"], "IMPORT"
    $P1161("Dumper")
    get_hll_global $P1162, ["Class"], "SUBCLASS"
    $P1163 = $P1162("Class::HashBased", "Class::BaseBehavior", "Hash")
    .return ($P1163)
  control_1152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1164, exception, "payload"
    .return ($P1164)
    rethrow exception
.end


.namespace ["Class";"HashBased"]
.sub "_block1156"  :anon :subid("107_1256214664.66218") :outer("106_1256214664.66218")
    new $P1158, "Exception"
    set $P1158['type'], 58
    new $P1159, "Integer"
    assign $P1159, 0
    setattribute $P1158, 'payload', $P1159
    throw $P1158
    .return ()
.end


.namespace ["Class";"HashBased"]
.sub "_ATTR"  :subid("108_1256214664.66218") :method :outer("105_1256214664.66218")
    .param pmc param_1168
    .param pmc param_1169
    .const 'Sub' $P1174 = "109_1256214664.66218" 
    capture_lex $P1174
    new $P1167, 'ExceptionHandler'
    set_addr $P1167, control_1166
    $P1167."handle_types"(58)
    push_eh $P1167
    .lex "self", self
    .lex "$name", param_1168
    .lex "@value", param_1169
    find_lex $P1171, "@value"
    unless_null $P1171, vivify_454
    new $P1171, "ResizablePMCArray"
  vivify_454:
    set $N1172, $P1171
    unless $N1172, if_1170_end
    .const 'Sub' $P1174 = "109_1256214664.66218" 
    capture_lex $P1174
    $P1174()
  if_1170_end:
    new $P1179, "Exception"
    set $P1179['type'], 58
    find_lex $P1180, "$name"
    unless_null $P1180, vivify_459
    new $P1180, "Undef"
  vivify_459:
    find_lex $P1181, "self"
    unless_null $P1181, vivify_460
    new $P1181, "Hash"
  vivify_460:
    set $P1182, $P1181[$P1180]
    unless_null $P1182, vivify_461
    new $P1182, "Undef"
  vivify_461:
    setattribute $P1179, 'payload', $P1182
    throw $P1179
    .return ()
  control_1166:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1183, exception, "payload"
    .return ($P1183)
    rethrow exception
.end


.namespace ["Class";"HashBased"]
.sub "_block1173"  :anon :subid("109_1256214664.66218") :outer("108_1256214664.66218")
    find_lex $P1175, "@value"
    unless_null $P1175, vivify_455
    new $P1175, "ResizablePMCArray"
  vivify_455:
    set $P1176, $P1175[0]
    unless_null $P1176, vivify_456
    new $P1176, "Undef"
  vivify_456:
    find_lex $P1177, "$name"
    unless_null $P1177, vivify_457
    new $P1177, "Undef"
  vivify_457:
    find_lex $P1178, "self"
    unless_null $P1178, vivify_458
    new $P1178, "Hash"
    store_lex "self", $P1178
  vivify_458:
    set $P1178[$P1177], $P1176
    .return ($P1176)
.end


.namespace ["Class";"HashBased"]
.sub "__dump"  :subid("110_1256214664.66218") :method :outer("105_1256214664.66218")
    .param pmc param_1187
    .param pmc param_1188
    .const 'Sub' $P1238 = "114_1256214664.66218" 
    capture_lex $P1238
    .const 'Sub' $P1235 = "113_1256214664.66218" 
    capture_lex $P1235
    .const 'Sub' $P1213 = "112_1256214664.66218" 
    capture_lex $P1213
    .const 'Sub' $P1198 = "111_1256214664.66218" 
    capture_lex $P1198
    new $P1186, 'ExceptionHandler'
    set_addr $P1186, control_1185
    $P1186."handle_types"(58)
    push_eh $P1186
    .lex "self", self
    .lex "$dumper", param_1187
    .lex "$label", param_1188
    new $P1189, "Undef"
    .lex "$subindent", $P1189
    new $P1190, "Undef"
    .lex "$indent", $P1190

			.local string indent, subindent
			$P0 = find_lex '$dumper'
			(subindent, indent) = $P0.'newIndent'()
			$P0 = box subindent
			store_lex '$subindent', $P0
			$P0 = box indent
			store_lex '$indent', $P0
		
    new $P1191, "String"
    assign $P1191, "{"
    .lex "$brace", $P1191
    new $P1192, "ResizablePMCArray"
    .lex "@keys", $P1192
    find_lex $P1194, "self"
    defined $I1195, $P1194
    unless $I1195, for_undef_462
    iter $P1193, $P1194
    new $P1205, 'ExceptionHandler'
    set_addr $P1205, loop1204_handler
    $P1205."handle_types"(65, 67, 66)
    push_eh $P1205
  loop1204_test:
    unless $P1193, loop1204_done
    shift $P1196, $P1193
  loop1204_redo:
    .const 'Sub' $P1198 = "111_1256214664.66218" 
    capture_lex $P1198
    $P1198($P1196)
  loop1204_next:
    goto loop1204_test
  loop1204_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1206, exception, 'type'
    eq $P1206, 65, loop1204_next
    eq $P1206, 67, loop1204_redo
  loop1204_done:
    pop_eh 
  for_undef_462:
    find_lex $P1207, "@keys"
    unless_null $P1207, vivify_465
    new $P1207, "ResizablePMCArray"
  vivify_465:
    $P1207."sort"()
    find_lex $P1209, "@keys"
    unless_null $P1209, vivify_466
    new $P1209, "ResizablePMCArray"
  vivify_466:
    defined $I1210, $P1209
    unless $I1210, for_undef_467
    iter $P1208, $P1209
    new $P1230, 'ExceptionHandler'
    set_addr $P1230, loop1229_handler
    $P1230."handle_types"(65, 67, 66)
    push_eh $P1230
  loop1229_test:
    unless $P1208, loop1229_done
    shift $P1211, $P1208
  loop1229_redo:
    .const 'Sub' $P1213 = "112_1256214664.66218" 
    capture_lex $P1213
    $P1213($P1211)
  loop1229_next:
    goto loop1229_test
  loop1229_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1231, exception, 'type'
    eq $P1231, 65, loop1229_next
    eq $P1231, 67, loop1229_redo
  loop1229_done:
    pop_eh 
  for_undef_467:
    find_lex $P1233, "$brace"
    unless_null $P1233, vivify_478
    new $P1233, "Undef"
  vivify_478:
    if $P1233, if_1232
    .const 'Sub' $P1238 = "114_1256214664.66218" 
    capture_lex $P1238
    $P1238()
    goto if_1232_end
  if_1232:
    .const 'Sub' $P1235 = "113_1256214664.66218" 
    capture_lex $P1235
    $P1235()
  if_1232_end:
    find_lex $P1241, "$dumper"
    unless_null $P1241, vivify_480
    new $P1241, "Undef"
  vivify_480:
    $P1242 = $P1241."deleteIndent"()
    .return ($P1242)
  control_1185:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1243, exception, "payload"
    .return ($P1243)
    rethrow exception
.end


.namespace ["Class";"HashBased"]
.sub "_block1197"  :anon :subid("111_1256214664.66218") :outer("110_1256214664.66218")
    .param pmc param_1199
    .lex "$_", param_1199
    find_lex $P1200, "@keys"
    unless_null $P1200, vivify_463
    new $P1200, "ResizablePMCArray"
  vivify_463:
    find_lex $P1201, "$_"
    unless_null $P1201, vivify_464
    new $P1201, "Undef"
  vivify_464:
    set $S1202, $P1201
    $P1203 = $P1200."push"($S1202)
    .return ($P1203)
.end


.namespace ["Class";"HashBased"]
.sub "_block1212"  :anon :subid("112_1256214664.66218") :outer("110_1256214664.66218")
    .param pmc param_1214
    .lex "$_", param_1214
    find_lex $P1215, "$brace"
    unless_null $P1215, vivify_468
    new $P1215, "Undef"
  vivify_468:
    find_lex $P1216, "$subindent"
    unless_null $P1216, vivify_469
    new $P1216, "Undef"
  vivify_469:
    "print"($P1215, "\n", $P1216)
    new $P1217, "String"
    assign $P1217, ""
    store_lex "$brace", $P1217
    find_lex $P1218, "$_"
    unless_null $P1218, vivify_470
    new $P1218, "Undef"
  vivify_470:
    set $S1219, $P1218
    new $P1220, 'String'
    set $P1220, $S1219
    .lex "$key", $P1220
    find_lex $P1221, "$key"
    unless_null $P1221, vivify_471
    new $P1221, "Undef"
  vivify_471:
    find_lex $P1222, "self"
    unless_null $P1222, vivify_472
    new $P1222, "Hash"
  vivify_472:
    set $P1223, $P1222[$P1221]
    unless_null $P1223, vivify_473
    new $P1223, "Undef"
  vivify_473:
    .lex "$val", $P1223
    find_lex $P1224, "$key"
    unless_null $P1224, vivify_474
    new $P1224, "Undef"
  vivify_474:
    "print"("<", $P1224, "> => ")
    find_lex $P1225, "$dumper"
    unless_null $P1225, vivify_475
    new $P1225, "Undef"
  vivify_475:
    find_lex $P1226, "$label"
    unless_null $P1226, vivify_476
    new $P1226, "Undef"
  vivify_476:
    find_lex $P1227, "$val"
    unless_null $P1227, vivify_477
    new $P1227, "Undef"
  vivify_477:
    $P1228 = $P1225."dump"($P1226, $P1227)
    .return ($P1228)
.end


.namespace ["Class";"HashBased"]
.sub "_block1237"  :anon :subid("114_1256214664.66218") :outer("110_1256214664.66218")
    find_lex $P1239, "$indent"
    unless_null $P1239, vivify_479
    new $P1239, "Undef"
  vivify_479:
    $P1240 = "print"("\n", $P1239, "}")
    .return ($P1240)
.end


.namespace ["Class";"HashBased"]
.sub "_block1234"  :anon :subid("113_1256214664.66218") :outer("110_1256214664.66218")
    $P1236 = "print"("(no attributes set)")
    .return ($P1236)
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
.sub "_block11"  :anon :subid("10_1256214672.18229")
    get_hll_global $P14, ["Dumper"], "_block13" 
    .return ($P14)
.end


.namespace ["Dumper"]
.sub "_block13" :init :load :subid("11_1256214672.18229")
    .const 'Sub' $P569 = "63_1256214672.18229" 
    capture_lex $P569
    .const 'Sub' $P556 = "62_1256214672.18229" 
    capture_lex $P556
    .const 'Sub' $P524 = "60_1256214672.18229" 
    capture_lex $P524
    .const 'Sub' $P465 = "55_1256214672.18229" 
    capture_lex $P465
    .const 'Sub' $P407 = "51_1256214672.18229" 
    capture_lex $P407
    .const 'Sub' $P389 = "49_1256214672.18229" 
    capture_lex $P389
    .const 'Sub' $P370 = "47_1256214672.18229" 
    capture_lex $P370
    .const 'Sub' $P351 = "45_1256214672.18229" 
    capture_lex $P351
    .const 'Sub' $P333 = "43_1256214672.18229" 
    capture_lex $P333
    .const 'Sub' $P322 = "42_1256214672.18229" 
    capture_lex $P322
    .const 'Sub' $P272 = "37_1256214672.18229" 
    capture_lex $P272
    .const 'Sub' $P253 = "35_1256214672.18229" 
    capture_lex $P253
    .const 'Sub' $P241 = "34_1256214672.18229" 
    capture_lex $P241
    .const 'Sub' $P167 = "27_1256214672.18229" 
    capture_lex $P167
    .const 'Sub' $P145 = "25_1256214672.18229" 
    capture_lex $P145
    .const 'Sub' $P141 = "24_1256214672.18229" 
    capture_lex $P141
    .const 'Sub' $P103 = "19_1256214672.18229" 
    capture_lex $P103
    .const 'Sub' $P53 = "14_1256214672.18229" 
    capture_lex $P53
    .const 'Sub' $P20 = "12_1256214672.18229" 
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
    .const 'Sub' $P569 = "63_1256214672.18229" 
    capture_lex $P569
    .return ($P569)
.end


.namespace ["Dumper"]
.sub "_ONLOAD"  :subid("12_1256214672.18229") :outer("11_1256214672.18229")
    .const 'Sub' $P26 = "13_1256214672.18229" 
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
    .const 'Sub' $P26 = "13_1256214672.18229" 
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
.sub "_block25"  :anon :subid("13_1256214672.18229") :outer("12_1256214672.18229")
    new $P27, "Exception"
    set $P27['type'], 58
    new $P28, "Integer"
    assign $P28, 0
    setattribute $P27, 'payload', $P28
    throw $P27
    .return ()
.end


.namespace ["Dumper"]
.sub "ASSERTold"  :subid("14_1256214672.18229") :outer("11_1256214672.18229")
    .param pmc param_56
    .param pmc param_57
    .param pmc param_58
    .const 'Sub' $P94 = "18_1256214672.18229" 
    capture_lex $P94
    .const 'Sub' $P72 = "16_1256214672.18229" 
    capture_lex $P72
    .const 'Sub' $P63 = "15_1256214672.18229" 
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
    .const 'Sub' $P63 = "15_1256214672.18229" 
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
    .const 'Sub' $P94 = "18_1256214672.18229" 
    capture_lex $P94
    $P94()
    goto if_69_end
  if_69:
    .const 'Sub' $P72 = "16_1256214672.18229" 
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
.sub "_block62"  :anon :subid("15_1256214672.18229") :outer("14_1256214672.18229")
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
.sub "_block93"  :anon :subid("18_1256214672.18229") :outer("14_1256214672.18229")
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
.sub "_block71"  :anon :subid("16_1256214672.18229") :outer("14_1256214672.18229")
    .const 'Sub' $P87 = "17_1256214672.18229" 
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
    .const 'Sub' $P87 = "17_1256214672.18229" 
    capture_lex $P87
    $P92 = $P87()
    set $P73, $P92
  if_74_end:
    .return ($P73)
.end


.namespace ["Dumper"]
.sub "_block86"  :anon :subid("17_1256214672.18229") :outer("16_1256214672.18229")
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
.sub "ASSERT"  :subid("19_1256214672.18229") :outer("11_1256214672.18229")
    .param pmc param_106
    .param pmc param_107 :slurpy
    .param pmc param_108 :optional :named("caller_level")
    .param int has_param_108 :opt_flag
    .const 'Sub' $P134 = "23_1256214672.18229" 
    capture_lex $P134
    .const 'Sub' $P129 = "22_1256214672.18229" 
    capture_lex $P129
    .const 'Sub' $P125 = "21_1256214672.18229" 
    capture_lex $P125
    .const 'Sub' $P114 = "20_1256214672.18229" 
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
    .const 'Sub' $P114 = "20_1256214672.18229" 
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
    .const 'Sub' $P129 = "22_1256214672.18229" 
    capture_lex $P129
    $P129()
    goto if_121_end
  if_121:
    .const 'Sub' $P125 = "21_1256214672.18229" 
    capture_lex $P125
    $P125()
  if_121_end:
    find_lex $P132, "$condition"
    unless_null $P132, vivify_107
    new $P132, "Undef"
  vivify_107:
    if $P132, unless_131_end
    .const 'Sub' $P134 = "23_1256214672.18229" 
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
.sub "_block113"  :anon :subid("20_1256214672.18229") :outer("19_1256214672.18229")
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
.sub "_block128"  :anon :subid("22_1256214672.18229") :outer("19_1256214672.18229")
    new $P130, "String"
    assign $P130, "ASSERTION FAILED"
    store_lex "$message", $P130
    .return ($P130)
.end


.namespace ["Dumper"]
.sub "_block124"  :anon :subid("21_1256214672.18229") :outer("19_1256214672.18229")
    find_lex $P126, "@message"
    unless_null $P126, vivify_106
    new $P126, "ResizablePMCArray"
  vivify_106:
    $P127 = $P126."join"()
    store_lex "$message", $P127
    .return ($P127)
.end


.namespace ["Dumper"]
.sub "_block133"  :anon :subid("23_1256214672.18229") :outer("19_1256214672.18229")

			$P0 = find_lex '$message'
			$S0 = $P0
			die $S0
		
    .return ()
.end


.namespace ["Dumper"]
.sub "BACKTRACE"  :subid("24_1256214672.18229") :outer("11_1256214672.18229")
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
.sub "DIE"  :subid("25_1256214672.18229") :outer("11_1256214672.18229")
    .param pmc param_148 :slurpy
    .const 'Sub' $P153 = "26_1256214672.18229" 
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
    .const 'Sub' $P153 = "26_1256214672.18229" 
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
.sub "_block152"  :anon :subid("26_1256214672.18229") :outer("25_1256214672.18229")
    new $P154, "Exception"
    set $P154['type'], 58
    new $P155, "Integer"
    assign $P155, 0
    setattribute $P154, 'payload', $P155
    throw $P154
    .return ()
.end


.namespace ["Dumper"]
.sub "DUMP"  :subid("27_1256214672.18229") :outer("11_1256214672.18229")
    .param pmc param_170 :slurpy
    .param pmc param_171 :optional :named("caller_level")
    .param int has_param_171 :opt_flag
    .param pmc param_173 :optional :named("info")
    .param int has_param_173 :opt_flag
    .param pmc param_175 :slurpy :named
    .const 'Sub' $P211 = "31_1256214672.18229" 
    capture_lex $P211
    .const 'Sub' $P194 = "30_1256214672.18229" 
    capture_lex $P194
    .const 'Sub' $P189 = "29_1256214672.18229" 
    capture_lex $P189
    .const 'Sub' $P180 = "28_1256214672.18229" 
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
    .const 'Sub' $P180 = "28_1256214672.18229" 
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
    .const 'Sub' $P189 = "29_1256214672.18229" 
    capture_lex $P189
    $P189()
  unless_186_end:
    find_lex $P192, "@info"
    unless_null $P192, vivify_125
    new $P192, "ResizablePMCArray"
  vivify_125:
    if $P192, unless_191_end
    .const 'Sub' $P194 = "30_1256214672.18229" 
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
    .const 'Sub' $P211 = "31_1256214672.18229" 
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
.sub "_block179"  :anon :subid("28_1256214672.18229") :outer("27_1256214672.18229")
    new $P181, "Exception"
    set $P181['type'], 58
    new $P182, "Integer"
    assign $P182, 0
    setattribute $P181, 'payload', $P182
    throw $P181
    .return ()
.end


.namespace ["Dumper"]
.sub "_block188"  :anon :subid("29_1256214672.18229") :outer("27_1256214672.18229")
    new $P190, "Integer"
    assign $P190, 0
    store_lex "$caller_level", $P190
    .return ($P190)
.end


.namespace ["Dumper"]
.sub "_block193"  :anon :subid("30_1256214672.18229") :outer("27_1256214672.18229")
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
.sub "_block210"  :anon :subid("31_1256214672.18229") :outer("27_1256214672.18229")
    .const 'Sub' $P230 = "33_1256214672.18229" 
    capture_lex $P230
    .const 'Sub' $P219 = "32_1256214672.18229" 
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
    .const 'Sub' $P219 = "32_1256214672.18229" 
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
    .const 'Sub' $P230 = "33_1256214672.18229" 
    capture_lex $P230
    $P236 = $P230()
    set $P225, $P236
  if_226_end:
    .return ($P225)
.end


.namespace ["Dumper"]
.sub "_block218"  :anon :subid("32_1256214672.18229") :outer("31_1256214672.18229")
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
.sub "_block229"  :anon :subid("33_1256214672.18229") :outer("31_1256214672.18229")
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
.sub "DUMPold"  :subid("34_1256214672.18229") :outer("11_1256214672.18229")
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
.sub "DUMP_"  :subid("35_1256214672.18229") :outer("11_1256214672.18229")
    .param pmc param_256 :slurpy
    .param pmc param_257 :optional :named("label")
    .param int has_param_257 :opt_flag
    .param pmc param_259 :optional :named("prefix")
    .param int has_param_259 :opt_flag
    .const 'Sub' $P264 = "36_1256214672.18229" 
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
    .const 'Sub' $P264 = "36_1256214672.18229" 
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
.sub "_block263"  :anon :subid("36_1256214672.18229") :outer("35_1256214672.18229")
    new $P265, "String"
    assign $P265, "$VAR"
    store_lex "$label", $P265
    .return ($P265)
.end


.namespace ["Dumper"]
.sub "NOTE"  :subid("37_1256214672.18229") :outer("11_1256214672.18229")
    .param pmc param_275 :slurpy
    .param pmc param_276 :optional :named("caller_level")
    .param int has_param_276 :opt_flag
    .param pmc param_278 :optional :named("info")
    .param int has_param_278 :opt_flag
    .const 'Sub' $P311 = "41_1256214672.18229" 
    capture_lex $P311
    .const 'Sub' $P298 = "40_1256214672.18229" 
    capture_lex $P298
    .const 'Sub' $P293 = "39_1256214672.18229" 
    capture_lex $P293
    .const 'Sub' $P284 = "38_1256214672.18229" 
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
    .const 'Sub' $P284 = "38_1256214672.18229" 
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
    .const 'Sub' $P293 = "39_1256214672.18229" 
    capture_lex $P293
    $P293()
  unless_290_end:
    find_lex $P296, "@info"
    unless_null $P296, vivify_161
    new $P296, "ResizablePMCArray"
  vivify_161:
    if $P296, unless_295_end
    .const 'Sub' $P298 = "40_1256214672.18229" 
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
    .const 'Sub' $P311 = "41_1256214672.18229" 
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
.sub "_block283"  :anon :subid("38_1256214672.18229") :outer("37_1256214672.18229")
    new $P285, "Exception"
    set $P285['type'], 58
    new $P286, "Integer"
    assign $P286, 0
    setattribute $P285, 'payload', $P286
    throw $P285
    .return ()
.end


.namespace ["Dumper"]
.sub "_block292"  :anon :subid("39_1256214672.18229") :outer("37_1256214672.18229")
    new $P294, "Integer"
    assign $P294, 0
    store_lex "$caller_level", $P294
    .return ($P294)
.end


.namespace ["Dumper"]
.sub "_block297"  :anon :subid("40_1256214672.18229") :outer("37_1256214672.18229")
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
.sub "_block310"  :anon :subid("41_1256214672.18229") :outer("37_1256214672.18229")
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
.sub "NOTEold"  :subid("42_1256214672.18229") :outer("11_1256214672.18229")
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
.sub "caller_depth_below"  :subid("43_1256214672.18229") :outer("11_1256214672.18229")
    .param pmc param_336
    .param pmc param_337
    .param pmc param_338 :optional :named("starting")
    .param int has_param_338 :opt_flag
    .param pmc param_340 :optional :named("limit")
    .param int has_param_340 :opt_flag
    .const 'Sub' $P345 = "44_1256214672.18229" 
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
    .const 'Sub' $P345 = "44_1256214672.18229" 
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
.sub "_block344"  :anon :subid("44_1256214672.18229") :outer("43_1256214672.18229")
    new $P346, "Integer"
    assign $P346, 80
    store_lex "$limit", $P346
    .return ($P346)
.end


.namespace ["Dumper"]
.sub "find_named_caller"  :subid("45_1256214672.18229") :outer("11_1256214672.18229")
    .param pmc param_354 :optional :named("nth")
    .param int has_param_354 :opt_flag
    .param pmc param_356 :optional :named("starting")
    .param int has_param_356 :opt_flag
    .const 'Sub' $P361 = "46_1256214672.18229" 
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
    .const 'Sub' $P361 = "46_1256214672.18229" 
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
.sub "_block360"  :anon :subid("46_1256214672.18229") :outer("45_1256214672.18229")
    new $P362, "Integer"
    assign $P362, 1
    store_lex "$nth", $P362
    .return ($P362)
.end


.namespace ["Dumper"]
.sub "get_caller"  :subid("47_1256214672.18229") :outer("11_1256214672.18229")
    .param pmc param_373 :optional
    .param int has_param_373 :opt_flag
    .param pmc param_375 :optional :named("attr")
    .param int has_param_375 :opt_flag
    .const 'Sub' $P383 = "48_1256214672.18229" 
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
    .const 'Sub' $P383 = "48_1256214672.18229" 
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
.sub "_block382"  :anon :subid("48_1256214672.18229") :outer("47_1256214672.18229")
    new $P384, "String"
    assign $P384, "sub"
    store_lex "$attr", $P384
    .return ($P384)
.end


.namespace ["Dumper"]
.sub "get_config"  :subid("49_1256214672.18229") :outer("11_1256214672.18229")
    .param pmc param_392 :slurpy
    .const 'Sub' $P398 = "50_1256214672.18229" 
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
    .const 'Sub' $P398 = "50_1256214672.18229" 
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
.sub "_block397"  :anon :subid("50_1256214672.18229") :outer("49_1256214672.18229")
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
.sub "get_dumper_config"  :subid("51_1256214672.18229") :outer("11_1256214672.18229")
    .param pmc param_410
    .param pmc param_411 :optional :named("starting")
    .param int has_param_411 :opt_flag
    .const 'Sub' $P453 = "54_1256214672.18229" 
    capture_lex $P453
    .const 'Sub' $P427 = "53_1256214672.18229" 
    capture_lex $P427
    .const 'Sub' $P416 = "52_1256214672.18229" 
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
    .const 'Sub' $P416 = "52_1256214672.18229" 
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
    .const 'Sub' $P427 = "53_1256214672.18229" 
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
    .const 'Sub' $P453 = "54_1256214672.18229" 
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
.sub "_block415"  :anon :subid("52_1256214672.18229") :outer("51_1256214672.18229")
    get_hll_global $P417, ["Hash"], "empty"
    $P418 = $P417()
    set_global "%_dumper_config_cache", $P418
    .return ($P418)
.end


.namespace ["Dumper"]
.sub "_block426"  :anon :subid("53_1256214672.18229") :outer("51_1256214672.18229")
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
.sub "_block452"  :anon :subid("54_1256214672.18229") :outer("51_1256214672.18229")
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
.sub "info"  :subid("55_1256214672.18229") :outer("11_1256214672.18229")
    .param pmc param_468 :optional :named("caller_level")
    .param int has_param_468 :opt_flag
    .const 'Sub' $P506 = "59_1256214672.18229" 
    capture_lex $P506
    .const 'Sub' $P504 = "58_1256214672.18229" 
    capture_lex $P504
    .const 'Sub' $P483 = "57_1256214672.18229" 
    capture_lex $P483
    .const 'Sub' $P474 = "56_1256214672.18229" 
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
    .const 'Sub' $P474 = "56_1256214672.18229" 
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
    .const 'Sub' $P483 = "57_1256214672.18229" 
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
    .const 'Sub' $P506 = "59_1256214672.18229" 
    capture_lex $P506
    $P506()
    goto if_494_end
  if_494:
    .const 'Sub' $P504 = "58_1256214672.18229" 
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
.sub "_block473"  :anon :subid("56_1256214672.18229") :outer("55_1256214672.18229")
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
.sub "_block482"  :anon :subid("57_1256214672.18229") :outer("55_1256214672.18229")
    set $N484, 1
    new $P485, 'Float'
    set $P485, $N484
    store_lex "$caller_level", $P485
    .return ($P485)
.end


.namespace ["Dumper"]
.sub "_block505"  :anon :subid("59_1256214672.18229") :outer("55_1256214672.18229")
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
.sub "_block503"  :anon :subid("58_1256214672.18229") :outer("55_1256214672.18229")
    .return ()
.end


.namespace ["Dumper"]
.sub "make_bare_prefix"  :subid("60_1256214672.18229") :outer("11_1256214672.18229")
    .param pmc param_527
    .const 'Sub' $P535 = "61_1256214672.18229" 
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
    .const 'Sub' $P535 = "61_1256214672.18229" 
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
.sub "_block534"  :anon :subid("61_1256214672.18229") :outer("60_1256214672.18229")
    new $P536, "Integer"
    assign $P536, 1
    store_lex "$depth", $P536
    .return ($P536)
.end


.namespace ["Dumper"]
.sub "make_named_prefix"  :subid("62_1256214672.18229") :outer("11_1256214672.18229")
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
.sub "stack_depth"  :subid("63_1256214672.18229") :outer("11_1256214672.18229")
    .param pmc param_572 :optional :named("starting")
    .param int has_param_572 :opt_flag
    .const 'Sub' $P601 = "66_1256214672.18229" 
    capture_lex $P601
    .const 'Sub' $P581 = "64_1256214672.18229" 
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
    .const 'Sub' $P581 = "64_1256214672.18229" 
    capture_lex $P581
    $P581()
  unless_578_end:
    get_global $P599, "$Root_sub"
    unless_null $P599, vivify_261
    new $P599, "Undef"
  vivify_261:
    unless $P599, if_598_end
    .const 'Sub' $P601 = "66_1256214672.18229" 
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
.sub "_block580"  :anon :subid("64_1256214672.18229") :outer("63_1256214672.18229")
    .const 'Sub' $P590 = "65_1256214672.18229" 
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
    .const 'Sub' $P590 = "65_1256214672.18229" 
    capture_lex $P590
    $P597 = $P590()
    set $P586, $P597
  if_587_end:
    .return ($P586)
.end


.namespace ["Dumper"]
.sub "_block589"  :anon :subid("65_1256214672.18229") :outer("64_1256214672.18229")
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
.sub "_block600"  :anon :subid("66_1256214672.18229") :outer("63_1256214672.18229")
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
.sub "_block11"  :anon :subid("10_1256216229.36578")
    get_hll_global $P14, ["Miscellaneous"], "_block13" 
    .return ($P14)
.end


.namespace ["Miscellaneous"]
.sub "_block13" :init :load :subid("11_1256216229.36578")
    .const 'Sub' $P15 = "12_1256216229.36578" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P15 = "12_1256216229.36578" 
    capture_lex $P15
    .return ($P15)
.end


.namespace ["Miscellaneous"]
.sub "_ONLOAD"  :subid("12_1256216229.36578") :outer("11_1256216229.36578")
    .const 'Sub' $P30 = "14_1256216229.36578" 
    capture_lex $P30
    .const 'Sub' $P21 = "13_1256216229.36578" 
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
    .const 'Sub' $P21 = "13_1256216229.36578" 
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
    .const 'Sub' $P30 = "14_1256216229.36578" 
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
.sub "_block20"  :anon :subid("13_1256216229.36578") :outer("12_1256216229.36578")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Miscellaneous"]
.sub "_block29"  :anon :subid("14_1256216229.36578") :outer("12_1256216229.36578")
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
.sub "_block11"  :anon :subid("10_1256216503.29991")
    get_hll_global $P14, ["Parrot"], "_block13" 
    .return ($P14)
.end


.namespace ["Parrot"]
.sub "_block13" :init :load :subid("11_1256216503.29991")
    .const 'Sub' $P339 = "50_1256216503.29991" 
    capture_lex $P339
    .const 'Sub' $P334 = "49_1256216503.29991" 
    capture_lex $P334
    .const 'Sub' $P326 = "48_1256216503.29991" 
    capture_lex $P326
    .const 'Sub' $P321 = "47_1256216503.29991" 
    capture_lex $P321
    .const 'Sub' $P312 = "46_1256216503.29991" 
    capture_lex $P312
    .const 'Sub' $P298 = "44_1256216503.29991" 
    capture_lex $P298
    .const 'Sub' $P289 = "43_1256216503.29991" 
    capture_lex $P289
    .const 'Sub' $P268 = "41_1256216503.29991" 
    capture_lex $P268
    .const 'Sub' $P260 = "40_1256216503.29991" 
    capture_lex $P260
    .const 'Sub' $P249 = "39_1256216503.29991" 
    capture_lex $P249
    .const 'Sub' $P238 = "37_1256216503.29991" 
    capture_lex $P238
    .const 'Sub' $P227 = "35_1256216503.29991" 
    capture_lex $P227
    .const 'Sub' $P219 = "34_1256216503.29991" 
    capture_lex $P219
    .const 'Sub' $P210 = "33_1256216503.29991" 
    capture_lex $P210
    .const 'Sub' $P202 = "32_1256216503.29991" 
    capture_lex $P202
    .const 'Sub' $P197 = "31_1256216503.29991" 
    capture_lex $P197
    .const 'Sub' $P189 = "30_1256216503.29991" 
    capture_lex $P189
    .const 'Sub' $P181 = "29_1256216503.29991" 
    capture_lex $P181
    .const 'Sub' $P167 = "27_1256216503.29991" 
    capture_lex $P167
    .const 'Sub' $P153 = "25_1256216503.29991" 
    capture_lex $P153
    .const 'Sub' $P26 = "14_1256216503.29991" 
    capture_lex $P26
    .const 'Sub' $P15 = "12_1256216503.29991" 
    capture_lex $P15
    "_ONLOAD"()
    get_hll_global $P348, ["Parrot";"Globals"], "_block347" 
    .return ($P348)
.end


.namespace ["Parrot"]
.sub "_ONLOAD"  :subid("12_1256216503.29991") :outer("11_1256216503.29991")
    .const 'Sub' $P21 = "13_1256216503.29991" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_56
    new $P19, "Undef"
  vivify_56:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256216503.29991" 
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
.sub "_block20"  :anon :subid("13_1256216503.29991") :outer("12_1256216503.29991")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Parrot"]
.sub "IMPORT"  :subid("14_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_29
    .param pmc param_30 :optional
    .param int has_param_30 :opt_flag
    .const 'Sub' $P123 = "22_1256216503.29991" 
    capture_lex $P123
    .const 'Sub' $P54 = "17_1256216503.29991" 
    capture_lex $P54
    .const 'Sub' $P50 = "16_1256216503.29991" 
    capture_lex $P50
    .const 'Sub' $P38 = "15_1256216503.29991" 
    capture_lex $P38
    new $P28, 'ExceptionHandler'
    set_addr $P28, control_27
    $P28."handle_types"(58)
    push_eh $P28
    .lex "$namespace", param_29
    if has_param_30, optparam_57
    new $P31, "Undef"
    set param_30, $P31
  optparam_57:
    .lex "$names", param_30
    $P32 = "caller_namespace"(2)
    .lex "$caller_nsp", $P32
    find_lex $P33, "$namespace"
    unless_null $P33, vivify_58
    new $P33, "Undef"
  vivify_58:
    $P34 = "get_namespace"($P33)
    .lex "$from_nsp", $P34
    find_lex $P36, "$from_nsp"
    unless_null $P36, vivify_59
    new $P36, "Undef"
  vivify_59:
    if $P36, unless_35_end
    .const 'Sub' $P38 = "15_1256216503.29991" 
    capture_lex $P38
    $P38()
  unless_35_end:
    find_lex $P45, "$from_nsp"
    unless_null $P45, vivify_63
    new $P45, "Undef"
  vivify_63:
    "call_onload"($P45)
    new $P46, "ResizablePMCArray"
    .lex "@names", $P46
    find_lex $P48, "$names"
    unless_null $P48, vivify_64
    new $P48, "Undef"
  vivify_64:
    if $P48, if_47
    .const 'Sub' $P54 = "17_1256216503.29991" 
    capture_lex $P54
    $P54()
    goto if_47_end
  if_47:
    .const 'Sub' $P50 = "16_1256216503.29991" 
    capture_lex $P50
    $P50()
  if_47_end:
    get_hll_global $P116, ["Array"], "empty"
    $P117 = $P116()
    .lex "@new_names", $P117
    find_lex $P119, "@names"
    unless_null $P119, vivify_80
    new $P119, "ResizablePMCArray"
  vivify_80:
    defined $I120, $P119
    unless $I120, for_undef_81
    iter $P118, $P119
    new $P146, 'ExceptionHandler'
    set_addr $P146, loop145_handler
    $P146."handle_types"(65, 67, 66)
    push_eh $P146
  loop145_test:
    unless $P118, loop145_done
    shift $P121, $P118
  loop145_redo:
    .const 'Sub' $P123 = "22_1256216503.29991" 
    capture_lex $P123
    $P123($P121)
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
  for_undef_81:
    find_lex $P148, "$from_nsp"
    unless_null $P148, vivify_88
    new $P148, "Undef"
  vivify_88:
    find_lex $P149, "$caller_nsp"
    unless_null $P149, vivify_89
    new $P149, "Undef"
  vivify_89:
    find_lex $P150, "@names"
    unless_null $P150, vivify_90
    new $P150, "ResizablePMCArray"
  vivify_90:
    $P151 = $P148."export_to"($P149, $P150)
    .return ($P151)
  control_27:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P152, exception, "payload"
    .return ($P152)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "_block37"  :anon :subid("15_1256216503.29991") :outer("14_1256216503.29991")
    find_lex $P39, "$namespace"
    unless_null $P39, vivify_60
    new $P39, "Undef"
  vivify_60:
    "say"("Namespace: ", $P39)
    get_hll_global $P40, ["Dumper"], "DUMP_"
    find_lex $P41, "$namespace"
    unless_null $P41, vivify_61
    new $P41, "Undef"
  vivify_61:
    $P40($P41)
    get_hll_global $P42, ["Dumper"], "DUMP_"
    find_lex $P43, "$from_nsp"
    unless_null $P43, vivify_62
    new $P43, "Undef"
  vivify_62:
    $P44 = $P42($P43)
    .return ($P44)
.end


.namespace ["Parrot"]
.sub "_block53"  :anon :subid("17_1256216503.29991") :outer("14_1256216503.29991")
    .const 'Sub' $P60 = "18_1256216503.29991" 
    capture_lex $P60
    find_lex $P56, "$from_nsp"
    unless_null $P56, vivify_65
    new $P56, "Undef"
  vivify_65:
    defined $I57, $P56
    unless $I57, for_undef_66
    iter $P55, $P56
    new $P114, 'ExceptionHandler'
    set_addr $P114, loop113_handler
    $P114."handle_types"(65, 67, 66)
    push_eh $P114
  loop113_test:
    unless $P55, loop113_done
    shift $P58, $P55
  loop113_redo:
    .const 'Sub' $P60 = "18_1256216503.29991" 
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
  for_undef_66:
    .return ($P55)
.end


.namespace ["Parrot"]
.sub "_block59"  :anon :subid("18_1256216503.29991") :outer("17_1256216503.29991")
    .param pmc param_61
    .const 'Sub' $P107 = "21_1256216503.29991" 
    capture_lex $P107
    .const 'Sub' $P101 = "20_1256216503.29991" 
    capture_lex $P101
    .const 'Sub' $P93 = "19_1256216503.29991" 
    capture_lex $P93
    .lex "$_", param_61
    find_lex $P62, "$_"
    unless_null $P62, vivify_67
    new $P62, "Undef"
  vivify_67:
    set $S63, $P62
    new $P64, 'String'
    set $P64, $S63
    .lex "$name", $P64
    find_lex $P65, "$name"
    unless_null $P65, vivify_68
    new $P65, "ResizablePMCArray"
  vivify_68:
    set $P66, $P65[0]
    unless_null $P66, vivify_69
    new $P66, "Undef"
  vivify_69:
    .lex "$first_char", $P66
    new $P67, "Integer"
    assign $P67, 0
    .lex "$skip", $P67
    find_lex $P77, "$first_char"
    unless_null $P77, vivify_70
    new $P77, "Undef"
  vivify_70:
    set $S78, $P77
    iseq $I79, $S78, "$"
    unless $I79, unless_76
    new $P75, 'Integer'
    set $P75, $I79
    goto unless_76_end
  unless_76:
    find_lex $P80, "$first_char"
    unless_null $P80, vivify_71
    new $P80, "Undef"
  vivify_71:
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
    unless_null $P83, vivify_72
    new $P83, "Undef"
  vivify_72:
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
    unless_null $P86, vivify_73
    new $P86, "Undef"
  vivify_73:
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
    unless_null $P89, vivify_74
    new $P89, "Undef"
  vivify_74:
    set $S90, $P89
    iseq $I91, $S90, "_"
    new $P69, 'Integer'
    set $P69, $I91
  unless_70_end:
    if $P69, if_68
    get_hll_global $P96, ["String"], "substr"
    find_lex $P97, "$name"
    unless_null $P97, vivify_75
    new $P97, "Undef"
  vivify_75:
    $S98 = $P96($P97, 0, 6)
    iseq $I99, $S98, "_block"
    unless $I99, if_95_end
    .const 'Sub' $P101 = "20_1256216503.29991" 
    capture_lex $P101
    $P101()
  if_95_end:
    goto if_68_end
  if_68:
    .const 'Sub' $P93 = "19_1256216503.29991" 
    capture_lex $P93
    $P93()
  if_68_end:
    find_lex $P105, "$skip"
    unless_null $P105, vivify_76
    new $P105, "Undef"
  vivify_76:
    unless $P105, unless_104
    set $P103, $P105
    goto unless_104_end
  unless_104:
    .const 'Sub' $P107 = "21_1256216503.29991" 
    capture_lex $P107
    $P112 = $P107()
    set $P103, $P112
  unless_104_end:
    .return ($P103)
.end


.namespace ["Parrot"]
.sub "_block100"  :anon :subid("20_1256216503.29991") :outer("18_1256216503.29991")
    new $P102, "Integer"
    assign $P102, 1
    store_lex "$skip", $P102
    .return ($P102)
.end


.namespace ["Parrot"]
.sub "_block92"  :anon :subid("19_1256216503.29991") :outer("18_1256216503.29991")
    new $P94, "Integer"
    assign $P94, 1
    store_lex "$skip", $P94
    .return ($P94)
.end


.namespace ["Parrot"]
.sub "_block106"  :anon :subid("21_1256216503.29991") :outer("18_1256216503.29991")
    find_lex $P108, "@names"
    unless_null $P108, vivify_77
    new $P108, "ResizablePMCArray"
  vivify_77:
    find_lex $P109, "$_"
    unless_null $P109, vivify_78
    new $P109, "Undef"
  vivify_78:
    set $S110, $P109
    $P111 = $P108."push"($S110)
    .return ($P111)
.end


.namespace ["Parrot"]
.sub "_block49"  :anon :subid("16_1256216503.29991") :outer("14_1256216503.29991")
    find_lex $P51, "$names"
    unless_null $P51, vivify_79
    new $P51, "Undef"
  vivify_79:
    $P52 = $P51."split"(" ")
    store_lex "@names", $P52
    .return ($P52)
.end


.namespace ["Parrot"]
.sub "_block122"  :anon :subid("22_1256216503.29991") :outer("14_1256216503.29991")
    .param pmc param_124
    .const 'Sub' $P139 = "24_1256216503.29991" 
    capture_lex $P139
    .const 'Sub' $P132 = "23_1256216503.29991" 
    capture_lex $P132
    .lex "$_", param_124
    find_lex $P127, "$_"
    unless_null $P127, vivify_82
    new $P127, "Undef"
  vivify_82:
    set $S128, $P127
    find_lex $P129, "$caller_nsp"
    unless_null $P129, vivify_83
    new $P129, "Hash"
  vivify_83:
    set $P130, $P129[$S128]
    unless_null $P130, vivify_84
    new $P130, "Undef"
  vivify_84:
    if $P130, if_126
    .const 'Sub' $P139 = "24_1256216503.29991" 
    capture_lex $P139
    $P144 = $P139()
    set $P125, $P144
    goto if_126_end
  if_126:
    .const 'Sub' $P132 = "23_1256216503.29991" 
    capture_lex $P132
    $P137 = $P132()
    set $P125, $P137
  if_126_end:
    .return ($P125)
.end


.namespace ["Parrot"]
.sub "_block138"  :anon :subid("24_1256216503.29991") :outer("22_1256216503.29991")
    find_lex $P140, "@new_names"
    unless_null $P140, vivify_85
    new $P140, "ResizablePMCArray"
  vivify_85:
    find_lex $P141, "$_"
    unless_null $P141, vivify_86
    new $P141, "Undef"
  vivify_86:
    set $S142, $P141
    $P143 = $P140."push"($S142)
    .return ($P143)
.end


.namespace ["Parrot"]
.sub "_block131"  :anon :subid("23_1256216503.29991") :outer("22_1256216503.29991")
    new $P133, "String"
    assign $P133, "I will not overwrite namespace entry: "
    find_lex $P134, "$_"
    unless_null $P134, vivify_87
    new $P134, "Undef"
  vivify_87:
    concat $P135, $P133, $P134
    $P136 = "say"($P135)
    .return ($P136)
.end


.namespace ["Parrot"]
.sub "call_onload"  :subid("25_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_156
    .const 'Sub' $P162 = "26_1256216503.29991" 
    capture_lex $P162
    new $P155, 'ExceptionHandler'
    set_addr $P155, control_154
    $P155."handle_types"(58)
    push_eh $P155
    .lex "$nsp", param_156
    find_lex $P159, "$nsp"
    unless_null $P159, vivify_91
    new $P159, "Hash"
  vivify_91:
    set $P160, $P159["_ONLOAD"]
    unless_null $P160, vivify_92
    new $P160, "Undef"
  vivify_92:
    .lex "&onload", $P160
    if $P160, if_158
    set $P157, $P160
    goto if_158_end
  if_158:
    .const 'Sub' $P162 = "26_1256216503.29991" 
    capture_lex $P162
    $P165 = $P162()
    set $P157, $P165
  if_158_end:
    .return ($P157)
  control_154:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P166, exception, "payload"
    .return ($P166)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "_block161"  :anon :subid("26_1256216503.29991") :outer("25_1256216503.29991")
    find_lex $P163, "&onload"
    unless_null $P163, vivify_93
    new $P163, "Undef"
  vivify_93:
    $P164 = $P163()
    .return ($P164)
.end


.namespace ["Parrot"]
.sub "caller_namespace"  :subid("27_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_170 :optional
    .param int has_param_170 :opt_flag
    .const 'Sub' $P175 = "28_1256216503.29991" 
    capture_lex $P175
    new $P169, 'ExceptionHandler'
    set_addr $P169, control_168
    $P169."handle_types"(58)
    push_eh $P169
    if has_param_170, optparam_94
    new $P171, "Undef"
    set param_170, $P171
  optparam_94:
    .lex "$index", param_170
    find_lex $P173, "$index"
    unless_null $P173, vivify_95
    new $P173, "Undef"
  vivify_95:
    if $P173, unless_172_end
    .const 'Sub' $P175 = "28_1256216503.29991" 
    capture_lex $P175
    $P175()
  unless_172_end:

		.local pmc key
		key = new 'Key'
		key = 'namespace'
		$P0 = find_lex '$index'
		$S0 = $P0
		$P1 = new 'Key'
		$P1 = $S0
		push key, $P1
		
		$P0 = getinterp
		$P177 = $P0[ key ]
	
    .lex "$nsp", $P177
    new $P178, "Exception"
    set $P178['type'], 58
    find_lex $P179, "$nsp"
    unless_null $P179, vivify_96
    new $P179, "Undef"
  vivify_96:
    setattribute $P178, 'payload', $P179
    throw $P178
    .return ()
  control_168:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P180, exception, "payload"
    .return ($P180)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "_block174"  :anon :subid("28_1256216503.29991") :outer("27_1256216503.29991")
    new $P176, "Integer"
    assign $P176, 1
    store_lex "$index", $P176
    .return ($P176)
.end


.namespace ["Parrot"]
.sub "compile"  :subid("29_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_184
    new $P183, 'ExceptionHandler'
    set_addr $P183, control_182
    $P183."handle_types"(58)
    push_eh $P183
    .lex "$string", param_184

		.local pmc comp
		comp = compreg 'PIR'
		
		$P0 = find_lex '$string'
		$P185 = comp($P0)
	
    .lex "$result", $P185
    new $P186, "Exception"
    set $P186['type'], 58
    find_lex $P187, "$result"
    unless_null $P187, vivify_97
    new $P187, "Undef"
  vivify_97:
    setattribute $P186, 'payload', $P187
    throw $P186
    .return ()
  control_182:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P188, exception, "payload"
    .return ($P188)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "defined"  :subid("30_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_192 :slurpy
    new $P191, 'ExceptionHandler'
    set_addr $P191, control_190
    $P191."handle_types"(58)
    push_eh $P191
    .lex "@what", param_192

		$P0 = find_lex '@what'
		$I0 = defined $P0[0]
		$P193 = box $I0
	
    .lex "$result", $P193
    new $P194, "Exception"
    set $P194['type'], 58
    find_lex $P195, "$result"
    unless_null $P195, vivify_98
    new $P195, "Undef"
  vivify_98:
    setattribute $P194, 'payload', $P195
    throw $P194
    .return ()
  control_190:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P196, exception, "payload"
    .return ($P196)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "die"  :subid("31_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_200
    new $P199, 'ExceptionHandler'
    set_addr $P199, control_198
    $P199."handle_types"(58)
    push_eh $P199
    .lex "$message", param_200

		$P0 = find_lex '$message'
		$S0 = $P0
		die $S0
	
    .return ()
  control_198:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P201, exception, "payload"
    .return ($P201)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "get_address_of"  :subid("32_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_205
    new $P204, 'ExceptionHandler'
    set_addr $P204, control_203
    $P204."handle_types"(58)
    push_eh $P204
    .lex "$what", param_205

		$P0 = find_lex '$what'
		if null $P0 goto null_object
		$I0 = get_addr $P0
		goto done
	null_object:
		$I0 = 0
	done:
		$P206 = box $I0
	
    .lex "$address", $P206
    new $P207, "Exception"
    set $P207['type'], 58
    find_lex $P208, "$address"
    unless_null $P208, vivify_99
    new $P208, "Undef"
  vivify_99:
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
.sub "get_attribute"  :subid("33_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_213
    .param pmc param_214
    new $P212, 'ExceptionHandler'
    set_addr $P212, control_211
    $P212."handle_types"(58)
    push_eh $P212
    .lex "$pmc", param_213
    .lex "$attribute_name", param_214

		$P0 = find_lex '$pmc'
		$P1 = find_lex '$attribute_name'
		$S0 = $P1
		$P215 = getattribute $P0, $S0
	
    .lex "$result", $P215
    new $P216, "Exception"
    set $P216['type'], 58
    find_lex $P217, "$result"
    unless_null $P217, vivify_100
    new $P217, "Undef"
  vivify_100:
    setattribute $P216, 'payload', $P217
    throw $P216
    .return ()
  control_211:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P218, exception, "payload"
    .return ($P218)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "get_class"  :subid("34_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_222
    new $P221, 'ExceptionHandler'
    set_addr $P221, control_220
    $P221."handle_types"(58)
    push_eh $P221
    .lex "$pmc", param_222

		$P0 = find_lex '$pmc'
		$P223 = get_class $P0
	
    .lex "$result", $P223
    new $P224, "Exception"
    set $P224['type'], 58
    find_lex $P225, "$result"
    unless_null $P225, vivify_101
    new $P225, "Undef"
  vivify_101:
    setattribute $P224, 'payload', $P225
    throw $P224
    .return ()
  control_220:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P226, exception, "payload"
    .return ($P226)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "get_compiler"  :subid("35_1256216503.29991") :outer("11_1256216503.29991")
    .const 'Sub' $P233 = "36_1256216503.29991" 
    capture_lex $P233
    new $P229, 'ExceptionHandler'
    set_addr $P229, control_228
    $P229."handle_types"(58)
    push_eh $P229
    get_global $P231, "$Parrot_compiler"
    unless_null $P231, vivify_102
    new $P231, "Undef"
  vivify_102:
    if $P231, unless_230_end
    .const 'Sub' $P233 = "36_1256216503.29991" 
    capture_lex $P233
    $P233()
  unless_230_end:
    new $P235, "Exception"
    set $P235['type'], 58
    get_global $P236, "$Parrot_compiler"
    unless_null $P236, vivify_103
    new $P236, "Undef"
  vivify_103:
    setattribute $P235, 'payload', $P236
    throw $P235
    .return ()
  control_228:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P237, exception, "payload"
    .return ($P237)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "_block232"  :anon :subid("36_1256216503.29991") :outer("35_1256216503.29991")

			load_language 'parrot'
			$P234 = compreg 'parrot'
		
    set_global "$Parrot_compiler", $P234
    .return ($P234)
.end


.namespace ["Parrot"]
.sub "get_interpreter"  :subid("37_1256216503.29991") :outer("11_1256216503.29991")
    .const 'Sub' $P244 = "38_1256216503.29991" 
    capture_lex $P244
    new $P240, 'ExceptionHandler'
    set_addr $P240, control_239
    $P240."handle_types"(58)
    push_eh $P240
    get_global $P242, "$Parrot_interpreter"
    unless_null $P242, vivify_104
    new $P242, "Undef"
  vivify_104:
    if $P242, unless_241_end
    .const 'Sub' $P244 = "38_1256216503.29991" 
    capture_lex $P244
    $P244()
  unless_241_end:
    new $P246, "Exception"
    set $P246['type'], 58
    get_global $P247, "$Parrot_interpreter"
    unless_null $P247, vivify_105
    new $P247, "Undef"
  vivify_105:
    setattribute $P246, 'payload', $P247
    throw $P246
    .return ()
  control_239:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P248, exception, "payload"
    .return ($P248)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "_block243"  :anon :subid("38_1256216503.29991") :outer("37_1256216503.29991")

			$P245 = getinterp
		
    set_global "$Parrot_interpreter", $P245
    .return ($P245)
.end


.namespace ["Parrot"]
.sub "get_namespace"  :subid("39_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_252
    new $P251, 'ExceptionHandler'
    set_addr $P251, control_250
    $P251."handle_types"(58)
    push_eh $P251
    .lex "$name", param_252
    find_lex $P253, "$name"
    unless_null $P253, vivify_106
    new $P253, "Undef"
  vivify_106:
    $P254 = $P253."split"("::")
    .lex "@namespace", $P254
    find_lex $P255, "@namespace"
    unless_null $P255, vivify_107
    new $P255, "ResizablePMCArray"
  vivify_107:
    $P256 = "get_hll_namespace"($P255)
    .lex "$namespace", $P256
    new $P257, "Exception"
    set $P257['type'], 58
    find_lex $P258, "$namespace"
    unless_null $P258, vivify_108
    new $P258, "Undef"
  vivify_108:
    setattribute $P257, 'payload', $P258
    throw $P257
    .return ()
  control_250:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P259, exception, "payload"
    .return ($P259)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "get_hll_namespace"  :subid("40_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_263
    new $P262, 'ExceptionHandler'
    set_addr $P262, control_261
    $P262."handle_types"(58)
    push_eh $P262
    .lex "@parts", param_263

		$P0 = find_lex '@parts'
		$P264 = get_hll_namespace $P0
	
    .lex "$namespace", $P264
    new $P265, "Exception"
    set $P265['type'], 58
    find_lex $P266, "$namespace"
    unless_null $P266, vivify_109
    new $P266, "Undef"
  vivify_109:
    setattribute $P265, 'payload', $P266
    throw $P265
    .return ()
  control_261:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P267, exception, "payload"
    .return ($P267)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "get_sub"  :subid("41_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_271
    .const 'Sub' $P282 = "42_1256216503.29991" 
    capture_lex $P282
    new $P270, 'ExceptionHandler'
    set_addr $P270, control_269
    $P270."handle_types"(58)
    push_eh $P270
    .lex "$path", param_271
    find_lex $P272, "$path"
    unless_null $P272, vivify_110
    new $P272, "Undef"
  vivify_110:
    $P273 = $P272."split"("::")
    .lex "@parts", $P273
    find_lex $P274, "@parts"
    unless_null $P274, vivify_111
    new $P274, "ResizablePMCArray"
  vivify_111:
    $P275 = $P274."pop"()
    .lex "$name", $P275
    find_lex $P276, "@parts"
    unless_null $P276, vivify_112
    new $P276, "ResizablePMCArray"
  vivify_112:
    $P277 = "get_hll_namespace"($P276)
    .lex "$namespace", $P277
    new $P278, "Undef"
    .lex "$sub", $P278
    find_lex $P280, "$namespace"
    unless_null $P280, vivify_113
    new $P280, "Undef"
  vivify_113:
    unless $P280, if_279_end
    .const 'Sub' $P282 = "42_1256216503.29991" 
    capture_lex $P282
    $P282()
  if_279_end:
    new $P286, "Exception"
    set $P286['type'], 58
    find_lex $P287, "$sub"
    unless_null $P287, vivify_116
    new $P287, "Undef"
  vivify_116:
    setattribute $P286, 'payload', $P287
    throw $P286
    .return ()
  control_269:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P288, exception, "payload"
    .return ($P288)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "_block281"  :anon :subid("42_1256216503.29991") :outer("41_1256216503.29991")
    find_lex $P283, "$namespace"
    unless_null $P283, vivify_114
    new $P283, "Undef"
  vivify_114:
    find_lex $P284, "$name"
    unless_null $P284, vivify_115
    new $P284, "Undef"
  vivify_115:
    $P285 = $P283."find_sub"($P284)
    store_lex "$sub", $P285
    .return ($P285)
.end


.namespace ["Parrot"]
.sub "inspect"  :subid("43_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_292
    .param pmc param_293
    new $P291, 'ExceptionHandler'
    set_addr $P291, control_290
    $P291."handle_types"(58)
    push_eh $P291
    .lex "$pmc", param_292
    .lex "$key", param_293

		$P0 = find_lex '$pmc'
		$P1 = find_lex '$key'
		$S1 = $P1
		$P294 = inspect $P0, $S1
	
    .lex "$result", $P294
    new $P295, "Exception"
    set $P295['type'], 58
    find_lex $P296, "$result"
    unless_null $P296, vivify_117
    new $P296, "Undef"
  vivify_117:
    setattribute $P295, 'payload', $P296
    throw $P295
    .return ()
  control_290:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P297, exception, "payload"
    .return ($P297)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "is_null"  :subid("44_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_301 :slurpy
    .const 'Sub' $P307 = "45_1256216503.29991" 
    capture_lex $P307
    new $P300, 'ExceptionHandler'
    set_addr $P300, control_299
    $P300."handle_types"(58)
    push_eh $P300
    .lex "@what", param_301
    new $P302, "Integer"
    assign $P302, 0
    .lex "$result", $P302
    find_lex $P304, "@what"
    unless_null $P304, vivify_118
    new $P304, "ResizablePMCArray"
  vivify_118:
    set $N305, $P304
    unless $N305, if_303_end
    .const 'Sub' $P307 = "45_1256216503.29991" 
    capture_lex $P307
    $P307()
  if_303_end:
    new $P309, "Exception"
    set $P309['type'], 58
    find_lex $P310, "$result"
    unless_null $P310, vivify_119
    new $P310, "Undef"
  vivify_119:
    setattribute $P309, 'payload', $P310
    throw $P309
    .return ()
  control_299:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P311, exception, "payload"
    .return ($P311)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "_block306"  :anon :subid("45_1256216503.29991") :outer("44_1256216503.29991")

			$P0 = find_lex '@what'
			$P1 = shift $P0
			$I0 = isnull $P1
			$P308 = box $I0
		
    store_lex "$result", $P308
    .return ($P308)
.end


.namespace ["Parrot"]
.sub "isa"  :subid("46_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_315
    .param pmc param_316
    new $P314, 'ExceptionHandler'
    set_addr $P314, control_313
    $P314."handle_types"(58)
    push_eh $P314
    .lex "$pmc", param_315
    .lex "$class", param_316

		$P0 = find_lex '$pmc'
		$P1 = find_lex '$class'
		$S1 = $P1
		$I0 = isa $P0, $S1
		$P317 = box $I0
	
    .lex "$result", $P317
    new $P318, "Exception"
    set $P318['type'], 58
    find_lex $P319, "$result"
    unless_null $P319, vivify_120
    new $P319, "Undef"
  vivify_120:
    setattribute $P318, 'payload', $P319
    throw $P318
    .return ()
  control_313:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P320, exception, "payload"
    .return ($P320)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "load_bytecode"  :subid("47_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_324
    new $P323, 'ExceptionHandler'
    set_addr $P323, control_322
    $P323."handle_types"(58)
    push_eh $P323
    .lex "$file", param_324

		$P0 = find_lex '$file'
		$S0 = $P0
		load_bytecode $S0
	
    .return ()
  control_322:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P325, exception, "payload"
    .return ($P325)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "new_pmc"  :subid("48_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_329
    new $P328, 'ExceptionHandler'
    set_addr $P328, control_327
    $P328."handle_types"(58)
    push_eh $P328
    .lex "$type", param_329

		$P0 = find_lex '$type'
		$P330 = new $P0
	
    .lex "$result", $P330
    new $P331, "Exception"
    set $P331['type'], 58
    find_lex $P332, "$result"
    unless_null $P332, vivify_121
    new $P332, "Undef"
  vivify_121:
    setattribute $P331, 'payload', $P332
    throw $P331
    .return ()
  control_327:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P333, exception, "payload"
    .return ($P333)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "trace"  :subid("49_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_337
    new $P336, 'ExceptionHandler'
    set_addr $P336, control_335
    $P336."handle_types"(58)
    push_eh $P336
    .lex "$value", param_337

		$P0 = find_lex '$value'
		$I0 = $P0
		trace $I0
	
    .return ()
  control_335:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P338, exception, "payload"
    .return ($P338)
    rethrow exception
.end


.namespace ["Parrot"]
.sub "typeof"  :subid("50_1256216503.29991") :outer("11_1256216503.29991")
    .param pmc param_342
    new $P341, 'ExceptionHandler'
    set_addr $P341, control_340
    $P341."handle_types"(58)
    push_eh $P341
    .lex "$pmc", param_342

		$P0 = find_lex '$pmc'
		$P343 = typeof $P0
	
    .lex "$result", $P343
    new $P344, "Exception"
    set $P344['type'], 58
    find_lex $P345, "$result"
    unless_null $P345, vivify_122
    new $P345, "Undef"
  vivify_122:
    setattribute $P344, 'payload', $P345
    throw $P344
    .return ()
  control_340:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P346, exception, "payload"
    .return ($P346)
    rethrow exception
.end


.namespace ["Parrot";"Globals"]
.sub "_block347" :init :load :subid("51_1256216503.29991")
    .const 'Sub' $P372 = "55_1256216503.29991" 
    capture_lex $P372
    .const 'Sub' $P361 = "54_1256216503.29991" 
    capture_lex $P361
    .const 'Sub' $P350 = "52_1256216503.29991" 
    capture_lex $P350
    get_global $P349, "%_Global_index"
    unless_null $P349, vivify_123
    new $P349, "Hash"
  vivify_123:
    "_ONLOAD"()
    .const 'Sub' $P372 = "55_1256216503.29991" 
    capture_lex $P372
    .return ($P372)
.end


.namespace ["Parrot";"Globals"]
.sub "_ONLOAD"  :subid("52_1256216503.29991") :outer("51_1256216503.29991")
    .const 'Sub' $P356 = "53_1256216503.29991" 
    capture_lex $P356
    new $P352, 'ExceptionHandler'
    set_addr $P352, control_351
    $P352."handle_types"(58)
    push_eh $P352
    get_global $P354, "$onload_done"
    unless_null $P354, vivify_124
    new $P354, "Undef"
  vivify_124:
    unless $P354, if_353_end
    .const 'Sub' $P356 = "53_1256216503.29991" 
    capture_lex $P356
    $P356()
  if_353_end:
    new $P359, "Integer"
    assign $P359, 1
    set_global "$onload_done", $P359

			.include 'iglobals.pasm' 
			
			$P0 = new 'Hash'
			
			$P1 = box .IGLOBALS_CLASSNAME_HASH
			say $P1
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
  control_351:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P360, exception, "payload"
    .return ($P360)
    rethrow exception
.end


.namespace ["Parrot";"Globals"]
.sub "_block355"  :anon :subid("53_1256216503.29991") :outer("52_1256216503.29991")
    new $P357, "Exception"
    set $P357['type'], 58
    new $P358, "Integer"
    assign $P358, 0
    setattribute $P357, 'payload', $P358
    throw $P357
    .return ()
.end


.namespace ["Parrot";"Globals"]
.sub "_fetch"  :subid("54_1256216503.29991") :outer("51_1256216503.29991")
    .param pmc param_364
    new $P363, 'ExceptionHandler'
    set_addr $P363, control_362
    $P363."handle_types"(58)
    push_eh $P363
    .lex "$key", param_364
    new $P365, "Exception"
    set $P365['type'], 58
    find_lex $P366, "$key"
    unless_null $P366, vivify_125
    new $P366, "Undef"
  vivify_125:
    set $I367, $P366
    get_hll_global $P368, ["Parrot"], "_get_interpreter"
    $P369 = $P368()
    set $P370, $P369[$I367]
    unless_null $P370, vivify_126
    new $P370, "Undef"
  vivify_126:
    setattribute $P365, 'payload', $P370
    throw $P365
    .return ()
  control_362:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P371, exception, "payload"
    .return ($P371)
    rethrow exception
.end


.namespace ["Parrot";"Globals"]
.sub "get_global"  :subid("55_1256216503.29991") :outer("51_1256216503.29991")
    .param pmc param_375
    new $P374, 'ExceptionHandler'
    set_addr $P374, control_373
    $P374."handle_types"(58)
    push_eh $P374
    .lex "$key", param_375
    new $P376, "Exception"
    set $P376['type'], 58
    find_lex $P377, "$key"
    unless_null $P377, vivify_127
    new $P377, "Undef"
  vivify_127:
    get_global $P378, "%_Global_index"
    unless_null $P378, vivify_128
    new $P378, "Hash"
  vivify_128:
    set $P379, $P378[$P377]
    unless_null $P379, vivify_129
    new $P379, "Undef"
  vivify_129:
    $P380 = "_fetch"($P379)
    setattribute $P376, 'payload', $P380
    throw $P376
    .return ()
  control_373:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P381, exception, "payload"
    .return ($P381)
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
.sub "_block11"  :anon :subid("10_1256216778.72407")
    get_hll_global $P14, ["ConfigFile"], "_block13" 
    .return ($P14)
.end


.namespace ["ConfigFile"]
.sub "_block13" :init :load :subid("11_1256216778.72407")
    .const 'Sub' $P177 = "23_1256216778.72407" 
    capture_lex $P177
    .const 'Sub' $P162 = "22_1256216778.72407" 
    capture_lex $P162
    .const 'Sub' $P82 = "17_1256216778.72407" 
    capture_lex $P82
    .const 'Sub' $P72 = "16_1256216778.72407" 
    capture_lex $P72
    .const 'Sub' $P38 = "14_1256216778.72407" 
    capture_lex $P38
    .const 'Sub' $P15 = "12_1256216778.72407" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P177 = "23_1256216778.72407" 
    capture_lex $P177
    .return ($P177)
.end


.namespace ["ConfigFile"]
.sub "_ONLOAD"  :subid("12_1256216778.72407") :outer("11_1256216778.72407")
    .const 'Sub' $P21 = "13_1256216778.72407" 
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
    .const 'Sub' $P21 = "13_1256216778.72407" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    get_hll_global $P26, ["Class"], "SUBCLASS"
    $P26("ConfigFile", "Class::HashBased")
    get_hll_global $P27, "ConfigFile"
    $P28 = $P27."new"()
    .lex "$config", $P28
    find_lex $P29, "$config"
    unless_null $P29, vivify_25
    new $P29, "Undef"
  vivify_25:
    get_hll_global $P30, "Registry"
    unless_null $P30, vivify_26
    new $P30, "Hash"
    set_hll_global "Registry", $P30
  vivify_26:
    set $P30["CONFIG"], $P29
    find_lex $P31, "$config"
    unless_null $P31, vivify_27
    new $P31, "Undef"
  vivify_27:
    $P31."store"("Dump::ConfigFile::_onload", 0)
    find_lex $P32, "$config"
    unless_null $P32, vivify_28
    new $P32, "Undef"
  vivify_28:
    $P32."store"("Dump::ConfigFile::parse_config", 0)
    find_lex $P33, "$config"
    unless_null $P33, vivify_29
    new $P33, "Undef"
  vivify_29:
    $P33."store"("Dump::ConfigFile::query", 0)
    find_lex $P34, "$config"
    unless_null $P34, vivify_30
    new $P34, "Undef"
  vivify_30:
    $P34."store"("Dump::Parrot::defined", 7)
    find_lex $P35, "$config"
    unless_null $P35, vivify_31
    new $P35, "Undef"
  vivify_31:
    $P35."store"("Dump::Stack::Root", "parrot::close::Compiler::main")
    $P36 = "NOTE"("ConfigFile::_onload: done")
    .return ($P36)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P37, exception, "payload"
    .return ($P37)
    rethrow exception
.end


.namespace ["ConfigFile"]
.sub "_block20"  :anon :subid("13_1256216778.72407") :outer("12_1256216778.72407")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["ConfigFile"]
.sub "file"  :subid("14_1256216778.72407") :method :outer("11_1256216778.72407")
    .param pmc param_41 :optional
    .param int has_param_41 :opt_flag
    .const 'Sub' $P54 = "15_1256216778.72407" 
    capture_lex $P54
    new $P40, 'ExceptionHandler'
    set_addr $P40, control_39
    $P40."handle_types"(58)
    push_eh $P40
    .lex "self", self
    if has_param_41, optparam_32
    new $P42, "Undef"
    set param_41, $P42
  optparam_32:
    .lex "$filename", param_41
    find_lex $P46, "$filename"
    unless_null $P46, vivify_33
    new $P46, "Undef"
  vivify_33:
    if $P46, if_45
    set $P44, $P46
    goto if_45_end
  if_45:
    find_lex $P47, "self"
    unless_null $P47, vivify_34
    new $P47, "Hash"
  vivify_34:
    set $P48, $P47["_filename"]
    unless_null $P48, vivify_35
    new $P48, "Undef"
  vivify_35:
    set $S49, $P48
    find_lex $P50, "$filename"
    unless_null $P50, vivify_36
    new $P50, "Undef"
  vivify_36:
    set $S51, $P50
    isne $I52, $S49, $S51
    new $P44, 'Integer'
    set $P44, $I52
  if_45_end:
    unless $P44, if_43_end
    .const 'Sub' $P54 = "15_1256216778.72407" 
    capture_lex $P54
    $P54()
  if_43_end:
    new $P68, "Exception"
    set $P68['type'], 58
    find_lex $P69, "self"
    unless_null $P69, vivify_43
    new $P69, "Hash"
  vivify_43:
    set $P70, $P69["_filename"]
    unless_null $P70, vivify_44
    new $P70, "Undef"
  vivify_44:
    setattribute $P68, 'payload', $P70
    throw $P68
    .return ()
  control_39:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P71, exception, "payload"
    .return ($P71)
    rethrow exception
.end


.namespace ["ConfigFile"]
.sub "_block53"  :anon :subid("15_1256216778.72407") :outer("14_1256216778.72407")
    find_lex $P55, "$filename"
    unless_null $P55, vivify_37
    new $P55, "Undef"
  vivify_37:
    "NOTE"("Reading filename: ", $P55)
    get_hll_global $P56, ["File"], "slurp"
    find_lex $P57, "$filename"
    unless_null $P57, vivify_38
    new $P57, "Undef"
  vivify_38:
    $P58 = $P56($P57)
    .lex "$data", $P58
    get_hll_global $P59, ["Hash"], "empty"
    $P60 = $P59()
    find_lex $P61, "self"
    unless_null $P61, vivify_39
    new $P61, "Hash"
    store_lex "self", $P61
  vivify_39:
    set $P61["_data"], $P60
    find_lex $P62, "self"
    find_lex $P63, "$data"
    unless_null $P63, vivify_40
    new $P63, "Undef"
  vivify_40:
    $P62."parse_config"($P63)
    find_lex $P64, "$filename"
    unless_null $P64, vivify_41
    new $P64, "Undef"
  vivify_41:
    find_lex $P65, "self"
    unless_null $P65, vivify_42
    new $P65, "Hash"
    store_lex "self", $P65
  vivify_42:
    set $P65["_filename"], $P64
    find_lex $P66, "self"
    $P67 = "DUMP"($P66)
    .return ($P67)
.end


.namespace ["ConfigFile"]
.sub "init"  :subid("16_1256216778.72407") :method :outer("11_1256216778.72407")
    .param pmc param_75
    .param pmc param_76
    new $P74, 'ExceptionHandler'
    set_addr $P74, control_73
    $P74."handle_types"(58)
    push_eh $P74
    .lex "self", self
    .lex "@children", param_75
    .lex "%attributes", param_76
    new $P77, "String"
    assign $P77, "<no filename set>"
    find_lex $P78, "self"
    unless_null $P78, vivify_45
    new $P78, "Hash"
    store_lex "self", $P78
  vivify_45:
    set $P78["_filename"], $P77
    new $P79, "Exception"
    set $P79['type'], 58
    find_lex $P80, "self"
    setattribute $P79, 'payload', $P80
    throw $P79
    .return ()
  control_73:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P81, exception, "payload"
    .return ($P81)
    rethrow exception
.end


.namespace ["ConfigFile"]
.sub "parse_config"  :subid("17_1256216778.72407") :method :outer("11_1256216778.72407")
    .param pmc param_85
    .const 'Sub' $P95 = "18_1256216778.72407" 
    capture_lex $P95
    new $P84, 'ExceptionHandler'
    set_addr $P84, control_83
    $P84."handle_types"(58)
    push_eh $P84
    .lex "self", self
    .lex "$data", param_85
    find_lex $P86, "$data"
    unless_null $P86, vivify_46
    new $P86, "Undef"
  vivify_46:
    $P87 = $P86."split"("\n")
    .lex "@lines", $P87
    find_lex $P88, "@lines"
    unless_null $P88, vivify_47
    new $P88, "ResizablePMCArray"
  vivify_47:
    "DUMP"($P88)
    new $P89, "Integer"
    assign $P89, 0
    .lex "$line_number", $P89
    find_lex $P91, "@lines"
    unless_null $P91, vivify_48
    new $P91, "ResizablePMCArray"
  vivify_48:
    defined $I92, $P91
    unless $I92, for_undef_49
    iter $P90, $P91
    new $P157, 'ExceptionHandler'
    set_addr $P157, loop156_handler
    $P157."handle_types"(65, 67, 66)
    push_eh $P157
  loop156_test:
    unless $P90, loop156_done
    shift $P93, $P90
  loop156_redo:
    .const 'Sub' $P95 = "18_1256216778.72407" 
    capture_lex $P95
    $P95($P93)
  loop156_next:
    goto loop156_test
  loop156_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P158, exception, 'type'
    eq $P158, 65, loop156_next
    eq $P158, 67, loop156_redo
  loop156_done:
    pop_eh 
  for_undef_49:
    find_lex $P159, "self"
    $P160 = "DUMP"($P159)
    .return ($P160)
  control_83:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P161, exception, "payload"
    .return ($P161)
    rethrow exception
.end


.namespace ["ConfigFile"]
.sub "_block94"  :anon :subid("18_1256216778.72407") :outer("17_1256216778.72407")
    .param pmc param_96
    .const 'Sub' $P119 = "19_1256216778.72407" 
    capture_lex $P119
    .lex "$_", param_96
    find_lex $P97, "$line_number"
    unless_null $P97, vivify_50
    new $P97, "Undef"
  vivify_50:
        ##  inline postfix:++
        clone $P98, $P97
        inc $P97
    new $P99, "String"
    assign $P99, "    "
    find_lex $P100, "$line_number"
    unless_null $P100, vivify_51
    new $P100, "Undef"
  vivify_51:
    concat $P101, $P99, $P100
    new $P102, "Integer"
    assign $P102, 4
    neg $P103, $P102
    $P104 = $P101."substr"($P103)
    find_lex $P105, "$_"
    unless_null $P105, vivify_52
    new $P105, "Undef"
  vivify_52:
    "NOTE"($P104, ": ", $P105)
    get_hll_global $P106, ["String"], "trim"
    find_lex $P107, "$_"
    unless_null $P107, vivify_53
    new $P107, "Undef"
  vivify_53:
    $P108 = $P106($P107)
    .lex "$line", $P108
    find_lex $P113, "$line"
    unless_null $P113, vivify_54
    new $P113, "Undef"
  vivify_54:
    if $P113, if_112
    set $P111, $P113
    goto if_112_end
  if_112:
    find_lex $P114, "$line"
    unless_null $P114, vivify_55
    new $P114, "ResizablePMCArray"
  vivify_55:
    set $P115, $P114[0]
    unless_null $P115, vivify_56
    new $P115, "Undef"
  vivify_56:
    set $S116, $P115
    isne $I117, $S116, "#"
    new $P111, 'Integer'
    set $P111, $I117
  if_112_end:
    if $P111, if_110
    set $P109, $P111
    goto if_110_end
  if_110:
    .const 'Sub' $P119 = "19_1256216778.72407" 
    capture_lex $P119
    $P155 = $P119()
    set $P109, $P155
  if_110_end:
    .return ($P109)
.end


.namespace ["ConfigFile"]
.sub "_block118"  :anon :subid("19_1256216778.72407") :outer("18_1256216778.72407")
    .const 'Sub' $P143 = "21_1256216778.72407" 
    capture_lex $P143
    .const 'Sub' $P135 = "20_1256216778.72407" 
    capture_lex $P135
    find_lex $P120, "$line"
    unless_null $P120, vivify_57
    new $P120, "Undef"
  vivify_57:
    $P121 = $P120."split"("=")
    .lex "@kv", $P121
    get_hll_global $P122, ["String"], "trim"
    find_lex $P123, "@kv"
    unless_null $P123, vivify_58
    new $P123, "ResizablePMCArray"
  vivify_58:
    $P124 = $P123."shift"()
    $P125 = $P122($P124)
    .lex "$key", $P125
    get_hll_global $P128, ["String"], "length"
    find_lex $P129, "$key"
    unless_null $P129, vivify_59
    new $P129, "Undef"
  vivify_59:
    $N130 = $P128($P129)
    new $P131, "Integer"
    assign $P131, 0
    set $N132, $P131
    iseq $I133, $N130, $N132
    if $I133, if_127
    .const 'Sub' $P143 = "21_1256216778.72407" 
    capture_lex $P143
    $P154 = $P143()
    set $P126, $P154
    goto if_127_end
  if_127:
    .const 'Sub' $P135 = "20_1256216778.72407" 
    capture_lex $P135
    $P141 = $P135()
    set $P126, $P141
  if_127_end:
    .return ($P126)
.end


.namespace ["ConfigFile"]
.sub "_block142"  :anon :subid("21_1256216778.72407") :outer("19_1256216778.72407")
    get_hll_global $P144, ["String"], "trim"
    find_lex $P145, "@kv"
    unless_null $P145, vivify_60
    new $P145, "ResizablePMCArray"
  vivify_60:
    $P146 = $P145."join"("=")
    $P147 = $P144($P146)
    .lex "$value", $P147
    find_lex $P148, "$key"
    unless_null $P148, vivify_61
    new $P148, "Undef"
  vivify_61:
    "NOTE"("Key:\t", $P148)
    find_lex $P149, "$value"
    unless_null $P149, vivify_62
    new $P149, "Undef"
  vivify_62:
    "NOTE"("Value:\t", $P149)
    find_lex $P150, "self"
    find_lex $P151, "$key"
    unless_null $P151, vivify_63
    new $P151, "Undef"
  vivify_63:
    find_lex $P152, "$value"
    unless_null $P152, vivify_64
    new $P152, "Undef"
  vivify_64:
    $P153 = $P150."store"($P151, $P152)
    .return ($P153)
.end


.namespace ["ConfigFile"]
.sub "_block134"  :anon :subid("20_1256216778.72407") :outer("19_1256216778.72407")
    find_lex $P136, "self"
    unless_null $P136, vivify_65
    new $P136, "Hash"
  vivify_65:
    set $P137, $P136["_filename"]
    unless_null $P137, vivify_66
    new $P137, "Undef"
  vivify_66:
    find_lex $P138, "$line_number"
    unless_null $P138, vivify_67
    new $P138, "Undef"
  vivify_67:
    "say"("Warning: in file '", $P137, "', line #", $P138, ": zero-length keys are not allowed.")
    find_lex $P139, "$line"
    unless_null $P139, vivify_68
    new $P139, "Undef"
  vivify_68:
    $P140 = "say"($P139)
    .return ($P140)
.end


.namespace ["ConfigFile"]
.sub "query"  :subid("22_1256216778.72407") :method :outer("11_1256216778.72407")
    .param pmc param_165 :slurpy
    new $P164, 'ExceptionHandler'
    set_addr $P164, control_163
    $P164."handle_types"(58)
    push_eh $P164
    .lex "self", self
    .lex "@keys", param_165
    find_lex $P166, "@keys"
    unless_null $P166, vivify_69
    new $P166, "ResizablePMCArray"
  vivify_69:
    $P167 = $P166."join"("::")
    .lex "$key", $P167
    find_lex $P168, "$key"
    unless_null $P168, vivify_70
    new $P168, "Undef"
  vivify_70:
    "NOTE"("Querying for key: ", $P168)
    find_lex $P169, "$key"
    unless_null $P169, vivify_71
    new $P169, "Undef"
  vivify_71:
    find_lex $P170, "self"
    unless_null $P170, vivify_72
    new $P170, "Hash"
  vivify_72:
    set $P171, $P170["_data"]
    unless_null $P171, vivify_73
    new $P171, "Hash"
  vivify_73:
    set $P172, $P171[$P169]
    unless_null $P172, vivify_74
    new $P172, "Undef"
  vivify_74:
    .lex "$value", $P172
    find_lex $P173, "$value"
    unless_null $P173, vivify_75
    new $P173, "Undef"
  vivify_75:
    "NOTE"("Value: ", $P173)
    new $P174, "Exception"
    set $P174['type'], 58
    find_lex $P175, "$value"
    unless_null $P175, vivify_76
    new $P175, "Undef"
  vivify_76:
    setattribute $P174, 'payload', $P175
    throw $P174
    .return ()
  control_163:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P176, exception, "payload"
    .return ($P176)
    rethrow exception
.end


.namespace ["ConfigFile"]
.sub "store"  :subid("23_1256216778.72407") :method :outer("11_1256216778.72407")
    .param pmc param_180
    .param pmc param_181
    new $P179, 'ExceptionHandler'
    set_addr $P179, control_178
    $P179."handle_types"(58)
    push_eh $P179
    .lex "self", self
    .lex "$key", param_180
    .lex "$value", param_181
    find_lex $P182, "$key"
    unless_null $P182, vivify_77
    new $P182, "Undef"
  vivify_77:
    find_lex $P183, "$value"
    unless_null $P183, vivify_78
    new $P183, "Undef"
  vivify_78:
    "NOTE"("ConfigFile: Storing key '", $P182, "' value: ", $P183)
    new $P184, "Exception"
    set $P184['type'], 58
    find_lex $P185, "$value"
    unless_null $P185, vivify_79
    new $P185, "Undef"
  vivify_79:
    find_lex $P186, "$key"
    unless_null $P186, vivify_80
    new $P186, "Undef"
  vivify_80:
    find_lex $P187, "self"
    unless_null $P187, vivify_81
    new $P187, "Hash"
    store_lex "self", $P187
  vivify_81:
    set $P188, $P187["_data"]
    unless_null $P188, vivify_82
    new $P188, "Hash"
    set $P187["_data"], $P188
  vivify_82:
    set $P188[$P186], $P185
    setattribute $P184, 'payload', $P185
    throw $P184
    .return ()
  control_178:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P189, exception, "payload"
    .return ($P189)
    rethrow exception
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


.namespace []
.sub "_block11"  :anon :subid("10_1256217009.36755")
    get_hll_global $P14, ["Testcase"], "_block13" 
    .return ($P14)
.end


.namespace ["Testcase"]
.sub "_block13" :init :load :subid("11_1256217009.36755")
    .const 'Sub' $P401 = "50_1256217009.36755" 
    capture_lex $P401
    .const 'Sub' $P395 = "49_1256217009.36755" 
    capture_lex $P395
    .const 'Sub' $P387 = "48_1256217009.36755" 
    capture_lex $P387
    .const 'Sub' $P348 = "45_1256217009.36755" 
    capture_lex $P348
    .const 'Sub' $P320 = "43_1256217009.36755" 
    capture_lex $P320
    .const 'Sub' $P312 = "42_1256217009.36755" 
    capture_lex $P312
    .const 'Sub' $P304 = "41_1256217009.36755" 
    capture_lex $P304
    .const 'Sub' $P296 = "40_1256217009.36755" 
    capture_lex $P296
    .const 'Sub' $P288 = "39_1256217009.36755" 
    capture_lex $P288
    .const 'Sub' $P282 = "38_1256217009.36755" 
    capture_lex $P282
    .const 'Sub' $P267 = "37_1256217009.36755" 
    capture_lex $P267
    .const 'Sub' $P235 = "34_1256217009.36755" 
    capture_lex $P235
    .const 'Sub' $P223 = "33_1256217009.36755" 
    capture_lex $P223
    .const 'Sub' $P215 = "32_1256217009.36755" 
    capture_lex $P215
    .const 'Sub' $P207 = "31_1256217009.36755" 
    capture_lex $P207
    .const 'Sub' $P199 = "30_1256217009.36755" 
    capture_lex $P199
    .const 'Sub' $P191 = "29_1256217009.36755" 
    capture_lex $P191
    .const 'Sub' $P183 = "28_1256217009.36755" 
    capture_lex $P183
    .const 'Sub' $P130 = "24_1256217009.36755" 
    capture_lex $P130
    .const 'Sub' $P122 = "23_1256217009.36755" 
    capture_lex $P122
    .const 'Sub' $P115 = "22_1256217009.36755" 
    capture_lex $P115
    .const 'Sub' $P107 = "21_1256217009.36755" 
    capture_lex $P107
    .const 'Sub' $P100 = "20_1256217009.36755" 
    capture_lex $P100
    .const 'Sub' $P65 = "18_1256217009.36755" 
    capture_lex $P65
    .const 'Sub' $P57 = "17_1256217009.36755" 
    capture_lex $P57
    .const 'Sub' $P50 = "16_1256217009.36755" 
    capture_lex $P50
    .const 'Sub' $P42 = "15_1256217009.36755" 
    capture_lex $P42
    .const 'Sub' $P35 = "14_1256217009.36755" 
    capture_lex $P35
    .const 'Sub' $P15 = "12_1256217009.36755" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P401 = "50_1256217009.36755" 
    capture_lex $P401
    .return ($P401)
.end


.namespace ["Testcase"]
.sub "_ONLOAD"  :subid("12_1256217009.36755") :outer("11_1256217009.36755")
    .const 'Sub' $P21 = "13_1256217009.36755" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_51
    new $P19, "Undef"
  vivify_51:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256217009.36755" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
 load_bytecode 'library/kakapo.pbc' 
    get_hll_global $P25, "Registry"
    unless_null $P25, vivify_52
    new $P25, "Hash"
  vivify_52:
    set $P26, $P25["CONFIG"]
    unless_null $P26, vivify_53
    new $P26, "Undef"
  vivify_53:
    $P26."file"("test.cfg")
    get_hll_global $P27, ["Parrot"], "IMPORT"
    $P27("Dumper")
    get_hll_global $P28, ["Parrot"], "IMPORT"
    $P28("Matcher::Factory")
    new $P29, "String"
    assign $P29, "Testcase"
    .lex "$class_name", $P29
    find_lex $P30, "$class_name"
    unless_null $P30, vivify_54
    new $P30, "Undef"
  vivify_54:
    "NOTE"("Creating class ", $P30)
    get_hll_global $P31, ["Class"], "SUBCLASS"
    find_lex $P32, "$class_name"
    unless_null $P32, vivify_55
    new $P32, "Undef"
  vivify_55:
    $P31($P32, "Class::HashBased")
    $P33 = "NOTE"("done")
    .return ($P33)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P34, exception, "payload"
    .return ($P34)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "_block20"  :anon :subid("13_1256217009.36755") :outer("12_1256217009.36755")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Testcase"]
.sub "after_methods"  :subid("14_1256217009.36755") :method :outer("11_1256217009.36755")
    .param pmc param_38 :slurpy
    new $P37, 'ExceptionHandler'
    set_addr $P37, control_36
    $P37."handle_types"(58)
    push_eh $P37
    .lex "self", self
    .lex "@value", param_38
    find_lex $P39, "self"
    $P40 = $P39."_ATTR_SETBY"("after_methods", "fetch_after_methods")
    .return ($P40)
  control_36:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P41, exception, "payload"
    .return ($P41)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "after_prefix"  :subid("15_1256217009.36755") :method :outer("11_1256217009.36755")
    .param pmc param_45 :slurpy
    new $P44, 'ExceptionHandler'
    set_addr $P44, control_43
    $P44."handle_types"(58)
    push_eh $P44
    .lex "self", self
    .lex "@value", param_45
    find_lex $P46, "self"
    find_lex $P47, "@value"
    unless_null $P47, vivify_56
    new $P47, "ResizablePMCArray"
  vivify_56:
    $P48 = $P46."_ATTR_DEFAULT"("after_prefix", $P47, "after_")
    .return ($P48)
  control_43:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P49, exception, "payload"
    .return ($P49)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "afterall_methods"  :subid("16_1256217009.36755") :method :outer("11_1256217009.36755")
    .param pmc param_53 :slurpy
    new $P52, 'ExceptionHandler'
    set_addr $P52, control_51
    $P52."handle_types"(58)
    push_eh $P52
    .lex "self", self
    .lex "@value", param_53
    find_lex $P54, "self"
    $P55 = $P54."_ATTR_SETBY"("afterall_methods", "fetch_afterall_methods")
    .return ($P55)
  control_51:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P56, exception, "payload"
    .return ($P56)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "afterall_prefix"  :subid("17_1256217009.36755") :method :outer("11_1256217009.36755")
    .param pmc param_60 :slurpy
    new $P59, 'ExceptionHandler'
    set_addr $P59, control_58
    $P59."handle_types"(58)
    push_eh $P59
    .lex "self", self
    .lex "@value", param_60
    find_lex $P61, "self"
    find_lex $P62, "@value"
    unless_null $P62, vivify_57
    new $P62, "ResizablePMCArray"
  vivify_57:
    $P63 = $P61."_ATTR_DEFAULT"("afterall_prefix", $P62, "afterall_")
    .return ($P63)
  control_58:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P64, exception, "payload"
    .return ($P64)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "assert_that"  :subid("18_1256217009.36755") :method :outer("11_1256217009.36755")
    .param pmc param_68
    .param pmc param_69
    .param pmc param_70
    .const 'Sub' $P84 = "19_1256217009.36755" 
    capture_lex $P84
    new $P67, 'ExceptionHandler'
    set_addr $P67, control_66
    $P67."handle_types"(58)
    push_eh $P67
    .lex "self", self
    .lex "$item_desc", param_68
    .lex "$item", param_69
    .lex "$matcher", param_70
    find_lex $P71, "$matcher"
    unless_null $P71, vivify_58
    new $P71, "Undef"
  vivify_58:
    find_lex $P72, "$item_desc"
    unless_null $P72, vivify_59
    new $P72, "Undef"
  vivify_59:
    concat $P73, $P72, " "
    $P74 = $P71."describe_self"($P73)
    .lex "$description", $P74
    find_lex $P75, "$matcher"
    unless_null $P75, vivify_60
    new $P75, "Undef"
  vivify_60:
    find_lex $P76, "$item"
    unless_null $P76, vivify_61
    new $P76, "Undef"
  vivify_61:
    $P77 = $P75."matches"($P76)
    .lex "$result", $P77
    find_lex $P78, "self"
    find_lex $P79, "$result"
    unless_null $P79, vivify_62
    new $P79, "Undef"
  vivify_62:
    find_lex $P80, "$description"
    unless_null $P80, vivify_63
    new $P80, "Undef"
  vivify_63:
    $P78."ok"($P79, $P80)
    find_lex $P82, "$result"
    unless_null $P82, vivify_64
    new $P82, "Undef"
  vivify_64:
    if $P82, unless_81_end
    .const 'Sub' $P84 = "19_1256217009.36755" 
    capture_lex $P84
    $P84()
  unless_81_end:
    new $P97, "Exception"
    set $P97['type'], 58
    find_lex $P98, "$result"
    unless_null $P98, vivify_70
    new $P98, "Undef"
  vivify_70:
    setattribute $P97, 'payload', $P98
    throw $P97
    .return ()
  control_66:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P99, exception, "payload"
    .return ($P99)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "_block83"  :anon :subid("19_1256217009.36755") :outer("18_1256217009.36755")
    find_lex $P85, "$matcher"
    unless_null $P85, vivify_65
    new $P85, "Undef"
  vivify_65:
    new $P86, "String"
    assign $P86, "Expected: "
    find_lex $P87, "$item_desc"
    unless_null $P87, vivify_66
    new $P87, "Undef"
  vivify_66:
    concat $P88, $P86, $P87
    concat $P89, $P88, " "
    $P90 = $P85."describe_self"($P89)
    find_lex $P91, "$matcher"
    unless_null $P91, vivify_67
    new $P91, "Undef"
  vivify_67:
    find_lex $P92, "$item"
    unless_null $P92, vivify_68
    new $P92, "Undef"
  vivify_68:
    $S93 = $P91."describe_failure"($P92, "\n     but: ")
    concat $P94, $P90, $S93
    .lex "$explain", $P94
    find_lex $P95, "$explain"
    unless_null $P95, vivify_69
    new $P95, "Undef"
  vivify_69:
    $P96 = "say"($P95)
    .return ($P96)
.end


.namespace ["Testcase"]
.sub "before_methods"  :subid("20_1256217009.36755") :method :outer("11_1256217009.36755")
    .param pmc param_103 :slurpy
    new $P102, 'ExceptionHandler'
    set_addr $P102, control_101
    $P102."handle_types"(58)
    push_eh $P102
    .lex "self", self
    .lex "@value", param_103
    find_lex $P104, "self"
    $P105 = $P104."_ATTR_SETBY"("before_methods", "fetch_before_methods")
    .return ($P105)
  control_101:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "before_prefix"  :subid("21_1256217009.36755") :method :outer("11_1256217009.36755")
    .param pmc param_110 :slurpy
    new $P109, 'ExceptionHandler'
    set_addr $P109, control_108
    $P109."handle_types"(58)
    push_eh $P109
    .lex "self", self
    .lex "@value", param_110
    find_lex $P111, "self"
    find_lex $P112, "@value"
    unless_null $P112, vivify_71
    new $P112, "ResizablePMCArray"
  vivify_71:
    $P113 = $P111."_ATTR_DEFAULT"("before_prefix", $P112, "before_")
    .return ($P113)
  control_108:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "beforeall_methods"  :subid("22_1256217009.36755") :method :outer("11_1256217009.36755")
    .param pmc param_118 :slurpy
    new $P117, 'ExceptionHandler'
    set_addr $P117, control_116
    $P117."handle_types"(58)
    push_eh $P117
    .lex "self", self
    .lex "@value", param_118
    find_lex $P119, "self"
    $P120 = $P119."_ATTR_SETBY"("beforeall_methods", "fetch_beforeall_methods")
    .return ($P120)
  control_116:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, "payload"
    .return ($P121)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "beforeall_prefix"  :subid("23_1256217009.36755") :method :outer("11_1256217009.36755")
    .param pmc param_125 :slurpy
    new $P124, 'ExceptionHandler'
    set_addr $P124, control_123
    $P124."handle_types"(58)
    push_eh $P124
    .lex "self", self
    .lex "@value", param_125
    find_lex $P126, "self"
    find_lex $P127, "@value"
    unless_null $P127, vivify_72
    new $P127, "ResizablePMCArray"
  vivify_72:
    $P128 = $P126."_ATTR_DEFAULT"("beforeall_prefix", $P127, "beforeall_")
    .return ($P128)
  control_123:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P129, exception, "payload"
    .return ($P129)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "fetch_methods"  :subid("24_1256217009.36755") :method :outer("11_1256217009.36755")
    .param pmc param_133 :optional :named("starting_with")
    .param int has_param_133 :opt_flag
    .const 'Sub' $P142 = "25_1256217009.36755" 
    capture_lex $P142
    new $P132, 'ExceptionHandler'
    set_addr $P132, control_131
    $P132."handle_types"(58)
    push_eh $P132
    .lex "self", self
    if has_param_133, optparam_73
    new $P134, "Undef"
    set param_133, $P134
  optparam_73:
    .lex "$starting_with", param_133
    find_lex $P135, "$starting_with"
    unless_null $P135, vivify_74
    new $P135, "Undef"
  vivify_74:
    "NOTE"("Fetching methods starting with: ", $P135)
    get_hll_global $P136, ["Class"], "get_method_list"
    find_lex $P137, "self"
    $P138 = $P136($P137)
    .lex "@list", $P138
    find_lex $P140, "$starting_with"
    unless_null $P140, vivify_75
    new $P140, "Undef"
  vivify_75:
    unless $P140, if_139_end
    .const 'Sub' $P142 = "25_1256217009.36755" 
    capture_lex $P142
    $P142()
  if_139_end:
    find_lex $P175, "@list"
    unless_null $P175, vivify_86
    new $P175, "ResizablePMCArray"
  vivify_86:
    set $N176, $P175
    find_lex $P177, "@list"
    unless_null $P177, vivify_87
    new $P177, "ResizablePMCArray"
  vivify_87:
    $P178 = $P177."join"(", ")
    "NOTE"("Got ", $N176, " methods: ", $P178)
    find_lex $P179, "@list"
    unless_null $P179, vivify_88
    new $P179, "ResizablePMCArray"
  vivify_88:
    "DUMP"($P179)
    new $P180, "Exception"
    set $P180['type'], 58
    find_lex $P181, "@list"
    unless_null $P181, vivify_89
    new $P181, "ResizablePMCArray"
  vivify_89:
    setattribute $P180, 'payload', $P181
    throw $P180
    .return ()
  control_131:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P182, exception, "payload"
    .return ($P182)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "_block141"  :anon :subid("25_1256217009.36755") :outer("24_1256217009.36755")
    .const 'Sub' $P152 = "26_1256217009.36755" 
    capture_lex $P152
    new $P143, "ResizablePMCArray"
    .lex "@matches", $P143
    get_hll_global $P144, ["String"], "length"
    find_lex $P145, "$starting_with"
    unless_null $P145, vivify_76
    new $P145, "Undef"
  vivify_76:
    $P146 = $P144($P145)
    .lex "$length", $P146
    find_lex $P148, "@list"
    unless_null $P148, vivify_77
    new $P148, "ResizablePMCArray"
  vivify_77:
    defined $I149, $P148
    unless $I149, for_undef_78
    iter $P147, $P148
    new $P172, 'ExceptionHandler'
    set_addr $P172, loop171_handler
    $P172."handle_types"(65, 67, 66)
    push_eh $P172
  loop171_test:
    unless $P147, loop171_done
    shift $P150, $P147
  loop171_redo:
    .const 'Sub' $P152 = "26_1256217009.36755" 
    capture_lex $P152
    $P152($P150)
  loop171_next:
    goto loop171_test
  loop171_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P173, exception, 'type'
    eq $P173, 65, loop171_next
    eq $P173, 67, loop171_redo
  loop171_done:
    pop_eh 
  for_undef_78:
    find_lex $P174, "@matches"
    unless_null $P174, vivify_85
    new $P174, "ResizablePMCArray"
  vivify_85:
    store_lex "@list", $P174
    .return ($P174)
.end


.namespace ["Testcase"]
.sub "_block151"  :anon :subid("26_1256217009.36755") :outer("25_1256217009.36755")
    .param pmc param_153
    .const 'Sub' $P166 = "27_1256217009.36755" 
    capture_lex $P166
    .lex "$_", param_153
    find_lex $P154, "$_"
    unless_null $P154, vivify_79
    new $P154, "Undef"
  vivify_79:
    set $S155, $P154
    new $P156, 'String'
    set $P156, $S155
    .lex "$method", $P156
    find_lex $P159, "$method"
    unless_null $P159, vivify_80
    new $P159, "Undef"
  vivify_80:
    find_lex $P160, "$length"
    unless_null $P160, vivify_81
    new $P160, "Undef"
  vivify_81:
    $S161 = $P159."substr"(0, $P160)
    find_lex $P162, "$starting_with"
    unless_null $P162, vivify_82
    new $P162, "Undef"
  vivify_82:
    set $S163, $P162
    iseq $I164, $S161, $S163
    if $I164, if_158
    new $P157, 'Integer'
    set $P157, $I164
    goto if_158_end
  if_158:
    .const 'Sub' $P166 = "27_1256217009.36755" 
    capture_lex $P166
    $P170 = $P166()
    set $P157, $P170
  if_158_end:
    .return ($P157)
.end


.namespace ["Testcase"]
.sub "_block165"  :anon :subid("27_1256217009.36755") :outer("26_1256217009.36755")
    find_lex $P167, "@matches"
    unless_null $P167, vivify_83
    new $P167, "ResizablePMCArray"
  vivify_83:
    find_lex $P168, "$method"
    unless_null $P168, vivify_84
    new $P168, "Undef"
  vivify_84:
    $P169 = $P167."push"($P168)
    .return ($P169)
.end


.namespace ["Testcase"]
.sub "fetch_after_methods"  :subid("28_1256217009.36755") :method :outer("11_1256217009.36755")
    new $P185, 'ExceptionHandler'
    set_addr $P185, control_184
    $P185."handle_types"(58)
    push_eh $P185
    .lex "self", self
    find_lex $P186, "self"
    find_lex $P187, "self"
    $P188 = $P187."after_prefix"()
    $P189 = $P186."fetch_methods"($P188 :named("starting_with"))
    .return ($P189)
  control_184:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P190, exception, "payload"
    .return ($P190)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "fetch_afterall_methods"  :subid("29_1256217009.36755") :method :outer("11_1256217009.36755")
    new $P193, 'ExceptionHandler'
    set_addr $P193, control_192
    $P193."handle_types"(58)
    push_eh $P193
    .lex "self", self
    find_lex $P194, "self"
    find_lex $P195, "self"
    $P196 = $P195."afterall_prefix"()
    $P197 = $P194."fetch_methods"($P196 :named("starting_with"))
    .return ($P197)
  control_192:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P198, exception, "payload"
    .return ($P198)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "fetch_before_methods"  :subid("30_1256217009.36755") :method :outer("11_1256217009.36755")
    new $P201, 'ExceptionHandler'
    set_addr $P201, control_200
    $P201."handle_types"(58)
    push_eh $P201
    .lex "self", self
    find_lex $P202, "self"
    find_lex $P203, "self"
    $P204 = $P203."before_prefix"()
    $P205 = $P202."fetch_methods"($P204 :named("starting_with"))
    .return ($P205)
  control_200:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P206, exception, "payload"
    .return ($P206)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "fetch_beforeall_methods"  :subid("31_1256217009.36755") :method :outer("11_1256217009.36755")
    new $P209, 'ExceptionHandler'
    set_addr $P209, control_208
    $P209."handle_types"(58)
    push_eh $P209
    .lex "self", self
    find_lex $P210, "self"
    find_lex $P211, "self"
    $P212 = $P211."beforeall_prefix"()
    $P213 = $P210."fetch_methods"($P212 :named("starting_with"))
    .return ($P213)
  control_208:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P214, exception, "payload"
    .return ($P214)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "fetch_test_methods"  :subid("32_1256217009.36755") :method :outer("11_1256217009.36755")
    new $P217, 'ExceptionHandler'
    set_addr $P217, control_216
    $P217."handle_types"(58)
    push_eh $P217
    .lex "self", self
    find_lex $P218, "self"
    find_lex $P219, "self"
    $P220 = $P219."test_prefix"()
    $P221 = $P218."fetch_methods"($P220 :named("starting_with"))
    .return ($P221)
  control_216:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P222, exception, "payload"
    .return ($P222)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "init"  :subid("33_1256217009.36755") :method :outer("11_1256217009.36755")
    .param pmc param_226
    .param pmc param_227
    new $P225, 'ExceptionHandler'
    set_addr $P225, control_224
    $P225."handle_types"(58)
    push_eh $P225
    .lex "self", self
    .lex "@children", param_226
    .lex "%attributes", param_227
    get_hll_global $P228, ["Class";"BaseBehavior"], "init"
    find_lex $P229, "self"
    find_lex $P230, "@children"
    unless_null $P230, vivify_90
    new $P230, "ResizablePMCArray"
  vivify_90:
    find_lex $P231, "%attributes"
    unless_null $P231, vivify_91
    new $P231, "Hash"
  vivify_91:
    $P228($P229, $P230, $P231)
    find_lex $P232, "self"
    $P233 = $P232."test_counter"(0)
    .return ($P233)
  control_224:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P234, exception, "payload"
    .return ($P234)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "ok"  :subid("34_1256217009.36755") :method :outer("11_1256217009.36755")
    .param pmc param_238
    .param pmc param_239 :optional
    .param int has_param_239 :opt_flag
    .const 'Sub' $P258 = "36_1256217009.36755" 
    capture_lex $P258
    .const 'Sub' $P245 = "35_1256217009.36755" 
    capture_lex $P245
    new $P237, 'ExceptionHandler'
    set_addr $P237, control_236
    $P237."handle_types"(58)
    push_eh $P237
    .lex "self", self
    .lex "$result", param_238
    if has_param_239, optparam_92
    new $P240, "Undef"
    set param_239, $P240
  optparam_92:
    .lex "$note", param_239
    new $P241, "ResizablePMCArray"
    .lex "@output", $P241
    find_lex $P243, "$result"
    unless_null $P243, vivify_93
    new $P243, "Undef"
  vivify_93:
    if $P243, unless_242_end
    .const 'Sub' $P245 = "35_1256217009.36755" 
    capture_lex $P245
    $P245()
  unless_242_end:
    find_lex $P248, "@output"
    unless_null $P248, vivify_95
    new $P248, "ResizablePMCArray"
  vivify_95:
    $P248."push"("ok")
    find_lex $P249, "self"
    $P250 = $P249."test_counter"()
        ##  inline postfix:++
        clone $P251, $P250
        inc $P250
    find_lex $P252, "@output"
    unless_null $P252, vivify_96
    new $P252, "ResizablePMCArray"
  vivify_96:
    find_lex $P253, "self"
    $P254 = $P253."test_counter"()
    $P252."push"($P254)
    find_lex $P256, "$note"
    unless_null $P256, vivify_97
    new $P256, "Undef"
  vivify_97:
    unless $P256, if_255_end
    .const 'Sub' $P258 = "36_1256217009.36755" 
    capture_lex $P258
    $P258()
  if_255_end:
    find_lex $P263, "@output"
    unless_null $P263, vivify_101
    new $P263, "ResizablePMCArray"
  vivify_101:
    $P264 = $P263."join"(" ")
    $P265 = "say"($P264)
    .return ($P265)
  control_236:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P266, exception, "payload"
    .return ($P266)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "_block244"  :anon :subid("35_1256217009.36755") :outer("34_1256217009.36755")
    find_lex $P246, "@output"
    unless_null $P246, vivify_94
    new $P246, "ResizablePMCArray"
  vivify_94:
    $P247 = $P246."push"("not")
    .return ($P247)
.end


.namespace ["Testcase"]
.sub "_block257"  :anon :subid("36_1256217009.36755") :outer("34_1256217009.36755")
    find_lex $P259, "@output"
    unless_null $P259, vivify_98
    new $P259, "ResizablePMCArray"
  vivify_98:
    $P259."push"("-")
    find_lex $P260, "@output"
    unless_null $P260, vivify_99
    new $P260, "ResizablePMCArray"
  vivify_99:
    find_lex $P261, "$note"
    unless_null $P261, vivify_100
    new $P261, "Undef"
  vivify_100:
    $P262 = $P260."push"($P261)
    .return ($P262)
.end


.namespace ["Testcase"]
.sub "run_test"  :subid("37_1256217009.36755") :method :outer("11_1256217009.36755")
    .param pmc param_270
    .param pmc param_271 :optional :named("after_prefix")
    .param int has_param_271 :opt_flag
    .param pmc param_273 :optional :named("before_prefix")
    .param int has_param_273 :opt_flag
    new $P269, 'ExceptionHandler'
    set_addr $P269, control_268
    $P269."handle_types"(58)
    push_eh $P269
    .lex "self", self
    .lex "$method_name", param_270
    if has_param_271, optparam_102
    new $P272, "Undef"
    set param_271, $P272
  optparam_102:
    .lex "$after_prefix", param_271
    if has_param_273, optparam_103
    new $P274, "Undef"
    set param_273, $P274
  optparam_103:
    .lex "$before_prefix", param_273
    find_lex $P275, "self"
    $P275."run_before_methods"()
    get_hll_global $P276, ["Class"], "call_method"
    find_lex $P277, "self"
    find_lex $P278, "$method_name"
    unless_null $P278, vivify_104
    new $P278, "Undef"
  vivify_104:
    $P276($P277, $P278)
    find_lex $P279, "self"
    $P280 = $P279."run_after_methods"()
    .return ($P280)
  control_268:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P281, exception, "payload"
    .return ($P281)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "run_all_tests"  :subid("38_1256217009.36755") :method :outer("11_1256217009.36755")
    new $P284, 'ExceptionHandler'
    set_addr $P284, control_283
    $P284."handle_types"(58)
    push_eh $P284
    .lex "self", self
    find_lex $P285, "self"
    $P286 = $P285."run_tests"()
    .return ($P286)
  control_283:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P287, exception, "payload"
    .return ($P287)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "run_after_methods"  :subid("39_1256217009.36755") :method :outer("11_1256217009.36755")
    new $P290, 'ExceptionHandler'
    set_addr $P290, control_289
    $P290."handle_types"(58)
    push_eh $P290
    .lex "self", self
    find_lex $P291, "self"
    find_lex $P292, "self"
    $P293 = $P292."after_methods"()
    $P294 = $P291."run_methods"($P293)
    .return ($P294)
  control_289:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P295, exception, "payload"
    .return ($P295)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "run_afterall_methods"  :subid("40_1256217009.36755") :method :outer("11_1256217009.36755")
    new $P298, 'ExceptionHandler'
    set_addr $P298, control_297
    $P298."handle_types"(58)
    push_eh $P298
    .lex "self", self
    find_lex $P299, "self"
    find_lex $P300, "self"
    $P301 = $P300."afterall_methods"()
    $P302 = $P299."run_methods"($P301)
    .return ($P302)
  control_297:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P303, exception, "payload"
    .return ($P303)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "run_before_methods"  :subid("41_1256217009.36755") :method :outer("11_1256217009.36755")
    new $P306, 'ExceptionHandler'
    set_addr $P306, control_305
    $P306."handle_types"(58)
    push_eh $P306
    .lex "self", self
    find_lex $P307, "self"
    find_lex $P308, "self"
    $P309 = $P308."before_methods"()
    $P310 = $P307."run_methods"($P309)
    .return ($P310)
  control_305:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P311, exception, "payload"
    .return ($P311)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "run_beforeall_methods"  :subid("42_1256217009.36755") :method :outer("11_1256217009.36755")
    new $P314, 'ExceptionHandler'
    set_addr $P314, control_313
    $P314."handle_types"(58)
    push_eh $P314
    .lex "self", self
    find_lex $P315, "self"
    find_lex $P316, "self"
    $P317 = $P316."beforeall_methods"()
    $P318 = $P315."run_methods"($P317)
    .return ($P318)
  control_313:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P319, exception, "payload"
    .return ($P319)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "run_methods"  :subid("43_1256217009.36755") :method :outer("11_1256217009.36755")
    .param pmc param_323
    .param pmc param_324 :slurpy
    .param pmc param_325 :slurpy :named
    .const 'Sub' $P333 = "44_1256217009.36755" 
    capture_lex $P333
    new $P322, 'ExceptionHandler'
    set_addr $P322, control_321
    $P322."handle_types"(58)
    push_eh $P322
    .lex "self", self
    .lex "@methods", param_323
    .lex "@args", param_324
    .lex "%opts", param_325
    find_lex $P326, "@methods"
    unless_null $P326, vivify_105
    new $P326, "ResizablePMCArray"
  vivify_105:
    set $N327, $P326
    "NOTE"("Running ", $N327, " methods")
    find_lex $P329, "@methods"
    unless_null $P329, vivify_106
    new $P329, "ResizablePMCArray"
  vivify_106:
    defined $I330, $P329
    unless $I330, for_undef_107
    iter $P328, $P329
    new $P344, 'ExceptionHandler'
    set_addr $P344, loop343_handler
    $P344."handle_types"(65, 67, 66)
    push_eh $P344
  loop343_test:
    unless $P328, loop343_done
    shift $P331, $P328
  loop343_redo:
    .const 'Sub' $P333 = "44_1256217009.36755" 
    capture_lex $P333
    $P333($P331)
  loop343_next:
    goto loop343_test
  loop343_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P345, exception, 'type'
    eq $P345, 65, loop343_next
    eq $P345, 67, loop343_redo
  loop343_done:
    pop_eh 
  for_undef_107:
    $P346 = "NOTE"("done")
    .return ($P346)
  control_321:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P347, exception, "payload"
    .return ($P347)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "_block332"  :anon :subid("44_1256217009.36755") :outer("43_1256217009.36755")
    .param pmc param_334
    .lex "$_", param_334
    find_lex $P335, "$_"
    unless_null $P335, vivify_108
    new $P335, "Undef"
  vivify_108:
    "NOTE"("Running method: ", $P335)
    get_hll_global $P336, ["Class"], "call_method_"
    find_lex $P337, "self"
    find_lex $P338, "$_"
    unless_null $P338, vivify_109
    new $P338, "Undef"
  vivify_109:
    set $S339, $P338
    find_lex $P340, "@args"
    unless_null $P340, vivify_110
    new $P340, "ResizablePMCArray"
  vivify_110:
    find_lex $P341, "%opts"
    unless_null $P341, vivify_111
    new $P341, "Hash"
  vivify_111:
    $P342 = $P336($P337, $S339, $P340, $P341)
    .return ($P342)
.end


.namespace ["Testcase"]
.sub "run_tests"  :subid("45_1256217009.36755") :method :outer("11_1256217009.36755")
    .param pmc param_351 :slurpy
    .const 'Sub' $P366 = "47_1256217009.36755" 
    capture_lex $P366
    .const 'Sub' $P356 = "46_1256217009.36755" 
    capture_lex $P356
    new $P350, 'ExceptionHandler'
    set_addr $P350, control_349
    $P350."handle_types"(58)
    push_eh $P350
    .lex "self", self
    .lex "@names", param_351
    "NOTE"("Running 'beforeall' methods")
    find_lex $P352, "self"
    $P352."run_beforeall_methods"()
    find_lex $P354, "@names"
    unless_null $P354, vivify_112
    new $P354, "ResizablePMCArray"
  vivify_112:
    if $P354, unless_353_end
    .const 'Sub' $P356 = "46_1256217009.36755" 
    capture_lex $P356
    $P356()
  unless_353_end:
    find_lex $P359, "@names"
    unless_null $P359, vivify_113
    new $P359, "ResizablePMCArray"
  vivify_113:
    set $N360, $P359
    "NOTE"("Got ", $N360, " tests to run.")
    find_lex $P362, "@names"
    unless_null $P362, vivify_114
    new $P362, "ResizablePMCArray"
  vivify_114:
    defined $I363, $P362
    unless $I363, for_undef_115
    iter $P361, $P362
    new $P382, 'ExceptionHandler'
    set_addr $P382, loop381_handler
    $P382."handle_types"(65, 67, 66)
    push_eh $P382
  loop381_test:
    unless $P361, loop381_done
    shift $P364, $P361
  loop381_redo:
    .const 'Sub' $P366 = "47_1256217009.36755" 
    capture_lex $P366
    $P366($P364)
  loop381_next:
    goto loop381_test
  loop381_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P383, exception, 'type'
    eq $P383, 65, loop381_next
    eq $P383, 67, loop381_redo
  loop381_done:
    pop_eh 
  for_undef_115:
    "NOTE"("Done with tests. Running 'afterall' methods")
    find_lex $P384, "self"
    $P385 = $P384."run_afterall_methods"()
    .return ($P385)
  control_349:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P386, exception, "payload"
    .return ($P386)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "_block355"  :anon :subid("46_1256217009.36755") :outer("45_1256217009.36755")
    "NOTE"("No test list specified. Running all tests.")
    find_lex $P357, "self"
    $P358 = $P357."fetch_test_methods"()
    store_lex "@names", $P358
    .return ($P358)
.end


.namespace ["Testcase"]
.sub "_block365"  :anon :subid("47_1256217009.36755") :outer("45_1256217009.36755")
    .param pmc param_367
    .lex "$_", param_367
    find_lex $P368, "$_"
    unless_null $P368, vivify_116
    new $P368, "Undef"
  vivify_116:
    set $S369, $P368
    new $P370, 'String'
    set $P370, $S369
    .lex "$method", $P370
    find_lex $P371, "$method"
    unless_null $P371, vivify_117
    new $P371, "Undef"
  vivify_117:
    "NOTE"("Creating new testcase for test: ", $P371)
    find_lex $P372, "self"
    $P373 = $P372."new"()
    .lex "$testcase", $P373
    "NOTE"("Running 'before' methods")
    find_lex $P374, "$testcase"
    unless_null $P374, vivify_118
    new $P374, "Undef"
  vivify_118:
    $P374."run_before_methods"()
    find_lex $P375, "$method"
    unless_null $P375, vivify_119
    new $P375, "Undef"
  vivify_119:
    "NOTE"("Running test: ", $P375)
    get_hll_global $P376, ["Class"], "call_method"
    find_lex $P377, "$testcase"
    unless_null $P377, vivify_120
    new $P377, "Undef"
  vivify_120:
    find_lex $P378, "$method"
    unless_null $P378, vivify_121
    new $P378, "Undef"
  vivify_121:
    $P376($P377, $P378)
    "NOTE"("Running 'after' methods")
    find_lex $P379, "$testcase"
    unless_null $P379, vivify_122
    new $P379, "Undef"
  vivify_122:
    $P380 = $P379."run_after_methods"()
    .return ($P380)
.end


.namespace ["Testcase"]
.sub "test_counter"  :subid("48_1256217009.36755") :method :outer("11_1256217009.36755")
    .param pmc param_390 :slurpy
    new $P389, 'ExceptionHandler'
    set_addr $P389, control_388
    $P389."handle_types"(58)
    push_eh $P389
    .lex "self", self
    .lex "@value", param_390
    find_lex $P391, "self"
    find_lex $P392, "@value"
    unless_null $P392, vivify_123
    new $P392, "ResizablePMCArray"
  vivify_123:
    $P393 = $P391."_ATTR_CONST"("test_counter", $P392)
    .return ($P393)
  control_388:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P394, exception, "payload"
    .return ($P394)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "test_methods"  :subid("49_1256217009.36755") :method :outer("11_1256217009.36755")
    new $P397, 'ExceptionHandler'
    set_addr $P397, control_396
    $P397."handle_types"(58)
    push_eh $P397
    .lex "self", self
    find_lex $P398, "self"
    $P399 = $P398."_ATTR_SETBY"("test_methods", "fetch_test_methods")
    .return ($P399)
  control_396:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P400, exception, "payload"
    .return ($P400)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "test_prefix"  :subid("50_1256217009.36755") :method :outer("11_1256217009.36755")
    .param pmc param_404 :slurpy
    new $P403, 'ExceptionHandler'
    set_addr $P403, control_402
    $P403."handle_types"(58)
    push_eh $P403
    .lex "self", self
    .lex "@value", param_404
    find_lex $P405, "self"
    find_lex $P406, "@value"
    unless_null $P406, vivify_124
    new $P406, "ResizablePMCArray"
  vivify_124:
    $P407 = $P405."_ATTR_DEFAULT"("test_prefix", $P406, "test_")
    .return ($P407)
  control_402:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P408, exception, "payload"
    .return ($P408)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256206883.24212")
    get_hll_global $P14, ["Matcher";"Defined"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"Defined"]
.sub "_block13" :init :load :subid("11_1256206883.24212")
    .const 'Sub' $P40 = "15_1256206883.24212" 
    capture_lex $P40
    .const 'Sub' $P32 = "14_1256206883.24212" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1256206883.24212" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P40 = "15_1256206883.24212" 
    capture_lex $P40
    .return ($P40)
.end


.namespace ["Matcher";"Defined"]
.sub "_ONLOAD"  :subid("12_1256206883.24212") :outer("11_1256206883.24212")
    .const 'Sub' $P21 = "13_1256206883.24212" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_17
    new $P19, "Undef"
  vivify_17:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256206883.24212" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    new $P26, "String"
    assign $P26, "Matcher::Defined"
    .lex "$class_name", $P26
    find_lex $P27, "$class_name"
    unless_null $P27, vivify_18
    new $P27, "Undef"
  vivify_18:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_19
    new $P29, "Undef"
  vivify_19:
    $P28($P29, "Matcher")
    $P30 = "NOTE"("done")
    .return ($P30)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P31, exception, "payload"
    .return ($P31)
    rethrow exception
.end


.namespace ["Matcher";"Defined"]
.sub "_block20"  :anon :subid("13_1256206883.24212") :outer("12_1256206883.24212")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"Defined"]
.sub "describe_self"  :subid("14_1256206883.24212") :method :outer("11_1256206883.24212")
    .param pmc param_35
    new $P34, 'ExceptionHandler'
    set_addr $P34, control_33
    $P34."handle_types"(58)
    push_eh $P34
    .lex "self", self
    .lex "$description", param_35
    new $P36, "Exception"
    set $P36['type'], 58
    find_lex $P37, "$description"
    unless_null $P37, vivify_20
    new $P37, "Undef"
  vivify_20:
    concat $P38, $P37, "a defined object"
    setattribute $P36, 'payload', $P38
    throw $P36
    .return ()
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P39, exception, "payload"
    .return ($P39)
    rethrow exception
.end


.namespace ["Matcher";"Defined"]
.sub "matches"  :subid("15_1256206883.24212") :method :outer("11_1256206883.24212")
    .param pmc param_43 :slurpy
    .const 'Sub' $P48 = "16_1256206883.24212" 
    capture_lex $P48
    new $P42, 'ExceptionHandler'
    set_addr $P42, control_41
    $P42."handle_types"(58)
    push_eh $P42
    .lex "self", self
    .lex "@value", param_43
    find_lex $P45, "@value"
    unless_null $P45, vivify_21
    new $P45, "ResizablePMCArray"
  vivify_21:
    set $N46, $P45
    if $N46, unless_44_end
    .const 'Sub' $P48 = "16_1256206883.24212" 
    capture_lex $P48
    $P48()
  unless_44_end:
    get_hll_global $P51, ["Parrot"], "defined"
    find_lex $P52, "@value"
    unless_null $P52, vivify_22
    new $P52, "ResizablePMCArray"
  vivify_22:
    set $P53, $P52[0]
    unless_null $P53, vivify_23
    new $P53, "Undef"
  vivify_23:
    $P54 = $P51($P53)
    .lex "$result", $P54
    new $P55, "Exception"
    set $P55['type'], 58
    find_lex $P56, "$result"
    unless_null $P56, vivify_24
    new $P56, "Undef"
  vivify_24:
    setattribute $P55, 'payload', $P56
    throw $P55
    .return ()
  control_41:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P57, exception, "payload"
    .return ($P57)
    rethrow exception
.end


.namespace ["Matcher";"Defined"]
.sub "_block47"  :anon :subid("16_1256206883.24212") :outer("15_1256206883.24212")
    get_hll_global $P49, ["Parrot"], "die"
    $P50 = $P49("A value must be passed to matches($item)")
    .return ($P50)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256215454.9941")
    get_hll_global $P14, ["Matcher";"DescribedAs"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"DescribedAs"]
.sub "_block13" :init :load :subid("11_1256215454.9941")
    .const 'Sub' $P121 = "23_1256215454.9941" 
    capture_lex $P121
    .const 'Sub' $P110 = "22_1256215454.9941" 
    capture_lex $P110
    .const 'Sub' $P66 = "17_1256215454.9941" 
    capture_lex $P66
    .const 'Sub' $P58 = "16_1256215454.9941" 
    capture_lex $P58
    .const 'Sub' $P44 = "15_1256215454.9941" 
    capture_lex $P44
    .const 'Sub' $P32 = "14_1256215454.9941" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1256215454.9941" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P121 = "23_1256215454.9941" 
    capture_lex $P121
    .return ($P121)
.end


.namespace ["Matcher";"DescribedAs"]
.sub "_ONLOAD"  :subid("12_1256215454.9941") :outer("11_1256215454.9941")
    .const 'Sub' $P21 = "13_1256215454.9941" 
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
    .const 'Sub' $P21 = "13_1256215454.9941" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    new $P26, "String"
    assign $P26, "Matcher::DescribedAs"
    .lex "$class_name", $P26
    find_lex $P27, "$class_name"
    unless_null $P27, vivify_25
    new $P27, "Undef"
  vivify_25:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_26
    new $P29, "Undef"
  vivify_26:
    $P28($P29, "Matcher")
    $P30 = "NOTE"("done")
    .return ($P30)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P31, exception, "payload"
    .return ($P31)
    rethrow exception
.end


.namespace ["Matcher";"DescribedAs"]
.sub "_block20"  :anon :subid("13_1256215454.9941") :outer("12_1256215454.9941")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"DescribedAs"]
.sub "describe_failure"  :subid("14_1256215454.9941") :method :outer("11_1256215454.9941")
    .param pmc param_35
    .param pmc param_36
    new $P34, 'ExceptionHandler'
    set_addr $P34, control_33
    $P34."handle_types"(58)
    push_eh $P34
    .lex "self", self
    .lex "$item", param_35
    .lex "$description", param_36
    new $P37, "Exception"
    set $P37['type'], 58
    find_lex $P38, "self"
    $P39 = $P38."predicate"()
    find_lex $P40, "$item"
    unless_null $P40, vivify_27
    new $P40, "Undef"
  vivify_27:
    find_lex $P41, "$description"
    unless_null $P41, vivify_28
    new $P41, "Undef"
  vivify_28:
    $P42 = $P39."describe_failure"($P40, $P41)
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


.namespace ["Matcher";"DescribedAs"]
.sub "describe_self"  :subid("15_1256215454.9941") :method :outer("11_1256215454.9941")
    .param pmc param_47
    new $P46, 'ExceptionHandler'
    set_addr $P46, control_45
    $P46."handle_types"(58)
    push_eh $P46
    .lex "self", self
    .lex "$description", param_47
    new $P48, "Exception"
    set $P48['type'], 58
    find_lex $P49, "self"
    $P50 = $P49."predicate"()
    find_lex $P51, "$description"
    unless_null $P51, vivify_29
    new $P51, "Undef"
  vivify_29:
    find_lex $P52, "self"
    $S53 = $P52."described_as"()
    concat $P54, $P51, $S53
    concat $P55, $P54, " "
    $P56 = $P50."describe_self"($P55)
    setattribute $P48, 'payload', $P56
    throw $P48
    .return ()
  control_45:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P57, exception, "payload"
    .return ($P57)
    rethrow exception
.end


.namespace ["Matcher";"DescribedAs"]
.sub "described_as"  :subid("16_1256215454.9941") :method :outer("11_1256215454.9941")
    .param pmc param_61 :slurpy
    new $P60, 'ExceptionHandler'
    set_addr $P60, control_59
    $P60."handle_types"(58)
    push_eh $P60
    .lex "self", self
    .lex "@value", param_61
    find_lex $P62, "self"
    find_lex $P63, "@value"
    unless_null $P63, vivify_30
    new $P63, "ResizablePMCArray"
  vivify_30:
    $P64 = $P62."_ATTR"("described_as", $P63)
    .return ($P64)
  control_59:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P65, exception, "payload"
    .return ($P65)
    rethrow exception
.end


.namespace ["Matcher";"DescribedAs"]
.sub "init"  :subid("17_1256215454.9941") :method :outer("11_1256215454.9941")
    .param pmc param_69
    .param pmc param_70
    .const 'Sub' $P96 = "20_1256215454.9941" 
    capture_lex $P96
    .const 'Sub' $P79 = "18_1256215454.9941" 
    capture_lex $P79
    new $P68, 'ExceptionHandler'
    set_addr $P68, control_67
    $P68."handle_types"(58)
    push_eh $P68
    .lex "self", self
    .lex "@args", param_69
    .lex "%opts", param_70
    get_hll_global $P71, ["Matcher"], "init"
    find_lex $P72, "self"
    find_lex $P73, "@args"
    unless_null $P73, vivify_31
    new $P73, "ResizablePMCArray"
  vivify_31:
    find_lex $P74, "%opts"
    unless_null $P74, vivify_32
    new $P74, "Hash"
  vivify_32:
    $P71($P72, $P73, $P74)
    find_lex $P76, "self"
    $P77 = $P76."described_as"()
    if $P77, unless_75_end
    .const 'Sub' $P79 = "18_1256215454.9941" 
    capture_lex $P79
    $P79()
  unless_75_end:
    find_lex $P93, "self"
    $P94 = $P93."predicate"()
    unless $P94, unless_92
    set $P91, $P94
    goto unless_92_end
  unless_92:
    .const 'Sub' $P96 = "20_1256215454.9941" 
    capture_lex $P96
    $P108 = $P96()
    set $P91, $P108
  unless_92_end:
    .return ($P91)
  control_67:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
    rethrow exception
.end


.namespace ["Matcher";"DescribedAs"]
.sub "_block78"  :anon :subid("18_1256215454.9941") :outer("17_1256215454.9941")
    .const 'Sub' $P84 = "19_1256215454.9941" 
    capture_lex $P84
    find_lex $P81, "@args"
    unless_null $P81, vivify_33
    new $P81, "ResizablePMCArray"
  vivify_33:
    set $N82, $P81
    if $N82, unless_80_end
    .const 'Sub' $P84 = "19_1256215454.9941" 
    capture_lex $P84
    $P84()
  unless_80_end:
    find_lex $P87, "self"
    find_lex $P88, "@args"
    unless_null $P88, vivify_34
    new $P88, "ResizablePMCArray"
  vivify_34:
    $P89 = $P88."shift"()
    $P90 = $P87."described_as"($P89)
    .return ($P90)
.end


.namespace ["Matcher";"DescribedAs"]
.sub "_block83"  :anon :subid("19_1256215454.9941") :outer("18_1256215454.9941")
    get_hll_global $P85, ["Parrot"], "die"
    $P86 = $P85("You must provide a description")
    .return ($P86)
.end


.namespace ["Matcher";"DescribedAs"]
.sub "_block95"  :anon :subid("20_1256215454.9941") :outer("17_1256215454.9941")
    .const 'Sub' $P101 = "21_1256215454.9941" 
    capture_lex $P101
    find_lex $P98, "@args"
    unless_null $P98, vivify_35
    new $P98, "ResizablePMCArray"
  vivify_35:
    set $N99, $P98
    if $N99, unless_97_end
    .const 'Sub' $P101 = "21_1256215454.9941" 
    capture_lex $P101
    $P101()
  unless_97_end:
    find_lex $P104, "self"
    find_lex $P105, "@args"
    unless_null $P105, vivify_36
    new $P105, "ResizablePMCArray"
  vivify_36:
    $P106 = $P105."shift"()
    $P107 = $P104."predicate"($P106)
    .return ($P107)
.end


.namespace ["Matcher";"DescribedAs"]
.sub "_block100"  :anon :subid("21_1256215454.9941") :outer("20_1256215454.9941")
    get_hll_global $P102, ["Parrot"], "die"
    $P103 = $P102("You must provide a Matcher predicate")
    .return ($P103)
.end


.namespace ["Matcher";"DescribedAs"]
.sub "matches"  :subid("22_1256215454.9941") :method :outer("11_1256215454.9941")
    .param pmc param_113
    new $P112, 'ExceptionHandler'
    set_addr $P112, control_111
    $P112."handle_types"(58)
    push_eh $P112
    .lex "self", self
    .lex "$item", param_113
    find_lex $P114, "self"
    $P115 = $P114."predicate"()
    find_lex $P116, "$item"
    unless_null $P116, vivify_37
    new $P116, "Undef"
  vivify_37:
    $P117 = $P115."matches"($P116)
    .lex "$result", $P117
    new $P118, "Exception"
    set $P118['type'], 58
    find_lex $P119, "$result"
    unless_null $P119, vivify_38
    new $P119, "Undef"
  vivify_38:
    setattribute $P118, 'payload', $P119
    throw $P118
    .return ()
  control_111:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P120, exception, "payload"
    .return ($P120)
    rethrow exception
.end


.namespace ["Matcher";"DescribedAs"]
.sub "predicate"  :subid("23_1256215454.9941") :method :outer("11_1256215454.9941")
    .param pmc param_124 :slurpy
    new $P123, 'ExceptionHandler'
    set_addr $P123, control_122
    $P123."handle_types"(58)
    push_eh $P123
    .lex "self", self
    .lex "@value", param_124
    find_lex $P125, "self"
    find_lex $P126, "@value"
    unless_null $P126, vivify_39
    new $P126, "ResizablePMCArray"
  vivify_39:
    $P127 = $P125."_ATTR"("predicate", $P126)
    .return ($P127)
  control_122:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P128, exception, "payload"
    .return ($P128)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256206975.47352")
    get_hll_global $P14, ["Matcher";"Equals"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"Equals"]
.sub "_block13" :init :load :subid("11_1256206975.47352")
    .const 'Sub' $P175 = "29_1256206975.47352" 
    capture_lex $P175
    .const 'Sub' $P135 = "25_1256206975.47352" 
    capture_lex $P135
    .const 'Sub' $P127 = "24_1256206975.47352" 
    capture_lex $P127
    .const 'Sub' $P119 = "23_1256206975.47352" 
    capture_lex $P119
    .const 'Sub' $P111 = "22_1256206975.47352" 
    capture_lex $P111
    .const 'Sub' $P103 = "21_1256206975.47352" 
    capture_lex $P103
    .const 'Sub' $P87 = "19_1256206975.47352" 
    capture_lex $P87
    .const 'Sub' $P49 = "15_1256206975.47352" 
    capture_lex $P49
    .const 'Sub' $P34 = "14_1256206975.47352" 
    capture_lex $P34
    .const 'Sub' $P15 = "12_1256206975.47352" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P175 = "29_1256206975.47352" 
    capture_lex $P175
    .return ($P175)
.end


.namespace ["Matcher";"Equals"]
.sub "_ONLOAD"  :subid("12_1256206975.47352") :outer("11_1256206975.47352")
    .const 'Sub' $P21 = "13_1256206975.47352" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_30
    new $P19, "Undef"
  vivify_30:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256206975.47352" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    new $P26, "String"
    assign $P26, "Matcher::Equals"
    .lex "$class_name", $P26
    find_lex $P27, "$class_name"
    unless_null $P27, vivify_31
    new $P27, "Undef"
  vivify_31:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_32
    new $P29, "Undef"
  vivify_32:
    $P28($P29, "Matcher::TypeSafe")
    get_hll_global $P30, ["Class"], "multi_method"
    find_lex $P31, "$class_name"
    unless_null $P31, vivify_33
    new $P31, "Undef"
  vivify_33:
    $P30($P31, "matches_typesafe", "_match_" :named("starting_with"))
    $P32 = "NOTE"("done")
    .return ($P32)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P33, exception, "payload"
    .return ($P33)
    rethrow exception
.end


.namespace ["Matcher";"Equals"]
.sub "_block20"  :anon :subid("13_1256206975.47352") :outer("12_1256206975.47352")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"Equals"]
.sub "describe_self"  :subid("14_1256206975.47352") :method :outer("11_1256206975.47352")
    .param pmc param_37
    new $P36, 'ExceptionHandler'
    set_addr $P36, control_35
    $P36."handle_types"(58)
    push_eh $P36
    .lex "self", self
    .lex "$description", param_37
    new $P38, "Exception"
    set $P38['type'], 58
    find_lex $P39, "$description"
    unless_null $P39, vivify_34
    new $P39, "Undef"
  vivify_34:
    concat $P40, $P39, "a "
    find_lex $P41, "self"
    $S42 = $P41."match_type"()
    concat $P43, $P40, $S42
    concat $P44, $P43, " equal to "
    find_lex $P45, "self"
    $S46 = $P45."value"()
    concat $P47, $P44, $S46
    setattribute $P38, 'payload', $P47
    throw $P38
    .return ()
  control_35:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P48, exception, "payload"
    .return ($P48)
    rethrow exception
.end


.namespace ["Matcher";"Equals"]
.sub "find_match_type"  :subid("15_1256206975.47352") :method :outer("11_1256206975.47352")
    .param pmc param_52
    .const 'Sub' $P82 = "18_1256206975.47352" 
    capture_lex $P82
    .const 'Sub' $P58 = "16_1256206975.47352" 
    capture_lex $P58
    new $P51, 'ExceptionHandler'
    set_addr $P51, control_50
    $P51."handle_types"(58)
    push_eh $P51
    .lex "self", self
    .lex "$item", param_52
    new $P54, "ResizablePMCArray"
    push $P54, "Float"
    push $P54, "Integer"
    defined $I55, $P54
    unless $I55, for_undef_35
    iter $P53, $P54
    new $P75, 'ExceptionHandler'
    set_addr $P75, loop74_handler
    $P75."handle_types"(65, 67, 66)
    push_eh $P75
  loop74_test:
    unless $P53, loop74_done
    shift $P56, $P53
  loop74_redo:
    .const 'Sub' $P58 = "16_1256206975.47352" 
    capture_lex $P58
    $P58($P56)
  loop74_next:
    goto loop74_test
  loop74_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P76, exception, 'type'
    eq $P76, 65, loop74_next
    eq $P76, 67, loop74_redo
  loop74_done:
    pop_eh 
  for_undef_35:
    find_lex $P79, "self"
    $P80 = $P79."match_type"()
    unless $P80, unless_78
    set $P77, $P80
    goto unless_78_end
  unless_78:
    .const 'Sub' $P82 = "18_1256206975.47352" 
    capture_lex $P82
    $P85 = $P82()
    set $P77, $P85
  unless_78_end:
    .return ($P77)
  control_50:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P86, exception, "payload"
    .return ($P86)
    rethrow exception
.end


.namespace ["Matcher";"Equals"]
.sub "_block57"  :anon :subid("16_1256206975.47352") :outer("15_1256206975.47352")
    .param pmc param_59
    .const 'Sub' $P68 = "17_1256206975.47352" 
    capture_lex $P68
    .lex "$_", param_59
    get_hll_global $P62, ["Parrot"], "isa"
    find_lex $P63, "$item"
    unless_null $P63, vivify_36
    new $P63, "Undef"
  vivify_36:
    find_lex $P64, "$_"
    unless_null $P64, vivify_37
    new $P64, "Undef"
  vivify_37:
    set $S65, $P64
    $P66 = $P62($P63, $S65)
    if $P66, if_61
    set $P60, $P66
    goto if_61_end
  if_61:
    .const 'Sub' $P68 = "17_1256206975.47352" 
    capture_lex $P68
    $P73 = $P68()
    set $P60, $P73
  if_61_end:
    .return ($P60)
.end


.namespace ["Matcher";"Equals"]
.sub "_block67"  :anon :subid("17_1256206975.47352") :outer("16_1256206975.47352")
    find_lex $P69, "self"
    find_lex $P70, "$_"
    unless_null $P70, vivify_38
    new $P70, "Undef"
  vivify_38:
    set $S71, $P70
    $P72 = $P69."match_type"($S71)
    .return ($P72)
.end


.namespace ["Matcher";"Equals"]
.sub "_block81"  :anon :subid("18_1256206975.47352") :outer("15_1256206975.47352")
    find_lex $P83, "self"
    $P84 = $P83."match_type"("String")
    .return ($P84)
.end


.namespace ["Matcher";"Equals"]
.sub "init"  :subid("19_1256206975.47352") :method :outer("11_1256206975.47352")
    .param pmc param_90
    .param pmc param_91
    .const 'Sub' $P96 = "20_1256206975.47352" 
    capture_lex $P96
    new $P89, 'ExceptionHandler'
    set_addr $P89, control_88
    $P89."handle_types"(58)
    push_eh $P89
    .lex "self", self
    .lex "@children", param_90
    .lex "%attributes", param_91
    find_lex $P93, "@children"
    unless_null $P93, vivify_39
    new $P93, "ResizablePMCArray"
  vivify_39:
    set $N94, $P93
    if $N94, unless_92_end
    .const 'Sub' $P96 = "20_1256206975.47352" 
    capture_lex $P96
    $P96()
  unless_92_end:
    find_lex $P98, "self"
    find_lex $P99, "@children"
    unless_null $P99, vivify_40
    new $P99, "ResizablePMCArray"
  vivify_40:
    $P100 = $P99."shift"()
    $P101 = $P98."value"($P100)
    .return ($P101)
  control_88:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
    rethrow exception
.end


.namespace ["Matcher";"Equals"]
.sub "_block95"  :anon :subid("20_1256206975.47352") :outer("19_1256206975.47352")
    $P97 = "DIE"("You must provide a comparison value for 'equals' matcher.")
    .return ($P97)
.end


.namespace ["Matcher";"Equals"]
.sub "_match_Float"  :subid("21_1256206975.47352") :method :outer("11_1256206975.47352")
    .param pmc param_106
    new $P105, 'ExceptionHandler'
    set_addr $P105, control_104
    $P105."handle_types"(58)
    push_eh $P105
    .lex "self", self
    .lex "$item", param_106
    find_lex $P107, "self"
    find_lex $P108, "$item"
    unless_null $P108, vivify_41
    new $P108, "Undef"
  vivify_41:
    $P109 = $P107."match_scalar"($P108)
    .return ($P109)
  control_104:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
    rethrow exception
.end


.namespace ["Matcher";"Equals"]
.sub "_match_Integer"  :subid("22_1256206975.47352") :method :outer("11_1256206975.47352")
    .param pmc param_114
    new $P113, 'ExceptionHandler'
    set_addr $P113, control_112
    $P113."handle_types"(58)
    push_eh $P113
    .lex "self", self
    .lex "$item", param_114
    find_lex $P115, "self"
    find_lex $P116, "$item"
    unless_null $P116, vivify_42
    new $P116, "Undef"
  vivify_42:
    $P117 = $P115."match_scalar"($P116)
    .return ($P117)
  control_112:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, "payload"
    .return ($P118)
    rethrow exception
.end


.namespace ["Matcher";"Equals"]
.sub "_match_String"  :subid("23_1256206975.47352") :method :outer("11_1256206975.47352")
    .param pmc param_122
    new $P121, 'ExceptionHandler'
    set_addr $P121, control_120
    $P121."handle_types"(58)
    push_eh $P121
    .lex "self", self
    .lex "$item", param_122
    find_lex $P123, "self"
    find_lex $P124, "$item"
    unless_null $P124, vivify_43
    new $P124, "Undef"
  vivify_43:
    $P125 = $P123."match_scalar"($P124)
    .return ($P125)
  control_120:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P126, exception, "payload"
    .return ($P126)
    rethrow exception
.end


.namespace ["Matcher";"Equals"]
.sub "match_type"  :subid("24_1256206975.47352") :method :outer("11_1256206975.47352")
    .param pmc param_130 :slurpy
    new $P129, 'ExceptionHandler'
    set_addr $P129, control_128
    $P129."handle_types"(58)
    push_eh $P129
    .lex "self", self
    .lex "@value", param_130
    find_lex $P131, "self"
    find_lex $P132, "@value"
    unless_null $P132, vivify_44
    new $P132, "ResizablePMCArray"
  vivify_44:
    $P133 = $P131."_ATTR"("match_type", $P132)
    .return ($P133)
  control_128:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P134, exception, "payload"
    .return ($P134)
    rethrow exception
.end


.namespace ["Matcher";"Equals"]
.sub "match_scalar"  :subid("25_1256206975.47352") :method :outer("11_1256206975.47352")
    .param pmc param_138
    .const 'Sub' $P165 = "28_1256206975.47352" 
    capture_lex $P165
    .const 'Sub' $P155 = "27_1256206975.47352" 
    capture_lex $P155
    .const 'Sub' $P145 = "26_1256206975.47352" 
    capture_lex $P145
    new $P137, 'ExceptionHandler'
    set_addr $P137, control_136
    $P137."handle_types"(58)
    push_eh $P137
    .lex "self", self
    .lex "$item", param_138
    find_lex $P139, "self"
    $P140 = $P139."value"()
    .lex "$value", $P140
    find_lex $P142, "self"
    $P143 = $P142."match_type"()
    if $P143, unless_141_end
    .const 'Sub' $P145 = "26_1256206975.47352" 
    capture_lex $P145
    $P145()
  unless_141_end:
    find_lex $P151, "self"
    $S152 = $P151."match_type"()
    iseq $I153, $S152, "String"
    if $I153, if_150
    .const 'Sub' $P165 = "28_1256206975.47352" 
    capture_lex $P165
    $P173 = $P165()
    set $P149, $P173
    goto if_150_end
  if_150:
    .const 'Sub' $P155 = "27_1256206975.47352" 
    capture_lex $P155
    $P163 = $P155()
    set $P149, $P163
  if_150_end:
    .return ($P149)
  control_136:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P174, exception, "payload"
    .return ($P174)
    rethrow exception
.end


.namespace ["Matcher";"Equals"]
.sub "_block144"  :anon :subid("26_1256206975.47352") :outer("25_1256206975.47352")
    find_lex $P146, "self"
    find_lex $P147, "$item"
    unless_null $P147, vivify_45
    new $P147, "Undef"
  vivify_45:
    $P148 = $P146."find_match_type"($P147)
    .return ($P148)
.end


.namespace ["Matcher";"Equals"]
.sub "_block164"  :anon :subid("28_1256206975.47352") :outer("25_1256206975.47352")
    new $P166, "Exception"
    set $P166['type'], 58
    find_lex $P167, "$item"
    unless_null $P167, vivify_46
    new $P167, "Undef"
  vivify_46:
    set $N168, $P167
    find_lex $P169, "$value"
    unless_null $P169, vivify_47
    new $P169, "Undef"
  vivify_47:
    set $N170, $P169
    iseq $I171, $N168, $N170
    new $P172, 'Integer'
    set $P172, $I171
    setattribute $P166, 'payload', $P172
    throw $P166
    .return ()
.end


.namespace ["Matcher";"Equals"]
.sub "_block154"  :anon :subid("27_1256206975.47352") :outer("25_1256206975.47352")
    new $P156, "Exception"
    set $P156['type'], 58
    find_lex $P157, "$item"
    unless_null $P157, vivify_48
    new $P157, "Undef"
  vivify_48:
    set $S158, $P157
    find_lex $P159, "$value"
    unless_null $P159, vivify_49
    new $P159, "Undef"
  vivify_49:
    set $S160, $P159
    iseq $I161, $S158, $S160
    new $P162, 'Integer'
    set $P162, $I161
    setattribute $P156, 'payload', $P162
    throw $P156
    .return ()
.end


.namespace ["Matcher";"Equals"]
.sub "value"  :subid("29_1256206975.47352") :method :outer("11_1256206975.47352")
    .param pmc param_178 :slurpy
    new $P177, 'ExceptionHandler'
    set_addr $P177, control_176
    $P177."handle_types"(58)
    push_eh $P177
    .lex "self", self
    .lex "@value", param_178
    find_lex $P179, "self"
    find_lex $P180, "@value"
    unless_null $P180, vivify_50
    new $P180, "ResizablePMCArray"
  vivify_50:
    $P181 = $P179."_ATTR"("value", $P180)
    .return ($P181)
  control_176:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P182, exception, "payload"
    .return ($P182)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256206976.91354")
    get_hll_global $P14, ["Matcher";"EqualsFloat"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_block13" :init :load :subid("11_1256206976.91354")
    .const 'Sub' $P161 = "28_1256206976.91354" 
    capture_lex $P161
    .const 'Sub' $P153 = "27_1256206976.91354" 
    capture_lex $P153
    .const 'Sub' $P135 = "25_1256206976.91354" 
    capture_lex $P135
    .const 'Sub' $P127 = "24_1256206976.91354" 
    capture_lex $P127
    .const 'Sub' $P119 = "23_1256206976.91354" 
    capture_lex $P119
    .const 'Sub' $P111 = "22_1256206976.91354" 
    capture_lex $P111
    .const 'Sub' $P61 = "16_1256206976.91354" 
    capture_lex $P61
    .const 'Sub' $P49 = "15_1256206976.91354" 
    capture_lex $P49
    .const 'Sub' $P34 = "14_1256206976.91354" 
    capture_lex $P34
    .const 'Sub' $P15 = "12_1256206976.91354" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P161 = "28_1256206976.91354" 
    capture_lex $P161
    .return ($P161)
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_ONLOAD"  :subid("12_1256206976.91354") :outer("11_1256206976.91354")
    .const 'Sub' $P21 = "13_1256206976.91354" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_29
    new $P19, "Undef"
  vivify_29:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256206976.91354" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    new $P26, "String"
    assign $P26, "Matcher::EqualsFloat"
    .lex "$class_name", $P26
    find_lex $P27, "$class_name"
    unless_null $P27, vivify_30
    new $P27, "Undef"
  vivify_30:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_31
    new $P29, "Undef"
  vivify_31:
    $P28($P29, "Matcher::TypeSafe")
    get_hll_global $P30, ["Class"], "multi_method"
    find_lex $P31, "$class_name"
    unless_null $P31, vivify_32
    new $P31, "Undef"
  vivify_32:
    $P30($P31, "matches_typesafe", "_match_" :named("starting_with"))
    $P32 = "NOTE"("done")
    .return ($P32)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P33, exception, "payload"
    .return ($P33)
    rethrow exception
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_block20"  :anon :subid("13_1256206976.91354") :outer("12_1256206976.91354")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "describe_failure"  :subid("14_1256206976.91354") :method :outer("11_1256206976.91354")
    .param pmc param_37
    .param pmc param_38
    new $P36, 'ExceptionHandler'
    set_addr $P36, control_35
    $P36."handle_types"(58)
    push_eh $P36
    .lex "self", self
    .lex "$item", param_37
    .lex "$description", param_38
    new $P39, "Exception"
    set $P39['type'], 58
    find_lex $P40, "$description"
    unless_null $P40, vivify_33
    new $P40, "Undef"
  vivify_33:
    find_lex $P41, "$item"
    unless_null $P41, vivify_34
    new $P41, "Undef"
  vivify_34:
    concat $P42, $P40, $P41
    concat $P43, $P42, " differed by "
    find_lex $P44, "self"
    find_lex $P45, "$item"
    unless_null $P45, vivify_35
    new $P45, "Undef"
  vivify_35:
    $S46 = $P44."difference"($P45)
    concat $P47, $P43, $S46
    setattribute $P39, 'payload', $P47
    throw $P39
    .return ()
  control_35:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P48, exception, "payload"
    .return ($P48)
    rethrow exception
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "difference"  :subid("15_1256206976.91354") :method :outer("11_1256206976.91354")
    .param pmc param_52
    new $P51, 'ExceptionHandler'
    set_addr $P51, control_50
    $P51."handle_types"(58)
    push_eh $P51
    .lex "self", self
    .lex "$item", param_52
    find_lex $P53, "$item"
    unless_null $P53, vivify_36
    new $P53, "Undef"
  vivify_36:
    find_lex $P54, "self"
    $N55 = $P54."wanted"()
    sub $P56, $P53, $N55
    .lex "$difference", $P56

			$P0 = find_lex '$difference'
			$P57 = abs $P0
		
    .lex "$abs", $P57
    new $P58, "Exception"
    set $P58['type'], 58
    find_lex $P59, "$abs"
    unless_null $P59, vivify_37
    new $P59, "Undef"
  vivify_37:
    setattribute $P58, 'payload', $P59
    throw $P58
    .return ()
  control_50:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P60, exception, "payload"
    .return ($P60)
    rethrow exception
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "init"  :subid("16_1256206976.91354") :method :outer("11_1256206976.91354")
    .param pmc param_64
    .param pmc param_65
    .const 'Sub' $P87 = "19_1256206976.91354" 
    capture_lex $P87
    .const 'Sub' $P80 = "18_1256206976.91354" 
    capture_lex $P80
    .const 'Sub' $P70 = "17_1256206976.91354" 
    capture_lex $P70
    new $P63, 'ExceptionHandler'
    set_addr $P63, control_62
    $P63."handle_types"(58)
    push_eh $P63
    .lex "self", self
    .lex "@children", param_64
    .lex "%attributes", param_65
    find_lex $P67, "@children"
    unless_null $P67, vivify_38
    new $P67, "ResizablePMCArray"
  vivify_38:
    set $N68, $P67
    if $N68, unless_66_end
    .const 'Sub' $P70 = "17_1256206976.91354" 
    capture_lex $P70
    $P70()
  unless_66_end:
    find_lex $P72, "self"
    find_lex $P73, "@children"
    unless_null $P73, vivify_39
    new $P73, "ResizablePMCArray"
  vivify_39:
    $P74 = $P73."shift"()
    $P72."value"($P74)
    find_lex $P77, "@children"
    unless_null $P77, vivify_40
    new $P77, "ResizablePMCArray"
  vivify_40:
    set $N78, $P77
    if $N78, if_76
    .const 'Sub' $P87 = "19_1256206976.91354" 
    capture_lex $P87
    $P109 = $P87()
    set $P75, $P109
    goto if_76_end
  if_76:
    .const 'Sub' $P80 = "18_1256206976.91354" 
    capture_lex $P80
    $P85 = $P80()
    set $P75, $P85
  if_76_end:
    .return ($P75)
  control_62:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
    rethrow exception
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_block69"  :anon :subid("17_1256206976.91354") :outer("16_1256206976.91354")
    $P71 = "DIE"("You must provide at least a target value for is-close-to matcher")
    .return ($P71)
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_block86"  :anon :subid("19_1256206976.91354") :outer("16_1256206976.91354")
    .const 'Sub' $P105 = "21_1256206976.91354" 
    capture_lex $P105
    .const 'Sub' $P96 = "20_1256206976.91354" 
    capture_lex $P96
    find_lex $P90, "self"
    $N91 = $P90."value"()
    new $P92, "Integer"
    assign $P92, 0
    set $N93, $P92
    isne $I94, $N91, $N93
    if $I94, if_89
    .const 'Sub' $P105 = "21_1256206976.91354" 
    capture_lex $P105
    $P108 = $P105()
    set $P88, $P108
    goto if_89_end
  if_89:
    .const 'Sub' $P96 = "20_1256206976.91354" 
    capture_lex $P96
    $P103 = $P96()
    set $P88, $P103
  if_89_end:
    .return ($P88)
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_block104"  :anon :subid("21_1256206976.91354") :outer("19_1256206976.91354")
    find_lex $P106, "self"
    $P107 = $P106."within"("0.0001")
    .return ($P107)
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_block95"  :anon :subid("20_1256206976.91354") :outer("19_1256206976.91354")
    find_lex $P97, "self"
    find_lex $P98, "self"
    $P99 = $P98."value"()
    new $P100, "String"
    assign $P100, "0.0001"
    mul $P101, $P99, $P100
    $P102 = $P97."within"($P101)
    .return ($P102)
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_block79"  :anon :subid("18_1256206976.91354") :outer("16_1256206976.91354")
    find_lex $P81, "self"
    find_lex $P82, "@children"
    unless_null $P82, vivify_41
    new $P82, "ResizablePMCArray"
  vivify_41:
    $P83 = $P82."shift"()
    $P84 = $P81."within"($P83)
    .return ($P84)
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_match_Float"  :subid("22_1256206976.91354") :method :outer("11_1256206976.91354")
    .param pmc param_114
    new $P113, 'ExceptionHandler'
    set_addr $P113, control_112
    $P113."handle_types"(58)
    push_eh $P113
    .lex "self", self
    .lex "$item", param_114
    find_lex $P115, "self"
    find_lex $P116, "$item"
    unless_null $P116, vivify_42
    new $P116, "Undef"
  vivify_42:
    $P117 = $P115."match_scalar"($P116)
    .return ($P117)
  control_112:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, "payload"
    .return ($P118)
    rethrow exception
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_match_Integer"  :subid("23_1256206976.91354") :method :outer("11_1256206976.91354")
    .param pmc param_122
    new $P121, 'ExceptionHandler'
    set_addr $P121, control_120
    $P121."handle_types"(58)
    push_eh $P121
    .lex "self", self
    .lex "$item", param_122
    find_lex $P123, "self"
    find_lex $P124, "$item"
    unless_null $P124, vivify_43
    new $P124, "Undef"
  vivify_43:
    $P125 = $P123."match_scalar"($P124)
    .return ($P125)
  control_120:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P126, exception, "payload"
    .return ($P126)
    rethrow exception
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_match_String"  :subid("24_1256206976.91354") :method :outer("11_1256206976.91354")
    .param pmc param_130
    new $P129, 'ExceptionHandler'
    set_addr $P129, control_128
    $P129."handle_types"(58)
    push_eh $P129
    .lex "self", self
    .lex "$item", param_130
    find_lex $P131, "self"
    find_lex $P132, "$item"
    unless_null $P132, vivify_44
    new $P132, "Undef"
  vivify_44:
    $P133 = $P131."match_scalar"($P132)
    .return ($P133)
  control_128:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P134, exception, "payload"
    .return ($P134)
    rethrow exception
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "match_scalar"  :subid("25_1256206976.91354") :method :outer("11_1256206976.91354")
    .param pmc param_138
    .const 'Sub' $P147 = "26_1256206976.91354" 
    capture_lex $P147
    new $P137, 'ExceptionHandler'
    set_addr $P137, control_136
    $P137."handle_types"(58)
    push_eh $P137
    .lex "self", self
    .lex "$item", param_138
    find_lex $P140, "self"
    find_lex $P141, "$item"
    unless_null $P141, vivify_45
    new $P141, "Undef"
  vivify_45:
    $N142 = $P140."difference"($P141)
    find_lex $P143, "self"
    $N144 = $P143."within"()
    isle $I145, $N142, $N144
    unless $I145, if_139_end
    .const 'Sub' $P147 = "26_1256206976.91354" 
    capture_lex $P147
    $P147()
  if_139_end:
    new $P150, "Exception"
    set $P150['type'], 58
    new $P151, "Integer"
    assign $P151, 0
    setattribute $P150, 'payload', $P151
    throw $P150
    .return ()
  control_136:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P152, exception, "payload"
    .return ($P152)
    rethrow exception
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_block146"  :anon :subid("26_1256206976.91354") :outer("25_1256206976.91354")
    new $P148, "Exception"
    set $P148['type'], 58
    new $P149, "Integer"
    assign $P149, 1
    setattribute $P148, 'payload', $P149
    throw $P148
    .return ()
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "value"  :subid("27_1256206976.91354") :method :outer("11_1256206976.91354")
    .param pmc param_156 :slurpy
    new $P155, 'ExceptionHandler'
    set_addr $P155, control_154
    $P155."handle_types"(58)
    push_eh $P155
    .lex "self", self
    .lex "@value", param_156
    find_lex $P157, "self"
    find_lex $P158, "@value"
    unless_null $P158, vivify_46
    new $P158, "ResizablePMCArray"
  vivify_46:
    $P159 = $P157."_ATTR"("value", $P158)
    .return ($P159)
  control_154:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P160, exception, "payload"
    .return ($P160)
    rethrow exception
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "within"  :subid("28_1256206976.91354") :method :outer("11_1256206976.91354")
    .param pmc param_164 :slurpy
    new $P163, 'ExceptionHandler'
    set_addr $P163, control_162
    $P163."handle_types"(58)
    push_eh $P163
    .lex "self", self
    .lex "@value", param_164
    find_lex $P165, "self"
    find_lex $P166, "@value"
    unless_null $P166, vivify_47
    new $P166, "ResizablePMCArray"
  vivify_47:
    $P167 = $P165."_ATTR"("within", $P166)
    .return ($P167)
  control_162:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P168, exception, "payload"
    .return ($P168)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256217603.18651")
    get_hll_global $P14, ["Matcher";"False"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"False"]
.sub "_block13" :init :load :subid("11_1256217603.18651")
    .const 'Sub' $P40 = "15_1256217603.18651" 
    capture_lex $P40
    .const 'Sub' $P32 = "14_1256217603.18651" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1256217603.18651" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P40 = "15_1256217603.18651" 
    capture_lex $P40
    .return ($P40)
.end


.namespace ["Matcher";"False"]
.sub "_ONLOAD"  :subid("12_1256217603.18651") :outer("11_1256217603.18651")
    .const 'Sub' $P21 = "13_1256217603.18651" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_17
    new $P19, "Undef"
  vivify_17:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256217603.18651" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    new $P26, "String"
    assign $P26, "Matcher::False"
    .lex "$class_name", $P26
    find_lex $P27, "$class_name"
    unless_null $P27, vivify_18
    new $P27, "Undef"
  vivify_18:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_19
    new $P29, "Undef"
  vivify_19:
    $P28($P29, "Matcher::TypeSafe")
    $P30 = "NOTE"("done")
    .return ($P30)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P31, exception, "payload"
    .return ($P31)
    rethrow exception
.end


.namespace ["Matcher";"False"]
.sub "_block20"  :anon :subid("13_1256217603.18651") :outer("12_1256217603.18651")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"False"]
.sub "describe_self"  :subid("14_1256217603.18651") :method :outer("11_1256217603.18651")
    .param pmc param_35
    new $P34, 'ExceptionHandler'
    set_addr $P34, control_33
    $P34."handle_types"(58)
    push_eh $P34
    .lex "self", self
    .lex "$description", param_35
    new $P36, "Exception"
    set $P36['type'], 58
    find_lex $P37, "$description"
    unless_null $P37, vivify_20
    new $P37, "Undef"
  vivify_20:
    concat $P38, $P37, "a false value"
    setattribute $P36, 'payload', $P38
    throw $P36
    .return ()
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P39, exception, "payload"
    .return ($P39)
    rethrow exception
.end


.namespace ["Matcher";"False"]
.sub "matches_typesafe"  :subid("15_1256217603.18651") :method :outer("11_1256217603.18651")
    .param pmc param_43
    .const 'Sub' $P48 = "16_1256217603.18651" 
    capture_lex $P48
    new $P42, 'ExceptionHandler'
    set_addr $P42, control_41
    $P42."handle_types"(58)
    push_eh $P42
    .lex "self", self
    .lex "$item", param_43
    new $P44, "Integer"
    assign $P44, 1
    .lex "$result", $P44
    find_lex $P46, "$item"
    unless_null $P46, vivify_21
    new $P46, "Undef"
  vivify_21:
    unless $P46, if_45_end
    .const 'Sub' $P48 = "16_1256217603.18651" 
    capture_lex $P48
    $P48()
  if_45_end:
    new $P50, "Exception"
    set $P50['type'], 58
    find_lex $P51, "$result"
    unless_null $P51, vivify_22
    new $P51, "Undef"
  vivify_22:
    setattribute $P50, 'payload', $P51
    throw $P50
    .return ()
  control_41:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P52, exception, "payload"
    .return ($P52)
    rethrow exception
.end


.namespace ["Matcher";"False"]
.sub "_block47"  :anon :subid("16_1256217603.18651") :outer("15_1256217603.18651")
    new $P49, "Integer"
    assign $P49, 0
    store_lex "$result", $P49
    .return ($P49)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256217594.36637")
    get_hll_global $P14, ["Matcher";"Factory"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"Factory"]
.sub "_block13" :init :load :subid("11_1256217594.36637")
    .const 'Sub' $P198 = "32_1256217594.36637" 
    capture_lex $P198
    .const 'Sub' $P191 = "31_1256217594.36637" 
    capture_lex $P191
    .const 'Sub' $P182 = "30_1256217594.36637" 
    capture_lex $P182
    .const 'Sub' $P175 = "29_1256217594.36637" 
    capture_lex $P175
    .const 'Sub' $P166 = "28_1256217594.36637" 
    capture_lex $P166
    .const 'Sub' $P157 = "27_1256217594.36637" 
    capture_lex $P157
    .const 'Sub' $P148 = "26_1256217594.36637" 
    capture_lex $P148
    .const 'Sub' $P139 = "25_1256217594.36637" 
    capture_lex $P139
    .const 'Sub' $P130 = "24_1256217594.36637" 
    capture_lex $P130
    .const 'Sub' $P121 = "23_1256217594.36637" 
    capture_lex $P121
    .const 'Sub' $P112 = "22_1256217594.36637" 
    capture_lex $P112
    .const 'Sub' $P103 = "21_1256217594.36637" 
    capture_lex $P103
    .const 'Sub' $P96 = "20_1256217594.36637" 
    capture_lex $P96
    .const 'Sub' $P87 = "19_1256217594.36637" 
    capture_lex $P87
    .const 'Sub' $P78 = "18_1256217594.36637" 
    capture_lex $P78
    .const 'Sub' $P69 = "17_1256217594.36637" 
    capture_lex $P69
    .const 'Sub' $P62 = "16_1256217594.36637" 
    capture_lex $P62
    .const 'Sub' $P38 = "14_1256217594.36637" 
    capture_lex $P38
    .const 'Sub' $P15 = "12_1256217594.36637" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P198 = "32_1256217594.36637" 
    capture_lex $P198
    .return ($P198)
.end


.namespace ["Matcher";"Factory"]
.sub "_ONLOAD"  :subid("12_1256217594.36637") :outer("11_1256217594.36637")
    .const 'Sub' $P21 = "13_1256217594.36637" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_33
    new $P19, "Undef"
  vivify_33:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256217594.36637" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    new $P26, "String"
    assign $P26, "Matcher::Factory"
    .lex "$class_name", $P26
    find_lex $P27, "$class_name"
    unless_null $P27, vivify_34
    new $P27, "Undef"
  vivify_34:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_35
    new $P29, "Undef"
  vivify_35:
    $P28($P29, "Class::HashBased")
    get_hll_global $P30, ["Class"], "multi_sub"
    find_lex $P31, "$class_name"
    unless_null $P31, vivify_36
    new $P31, "Undef"
  vivify_36:
    $P30($P31, "is", "_is_" :named("starting_with"))
    get_hll_global $P32, ["Class"], "multi_sub"
    find_lex $P33, "$class_name"
    unless_null $P33, vivify_37
    new $P33, "Undef"
  vivify_37:
    $P32($P33, "equals", "_equals_" :named("starting_with"))
    get_hll_global $P34, ["Class"], "multi_sub"
    find_lex $P35, "$class_name"
    unless_null $P35, vivify_38
    new $P35, "Undef"
  vivify_38:
    $P34($P35, "not", "_not_" :named("starting_with"))
    $P36 = "NOTE"("done")
    .return ($P36)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P37, exception, "payload"
    .return ($P37)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_block20"  :anon :subid("13_1256217594.36637") :outer("12_1256217594.36637")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"Factory"]
.sub "assert_that"  :subid("14_1256217594.36637") :outer("11_1256217594.36637")
    .param pmc param_41
    .param pmc param_42
    .const 'Sub' $P49 = "15_1256217594.36637" 
    capture_lex $P49
    new $P40, 'ExceptionHandler'
    set_addr $P40, control_39
    $P40."handle_types"(58)
    push_eh $P40
    .lex "$item", param_41
    .lex "$matcher", param_42
    find_lex $P44, "$matcher"
    unless_null $P44, vivify_39
    new $P44, "Undef"
  vivify_39:
    find_lex $P45, "$item"
    unless_null $P45, vivify_40
    new $P45, "Undef"
  vivify_40:
    $P46 = $P44."matches"($P45)
    isfalse $I47, $P46
    unless $I47, if_43_end
    .const 'Sub' $P49 = "15_1256217594.36637" 
    capture_lex $P49
    $P49()
  if_43_end:
    new $P59, "Exception"
    set $P59['type'], 58
    new $P60, "Integer"
    assign $P60, 1
    setattribute $P59, 'payload', $P60
    throw $P59
    .return ()
  control_39:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P61, exception, "payload"
    .return ($P61)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_block48"  :anon :subid("15_1256217594.36637") :outer("14_1256217594.36637")
    "say"("MATCH FAILED")
    find_lex $P50, "$matcher"
    unless_null $P50, vivify_41
    new $P50, "Undef"
  vivify_41:
    $P51 = $P50."describe_self"("Expected: ")
    find_lex $P52, "$matcher"
    unless_null $P52, vivify_42
    new $P52, "Undef"
  vivify_42:
    find_lex $P53, "$item"
    unless_null $P53, vivify_43
    new $P53, "Undef"
  vivify_43:
    $S54 = $P52."describe_failure"($P53, "\n     but: ")
    concat $P55, $P51, $S54
    .lex "$explain", $P55
    find_lex $P56, "$explain"
    unless_null $P56, vivify_44
    new $P56, "Undef"
  vivify_44:
    "say"($P56)
    new $P57, "Exception"
    set $P57['type'], 58
    new $P58, "Integer"
    assign $P58, 0
    setattribute $P57, 'payload', $P58
    throw $P57
    .return ()
.end


.namespace ["Matcher";"Factory"]
.sub "defined"  :subid("16_1256217594.36637") :outer("11_1256217594.36637")
    new $P64, 'ExceptionHandler'
    set_addr $P64, control_63
    $P64."handle_types"(58)
    push_eh $P64
    new $P65, "Exception"
    set $P65['type'], 58
    get_hll_global $P66, ["Matcher"], "Defined"
    $P67 = $P66."new"()
    setattribute $P65, 'payload', $P67
    throw $P65
    .return ()
  control_63:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P68, exception, "payload"
    .return ($P68)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_equals_Float"  :subid("17_1256217594.36637") :outer("11_1256217594.36637")
    .param pmc param_72
    new $P71, 'ExceptionHandler'
    set_addr $P71, control_70
    $P71."handle_types"(58)
    push_eh $P71
    .lex "$value", param_72
    new $P73, "Exception"
    set $P73['type'], 58
    get_hll_global $P74, ["Matcher"], "IsCloseTo"
    find_lex $P75, "$value"
    unless_null $P75, vivify_45
    new $P75, "Undef"
  vivify_45:
    $P76 = $P74."new"($P75)
    setattribute $P73, 'payload', $P76
    throw $P73
    .return ()
  control_70:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P77, exception, "payload"
    .return ($P77)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_equals_Integer"  :subid("18_1256217594.36637") :outer("11_1256217594.36637")
    .param pmc param_81
    new $P80, 'ExceptionHandler'
    set_addr $P80, control_79
    $P80."handle_types"(58)
    push_eh $P80
    .lex "$value", param_81
    new $P82, "Exception"
    set $P82['type'], 58
    get_hll_global $P83, ["Matcher"], "Equals"
    find_lex $P84, "$value"
    unless_null $P84, vivify_46
    new $P84, "Undef"
  vivify_46:
    $P85 = $P83."new"($P84, "Integer" :named("match_type"))
    setattribute $P82, 'payload', $P85
    throw $P82
    .return ()
  control_79:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P86, exception, "payload"
    .return ($P86)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_equals_String"  :subid("19_1256217594.36637") :outer("11_1256217594.36637")
    .param pmc param_90
    new $P89, 'ExceptionHandler'
    set_addr $P89, control_88
    $P89."handle_types"(58)
    push_eh $P89
    .lex "$value", param_90
    new $P91, "Exception"
    set $P91['type'], 58
    get_hll_global $P92, ["Matcher"], "Equals"
    find_lex $P93, "$value"
    unless_null $P93, vivify_47
    new $P93, "Undef"
  vivify_47:
    $P94 = $P92."new"($P93, "String" :named("match_type"))
    setattribute $P91, 'payload', $P94
    throw $P91
    .return ()
  control_88:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P95, exception, "payload"
    .return ($P95)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "false"  :subid("20_1256217594.36637") :outer("11_1256217594.36637")
    new $P98, 'ExceptionHandler'
    set_addr $P98, control_97
    $P98."handle_types"(58)
    push_eh $P98
    new $P99, "Exception"
    set $P99['type'], 58
    get_hll_global $P100, ["Matcher"], "False"
    $P101 = $P100."new"()
    setattribute $P99, 'payload', $P101
    throw $P99
    .return ()
  control_97:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_is_Float"  :subid("21_1256217594.36637") :outer("11_1256217594.36637")
    .param pmc param_106
    new $P105, 'ExceptionHandler'
    set_addr $P105, control_104
    $P105."handle_types"(58)
    push_eh $P105
    .lex "$value", param_106
    new $P107, "Exception"
    set $P107['type'], 58
    get_hll_global $P108, ["Matcher"], "IsCloseTo"
    find_lex $P109, "$value"
    unless_null $P109, vivify_48
    new $P109, "Undef"
  vivify_48:
    $P110 = $P108."new"($P109)
    setattribute $P107, 'payload', $P110
    throw $P107
    .return ()
  control_104:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_is_Integer"  :subid("22_1256217594.36637") :outer("11_1256217594.36637")
    .param pmc param_115
    new $P114, 'ExceptionHandler'
    set_addr $P114, control_113
    $P114."handle_types"(58)
    push_eh $P114
    .lex "$value", param_115
    new $P116, "Exception"
    set $P116['type'], 58
    get_hll_global $P117, ["Matcher"], "Equals"
    find_lex $P118, "$value"
    unless_null $P118, vivify_49
    new $P118, "Undef"
  vivify_49:
    $P119 = $P117."new"($P118, "Integer" :named("match_type"))
    setattribute $P116, 'payload', $P119
    throw $P116
    .return ()
  control_113:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P120, exception, "payload"
    .return ($P120)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_is_Matcher"  :subid("23_1256217594.36637") :outer("11_1256217594.36637")
    .param pmc param_124
    new $P123, 'ExceptionHandler'
    set_addr $P123, control_122
    $P123."handle_types"(58)
    push_eh $P123
    .lex "$matcher", param_124
    new $P125, "Exception"
    set $P125['type'], 58
    get_hll_global $P126, ["Matcher"], "DescribedAs"
    find_lex $P127, "$matcher"
    unless_null $P127, vivify_50
    new $P127, "Undef"
  vivify_50:
    $P128 = $P126."new"("is", $P127)
    setattribute $P125, 'payload', $P128
    throw $P125
    .return ()
  control_122:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P129, exception, "payload"
    .return ($P129)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_is_String"  :subid("24_1256217594.36637") :outer("11_1256217594.36637")
    .param pmc param_133
    new $P132, 'ExceptionHandler'
    set_addr $P132, control_131
    $P132."handle_types"(58)
    push_eh $P132
    .lex "$value", param_133
    new $P134, "Exception"
    set $P134['type'], 58
    get_hll_global $P135, ["Matcher"], "Equals"
    find_lex $P136, "$value"
    unless_null $P136, vivify_51
    new $P136, "Undef"
  vivify_51:
    $P137 = $P135."new"($P136, "String" :named("match_type"))
    setattribute $P134, 'payload', $P137
    throw $P134
    .return ()
  control_131:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P138, exception, "payload"
    .return ($P138)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_not_Float"  :subid("25_1256217594.36637") :outer("11_1256217594.36637")
    .param pmc param_142
    new $P141, 'ExceptionHandler'
    set_addr $P141, control_140
    $P141."handle_types"(58)
    push_eh $P141
    .lex "$value", param_142
    new $P143, "Exception"
    set $P143['type'], 58
    find_lex $P144, "$value"
    unless_null $P144, vivify_52
    new $P144, "Undef"
  vivify_52:
    $P145 = "is"($P144)
    $P146 = "not"($P145)
    setattribute $P143, 'payload', $P146
    throw $P143
    .return ()
  control_140:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P147, exception, "payload"
    .return ($P147)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_not_Integer"  :subid("26_1256217594.36637") :outer("11_1256217594.36637")
    .param pmc param_151
    new $P150, 'ExceptionHandler'
    set_addr $P150, control_149
    $P150."handle_types"(58)
    push_eh $P150
    .lex "$value", param_151
    new $P152, "Exception"
    set $P152['type'], 58
    find_lex $P153, "$value"
    unless_null $P153, vivify_53
    new $P153, "Undef"
  vivify_53:
    $P154 = "is"($P153)
    $P155 = "not"($P154)
    setattribute $P152, 'payload', $P155
    throw $P152
    .return ()
  control_149:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P156, exception, "payload"
    .return ($P156)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_not_Matcher"  :subid("27_1256217594.36637") :outer("11_1256217594.36637")
    .param pmc param_160
    new $P159, 'ExceptionHandler'
    set_addr $P159, control_158
    $P159."handle_types"(58)
    push_eh $P159
    .lex "$matcher", param_160
    new $P161, "Exception"
    set $P161['type'], 58
    get_hll_global $P162, ["Matcher"], "Not"
    find_lex $P163, "$matcher"
    unless_null $P163, vivify_54
    new $P163, "Undef"
  vivify_54:
    $P164 = $P162."new"($P163)
    setattribute $P161, 'payload', $P164
    throw $P161
    .return ()
  control_158:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P165, exception, "payload"
    .return ($P165)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_not_String"  :subid("28_1256217594.36637") :outer("11_1256217594.36637")
    .param pmc param_169
    new $P168, 'ExceptionHandler'
    set_addr $P168, control_167
    $P168."handle_types"(58)
    push_eh $P168
    .lex "$value", param_169
    new $P170, "Exception"
    set $P170['type'], 58
    find_lex $P171, "$value"
    unless_null $P171, vivify_55
    new $P171, "Undef"
  vivify_55:
    $P172 = "is"($P171)
    $P173 = "not"($P172)
    setattribute $P170, 'payload', $P173
    throw $P170
    .return ()
  control_167:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P174, exception, "payload"
    .return ($P174)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "null"  :subid("29_1256217594.36637") :outer("11_1256217594.36637")
    new $P177, 'ExceptionHandler'
    set_addr $P177, control_176
    $P177."handle_types"(58)
    push_eh $P177
    new $P178, "Exception"
    set $P178['type'], 58
    get_hll_global $P179, ["Matcher"], "Null"
    $P180 = $P179."new"()
    setattribute $P178, 'payload', $P180
    throw $P178
    .return ()
  control_176:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P181, exception, "payload"
    .return ($P181)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "returns"  :subid("30_1256217594.36637") :outer("11_1256217594.36637")
    .param pmc param_185
    new $P184, 'ExceptionHandler'
    set_addr $P184, control_183
    $P184."handle_types"(58)
    push_eh $P184
    .lex "$value", param_185
    new $P186, "Exception"
    set $P186['type'], 58
    get_hll_global $P187, ["Matcher"], "DescribedAs"
    find_lex $P188, "$value"
    unless_null $P188, vivify_56
    new $P188, "Undef"
  vivify_56:
    $P189 = $P187."new"("returns", $P188)
    setattribute $P186, 'payload', $P189
    throw $P186
    .return ()
  control_183:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P190, exception, "payload"
    .return ($P190)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "true"  :subid("31_1256217594.36637") :outer("11_1256217594.36637")
    new $P193, 'ExceptionHandler'
    set_addr $P193, control_192
    $P193."handle_types"(58)
    push_eh $P193
    new $P194, "Exception"
    set $P194['type'], 58
    get_hll_global $P195, ["Matcher"], "True"
    $P196 = $P195."new"()
    setattribute $P194, 'payload', $P196
    throw $P194
    .return ()
  control_192:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P197, exception, "payload"
    .return ($P197)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "type"  :subid("32_1256217594.36637") :outer("11_1256217594.36637")
    .param pmc param_201
    new $P200, 'ExceptionHandler'
    set_addr $P200, control_199
    $P200."handle_types"(58)
    push_eh $P200
    .lex "$type", param_201
    new $P202, "Exception"
    set $P202['type'], 58
    get_hll_global $P203, ["Matcher"], "ObjectOfType"
    find_lex $P204, "$type"
    unless_null $P204, vivify_57
    new $P204, "Undef"
  vivify_57:
    $P205 = $P203."new"($P204)
    setattribute $P202, 'payload', $P205
    throw $P202
    .return ()
  control_199:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P206, exception, "payload"
    .return ($P206)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256215458.01415")
    get_hll_global $P14, ["Matcher"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher"]
.sub "_block13" :init :load :subid("11_1256215458.01415")
    .const 'Sub' $P62 = "17_1256215458.01415" 
    capture_lex $P62
    .const 'Sub' $P51 = "16_1256215458.01415" 
    capture_lex $P51
    .const 'Sub' $P44 = "15_1256215458.01415" 
    capture_lex $P44
    .const 'Sub' $P32 = "14_1256215458.01415" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1256215458.01415" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P62 = "17_1256215458.01415" 
    capture_lex $P62
    .return ($P62)
.end


.namespace ["Matcher"]
.sub "_ONLOAD"  :subid("12_1256215458.01415") :outer("11_1256215458.01415")
    .const 'Sub' $P21 = "13_1256215458.01415" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_18
    new $P19, "Undef"
  vivify_18:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256215458.01415" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    new $P26, "String"
    assign $P26, "Matcher"
    .lex "$class_name", $P26
    find_lex $P27, "$class_name"
    unless_null $P27, vivify_19
    new $P27, "Undef"
  vivify_19:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_20
    new $P29, "Undef"
  vivify_20:
    $P28($P29, "Class::HashBased")
    $P30 = "NOTE"("done")
    .return ($P30)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P31, exception, "payload"
    .return ($P31)
    rethrow exception
.end


.namespace ["Matcher"]
.sub "_block20"  :anon :subid("13_1256215458.01415") :outer("12_1256215458.01415")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher"]
.sub "describe_failure"  :subid("14_1256215458.01415") :method :outer("11_1256215458.01415")
    .param pmc param_35
    .param pmc param_36
    new $P34, 'ExceptionHandler'
    set_addr $P34, control_33
    $P34."handle_types"(58)
    push_eh $P34
    .lex "self", self
    .lex "$item", param_35
    .lex "$description", param_36
    new $P37, "Exception"
    set $P37['type'], 58
    find_lex $P38, "$description"
    unless_null $P38, vivify_21
    new $P38, "Undef"
  vivify_21:
    concat $P39, $P38, "was '"
    find_lex $P40, "$item"
    unless_null $P40, vivify_22
    new $P40, "Undef"
  vivify_22:
    concat $P41, $P39, $P40
    concat $P42, $P41, "'"
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


.namespace ["Matcher"]
.sub "describe_self"  :subid("15_1256215458.01415") :method :outer("11_1256215458.01415")
    .param pmc param_47
    new $P46, 'ExceptionHandler'
    set_addr $P46, control_45
    $P46."handle_types"(58)
    push_eh $P46
    .lex "self", self
    .lex "$description", param_47
    find_lex $P48, "self"
    $P49 = $P48."_ABSTRACT_METHOD"()
    .return ($P49)
  control_45:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P50, exception, "payload"
    .return ($P50)
    rethrow exception
.end


.namespace ["Matcher"]
.sub "init"  :subid("16_1256215458.01415") :method :outer("11_1256215458.01415")
    .param pmc param_54
    .param pmc param_55
    new $P53, 'ExceptionHandler'
    set_addr $P53, control_52
    $P53."handle_types"(58)
    push_eh $P53
    .lex "self", self
    .lex "@args", param_54
    .lex "%opts", param_55
    get_hll_global $P56, ["Class";"BaseBehavior"], "init"
    find_lex $P57, "self"
    find_lex $P58, "@args"
    unless_null $P58, vivify_23
    new $P58, "ResizablePMCArray"
  vivify_23:
    find_lex $P59, "%opts"
    unless_null $P59, vivify_24
    new $P59, "Hash"
  vivify_24:
    $P60 = $P56($P57, $P58, $P59)
    .return ($P60)
  control_52:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P61, exception, "payload"
    .return ($P61)
    rethrow exception
.end


.namespace ["Matcher"]
.sub "matches"  :subid("17_1256215458.01415") :method :outer("11_1256215458.01415")
    .param pmc param_65
    new $P64, 'ExceptionHandler'
    set_addr $P64, control_63
    $P64."handle_types"(58)
    push_eh $P64
    .lex "self", self
    .lex "$item", param_65
    find_lex $P66, "self"
    $P67 = $P66."_ABSTRACT_METHOD"()
    .return ($P67)
  control_63:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P68, exception, "payload"
    .return ($P68)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256206980.51359")
    get_hll_global $P14, ["Matcher";"Not"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"Not"]
.sub "_block13" :init :load :subid("11_1256206980.51359")
    .const 'Sub' $P88 = "19_1256206980.51359" 
    capture_lex $P88
    .const 'Sub' $P75 = "18_1256206980.51359" 
    capture_lex $P75
    .const 'Sub' $P55 = "16_1256206980.51359" 
    capture_lex $P55
    .const 'Sub' $P44 = "15_1256206980.51359" 
    capture_lex $P44
    .const 'Sub' $P32 = "14_1256206980.51359" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1256206980.51359" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P88 = "19_1256206980.51359" 
    capture_lex $P88
    .return ($P88)
.end


.namespace ["Matcher";"Not"]
.sub "_ONLOAD"  :subid("12_1256206980.51359") :outer("11_1256206980.51359")
    .const 'Sub' $P21 = "13_1256206980.51359" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_20
    new $P19, "Undef"
  vivify_20:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256206980.51359" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    new $P26, "String"
    assign $P26, "Matcher::Not"
    .lex "$class_name", $P26
    find_lex $P27, "$class_name"
    unless_null $P27, vivify_21
    new $P27, "Undef"
  vivify_21:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_22
    new $P29, "Undef"
  vivify_22:
    $P28($P29, "Matcher")
    $P30 = "NOTE"("done")
    .return ($P30)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P31, exception, "payload"
    .return ($P31)
    rethrow exception
.end


.namespace ["Matcher";"Not"]
.sub "_block20"  :anon :subid("13_1256206980.51359") :outer("12_1256206980.51359")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"Not"]
.sub "describe_failure"  :subid("14_1256206980.51359") :method :outer("11_1256206980.51359")
    .param pmc param_35
    .param pmc param_36
    new $P34, 'ExceptionHandler'
    set_addr $P34, control_33
    $P34."handle_types"(58)
    push_eh $P34
    .lex "self", self
    .lex "$item", param_35
    .lex "$description", param_36
    new $P37, "Exception"
    set $P37['type'], 58
    find_lex $P38, "self"
    $P39 = $P38."predicate"()
    find_lex $P40, "$item"
    unless_null $P40, vivify_23
    new $P40, "Undef"
  vivify_23:
    find_lex $P41, "$description"
    unless_null $P41, vivify_24
    new $P41, "Undef"
  vivify_24:
    $P42 = $P39."describe_failure"($P40, $P41)
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


.namespace ["Matcher";"Not"]
.sub "describe_self"  :subid("15_1256206980.51359") :method :outer("11_1256206980.51359")
    .param pmc param_47
    new $P46, 'ExceptionHandler'
    set_addr $P46, control_45
    $P46."handle_types"(58)
    push_eh $P46
    .lex "self", self
    .lex "$description", param_47
    new $P48, "Exception"
    set $P48['type'], 58
    find_lex $P49, "self"
    $P50 = $P49."predicate"()
    find_lex $P51, "$description"
    unless_null $P51, vivify_25
    new $P51, "Undef"
  vivify_25:
    concat $P52, $P51, "not "
    $P53 = $P50."describe_self"($P52)
    setattribute $P48, 'payload', $P53
    throw $P48
    .return ()
  control_45:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P54, exception, "payload"
    .return ($P54)
    rethrow exception
.end


.namespace ["Matcher";"Not"]
.sub "init"  :subid("16_1256206980.51359") :method :outer("11_1256206980.51359")
    .param pmc param_58
    .param pmc param_59
    .const 'Sub' $P64 = "17_1256206980.51359" 
    capture_lex $P64
    new $P57, 'ExceptionHandler'
    set_addr $P57, control_56
    $P57."handle_types"(58)
    push_eh $P57
    .lex "self", self
    .lex "@args", param_58
    .lex "%opts", param_59
    find_lex $P61, "@args"
    unless_null $P61, vivify_26
    new $P61, "ResizablePMCArray"
  vivify_26:
    set $N62, $P61
    if $N62, unless_60_end
    .const 'Sub' $P64 = "17_1256206980.51359" 
    capture_lex $P64
    $P64()
  unless_60_end:
    find_lex $P66, "self"
    find_lex $P67, "@args"
    unless_null $P67, vivify_27
    new $P67, "ResizablePMCArray"
  vivify_27:
    $P68 = $P67."shift"()
    $P66."predicate"($P68)
    get_hll_global $P69, ["Matcher"], "init"
    find_lex $P70, "self"
    find_lex $P71, "@args"
    unless_null $P71, vivify_28
    new $P71, "ResizablePMCArray"
  vivify_28:
    find_lex $P72, "%opts"
    unless_null $P72, vivify_29
    new $P72, "Hash"
  vivify_29:
    $P73 = $P69($P70, $P71, $P72)
    .return ($P73)
  control_56:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P74, exception, "payload"
    .return ($P74)
    rethrow exception
.end


.namespace ["Matcher";"Not"]
.sub "_block63"  :anon :subid("17_1256206980.51359") :outer("16_1256206980.51359")
    $P65 = "DIE"("You must provide a predicate Matcher for Match::Not")
    .return ($P65)
.end


.namespace ["Matcher";"Not"]
.sub "matches"  :subid("18_1256206980.51359") :method :outer("11_1256206980.51359")
    .param pmc param_78
    new $P77, 'ExceptionHandler'
    set_addr $P77, control_76
    $P77."handle_types"(58)
    push_eh $P77
    .lex "self", self
    .lex "$item", param_78
    find_lex $P79, "self"
    $P80 = $P79."predicate"()
    find_lex $P81, "$item"
    unless_null $P81, vivify_30
    new $P81, "Undef"
  vivify_30:
    $P82 = $P80."matches"($P81)
    isfalse $I83, $P82
    new $P84, 'Integer'
    set $P84, $I83
    .lex "$result", $P84
    new $P85, "Exception"
    set $P85['type'], 58
    find_lex $P86, "$result"
    unless_null $P86, vivify_31
    new $P86, "Undef"
  vivify_31:
    setattribute $P85, 'payload', $P86
    throw $P85
    .return ()
  control_76:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P87, exception, "payload"
    .return ($P87)
    rethrow exception
.end


.namespace ["Matcher";"Not"]
.sub "predicate"  :subid("19_1256206980.51359") :method :outer("11_1256206980.51359")
    .param pmc param_91 :slurpy
    new $P90, 'ExceptionHandler'
    set_addr $P90, control_89
    $P90."handle_types"(58)
    push_eh $P90
    .lex "self", self
    .lex "@value", param_91
    find_lex $P92, "self"
    find_lex $P93, "@value"
    unless_null $P93, vivify_32
    new $P93, "ResizablePMCArray"
  vivify_32:
    $P94 = $P92."_ATTR"("predicate", $P93)
    .return ($P94)
  control_89:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P95, exception, "payload"
    .return ($P95)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256206981.3736")
    get_hll_global $P14, ["Matcher";"Null"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"Null"]
.sub "_block13" :init :load :subid("11_1256206981.3736")
    .const 'Sub' $P40 = "15_1256206981.3736" 
    capture_lex $P40
    .const 'Sub' $P32 = "14_1256206981.3736" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1256206981.3736" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P40 = "15_1256206981.3736" 
    capture_lex $P40
    .return ($P40)
.end


.namespace ["Matcher";"Null"]
.sub "_ONLOAD"  :subid("12_1256206981.3736") :outer("11_1256206981.3736")
    .const 'Sub' $P21 = "13_1256206981.3736" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_17
    new $P19, "Undef"
  vivify_17:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256206981.3736" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    new $P26, "String"
    assign $P26, "Matcher::Null"
    .lex "$class_name", $P26
    find_lex $P27, "$class_name"
    unless_null $P27, vivify_18
    new $P27, "Undef"
  vivify_18:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_19
    new $P29, "Undef"
  vivify_19:
    $P28($P29, "Matcher")
    $P30 = "NOTE"("done")
    .return ($P30)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P31, exception, "payload"
    .return ($P31)
    rethrow exception
.end


.namespace ["Matcher";"Null"]
.sub "_block20"  :anon :subid("13_1256206981.3736") :outer("12_1256206981.3736")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"Null"]
.sub "describe_self"  :subid("14_1256206981.3736") :method :outer("11_1256206981.3736")
    .param pmc param_35
    new $P34, 'ExceptionHandler'
    set_addr $P34, control_33
    $P34."handle_types"(58)
    push_eh $P34
    .lex "self", self
    .lex "$description", param_35
    new $P36, "Exception"
    set $P36['type'], 58
    find_lex $P37, "$description"
    unless_null $P37, vivify_20
    new $P37, "Undef"
  vivify_20:
    concat $P38, $P37, "a null value"
    setattribute $P36, 'payload', $P38
    throw $P36
    .return ()
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P39, exception, "payload"
    .return ($P39)
    rethrow exception
.end


.namespace ["Matcher";"Null"]
.sub "matches"  :subid("15_1256206981.3736") :method :outer("11_1256206981.3736")
    .param pmc param_43 :slurpy
    .const 'Sub' $P48 = "16_1256206981.3736" 
    capture_lex $P48
    new $P42, 'ExceptionHandler'
    set_addr $P42, control_41
    $P42."handle_types"(58)
    push_eh $P42
    .lex "self", self
    .lex "@value", param_43
    find_lex $P45, "@value"
    unless_null $P45, vivify_21
    new $P45, "ResizablePMCArray"
  vivify_21:
    set $N46, $P45
    if $N46, unless_44_end
    .const 'Sub' $P48 = "16_1256206981.3736" 
    capture_lex $P48
    $P48()
  unless_44_end:
    new $P51, "Exception"
    set $P51['type'], 58
    get_hll_global $P52, ["Parrot"], "is_null"
    find_lex $P53, "@value"
    unless_null $P53, vivify_22
    new $P53, "ResizablePMCArray"
  vivify_22:
    set $P54, $P53[0]
    unless_null $P54, vivify_23
    new $P54, "Undef"
  vivify_23:
    $P55 = $P52($P54)
    setattribute $P51, 'payload', $P55
    throw $P51
    .return ()
  control_41:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P56, exception, "payload"
    .return ($P56)
    rethrow exception
.end


.namespace ["Matcher";"Null"]
.sub "_block47"  :anon :subid("16_1256206981.3736") :outer("15_1256206981.3736")
    get_hll_global $P49, ["Parrot"], "die"
    $P50 = $P49("A value must be passed to matches($item)")
    .return ($P50)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256216871.67547")
    get_hll_global $P14, ["Matcher";"True"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"True"]
.sub "_block13" :init :load :subid("11_1256216871.67547")
    .const 'Sub' $P40 = "15_1256216871.67547" 
    capture_lex $P40
    .const 'Sub' $P32 = "14_1256216871.67547" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1256216871.67547" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P40 = "15_1256216871.67547" 
    capture_lex $P40
    .return ($P40)
.end


.namespace ["Matcher";"True"]
.sub "_ONLOAD"  :subid("12_1256216871.67547") :outer("11_1256216871.67547")
    .const 'Sub' $P21 = "13_1256216871.67547" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_17
    new $P19, "Undef"
  vivify_17:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256216871.67547" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    new $P26, "String"
    assign $P26, "Matcher::True"
    .lex "$class_name", $P26
    find_lex $P27, "$class_name"
    unless_null $P27, vivify_18
    new $P27, "Undef"
  vivify_18:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_19
    new $P29, "Undef"
  vivify_19:
    $P28($P29, "Matcher::TypeSafe")
    $P30 = "NOTE"("done")
    .return ($P30)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P31, exception, "payload"
    .return ($P31)
    rethrow exception
.end


.namespace ["Matcher";"True"]
.sub "_block20"  :anon :subid("13_1256216871.67547") :outer("12_1256216871.67547")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"True"]
.sub "describe_self"  :subid("14_1256216871.67547") :method :outer("11_1256216871.67547")
    .param pmc param_35
    new $P34, 'ExceptionHandler'
    set_addr $P34, control_33
    $P34."handle_types"(58)
    push_eh $P34
    .lex "self", self
    .lex "$description", param_35
    new $P36, "Exception"
    set $P36['type'], 58
    find_lex $P37, "$description"
    unless_null $P37, vivify_20
    new $P37, "Undef"
  vivify_20:
    concat $P38, $P37, "a true value"
    setattribute $P36, 'payload', $P38
    throw $P36
    .return ()
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P39, exception, "payload"
    .return ($P39)
    rethrow exception
.end


.namespace ["Matcher";"True"]
.sub "matches_typesafe"  :subid("15_1256216871.67547") :method :outer("11_1256216871.67547")
    .param pmc param_43
    .const 'Sub' $P48 = "16_1256216871.67547" 
    capture_lex $P48
    new $P42, 'ExceptionHandler'
    set_addr $P42, control_41
    $P42."handle_types"(58)
    push_eh $P42
    .lex "self", self
    .lex "$item", param_43
    new $P44, "Integer"
    assign $P44, 0
    .lex "$result", $P44
    find_lex $P46, "$item"
    unless_null $P46, vivify_21
    new $P46, "Undef"
  vivify_21:
    unless $P46, if_45_end
    .const 'Sub' $P48 = "16_1256216871.67547" 
    capture_lex $P48
    $P48()
  if_45_end:
    new $P50, "Exception"
    set $P50['type'], 58
    find_lex $P51, "$result"
    unless_null $P51, vivify_22
    new $P51, "Undef"
  vivify_22:
    setattribute $P50, 'payload', $P51
    throw $P50
    .return ()
  control_41:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P52, exception, "payload"
    .return ($P52)
    rethrow exception
.end


.namespace ["Matcher";"True"]
.sub "_block47"  :anon :subid("16_1256216871.67547") :outer("15_1256216871.67547")
    new $P49, "Integer"
    assign $P49, 1
    store_lex "$result", $P49
    .return ($P49)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256206982.36362")
    get_hll_global $P14, ["Matcher";"TypeSafe"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"TypeSafe"]
.sub "_block13" :init :load :subid("11_1256206982.36362")
    .const 'Sub' $P101 = "22_1256206982.36362" 
    capture_lex $P101
    .const 'Sub' $P93 = "21_1256206982.36362" 
    capture_lex $P93
    .const 'Sub' $P74 = "19_1256206982.36362" 
    capture_lex $P74
    .const 'Sub' $P63 = "18_1256206982.36362" 
    capture_lex $P63
    .const 'Sub' $P32 = "14_1256206982.36362" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1256206982.36362" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P101 = "22_1256206982.36362" 
    capture_lex $P101
    .return ($P101)
.end


.namespace ["Matcher";"TypeSafe"]
.sub "_ONLOAD"  :subid("12_1256206982.36362") :outer("11_1256206982.36362")
    .const 'Sub' $P21 = "13_1256206982.36362" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_23
    new $P19, "Undef"
  vivify_23:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256206982.36362" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    new $P26, "String"
    assign $P26, "Matcher::TypeSafe"
    .lex "$class_name", $P26
    find_lex $P27, "$class_name"
    unless_null $P27, vivify_24
    new $P27, "Undef"
  vivify_24:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_25
    new $P29, "Undef"
  vivify_25:
    $P28($P29, "Matcher")
    $P30 = "NOTE"("done")
    .return ($P30)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P31, exception, "payload"
    .return ($P31)
    rethrow exception
.end


.namespace ["Matcher";"TypeSafe"]
.sub "_block20"  :anon :subid("13_1256206982.36362") :outer("12_1256206982.36362")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"TypeSafe"]
.sub "describe_failure"  :subid("14_1256206982.36362") :method :outer("11_1256206982.36362")
    .param pmc param_35
    .param pmc param_36
    .const 'Sub' $P52 = "17_1256206982.36362" 
    capture_lex $P52
    .const 'Sub' $P49 = "16_1256206982.36362" 
    capture_lex $P49
    .const 'Sub' $P43 = "15_1256206982.36362" 
    capture_lex $P43
    new $P34, 'ExceptionHandler'
    set_addr $P34, control_33
    $P34."handle_types"(58)
    push_eh $P34
    .lex "self", self
    .lex "$item", param_35
    .lex "$description", param_36
    new $P37, "Undef"
    .lex "$failure", $P37
    get_hll_global $P39, ["Parrot"], "is_null"
    find_lex $P40, "$item"
    unless_null $P40, vivify_26
    new $P40, "Undef"
  vivify_26:
    $P41 = $P39($P40)
    if $P41, if_38
    find_lex $P46, "self"
    $P47 = $P46."wrong_type"()
    if $P47, if_45
    .const 'Sub' $P52 = "17_1256206982.36362" 
    capture_lex $P52
    $P52()
    goto if_45_end
  if_45:
    .const 'Sub' $P49 = "16_1256206982.36362" 
    capture_lex $P49
    $P49()
  if_45_end:
    goto if_38_end
  if_38:
    .const 'Sub' $P43 = "15_1256206982.36362" 
    capture_lex $P43
    $P43()
  if_38_end:
    new $P58, "Exception"
    set $P58['type'], 58
    find_lex $P59, "$description"
    unless_null $P59, vivify_29
    new $P59, "Undef"
  vivify_29:
    find_lex $P60, "$failure"
    unless_null $P60, vivify_30
    new $P60, "Undef"
  vivify_30:
    concat $P61, $P59, $P60
    setattribute $P58, 'payload', $P61
    throw $P58
    .return ()
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P62, exception, "payload"
    .return ($P62)
    rethrow exception
.end


.namespace ["Matcher";"TypeSafe"]
.sub "_block51"  :anon :subid("17_1256206982.36362") :outer("14_1256206982.36362")
    new $P53, "Exception"
    set $P53['type'], 58
    find_lex $P54, "self"
    find_lex $P55, "$item"
    unless_null $P55, vivify_27
    new $P55, "Undef"
  vivify_27:
    find_lex $P56, "$description"
    unless_null $P56, vivify_28
    new $P56, "Undef"
  vivify_28:
    $P57 = $P54."describe_failure_typesafe"($P55, $P56)
    setattribute $P53, 'payload', $P57
    throw $P53
    .return ()
.end


.namespace ["Matcher";"TypeSafe"]
.sub "_block48"  :anon :subid("16_1256206982.36362") :outer("14_1256206982.36362")
    new $P50, "String"
    assign $P50, "was the wrong type"
    store_lex "$failure", $P50
    .return ($P50)
.end


.namespace ["Matcher";"TypeSafe"]
.sub "_block42"  :anon :subid("15_1256206982.36362") :outer("14_1256206982.36362")
    new $P44, "String"
    assign $P44, "was null"
    store_lex "$failure", $P44
    .return ($P44)
.end


.namespace ["Matcher";"TypeSafe"]
.sub "describe_failure_typesafe"  :subid("18_1256206982.36362") :method :outer("11_1256206982.36362")
    .param pmc param_66
    .param pmc param_67
    new $P65, 'ExceptionHandler'
    set_addr $P65, control_64
    $P65."handle_types"(58)
    push_eh $P65
    .lex "self", self
    .lex "$item", param_66
    .lex "$description", param_67
    new $P68, "Exception"
    set $P68['type'], 58
    find_lex $P69, "$description"
    unless_null $P69, vivify_31
    new $P69, "Undef"
  vivify_31:
    concat $P70, $P69, "was: "
    find_lex $P71, "$item"
    unless_null $P71, vivify_32
    new $P71, "Undef"
  vivify_32:
    concat $P72, $P70, $P71
    setattribute $P68, 'payload', $P72
    throw $P68
    .return ()
  control_64:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P73, exception, "payload"
    .return ($P73)
    rethrow exception
.end


.namespace ["Matcher";"TypeSafe"]
.sub "matches"  :subid("19_1256206982.36362") :method :outer("11_1256206982.36362")
    .param pmc param_77
    .const 'Sub' $P85 = "20_1256206982.36362" 
    capture_lex $P85
    new $P76, 'ExceptionHandler'
    set_addr $P76, control_75
    $P76."handle_types"(58)
    push_eh $P76
    .lex "self", self
    .lex "$item", param_77
    find_lex $P78, "self"
    $P78."wrong_type"(0)
    get_hll_global $P80, ["Parrot"], "is_null"
    find_lex $P81, "$item"
    unless_null $P81, vivify_33
    new $P81, "Undef"
  vivify_33:
    $P82 = $P80($P81)
    isfalse $I83, $P82
    unless $I83, if_79_end
    .const 'Sub' $P85 = "20_1256206982.36362" 
    capture_lex $P85
    $P85()
  if_79_end:
    new $P90, "Exception"
    set $P90['type'], 58
    new $P91, "Integer"
    assign $P91, 0
    setattribute $P90, 'payload', $P91
    throw $P90
    .return ()
  control_75:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P92, exception, "payload"
    .return ($P92)
    rethrow exception
.end


.namespace ["Matcher";"TypeSafe"]
.sub "_block84"  :anon :subid("20_1256206982.36362") :outer("19_1256206982.36362")
    new $P86, "Exception"
    set $P86['type'], 58
    find_lex $P87, "self"
    find_lex $P88, "$item"
    unless_null $P88, vivify_34
    new $P88, "Undef"
  vivify_34:
    $P89 = $P87."matches_typesafe"($P88)
    setattribute $P86, 'payload', $P89
    throw $P86
    .return ()
.end


.namespace ["Matcher";"TypeSafe"]
.sub "matches_typesafe"  :subid("21_1256206982.36362") :method :outer("11_1256206982.36362")
    .param pmc param_96
    new $P95, 'ExceptionHandler'
    set_addr $P95, control_94
    $P95."handle_types"(58)
    push_eh $P95
    .lex "self", self
    .lex "$item", param_96
    find_lex $P97, "self"
    $P97."wrong_type"(1)
    new $P98, "Exception"
    set $P98['type'], 58
    new $P99, "Integer"
    assign $P99, 0
    setattribute $P98, 'payload', $P99
    throw $P98
    .return ()
  control_94:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
    rethrow exception
.end


.namespace ["Matcher";"TypeSafe"]
.sub "wrong_type"  :subid("22_1256206982.36362") :method :outer("11_1256206982.36362")
    .param pmc param_104 :slurpy
    new $P103, 'ExceptionHandler'
    set_addr $P103, control_102
    $P103."handle_types"(58)
    push_eh $P103
    .lex "self", self
    .lex "@value", param_104
    find_lex $P105, "self"
    find_lex $P106, "@value"
    unless_null $P106, vivify_35
    new $P106, "ResizablePMCArray"
  vivify_35:
    $P107 = $P105."_ATTR"("wrong_type", $P106)
    .return ($P107)
  control_102:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
    rethrow exception
.end

# Nothing here yet.
