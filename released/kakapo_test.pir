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
.sub "_block11"  :anon :subid("10_1256283565.17614")
    get_hll_global $P14, ["Testcase"], "_block13" 
    .return ($P14)
.end


.namespace ["Testcase"]
.sub "_block13" :init :load :subid("11_1256283565.17614")
    .const 'Sub' $P433 = "53_1256283565.17614" 
    capture_lex $P433
    .const 'Sub' $P427 = "52_1256283565.17614" 
    capture_lex $P427
    .const 'Sub' $P419 = "51_1256283565.17614" 
    capture_lex $P419
    .const 'Sub' $P381 = "48_1256283565.17614" 
    capture_lex $P381
    .const 'Sub' $P366 = "47_1256283565.17614" 
    capture_lex $P366
    .const 'Sub' $P338 = "45_1256283565.17614" 
    capture_lex $P338
    .const 'Sub' $P330 = "44_1256283565.17614" 
    capture_lex $P330
    .const 'Sub' $P322 = "43_1256283565.17614" 
    capture_lex $P322
    .const 'Sub' $P314 = "42_1256283565.17614" 
    capture_lex $P314
    .const 'Sub' $P306 = "41_1256283565.17614" 
    capture_lex $P306
    .const 'Sub' $P300 = "40_1256283565.17614" 
    capture_lex $P300
    .const 'Sub' $P267 = "37_1256283565.17614" 
    capture_lex $P267
    .const 'Sub' $P255 = "36_1256283565.17614" 
    capture_lex $P255
    .const 'Sub' $P247 = "35_1256283565.17614" 
    capture_lex $P247
    .const 'Sub' $P239 = "34_1256283565.17614" 
    capture_lex $P239
    .const 'Sub' $P231 = "33_1256283565.17614" 
    capture_lex $P231
    .const 'Sub' $P223 = "32_1256283565.17614" 
    capture_lex $P223
    .const 'Sub' $P215 = "31_1256283565.17614" 
    capture_lex $P215
    .const 'Sub' $P162 = "27_1256283565.17614" 
    capture_lex $P162
    .const 'Sub' $P153 = "26_1256283565.17614" 
    capture_lex $P153
    .const 'Sub' $P145 = "25_1256283565.17614" 
    capture_lex $P145
    .const 'Sub' $P137 = "24_1256283565.17614" 
    capture_lex $P137
    .const 'Sub' $P130 = "23_1256283565.17614" 
    capture_lex $P130
    .const 'Sub' $P122 = "22_1256283565.17614" 
    capture_lex $P122
    .const 'Sub' $P115 = "21_1256283565.17614" 
    capture_lex $P115
    .const 'Sub' $P66 = "18_1256283565.17614" 
    capture_lex $P66
    .const 'Sub' $P58 = "17_1256283565.17614" 
    capture_lex $P58
    .const 'Sub' $P51 = "16_1256283565.17614" 
    capture_lex $P51
    .const 'Sub' $P43 = "15_1256283565.17614" 
    capture_lex $P43
    .const 'Sub' $P36 = "14_1256283565.17614" 
    capture_lex $P36
    .const 'Sub' $P15 = "12_1256283565.17614" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P433 = "53_1256283565.17614" 
    capture_lex $P433
    .return ($P433)
.end


.namespace ["Testcase"]
.sub "_ONLOAD"  :subid("12_1256283565.17614") :outer("11_1256283565.17614")
    .const 'Sub' $P21 = "13_1256283565.17614" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_54
    new $P19, "Undef"
  vivify_54:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256283565.17614" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["ConfigFile"], "_ONLOAD"
    $P25()
    get_hll_global $P26, "Registry"
    unless_null $P26, vivify_55
    new $P26, "Hash"
  vivify_55:
    set $P27, $P26["CONFIG"]
    unless_null $P27, vivify_56
    new $P27, "Undef"
  vivify_56:
    $P27."file"("kakapo.cfg")
    get_hll_global $P28, ["Parrot"], "IMPORT"
    $P28("Dumper")
    get_hll_global $P29, ["Parrot"], "IMPORT"
    $P29("Matcher::Factory")
    new $P30, "String"
    assign $P30, "Testcase"
    .lex "$class_name", $P30
    find_lex $P31, "$class_name"
    unless_null $P31, vivify_57
    new $P31, "Undef"
  vivify_57:
    "NOTE"("Creating class ", $P31)
    get_hll_global $P32, ["Class"], "SUBCLASS"
    find_lex $P33, "$class_name"
    unless_null $P33, vivify_58
    new $P33, "Undef"
  vivify_58:
    $P32($P33, "Class::HashBased")
    $P34 = "NOTE"("done")
    .return ($P34)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P35, exception, "payload"
    .return ($P35)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "_block20"  :anon :subid("13_1256283565.17614") :outer("12_1256283565.17614")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Testcase"]
