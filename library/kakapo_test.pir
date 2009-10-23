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
.sub "_block11"  :anon :subid("10_1256259143.31774")
    get_hll_global $P14, ["Testcase"], "_block13" 
    .return ($P14)
.end


.namespace ["Testcase"]
.sub "_block13" :init :load :subid("11_1256259143.31774")
    .const 'Sub' $P419 = "52_1256259143.31774" 
    capture_lex $P419
    .const 'Sub' $P413 = "51_1256259143.31774" 
    capture_lex $P413
    .const 'Sub' $P405 = "50_1256259143.31774" 
    capture_lex $P405
    .const 'Sub' $P367 = "47_1256259143.31774" 
    capture_lex $P367
    .const 'Sub' $P352 = "46_1256259143.31774" 
    capture_lex $P352
    .const 'Sub' $P324 = "44_1256259143.31774" 
    capture_lex $P324
    .const 'Sub' $P316 = "43_1256259143.31774" 
    capture_lex $P316
    .const 'Sub' $P308 = "42_1256259143.31774" 
    capture_lex $P308
    .const 'Sub' $P300 = "41_1256259143.31774" 
    capture_lex $P300
    .const 'Sub' $P292 = "40_1256259143.31774" 
    capture_lex $P292
    .const 'Sub' $P286 = "39_1256259143.31774" 
    capture_lex $P286
    .const 'Sub' $P253 = "36_1256259143.31774" 
    capture_lex $P253
    .const 'Sub' $P241 = "35_1256259143.31774" 
    capture_lex $P241
    .const 'Sub' $P233 = "34_1256259143.31774" 
    capture_lex $P233
    .const 'Sub' $P225 = "33_1256259143.31774" 
    capture_lex $P225
    .const 'Sub' $P217 = "32_1256259143.31774" 
    capture_lex $P217
    .const 'Sub' $P209 = "31_1256259143.31774" 
    capture_lex $P209
    .const 'Sub' $P201 = "30_1256259143.31774" 
    capture_lex $P201
    .const 'Sub' $P148 = "26_1256259143.31774" 
    capture_lex $P148
    .const 'Sub' $P139 = "25_1256259143.31774" 
    capture_lex $P139
    .const 'Sub' $P131 = "24_1256259143.31774" 
    capture_lex $P131
    .const 'Sub' $P123 = "23_1256259143.31774" 
    capture_lex $P123
    .const 'Sub' $P116 = "22_1256259143.31774" 
    capture_lex $P116
    .const 'Sub' $P108 = "21_1256259143.31774" 
    capture_lex $P108
    .const 'Sub' $P101 = "20_1256259143.31774" 
    capture_lex $P101
    .const 'Sub' $P65 = "18_1256259143.31774" 
    capture_lex $P65
    .const 'Sub' $P57 = "17_1256259143.31774" 
    capture_lex $P57
    .const 'Sub' $P50 = "16_1256259143.31774" 
    capture_lex $P50
    .const 'Sub' $P42 = "15_1256259143.31774" 
    capture_lex $P42
    .const 'Sub' $P35 = "14_1256259143.31774" 
    capture_lex $P35
    .const 'Sub' $P15 = "12_1256259143.31774" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P419 = "52_1256259143.31774" 
    capture_lex $P419
    .return ($P419)
.end


.namespace ["Testcase"]
.sub "_ONLOAD"  :subid("12_1256259143.31774") :outer("11_1256259143.31774")
    .const 'Sub' $P21 = "13_1256259143.31774" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_53
    new $P19, "Undef"
  vivify_53:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256259143.31774" 
    capture_lex $P21
    $P21()
  if_18_end:
    new $P24, "Integer"
    assign $P24, 1
    set_global "$onload_done", $P24
 load_bytecode 'library/kakapo.pbc' 
    get_hll_global $P25, "Registry"
    unless_null $P25, vivify_54
    new $P25, "Hash"
  vivify_54:
    set $P26, $P25["CONFIG"]
    unless_null $P26, vivify_55
    new $P26, "Undef"
  vivify_55:
    $P26."file"("kakapo.cfg")
    get_hll_global $P27, ["Parrot"], "IMPORT"
    $P27("Dumper")
    get_hll_global $P28, ["Parrot"], "IMPORT"
    $P28("Matcher::Factory")
    new $P29, "String"
    assign $P29, "Testcase"
    .lex "$class_name", $P29
    find_lex $P30, "$class_name"
    unless_null $P30, vivify_56
    new $P30, "Undef"
  vivify_56:
    "NOTE"("Creating class ", $P30)
    get_hll_global $P31, ["Class"], "SUBCLASS"
    find_lex $P32, "$class_name"
    unless_null $P32, vivify_57
    new $P32, "Undef"
  vivify_57:
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
.sub "_block20"  :anon :subid("13_1256259143.31774") :outer("12_1256259143.31774")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Testcase"]
.sub "after_methods"  :subid("14_1256259143.31774") :method :outer("11_1256259143.31774")
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
.sub "after_prefix"  :subid("15_1256259143.31774") :method :outer("11_1256259143.31774")
    .param pmc param_45 :slurpy
    new $P44, 'ExceptionHandler'
    set_addr $P44, control_43
    $P44."handle_types"(58)
    push_eh $P44
    .lex "self", self
    .lex "@value", param_45
    find_lex $P46, "self"
    find_lex $P47, "@value"
    unless_null $P47, vivify_58
    new $P47, "ResizablePMCArray"
  vivify_58:
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
.sub "afterall_methods"  :subid("16_1256259143.31774") :method :outer("11_1256259143.31774")
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
.sub "afterall_prefix"  :subid("17_1256259143.31774") :method :outer("11_1256259143.31774")
    .param pmc param_60 :slurpy
    new $P59, 'ExceptionHandler'
    set_addr $P59, control_58
    $P59."handle_types"(58)
    push_eh $P59
    .lex "self", self
    .lex "@value", param_60
    find_lex $P61, "self"
    find_lex $P62, "@value"
    unless_null $P62, vivify_59
    new $P62, "ResizablePMCArray"
  vivify_59:
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
.sub "assert_that"  :subid("18_1256259143.31774") :method :outer("11_1256259143.31774")
    .param pmc param_68
    .param pmc param_69
    .param pmc param_70
    .const 'Sub' $P84 = "19_1256259143.31774" 
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
    unless_null $P71, vivify_60
    new $P71, "Undef"
  vivify_60:
    find_lex $P72, "$item_desc"
    unless_null $P72, vivify_61
    new $P72, "Undef"
  vivify_61:
    concat $P73, $P72, " "
    $P74 = $P71."describe_self"($P73)
    .lex "$description", $P74
    find_lex $P75, "$matcher"
    unless_null $P75, vivify_62
    new $P75, "Undef"
  vivify_62:
    find_lex $P76, "$item"
    unless_null $P76, vivify_63
    new $P76, "Undef"
  vivify_63:
    $P77 = $P75."matches"($P76)
    .lex "$result", $P77
    find_lex $P78, "self"
    find_lex $P79, "$result"
    unless_null $P79, vivify_64
    new $P79, "Undef"
  vivify_64:
    find_lex $P80, "$description"
    unless_null $P80, vivify_65
    new $P80, "Undef"
  vivify_65:
    $P78."ok"($P79, $P80)
    find_lex $P82, "$result"
    unless_null $P82, vivify_66
    new $P82, "Undef"
  vivify_66:
    if $P82, unless_81_end
    .const 'Sub' $P84 = "19_1256259143.31774" 
    capture_lex $P84
    $P84()
  unless_81_end:
    new $P98, "Exception"
    set $P98['type'], 58
    find_lex $P99, "$result"
    unless_null $P99, vivify_72
    new $P99, "Undef"
  vivify_72:
    setattribute $P98, 'payload', $P99
    throw $P98
    .return ()
  control_66:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "_block83"  :anon :subid("19_1256259143.31774") :outer("18_1256259143.31774")
    find_lex $P85, "$matcher"
    unless_null $P85, vivify_67
    new $P85, "Undef"
  vivify_67:
    new $P86, "String"
    assign $P86, "Expected: "
    find_lex $P87, "$item_desc"
    unless_null $P87, vivify_68
    new $P87, "Undef"
  vivify_68:
    concat $P88, $P86, $P87
    concat $P89, $P88, " "
    $P90 = $P85."describe_self"($P89)
    find_lex $P91, "$matcher"
    unless_null $P91, vivify_69
    new $P91, "Undef"
  vivify_69:
    find_lex $P92, "$item"
    unless_null $P92, vivify_70
    new $P92, "Undef"
  vivify_70:
    $S93 = $P91."describe_failure"($P92, "\n     but: ")
    concat $P94, $P90, $S93
    .lex "$explain", $P94
    find_lex $P95, "self"
    find_lex $P96, "$explain"
    unless_null $P96, vivify_71
    new $P96, "Undef"
  vivify_71:
    $P97 = $P95."emit"($P96)
    .return ($P97)
