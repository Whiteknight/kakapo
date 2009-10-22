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