.sub "after_methods"  :subid("14_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_39 :slurpy
    new $P38, 'ExceptionHandler'
    set_addr $P38, control_37
    $P38."handle_types"(58)
    push_eh $P38
    .lex "self", self
    .lex "@value", param_39
    find_lex $P40, "self"
    $P41 = $P40."_ATTR_SETBY"("after_methods", "fetch_after_methods")
    .return ($P41)
  control_37:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P42, exception, "payload"
    .return ($P42)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "after_prefix"  :subid("15_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_46 :slurpy
    new $P45, 'ExceptionHandler'
    set_addr $P45, control_44
    $P45."handle_types"(58)
    push_eh $P45
    .lex "self", self
    .lex "@value", param_46
    find_lex $P47, "self"
    find_lex $P48, "@value"
    unless_null $P48, vivify_59
    new $P48, "ResizablePMCArray"
  vivify_59:
    $P49 = $P47."_ATTR_DEFAULT"("after_prefix", $P48, "after_")
    .return ($P49)
  control_44:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P50, exception, "payload"
    .return ($P50)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "afterall_methods"  :subid("16_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_54 :slurpy
    new $P53, 'ExceptionHandler'
    set_addr $P53, control_52
    $P53."handle_types"(58)
    push_eh $P53
    .lex "self", self
    .lex "@value", param_54
    find_lex $P55, "self"
    $P56 = $P55."_ATTR_SETBY"("afterall_methods", "fetch_afterall_methods")
    .return ($P56)
  control_52:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P57, exception, "payload"
    .return ($P57)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "afterall_prefix"  :subid("17_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_61 :slurpy
    new $P60, 'ExceptionHandler'
    set_addr $P60, control_59
    $P60."handle_types"(58)
    push_eh $P60
    .lex "self", self
    .lex "@value", param_61
    find_lex $P62, "self"
    find_lex $P63, "@value"
    unless_null $P63, vivify_60
    new $P63, "ResizablePMCArray"
  vivify_60:
    $P64 = $P62."_ATTR_DEFAULT"("afterall_prefix", $P63, "afterall_")
    .return ($P64)
  control_59:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P65, exception, "payload"
    .return ($P65)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "assert_that"  :subid("18_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_69
    .param pmc param_70 :slurpy
    .const 'Sub' $P97 = "20_1256283565.17614" 
    capture_lex $P97
    .const 'Sub' $P78 = "19_1256283565.17614" 
    capture_lex $P78
    new $P68, 'ExceptionHandler'
    set_addr $P68, control_67
    $P68."handle_types"(58)
    push_eh $P68
    .lex "self", self
    .lex "$item_desc", param_69
    .lex "@item", param_70
    find_lex $P72, "@item"
    unless_null $P72, vivify_61
    new $P72, "ResizablePMCArray"
  vivify_61:
    set $N73, $P72
    new $P74, "Integer"
    assign $P74, 2
    set $N75, $P74
    iseq $I76, $N73, $N75
    if $I76, unless_71_end
    .const 'Sub' $P78 = "19_1256283565.17614" 
    capture_lex $P78
    $P78()
  unless_71_end:
    find_lex $P81, "@item"
    unless_null $P81, vivify_62
    new $P81, "ResizablePMCArray"
  vivify_62:
    set $P82, $P81[1]
    unless_null $P82, vivify_63
    new $P82, "Undef"
  vivify_63:
    .lex "$matcher", $P82
    find_lex $P83, "$matcher"
    unless_null $P83, vivify_64
    new $P83, "Undef"
  vivify_64:
    find_lex $P84, "$item_desc"
    unless_null $P84, vivify_65
    new $P84, "Undef"
  vivify_65:
    concat $P85, $P84, " "
    $P86 = $P83."describe_self"($P85)
    .lex "$description", $P86
    find_lex $P87, "$matcher"
    unless_null $P87, vivify_66
    new $P87, "Undef"
  vivify_66:
    find_lex $P88, "@item"
    unless_null $P88, vivify_67
    new $P88, "ResizablePMCArray"
  vivify_67:
    set $P89, $P88[0]
    unless_null $P89, vivify_68
    new $P89, "Undef"
  vivify_68:
    $P90 = $P87."matches"($P89)
    .lex "$result", $P90
    find_lex $P91, "self"
    find_lex $P92, "$result"
    unless_null $P92, vivify_69
    new $P92, "Undef"
  vivify_69:
    find_lex $P93, "$description"
    unless_null $P93, vivify_70
    new $P93, "Undef"
  vivify_70:
    $P91."ok"($P92, $P93)
    find_lex $P95, "$result"
    unless_null $P95, vivify_71
    new $P95, "Undef"
  vivify_71:
    if $P95, unless_94_end
    .const 'Sub' $P97 = "20_1256283565.17614" 
    capture_lex $P97
    $P97()
  unless_94_end:
    new $P112, "Exception"
    set $P112['type'], 58
    find_lex $P113, "$result"
    unless_null $P113, vivify_78
    new $P113, "Undef"
  vivify_78:
    setattribute $P112, 'payload', $P113
    throw $P112
    .return ()
  control_67:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "_block77"  :anon :subid("19_1256283565.17614") :outer("18_1256283565.17614")
    get_hll_global $P79, ["Parrot"], "die"
    $P80 = $P79("You must provide 3 args: $item_desc, $item, $matcher")
    .return ($P80)
.end


.namespace ["Testcase"]
.sub "_block96"  :anon :subid("20_1256283565.17614") :outer("18_1256283565.17614")
    find_lex $P98, "$matcher"
    unless_null $P98, vivify_72
    new $P98, "Undef"
  vivify_72:
    new $P99, "String"
    assign $P99, "Expected: "
    find_lex $P100, "$item_desc"
    unless_null $P100, vivify_73
    new $P100, "Undef"
  vivify_73:
    concat $P101, $P99, $P100
    concat $P102, $P101, " "
    $P103 = $P98."describe_self"($P102)
    find_lex $P104, "$matcher"
    unless_null $P104, vivify_74
    new $P104, "Undef"
  vivify_74:
    find_lex $P105, "@item"
    unless_null $P105, vivify_75
    new $P105, "ResizablePMCArray"
  vivify_75:
    set $P106, $P105[0]
    unless_null $P106, vivify_76
    new $P106, "Undef"
  vivify_76:
    $S107 = $P104."describe_failure"($P106, "\n     but: ")
    concat $P108, $P103, $S107
    .lex "$explain", $P108
    find_lex $P109, "self"
    find_lex $P110, "$explain"
    unless_null $P110, vivify_77
    new $P110, "Undef"
  vivify_77:
    $P111 = $P109."emit"($P110)
    .return ($P111)
.end


.namespace ["Testcase"]
.sub "before_methods"  :subid("21_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_118 :slurpy
    new $P117, 'ExceptionHandler'
    set_addr $P117, control_116
    $P117."handle_types"(58)
    push_eh $P117
    .lex "self", self
    .lex "@value", param_118
    find_lex $P119, "self"
    $P120 = $P119."_ATTR_SETBY"("before_methods", "fetch_before_methods")
    .return ($P120)
  control_116:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, "payload"
    .return ($P121)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "before_prefix"  :subid("22_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_125 :slurpy
    new $P124, 'ExceptionHandler'
    set_addr $P124, control_123
    $P124."handle_types"(58)
    push_eh $P124
    .lex "self", self
    .lex "@value", param_125
    find_lex $P126, "self"
    find_lex $P127, "@value"
    unless_null $P127, vivify_79
    new $P127, "ResizablePMCArray"
  vivify_79:
    $P128 = $P126."_ATTR_DEFAULT"("before_prefix", $P127, "before_")
    .return ($P128)
  control_123:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P129, exception, "payload"
    .return ($P129)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "beforeall_methods"  :subid("23_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_133 :slurpy
    new $P132, 'ExceptionHandler'
    set_addr $P132, control_131
    $P132."handle_types"(58)
    push_eh $P132
    .lex "self", self
    .lex "@value", param_133
    find_lex $P134, "self"
    $P135 = $P134."_ATTR_SETBY"("beforeall_methods", "fetch_beforeall_methods")
    .return ($P135)
  control_131:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P136, exception, "payload"
    .return ($P136)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "beforeall_prefix"  :subid("24_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_140 :slurpy
    new $P139, 'ExceptionHandler'
    set_addr $P139, control_138
    $P139."handle_types"(58)
    push_eh $P139
    .lex "self", self
    .lex "@value", param_140
    find_lex $P141, "self"
    find_lex $P142, "@value"
    unless_null $P142, vivify_80
    new $P142, "ResizablePMCArray"
  vivify_80:
    $P143 = $P141."_ATTR_DEFAULT"("beforeall_prefix", $P142, "beforeall_")
    .return ($P143)
  control_138:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P144, exception, "payload"
    .return ($P144)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "emit"  :subid("25_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_148 :slurpy
    new $P147, 'ExceptionHandler'
    set_addr $P147, control_146
    $P147."handle_types"(58)
    push_eh $P147
    .lex "self", self
    .lex "@parts", param_148
    find_lex $P149, "@parts"
    unless_null $P149, vivify_81
    new $P149, "ResizablePMCArray"
  vivify_81:
    $P150 = $P149."join"()
    $P151 = "say"($P150)
    .return ($P151)
  control_146:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P152, exception, "payload"
    .return ($P152)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "note"  :subid("26_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_156 :slurpy
    new $P155, 'ExceptionHandler'
    set_addr $P155, control_154
    $P155."handle_types"(58)
    push_eh $P155
    .lex "self", self
    .lex "@message", param_156
    find_lex $P157, "self"
    find_lex $P158, "@message"
    unless_null $P158, vivify_82
    new $P158, "ResizablePMCArray"
  vivify_82:
    $P159 = $P158."join"()
    $P160 = $P157."emit"("#\n", "# NOTE: ", $P159, "\n", "#")
    .return ($P160)
  control_154:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P161, exception, "payload"
    .return ($P161)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "fetch_methods"  :subid("27_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_165 :optional :named("starting_with")
    .param int has_param_165 :opt_flag
    .const 'Sub' $P174 = "28_1256283565.17614" 
    capture_lex $P174
    new $P164, 'ExceptionHandler'
    set_addr $P164, control_163
    $P164."handle_types"(58)
    push_eh $P164
    .lex "self", self
    if has_param_165, optparam_83
    new $P166, "Undef"
    set param_165, $P166
  optparam_83:
    .lex "$starting_with", param_165
    find_lex $P167, "$starting_with"
    unless_null $P167, vivify_84
    new $P167, "Undef"
  vivify_84:
    "NOTE"("Fetching methods starting with: ", $P167)
    get_hll_global $P168, ["Class"], "get_method_list"
    find_lex $P169, "self"
    $P170 = $P168($P169)
    .lex "@list", $P170
    find_lex $P172, "$starting_with"
    unless_null $P172, vivify_85
    new $P172, "Undef"
  vivify_85:
    unless $P172, if_171_end
    .const 'Sub' $P174 = "28_1256283565.17614" 
    capture_lex $P174
    $P174()
  if_171_end:
    find_lex $P207, "@list"
    unless_null $P207, vivify_96
    new $P207, "ResizablePMCArray"
  vivify_96:
    set $N208, $P207
    find_lex $P209, "@list"
    unless_null $P209, vivify_97
    new $P209, "ResizablePMCArray"
  vivify_97:
    $P210 = $P209."join"(", ")
    "NOTE"("Got ", $N208, " methods: ", $P210)
    find_lex $P211, "@list"
    unless_null $P211, vivify_98
    new $P211, "ResizablePMCArray"
  vivify_98:
    "DUMP"($P211)
    new $P212, "Exception"
    set $P212['type'], 58
    find_lex $P213, "@list"
    unless_null $P213, vivify_99
    new $P213, "ResizablePMCArray"
  vivify_99:
    setattribute $P212, 'payload', $P213
    throw $P212
    .return ()
  control_163:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P214, exception, "payload"
    .return ($P214)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "_block173"  :anon :subid("28_1256283565.17614") :outer("27_1256283565.17614")
    .const 'Sub' $P184 = "29_1256283565.17614" 
    capture_lex $P184
    new $P175, "ResizablePMCArray"
    .lex "@matches", $P175
    get_hll_global $P176, ["String"], "length"
    find_lex $P177, "$starting_with"
    unless_null $P177, vivify_86
    new $P177, "Undef"
  vivify_86:
    $P178 = $P176($P177)
    .lex "$length", $P178
    find_lex $P180, "@list"
    unless_null $P180, vivify_87
    new $P180, "ResizablePMCArray"
  vivify_87:
    defined $I181, $P180
    unless $I181, for_undef_88
    iter $P179, $P180
    new $P204, 'ExceptionHandler'
    set_addr $P204, loop203_handler
    $P204."handle_types"(65, 67, 66)
    push_eh $P204
  loop203_test:
    unless $P179, loop203_done
    shift $P182, $P179
  loop203_redo:
    .const 'Sub' $P184 = "29_1256283565.17614" 
    capture_lex $P184
    $P184($P182)
  loop203_next:
    goto loop203_test
  loop203_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P205, exception, 'type'
    eq $P205, 65, loop203_next
    eq $P205, 67, loop203_redo
  loop203_done:
    pop_eh 
  for_undef_88:
    find_lex $P206, "@matches"
    unless_null $P206, vivify_95
    new $P206, "ResizablePMCArray"
  vivify_95:
    store_lex "@list", $P206
    .return ($P206)
.end


.namespace ["Testcase"]
.sub "_block183"  :anon :subid("29_1256283565.17614") :outer("28_1256283565.17614")
    .param pmc param_185
    .const 'Sub' $P198 = "30_1256283565.17614" 
    capture_lex $P198
    .lex "$_", param_185
    find_lex $P186, "$_"
    unless_null $P186, vivify_89
    new $P186, "Undef"
  vivify_89:
    set $S187, $P186
    new $P188, 'String'
    set $P188, $S187
    .lex "$method", $P188
    find_lex $P191, "$method"
    unless_null $P191, vivify_90
    new $P191, "Undef"
  vivify_90:
    find_lex $P192, "$length"
    unless_null $P192, vivify_91
    new $P192, "Undef"
  vivify_91:
    $S193 = $P191."substr"(0, $P192)
    find_lex $P194, "$starting_with"
    unless_null $P194, vivify_92
    new $P194, "Undef"
  vivify_92:
    set $S195, $P194
    iseq $I196, $S193, $S195
    if $I196, if_190
    new $P189, 'Integer'
    set $P189, $I196
    goto if_190_end
  if_190:
    .const 'Sub' $P198 = "30_1256283565.17614" 
    capture_lex $P198
    $P202 = $P198()
    set $P189, $P202
  if_190_end:
    .return ($P189)
.end


.namespace ["Testcase"]
.sub "_block197"  :anon :subid("30_1256283565.17614") :outer("29_1256283565.17614")
    find_lex $P199, "@matches"
    unless_null $P199, vivify_93
    new $P199, "ResizablePMCArray"
  vivify_93:
    find_lex $P200, "$method"
    unless_null $P200, vivify_94
    new $P200, "Undef"
  vivify_94:
    $P201 = $P199."push"($P200)
    .return ($P201)
.end


.namespace ["Testcase"]
.sub "fetch_after_methods"  :subid("31_1256283565.17614") :method :outer("11_1256283565.17614")
    new $P217, 'ExceptionHandler'
    set_addr $P217, control_216
    $P217."handle_types"(58)
    push_eh $P217
    .lex "self", self
    find_lex $P218, "self"
    find_lex $P219, "self"
    $P220 = $P219."after_prefix"()
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
.sub "fetch_afterall_methods"  :subid("32_1256283565.17614") :method :outer("11_1256283565.17614")
    new $P225, 'ExceptionHandler'
    set_addr $P225, control_224
    $P225."handle_types"(58)
    push_eh $P225
    .lex "self", self
    find_lex $P226, "self"
    find_lex $P227, "self"
    $P228 = $P227."afterall_prefix"()
    $P229 = $P226."fetch_methods"($P228 :named("starting_with"))
    .return ($P229)
  control_224:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P230, exception, "payload"
    .return ($P230)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "fetch_before_methods"  :subid("33_1256283565.17614") :method :outer("11_1256283565.17614")
    new $P233, 'ExceptionHandler'
    set_addr $P233, control_232
    $P233."handle_types"(58)
    push_eh $P233
    .lex "self", self
    find_lex $P234, "self"
    find_lex $P235, "self"
    $P236 = $P235."before_prefix"()
    $P237 = $P234."fetch_methods"($P236 :named("starting_with"))
    .return ($P237)
  control_232:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P238, exception, "payload"
    .return ($P238)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "fetch_beforeall_methods"  :subid("34_1256283565.17614") :method :outer("11_1256283565.17614")
    new $P241, 'ExceptionHandler'
    set_addr $P241, control_240
    $P241."handle_types"(58)
    push_eh $P241
    .lex "self", self
    find_lex $P242, "self"
    find_lex $P243, "self"
    $P244 = $P243."beforeall_prefix"()
    $P245 = $P242."fetch_methods"($P244 :named("starting_with"))
    .return ($P245)
  control_240:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P246, exception, "payload"
    .return ($P246)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "fetch_test_methods"  :subid("35_1256283565.17614") :method :outer("11_1256283565.17614")
    new $P249, 'ExceptionHandler'
    set_addr $P249, control_248
    $P249."handle_types"(58)
    push_eh $P249
    .lex "self", self
    find_lex $P250, "self"
    find_lex $P251, "self"
    $P252 = $P251."test_prefix"()
    $P253 = $P250."fetch_methods"($P252 :named("starting_with"))
    .return ($P253)
  control_248:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P254, exception, "payload"
    .return ($P254)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "init"  :subid("36_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_258
    .param pmc param_259
    new $P257, 'ExceptionHandler'
    set_addr $P257, control_256
    $P257."handle_types"(58)
    push_eh $P257
    .lex "self", self
    .lex "@children", param_258
    .lex "%attributes", param_259
    get_hll_global $P260, ["Class";"BaseBehavior"], "init"
    find_lex $P261, "self"
    find_lex $P262, "@children"
    unless_null $P262, vivify_100
    new $P262, "ResizablePMCArray"
  vivify_100:
    find_lex $P263, "%attributes"
    unless_null $P263, vivify_101
    new $P263, "Hash"
  vivify_101:
    $P260($P261, $P262, $P263)
    find_lex $P264, "self"
    $P265 = $P264."test_counter"(0)
    .return ($P265)
  control_256:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P266, exception, "payload"
    .return ($P266)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "ok"  :subid("37_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_270
    .param pmc param_271 :optional
    .param int has_param_271 :opt_flag
    .const 'Sub' $P290 = "39_1256283565.17614" 
    capture_lex $P290
    .const 'Sub' $P277 = "38_1256283565.17614" 
    capture_lex $P277
    new $P269, 'ExceptionHandler'
    set_addr $P269, control_268
    $P269."handle_types"(58)
    push_eh $P269
    .lex "self", self
    .lex "$result", param_270
    if has_param_271, optparam_102
    new $P272, "Undef"
    set param_271, $P272
  optparam_102:
    .lex "$note", param_271
    new $P273, "ResizablePMCArray"
    .lex "@output", $P273
    find_lex $P275, "$result"
    unless_null $P275, vivify_103
    new $P275, "Undef"
  vivify_103:
    if $P275, unless_274_end
    .const 'Sub' $P277 = "38_1256283565.17614" 
    capture_lex $P277
    $P277()
  unless_274_end:
    find_lex $P280, "@output"
    unless_null $P280, vivify_105
    new $P280, "ResizablePMCArray"
  vivify_105:
    $P280."push"("ok")
    find_lex $P281, "self"
    $P282 = $P281."test_counter"()
        ##  inline postfix:++
        clone $P283, $P282
        inc $P282
    find_lex $P284, "@output"
    unless_null $P284, vivify_106
    new $P284, "ResizablePMCArray"
  vivify_106:
    find_lex $P285, "self"
    $P286 = $P285."test_counter"()
    $P284."push"($P286)
    find_lex $P288, "$note"
    unless_null $P288, vivify_107
    new $P288, "Undef"
  vivify_107:
    unless $P288, if_287_end
    .const 'Sub' $P290 = "39_1256283565.17614" 
    capture_lex $P290
    $P290()
  if_287_end:
    find_lex $P295, "self"
    find_lex $P296, "@output"
    unless_null $P296, vivify_111
    new $P296, "ResizablePMCArray"
  vivify_111:
    $P297 = $P296."join"(" ")
    $P298 = $P295."emit"($P297)
    .return ($P298)
  control_268:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P299, exception, "payload"
    .return ($P299)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "_block276"  :anon :subid("38_1256283565.17614") :outer("37_1256283565.17614")
    find_lex $P278, "@output"
    unless_null $P278, vivify_104
    new $P278, "ResizablePMCArray"
  vivify_104:
    $P279 = $P278."push"("not")
    .return ($P279)
.end


.namespace ["Testcase"]
.sub "_block289"  :anon :subid("39_1256283565.17614") :outer("37_1256283565.17614")
    find_lex $P291, "@output"
    unless_null $P291, vivify_108
    new $P291, "ResizablePMCArray"
  vivify_108:
    $P291."push"("-")
    find_lex $P292, "@output"
    unless_null $P292, vivify_109
    new $P292, "ResizablePMCArray"
  vivify_109:
    find_lex $P293, "$note"
    unless_null $P293, vivify_110
    new $P293, "Undef"
  vivify_110:
    $P294 = $P292."push"($P293)
    .return ($P294)
.end


.namespace ["Testcase"]
.sub "run_all_tests"  :subid("40_1256283565.17614") :method :outer("11_1256283565.17614")
    new $P302, 'ExceptionHandler'
    set_addr $P302, control_301
    $P302."handle_types"(58)
    push_eh $P302
    .lex "self", self
    find_lex $P303, "self"
    $P304 = $P303."run_tests"()
    .return ($P304)
  control_301:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P305, exception, "payload"
    .return ($P305)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "run_after_methods"  :subid("41_1256283565.17614") :method :outer("11_1256283565.17614")
    new $P308, 'ExceptionHandler'
    set_addr $P308, control_307
    $P308."handle_types"(58)
    push_eh $P308
    .lex "self", self
    find_lex $P309, "self"
    find_lex $P310, "self"
    $P311 = $P310."after_methods"()
    $P312 = $P309."run_methods"($P311)
    .return ($P312)
  control_307:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P313, exception, "payload"
    .return ($P313)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "run_afterall_methods"  :subid("42_1256283565.17614") :method :outer("11_1256283565.17614")
    new $P316, 'ExceptionHandler'
    set_addr $P316, control_315
    $P316."handle_types"(58)
    push_eh $P316
    .lex "self", self
    find_lex $P317, "self"
    find_lex $P318, "self"
    $P319 = $P318."afterall_methods"()
    $P320 = $P317."run_methods"($P319)
    .return ($P320)
  control_315:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P321, exception, "payload"
    .return ($P321)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "run_before_methods"  :subid("43_1256283565.17614") :method :outer("11_1256283565.17614")
    new $P324, 'ExceptionHandler'
    set_addr $P324, control_323
    $P324."handle_types"(58)
    push_eh $P324
    .lex "self", self
    find_lex $P325, "self"
    find_lex $P326, "self"
    $P327 = $P326."before_methods"()
    $P328 = $P325."run_methods"($P327)
    .return ($P328)
  control_323:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P329, exception, "payload"
    .return ($P329)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "run_beforeall_methods"  :subid("44_1256283565.17614") :method :outer("11_1256283565.17614")
    new $P332, 'ExceptionHandler'
    set_addr $P332, control_331
    $P332."handle_types"(58)
    push_eh $P332
    .lex "self", self
    find_lex $P333, "self"
    find_lex $P334, "self"
    $P335 = $P334."beforeall_methods"()
    $P336 = $P333."run_methods"($P335)
    .return ($P336)
  control_331:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P337, exception, "payload"
    .return ($P337)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "run_methods"  :subid("45_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_341
    .param pmc param_342 :slurpy
    .param pmc param_343 :slurpy :named
    .const 'Sub' $P351 = "46_1256283565.17614" 
    capture_lex $P351
    new $P340, 'ExceptionHandler'
    set_addr $P340, control_339
    $P340."handle_types"(58)
    push_eh $P340
    .lex "self", self
    .lex "@methods", param_341
    .lex "@args", param_342
    .lex "%opts", param_343
    find_lex $P344, "@methods"
    unless_null $P344, vivify_112
    new $P344, "ResizablePMCArray"
  vivify_112:
    set $N345, $P344
    "NOTE"("Running ", $N345, " methods")
    find_lex $P347, "@methods"
    unless_null $P347, vivify_113
    new $P347, "ResizablePMCArray"
  vivify_113:
    defined $I348, $P347
    unless $I348, for_undef_114
    iter $P346, $P347
    new $P362, 'ExceptionHandler'
    set_addr $P362, loop361_handler
    $P362."handle_types"(65, 67, 66)
    push_eh $P362
  loop361_test:
    unless $P346, loop361_done
    shift $P349, $P346
  loop361_redo:
    .const 'Sub' $P351 = "46_1256283565.17614" 
    capture_lex $P351
    $P351($P349)
  loop361_next:
    goto loop361_test
  loop361_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P363, exception, 'type'
    eq $P363, 65, loop361_next
    eq $P363, 67, loop361_redo
  loop361_done:
    pop_eh 
  for_undef_114:
    $P364 = "NOTE"("done")
    .return ($P364)
  control_339:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P365, exception, "payload"
    .return ($P365)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "_block350"  :anon :subid("46_1256283565.17614") :outer("45_1256283565.17614")
    .param pmc param_352
    .lex "$_", param_352
    find_lex $P353, "$_"
    unless_null $P353, vivify_115
    new $P353, "Undef"
  vivify_115:
    "NOTE"("Running method: ", $P353)
    get_hll_global $P354, ["Class"], "call_method_"
    find_lex $P355, "self"
    find_lex $P356, "$_"
    unless_null $P356, vivify_116
    new $P356, "Undef"
  vivify_116:
    set $S357, $P356
    find_lex $P358, "@args"
    unless_null $P358, vivify_117
    new $P358, "ResizablePMCArray"
  vivify_117:
    find_lex $P359, "%opts"
    unless_null $P359, vivify_118
    new $P359, "Hash"
  vivify_118:
    $P360 = $P354($P355, $S357, $P358, $P359)
    .return ($P360)
.end


.namespace ["Testcase"]
.sub "run_test"  :subid("47_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_369
    .param pmc param_370 :optional :named("after_prefix")
    .param int has_param_370 :opt_flag
    .param pmc param_372 :optional :named("before_prefix")
    .param int has_param_372 :opt_flag
    new $P368, 'ExceptionHandler'
    set_addr $P368, control_367
    $P368."handle_types"(58)
    push_eh $P368
    .lex "self", self
    .lex "$method_name", param_369
    if has_param_370, optparam_119
    new $P371, "Undef"
    set param_370, $P371
  optparam_119:
    .lex "$after_prefix", param_370
    if has_param_372, optparam_120
    new $P373, "Undef"
    set param_372, $P373
  optparam_120:
    .lex "$before_prefix", param_372
    find_lex $P374, "self"
    $P374."run_before_methods"()
    get_hll_global $P375, ["Class"], "call_method"
    find_lex $P376, "self"
    find_lex $P377, "$method_name"
    unless_null $P377, vivify_121
    new $P377, "Undef"
  vivify_121:
    $P375($P376, $P377)
    find_lex $P378, "self"
    $P379 = $P378."run_after_methods"()
    .return ($P379)
  control_367:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P380, exception, "payload"
    .return ($P380)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "run_tests"  :subid("48_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_384 :slurpy
    .const 'Sub' $P401 = "50_1256283565.17614" 
    capture_lex $P401
    .const 'Sub' $P391 = "49_1256283565.17614" 
    capture_lex $P391
    new $P383, 'ExceptionHandler'
    set_addr $P383, control_382
    $P383."handle_types"(58)
    push_eh $P383
    .lex "self", self
    .lex "@names", param_384
    "NOTE"("Creating new testcase")
    find_lex $P385, "self"
    $P386 = $P385."new"()
    .lex "$testcase", $P386
    "NOTE"("Running 'beforeall' methods")
    find_lex $P387, "$testcase"
    unless_null $P387, vivify_122
    new $P387, "Undef"
  vivify_122:
    $P387."run_beforeall_methods"()
    find_lex $P389, "@names"
    unless_null $P389, vivify_123
    new $P389, "ResizablePMCArray"
  vivify_123:
    if $P389, unless_388_end
    .const 'Sub' $P391 = "49_1256283565.17614" 
    capture_lex $P391
    $P391()
  unless_388_end:
    find_lex $P394, "@names"
    unless_null $P394, vivify_125
    new $P394, "ResizablePMCArray"
  vivify_125:
    set $N395, $P394
    "NOTE"("Got ", $N395, " tests to run.")
    find_lex $P397, "@names"
    unless_null $P397, vivify_126
    new $P397, "ResizablePMCArray"
  vivify_126:
    defined $I398, $P397
    unless $I398, for_undef_127
    iter $P396, $P397
    new $P414, 'ExceptionHandler'
    set_addr $P414, loop413_handler
    $P414."handle_types"(65, 67, 66)
    push_eh $P414
  loop413_test:
    unless $P396, loop413_done
    shift $P399, $P396
  loop413_redo:
    .const 'Sub' $P401 = "50_1256283565.17614" 
    capture_lex $P401
    $P401($P399)
  loop413_next:
    goto loop413_test
  loop413_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P415, exception, 'type'
    eq $P415, 65, loop413_next
    eq $P415, 67, loop413_redo
  loop413_done:
    pop_eh 
  for_undef_127:
    "NOTE"("Done with tests. Running 'afterall' methods")
    find_lex $P416, "$testcase"
    unless_null $P416, vivify_134
    new $P416, "Undef"
  vivify_134:
    $P417 = $P416."run_afterall_methods"()
    .return ($P417)
  control_382:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P418, exception, "payload"
    .return ($P418)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "_block390"  :anon :subid("49_1256283565.17614") :outer("48_1256283565.17614")
    "NOTE"("No test list specified. Running all tests.")
    find_lex $P392, "$testcase"
    unless_null $P392, vivify_124
    new $P392, "Undef"
  vivify_124:
    $P393 = $P392."fetch_test_methods"()
    store_lex "@names", $P393
    .return ($P393)
.end


.namespace ["Testcase"]
.sub "_block400"  :anon :subid("50_1256283565.17614") :outer("48_1256283565.17614")
    .param pmc param_402
    .lex "$_", param_402
    find_lex $P403, "$_"
    unless_null $P403, vivify_128
    new $P403, "Undef"
  vivify_128:
    set $S404, $P403
    new $P405, 'String'
    set $P405, $S404
    .lex "$method", $P405
    "NOTE"("Running 'before' methods")
    find_lex $P406, "$testcase"
    unless_null $P406, vivify_129
    new $P406, "Undef"
  vivify_129:
    $P406."run_before_methods"()
    find_lex $P407, "$method"
    unless_null $P407, vivify_130
    new $P407, "Undef"
  vivify_130:
    "NOTE"("Running test: ", $P407)
    get_hll_global $P408, ["Class"], "call_method"
    find_lex $P409, "$testcase"
    unless_null $P409, vivify_131
    new $P409, "Undef"
  vivify_131:
    find_lex $P410, "$method"
    unless_null $P410, vivify_132
    new $P410, "Undef"
  vivify_132:
    $P408($P409, $P410)
    "NOTE"("Running 'after' methods")
    find_lex $P411, "$testcase"
    unless_null $P411, vivify_133
    new $P411, "Undef"
  vivify_133:
    $P412 = $P411."run_after_methods"()
    .return ($P412)
.end


.namespace ["Testcase"]
.sub "test_counter"  :subid("51_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_422 :slurpy
    new $P421, 'ExceptionHandler'
    set_addr $P421, control_420
    $P421."handle_types"(58)
    push_eh $P421
    .lex "self", self
    .lex "@value", param_422
    find_lex $P423, "self"
    find_lex $P424, "@value"
    unless_null $P424, vivify_135
    new $P424, "ResizablePMCArray"
  vivify_135:
    $P425 = $P423."_ATTR_CONST"("test_counter", $P424)
    .return ($P425)
  control_420:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P426, exception, "payload"
    .return ($P426)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "test_methods"  :subid("52_1256283565.17614") :method :outer("11_1256283565.17614")
    new $P429, 'ExceptionHandler'
    set_addr $P429, control_428
    $P429."handle_types"(58)
    push_eh $P429
    .lex "self", self
    find_lex $P430, "self"
    $P431 = $P430."_ATTR_SETBY"("test_methods", "fetch_test_methods")
    .return ($P431)
  control_428:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P432, exception, "payload"
    .return ($P432)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "test_prefix"  :subid("53_1256283565.17614") :method :outer("11_1256283565.17614")
    .param pmc param_436 :slurpy
    new $P435, 'ExceptionHandler'
    set_addr $P435, control_434
    $P435."handle_types"(58)
    push_eh $P435
    .lex "self", self
    .lex "@value", param_436
    find_lex $P437, "self"
    find_lex $P438, "@value"
    unless_null $P438, vivify_136
    new $P438, "ResizablePMCArray"
  vivify_136:
    $P439 = $P437."_ATTR_DEFAULT"("test_prefix", $P438, "test_")
    .return ($P439)
  control_434:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P440, exception, "payload"
    .return ($P440)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256295826.5711")
    get_hll_global $P14, ["Matcher";"AllOf"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"AllOf"]
.sub "_block13" :init :load :subid("11_1256295826.5711")
    .const 'Sub' $P98 = "21_1256295826.5711" 
    capture_lex $P98
    .const 'Sub' $P70 = "18_1256295826.5711" 
    capture_lex $P70
    .const 'Sub' $P57 = "17_1256295826.5711" 
    capture_lex $P57
    .const 'Sub' $P49 = "16_1256295826.5711" 
    capture_lex $P49
    .const 'Sub' $P41 = "15_1256295826.5711" 
    capture_lex $P41
    .const 'Sub' $P32 = "14_1256295826.5711" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1256295826.5711" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P98 = "21_1256295826.5711" 
    capture_lex $P98
    .return ($P98)
.end


.namespace ["Matcher";"AllOf"]
.sub "_ONLOAD"  :subid("12_1256295826.5711") :outer("11_1256295826.5711")
    .const 'Sub' $P21 = "13_1256295826.5711" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_22
    new $P19, "Undef"
  vivify_22:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256295826.5711" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    new $P26, "String"
    assign $P26, "Matcher::AllOf"
    .lex "$class_name", $P26
    find_lex $P27, "$class_name"
    unless_null $P27, vivify_23
    new $P27, "Undef"
  vivify_23:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_24
    new $P29, "Undef"
  vivify_24:
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


.namespace ["Matcher";"AllOf"]
.sub "_block20"  :anon :subid("13_1256295826.5711") :outer("12_1256295826.5711")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"AllOf"]
.sub "describe_failure"  :subid("14_1256295826.5711") :method :outer("11_1256295826.5711")
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
    unless_null $P38, vivify_25
    new $P38, "Undef"
  vivify_25:
    concat $P39, $P38, "FIXME: What to put here? (allof)"
    setattribute $P37, 'payload', $P39
    throw $P37
    .return ()
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P40, exception, "payload"
    .return ($P40)
    rethrow exception
.end


.namespace ["Matcher";"AllOf"]
.sub "describe_self"  :subid("15_1256295826.5711") :method :outer("11_1256295826.5711")
    .param pmc param_44
    new $P43, 'ExceptionHandler'
    set_addr $P43, control_42
    $P43."handle_types"(58)
    push_eh $P43
    .lex "self", self
    .lex "$description", param_44
    new $P45, "Exception"
    set $P45['type'], 58
    find_lex $P46, "$description"
    unless_null $P46, vivify_26
    new $P46, "Undef"
  vivify_26:
    concat $P47, $P46, "FIXME: What to put here? (allof)"
    setattribute $P45, 'payload', $P47
    throw $P45
    .return ()
  control_42:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P48, exception, "payload"
    .return ($P48)
    rethrow exception
.end


.namespace ["Matcher";"AllOf"]
.sub "described_as"  :subid("16_1256295826.5711") :method :outer("11_1256295826.5711")
    .param pmc param_52 :slurpy
    new $P51, 'ExceptionHandler'
    set_addr $P51, control_50
    $P51."handle_types"(58)
    push_eh $P51
    .lex "self", self
    .lex "@value", param_52
    find_lex $P53, "self"
    find_lex $P54, "@value"
    unless_null $P54, vivify_27
    new $P54, "ResizablePMCArray"
  vivify_27:
    $P55 = $P53."_ATTR"("described_as", $P54)
    .return ($P55)
  control_50:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P56, exception, "payload"
    .return ($P56)
    rethrow exception
.end


.namespace ["Matcher";"AllOf"]
.sub "init"  :subid("17_1256295826.5711") :method :outer("11_1256295826.5711")
    .param pmc param_60
    .param pmc param_61
    new $P59, 'ExceptionHandler'
    set_addr $P59, control_58
    $P59."handle_types"(58)
    push_eh $P59
    .lex "self", self
    .lex "@args", param_60
    .lex "%opts", param_61
    get_hll_global $P62, ["Matcher"], "init"
    find_lex $P63, "self"
    find_lex $P64, "@args"
    unless_null $P64, vivify_28
    new $P64, "ResizablePMCArray"
  vivify_28:
    find_lex $P65, "%opts"
    unless_null $P65, vivify_29
    new $P65, "Hash"
  vivify_29:
    $P62($P63, $P64, $P65)
    find_lex $P66, "self"
    find_lex $P67, "@args"
    unless_null $P67, vivify_30
    new $P67, "ResizablePMCArray"
  vivify_30:
    $P68 = $P66."matchers"($P67)
    .return ($P68)
  control_58:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P69, exception, "payload"
    .return ($P69)
    rethrow exception
.end


.namespace ["Matcher";"AllOf"]
.sub "matches"  :subid("18_1256295826.5711") :method :outer("11_1256295826.5711")
    .param pmc param_73
    .const 'Sub' $P80 = "19_1256295826.5711" 
    capture_lex $P80
    new $P72, 'ExceptionHandler'
    set_addr $P72, control_71
    $P72."handle_types"(58)
    push_eh $P72
    .lex "self", self
    .lex "$item", param_73
    find_lex $P75, "self"
    $P76 = $P75."matchers"()
    defined $I77, $P76
    unless $I77, for_undef_31
    iter $P74, $P76
    new $P93, 'ExceptionHandler'
    set_addr $P93, loop92_handler
    $P93."handle_types"(65, 67, 66)
    push_eh $P93
  loop92_test:
    unless $P74, loop92_done
    shift $P78, $P74
  loop92_redo:
    .const 'Sub' $P80 = "19_1256295826.5711" 
    capture_lex $P80
    $P80($P78)
  loop92_next:
    goto loop92_test
  loop92_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P94, exception, 'type'
    eq $P94, 65, loop92_next
    eq $P94, 67, loop92_redo
  loop92_done:
    pop_eh 
  for_undef_31:
    new $P95, "Exception"
    set $P95['type'], 58
    new $P96, "Integer"
    assign $P96, 1
    setattribute $P95, 'payload', $P96
    throw $P95
    .return ()
  control_71:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P97, exception, "payload"
    .return ($P97)
    rethrow exception
.end


.namespace ["Matcher";"AllOf"]
.sub "_block79"  :anon :subid("19_1256295826.5711") :outer("18_1256295826.5711")
    .param pmc param_81
    .const 'Sub' $P88 = "20_1256295826.5711" 
    capture_lex $P88
    .lex "$_", param_81
    find_lex $P84, "$_"
    unless_null $P84, vivify_32
    new $P84, "Undef"
  vivify_32:
    find_lex $P85, "$item"
    unless_null $P85, vivify_33
    new $P85, "Undef"
  vivify_33:
    $P86 = $P84."matches"($P85)
    unless $P86, unless_83
    set $P82, $P86
    goto unless_83_end
  unless_83:
    .const 'Sub' $P88 = "20_1256295826.5711" 
    capture_lex $P88
    $P91 = $P88()
    set $P82, $P91
  unless_83_end:
    .return ($P82)
.end


.namespace ["Matcher";"AllOf"]
.sub "_block87"  :anon :subid("20_1256295826.5711") :outer("19_1256295826.5711")
    new $P89, "Exception"
    set $P89['type'], 58
    new $P90, "Integer"
    assign $P90, 0
    setattribute $P89, 'payload', $P90
    throw $P89
    .return ()
.end


.namespace ["Matcher";"AllOf"]
.sub "matchers"  :subid("21_1256295826.5711") :method :outer("11_1256295826.5711")
    .param pmc param_101 :slurpy
    new $P100, 'ExceptionHandler'
    set_addr $P100, control_99
    $P100."handle_types"(58)
    push_eh $P100
    .lex "self", self
    .lex "@value", param_101
    find_lex $P102, "self"
    find_lex $P103, "@value"
    unless_null $P103, vivify_34
    new $P103, "ResizablePMCArray"
  vivify_34:
    $P104 = $P102."_ATTR"("matchers", $P103)
    .return ($P104)
  control_99:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256295827.89112")
    get_hll_global $P14, ["Matcher";"AnyOne"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"AnyOne"]
.sub "_block13" :init :load :subid("11_1256295827.89112")
    .const 'Sub' $P98 = "21_1256295827.89112" 
    capture_lex $P98
    .const 'Sub' $P70 = "18_1256295827.89112" 
    capture_lex $P70
    .const 'Sub' $P57 = "17_1256295827.89112" 
    capture_lex $P57
    .const 'Sub' $P49 = "16_1256295827.89112" 
    capture_lex $P49
    .const 'Sub' $P41 = "15_1256295827.89112" 
    capture_lex $P41
    .const 'Sub' $P32 = "14_1256295827.89112" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1256295827.89112" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P98 = "21_1256295827.89112" 
    capture_lex $P98
    .return ($P98)
.end


.namespace ["Matcher";"AnyOne"]
.sub "_ONLOAD"  :subid("12_1256295827.89112") :outer("11_1256295827.89112")
    .const 'Sub' $P21 = "13_1256295827.89112" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_22
    new $P19, "Undef"
  vivify_22:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256295827.89112" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    new $P26, "String"
    assign $P26, "Matcher::AnyOne"
    .lex "$class_name", $P26
    find_lex $P27, "$class_name"
    unless_null $P27, vivify_23
    new $P27, "Undef"
  vivify_23:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_24
    new $P29, "Undef"
  vivify_24:
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


.namespace ["Matcher";"AnyOne"]
.sub "_block20"  :anon :subid("13_1256295827.89112") :outer("12_1256295827.89112")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"AnyOne"]
.sub "describe_failure"  :subid("14_1256295827.89112") :method :outer("11_1256295827.89112")
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
    unless_null $P38, vivify_25
    new $P38, "Undef"
  vivify_25:
    concat $P39, $P38, "FIXME: What to put here? (AnyOne)"
    setattribute $P37, 'payload', $P39
    throw $P37
    .return ()
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P40, exception, "payload"
    .return ($P40)
    rethrow exception
.end


.namespace ["Matcher";"AnyOne"]
.sub "describe_self"  :subid("15_1256295827.89112") :method :outer("11_1256295827.89112")
    .param pmc param_44
    new $P43, 'ExceptionHandler'
    set_addr $P43, control_42
    $P43."handle_types"(58)
    push_eh $P43
    .lex "self", self
    .lex "$description", param_44
    new $P45, "Exception"
    set $P45['type'], 58
    find_lex $P46, "$description"
    unless_null $P46, vivify_26
    new $P46, "Undef"
  vivify_26:
    concat $P47, $P46, "FIXME: What to put here? (AnyOne)"
    setattribute $P45, 'payload', $P47
    throw $P45
    .return ()
  control_42:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P48, exception, "payload"
    .return ($P48)
    rethrow exception
.end


.namespace ["Matcher";"AnyOne"]
.sub "described_as"  :subid("16_1256295827.89112") :method :outer("11_1256295827.89112")
    .param pmc param_52 :slurpy
    new $P51, 'ExceptionHandler'
    set_addr $P51, control_50
    $P51."handle_types"(58)
    push_eh $P51
    .lex "self", self
    .lex "@value", param_52
    find_lex $P53, "self"
    find_lex $P54, "@value"
    unless_null $P54, vivify_27
    new $P54, "ResizablePMCArray"
  vivify_27:
    $P55 = $P53."_ATTR"("described_as", $P54)
    .return ($P55)
  control_50:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P56, exception, "payload"
    .return ($P56)
    rethrow exception
.end


.namespace ["Matcher";"AnyOne"]
.sub "init"  :subid("17_1256295827.89112") :method :outer("11_1256295827.89112")
    .param pmc param_60
    .param pmc param_61
    new $P59, 'ExceptionHandler'
    set_addr $P59, control_58
    $P59."handle_types"(58)
    push_eh $P59
    .lex "self", self
    .lex "@args", param_60
    .lex "%opts", param_61
    get_hll_global $P62, ["Matcher"], "init"
    find_lex $P63, "self"
    find_lex $P64, "@args"
    unless_null $P64, vivify_28
    new $P64, "ResizablePMCArray"
  vivify_28:
    find_lex $P65, "%opts"
    unless_null $P65, vivify_29
    new $P65, "Hash"
  vivify_29:
    $P62($P63, $P64, $P65)
    find_lex $P66, "self"
    find_lex $P67, "@args"
    unless_null $P67, vivify_30
    new $P67, "ResizablePMCArray"
  vivify_30:
    $P68 = $P66."matchers"($P67)
    .return ($P68)
  control_58:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P69, exception, "payload"
    .return ($P69)
    rethrow exception
.end


.namespace ["Matcher";"AnyOne"]
.sub "matches"  :subid("18_1256295827.89112") :method :outer("11_1256295827.89112")
    .param pmc param_73
    .const 'Sub' $P80 = "19_1256295827.89112" 
    capture_lex $P80
    new $P72, 'ExceptionHandler'
    set_addr $P72, control_71
    $P72."handle_types"(58)
    push_eh $P72
    .lex "self", self
    .lex "$item", param_73
    find_lex $P75, "self"
    $P76 = $P75."matchers"()
    defined $I77, $P76
    unless $I77, for_undef_31
    iter $P74, $P76
    new $P93, 'ExceptionHandler'
    set_addr $P93, loop92_handler
    $P93."handle_types"(65, 67, 66)
    push_eh $P93
  loop92_test:
    unless $P74, loop92_done
    shift $P78, $P74
  loop92_redo:
    .const 'Sub' $P80 = "19_1256295827.89112" 
    capture_lex $P80
    $P80($P78)
  loop92_next:
    goto loop92_test
  loop92_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P94, exception, 'type'
    eq $P94, 65, loop92_next
    eq $P94, 67, loop92_redo
  loop92_done:
    pop_eh 
  for_undef_31:
    new $P95, "Exception"
    set $P95['type'], 58
    new $P96, "Integer"
    assign $P96, 0
    setattribute $P95, 'payload', $P96
    throw $P95
    .return ()
  control_71:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P97, exception, "payload"
    .return ($P97)
    rethrow exception
.end


.namespace ["Matcher";"AnyOne"]
.sub "_block79"  :anon :subid("19_1256295827.89112") :outer("18_1256295827.89112")
    .param pmc param_81
    .const 'Sub' $P88 = "20_1256295827.89112" 
    capture_lex $P88
    .lex "$_", param_81
    find_lex $P84, "$_"
    unless_null $P84, vivify_32
    new $P84, "Undef"
  vivify_32:
    find_lex $P85, "$item"
    unless_null $P85, vivify_33
    new $P85, "Undef"
  vivify_33:
    $P86 = $P84."matches"($P85)
    if $P86, if_83
    set $P82, $P86
    goto if_83_end
  if_83:
    .const 'Sub' $P88 = "20_1256295827.89112" 
    capture_lex $P88
    $P91 = $P88()
    set $P82, $P91
  if_83_end:
    .return ($P82)
.end


.namespace ["Matcher";"AnyOne"]
.sub "_block87"  :anon :subid("20_1256295827.89112") :outer("19_1256295827.89112")
    new $P89, "Exception"
    set $P89['type'], 58
    new $P90, "Integer"
    assign $P90, 1
    setattribute $P89, 'payload', $P90
    throw $P89
    .return ()
.end


.namespace ["Matcher";"AnyOne"]
.sub "matchers"  :subid("21_1256295827.89112") :method :outer("11_1256295827.89112")
    .param pmc param_101 :slurpy
    new $P100, 'ExceptionHandler'
    set_addr $P100, control_99
    $P100."handle_types"(58)
    push_eh $P100
    .lex "self", self
    .lex "@value", param_101
    find_lex $P102, "self"
    find_lex $P103, "@value"
    unless_null $P103, vivify_34
    new $P103, "ResizablePMCArray"
  vivify_34:
    $P104 = $P102."_ATTR"("matchers", $P103)
    .return ($P104)
  control_99:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
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
.sub "_block11"  :anon :subid("10_1256283484.07492")
    get_hll_global $P14, ["Matcher";"DescribedAs"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"DescribedAs"]
.sub "_block13" :init :load :subid("11_1256283484.07492")
    .const 'Sub' $P124 = "23_1256283484.07492" 
    capture_lex $P124
    .const 'Sub' $P110 = "22_1256283484.07492" 
    capture_lex $P110
    .const 'Sub' $P66 = "17_1256283484.07492" 
    capture_lex $P66
    .const 'Sub' $P58 = "16_1256283484.07492" 
    capture_lex $P58
    .const 'Sub' $P44 = "15_1256283484.07492" 
    capture_lex $P44
    .const 'Sub' $P32 = "14_1256283484.07492" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1256283484.07492" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P124 = "23_1256283484.07492" 
    capture_lex $P124
    .return ($P124)
.end


.namespace ["Matcher";"DescribedAs"]
.sub "_ONLOAD"  :subid("12_1256283484.07492") :outer("11_1256283484.07492")
    .const 'Sub' $P21 = "13_1256283484.07492" 
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
    .const 'Sub' $P21 = "13_1256283484.07492" 
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
.sub "_block20"  :anon :subid("13_1256283484.07492") :outer("12_1256283484.07492")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"DescribedAs"]
.sub "describe_failure"  :subid("14_1256283484.07492") :method :outer("11_1256283484.07492")
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
.sub "describe_self"  :subid("15_1256283484.07492") :method :outer("11_1256283484.07492")
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
.sub "described_as"  :subid("16_1256283484.07492") :method :outer("11_1256283484.07492")
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
.sub "init"  :subid("17_1256283484.07492") :method :outer("11_1256283484.07492")
    .param pmc param_69
    .param pmc param_70
    .const 'Sub' $P96 = "20_1256283484.07492" 
    capture_lex $P96
    .const 'Sub' $P79 = "18_1256283484.07492" 
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
    .const 'Sub' $P79 = "18_1256283484.07492" 
    capture_lex $P79
    $P79()
  unless_75_end:
    find_lex $P93, "self"
    $P94 = $P93."predicate"()
    unless $P94, unless_92
    set $P91, $P94
    goto unless_92_end
  unless_92:
    .const 'Sub' $P96 = "20_1256283484.07492" 
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
.sub "_block78"  :anon :subid("18_1256283484.07492") :outer("17_1256283484.07492")
    .const 'Sub' $P84 = "19_1256283484.07492" 
    capture_lex $P84
    find_lex $P81, "@args"
    unless_null $P81, vivify_33
    new $P81, "ResizablePMCArray"
  vivify_33:
    set $N82, $P81
    if $N82, unless_80_end
    .const 'Sub' $P84 = "19_1256283484.07492" 
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
.sub "_block83"  :anon :subid("19_1256283484.07492") :outer("18_1256283484.07492")
    get_hll_global $P85, ["Parrot"], "die"
    $P86 = $P85("You must provide a description")
    .return ($P86)
.end


.namespace ["Matcher";"DescribedAs"]
.sub "_block95"  :anon :subid("20_1256283484.07492") :outer("17_1256283484.07492")
    .const 'Sub' $P101 = "21_1256283484.07492" 
    capture_lex $P101
    find_lex $P98, "@args"
    unless_null $P98, vivify_35
    new $P98, "ResizablePMCArray"
  vivify_35:
    set $N99, $P98
    if $N99, unless_97_end
    .const 'Sub' $P101 = "21_1256283484.07492" 
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
.sub "_block100"  :anon :subid("21_1256283484.07492") :outer("20_1256283484.07492")
    get_hll_global $P102, ["Parrot"], "die"
    $P103 = $P102("You must provide a Matcher predicate")
    .return ($P103)
.end


.namespace ["Matcher";"DescribedAs"]
.sub "matches"  :subid("22_1256283484.07492") :method :outer("11_1256283484.07492")
    .param pmc param_113 :slurpy
    new $P112, 'ExceptionHandler'
    set_addr $P112, control_111
    $P112."handle_types"(58)
    push_eh $P112
    .lex "self", self
    .lex "@item", param_113
    new $P114, "Hash"
    .lex "%opts", $P114
    get_hll_global $P115, ["Class"], "call_method_"
    find_lex $P116, "self"
    $P117 = $P116."predicate"()
    find_lex $P118, "@item"
    unless_null $P118, vivify_37
    new $P118, "ResizablePMCArray"
  vivify_37:
    find_lex $P119, "%opts"
    unless_null $P119, vivify_38
    new $P119, "Hash"
  vivify_38:
    $P120 = $P115($P117, "matches", $P118, $P119)
    .lex "$result", $P120
    new $P121, "Exception"
    set $P121['type'], 58
    find_lex $P122, "$result"
    unless_null $P122, vivify_39
    new $P122, "Undef"
  vivify_39:
    setattribute $P121, 'payload', $P122
    throw $P121
    .return ()
  control_111:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P123, exception, "payload"
    .return ($P123)
    rethrow exception
.end


.namespace ["Matcher";"DescribedAs"]
.sub "predicate"  :subid("23_1256283484.07492") :method :outer("11_1256283484.07492")
    .param pmc param_127 :slurpy
    new $P126, 'ExceptionHandler'
    set_addr $P126, control_125
    $P126."handle_types"(58)
    push_eh $P126
    .lex "self", self
    .lex "@value", param_127
    find_lex $P128, "self"
    find_lex $P129, "@value"
    unless_null $P129, vivify_40
    new $P129, "ResizablePMCArray"
  vivify_40:
    $P130 = $P128."_ATTR"("predicate", $P129)
    .return ($P130)
  control_125:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P131, exception, "payload"
    .return ($P131)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256279907.96097")
    get_hll_global $P14, ["Matcher";"Elements"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"Elements"]
.sub "_block13" :init :load :subid("11_1256279907.96097")
    .const 'Sub' $P115 = "22_1256279907.96097" 
    capture_lex $P115
    .const 'Sub' $P107 = "21_1256279907.96097" 
    capture_lex $P107
    .const 'Sub' $P99 = "20_1256279907.96097" 
    capture_lex $P99
    .const 'Sub' $P91 = "19_1256279907.96097" 
    capture_lex $P91
    .const 'Sub' $P79 = "18_1256279907.96097" 
    capture_lex $P79
    .const 'Sub' $P57 = "16_1256279907.96097" 
    capture_lex $P57
    .const 'Sub' $P46 = "15_1256279907.96097" 
    capture_lex $P46
    .const 'Sub' $P34 = "14_1256279907.96097" 
    capture_lex $P34
    .const 'Sub' $P15 = "12_1256279907.96097" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P115 = "22_1256279907.96097" 
    capture_lex $P115
    .return ($P115)
.end


.namespace ["Matcher";"Elements"]
.sub "_ONLOAD"  :subid("12_1256279907.96097") :outer("11_1256279907.96097")
    .const 'Sub' $P21 = "13_1256279907.96097" 
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
    .const 'Sub' $P21 = "13_1256279907.96097" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    new $P26, "String"
    assign $P26, "Matcher::Elements"
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
    $P28($P29, "Matcher::TypeSafe")
    get_hll_global $P30, ["Class"], "multi_method"
    find_lex $P31, "$class_name"
    unless_null $P31, vivify_26
    new $P31, "Undef"
  vivify_26:
    $P32 = $P30($P31, "matches_typesafe", "_match_" :named("starting_with"))
    .return ($P32)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P33, exception, "payload"
    .return ($P33)
    rethrow exception
.end


.namespace ["Matcher";"Elements"]
.sub "_block20"  :anon :subid("13_1256279907.96097") :outer("12_1256279907.96097")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"Elements"]
.sub "describe_failure_typesafe"  :subid("14_1256279907.96097") :method :outer("11_1256279907.96097")
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
    unless_null $P40, vivify_27
    new $P40, "Undef"
  vivify_27:
    find_lex $P41, "$item"
    unless_null $P41, vivify_28
    new $P41, "Undef"
  vivify_28:
    $S42 = $P41."elements"()
    concat $P43, $P40, $S42
    concat $P44, $P43, " elements"
    setattribute $P39, 'payload', $P44
    throw $P39
    .return ()
  control_35:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P45, exception, "payload"
    .return ($P45)
    rethrow exception
.end


.namespace ["Matcher";"Elements"]
.sub "describe_self"  :subid("15_1256279907.96097") :method :outer("11_1256279907.96097")
    .param pmc param_49
    new $P48, 'ExceptionHandler'
    set_addr $P48, control_47
    $P48."handle_types"(58)
    push_eh $P48
    .lex "self", self
    .lex "$description", param_49
    new $P50, "Exception"
    set $P50['type'], 58
    find_lex $P51, "$description"
    unless_null $P51, vivify_29
    new $P51, "Undef"
  vivify_29:
    find_lex $P52, "self"
    $S53 = $P52."value"()
    concat $P54, $P51, $S53
    concat $P55, $P54, " elements"
    setattribute $P50, 'payload', $P55
    throw $P50
    .return ()
  control_47:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P56, exception, "payload"
    .return ($P56)
    rethrow exception
.end


.namespace ["Matcher";"Elements"]
.sub "init"  :subid("16_1256279907.96097") :method :outer("11_1256279907.96097")
    .param pmc param_60
    .param pmc param_61
    .const 'Sub' $P70 = "17_1256279907.96097" 
    capture_lex $P70
    new $P59, 'ExceptionHandler'
    set_addr $P59, control_58
    $P59."handle_types"(58)
    push_eh $P59
    .lex "self", self
    .lex "@children", param_60
    .lex "%attributes", param_61
    get_hll_global $P62, ["Matcher"], "init"
    find_lex $P63, "self"
    find_lex $P64, "@children"
    unless_null $P64, vivify_30
    new $P64, "ResizablePMCArray"
  vivify_30:
    find_lex $P65, "%attributes"
    unless_null $P65, vivify_31
    new $P65, "Hash"
  vivify_31:
    $P62($P63, $P64, $P65)
    find_lex $P67, "@children"
    unless_null $P67, vivify_32
    new $P67, "ResizablePMCArray"
  vivify_32:
    set $N68, $P67
    if $N68, unless_66_end
    .const 'Sub' $P70 = "17_1256279907.96097" 
    capture_lex $P70
    $P70()
  unless_66_end:
    find_lex $P72, "self"
    new $P73, "Integer"
    assign $P73, 0
    find_lex $P74, "@children"
    unless_null $P74, vivify_33
    new $P74, "ResizablePMCArray"
  vivify_33:
    $N75 = $P74."shift"()
    add $P76, $P73, $N75
    $P77 = $P72."value"($P76)
    .return ($P77)
  control_58:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P78, exception, "payload"
    .return ($P78)
    rethrow exception
.end


.namespace ["Matcher";"Elements"]
.sub "_block69"  :anon :subid("17_1256279907.96097") :outer("16_1256279907.96097")
    $P71 = "DIE"("You must provide an elements count for 'Elements' matcher.")
    .return ($P71)
.end


.namespace ["Matcher";"Elements"]
.sub "match_array"  :subid("18_1256279907.96097") :method :outer("11_1256279907.96097")
    .param pmc param_82
    new $P81, 'ExceptionHandler'
    set_addr $P81, control_80
    $P81."handle_types"(58)
    push_eh $P81
    .lex "self", self
    .lex "$item", param_82
    new $P83, "Exception"
    set $P83['type'], 58
    find_lex $P84, "$item"
    unless_null $P84, vivify_34
    new $P84, "Undef"
  vivify_34:
    $N85 = $P84."elements"()
    find_lex $P86, "self"
    $N87 = $P86."value"()
    iseq $I88, $N85, $N87
    new $P89, 'Integer'
    set $P89, $I88
    setattribute $P83, 'payload', $P89
    throw $P83
    .return ()
  control_80:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P90, exception, "payload"
    .return ($P90)
    rethrow exception
.end


.namespace ["Matcher";"Elements"]
.sub "_match_Array"  :subid("19_1256279907.96097") :method :outer("11_1256279907.96097")
    .param pmc param_94
    new $P93, 'ExceptionHandler'
    set_addr $P93, control_92
    $P93."handle_types"(58)
    push_eh $P93
    .lex "self", self
    .lex "$item", param_94
    find_lex $P95, "self"
    find_lex $P96, "$item"
    unless_null $P96, vivify_35
    new $P96, "Undef"
  vivify_35:
    $P97 = $P95."match_array"($P96)
    .return ($P97)
  control_92:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P98, exception, "payload"
    .return ($P98)
    rethrow exception
.end


.namespace ["Matcher";"Elements"]
.sub "_match_ResizablePMCArray"  :subid("20_1256279907.96097") :method :outer("11_1256279907.96097")
    .param pmc param_102
    new $P101, 'ExceptionHandler'
    set_addr $P101, control_100
    $P101."handle_types"(58)
    push_eh $P101
    .lex "self", self
    .lex "$item", param_102
    find_lex $P103, "self"
    find_lex $P104, "$item"
    unless_null $P104, vivify_36
    new $P104, "Undef"
  vivify_36:
    $P105 = $P103."match_array"($P104)
    .return ($P105)
  control_100:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
    rethrow exception
.end


.namespace ["Matcher";"Elements"]
.sub "_match_ResizableStringArray"  :subid("21_1256279907.96097") :method :outer("11_1256279907.96097")
    .param pmc param_110
    new $P109, 'ExceptionHandler'
    set_addr $P109, control_108
    $P109."handle_types"(58)
    push_eh $P109
    .lex "self", self
    .lex "$item", param_110
    find_lex $P111, "self"
    find_lex $P112, "$item"
    unless_null $P112, vivify_37
    new $P112, "Undef"
  vivify_37:
    $P113 = $P111."match_array"($P112)
    .return ($P113)
  control_108:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
    rethrow exception
.end


.namespace ["Matcher";"Elements"]
.sub "value"  :subid("22_1256279907.96097") :method :outer("11_1256279907.96097")
    .param pmc param_118 :slurpy
    new $P117, 'ExceptionHandler'
    set_addr $P117, control_116
    $P117."handle_types"(58)
    push_eh $P117
    .lex "self", self
    .lex "@value", param_118
    find_lex $P119, "self"
    find_lex $P120, "@value"
    unless_null $P120, vivify_38
    new $P120, "ResizablePMCArray"
  vivify_38:
    $P121 = $P119."_ATTR"("value", $P120)
    .return ($P121)
  control_116:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P122, exception, "payload"
    .return ($P122)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256256784.28216")
    get_hll_global $P14, ["Matcher";"Empty"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"Empty"]
.sub "_block13" :init :load :subid("11_1256256784.28216")
    .const 'Sub' $P53 = "16_1256256784.28216" 
    capture_lex $P53
    .const 'Sub' $P45 = "15_1256256784.28216" 
    capture_lex $P45
    .const 'Sub' $P32 = "14_1256256784.28216" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1256256784.28216" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P53 = "16_1256256784.28216" 
    capture_lex $P53
    .return ($P53)
.end


.namespace ["Matcher";"Empty"]
.sub "_ONLOAD"  :subid("12_1256256784.28216") :outer("11_1256256784.28216")
    .const 'Sub' $P21 = "13_1256256784.28216" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_21
    new $P19, "Undef"
  vivify_21:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256256784.28216" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    new $P26, "String"
    assign $P26, "Matcher::Empty"
    .lex "$class_name", $P26
    find_lex $P27, "$class_name"
    unless_null $P27, vivify_22
    new $P27, "Undef"
  vivify_22:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_23
    new $P29, "Undef"
  vivify_23:
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


.namespace ["Matcher";"Empty"]
.sub "_block20"  :anon :subid("13_1256256784.28216") :outer("12_1256256784.28216")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"Empty"]
.sub "describe_failure"  :subid("14_1256256784.28216") :method :outer("11_1256256784.28216")
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
    unless_null $P38, vivify_24
    new $P38, "Undef"
  vivify_24:
    concat $P39, $P38, "had type: "
    get_hll_global $P40, ["Parrot"], "typeof"
    find_lex $P41, "$item"
    unless_null $P41, vivify_25
    new $P41, "Undef"
  vivify_25:
    $S42 = $P40($P41)
    concat $P43, $P39, $S42
    setattribute $P37, 'payload', $P43
    throw $P37
    .return ()
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P44, exception, "payload"
    .return ($P44)
    rethrow exception
.end


.namespace ["Matcher";"Empty"]
.sub "describe_self"  :subid("15_1256256784.28216") :method :outer("11_1256256784.28216")
    .param pmc param_48
    new $P47, 'ExceptionHandler'
    set_addr $P47, control_46
    $P47."handle_types"(58)
    push_eh $P47
    .lex "self", self
    .lex "$description", param_48
    new $P49, "Exception"
    set $P49['type'], 58
    find_lex $P50, "$description"
    unless_null $P50, vivify_26
    new $P50, "Undef"
  vivify_26:
    concat $P51, $P50, "empty"
    setattribute $P49, 'payload', $P51
    throw $P49
    .return ()
  control_46:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P52, exception, "payload"
    .return ($P52)
    rethrow exception
.end


.namespace ["Matcher";"Empty"]
.sub "matches_typesafe"  :subid("16_1256256784.28216") :method :outer("11_1256256784.28216")
    .param pmc param_56
    .const 'Sub' $P98 = "20_1256256784.28216" 
    capture_lex $P98
    .const 'Sub' $P84 = "19_1256256784.28216" 
    capture_lex $P84
    .const 'Sub' $P71 = "18_1256256784.28216" 
    capture_lex $P71
    .const 'Sub' $P62 = "17_1256256784.28216" 
    capture_lex $P62
    new $P55, 'ExceptionHandler'
    set_addr $P55, control_54
    $P55."handle_types"(58)
    push_eh $P55
    .lex "self", self
    .lex "$item", param_56
    get_hll_global $P58, ["Parrot"], "can"
    find_lex $P59, "$item"
    unless_null $P59, vivify_27
    new $P59, "Undef"
  vivify_27:
    $P60 = $P58($P59, "is_empty")
    if $P60, if_57
    get_hll_global $P67, ["Parrot"], "can"
    find_lex $P68, "$item"
    unless_null $P68, vivify_28
    new $P68, "Undef"
  vivify_28:
    $P69 = $P67($P68, "elements")
    if $P69, if_66
    get_hll_global $P80, ["Parrot"], "does"
    find_lex $P81, "$item"
    unless_null $P81, vivify_29
    new $P81, "Undef"
  vivify_29:
    $P82 = $P80($P81, "array")
    if $P82, if_79
    get_hll_global $P94, ["Parrot"], "does"
    find_lex $P95, "$item"
    unless_null $P95, vivify_30
    new $P95, "Undef"
  vivify_30:
    $P96 = $P94($P95, "hash")
    unless $P96, if_93_end
    .const 'Sub' $P98 = "20_1256256784.28216" 
    capture_lex $P98
    $P98()
  if_93_end:
    goto if_79_end
  if_79:
    .const 'Sub' $P84 = "19_1256256784.28216" 
    capture_lex $P84
    $P84()
  if_79_end:
    goto if_66_end
  if_66:
    .const 'Sub' $P71 = "18_1256256784.28216" 
    capture_lex $P71
    $P71()
  if_66_end:
    goto if_57_end
  if_57:
    .const 'Sub' $P62 = "17_1256256784.28216" 
    capture_lex $P62
    $P62()
  if_57_end:
    get_hll_global $P106, ["Parrot"], "die"
    $P107 = $P106("Don't know how to determine if this object is empty.")
    .return ($P107)
  control_54:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
    rethrow exception
.end


.namespace ["Matcher";"Empty"]
.sub "_block97"  :anon :subid("20_1256256784.28216") :outer("16_1256256784.28216")
    new $P99, "Exception"
    set $P99['type'], 58
    find_lex $P100, "$item"
    unless_null $P100, vivify_31
    new $P100, "Undef"
  vivify_31:
    $N101 = $P100."keys"()
    new $P102, "Integer"
    assign $P102, 0
    set $N103, $P102
    iseq $I104, $N101, $N103
    new $P105, 'Integer'
    set $P105, $I104
    setattribute $P99, 'payload', $P105
    throw $P99
    .return ()
.end


.namespace ["Matcher";"Empty"]
.sub "_block83"  :anon :subid("19_1256256784.28216") :outer("16_1256256784.28216")
    new $P85, "Exception"
    set $P85['type'], 58
    get_hll_global $P86, ["Parrot"], "elements"
    find_lex $P87, "$item"
    unless_null $P87, vivify_32
    new $P87, "Undef"
  vivify_32:
    $N88 = $P86($P87)
    new $P89, "Integer"
    assign $P89, 0
    set $N90, $P89
    iseq $I91, $N88, $N90
    new $P92, 'Integer'
    set $P92, $I91
    setattribute $P85, 'payload', $P92
    throw $P85
    .return ()
.end


.namespace ["Matcher";"Empty"]
.sub "_block70"  :anon :subid("18_1256256784.28216") :outer("16_1256256784.28216")
    new $P72, "Exception"
    set $P72['type'], 58
    find_lex $P73, "$item"
    unless_null $P73, vivify_33
    new $P73, "Undef"
  vivify_33:
    $N74 = $P73."elements"()
    new $P75, "Integer"
    assign $P75, 0
    set $N76, $P75
    iseq $I77, $N74, $N76
    new $P78, 'Integer'
    set $P78, $I77
    setattribute $P72, 'payload', $P78
    throw $P72
    .return ()
.end


.namespace ["Matcher";"Empty"]
.sub "_block61"  :anon :subid("17_1256256784.28216") :outer("16_1256256784.28216")
    new $P63, "Exception"
    set $P63['type'], 58
    find_lex $P64, "$item"
    unless_null $P64, vivify_34
    new $P64, "Undef"
  vivify_34:
    $P65 = $P64."is_empty"()
    setattribute $P63, 'payload', $P65
    throw $P63
    .return ()
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256257708.6361")
    get_hll_global $P14, ["Matcher";"Equals"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"Equals"]
.sub "_block13" :init :load :subid("11_1256257708.6361")
    .const 'Sub' $P190 = "29_1256257708.6361" 
    capture_lex $P190
    .const 'Sub' $P150 = "25_1256257708.6361" 
    capture_lex $P150
    .const 'Sub' $P142 = "24_1256257708.6361" 
    capture_lex $P142
    .const 'Sub' $P134 = "23_1256257708.6361" 
    capture_lex $P134
    .const 'Sub' $P126 = "22_1256257708.6361" 
    capture_lex $P126
    .const 'Sub' $P118 = "21_1256257708.6361" 
    capture_lex $P118
    .const 'Sub' $P95 = "19_1256257708.6361" 
    capture_lex $P95
    .const 'Sub' $P57 = "15_1256257708.6361" 
    capture_lex $P57
    .const 'Sub' $P34 = "14_1256257708.6361" 
    capture_lex $P34
    .const 'Sub' $P15 = "12_1256257708.6361" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P190 = "29_1256257708.6361" 
    capture_lex $P190
    .return ($P190)
.end


.namespace ["Matcher";"Equals"]
.sub "_ONLOAD"  :subid("12_1256257708.6361") :outer("11_1256257708.6361")
    .const 'Sub' $P21 = "13_1256257708.6361" 
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
    .const 'Sub' $P21 = "13_1256257708.6361" 
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
.sub "_block20"  :anon :subid("13_1256257708.6361") :outer("12_1256257708.6361")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"Equals"]
.sub "describe_self"  :subid("14_1256257708.6361") :method :outer("11_1256257708.6361")
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
    find_lex $P42, "self"
    $P43 = $P42."match_type"()
    set $P44, $P43[0]
    unless_null $P44, vivify_35
    new $P44, "Undef"
  vivify_35:
    set $S45, $P44
    iseq $I46, $S45, "I"
    if $I46, if_41
    set $S40, "a "
    goto if_41_end
  if_41:
    set $S40, "an "
  if_41_end:
    concat $P47, $P39, $S40
    find_lex $P48, "self"
    $S49 = $P48."match_type"()
    concat $P50, $P47, $S49
    concat $P51, $P50, " equal to '"
    find_lex $P52, "self"
    $S53 = $P52."value"()
    concat $P54, $P51, $S53
    concat $P55, $P54, "'"
    setattribute $P38, 'payload', $P55
    throw $P38
    .return ()
  control_35:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P56, exception, "payload"
    .return ($P56)
    rethrow exception
.end


.namespace ["Matcher";"Equals"]
.sub "find_match_type"  :subid("15_1256257708.6361") :method :outer("11_1256257708.6361")
    .param pmc param_60
    .const 'Sub' $P90 = "18_1256257708.6361" 
    capture_lex $P90
    .const 'Sub' $P66 = "16_1256257708.6361" 
    capture_lex $P66
    new $P59, 'ExceptionHandler'
    set_addr $P59, control_58
    $P59."handle_types"(58)
    push_eh $P59
    .lex "self", self
    .lex "$item", param_60
    new $P62, "ResizablePMCArray"
    push $P62, "Float"
    push $P62, "Integer"
    defined $I63, $P62
    unless $I63, for_undef_36
    iter $P61, $P62
    new $P83, 'ExceptionHandler'
    set_addr $P83, loop82_handler
    $P83."handle_types"(65, 67, 66)
    push_eh $P83
  loop82_test:
    unless $P61, loop82_done
    shift $P64, $P61
  loop82_redo:
    .const 'Sub' $P66 = "16_1256257708.6361" 
    capture_lex $P66
    $P66($P64)
  loop82_next:
    goto loop82_test
  loop82_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P84, exception, 'type'
    eq $P84, 65, loop82_next
    eq $P84, 67, loop82_redo
  loop82_done:
    pop_eh 
  for_undef_36:
    find_lex $P87, "self"
    $P88 = $P87."match_type"()
    unless $P88, unless_86
    set $P85, $P88
    goto unless_86_end
  unless_86:
    .const 'Sub' $P90 = "18_1256257708.6361" 
    capture_lex $P90
    $P93 = $P90()
    set $P85, $P93
  unless_86_end:
    .return ($P85)
  control_58:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P94, exception, "payload"
    .return ($P94)
    rethrow exception
.end


.namespace ["Matcher";"Equals"]
.sub "_block65"  :anon :subid("16_1256257708.6361") :outer("15_1256257708.6361")
    .param pmc param_67
    .const 'Sub' $P76 = "17_1256257708.6361" 
    capture_lex $P76
    .lex "$_", param_67
    get_hll_global $P70, ["Parrot"], "isa"
    find_lex $P71, "$item"
    unless_null $P71, vivify_37
    new $P71, "Undef"
  vivify_37:
    find_lex $P72, "$_"
    unless_null $P72, vivify_38
    new $P72, "Undef"
  vivify_38:
    set $S73, $P72
    $P74 = $P70($P71, $S73)
    if $P74, if_69
    set $P68, $P74
    goto if_69_end
  if_69:
    .const 'Sub' $P76 = "17_1256257708.6361" 
    capture_lex $P76
    $P81 = $P76()
    set $P68, $P81
  if_69_end:
    .return ($P68)
.end


.namespace ["Matcher";"Equals"]
.sub "_block75"  :anon :subid("17_1256257708.6361") :outer("16_1256257708.6361")
    find_lex $P77, "self"
    find_lex $P78, "$_"
    unless_null $P78, vivify_39
    new $P78, "Undef"
  vivify_39:
    set $S79, $P78
    $P80 = $P77."match_type"($S79)
    .return ($P80)
.end


.namespace ["Matcher";"Equals"]
.sub "_block89"  :anon :subid("18_1256257708.6361") :outer("15_1256257708.6361")
    find_lex $P91, "self"
    $P92 = $P91."match_type"("String")
    .return ($P92)
.end


.namespace ["Matcher";"Equals"]
.sub "init"  :subid("19_1256257708.6361") :method :outer("11_1256257708.6361")
    .param pmc param_98
    .param pmc param_99
    .const 'Sub' $P108 = "20_1256257708.6361" 
    capture_lex $P108
    new $P97, 'ExceptionHandler'
    set_addr $P97, control_96
    $P97."handle_types"(58)
    push_eh $P97
    .lex "self", self
    .lex "@children", param_98
    .lex "%attributes", param_99
    get_hll_global $P100, ["Matcher"], "init"
    find_lex $P101, "self"
    find_lex $P102, "@children"
    unless_null $P102, vivify_40
    new $P102, "ResizablePMCArray"
  vivify_40:
    find_lex $P103, "%attributes"
    unless_null $P103, vivify_41
    new $P103, "Hash"
  vivify_41:
    $P100($P101, $P102, $P103)
    find_lex $P105, "@children"
    unless_null $P105, vivify_42
    new $P105, "ResizablePMCArray"
  vivify_42:
    set $N106, $P105
    if $N106, unless_104_end
    .const 'Sub' $P108 = "20_1256257708.6361" 
    capture_lex $P108
    $P108()
  unless_104_end:
    find_lex $P110, "self"
    find_lex $P111, "@children"
    unless_null $P111, vivify_43
    new $P111, "ResizablePMCArray"
  vivify_43:
    $P112 = $P111."shift"()
    $P110."value"($P112)
    find_lex $P113, "self"
    find_lex $P114, "self"
    $P115 = $P114."value"()
    $P116 = $P113."find_match_type"($P115)
    .return ($P116)
  control_96:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, "payload"
    .return ($P117)
    rethrow exception
.end


.namespace ["Matcher";"Equals"]
.sub "_block107"  :anon :subid("20_1256257708.6361") :outer("19_1256257708.6361")
    $P109 = "DIE"("You must provide a comparison value for 'equals' matcher.")
    .return ($P109)
.end


.namespace ["Matcher";"Equals"]
.sub "_match_Float"  :subid("21_1256257708.6361") :method :outer("11_1256257708.6361")
    .param pmc param_121
    new $P120, 'ExceptionHandler'
    set_addr $P120, control_119
    $P120."handle_types"(58)
    push_eh $P120
    .lex "self", self
    .lex "$item", param_121
    find_lex $P122, "self"
    find_lex $P123, "$item"
    unless_null $P123, vivify_44
    new $P123, "Undef"
  vivify_44:
    $P124 = $P122."match_scalar"($P123)
    .return ($P124)
  control_119:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P125, exception, "payload"
    .return ($P125)
    rethrow exception
.end


.namespace ["Matcher";"Equals"]
.sub "_match_Integer"  :subid("22_1256257708.6361") :method :outer("11_1256257708.6361")
    .param pmc param_129
    new $P128, 'ExceptionHandler'
    set_addr $P128, control_127
    $P128."handle_types"(58)
    push_eh $P128
    .lex "self", self
    .lex "$item", param_129
    find_lex $P130, "self"
    find_lex $P131, "$item"
    unless_null $P131, vivify_45
    new $P131, "Undef"
  vivify_45:
    $P132 = $P130."match_scalar"($P131)
    .return ($P132)
  control_127:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P133, exception, "payload"
    .return ($P133)
    rethrow exception
.end


.namespace ["Matcher";"Equals"]
.sub "_match_String"  :subid("23_1256257708.6361") :method :outer("11_1256257708.6361")
    .param pmc param_137
    new $P136, 'ExceptionHandler'
    set_addr $P136, control_135
    $P136."handle_types"(58)
    push_eh $P136
    .lex "self", self
    .lex "$item", param_137
    find_lex $P138, "self"
    find_lex $P139, "$item"
    unless_null $P139, vivify_46
    new $P139, "Undef"
  vivify_46:
    $P140 = $P138."match_scalar"($P139)
    .return ($P140)
  control_135:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P141, exception, "payload"
    .return ($P141)
    rethrow exception
.end


.namespace ["Matcher";"Equals"]
.sub "match_type"  :subid("24_1256257708.6361") :method :outer("11_1256257708.6361")
    .param pmc param_145 :slurpy
    new $P144, 'ExceptionHandler'
    set_addr $P144, control_143
    $P144."handle_types"(58)
    push_eh $P144
    .lex "self", self
    .lex "@value", param_145
    find_lex $P146, "self"
    find_lex $P147, "@value"
    unless_null $P147, vivify_47
    new $P147, "ResizablePMCArray"
  vivify_47:
    $P148 = $P146."_ATTR"("match_type", $P147)
    .return ($P148)
  control_143:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P149, exception, "payload"
    .return ($P149)
    rethrow exception
.end


.namespace ["Matcher";"Equals"]
.sub "match_scalar"  :subid("25_1256257708.6361") :method :outer("11_1256257708.6361")
    .param pmc param_153
    .const 'Sub' $P180 = "28_1256257708.6361" 
    capture_lex $P180
    .const 'Sub' $P170 = "27_1256257708.6361" 
    capture_lex $P170
    .const 'Sub' $P160 = "26_1256257708.6361" 
    capture_lex $P160
    new $P152, 'ExceptionHandler'
    set_addr $P152, control_151
    $P152."handle_types"(58)
    push_eh $P152
    .lex "self", self
    .lex "$item", param_153
    find_lex $P154, "self"
    $P155 = $P154."value"()
    .lex "$value", $P155
    find_lex $P157, "self"
    $P158 = $P157."match_type"()
    if $P158, unless_156_end
    .const 'Sub' $P160 = "26_1256257708.6361" 
    capture_lex $P160
    $P160()
  unless_156_end:
    find_lex $P166, "self"
    $S167 = $P166."match_type"()
    iseq $I168, $S167, "String"
    if $I168, if_165
    .const 'Sub' $P180 = "28_1256257708.6361" 
    capture_lex $P180
    $P188 = $P180()
    set $P164, $P188
    goto if_165_end
  if_165:
    .const 'Sub' $P170 = "27_1256257708.6361" 
    capture_lex $P170
    $P178 = $P170()
    set $P164, $P178
  if_165_end:
    .return ($P164)
  control_151:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P189, exception, "payload"
    .return ($P189)
    rethrow exception
.end


.namespace ["Matcher";"Equals"]
.sub "_block159"  :anon :subid("26_1256257708.6361") :outer("25_1256257708.6361")
    find_lex $P161, "self"
    find_lex $P162, "$item"
    unless_null $P162, vivify_48
    new $P162, "Undef"
  vivify_48:
    $P163 = $P161."find_match_type"($P162)
    .return ($P163)
.end


.namespace ["Matcher";"Equals"]
.sub "_block179"  :anon :subid("28_1256257708.6361") :outer("25_1256257708.6361")
    new $P181, "Exception"
    set $P181['type'], 58
    find_lex $P182, "$item"
    unless_null $P182, vivify_49
    new $P182, "Undef"
  vivify_49:
    set $N183, $P182
    find_lex $P184, "$value"
    unless_null $P184, vivify_50
    new $P184, "Undef"
  vivify_50:
    set $N185, $P184
    iseq $I186, $N183, $N185
    new $P187, 'Integer'
    set $P187, $I186
    setattribute $P181, 'payload', $P187
    throw $P181
    .return ()
.end


.namespace ["Matcher";"Equals"]
.sub "_block169"  :anon :subid("27_1256257708.6361") :outer("25_1256257708.6361")
    new $P171, "Exception"
    set $P171['type'], 58
    find_lex $P172, "$item"
    unless_null $P172, vivify_51
    new $P172, "Undef"
  vivify_51:
    set $S173, $P172
    find_lex $P174, "$value"
    unless_null $P174, vivify_52
    new $P174, "Undef"
  vivify_52:
    set $S175, $P174
    iseq $I176, $S173, $S175
    new $P177, 'Integer'
    set $P177, $I176
    setattribute $P171, 'payload', $P177
    throw $P171
    .return ()
.end


.namespace ["Matcher";"Equals"]
.sub "value"  :subid("29_1256257708.6361") :method :outer("11_1256257708.6361")
    .param pmc param_193 :slurpy
    new $P192, 'ExceptionHandler'
    set_addr $P192, control_191
    $P192."handle_types"(58)
    push_eh $P192
    .lex "self", self
    .lex "@value", param_193
    find_lex $P194, "self"
    find_lex $P195, "@value"
    unless_null $P195, vivify_53
    new $P195, "ResizablePMCArray"
  vivify_53:
    $P196 = $P194."_ATTR"("value", $P195)
    .return ($P196)
  control_191:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P197, exception, "payload"
    .return ($P197)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256278679.38244")
    get_hll_global $P14, ["Matcher";"EqualsArray"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"EqualsArray"]
.sub "_block13" :init :load :subid("11_1256278679.38244")
    .const 'Sub' $P76 = "18_1256278679.38244" 
    capture_lex $P76
    .const 'Sub' $P64 = "17_1256278679.38244" 
    capture_lex $P64
    .const 'Sub' $P44 = "15_1256278679.38244" 
    capture_lex $P44
    .const 'Sub' $P32 = "14_1256278679.38244" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1256278679.38244" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P76 = "18_1256278679.38244" 
    capture_lex $P76
    .return ($P76)
.end


.namespace ["Matcher";"EqualsArray"]
.sub "_ONLOAD"  :subid("12_1256278679.38244") :outer("11_1256278679.38244")
    .const 'Sub' $P21 = "13_1256278679.38244" 
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
    .const 'Sub' $P21 = "13_1256278679.38244" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    new $P26, "String"
    assign $P26, "Matcher::EqualsArray"
    .lex "$class_name", $P26
    find_lex $P27, "$class_name"
    unless_null $P27, vivify_20
    new $P27, "Undef"
  vivify_20:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_21
    new $P29, "Undef"
  vivify_21:
    $P30 = $P28($P29, "Matcher::TypeSafe")
    .return ($P30)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P31, exception, "payload"
    .return ($P31)
    rethrow exception
.end


.namespace ["Matcher";"EqualsArray"]
.sub "_block20"  :anon :subid("13_1256278679.38244") :outer("12_1256278679.38244")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"EqualsArray"]
.sub "describe_self"  :subid("14_1256278679.38244") :method :outer("11_1256278679.38244")
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
    unless_null $P37, vivify_22
    new $P37, "Undef"
  vivify_22:
    concat $P38, $P37, "an array equal to '"
    find_lex $P39, "self"
    $S40 = $P39."value"()
    concat $P41, $P38, $S40
    concat $P42, $P41, "'"
    setattribute $P36, 'payload', $P42
    throw $P36
    .return ()
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P43, exception, "payload"
    .return ($P43)
    rethrow exception
.end


.namespace ["Matcher";"EqualsArray"]
.sub "init"  :subid("15_1256278679.38244") :method :outer("11_1256278679.38244")
    .param pmc param_47
    .param pmc param_48
    .const 'Sub' $P57 = "16_1256278679.38244" 
    capture_lex $P57
    new $P46, 'ExceptionHandler'
    set_addr $P46, control_45
    $P46."handle_types"(58)
    push_eh $P46
    .lex "self", self
    .lex "@children", param_47
    .lex "%attributes", param_48
    get_hll_global $P49, ["Matcher"], "init"
    find_lex $P50, "self"
    find_lex $P51, "@children"
    unless_null $P51, vivify_23
    new $P51, "ResizablePMCArray"
  vivify_23:
    find_lex $P52, "%attributes"
    unless_null $P52, vivify_24
    new $P52, "Hash"
  vivify_24:
    $P49($P50, $P51, $P52)
    find_lex $P54, "@children"
    unless_null $P54, vivify_25
    new $P54, "ResizablePMCArray"
  vivify_25:
    set $N55, $P54
    if $N55, unless_53_end
    .const 'Sub' $P57 = "16_1256278679.38244" 
    capture_lex $P57
    $P57()
  unless_53_end:
    find_lex $P59, "self"
    find_lex $P60, "@children"
    unless_null $P60, vivify_26
    new $P60, "ResizablePMCArray"
  vivify_26:
    $P61 = $P60."shift"()
    $P62 = $P59."value"($P61)
    .return ($P62)
  control_45:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P63, exception, "payload"
    .return ($P63)
    rethrow exception
.end


.namespace ["Matcher";"EqualsArray"]
.sub "_block56"  :anon :subid("16_1256278679.38244") :outer("15_1256278679.38244")
    $P58 = "DIE"("You must provide a comparison value for 'EqualsArray' matcher.")
    .return ($P58)
.end


.namespace ["Matcher";"EqualsArray"]
.sub "matches_typesafe"  :subid("17_1256278679.38244") :method :outer("11_1256278679.38244")
    .param pmc param_67
    new $P66, 'ExceptionHandler'
    set_addr $P66, control_65
    $P66."handle_types"(58)
    push_eh $P66
    .lex "self", self
    .lex "$item", param_67
    get_hll_global $P68, ["Parrot"], "iseq"
    find_lex $P69, "self"
    $P70 = $P69."value"()
    find_lex $P71, "$item"
    unless_null $P71, vivify_27
    new $P71, "Undef"
  vivify_27:
    $P72 = $P68($P70, $P71)
    .lex "$result", $P72
    new $P73, "Exception"
    set $P73['type'], 58
    find_lex $P74, "$result"
    unless_null $P74, vivify_28
    new $P74, "Undef"
  vivify_28:
    setattribute $P73, 'payload', $P74
    throw $P73
    .return ()
  control_65:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P75, exception, "payload"
    .return ($P75)
    rethrow exception
.end


.namespace ["Matcher";"EqualsArray"]
.sub "value"  :subid("18_1256278679.38244") :method :outer("11_1256278679.38244")
    .param pmc param_79 :slurpy
    new $P78, 'ExceptionHandler'
    set_addr $P78, control_77
    $P78."handle_types"(58)
    push_eh $P78
    .lex "self", self
    .lex "@value", param_79
    find_lex $P80, "self"
    find_lex $P81, "@value"
    unless_null $P81, vivify_29
    new $P81, "ResizablePMCArray"
  vivify_29:
    $P82 = $P80."_ATTR"("value", $P81)
    .return ($P82)
  control_77:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P83, exception, "payload"
    .return ($P83)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256258081.10172")
    get_hll_global $P14, ["Matcher";"EqualsFloat"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_block13" :init :load :subid("11_1256258081.10172")
    .const 'Sub' $P172 = "29_1256258081.10172" 
    capture_lex $P172
    .const 'Sub' $P164 = "28_1256258081.10172" 
    capture_lex $P164
    .const 'Sub' $P146 = "26_1256258081.10172" 
    capture_lex $P146
    .const 'Sub' $P138 = "25_1256258081.10172" 
    capture_lex $P138
    .const 'Sub' $P130 = "24_1256258081.10172" 
    capture_lex $P130
    .const 'Sub' $P122 = "23_1256258081.10172" 
    capture_lex $P122
    .const 'Sub' $P72 = "17_1256258081.10172" 
    capture_lex $P72
    .const 'Sub' $P60 = "16_1256258081.10172" 
    capture_lex $P60
    .const 'Sub' $P49 = "15_1256258081.10172" 
    capture_lex $P49
    .const 'Sub' $P34 = "14_1256258081.10172" 
    capture_lex $P34
    .const 'Sub' $P15 = "12_1256258081.10172" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P172 = "29_1256258081.10172" 
    capture_lex $P172
    .return ($P172)
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_ONLOAD"  :subid("12_1256258081.10172") :outer("11_1256258081.10172")
    .const 'Sub' $P21 = "13_1256258081.10172" 
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
    .const 'Sub' $P21 = "13_1256258081.10172" 
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


.namespace ["Matcher";"EqualsFloat"]
.sub "_block20"  :anon :subid("13_1256258081.10172") :outer("12_1256258081.10172")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "describe_failure"  :subid("14_1256258081.10172") :method :outer("11_1256258081.10172")
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
    unless_null $P40, vivify_34
    new $P40, "Undef"
  vivify_34:
    find_lex $P41, "$item"
    unless_null $P41, vivify_35
    new $P41, "Undef"
  vivify_35:
    concat $P42, $P40, $P41
    concat $P43, $P42, " differed by "
    find_lex $P44, "self"
    find_lex $P45, "$item"
    unless_null $P45, vivify_36
    new $P45, "Undef"
  vivify_36:
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
.sub "describe_self"  :subid("15_1256258081.10172") :method :outer("11_1256258081.10172")
    .param pmc param_52
    new $P51, 'ExceptionHandler'
    set_addr $P51, control_50
    $P51."handle_types"(58)
    push_eh $P51
    .lex "self", self
    .lex "$description", param_52
    new $P53, "Exception"
    set $P53['type'], 58
    find_lex $P54, "$description"
    unless_null $P54, vivify_37
    new $P54, "Undef"
  vivify_37:
    concat $P55, $P54, "a Number equal to "
    find_lex $P56, "self"
    $S57 = $P56."value"()
    concat $P58, $P55, $S57
    setattribute $P53, 'payload', $P58
    throw $P53
    .return ()
  control_50:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P59, exception, "payload"
    .return ($P59)
    rethrow exception
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "difference"  :subid("16_1256258081.10172") :method :outer("11_1256258081.10172")
    .param pmc param_63
    new $P62, 'ExceptionHandler'
    set_addr $P62, control_61
    $P62."handle_types"(58)
    push_eh $P62
    .lex "self", self
    .lex "$item", param_63
    find_lex $P64, "$item"
    unless_null $P64, vivify_38
    new $P64, "Undef"
  vivify_38:
    find_lex $P65, "self"
    $N66 = $P65."value"()
    sub $P67, $P64, $N66
    .lex "$difference", $P67

			$P0 = find_lex '$difference'
			$P68 = abs $P0
		
    .lex "$abs", $P68
    new $P69, "Exception"
    set $P69['type'], 58
    find_lex $P70, "$abs"
    unless_null $P70, vivify_39
    new $P70, "Undef"
  vivify_39:
    setattribute $P69, 'payload', $P70
    throw $P69
    .return ()
  control_61:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P71, exception, "payload"
    .return ($P71)
    rethrow exception
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "init"  :subid("17_1256258081.10172") :method :outer("11_1256258081.10172")
    .param pmc param_75
    .param pmc param_76
    .const 'Sub' $P98 = "20_1256258081.10172" 
    capture_lex $P98
    .const 'Sub' $P91 = "19_1256258081.10172" 
    capture_lex $P91
    .const 'Sub' $P81 = "18_1256258081.10172" 
    capture_lex $P81
    new $P74, 'ExceptionHandler'
    set_addr $P74, control_73
    $P74."handle_types"(58)
    push_eh $P74
    .lex "self", self
    .lex "@children", param_75
    .lex "%attributes", param_76
    find_lex $P78, "@children"
    unless_null $P78, vivify_40
    new $P78, "ResizablePMCArray"
  vivify_40:
    set $N79, $P78
    if $N79, unless_77_end
    .const 'Sub' $P81 = "18_1256258081.10172" 
    capture_lex $P81
    $P81()
  unless_77_end:
    find_lex $P83, "self"
    find_lex $P84, "@children"
    unless_null $P84, vivify_41
    new $P84, "ResizablePMCArray"
  vivify_41:
    $P85 = $P84."shift"()
    $P83."value"($P85)
    find_lex $P88, "@children"
    unless_null $P88, vivify_42
    new $P88, "ResizablePMCArray"
  vivify_42:
    set $N89, $P88
    if $N89, if_87
    .const 'Sub' $P98 = "20_1256258081.10172" 
    capture_lex $P98
    $P120 = $P98()
    set $P86, $P120
    goto if_87_end
  if_87:
    .const 'Sub' $P91 = "19_1256258081.10172" 
    capture_lex $P91
    $P96 = $P91()
    set $P86, $P96
  if_87_end:
    .return ($P86)
  control_73:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, "payload"
    .return ($P121)
    rethrow exception
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_block80"  :anon :subid("18_1256258081.10172") :outer("17_1256258081.10172")
    $P82 = "DIE"("You must provide at least a target value for is-close-to matcher")
    .return ($P82)
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_block97"  :anon :subid("20_1256258081.10172") :outer("17_1256258081.10172")
    .const 'Sub' $P116 = "22_1256258081.10172" 
    capture_lex $P116
    .const 'Sub' $P107 = "21_1256258081.10172" 
    capture_lex $P107
    find_lex $P101, "self"
    $N102 = $P101."value"()
    new $P103, "Integer"
    assign $P103, 0
    set $N104, $P103
    isne $I105, $N102, $N104
    if $I105, if_100
    .const 'Sub' $P116 = "22_1256258081.10172" 
    capture_lex $P116
    $P119 = $P116()
    set $P99, $P119
    goto if_100_end
  if_100:
    .const 'Sub' $P107 = "21_1256258081.10172" 
    capture_lex $P107
    $P114 = $P107()
    set $P99, $P114
  if_100_end:
    .return ($P99)
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_block115"  :anon :subid("22_1256258081.10172") :outer("20_1256258081.10172")
    find_lex $P117, "self"
    $P118 = $P117."within"("0.0001")
    .return ($P118)
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_block106"  :anon :subid("21_1256258081.10172") :outer("20_1256258081.10172")
    find_lex $P108, "self"
    find_lex $P109, "self"
    $P110 = $P109."value"()
    new $P111, "String"
    assign $P111, "0.0001"
    mul $P112, $P110, $P111
    $P113 = $P108."within"($P112)
    .return ($P113)
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_block90"  :anon :subid("19_1256258081.10172") :outer("17_1256258081.10172")
    find_lex $P92, "self"
    find_lex $P93, "@children"
    unless_null $P93, vivify_43
    new $P93, "ResizablePMCArray"
  vivify_43:
    $P94 = $P93."shift"()
    $P95 = $P92."within"($P94)
    .return ($P95)
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_match_Float"  :subid("23_1256258081.10172") :method :outer("11_1256258081.10172")
    .param pmc param_125
    new $P124, 'ExceptionHandler'
    set_addr $P124, control_123
    $P124."handle_types"(58)
    push_eh $P124
    .lex "self", self
    .lex "$item", param_125
    find_lex $P126, "self"
    find_lex $P127, "$item"
    unless_null $P127, vivify_44
    new $P127, "Undef"
  vivify_44:
    $P128 = $P126."match_scalar"($P127)
    .return ($P128)
  control_123:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P129, exception, "payload"
    .return ($P129)
    rethrow exception
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_match_Integer"  :subid("24_1256258081.10172") :method :outer("11_1256258081.10172")
    .param pmc param_133
    new $P132, 'ExceptionHandler'
    set_addr $P132, control_131
    $P132."handle_types"(58)
    push_eh $P132
    .lex "self", self
    .lex "$item", param_133
    find_lex $P134, "self"
    find_lex $P135, "$item"
    unless_null $P135, vivify_45
    new $P135, "Undef"
  vivify_45:
    $P136 = $P134."match_scalar"($P135)
    .return ($P136)
  control_131:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P137, exception, "payload"
    .return ($P137)
    rethrow exception
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_match_String"  :subid("25_1256258081.10172") :method :outer("11_1256258081.10172")
    .param pmc param_141
    new $P140, 'ExceptionHandler'
    set_addr $P140, control_139
    $P140."handle_types"(58)
    push_eh $P140
    .lex "self", self
    .lex "$item", param_141
    find_lex $P142, "self"
    find_lex $P143, "$item"
    unless_null $P143, vivify_46
    new $P143, "Undef"
  vivify_46:
    $P144 = $P142."match_scalar"($P143)
    .return ($P144)
  control_139:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P145, exception, "payload"
    .return ($P145)
    rethrow exception
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "match_scalar"  :subid("26_1256258081.10172") :method :outer("11_1256258081.10172")
    .param pmc param_149
    .const 'Sub' $P158 = "27_1256258081.10172" 
    capture_lex $P158
    new $P148, 'ExceptionHandler'
    set_addr $P148, control_147
    $P148."handle_types"(58)
    push_eh $P148
    .lex "self", self
    .lex "$item", param_149
    find_lex $P151, "self"
    find_lex $P152, "$item"
    unless_null $P152, vivify_47
    new $P152, "Undef"
  vivify_47:
    $N153 = $P151."difference"($P152)
    find_lex $P154, "self"
    $N155 = $P154."within"()
    isle $I156, $N153, $N155
    unless $I156, if_150_end
    .const 'Sub' $P158 = "27_1256258081.10172" 
    capture_lex $P158
    $P158()
  if_150_end:
    new $P161, "Exception"
    set $P161['type'], 58
    new $P162, "Integer"
    assign $P162, 0
    setattribute $P161, 'payload', $P162
    throw $P161
    .return ()
  control_147:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P163, exception, "payload"
    .return ($P163)
    rethrow exception
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "_block157"  :anon :subid("27_1256258081.10172") :outer("26_1256258081.10172")
    new $P159, "Exception"
    set $P159['type'], 58
    new $P160, "Integer"
    assign $P160, 1
    setattribute $P159, 'payload', $P160
    throw $P159
    .return ()
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "value"  :subid("28_1256258081.10172") :method :outer("11_1256258081.10172")
    .param pmc param_167 :slurpy
    new $P166, 'ExceptionHandler'
    set_addr $P166, control_165
    $P166."handle_types"(58)
    push_eh $P166
    .lex "self", self
    .lex "@value", param_167
    find_lex $P168, "self"
    find_lex $P169, "@value"
    unless_null $P169, vivify_48
    new $P169, "ResizablePMCArray"
  vivify_48:
    $P170 = $P168."_ATTR"("value", $P169)
    .return ($P170)
  control_165:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P171, exception, "payload"
    .return ($P171)
    rethrow exception
.end


.namespace ["Matcher";"EqualsFloat"]
.sub "within"  :subid("29_1256258081.10172") :method :outer("11_1256258081.10172")
    .param pmc param_175 :slurpy
    new $P174, 'ExceptionHandler'
    set_addr $P174, control_173
    $P174."handle_types"(58)
    push_eh $P174
    .lex "self", self
    .lex "@value", param_175
    find_lex $P176, "self"
    find_lex $P177, "@value"
    unless_null $P177, vivify_49
    new $P177, "ResizablePMCArray"
  vivify_49:
    $P178 = $P176."_ATTR"("within", $P177)
    .return ($P178)
  control_173:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P179, exception, "payload"
    .return ($P179)
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
.sub "_block11"  :anon :subid("10_1256295830.78116")
    get_hll_global $P14, ["Matcher";"Factory"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"Factory"]
.sub "_block13" :init :load :subid("11_1256295830.78116")
    .const 'Sub' $P353 = "48_1256295830.78116" 
    capture_lex $P353
    .const 'Sub' $P344 = "47_1256295830.78116" 
    capture_lex $P344
    .const 'Sub' $P334 = "46_1256295830.78116" 
    capture_lex $P334
    .const 'Sub' $P325 = "45_1256295830.78116" 
    capture_lex $P325
    .const 'Sub' $P315 = "44_1256295830.78116" 
    capture_lex $P315
    .const 'Sub' $P305 = "43_1256295830.78116" 
    capture_lex $P305
    .const 'Sub' $P298 = "42_1256295830.78116" 
    capture_lex $P298
    .const 'Sub' $P289 = "41_1256295830.78116" 
    capture_lex $P289
    .const 'Sub' $P280 = "40_1256295830.78116" 
    capture_lex $P280
    .const 'Sub' $P271 = "39_1256295830.78116" 
    capture_lex $P271
    .const 'Sub' $P262 = "38_1256295830.78116" 
    capture_lex $P262
    .const 'Sub' $P240 = "36_1256295830.78116" 
    capture_lex $P240
    .const 'Sub' $P232 = "35_1256295830.78116" 
    capture_lex $P232
    .const 'Sub' $P225 = "34_1256295830.78116" 
    capture_lex $P225
    .const 'Sub' $P217 = "33_1256295830.78116" 
    capture_lex $P217
    .const 'Sub' $P209 = "32_1256295830.78116" 
    capture_lex $P209
    .const 'Sub' $P199 = "31_1256295830.78116" 
    capture_lex $P199
    .const 'Sub' $P190 = "30_1256295830.78116" 
    capture_lex $P190
    .const 'Sub' $P180 = "29_1256295830.78116" 
    capture_lex $P180
    .const 'Sub' $P170 = "28_1256295830.78116" 
    capture_lex $P170
    .const 'Sub' $P161 = "27_1256295830.78116" 
    capture_lex $P161
    .const 'Sub' $P152 = "26_1256295830.78116" 
    capture_lex $P152
    .const 'Sub' $P145 = "25_1256295830.78116" 
    capture_lex $P145
    .const 'Sub' $P136 = "24_1256295830.78116" 
    capture_lex $P136
    .const 'Sub' $P127 = "23_1256295830.78116" 
    capture_lex $P127
    .const 'Sub' $P118 = "22_1256295830.78116" 
    capture_lex $P118
    .const 'Sub' $P109 = "21_1256295830.78116" 
    capture_lex $P109
    .const 'Sub' $P102 = "20_1256295830.78116" 
    capture_lex $P102
    .const 'Sub' $P93 = "19_1256295830.78116" 
    capture_lex $P93
    .const 'Sub' $P86 = "18_1256295830.78116" 
    capture_lex $P86
    .const 'Sub' $P76 = "17_1256295830.78116" 
    capture_lex $P76
    .const 'Sub' $P66 = "16_1256295830.78116" 
    capture_lex $P66
    .const 'Sub' $P42 = "14_1256295830.78116" 
    capture_lex $P42
    .const 'Sub' $P15 = "12_1256295830.78116" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P353 = "48_1256295830.78116" 
    capture_lex $P353
    .return ($P353)
.end


.namespace ["Matcher";"Factory"]
.sub "_ONLOAD"  :subid("12_1256295830.78116") :outer("11_1256295830.78116")
    .const 'Sub' $P21 = "13_1256295830.78116" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_49
    new $P19, "Undef"
  vivify_49:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256295830.78116" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper", "ASSERT DUMP DUMP_ NOTE")
    new $P26, "String"
    assign $P26, "Matcher::Factory"
    .lex "$class_name", $P26
    find_lex $P27, "$class_name"
    unless_null $P27, vivify_50
    new $P27, "Undef"
  vivify_50:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_51
    new $P29, "Undef"
  vivify_51:
    $P28($P29, "Class::HashBased")
    get_hll_global $P30, ["Class"], "multi_sub"
    find_lex $P31, "$class_name"
    unless_null $P31, vivify_52
    new $P31, "Undef"
  vivify_52:
    $P30($P31, "is", "_is_" :named("starting_with"))
    get_hll_global $P32, ["Class"], "multi_sub"
    find_lex $P33, "$class_name"
    unless_null $P33, vivify_53
    new $P33, "Undef"
  vivify_53:
    $P32($P33, "equals", "_equals_" :named("starting_with"))
    get_hll_global $P34, ["Class"], "multi_sub"
    find_lex $P35, "$class_name"
    unless_null $P35, vivify_54
    new $P35, "Undef"
  vivify_54:
    $P34($P35, "make_matcher", "_make_" :named("starting_with"))
    get_hll_global $P36, ["Class"], "multi_sub"
    find_lex $P37, "$class_name"
    unless_null $P37, vivify_55
    new $P37, "Undef"
  vivify_55:
    $P36($P37, "not", "_not_" :named("starting_with"))
    get_hll_global $P38, ["Class"], "multi_sub"
    find_lex $P39, "$class_name"
    unless_null $P39, vivify_56
    new $P39, "Undef"
  vivify_56:
    $P38($P39, "returns", "_returns_" :named("starting_with"))
    $P40 = "NOTE"("done")
    .return ($P40)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P41, exception, "payload"
    .return ($P41)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_block20"  :anon :subid("13_1256295830.78116") :outer("12_1256295830.78116")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"Factory"]
.sub "assert_that"  :subid("14_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_45
    .param pmc param_46
    .const 'Sub' $P53 = "15_1256295830.78116" 
    capture_lex $P53
    new $P44, 'ExceptionHandler'
    set_addr $P44, control_43
    $P44."handle_types"(58)
    push_eh $P44
    .lex "$item", param_45
    .lex "$matcher", param_46
    find_lex $P48, "$matcher"
    unless_null $P48, vivify_57
    new $P48, "Undef"
  vivify_57:
    find_lex $P49, "$item"
    unless_null $P49, vivify_58
    new $P49, "Undef"
  vivify_58:
    $P50 = $P48."matches"($P49)
    isfalse $I51, $P50
    unless $I51, if_47_end
    .const 'Sub' $P53 = "15_1256295830.78116" 
    capture_lex $P53
    $P53()
  if_47_end:
    new $P63, "Exception"
    set $P63['type'], 58
    new $P64, "Integer"
    assign $P64, 1
    setattribute $P63, 'payload', $P64
    throw $P63
    .return ()
  control_43:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P65, exception, "payload"
    .return ($P65)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_block52"  :anon :subid("15_1256295830.78116") :outer("14_1256295830.78116")
    find_lex $P54, "$matcher"
    unless_null $P54, vivify_59
    new $P54, "Undef"
  vivify_59:
    $P55 = $P54."describe_self"("Expected: ")
    find_lex $P56, "$matcher"
    unless_null $P56, vivify_60
    new $P56, "Undef"
  vivify_60:
    find_lex $P57, "$item"
    unless_null $P57, vivify_61
    new $P57, "Undef"
  vivify_61:
    $S58 = $P56."describe_failure"($P57, "\n     but: ")
    concat $P59, $P55, $S58
    .lex "$explain", $P59
    find_lex $P60, "$explain"
    unless_null $P60, vivify_62
    new $P60, "Undef"
  vivify_62:
    "say"($P60)
    new $P61, "Exception"
    set $P61['type'], 58
    new $P62, "Integer"
    assign $P62, 0
    setattribute $P61, 'payload', $P62
    throw $P61
    .return ()
.end


.namespace ["Matcher";"Factory"]
.sub "all_of"  :subid("16_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_69 :slurpy
    new $P68, 'ExceptionHandler'
    set_addr $P68, control_67
    $P68."handle_types"(58)
    push_eh $P68
    .lex "@list", param_69
    new $P70, "Exception"
    set $P70['type'], 58
    get_hll_global $P71, ["Matcher"], "AllOf"
    find_lex $P72, "@list"
    unless_null $P72, vivify_63
    new $P72, "ResizablePMCArray"
  vivify_63:
    $P73 = "make_matcher_list"($P72)
    $P74 = $P71($P73)
    setattribute $P70, 'payload', $P74
    throw $P70
    .return ()
  control_67:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P75, exception, "payload"
    .return ($P75)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "any_of"  :subid("17_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_79 :slurpy
    new $P78, 'ExceptionHandler'
    set_addr $P78, control_77
    $P78."handle_types"(58)
    push_eh $P78
    .lex "@list", param_79
    new $P80, "Exception"
    set $P80['type'], 58
    get_hll_global $P81, ["Matcher"], "AnyOne"
    find_lex $P82, "@list"
    unless_null $P82, vivify_64
    new $P82, "ResizablePMCArray"
  vivify_64:
    $P83 = "make_matcher_list"($P82)
    $P84 = $P81($P83)
    setattribute $P80, 'payload', $P84
    throw $P80
    .return ()
  control_77:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P85, exception, "payload"
    .return ($P85)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "defined"  :subid("18_1256295830.78116") :outer("11_1256295830.78116")
    new $P88, 'ExceptionHandler'
    set_addr $P88, control_87
    $P88."handle_types"(58)
    push_eh $P88
    new $P89, "Exception"
    set $P89['type'], 58
    get_hll_global $P90, ["Matcher"], "Defined"
    $P91 = $P90."new"()
    setattribute $P89, 'payload', $P91
    throw $P89
    .return ()
  control_87:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P92, exception, "payload"
    .return ($P92)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "elements"  :subid("19_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_96
    new $P95, 'ExceptionHandler'
    set_addr $P95, control_94
    $P95."handle_types"(58)
    push_eh $P95
    .lex "$count", param_96
    new $P97, "Exception"
    set $P97['type'], 58
    get_hll_global $P98, ["Matcher"], "Elements"
    find_lex $P99, "$count"
    unless_null $P99, vivify_65
    new $P99, "Undef"
  vivify_65:
    $P100 = $P98."new"($P99)
    setattribute $P97, 'payload', $P100
    throw $P97
    .return ()
  control_94:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "empty"  :subid("20_1256295830.78116") :outer("11_1256295830.78116")
    new $P104, 'ExceptionHandler'
    set_addr $P104, control_103
    $P104."handle_types"(58)
    push_eh $P104
    new $P105, "Exception"
    set $P105['type'], 58
    get_hll_global $P106, ["Matcher"], "Empty"
    $P107 = $P106."new"()
    setattribute $P105, 'payload', $P107
    throw $P105
    .return ()
  control_103:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_equals_Float"  :subid("21_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_112
    new $P111, 'ExceptionHandler'
    set_addr $P111, control_110
    $P111."handle_types"(58)
    push_eh $P111
    .lex "$value", param_112
    new $P113, "Exception"
    set $P113['type'], 58
    get_hll_global $P114, ["Matcher"], "IsCloseTo"
    find_lex $P115, "$value"
    unless_null $P115, vivify_66
    new $P115, "Undef"
  vivify_66:
    $P116 = $P114."new"($P115)
    setattribute $P113, 'payload', $P116
    throw $P113
    .return ()
  control_110:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, "payload"
    .return ($P117)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_equals_Integer"  :subid("22_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_121
    new $P120, 'ExceptionHandler'
    set_addr $P120, control_119
    $P120."handle_types"(58)
    push_eh $P120
    .lex "$value", param_121
    new $P122, "Exception"
    set $P122['type'], 58
    get_hll_global $P123, ["Matcher"], "Equals"
    find_lex $P124, "$value"
    unless_null $P124, vivify_67
    new $P124, "Undef"
  vivify_67:
    $P125 = $P123."new"($P124, "Integer" :named("match_type"))
    setattribute $P122, 'payload', $P125
    throw $P122
    .return ()
  control_119:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P126, exception, "payload"
    .return ($P126)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_equals_String"  :subid("23_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_130
    new $P129, 'ExceptionHandler'
    set_addr $P129, control_128
    $P129."handle_types"(58)
    push_eh $P129
    .lex "$value", param_130
    new $P131, "Exception"
    set $P131['type'], 58
    get_hll_global $P132, ["Matcher"], "Equals"
    find_lex $P133, "$value"
    unless_null $P133, vivify_68
    new $P133, "Undef"
  vivify_68:
    $P134 = $P132."new"($P133, "String" :named("match_type"))
    setattribute $P131, 'payload', $P134
    throw $P131
    .return ()
  control_128:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P135, exception, "payload"
    .return ($P135)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_equals_ResizablePMCArray"  :subid("24_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_139
    new $P138, 'ExceptionHandler'
    set_addr $P138, control_137
    $P138."handle_types"(58)
    push_eh $P138
    .lex "$value", param_139
    new $P140, "Exception"
    set $P140['type'], 58
    get_hll_global $P141, ["Matcher"], "EqualsArray"
    find_lex $P142, "$value"
    unless_null $P142, vivify_69
    new $P142, "Undef"
  vivify_69:
    $P143 = $P141."new"($P142)
    setattribute $P140, 'payload', $P143
    throw $P140
    .return ()
  control_137:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P144, exception, "payload"
    .return ($P144)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "false"  :subid("25_1256295830.78116") :outer("11_1256295830.78116")
    new $P147, 'ExceptionHandler'
    set_addr $P147, control_146
    $P147."handle_types"(58)
    push_eh $P147
    new $P148, "Exception"
    set $P148['type'], 58
    get_hll_global $P149, ["Matcher"], "False"
    $P150 = $P149."new"()
    setattribute $P148, 'payload', $P150
    throw $P148
    .return ()
  control_146:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P151, exception, "payload"
    .return ($P151)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "has"  :subid("26_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_155
    new $P154, 'ExceptionHandler'
    set_addr $P154, control_153
    $P154."handle_types"(58)
    push_eh $P154
    .lex "$matcher", param_155
    new $P156, "Exception"
    set $P156['type'], 58
    get_hll_global $P157, ["Matcher"], "DescribedAs"
    find_lex $P158, "$matcher"
    unless_null $P158, vivify_70
    new $P158, "Undef"
  vivify_70:
    $P159 = $P157."new"("has", $P158)
    setattribute $P156, 'payload', $P159
    throw $P156
    .return ()
  control_153:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P160, exception, "payload"
    .return ($P160)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "instance_of"  :subid("27_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_164
    new $P163, 'ExceptionHandler'
    set_addr $P163, control_162
    $P163."handle_types"(58)
    push_eh $P163
    .lex "$type", param_164
    new $P165, "Exception"
    set $P165['type'], 58
    get_hll_global $P166, ["Matcher"], "InstanceOf"
    find_lex $P167, "$type"
    unless_null $P167, vivify_71
    new $P167, "Undef"
  vivify_71:
    $P168 = $P166."new"($P167)
    setattribute $P165, 'payload', $P168
    throw $P165
    .return ()
  control_162:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P169, exception, "payload"
    .return ($P169)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_is_Float"  :subid("28_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_173
    new $P172, 'ExceptionHandler'
    set_addr $P172, control_171
    $P172."handle_types"(58)
    push_eh $P172
    .lex "$value", param_173
    new $P174, "Exception"
    set $P174['type'], 58
    get_hll_global $P175, ["Matcher"], "EqualsFloat"
    find_lex $P176, "$value"
    unless_null $P176, vivify_72
    new $P176, "Undef"
  vivify_72:
    $P177 = $P175."new"($P176)
    $P178 = "is"($P177)
    setattribute $P174, 'payload', $P178
    throw $P174
    .return ()
  control_171:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P179, exception, "payload"
    .return ($P179)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_is_Integer"  :subid("29_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_183
    new $P182, 'ExceptionHandler'
    set_addr $P182, control_181
    $P182."handle_types"(58)
    push_eh $P182
    .lex "$value", param_183
    new $P184, "Exception"
    set $P184['type'], 58
    get_hll_global $P185, ["Matcher"], "Equals"
    find_lex $P186, "$value"
    unless_null $P186, vivify_73
    new $P186, "Undef"
  vivify_73:
    $P187 = $P185."new"($P186, "Integer" :named("match_type"))
    $P188 = "is"($P187)
    setattribute $P184, 'payload', $P188
    throw $P184
    .return ()
  control_181:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P189, exception, "payload"
    .return ($P189)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_is_Matcher"  :subid("30_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_193
    new $P192, 'ExceptionHandler'
    set_addr $P192, control_191
    $P192."handle_types"(58)
    push_eh $P192
    .lex "$matcher", param_193
    new $P194, "Exception"
    set $P194['type'], 58
    get_hll_global $P195, ["Matcher"], "DescribedAs"
    find_lex $P196, "$matcher"
    unless_null $P196, vivify_74
    new $P196, "Undef"
  vivify_74:
    $P197 = $P195."new"("is", $P196)
    setattribute $P194, 'payload', $P197
    throw $P194
    .return ()
  control_191:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P198, exception, "payload"
    .return ($P198)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_is_String"  :subid("31_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_202
    new $P201, 'ExceptionHandler'
    set_addr $P201, control_200
    $P201."handle_types"(58)
    push_eh $P201
    .lex "$value", param_202
    new $P203, "Exception"
    set $P203['type'], 58
    get_hll_global $P204, ["Matcher"], "Equals"
    find_lex $P205, "$value"
    unless_null $P205, vivify_75
    new $P205, "Undef"
  vivify_75:
    $P206 = $P204."new"($P205, "String" :named("match_type"))
    $P207 = "is"($P206)
    setattribute $P203, 'payload', $P207
    throw $P203
    .return ()
  control_200:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P208, exception, "payload"
    .return ($P208)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_make_Float"  :subid("32_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_212
    new $P211, 'ExceptionHandler'
    set_addr $P211, control_210
    $P211."handle_types"(58)
    push_eh $P211
    .lex "$value", param_212
    new $P213, "Exception"
    set $P213['type'], 58
    find_lex $P214, "$value"
    unless_null $P214, vivify_76
    new $P214, "Undef"
  vivify_76:
    $P215 = "equals"($P214)
    setattribute $P213, 'payload', $P215
    throw $P213
    .return ()
  control_210:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P216, exception, "payload"
    .return ($P216)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_make_Integer"  :subid("33_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_220
    new $P219, 'ExceptionHandler'
    set_addr $P219, control_218
    $P219."handle_types"(58)
    push_eh $P219
    .lex "$value", param_220
    new $P221, "Exception"
    set $P221['type'], 58
    find_lex $P222, "$value"
    unless_null $P222, vivify_77
    new $P222, "Undef"
  vivify_77:
    $P223 = "equals"($P222)
    setattribute $P221, 'payload', $P223
    throw $P221
    .return ()
  control_218:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P224, exception, "payload"
    .return ($P224)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_make_Matcher"  :subid("34_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_228
    new $P227, 'ExceptionHandler'
    set_addr $P227, control_226
    $P227."handle_types"(58)
    push_eh $P227
    .lex "$matcher", param_228
    new $P229, "Exception"
    set $P229['type'], 58
    find_lex $P230, "$matcher"
    unless_null $P230, vivify_78
    new $P230, "Undef"
  vivify_78:
    setattribute $P229, 'payload', $P230
    throw $P229
    .return ()
  control_226:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P231, exception, "payload"
    .return ($P231)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_make_String"  :subid("35_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_235
    new $P234, 'ExceptionHandler'
    set_addr $P234, control_233
    $P234."handle_types"(58)
    push_eh $P234
    .lex "$value", param_235
    new $P236, "Exception"
    set $P236['type'], 58
    find_lex $P237, "$value"
    unless_null $P237, vivify_79
    new $P237, "Undef"
  vivify_79:
    $P238 = "equals"($P237)
    setattribute $P236, 'payload', $P238
    throw $P236
    .return ()
  control_233:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P239, exception, "payload"
    .return ($P239)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "make_matcher_list"  :subid("36_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_243
    .const 'Sub' $P248 = "37_1256295830.78116" 
    capture_lex $P248
    new $P242, 'ExceptionHandler'
    set_addr $P242, control_241
    $P242."handle_types"(58)
    push_eh $P242
    .lex "@list", param_243
    get_hll_global $P244, ["Array"], "empty"
    $P245 = $P244()
    .lex "@matchers", $P245
    new $P255, 'ExceptionHandler'
    set_addr $P255, loop254_handler
    $P255."handle_types"(65, 67, 66)
    push_eh $P255
  loop254_test:
    find_lex $P246, "@list"
    unless_null $P246, vivify_80
    new $P246, "ResizablePMCArray"
  vivify_80:
    unless $P246, loop254_done
  loop254_redo:
    .const 'Sub' $P248 = "37_1256295830.78116" 
    capture_lex $P248
    $P248()
  loop254_next:
    goto loop254_test
  loop254_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P256, exception, 'type'
    eq $P256, 65, loop254_next
    eq $P256, 67, loop254_redo
  loop254_done:
    pop_eh 
    new $P257, "Exception"
    set $P257['type'], 58
    get_hll_global $P258, ["Matcher"], "AnyOne"
    find_lex $P259, "@matchers"
    unless_null $P259, vivify_83
    new $P259, "ResizablePMCArray"
  vivify_83:
    $P260 = $P258($P259)
    setattribute $P257, 'payload', $P260
    throw $P257
    .return ()
  control_241:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P261, exception, "payload"
    .return ($P261)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_block247"  :anon :subid("37_1256295830.78116") :outer("36_1256295830.78116")
    find_lex $P249, "@matchers"
    unless_null $P249, vivify_81
    new $P249, "ResizablePMCArray"
  vivify_81:
    find_lex $P250, "@list"
    unless_null $P250, vivify_82
    new $P250, "ResizablePMCArray"
  vivify_82:
    $P251 = $P250."shift"()
    $P252 = "make_matcher"($P251)
    $P253 = $P249."push"($P252)
    .return ($P253)
.end


.namespace ["Matcher";"Factory"]
.sub "_not_Float"  :subid("38_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_265
    new $P264, 'ExceptionHandler'
    set_addr $P264, control_263
    $P264."handle_types"(58)
    push_eh $P264
    .lex "$value", param_265
    new $P266, "Exception"
    set $P266['type'], 58
    find_lex $P267, "$value"
    unless_null $P267, vivify_84
    new $P267, "Undef"
  vivify_84:
    $P268 = "is"($P267)
    $P269 = "not"($P268)
    setattribute $P266, 'payload', $P269
    throw $P266
    .return ()
  control_263:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P270, exception, "payload"
    .return ($P270)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_not_Integer"  :subid("39_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_274
    new $P273, 'ExceptionHandler'
    set_addr $P273, control_272
    $P273."handle_types"(58)
    push_eh $P273
    .lex "$value", param_274
    new $P275, "Exception"
    set $P275['type'], 58
    find_lex $P276, "$value"
    unless_null $P276, vivify_85
    new $P276, "Undef"
  vivify_85:
    $P277 = "is"($P276)
    $P278 = "not"($P277)
    setattribute $P275, 'payload', $P278
    throw $P275
    .return ()
  control_272:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P279, exception, "payload"
    .return ($P279)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_not_Matcher"  :subid("40_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_283
    new $P282, 'ExceptionHandler'
    set_addr $P282, control_281
    $P282."handle_types"(58)
    push_eh $P282
    .lex "$matcher", param_283
    new $P284, "Exception"
    set $P284['type'], 58
    get_hll_global $P285, ["Matcher"], "Not"
    find_lex $P286, "$matcher"
    unless_null $P286, vivify_86
    new $P286, "Undef"
  vivify_86:
    $P287 = $P285."new"($P286)
    setattribute $P284, 'payload', $P287
    throw $P284
    .return ()
  control_281:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P288, exception, "payload"
    .return ($P288)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_not_String"  :subid("41_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_292
    new $P291, 'ExceptionHandler'
    set_addr $P291, control_290
    $P291."handle_types"(58)
    push_eh $P291
    .lex "$value", param_292
    new $P293, "Exception"
    set $P293['type'], 58
    find_lex $P294, "$value"
    unless_null $P294, vivify_87
    new $P294, "Undef"
  vivify_87:
    $P295 = "is"($P294)
    $P296 = "not"($P295)
    setattribute $P293, 'payload', $P296
    throw $P293
    .return ()
  control_290:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P297, exception, "payload"
    .return ($P297)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "null"  :subid("42_1256295830.78116") :outer("11_1256295830.78116")
    new $P300, 'ExceptionHandler'
    set_addr $P300, control_299
    $P300."handle_types"(58)
    push_eh $P300
    new $P301, "Exception"
    set $P301['type'], 58
    get_hll_global $P302, ["Matcher"], "Null"
    $P303 = $P302."new"()
    setattribute $P301, 'payload', $P303
    throw $P301
    .return ()
  control_299:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P304, exception, "payload"
    .return ($P304)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_returns_Float"  :subid("43_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_308
    new $P307, 'ExceptionHandler'
    set_addr $P307, control_306
    $P307."handle_types"(58)
    push_eh $P307
    .lex "$value", param_308
    new $P309, "Exception"
    set $P309['type'], 58
    get_hll_global $P310, ["Matcher"], "IsCloseTo"
    find_lex $P311, "$value"
    unless_null $P311, vivify_88
    new $P311, "Undef"
  vivify_88:
    $P312 = $P310."new"($P311)
    $P313 = "returns"($P312)
    setattribute $P309, 'payload', $P313
    throw $P309
    .return ()
  control_306:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P314, exception, "payload"
    .return ($P314)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_returns_Integer"  :subid("44_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_318
    new $P317, 'ExceptionHandler'
    set_addr $P317, control_316
    $P317."handle_types"(58)
    push_eh $P317
    .lex "$value", param_318
    new $P319, "Exception"
    set $P319['type'], 58
    get_hll_global $P320, ["Matcher"], "Equals"
    find_lex $P321, "$value"
    unless_null $P321, vivify_89
    new $P321, "Undef"
  vivify_89:
    $P322 = $P320."new"($P321)
    $P323 = "returns"($P322)
    setattribute $P319, 'payload', $P323
    throw $P319
    .return ()
  control_316:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P324, exception, "payload"
    .return ($P324)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_returns_Matcher"  :subid("45_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_328
    new $P327, 'ExceptionHandler'
    set_addr $P327, control_326
    $P327."handle_types"(58)
    push_eh $P327
    .lex "$value", param_328
    new $P329, "Exception"
    set $P329['type'], 58
    get_hll_global $P330, ["Matcher"], "DescribedAs"
    find_lex $P331, "$value"
    unless_null $P331, vivify_90
    new $P331, "Undef"
  vivify_90:
    $P332 = $P330."new"("returns", $P331)
    setattribute $P329, 'payload', $P332
    throw $P329
    .return ()
  control_326:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P333, exception, "payload"
    .return ($P333)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_returns_String"  :subid("46_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_337
    new $P336, 'ExceptionHandler'
    set_addr $P336, control_335
    $P336."handle_types"(58)
    push_eh $P336
    .lex "$value", param_337
    new $P338, "Exception"
    set $P338['type'], 58
    get_hll_global $P339, ["Matcher"], "Equals"
    find_lex $P340, "$value"
    unless_null $P340, vivify_91
    new $P340, "Undef"
  vivify_91:
    $P341 = $P339."new"($P340)
    $P342 = "returns"($P341)
    setattribute $P338, 'payload', $P342
    throw $P338
    .return ()
  control_335:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P343, exception, "payload"
    .return ($P343)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "same_as"  :subid("47_1256295830.78116") :outer("11_1256295830.78116")
    .param pmc param_347
    new $P346, 'ExceptionHandler'
    set_addr $P346, control_345
    $P346."handle_types"(58)
    push_eh $P346
    .lex "$value", param_347
    new $P348, "Exception"
    set $P348['type'], 58
    get_hll_global $P349, ["Matcher"], "IdenticalTo"
    find_lex $P350, "$value"
    unless_null $P350, vivify_92
    new $P350, "Undef"
  vivify_92:
    $P351 = $P349."new"($P350)
    setattribute $P348, 'payload', $P351
    throw $P348
    .return ()
  control_345:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P352, exception, "payload"
    .return ($P352)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "true"  :subid("48_1256295830.78116") :outer("11_1256295830.78116")
    new $P355, 'ExceptionHandler'
    set_addr $P355, control_354
    $P355."handle_types"(58)
    push_eh $P355
    new $P356, "Exception"
    set $P356['type'], 58
    get_hll_global $P357, ["Matcher"], "True"
    $P358 = $P357."new"()
    setattribute $P356, 'payload', $P358
    throw $P356
    .return ()
  control_354:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P359, exception, "payload"
    .return ($P359)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256219093.52899")
    get_hll_global $P14, ["Matcher";"IdenticalTo"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"IdenticalTo"]
.sub "_block13" :init :load :subid("11_1256219093.52899")
    .const 'Sub' $P69 = "18_1256219093.52899" 
    capture_lex $P69
    .const 'Sub' $P59 = "17_1256219093.52899" 
    capture_lex $P59
    .const 'Sub' $P43 = "15_1256219093.52899" 
    capture_lex $P43
    .const 'Sub' $P32 = "14_1256219093.52899" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1256219093.52899" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P69 = "18_1256219093.52899" 
    capture_lex $P69
    .return ($P69)
.end


.namespace ["Matcher";"IdenticalTo"]
.sub "_ONLOAD"  :subid("12_1256219093.52899") :outer("11_1256219093.52899")
    .const 'Sub' $P21 = "13_1256219093.52899" 
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
    .const 'Sub' $P21 = "13_1256219093.52899" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    new $P26, "String"
    assign $P26, "Matcher::IdenticalTo"
    .lex "$class_name", $P26
    find_lex $P27, "$class_name"
    unless_null $P27, vivify_20
    new $P27, "Undef"
  vivify_20:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_21
    new $P29, "Undef"
  vivify_21:
    $P30 = $P28($P29, "Matcher::TypeSafe")
    .return ($P30)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P31, exception, "payload"
    .return ($P31)
    rethrow exception
.end


.namespace ["Matcher";"IdenticalTo"]
.sub "_block20"  :anon :subid("13_1256219093.52899") :outer("12_1256219093.52899")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"IdenticalTo"]
.sub "describe_self"  :subid("14_1256219093.52899") :method :outer("11_1256219093.52899")
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
    unless_null $P37, vivify_22
    new $P37, "Undef"
  vivify_22:
    concat $P38, $P37, "the same object as "
    find_lex $P39, "self"
    $S40 = $P39."value"()
    concat $P41, $P38, $S40
    setattribute $P36, 'payload', $P41
    throw $P36
    .return ()
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P42, exception, "payload"
    .return ($P42)
    rethrow exception
.end


.namespace ["Matcher";"IdenticalTo"]
.sub "init"  :subid("15_1256219093.52899") :method :outer("11_1256219093.52899")
    .param pmc param_46
    .param pmc param_47
    .const 'Sub' $P52 = "16_1256219093.52899" 
    capture_lex $P52
    new $P45, 'ExceptionHandler'
    set_addr $P45, control_44
    $P45."handle_types"(58)
    push_eh $P45
    .lex "self", self
    .lex "@children", param_46
    .lex "%attributes", param_47
    find_lex $P49, "@children"
    unless_null $P49, vivify_23
    new $P49, "ResizablePMCArray"
  vivify_23:
    set $N50, $P49
    if $N50, unless_48_end
    .const 'Sub' $P52 = "16_1256219093.52899" 
    capture_lex $P52
    $P52()
  unless_48_end:
    find_lex $P54, "self"
    find_lex $P55, "@children"
    unless_null $P55, vivify_24
    new $P55, "ResizablePMCArray"
  vivify_24:
    $P56 = $P55."shift"()
    $P57 = $P54."value"($P56)
    .return ($P57)
  control_44:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P58, exception, "payload"
    .return ($P58)
    rethrow exception
.end


.namespace ["Matcher";"IdenticalTo"]
.sub "_block51"  :anon :subid("16_1256219093.52899") :outer("15_1256219093.52899")
    $P53 = "DIE"("You must provide a comparison value for 'IdenticalTo' matcher.")
    .return ($P53)
.end


.namespace ["Matcher";"IdenticalTo"]
.sub "matches"  :subid("17_1256219093.52899") :method :outer("11_1256219093.52899")
    .param pmc param_62
    new $P61, 'ExceptionHandler'
    set_addr $P61, control_60
    $P61."handle_types"(58)
    push_eh $P61
    .lex "self", self
    .lex "$item", param_62
    find_lex $P63, "self"
    $P64 = $P63."value"()
    .lex "$value", $P64

			$P0 = find_lex '$value'
			$P1 = find_lex '$item'
			$I0 = issame $P1, $P0
			$P65 = box $I0
		
    .lex "$result", $P65
    new $P66, "Exception"
    set $P66['type'], 58
    find_lex $P67, "$result"
    unless_null $P67, vivify_25
    new $P67, "Undef"
  vivify_25:
    setattribute $P66, 'payload', $P67
    throw $P66
    .return ()
  control_60:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P68, exception, "payload"
    .return ($P68)
    rethrow exception
.end


.namespace ["Matcher";"IdenticalTo"]
.sub "value"  :subid("18_1256219093.52899") :method :outer("11_1256219093.52899")
    .param pmc param_72 :slurpy
    new $P71, 'ExceptionHandler'
    set_addr $P71, control_70
    $P71."handle_types"(58)
    push_eh $P71
    .lex "self", self
    .lex "@value", param_72
    find_lex $P73, "self"
    find_lex $P74, "@value"
    unless_null $P74, vivify_26
    new $P74, "ResizablePMCArray"
  vivify_26:
    $P75 = $P73."_ATTR"("value", $P74)
    .return ($P75)
  control_70:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P76, exception, "payload"
    .return ($P76)
    rethrow exception
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256255772.51689")
    get_hll_global $P14, ["Matcher";"InstanceOf"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"InstanceOf"]
.sub "_block13" :init :load :subid("11_1256255772.51689")
    .const 'Sub' $P120 = "23_1256255772.51689" 
    capture_lex $P120
    .const 'Sub' $P112 = "22_1256255772.51689" 
    capture_lex $P112
    .const 'Sub' $P87 = "19_1256255772.51689" 
    capture_lex $P87
    .const 'Sub' $P66 = "17_1256255772.51689" 
    capture_lex $P66
    .const 'Sub' $P54 = "16_1256255772.51689" 
    capture_lex $P54
    .const 'Sub' $P32 = "14_1256255772.51689" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1256255772.51689" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P120 = "23_1256255772.51689" 
    capture_lex $P120
    .return ($P120)
.end


.namespace ["Matcher";"InstanceOf"]
.sub "_ONLOAD"  :subid("12_1256255772.51689") :outer("11_1256255772.51689")
    .const 'Sub' $P21 = "13_1256255772.51689" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_25
    new $P19, "Undef"
  vivify_25:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256255772.51689" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
    get_hll_global $P25, ["Parrot"], "IMPORT"
    $P25("Dumper")
    new $P26, "String"
    assign $P26, "Matcher::InstanceOf"
    .lex "$class_name", $P26
    find_lex $P27, "$class_name"
    unless_null $P27, vivify_26
    new $P27, "Undef"
  vivify_26:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_27
    new $P29, "Undef"
  vivify_27:
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


.namespace ["Matcher";"InstanceOf"]
.sub "_block20"  :anon :subid("13_1256255772.51689") :outer("12_1256255772.51689")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"InstanceOf"]
.sub "describe_failure"  :subid("14_1256255772.51689") :method :outer("11_1256255772.51689")
    .param pmc param_35
    .param pmc param_36
    .const 'Sub' $P42 = "15_1256255772.51689" 
    capture_lex $P42
    new $P34, 'ExceptionHandler'
    set_addr $P34, control_33
    $P34."handle_types"(58)
    push_eh $P34
    .lex "self", self
    .lex "$item", param_35
    .lex "$description", param_36
    get_hll_global $P38, ["Parrot"], "is_null"
    find_lex $P39, "$item"
    unless_null $P39, vivify_28
    new $P39, "Undef"
  vivify_28:
    $P40 = $P38($P39)
    unless $P40, if_37_end
    .const 'Sub' $P42 = "15_1256255772.51689" 
    capture_lex $P42
    $P42()
  if_37_end:
    new $P46, "Exception"
    set $P46['type'], 58
    find_lex $P47, "$description"
    unless_null $P47, vivify_30
    new $P47, "Undef"
  vivify_30:
    concat $P48, $P47, "had type: "
    get_hll_global $P49, ["Parrot"], "typeof"
    find_lex $P50, "$item"
    unless_null $P50, vivify_31
    new $P50, "Undef"
  vivify_31:
    $S51 = $P49($P50)
    concat $P52, $P48, $S51
    setattribute $P46, 'payload', $P52
    throw $P46
    .return ()
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P53, exception, "payload"
    .return ($P53)
    rethrow exception
.end


.namespace ["Matcher";"InstanceOf"]
.sub "_block41"  :anon :subid("15_1256255772.51689") :outer("14_1256255772.51689")
    new $P43, "Exception"
    set $P43['type'], 58
    find_lex $P44, "$description"
    unless_null $P44, vivify_29
    new $P44, "Undef"
  vivify_29:
    concat $P45, $P44, "was null"
    setattribute $P43, 'payload', $P45
    throw $P43
    .return ()
.end


.namespace ["Matcher";"InstanceOf"]
.sub "describe_self"  :subid("16_1256255772.51689") :method :outer("11_1256255772.51689")
    .param pmc param_57
    new $P56, 'ExceptionHandler'
    set_addr $P56, control_55
    $P56."handle_types"(58)
    push_eh $P56
    .lex "self", self
    .lex "$description", param_57
    new $P58, "Exception"
    set $P58['type'], 58
    find_lex $P59, "$description"
    unless_null $P59, vivify_32
    new $P59, "Undef"
  vivify_32:
    concat $P60, $P59, "an instance of type '"
    find_lex $P61, "self"
    $S62 = $P61."type_name"()
    concat $P63, $P60, $S62
    concat $P64, $P63, "'"
    setattribute $P58, 'payload', $P64
    throw $P58
    .return ()
  control_55:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P65, exception, "payload"
    .return ($P65)
    rethrow exception
.end


.namespace ["Matcher";"InstanceOf"]
.sub "init"  :subid("17_1256255772.51689") :method :outer("11_1256255772.51689")
    .param pmc param_69
    .param pmc param_70
    .const 'Sub' $P80 = "18_1256255772.51689" 
    capture_lex $P80
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
    unless_null $P73, vivify_33
    new $P73, "ResizablePMCArray"
  vivify_33:
    find_lex $P74, "%opts"
    unless_null $P74, vivify_34
    new $P74, "Hash"
  vivify_34:
    $P71($P72, $P73, $P74)
    find_lex $P77, "@args"
    unless_null $P77, vivify_35
    new $P77, "ResizablePMCArray"
  vivify_35:
    set $N78, $P77
    if $N78, if_76
    new $P75, 'Float'
    set $P75, $N78
    goto if_76_end
  if_76:
    .const 'Sub' $P80 = "18_1256255772.51689" 
    capture_lex $P80
    $P85 = $P80()
    set $P75, $P85
  if_76_end:
    .return ($P75)
  control_67:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P86, exception, "payload"
    .return ($P86)
    rethrow exception
.end


.namespace ["Matcher";"InstanceOf"]
.sub "_block79"  :anon :subid("18_1256255772.51689") :outer("17_1256255772.51689")
    find_lex $P81, "self"
    find_lex $P82, "@args"
    unless_null $P82, vivify_36
    new $P82, "ResizablePMCArray"
  vivify_36:
    $P83 = $P82."shift"()
    $P84 = $P81."type"($P83)
    .return ($P84)
.end


.namespace ["Matcher";"InstanceOf"]
.sub "matches"  :subid("19_1256255772.51689") :method :outer("11_1256255772.51689")
    .param pmc param_90
    .const 'Sub' $P106 = "21_1256255772.51689" 
    capture_lex $P106
    .const 'Sub' $P96 = "20_1256255772.51689" 
    capture_lex $P96
    new $P89, 'ExceptionHandler'
    set_addr $P89, control_88
    $P89."handle_types"(58)
    push_eh $P89
    .lex "self", self
    .lex "$item", param_90
    get_hll_global $P92, ["Parrot"], "is_null"
    find_lex $P93, "$item"
    unless_null $P93, vivify_37
    new $P93, "Undef"
  vivify_37:
    $P94 = $P92($P93)
    unless $P94, if_91_end
    .const 'Sub' $P96 = "20_1256255772.51689" 
    capture_lex $P96
    $P96()
  if_91_end:
    get_hll_global $P100, ["Parrot"], "isa"
    find_lex $P101, "$item"
    unless_null $P101, vivify_38
    new $P101, "Undef"
  vivify_38:
    find_lex $P102, "self"
    $P103 = $P102."type"()
    $P104 = $P100($P101, $P103)
    unless $P104, if_99_end
    .const 'Sub' $P106 = "21_1256255772.51689" 
    capture_lex $P106
    $P106()
  if_99_end:
    new $P109, "Exception"
    set $P109['type'], 58
    new $P110, "Integer"
    assign $P110, 0
    setattribute $P109, 'payload', $P110
    throw $P109
    .return ()
  control_88:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
    rethrow exception
.end


.namespace ["Matcher";"InstanceOf"]
.sub "_block95"  :anon :subid("20_1256255772.51689") :outer("19_1256255772.51689")
    new $P97, "Exception"
    set $P97['type'], 58
    new $P98, "Integer"
    assign $P98, 0
    setattribute $P97, 'payload', $P98
    throw $P97
    .return ()
.end


.namespace ["Matcher";"InstanceOf"]
.sub "_block105"  :anon :subid("21_1256255772.51689") :outer("19_1256255772.51689")
    new $P107, "Exception"
    set $P107['type'], 58
    new $P108, "Integer"
    assign $P108, 1
    setattribute $P107, 'payload', $P108
    throw $P107
    .return ()
.end


.namespace ["Matcher";"InstanceOf"]
.sub "type"  :subid("22_1256255772.51689") :method :outer("11_1256255772.51689")
    .param pmc param_115 :slurpy
    new $P114, 'ExceptionHandler'
    set_addr $P114, control_113
    $P114."handle_types"(58)
    push_eh $P114
    .lex "self", self
    .lex "@value", param_115
    find_lex $P116, "self"
    find_lex $P117, "@value"
    unless_null $P117, vivify_39
    new $P117, "ResizablePMCArray"
  vivify_39:
    $P118 = $P116."_ATTR"("type", $P117)
    .return ($P118)
  control_113:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P119, exception, "payload"
    .return ($P119)
    rethrow exception
.end


.namespace ["Matcher";"InstanceOf"]
.sub "type_name"  :subid("23_1256255772.51689") :method :outer("11_1256255772.51689")
    .const 'Sub' $P131 = "24_1256255772.51689" 
    capture_lex $P131
    new $P122, 'ExceptionHandler'
    set_addr $P122, control_121
    $P122."handle_types"(58)
    push_eh $P122
    .lex "self", self
    find_lex $P123, "self"
    $P124 = $P123."type"()
    .lex "$type", $P124
    find_lex $P125, "$type"
    unless_null $P125, vivify_40
    new $P125, "Undef"
  vivify_40:
    .lex "$type_name", $P125
    get_hll_global $P127, ["Parrot"], "isa"
    find_lex $P128, "$type"
    unless_null $P128, vivify_41
    new $P128, "Undef"
  vivify_41:
    $P129 = $P127($P128, "String")
    if $P129, unless_126_end
    .const 'Sub' $P131 = "24_1256255772.51689" 
    capture_lex $P131
    $P131()
  unless_126_end:
    new $P135, "Exception"
    set $P135['type'], 58
    find_lex $P136, "$type_name"
    unless_null $P136, vivify_43
    new $P136, "Undef"
  vivify_43:
    setattribute $P135, 'payload', $P136
    throw $P135
    .return ()
  control_121:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P137, exception, "payload"
    .return ($P137)
    rethrow exception
.end


.namespace ["Matcher";"InstanceOf"]
.sub "_block130"  :anon :subid("24_1256255772.51689") :outer("23_1256255772.51689")
    get_hll_global $P132, ["Parrot"], "typeof"
    find_lex $P133, "$type"
    unless_null $P133, vivify_42
    new $P133, "Undef"
  vivify_42:
    $P134 = $P132($P133)
    store_lex "$type_name", $P134
    .return ($P134)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1256252960.12447")
    get_hll_global $P14, ["Matcher"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher"]
.sub "_block13" :init :load :subid("11_1256252960.12447")
    .const 'Sub' $P62 = "17_1256252960.12447" 
    capture_lex $P62
    .const 'Sub' $P51 = "16_1256252960.12447" 
    capture_lex $P51
    .const 'Sub' $P44 = "15_1256252960.12447" 
    capture_lex $P44
    .const 'Sub' $P32 = "14_1256252960.12447" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1256252960.12447" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P62 = "17_1256252960.12447" 
    capture_lex $P62
    .return ($P62)
.end


.namespace ["Matcher"]
.sub "_ONLOAD"  :subid("12_1256252960.12447") :outer("11_1256252960.12447")
    .const 'Sub' $P21 = "13_1256252960.12447" 
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
    .const 'Sub' $P21 = "13_1256252960.12447" 
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
.sub "_block20"  :anon :subid("13_1256252960.12447") :outer("12_1256252960.12447")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher"]
.sub "describe_failure"  :subid("14_1256252960.12447") :method :outer("11_1256252960.12447")
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
.sub "describe_self"  :subid("15_1256252960.12447") :method :outer("11_1256252960.12447")
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
.sub "init"  :subid("16_1256252960.12447") :method :outer("11_1256252960.12447")
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
.sub "matches"  :subid("17_1256252960.12447") :method :outer("11_1256252960.12447")
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
.sub "_block11"  :anon :subid("10_1256257074.72654")
    get_hll_global $P14, ["Matcher";"TypeSafe"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"TypeSafe"]
.sub "_block13" :init :load :subid("11_1256257074.72654")
    .const 'Sub' $P106 = "22_1256257074.72654" 
    capture_lex $P106
    .const 'Sub' $P98 = "21_1256257074.72654" 
    capture_lex $P98
    .const 'Sub' $P79 = "19_1256257074.72654" 
    capture_lex $P79
    .const 'Sub' $P68 = "18_1256257074.72654" 
    capture_lex $P68
    .const 'Sub' $P32 = "14_1256257074.72654" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1256257074.72654" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P106 = "22_1256257074.72654" 
    capture_lex $P106
    .return ($P106)
.end


.namespace ["Matcher";"TypeSafe"]
.sub "_ONLOAD"  :subid("12_1256257074.72654") :outer("11_1256257074.72654")
    .const 'Sub' $P21 = "13_1256257074.72654" 
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
    .const 'Sub' $P21 = "13_1256257074.72654" 
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
.sub "_block20"  :anon :subid("13_1256257074.72654") :outer("12_1256257074.72654")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"TypeSafe"]
.sub "describe_failure"  :subid("14_1256257074.72654") :method :outer("11_1256257074.72654")
    .param pmc param_35
    .param pmc param_36
    .const 'Sub' $P57 = "17_1256257074.72654" 
    capture_lex $P57
    .const 'Sub' $P49 = "16_1256257074.72654" 
    capture_lex $P49
    .const 'Sub' $P43 = "15_1256257074.72654" 
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
    .const 'Sub' $P57 = "17_1256257074.72654" 
    capture_lex $P57
    $P57()
    goto if_45_end
  if_45:
    .const 'Sub' $P49 = "16_1256257074.72654" 
    capture_lex $P49
    $P49()
  if_45_end:
    goto if_38_end
  if_38:
    .const 'Sub' $P43 = "15_1256257074.72654" 
    capture_lex $P43
    $P43()
  if_38_end:
    new $P63, "Exception"
    set $P63['type'], 58
    find_lex $P64, "$description"
    unless_null $P64, vivify_30
    new $P64, "Undef"
  vivify_30:
    find_lex $P65, "$failure"
    unless_null $P65, vivify_31
    new $P65, "Undef"
  vivify_31:
    concat $P66, $P64, $P65
    setattribute $P63, 'payload', $P66
    throw $P63
    .return ()
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P67, exception, "payload"
    .return ($P67)
    rethrow exception
.end


.namespace ["Matcher";"TypeSafe"]
.sub "_block56"  :anon :subid("17_1256257074.72654") :outer("14_1256257074.72654")
    new $P58, "Exception"
    set $P58['type'], 58
    find_lex $P59, "self"
    find_lex $P60, "$item"
    unless_null $P60, vivify_27
    new $P60, "Undef"
  vivify_27:
    find_lex $P61, "$description"
    unless_null $P61, vivify_28
    new $P61, "Undef"
  vivify_28:
    $P62 = $P59."describe_failure_typesafe"($P60, $P61)
    setattribute $P58, 'payload', $P62
    throw $P58
    .return ()
.end


.namespace ["Matcher";"TypeSafe"]
.sub "_block48"  :anon :subid("16_1256257074.72654") :outer("14_1256257074.72654")
    new $P50, "String"
    assign $P50, "was the wrong type ('"
    get_hll_global $P51, ["Parrot"], "typeof"
    find_lex $P52, "$item"
    unless_null $P52, vivify_29
    new $P52, "Undef"
  vivify_29:
    $S53 = $P51($P52)
    concat $P54, $P50, $S53
    concat $P55, $P54, "')"
    store_lex "$failure", $P55
    .return ($P55)
.end


.namespace ["Matcher";"TypeSafe"]
.sub "_block42"  :anon :subid("15_1256257074.72654") :outer("14_1256257074.72654")
    new $P44, "String"
    assign $P44, "was null"
    store_lex "$failure", $P44
    .return ($P44)
.end


.namespace ["Matcher";"TypeSafe"]
.sub "describe_failure_typesafe"  :subid("18_1256257074.72654") :method :outer("11_1256257074.72654")
    .param pmc param_71
    .param pmc param_72
    new $P70, 'ExceptionHandler'
    set_addr $P70, control_69
    $P70."handle_types"(58)
    push_eh $P70
    .lex "self", self
    .lex "$item", param_71
    .lex "$description", param_72
    new $P73, "Exception"
    set $P73['type'], 58
    find_lex $P74, "$description"
    unless_null $P74, vivify_32
    new $P74, "Undef"
  vivify_32:
    concat $P75, $P74, "was: "
    find_lex $P76, "$item"
    unless_null $P76, vivify_33
    new $P76, "Undef"
  vivify_33:
    concat $P77, $P75, $P76
    setattribute $P73, 'payload', $P77
    throw $P73
    .return ()
  control_69:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P78, exception, "payload"
    .return ($P78)
    rethrow exception
.end


.namespace ["Matcher";"TypeSafe"]
.sub "matches"  :subid("19_1256257074.72654") :method :outer("11_1256257074.72654")
    .param pmc param_82
    .const 'Sub' $P90 = "20_1256257074.72654" 
    capture_lex $P90
    new $P81, 'ExceptionHandler'
    set_addr $P81, control_80
    $P81."handle_types"(58)
    push_eh $P81
    .lex "self", self
    .lex "$item", param_82
    find_lex $P83, "self"
    $P83."wrong_type"(0)
    get_hll_global $P85, ["Parrot"], "is_null"
    find_lex $P86, "$item"
    unless_null $P86, vivify_34
    new $P86, "Undef"
  vivify_34:
    $P87 = $P85($P86)
    isfalse $I88, $P87
    unless $I88, if_84_end
    .const 'Sub' $P90 = "20_1256257074.72654" 
    capture_lex $P90
    $P90()
  if_84_end:
    new $P95, "Exception"
    set $P95['type'], 58
    new $P96, "Integer"
    assign $P96, 0
    setattribute $P95, 'payload', $P96
    throw $P95
    .return ()
  control_80:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P97, exception, "payload"
    .return ($P97)
    rethrow exception
.end


.namespace ["Matcher";"TypeSafe"]
.sub "_block89"  :anon :subid("20_1256257074.72654") :outer("19_1256257074.72654")
    new $P91, "Exception"
    set $P91['type'], 58
    find_lex $P92, "self"
    find_lex $P93, "$item"
    unless_null $P93, vivify_35
    new $P93, "Undef"
  vivify_35:
    $P94 = $P92."matches_typesafe"($P93)
    setattribute $P91, 'payload', $P94
    throw $P91
    .return ()
.end


.namespace ["Matcher";"TypeSafe"]
.sub "matches_typesafe"  :subid("21_1256257074.72654") :method :outer("11_1256257074.72654")
    .param pmc param_101
    new $P100, 'ExceptionHandler'
    set_addr $P100, control_99
    $P100."handle_types"(58)
    push_eh $P100
    .lex "self", self
    .lex "$item", param_101
    find_lex $P102, "self"
    $P102."wrong_type"(1)
    new $P103, "Exception"
    set $P103['type'], 58
    new $P104, "Integer"
    assign $P104, 0
    setattribute $P103, 'payload', $P104
    throw $P103
    .return ()
  control_99:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
    rethrow exception
.end


.namespace ["Matcher";"TypeSafe"]
.sub "wrong_type"  :subid("22_1256257074.72654") :method :outer("11_1256257074.72654")
    .param pmc param_109 :slurpy
    new $P108, 'ExceptionHandler'
    set_addr $P108, control_107
    $P108."handle_types"(58)
    push_eh $P108
    .lex "self", self
    .lex "@value", param_109
    find_lex $P110, "self"
    find_lex $P111, "@value"
    unless_null $P111, vivify_36
    new $P111, "ResizablePMCArray"
  vivify_36:
    $P112 = $P110."_ATTR"("wrong_type", $P111)
    .return ($P112)
  control_107:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, "payload"
    .return ($P113)
    rethrow exception
.end

# Nothing here yet.