.end


.namespace ["Testcase"]
.sub "before_methods"  :subid("20_1256259143.31774") :method :outer("11_1256259143.31774")
    .param pmc param_104 :slurpy
    new $P103, 'ExceptionHandler'
    set_addr $P103, control_102
    $P103."handle_types"(58)
    push_eh $P103
    .lex "self", self
    .lex "@value", param_104
    find_lex $P105, "self"
    $P106 = $P105."_ATTR_SETBY"("before_methods", "fetch_before_methods")
    .return ($P106)
  control_102:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "before_prefix"  :subid("21_1256259143.31774") :method :outer("11_1256259143.31774")
    .param pmc param_111 :slurpy
    new $P110, 'ExceptionHandler'
    set_addr $P110, control_109
    $P110."handle_types"(58)
    push_eh $P110
    .lex "self", self
    .lex "@value", param_111
    find_lex $P112, "self"
    find_lex $P113, "@value"
    unless_null $P113, vivify_73
    new $P113, "ResizablePMCArray"
  vivify_73:
    $P114 = $P112."_ATTR_DEFAULT"("before_prefix", $P113, "before_")
    .return ($P114)
  control_109:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, "payload"
    .return ($P115)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "beforeall_methods"  :subid("22_1256259143.31774") :method :outer("11_1256259143.31774")
    .param pmc param_119 :slurpy
    new $P118, 'ExceptionHandler'
    set_addr $P118, control_117
    $P118."handle_types"(58)
    push_eh $P118
    .lex "self", self
    .lex "@value", param_119
    find_lex $P120, "self"
    $P121 = $P120."_ATTR_SETBY"("beforeall_methods", "fetch_beforeall_methods")
    .return ($P121)
  control_117:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P122, exception, "payload"
    .return ($P122)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "beforeall_prefix"  :subid("23_1256259143.31774") :method :outer("11_1256259143.31774")
    .param pmc param_126 :slurpy
    new $P125, 'ExceptionHandler'
    set_addr $P125, control_124
    $P125."handle_types"(58)
    push_eh $P125
    .lex "self", self
    .lex "@value", param_126
    find_lex $P127, "self"
    find_lex $P128, "@value"
    unless_null $P128, vivify_74
    new $P128, "ResizablePMCArray"
  vivify_74:
    $P129 = $P127."_ATTR_DEFAULT"("beforeall_prefix", $P128, "beforeall_")
    .return ($P129)
  control_124:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P130, exception, "payload"
    .return ($P130)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "emit"  :subid("24_1256259143.31774") :method :outer("11_1256259143.31774")
    .param pmc param_134 :slurpy
    new $P133, 'ExceptionHandler'
    set_addr $P133, control_132
    $P133."handle_types"(58)
    push_eh $P133
    .lex "self", self
    .lex "@parts", param_134
    find_lex $P135, "@parts"
    unless_null $P135, vivify_75
    new $P135, "ResizablePMCArray"
  vivify_75:
    $P136 = $P135."join"()
    $P137 = "say"($P136)
    .return ($P137)
  control_132:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P138, exception, "payload"
    .return ($P138)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "note"  :subid("25_1256259143.31774") :method :outer("11_1256259143.31774")
    .param pmc param_142 :slurpy
    new $P141, 'ExceptionHandler'
    set_addr $P141, control_140
    $P141."handle_types"(58)
    push_eh $P141
    .lex "self", self
    .lex "@message", param_142
    find_lex $P143, "self"
    find_lex $P144, "@message"
    unless_null $P144, vivify_76
    new $P144, "ResizablePMCArray"
  vivify_76:
    $P145 = $P144."join"()
    $P146 = $P143."emit"("#\n", "# NOTE: ", $P145, "\n", "#")
    .return ($P146)
  control_140:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P147, exception, "payload"
    .return ($P147)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "fetch_methods"  :subid("26_1256259143.31774") :method :outer("11_1256259143.31774")
    .param pmc param_151 :optional :named("starting_with")
    .param int has_param_151 :opt_flag
    .const 'Sub' $P160 = "27_1256259143.31774" 
    capture_lex $P160
    new $P150, 'ExceptionHandler'
    set_addr $P150, control_149
    $P150."handle_types"(58)
    push_eh $P150
    .lex "self", self
    if has_param_151, optparam_77
    new $P152, "Undef"
    set param_151, $P152
  optparam_77:
    .lex "$starting_with", param_151
    find_lex $P153, "$starting_with"
    unless_null $P153, vivify_78
    new $P153, "Undef"
  vivify_78:
    "NOTE"("Fetching methods starting with: ", $P153)
    get_hll_global $P154, ["Class"], "get_method_list"
    find_lex $P155, "self"
    $P156 = $P154($P155)
    .lex "@list", $P156
    find_lex $P158, "$starting_with"
    unless_null $P158, vivify_79
    new $P158, "Undef"
  vivify_79:
    unless $P158, if_157_end
    .const 'Sub' $P160 = "27_1256259143.31774" 
    capture_lex $P160
    $P160()
  if_157_end:
    find_lex $P193, "@list"
    unless_null $P193, vivify_90
    new $P193, "ResizablePMCArray"
  vivify_90:
    set $N194, $P193
    find_lex $P195, "@list"
    unless_null $P195, vivify_91
    new $P195, "ResizablePMCArray"
  vivify_91:
    $P196 = $P195."join"(", ")
    "NOTE"("Got ", $N194, " methods: ", $P196)
    find_lex $P197, "@list"
    unless_null $P197, vivify_92
    new $P197, "ResizablePMCArray"
  vivify_92:
    "DUMP"($P197)
    new $P198, "Exception"
    set $P198['type'], 58
    find_lex $P199, "@list"
    unless_null $P199, vivify_93
    new $P199, "ResizablePMCArray"
  vivify_93:
    setattribute $P198, 'payload', $P199
    throw $P198
    .return ()
  control_149:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P200, exception, "payload"
    .return ($P200)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "_block159"  :anon :subid("27_1256259143.31774") :outer("26_1256259143.31774")
    .const 'Sub' $P170 = "28_1256259143.31774" 
    capture_lex $P170
    new $P161, "ResizablePMCArray"
    .lex "@matches", $P161
    get_hll_global $P162, ["String"], "length"
    find_lex $P163, "$starting_with"
    unless_null $P163, vivify_80
    new $P163, "Undef"
  vivify_80:
    $P164 = $P162($P163)
    .lex "$length", $P164
    find_lex $P166, "@list"
    unless_null $P166, vivify_81
    new $P166, "ResizablePMCArray"
  vivify_81:
    defined $I167, $P166
    unless $I167, for_undef_82
    iter $P165, $P166
    new $P190, 'ExceptionHandler'
    set_addr $P190, loop189_handler
    $P190."handle_types"(65, 67, 66)
    push_eh $P190
  loop189_test:
    unless $P165, loop189_done
    shift $P168, $P165
  loop189_redo:
    .const 'Sub' $P170 = "28_1256259143.31774" 
    capture_lex $P170
    $P170($P168)
  loop189_next:
    goto loop189_test
  loop189_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P191, exception, 'type'
    eq $P191, 65, loop189_next
    eq $P191, 67, loop189_redo
  loop189_done:
    pop_eh 
  for_undef_82:
    find_lex $P192, "@matches"
    unless_null $P192, vivify_89
    new $P192, "ResizablePMCArray"
  vivify_89:
    store_lex "@list", $P192
    .return ($P192)
.end


.namespace ["Testcase"]
.sub "_block169"  :anon :subid("28_1256259143.31774") :outer("27_1256259143.31774")
    .param pmc param_171
    .const 'Sub' $P184 = "29_1256259143.31774" 
    capture_lex $P184
    .lex "$_", param_171
    find_lex $P172, "$_"
    unless_null $P172, vivify_83
    new $P172, "Undef"
  vivify_83:
    set $S173, $P172
    new $P174, 'String'
    set $P174, $S173
    .lex "$method", $P174
    find_lex $P177, "$method"
    unless_null $P177, vivify_84
    new $P177, "Undef"
  vivify_84:
    find_lex $P178, "$length"
    unless_null $P178, vivify_85
    new $P178, "Undef"
  vivify_85:
    $S179 = $P177."substr"(0, $P178)
    find_lex $P180, "$starting_with"
    unless_null $P180, vivify_86
    new $P180, "Undef"
  vivify_86:
    set $S181, $P180
    iseq $I182, $S179, $S181
    if $I182, if_176
    new $P175, 'Integer'
    set $P175, $I182
    goto if_176_end
  if_176:
    .const 'Sub' $P184 = "29_1256259143.31774" 
    capture_lex $P184
    $P188 = $P184()
    set $P175, $P188
  if_176_end:
    .return ($P175)
.end


.namespace ["Testcase"]
.sub "_block183"  :anon :subid("29_1256259143.31774") :outer("28_1256259143.31774")
    find_lex $P185, "@matches"
    unless_null $P185, vivify_87
    new $P185, "ResizablePMCArray"
  vivify_87:
    find_lex $P186, "$method"
    unless_null $P186, vivify_88
    new $P186, "Undef"
  vivify_88:
    $P187 = $P185."push"($P186)
    .return ($P187)
.end


.namespace ["Testcase"]
.sub "fetch_after_methods"  :subid("30_1256259143.31774") :method :outer("11_1256259143.31774")
    new $P203, 'ExceptionHandler'
    set_addr $P203, control_202
    $P203."handle_types"(58)
    push_eh $P203
    .lex "self", self
    find_lex $P204, "self"
    find_lex $P205, "self"
    $P206 = $P205."after_prefix"()
    $P207 = $P204."fetch_methods"($P206 :named("starting_with"))
    .return ($P207)
  control_202:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P208, exception, "payload"
    .return ($P208)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "fetch_afterall_methods"  :subid("31_1256259143.31774") :method :outer("11_1256259143.31774")
    new $P211, 'ExceptionHandler'
    set_addr $P211, control_210
    $P211."handle_types"(58)
    push_eh $P211
    .lex "self", self
    find_lex $P212, "self"
    find_lex $P213, "self"
    $P214 = $P213."afterall_prefix"()
    $P215 = $P212."fetch_methods"($P214 :named("starting_with"))
    .return ($P215)
  control_210:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P216, exception, "payload"
    .return ($P216)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "fetch_before_methods"  :subid("32_1256259143.31774") :method :outer("11_1256259143.31774")
    new $P219, 'ExceptionHandler'
    set_addr $P219, control_218
    $P219."handle_types"(58)
    push_eh $P219
    .lex "self", self
    find_lex $P220, "self"
    find_lex $P221, "self"
    $P222 = $P221."before_prefix"()
    $P223 = $P220."fetch_methods"($P222 :named("starting_with"))
    .return ($P223)
  control_218:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P224, exception, "payload"
    .return ($P224)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "fetch_beforeall_methods"  :subid("33_1256259143.31774") :method :outer("11_1256259143.31774")
    new $P227, 'ExceptionHandler'
    set_addr $P227, control_226
    $P227."handle_types"(58)
    push_eh $P227
    .lex "self", self
    find_lex $P228, "self"
    find_lex $P229, "self"
    $P230 = $P229."beforeall_prefix"()
    $P231 = $P228."fetch_methods"($P230 :named("starting_with"))
    .return ($P231)
  control_226:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P232, exception, "payload"
    .return ($P232)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "fetch_test_methods"  :subid("34_1256259143.31774") :method :outer("11_1256259143.31774")
    new $P235, 'ExceptionHandler'
    set_addr $P235, control_234
    $P235."handle_types"(58)
    push_eh $P235
    .lex "self", self
    find_lex $P236, "self"
    find_lex $P237, "self"
    $P238 = $P237."test_prefix"()
    $P239 = $P236."fetch_methods"($P238 :named("starting_with"))
    .return ($P239)
  control_234:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P240, exception, "payload"
    .return ($P240)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "init"  :subid("35_1256259143.31774") :method :outer("11_1256259143.31774")
    .param pmc param_244
    .param pmc param_245
    new $P243, 'ExceptionHandler'
    set_addr $P243, control_242
    $P243."handle_types"(58)
    push_eh $P243
    .lex "self", self
    .lex "@children", param_244
    .lex "%attributes", param_245
    get_hll_global $P246, ["Class";"BaseBehavior"], "init"
    find_lex $P247, "self"
    find_lex $P248, "@children"
    unless_null $P248, vivify_94
    new $P248, "ResizablePMCArray"
  vivify_94:
    find_lex $P249, "%attributes"
    unless_null $P249, vivify_95
    new $P249, "Hash"
  vivify_95:
    $P246($P247, $P248, $P249)
    find_lex $P250, "self"
    $P251 = $P250."test_counter"(0)
    .return ($P251)
  control_242:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P252, exception, "payload"
    .return ($P252)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "ok"  :subid("36_1256259143.31774") :method :outer("11_1256259143.31774")
    .param pmc param_256
    .param pmc param_257 :optional
    .param int has_param_257 :opt_flag
    .const 'Sub' $P276 = "38_1256259143.31774" 
    capture_lex $P276
    .const 'Sub' $P263 = "37_1256259143.31774" 
    capture_lex $P263
    new $P255, 'ExceptionHandler'
    set_addr $P255, control_254
    $P255."handle_types"(58)
    push_eh $P255
    .lex "self", self
    .lex "$result", param_256
    if has_param_257, optparam_96
    new $P258, "Undef"
    set param_257, $P258
  optparam_96:
    .lex "$note", param_257
    new $P259, "ResizablePMCArray"
    .lex "@output", $P259
    find_lex $P261, "$result"
    unless_null $P261, vivify_97
    new $P261, "Undef"
  vivify_97:
    if $P261, unless_260_end
    .const 'Sub' $P263 = "37_1256259143.31774" 
    capture_lex $P263
    $P263()
  unless_260_end:
    find_lex $P266, "@output"
    unless_null $P266, vivify_99
    new $P266, "ResizablePMCArray"
  vivify_99:
    $P266."push"("ok")
    find_lex $P267, "self"
    $P268 = $P267."test_counter"()
        ##  inline postfix:++
        clone $P269, $P268
        inc $P268
    find_lex $P270, "@output"
    unless_null $P270, vivify_100
    new $P270, "ResizablePMCArray"
  vivify_100:
    find_lex $P271, "self"
    $P272 = $P271."test_counter"()
    $P270."push"($P272)
    find_lex $P274, "$note"
    unless_null $P274, vivify_101
    new $P274, "Undef"
  vivify_101:
    unless $P274, if_273_end
    .const 'Sub' $P276 = "38_1256259143.31774" 
    capture_lex $P276
    $P276()
  if_273_end:
    find_lex $P281, "self"
    find_lex $P282, "@output"
    unless_null $P282, vivify_105
    new $P282, "ResizablePMCArray"
  vivify_105:
    $P283 = $P282."join"(" ")
    $P284 = $P281."emit"($P283)
    .return ($P284)
  control_254:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P285, exception, "payload"
    .return ($P285)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "_block262"  :anon :subid("37_1256259143.31774") :outer("36_1256259143.31774")
    find_lex $P264, "@output"
    unless_null $P264, vivify_98
    new $P264, "ResizablePMCArray"
  vivify_98:
    $P265 = $P264."push"("not")
    .return ($P265)
.end


.namespace ["Testcase"]
.sub "_block275"  :anon :subid("38_1256259143.31774") :outer("36_1256259143.31774")
    find_lex $P277, "@output"
    unless_null $P277, vivify_102
    new $P277, "ResizablePMCArray"
  vivify_102:
    $P277."push"("-")
    find_lex $P278, "@output"
    unless_null $P278, vivify_103
    new $P278, "ResizablePMCArray"
  vivify_103:
    find_lex $P279, "$note"
    unless_null $P279, vivify_104
    new $P279, "Undef"
  vivify_104:
    $P280 = $P278."push"($P279)
    .return ($P280)
.end


.namespace ["Testcase"]
.sub "run_all_tests"  :subid("39_1256259143.31774") :method :outer("11_1256259143.31774")
    new $P288, 'ExceptionHandler'
    set_addr $P288, control_287
    $P288."handle_types"(58)
    push_eh $P288
    .lex "self", self
    find_lex $P289, "self"
    $P290 = $P289."run_tests"()
    .return ($P290)
  control_287:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P291, exception, "payload"
    .return ($P291)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "run_after_methods"  :subid("40_1256259143.31774") :method :outer("11_1256259143.31774")
    new $P294, 'ExceptionHandler'
    set_addr $P294, control_293
    $P294."handle_types"(58)
    push_eh $P294
    .lex "self", self
    find_lex $P295, "self"
    find_lex $P296, "self"
    $P297 = $P296."after_methods"()
    $P298 = $P295."run_methods"($P297)
    .return ($P298)
  control_293:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P299, exception, "payload"
    .return ($P299)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "run_afterall_methods"  :subid("41_1256259143.31774") :method :outer("11_1256259143.31774")
    new $P302, 'ExceptionHandler'
    set_addr $P302, control_301
    $P302."handle_types"(58)
    push_eh $P302
    .lex "self", self
    find_lex $P303, "self"
    find_lex $P304, "self"
    $P305 = $P304."afterall_methods"()
    $P306 = $P303."run_methods"($P305)
    .return ($P306)
  control_301:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P307, exception, "payload"
    .return ($P307)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "run_before_methods"  :subid("42_1256259143.31774") :method :outer("11_1256259143.31774")
    new $P310, 'ExceptionHandler'
    set_addr $P310, control_309
    $P310."handle_types"(58)
    push_eh $P310
    .lex "self", self
    find_lex $P311, "self"
    find_lex $P312, "self"
    $P313 = $P312."before_methods"()
    $P314 = $P311."run_methods"($P313)
    .return ($P314)
  control_309:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P315, exception, "payload"
    .return ($P315)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "run_beforeall_methods"  :subid("43_1256259143.31774") :method :outer("11_1256259143.31774")
    new $P318, 'ExceptionHandler'
    set_addr $P318, control_317
    $P318."handle_types"(58)
    push_eh $P318
    .lex "self", self
    find_lex $P319, "self"
    find_lex $P320, "self"
    $P321 = $P320."beforeall_methods"()
    $P322 = $P319."run_methods"($P321)
    .return ($P322)
  control_317:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P323, exception, "payload"
    .return ($P323)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "run_methods"  :subid("44_1256259143.31774") :method :outer("11_1256259143.31774")
    .param pmc param_327
    .param pmc param_328 :slurpy
    .param pmc param_329 :slurpy :named
    .const 'Sub' $P337 = "45_1256259143.31774" 
    capture_lex $P337
    new $P326, 'ExceptionHandler'
    set_addr $P326, control_325
    $P326."handle_types"(58)
    push_eh $P326
    .lex "self", self
    .lex "@methods", param_327
    .lex "@args", param_328
    .lex "%opts", param_329
    find_lex $P330, "@methods"
    unless_null $P330, vivify_106
    new $P330, "ResizablePMCArray"
  vivify_106:
    set $N331, $P330
    "NOTE"("Running ", $N331, " methods")
    find_lex $P333, "@methods"
    unless_null $P333, vivify_107
    new $P333, "ResizablePMCArray"
  vivify_107:
    defined $I334, $P333
    unless $I334, for_undef_108
    iter $P332, $P333
    new $P348, 'ExceptionHandler'
    set_addr $P348, loop347_handler
    $P348."handle_types"(65, 67, 66)
    push_eh $P348
  loop347_test:
    unless $P332, loop347_done
    shift $P335, $P332
  loop347_redo:
    .const 'Sub' $P337 = "45_1256259143.31774" 
    capture_lex $P337
    $P337($P335)
  loop347_next:
    goto loop347_test
  loop347_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P349, exception, 'type'
    eq $P349, 65, loop347_next
    eq $P349, 67, loop347_redo
  loop347_done:
    pop_eh 
  for_undef_108:
    $P350 = "NOTE"("done")
    .return ($P350)
  control_325:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P351, exception, "payload"
    .return ($P351)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "_block336"  :anon :subid("45_1256259143.31774") :outer("44_1256259143.31774")
    .param pmc param_338
    .lex "$_", param_338
    find_lex $P339, "$_"
    unless_null $P339, vivify_109
    new $P339, "Undef"
  vivify_109:
    "NOTE"("Running method: ", $P339)
    get_hll_global $P340, ["Class"], "call_method_"
    find_lex $P341, "self"
    find_lex $P342, "$_"
    unless_null $P342, vivify_110
    new $P342, "Undef"
  vivify_110:
    set $S343, $P342
    find_lex $P344, "@args"
    unless_null $P344, vivify_111
    new $P344, "ResizablePMCArray"
  vivify_111:
    find_lex $P345, "%opts"
    unless_null $P345, vivify_112
    new $P345, "Hash"
  vivify_112:
    $P346 = $P340($P341, $S343, $P344, $P345)
    .return ($P346)
.end


.namespace ["Testcase"]
.sub "run_test"  :subid("46_1256259143.31774") :method :outer("11_1256259143.31774")
    .param pmc param_355
    .param pmc param_356 :optional :named("after_prefix")
    .param int has_param_356 :opt_flag
    .param pmc param_358 :optional :named("before_prefix")
    .param int has_param_358 :opt_flag
    new $P354, 'ExceptionHandler'
    set_addr $P354, control_353
    $P354."handle_types"(58)
    push_eh $P354
    .lex "self", self
    .lex "$method_name", param_355
    if has_param_356, optparam_113
    new $P357, "Undef"
    set param_356, $P357
  optparam_113:
    .lex "$after_prefix", param_356
    if has_param_358, optparam_114
    new $P359, "Undef"
    set param_358, $P359
  optparam_114:
    .lex "$before_prefix", param_358
    find_lex $P360, "self"
    $P360."run_before_methods"()
    get_hll_global $P361, ["Class"], "call_method"
    find_lex $P362, "self"
    find_lex $P363, "$method_name"
    unless_null $P363, vivify_115
    new $P363, "Undef"
  vivify_115:
    $P361($P362, $P363)
    find_lex $P364, "self"
    $P365 = $P364."run_after_methods"()
    .return ($P365)
  control_353:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P366, exception, "payload"
    .return ($P366)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "run_tests"  :subid("47_1256259143.31774") :method :outer("11_1256259143.31774")
    .param pmc param_370 :slurpy
    .const 'Sub' $P387 = "49_1256259143.31774" 
    capture_lex $P387
    .const 'Sub' $P377 = "48_1256259143.31774" 
    capture_lex $P377
    new $P369, 'ExceptionHandler'
    set_addr $P369, control_368
    $P369."handle_types"(58)
    push_eh $P369
    .lex "self", self
    .lex "@names", param_370
    "NOTE"("Creating new testcase")
    find_lex $P371, "self"
    $P372 = $P371."new"()
    .lex "$testcase", $P372
    "NOTE"("Running 'beforeall' methods")
    find_lex $P373, "$testcase"
    unless_null $P373, vivify_116
    new $P373, "Undef"
  vivify_116:
    $P373."run_beforeall_methods"()
    find_lex $P375, "@names"
    unless_null $P375, vivify_117
    new $P375, "ResizablePMCArray"
  vivify_117:
    if $P375, unless_374_end
    .const 'Sub' $P377 = "48_1256259143.31774" 
    capture_lex $P377
    $P377()
  unless_374_end:
    find_lex $P380, "@names"
    unless_null $P380, vivify_119
    new $P380, "ResizablePMCArray"
  vivify_119:
    set $N381, $P380
    "NOTE"("Got ", $N381, " tests to run.")
    find_lex $P383, "@names"
    unless_null $P383, vivify_120
    new $P383, "ResizablePMCArray"
  vivify_120:
    defined $I384, $P383
    unless $I384, for_undef_121
    iter $P382, $P383
    new $P400, 'ExceptionHandler'
    set_addr $P400, loop399_handler
    $P400."handle_types"(65, 67, 66)
    push_eh $P400
  loop399_test:
    unless $P382, loop399_done
    shift $P385, $P382
  loop399_redo:
    .const 'Sub' $P387 = "49_1256259143.31774" 
    capture_lex $P387
    $P387($P385)
  loop399_next:
    goto loop399_test
  loop399_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P401, exception, 'type'
    eq $P401, 65, loop399_next
    eq $P401, 67, loop399_redo
  loop399_done:
    pop_eh 
  for_undef_121:
    "NOTE"("Done with tests. Running 'afterall' methods")
    find_lex $P402, "$testcase"
    unless_null $P402, vivify_128
    new $P402, "Undef"
  vivify_128:
    $P403 = $P402."run_afterall_methods"()
    .return ($P403)
  control_368:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P404, exception, "payload"
    .return ($P404)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "_block376"  :anon :subid("48_1256259143.31774") :outer("47_1256259143.31774")
    "NOTE"("No test list specified. Running all tests.")
    find_lex $P378, "$testcase"
    unless_null $P378, vivify_118
    new $P378, "Undef"
  vivify_118:
    $P379 = $P378."fetch_test_methods"()
    store_lex "@names", $P379
    .return ($P379)
.end


.namespace ["Testcase"]
.sub "_block386"  :anon :subid("49_1256259143.31774") :outer("47_1256259143.31774")
    .param pmc param_388
    .lex "$_", param_388
    find_lex $P389, "$_"
    unless_null $P389, vivify_122
    new $P389, "Undef"
  vivify_122:
    set $S390, $P389
    new $P391, 'String'
    set $P391, $S390
    .lex "$method", $P391
    "NOTE"("Running 'before' methods")
    find_lex $P392, "$testcase"
    unless_null $P392, vivify_123
    new $P392, "Undef"
  vivify_123:
    $P392."run_before_methods"()
    find_lex $P393, "$method"
    unless_null $P393, vivify_124
    new $P393, "Undef"
  vivify_124:
    "NOTE"("Running test: ", $P393)
    get_hll_global $P394, ["Class"], "call_method"
    find_lex $P395, "$testcase"
    unless_null $P395, vivify_125
    new $P395, "Undef"
  vivify_125:
    find_lex $P396, "$method"
    unless_null $P396, vivify_126
    new $P396, "Undef"
  vivify_126:
    $P394($P395, $P396)
    "NOTE"("Running 'after' methods")
    find_lex $P397, "$testcase"
    unless_null $P397, vivify_127
    new $P397, "Undef"
  vivify_127:
    $P398 = $P397."run_after_methods"()
    .return ($P398)
.end


.namespace ["Testcase"]
.sub "test_counter"  :subid("50_1256259143.31774") :method :outer("11_1256259143.31774")
    .param pmc param_408 :slurpy
    new $P407, 'ExceptionHandler'
    set_addr $P407, control_406
    $P407."handle_types"(58)
    push_eh $P407
    .lex "self", self
    .lex "@value", param_408
    find_lex $P409, "self"
    find_lex $P410, "@value"
    unless_null $P410, vivify_129
    new $P410, "ResizablePMCArray"
  vivify_129:
    $P411 = $P409."_ATTR_CONST"("test_counter", $P410)
    .return ($P411)
  control_406:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P412, exception, "payload"
    .return ($P412)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "test_methods"  :subid("51_1256259143.31774") :method :outer("11_1256259143.31774")
    new $P415, 'ExceptionHandler'
    set_addr $P415, control_414
    $P415."handle_types"(58)
    push_eh $P415
    .lex "self", self
    find_lex $P416, "self"
    $P417 = $P416."_ATTR_SETBY"("test_methods", "fetch_test_methods")
    .return ($P417)
  control_414:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P418, exception, "payload"
    .return ($P418)
    rethrow exception
.end


.namespace ["Testcase"]
.sub "test_prefix"  :subid("52_1256259143.31774") :method :outer("11_1256259143.31774")
    .param pmc param_422 :slurpy
    new $P421, 'ExceptionHandler'
    set_addr $P421, control_420
    $P421."handle_types"(58)
    push_eh $P421
    .lex "self", self
    .lex "@value", param_422
    find_lex $P423, "self"
    find_lex $P424, "@value"
    unless_null $P424, vivify_130
    new $P424, "ResizablePMCArray"
  vivify_130:
    $P425 = $P423."_ATTR_DEFAULT"("test_prefix", $P424, "test_")
    .return ($P425)
  control_420:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P426, exception, "payload"
    .return ($P426)
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
.sub "_block11"  :anon :subid("10_1256257953.41979")
    get_hll_global $P14, ["Matcher";"Factory"], "_block13" 
    .return ($P14)
.end


.namespace ["Matcher";"Factory"]
.sub "_block13" :init :load :subid("11_1256257953.41979")
    .const 'Sub' $P251 = "37_1256257953.41979" 
    capture_lex $P251
    .const 'Sub' $P242 = "36_1256257953.41979" 
    capture_lex $P242
    .const 'Sub' $P232 = "35_1256257953.41979" 
    capture_lex $P232
    .const 'Sub' $P223 = "34_1256257953.41979" 
    capture_lex $P223
    .const 'Sub' $P213 = "33_1256257953.41979" 
    capture_lex $P213
    .const 'Sub' $P203 = "32_1256257953.41979" 
    capture_lex $P203
    .const 'Sub' $P196 = "31_1256257953.41979" 
    capture_lex $P196
    .const 'Sub' $P187 = "30_1256257953.41979" 
    capture_lex $P187
    .const 'Sub' $P178 = "29_1256257953.41979" 
    capture_lex $P178
    .const 'Sub' $P169 = "28_1256257953.41979" 
    capture_lex $P169
    .const 'Sub' $P160 = "27_1256257953.41979" 
    capture_lex $P160
    .const 'Sub' $P150 = "26_1256257953.41979" 
    capture_lex $P150
    .const 'Sub' $P141 = "25_1256257953.41979" 
    capture_lex $P141
    .const 'Sub' $P131 = "24_1256257953.41979" 
    capture_lex $P131
    .const 'Sub' $P121 = "23_1256257953.41979" 
    capture_lex $P121
    .const 'Sub' $P112 = "22_1256257953.41979" 
    capture_lex $P112
    .const 'Sub' $P105 = "21_1256257953.41979" 
    capture_lex $P105
    .const 'Sub' $P96 = "20_1256257953.41979" 
    capture_lex $P96
    .const 'Sub' $P87 = "19_1256257953.41979" 
    capture_lex $P87
    .const 'Sub' $P78 = "18_1256257953.41979" 
    capture_lex $P78
    .const 'Sub' $P71 = "17_1256257953.41979" 
    capture_lex $P71
    .const 'Sub' $P64 = "16_1256257953.41979" 
    capture_lex $P64
    .const 'Sub' $P40 = "14_1256257953.41979" 
    capture_lex $P40
    .const 'Sub' $P15 = "12_1256257953.41979" 
    capture_lex $P15
    "_ONLOAD"()
    .const 'Sub' $P251 = "37_1256257953.41979" 
    capture_lex $P251
    .return ($P251)
.end


.namespace ["Matcher";"Factory"]
.sub "_ONLOAD"  :subid("12_1256257953.41979") :outer("11_1256257953.41979")
    .const 'Sub' $P21 = "13_1256257953.41979" 
    capture_lex $P21
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    get_global $P19, "$onload_done"
    unless_null $P19, vivify_38
    new $P19, "Undef"
  vivify_38:
    unless $P19, if_18_end
    .const 'Sub' $P21 = "13_1256257953.41979" 
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
    unless_null $P27, vivify_39
    new $P27, "Undef"
  vivify_39:
    "NOTE"("Creating class ", $P27)
    get_hll_global $P28, ["Class"], "SUBCLASS"
    find_lex $P29, "$class_name"
    unless_null $P29, vivify_40
    new $P29, "Undef"
  vivify_40:
    $P28($P29, "Class::HashBased")
    get_hll_global $P30, ["Class"], "multi_sub"
    find_lex $P31, "$class_name"
    unless_null $P31, vivify_41
    new $P31, "Undef"
  vivify_41:
    $P30($P31, "is", "_is_" :named("starting_with"))
    get_hll_global $P32, ["Class"], "multi_sub"
    find_lex $P33, "$class_name"
    unless_null $P33, vivify_42
    new $P33, "Undef"
  vivify_42:
    $P32($P33, "equals", "_equals_" :named("starting_with"))
    get_hll_global $P34, ["Class"], "multi_sub"
    find_lex $P35, "$class_name"
    unless_null $P35, vivify_43
    new $P35, "Undef"
  vivify_43:
    $P34($P35, "not", "_not_" :named("starting_with"))
    get_hll_global $P36, ["Class"], "multi_sub"
    find_lex $P37, "$class_name"
    unless_null $P37, vivify_44
    new $P37, "Undef"
  vivify_44:
    $P36($P37, "returns", "_returns_" :named("starting_with"))
    $P38 = "NOTE"("done")
    .return ($P38)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P39, exception, "payload"
    .return ($P39)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_block20"  :anon :subid("13_1256257953.41979") :outer("12_1256257953.41979")
    new $P22, "Exception"
    set $P22['type'], 58
    new $P23, "Integer"
    assign $P23, 0
    setattribute $P22, 'payload', $P23
    throw $P22
    .return ()
.end


.namespace ["Matcher";"Factory"]
.sub "assert_that"  :subid("14_1256257953.41979") :outer("11_1256257953.41979")
    .param pmc param_43
    .param pmc param_44
    .const 'Sub' $P51 = "15_1256257953.41979" 
    capture_lex $P51
    new $P42, 'ExceptionHandler'
    set_addr $P42, control_41
    $P42."handle_types"(58)
    push_eh $P42
    .lex "$item", param_43
    .lex "$matcher", param_44
    find_lex $P46, "$matcher"
    unless_null $P46, vivify_45
    new $P46, "Undef"
  vivify_45:
    find_lex $P47, "$item"
    unless_null $P47, vivify_46
    new $P47, "Undef"
  vivify_46:
    $P48 = $P46."matches"($P47)
    isfalse $I49, $P48
    unless $I49, if_45_end
    .const 'Sub' $P51 = "15_1256257953.41979" 
    capture_lex $P51
    $P51()
  if_45_end:
    new $P61, "Exception"
    set $P61['type'], 58
    new $P62, "Integer"
    assign $P62, 1
    setattribute $P61, 'payload', $P62
    throw $P61
    .return ()
  control_41:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P63, exception, "payload"
    .return ($P63)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_block50"  :anon :subid("15_1256257953.41979") :outer("14_1256257953.41979")
    find_lex $P52, "$matcher"
    unless_null $P52, vivify_47
    new $P52, "Undef"
  vivify_47:
    $P53 = $P52."describe_self"("Expected: ")
    find_lex $P54, "$matcher"
    unless_null $P54, vivify_48
    new $P54, "Undef"
  vivify_48:
    find_lex $P55, "$item"
    unless_null $P55, vivify_49
    new $P55, "Undef"
  vivify_49:
    $S56 = $P54."describe_failure"($P55, "\n     but: ")
    concat $P57, $P53, $S56
    .lex "$explain", $P57
    find_lex $P58, "$explain"
    unless_null $P58, vivify_50
    new $P58, "Undef"
  vivify_50:
    "say"($P58)
    new $P59, "Exception"
    set $P59['type'], 58
    new $P60, "Integer"
    assign $P60, 0
    setattribute $P59, 'payload', $P60
    throw $P59
    .return ()
.end


.namespace ["Matcher";"Factory"]
.sub "defined"  :subid("16_1256257953.41979") :outer("11_1256257953.41979")
    new $P66, 'ExceptionHandler'
    set_addr $P66, control_65
    $P66."handle_types"(58)
    push_eh $P66
    new $P67, "Exception"
    set $P67['type'], 58
    get_hll_global $P68, ["Matcher"], "Defined"
    $P69 = $P68."new"()
    setattribute $P67, 'payload', $P69
    throw $P67
    .return ()
  control_65:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P70, exception, "payload"
    .return ($P70)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "empty"  :subid("17_1256257953.41979") :outer("11_1256257953.41979")
    new $P73, 'ExceptionHandler'
    set_addr $P73, control_72
    $P73."handle_types"(58)
    push_eh $P73
    new $P74, "Exception"
    set $P74['type'], 58
    get_hll_global $P75, ["Matcher"], "Empty"
    $P76 = $P75."new"()
    setattribute $P74, 'payload', $P76
    throw $P74
    .return ()
  control_72:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P77, exception, "payload"
    .return ($P77)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_equals_Float"  :subid("18_1256257953.41979") :outer("11_1256257953.41979")
    .param pmc param_81
    new $P80, 'ExceptionHandler'
    set_addr $P80, control_79
    $P80."handle_types"(58)
    push_eh $P80
    .lex "$value", param_81
    new $P82, "Exception"
    set $P82['type'], 58
    get_hll_global $P83, ["Matcher"], "IsCloseTo"
    find_lex $P84, "$value"
    unless_null $P84, vivify_51
    new $P84, "Undef"
  vivify_51:
    $P85 = $P83."new"($P84)
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
.sub "_equals_Integer"  :subid("19_1256257953.41979") :outer("11_1256257953.41979")
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
    unless_null $P93, vivify_52
    new $P93, "Undef"
  vivify_52:
    $P94 = $P92."new"($P93, "Integer" :named("match_type"))
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
.sub "_equals_String"  :subid("20_1256257953.41979") :outer("11_1256257953.41979")
    .param pmc param_99
    new $P98, 'ExceptionHandler'
    set_addr $P98, control_97
    $P98."handle_types"(58)
    push_eh $P98
    .lex "$value", param_99
    new $P100, "Exception"
    set $P100['type'], 58
    get_hll_global $P101, ["Matcher"], "Equals"
    find_lex $P102, "$value"
    unless_null $P102, vivify_53
    new $P102, "Undef"
  vivify_53:
    $P103 = $P101."new"($P102, "String" :named("match_type"))
    setattribute $P100, 'payload', $P103
    throw $P100
    .return ()
  control_97:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "false"  :subid("21_1256257953.41979") :outer("11_1256257953.41979")
    new $P107, 'ExceptionHandler'
    set_addr $P107, control_106
    $P107."handle_types"(58)
    push_eh $P107
    new $P108, "Exception"
    set $P108['type'], 58
    get_hll_global $P109, ["Matcher"], "False"
    $P110 = $P109."new"()
    setattribute $P108, 'payload', $P110
    throw $P108
    .return ()
  control_106:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "instance_of"  :subid("22_1256257953.41979") :outer("11_1256257953.41979")
    .param pmc param_115
    new $P114, 'ExceptionHandler'
    set_addr $P114, control_113
    $P114."handle_types"(58)
    push_eh $P114
    .lex "$type", param_115
    new $P116, "Exception"
    set $P116['type'], 58
    get_hll_global $P117, ["Matcher"], "InstanceOf"
    find_lex $P118, "$type"
    unless_null $P118, vivify_54
    new $P118, "Undef"
  vivify_54:
    $P119 = $P117."new"($P118)
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
.sub "_is_Float"  :subid("23_1256257953.41979") :outer("11_1256257953.41979")
    .param pmc param_124
    new $P123, 'ExceptionHandler'
    set_addr $P123, control_122
    $P123."handle_types"(58)
    push_eh $P123
    .lex "$value", param_124
    new $P125, "Exception"
    set $P125['type'], 58
    get_hll_global $P126, ["Matcher"], "EqualsFloat"
    find_lex $P127, "$value"
    unless_null $P127, vivify_55
    new $P127, "Undef"
  vivify_55:
    $P128 = $P126."new"($P127)
    $P129 = "is"($P128)
    setattribute $P125, 'payload', $P129
    throw $P125
    .return ()
  control_122:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P130, exception, "payload"
    .return ($P130)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_is_Integer"  :subid("24_1256257953.41979") :outer("11_1256257953.41979")
    .param pmc param_134
    new $P133, 'ExceptionHandler'
    set_addr $P133, control_132
    $P133."handle_types"(58)
    push_eh $P133
    .lex "$value", param_134
    new $P135, "Exception"
    set $P135['type'], 58
    get_hll_global $P136, ["Matcher"], "Equals"
    find_lex $P137, "$value"
    unless_null $P137, vivify_56
    new $P137, "Undef"
  vivify_56:
    $P138 = $P136."new"($P137, "Integer" :named("match_type"))
    $P139 = "is"($P138)
    setattribute $P135, 'payload', $P139
    throw $P135
    .return ()
  control_132:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P140, exception, "payload"
    .return ($P140)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_is_Matcher"  :subid("25_1256257953.41979") :outer("11_1256257953.41979")
    .param pmc param_144
    new $P143, 'ExceptionHandler'
    set_addr $P143, control_142
    $P143."handle_types"(58)
    push_eh $P143
    .lex "$matcher", param_144
    new $P145, "Exception"
    set $P145['type'], 58
    get_hll_global $P146, ["Matcher"], "DescribedAs"
    find_lex $P147, "$matcher"
    unless_null $P147, vivify_57
    new $P147, "Undef"
  vivify_57:
    $P148 = $P146."new"("is", $P147)
    setattribute $P145, 'payload', $P148
    throw $P145
    .return ()
  control_142:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P149, exception, "payload"
    .return ($P149)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_is_String"  :subid("26_1256257953.41979") :outer("11_1256257953.41979")
    .param pmc param_153
    new $P152, 'ExceptionHandler'
    set_addr $P152, control_151
    $P152."handle_types"(58)
    push_eh $P152
    .lex "$value", param_153
    new $P154, "Exception"
    set $P154['type'], 58
    get_hll_global $P155, ["Matcher"], "Equals"
    find_lex $P156, "$value"
    unless_null $P156, vivify_58
    new $P156, "Undef"
  vivify_58:
    $P157 = $P155."new"($P156, "String" :named("match_type"))
    $P158 = "is"($P157)
    setattribute $P154, 'payload', $P158
    throw $P154
    .return ()
  control_151:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P159, exception, "payload"
    .return ($P159)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_not_Float"  :subid("27_1256257953.41979") :outer("11_1256257953.41979")
    .param pmc param_163
    new $P162, 'ExceptionHandler'
    set_addr $P162, control_161
    $P162."handle_types"(58)
    push_eh $P162
    .lex "$value", param_163
    new $P164, "Exception"
    set $P164['type'], 58
    find_lex $P165, "$value"
    unless_null $P165, vivify_59
    new $P165, "Undef"
  vivify_59:
    $P166 = "is"($P165)
    $P167 = "not"($P166)
    setattribute $P164, 'payload', $P167
    throw $P164
    .return ()
  control_161:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P168, exception, "payload"
    .return ($P168)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_not_Integer"  :subid("28_1256257953.41979") :outer("11_1256257953.41979")
    .param pmc param_172
    new $P171, 'ExceptionHandler'
    set_addr $P171, control_170
    $P171."handle_types"(58)
    push_eh $P171
    .lex "$value", param_172
    new $P173, "Exception"
    set $P173['type'], 58
    find_lex $P174, "$value"
    unless_null $P174, vivify_60
    new $P174, "Undef"
  vivify_60:
    $P175 = "is"($P174)
    $P176 = "not"($P175)
    setattribute $P173, 'payload', $P176
    throw $P173
    .return ()
  control_170:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P177, exception, "payload"
    .return ($P177)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_not_Matcher"  :subid("29_1256257953.41979") :outer("11_1256257953.41979")
    .param pmc param_181
    new $P180, 'ExceptionHandler'
    set_addr $P180, control_179
    $P180."handle_types"(58)
    push_eh $P180
    .lex "$matcher", param_181
    new $P182, "Exception"
    set $P182['type'], 58
    get_hll_global $P183, ["Matcher"], "Not"
    find_lex $P184, "$matcher"
    unless_null $P184, vivify_61
    new $P184, "Undef"
  vivify_61:
    $P185 = $P183."new"($P184)
    setattribute $P182, 'payload', $P185
    throw $P182
    .return ()
  control_179:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P186, exception, "payload"
    .return ($P186)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_not_String"  :subid("30_1256257953.41979") :outer("11_1256257953.41979")
    .param pmc param_190
    new $P189, 'ExceptionHandler'
    set_addr $P189, control_188
    $P189."handle_types"(58)
    push_eh $P189
    .lex "$value", param_190
    new $P191, "Exception"
    set $P191['type'], 58
    find_lex $P192, "$value"
    unless_null $P192, vivify_62
    new $P192, "Undef"
  vivify_62:
    $P193 = "is"($P192)
    $P194 = "not"($P193)
    setattribute $P191, 'payload', $P194
    throw $P191
    .return ()
  control_188:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P195, exception, "payload"
    .return ($P195)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "null"  :subid("31_1256257953.41979") :outer("11_1256257953.41979")
    new $P198, 'ExceptionHandler'
    set_addr $P198, control_197
    $P198."handle_types"(58)
    push_eh $P198
    new $P199, "Exception"
    set $P199['type'], 58
    get_hll_global $P200, ["Matcher"], "Null"
    $P201 = $P200."new"()
    setattribute $P199, 'payload', $P201
    throw $P199
    .return ()
  control_197:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P202, exception, "payload"
    .return ($P202)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_returns_Float"  :subid("32_1256257953.41979") :outer("11_1256257953.41979")
    .param pmc param_206
    new $P205, 'ExceptionHandler'
    set_addr $P205, control_204
    $P205."handle_types"(58)
    push_eh $P205
    .lex "$value", param_206
    new $P207, "Exception"
    set $P207['type'], 58
    get_hll_global $P208, ["Matcher"], "IsCloseTo"
    find_lex $P209, "$value"
    unless_null $P209, vivify_63
    new $P209, "Undef"
  vivify_63:
    $P210 = $P208."new"($P209)
    $P211 = "returns"($P210)
    setattribute $P207, 'payload', $P211
    throw $P207
    .return ()
  control_204:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P212, exception, "payload"
    .return ($P212)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_returns_Integer"  :subid("33_1256257953.41979") :outer("11_1256257953.41979")
    .param pmc param_216
    new $P215, 'ExceptionHandler'
    set_addr $P215, control_214
    $P215."handle_types"(58)
    push_eh $P215
    .lex "$value", param_216
    new $P217, "Exception"
    set $P217['type'], 58
    get_hll_global $P218, ["Matcher"], "Equals"
    find_lex $P219, "$value"
    unless_null $P219, vivify_64
    new $P219, "Undef"
  vivify_64:
    $P220 = $P218."new"($P219)
    $P221 = "returns"($P220)
    setattribute $P217, 'payload', $P221
    throw $P217
    .return ()
  control_214:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P222, exception, "payload"
    .return ($P222)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_returns_Matcher"  :subid("34_1256257953.41979") :outer("11_1256257953.41979")
    .param pmc param_226
    new $P225, 'ExceptionHandler'
    set_addr $P225, control_224
    $P225."handle_types"(58)
    push_eh $P225
    .lex "$value", param_226
    new $P227, "Exception"
    set $P227['type'], 58
    get_hll_global $P228, ["Matcher"], "DescribedAs"
    find_lex $P229, "$value"
    unless_null $P229, vivify_65
    new $P229, "Undef"
  vivify_65:
    $P230 = $P228."new"("returns", $P229)
    setattribute $P227, 'payload', $P230
    throw $P227
    .return ()
  control_224:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P231, exception, "payload"
    .return ($P231)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "_returns_String"  :subid("35_1256257953.41979") :outer("11_1256257953.41979")
    .param pmc param_235
    new $P234, 'ExceptionHandler'
    set_addr $P234, control_233
    $P234."handle_types"(58)
    push_eh $P234
    .lex "$value", param_235
    new $P236, "Exception"
    set $P236['type'], 58
    get_hll_global $P237, ["Matcher"], "Equals"
    find_lex $P238, "$value"
    unless_null $P238, vivify_66
    new $P238, "Undef"
  vivify_66:
    $P239 = $P237."new"($P238)
    $P240 = "returns"($P239)
    setattribute $P236, 'payload', $P240
    throw $P236
    .return ()
  control_233:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P241, exception, "payload"
    .return ($P241)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "same_as"  :subid("36_1256257953.41979") :outer("11_1256257953.41979")
    .param pmc param_245
    new $P244, 'ExceptionHandler'
    set_addr $P244, control_243
    $P244."handle_types"(58)
    push_eh $P244
    .lex "$value", param_245
    new $P246, "Exception"
    set $P246['type'], 58
    get_hll_global $P247, ["Matcher"], "IdenticalTo"
    find_lex $P248, "$value"
    unless_null $P248, vivify_67
    new $P248, "Undef"
  vivify_67:
    $P249 = $P247."new"($P248)
    setattribute $P246, 'payload', $P249
    throw $P246
    .return ()
  control_243:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P250, exception, "payload"
    .return ($P250)
    rethrow exception
.end


.namespace ["Matcher";"Factory"]
.sub "true"  :subid("37_1256257953.41979") :outer("11_1256257953.41979")
    new $P253, 'ExceptionHandler'
    set_addr $P253, control_252
    $P253."handle_types"(58)
    push_eh $P253
    new $P254, "Exception"
    set $P254['type'], 58
    get_hll_global $P255, ["Matcher"], "True"
    $P256 = $P255."new"()
    setattribute $P254, 'payload', $P256
    throw $P254
    .return ()
  control_252:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P257, exception, "payload"
    .return ($P257)
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
