.namespace []

.include 'iglobals.pasm'
.include 'interpinfo.pasm'
.include 'sysinfo.pasm'

# By virtue of appearing first in the library, this function runs before all other :init or :load
# subs. Call one of the Kakapo _pre_initload hooks to set up those modules that absolutely 
# must be done first.

.sub '_kakapo_top_pre_initload' :load :init

	$P0 = get_hll_global ['Kakapo'], '_pre_initload'
	unless null $P0 goto call_sub
	
	die "Could not locate Kakapo::_pre_initload. Is your library file corrupted?"

call_sub:
	$P0()
.end

.namespace []
.sub "_block11"  :anon :subid("10_1268405347.03689")
# .annotate "line", 0
    get_hll_global $P14, ["Kakapo"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["Kakapo"], "_block13" 
    capture_lex $P14
    $P36 = $P14()
# .annotate "line", 1
    .return ($P36)
.end


.namespace ["Kakapo"]
.sub "_block13"  :subid("11_1268405347.03689") :outer("10_1268405347.03689")
# .annotate "line", 6
    .const 'Sub' $P28 = "15_1268405347.03689" 
    capture_lex $P28
    .const 'Sub' $P24 = "14_1268405347.03689" 
    capture_lex $P24
    .const 'Sub' $P19 = "13_1268405347.03689" 
    capture_lex $P19
    .const 'Sub' $P15 = "12_1268405347.03689" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268405347.03689" 
    capture_lex $P15
    .lex "is_loaded", $P15
# .annotate "line", 10
    .const 'Sub' $P19 = "13_1268405347.03689" 
    capture_lex $P19
    .lex "get_preinit_subs", $P19
# .annotate "line", 27
    .const 'Sub' $P24 = "14_1268405347.03689" 
    capture_lex $P24
    .lex "library_init_done", $P24
# .annotate "line", 31
    .const 'Sub' $P28 = "15_1268405347.03689" 
    capture_lex $P28
    .lex "library_load_done", $P28
# .annotate "line", 6
    find_lex $P32, "is_loaded"
    find_lex $P33, "get_preinit_subs"
    find_lex $P34, "library_init_done"
    find_lex $P35, "library_load_done"
    .return ($P35)
.end


.namespace ["Kakapo"]
.sub "is_loaded"  :subid("12_1268405347.03689") :outer("11_1268405347.03689")
# .annotate "line", 6
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .return (1)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P18, exception, "payload"
    .return ($P18)
.end


.namespace ["Kakapo"]
.sub "get_preinit_subs"  :subid("13_1268405347.03689") :outer("11_1268405347.03689")
# .annotate "line", 10
    new $P21, 'ExceptionHandler'
    set_addr $P21, control_20
    $P21."handle_types"(58)
    push_eh $P21
# .annotate "line", 14
    new $P22, "ResizablePMCArray"
    push $P22, "Global"
    push $P22, "Opcode"
    push $P22, "Parrot"
    push $P22, "Pir"
    push $P22, "Key"
    push $P22, "Array"
    push $P22, "Kakapo::Pmc::COMMON"
    push $P22, "String"
    push $P22, "Exception"
    push $P22, "Syntax"
# .annotate "line", 10
    .return ($P22)
  control_20:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P23, exception, "payload"
    .return ($P23)
.end


.namespace ["Kakapo"]
.sub "library_init_done"  :subid("14_1268405347.03689") :outer("11_1268405347.03689")
# .annotate "line", 27
    new $P26, 'ExceptionHandler'
    set_addr $P26, control_25
    $P26."handle_types"(58)
    push_eh $P26
    .return ()
  control_25:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P27, exception, "payload"
    .return ($P27)
.end


.namespace ["Kakapo"]
.sub "library_load_done"  :subid("15_1268405347.03689") :outer("11_1268405347.03689")
# .annotate "line", 31
    new $P30, 'ExceptionHandler'
    set_addr $P30, control_29
    $P30."handle_types"(58)
    push_eh $P30
    .return ()
  control_29:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P31, exception, "payload"
    .return ($P31)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268405299.14616")
# .annotate "line", 0
    get_hll_global $P14, ["Global"], "_block13" 
    capture_lex $P14
# .annotate "line", 31
    get_hll_global $P14, ["Global"], "_block13" 
    capture_lex $P14
    $P323 = $P14()
# .annotate "line", 1
    .return ($P323)
.end


.namespace ["Global"]
.sub "_block13"  :subid("11_1268405299.14616") :outer("10_1268405299.14616")
# .annotate "line", 31
    .const 'Sub' $P197 = "19_1268405299.14616" 
    capture_lex $P197
    .const 'Sub' $P172 = "18_1268405299.14616" 
    capture_lex $P172
    .const 'Sub' $P133 = "17_1268405299.14616" 
    capture_lex $P133
    .const 'Sub' $P117 = "16_1268405299.14616" 
    capture_lex $P117
    .const 'Sub' $P22 = "13_1268405299.14616" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1268405299.14616" 
    capture_lex $P15
# .annotate "line", 151
    .const 'Sub' $P197 = "19_1268405299.14616" 
    capture_lex $P197
# .annotate "line", 31
    .return ($P197)
.end


.namespace ["Global"]
.sub "_pre_initload"  :subid("12_1268405299.14616") :outer("11_1268405299.14616")
# .annotate "line", 31
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 32
    get_hll_global $P18, ["Global"], "use"
    "inject_root_symbol"($P18)
# .annotate "line", 33
    get_hll_global $P19, ["Global"], "export"
    $P20 = "inject_root_symbol"($P19)
# .annotate "line", 31
    .return ($P20)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P21, exception, "payload"
    .return ($P21)
.end


.namespace ["Global"]
.sub "export"  :subid("13_1268405299.14616") :outer("11_1268405299.14616")
    .param pmc param_25
    .param pmc param_26 :slurpy
    .param pmc param_27 :optional :named("as")
    .param int has_param_27 :opt_flag
    .param pmc param_29 :optional :named("namespace")
    .param int has_param_29 :opt_flag
    .param pmc param_31 :optional :named("tags")
    .param int has_param_31 :opt_flag
# .annotate "line", 65
    .const 'Sub' $P81 = "14_1268405299.14616" 
    capture_lex $P81
    new $P24, 'ExceptionHandler'
    set_addr $P24, control_23
    $P24."handle_types"(58)
    push_eh $P24
    .lex "$symbol", param_25
    .lex "@symbols", param_26
    if has_param_27, optparam_23
    new $P28, "Undef"
    set param_27, $P28
  optparam_23:
    .lex "$as", param_27
    if has_param_29, optparam_24
    new $P30, "Undef"
    set param_29, $P30
  optparam_24:
    .lex "$namespace", param_29
    if has_param_31, optparam_25
    new $P32, "ResizablePMCArray"
    set param_31, $P32
  optparam_25:
    .lex "@tags", param_31
# .annotate "line", 76
    new $P33, "Undef"
    .lex "$source_nsp", $P33
# .annotate "line", 84
    new $P34, "Undef"
    .lex "$export_nsp", $P34
# .annotate "line", 66
    find_lex $P36, "$symbol"
    new $P37, "String"
    assign $P37, "String"
    set $S38, $P37
    isa $I39, $P36, $S38
    if $I39, if_35
# .annotate "line", 70
    find_lex $P42, "$symbol"
    store_lex "@symbols", $P42
# .annotate "line", 69
    goto if_35_end
  if_35:
# .annotate "line", 67
    find_lex $P40, "@symbols"
    find_lex $P41, "$symbol"
    $P40."unshift"($P41)
  if_35_end:
# .annotate "line", 73
    find_lex $P44, "@tags"
    new $P45, "String"
    assign $P45, "ResizablePMCArray"
    set $S46, $P45
    isa $I47, $P44, $S46
    new $P48, 'Integer'
    set $P48, $I47
    isfalse $I49, $P48
    if $I49, if_43
# .annotate "line", 74
    find_lex $P54, "@tags"
    set $N55, $P54
    iseq $I56, $N55, 0.0
    unless $I56, if_53_end
    find_lex $P57, "@tags"
    $P57."push"("DEFAULT")
  if_53_end:
    goto if_43_end
  if_43:
# .annotate "line", 73
    get_hll_global $P50, ["Array"], "new"
    find_lex $P51, "@tags"
    $P52 = $P50($P51)
    store_lex "@tags", $P52
  if_43_end:
# .annotate "line", 76
    get_hll_global $P60, ["Opcode"], "defined"
    find_lex $P61, "$namespace"
    $P62 = $P60($P61)
    if $P62, if_59
# .annotate "line", 78
    get_hll_global $P64, ["Parrot"], "caller_namespace"
    $P65 = $P64()
    set $P58, $P65
# .annotate "line", 76
    goto if_59_end
  if_59:
    find_lex $P63, "$namespace"
    set $P58, $P63
  if_59_end:
# .annotate "line", 77
    store_lex "$source_nsp", $P58
# .annotate "line", 80
    get_hll_global $P67, ["Opcode"], "isa"
    find_lex $P68, "$source_nsp"
    $P69 = $P67($P68, "String")
    unless $P69, if_66_end
# .annotate "line", 81
    get_hll_global $P70, ["Opcode"], "get_namespace"
    find_lex $P71, "$source_nsp"
    $P72 = $P70($P71)
    store_lex "$source_nsp", $P72
  if_66_end:
# .annotate "line", 84
    find_lex $P73, "$source_nsp"
    $P74 = $P73."make_namespace"("EXPORT")
    store_lex "$export_nsp", $P74
# .annotate "line", 86
    find_lex $P75, "@tags"
    $P75."push"("ALL")
# .annotate "line", 88
    find_lex $P77, "@tags"
    defined $I78, $P77
    unless $I78, for_undef_26
    iter $P76, $P77
    new $P114, 'ExceptionHandler'
    set_addr $P114, loop113_handler
    $P114."handle_types"(65, 67, 66)
    push_eh $P114
  loop113_test:
    unless $P76, loop113_done
    shift $P79, $P76
  loop113_redo:
    .const 'Sub' $P81 = "14_1268405299.14616" 
    capture_lex $P81
    $P81($P79)
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
  for_undef_26:
# .annotate "line", 65
    .return ($P76)
  control_23:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["Global"]
.sub "_block80"  :anon :subid("14_1268405299.14616") :outer("13_1268405299.14616")
    .param pmc param_83
# .annotate "line", 88
    .const 'Sub' $P94 = "15_1268405299.14616" 
    capture_lex $P94
# .annotate "line", 89
    new $P82, "Undef"
    .lex "$tag_nsp", $P82
    .lex "$_", param_83
    find_lex $P84, "$export_nsp"
    find_lex $P85, "$_"
    set $S86, $P85
    $P87 = $P84."make_namespace"($S86)
    store_lex "$tag_nsp", $P87
# .annotate "line", 91
    get_hll_global $P90, ["Opcode"], "defined"
    find_lex $P91, "$as"
    $P92 = $P90($P91)
    if $P92, if_89
# .annotate "line", 100
    find_lex $P109, "$source_nsp"
    find_lex $P110, "$tag_nsp"
    find_lex $P111, "@symbols"
    $P112 = $P109."export_to"($P110, $P111)
# .annotate "line", 99
    set $P88, $P112
# .annotate "line", 91
    goto if_89_end
  if_89:
    .const 'Sub' $P94 = "15_1268405299.14616" 
    capture_lex $P94
    $P108 = $P94()
    set $P88, $P108
  if_89_end:
# .annotate "line", 88
    .return ($P88)
.end


.namespace ["Global"]
.sub "_block93"  :anon :subid("15_1268405299.14616") :outer("14_1268405299.14616")
# .annotate "line", 92
    new $P95, "Undef"
    .lex "$export_sym", $P95
    find_lex $P96, "$symbol"
    store_lex "$export_sym", $P96
# .annotate "line", 93
    get_hll_global $P98, ["Opcode"], "isa"
    find_lex $P99, "$export_sym"
    $P100 = $P98($P99, "String")
    unless $P100, if_97_end
# .annotate "line", 94
    find_lex $P101, "$source_nsp"
    find_lex $P102, "$export_sym"
    $P103 = $P101."get_sym"($P102)
    store_lex "$export_sym", $P103
  if_97_end:
# .annotate "line", 97
    find_lex $P104, "$export_sym"
    find_lex $P105, "$as"
    find_lex $P106, "$tag_nsp"
    $P107 = "inject_symbol"($P104, $P105 :named("as"), $P106 :named("namespace"))
# .annotate "line", 91
    .return ($P107)
.end


.namespace ["Global"]
.sub "inject_root_symbol"  :subid("16_1268405299.14616") :outer("11_1268405299.14616")
    .param pmc param_120
    .param pmc param_121 :optional :named("as")
    .param int has_param_121 :opt_flag
    .param pmc param_123 :optional :named("force")
    .param int has_param_123 :opt_flag
# .annotate "line", 105
    new $P119, 'ExceptionHandler'
    set_addr $P119, control_118
    $P119."handle_types"(58)
    push_eh $P119
    .lex "$pmc", param_120
    if has_param_121, optparam_27
    new $P122, "Undef"
    set param_121, $P122
  optparam_27:
    .lex "$as", param_121
    if has_param_123, optparam_28
    new $P124, "Undef"
    set param_123, $P124
  optparam_28:
    .lex "$force", param_123
# .annotate "line", 106
    new $P125, "Undef"
    .lex "$hll_namespace", $P125
    get_hll_namespace $P126
    store_lex "$hll_namespace", $P126
# .annotate "line", 107
    find_lex $P127, "$pmc"
    find_lex $P128, "$as"
    find_lex $P129, "$hll_namespace"
    find_lex $P130, "$force"
    $P131 = "inject_symbol"($P127, $P128 :named("as"), $P129 :named("namespace"), $P130 :named("force"))
# .annotate "line", 105
    .return ($P131)
  control_118:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P132, exception, "payload"
    .return ($P132)
.end


.namespace ["Global"]
.sub "inject_symbol"  :subid("17_1268405299.14616") :outer("11_1268405299.14616")
    .param pmc param_136
    .param pmc param_137 :optional :named("namespace")
    .param int has_param_137 :opt_flag
    .param pmc param_139 :optional :named("as")
    .param int has_param_139 :opt_flag
    .param pmc param_141 :optional :named("force")
    .param int has_param_141 :opt_flag
# .annotate "line", 111
    new $P135, 'ExceptionHandler'
    set_addr $P135, control_134
    $P135."handle_types"(58)
    push_eh $P135
    .lex "$object", param_136
    if has_param_137, optparam_29
    new $P138, "Undef"
    set param_137, $P138
  optparam_29:
    .lex "$namespace", param_137
    if has_param_139, optparam_30
    new $P140, "Undef"
    set param_139, $P140
  optparam_30:
    .lex "$as", param_139
    if has_param_141, optparam_31
    new $P142, "Undef"
    set param_141, $P142
  optparam_31:
    .lex "$force", param_141
# .annotate "line", 118
    find_lex $P144, "$as"
    set $P143, $P144
    defined $I146, $P143
    if $I146, default_145
    find_lex $P147, "$object"
    set $S148, $P147
    set $P143, $S148
  default_145:
    store_lex "$as", $P143
# .annotate "line", 120
    find_lex $P150, "$namespace"
    isa $I151, $P150, "NameSpace"
    if $I151, unless_149_end
# .annotate "line", 121
    get_hll_global $P152, ["Opcode"], "get_hll_namespace"
    find_lex $P153, "$namespace"
    $P154 = $P152($P153)
    store_lex "$namespace", $P154
  unless_149_end:
# .annotate "line", 126
    find_lex $P158, "$force"
    isfalse $I159, $P158
    if $I159, if_157
    new $P156, 'Integer'
    set $P156, $I159
    goto if_157_end
  if_157:
    get_hll_global $P160, ["Opcode"], "defined"
    find_lex $P161, "$namespace"
    find_lex $P162, "$as"
    $P163 = $P161."find_var"($P162)
    $P164 = $P160($P163)
    set $P156, $P164
  if_157_end:
    unless $P156, if_155_end
# .annotate "line", 127
    new $P165, "Exception"
    set $P165['type'], 58
    new $P166, "Integer"
    assign $P166, 0
    setattribute $P165, 'payload', $P166
    throw $P165
  if_155_end:
# .annotate "line", 130
    find_lex $P167, "$namespace"
    find_lex $P168, "$as"
    find_lex $P169, "$object"
    $P170 = $P167."add_var"($P168, $P169)
# .annotate "line", 111
    .return ($P170)
  control_134:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P171, exception, "payload"
    .return ($P171)
.end


.namespace ["Global"]
.sub "register_global"  :subid("18_1268405299.14616") :outer("11_1268405299.14616")
    .param pmc param_175
    .param pmc param_176
    .param pmc param_177 :optional :named("namespace")
    .param int has_param_177 :opt_flag
# .annotate "line", 139
    new $P174, 'ExceptionHandler'
    set_addr $P174, control_173
    $P174."handle_types"(58)
    push_eh $P174
    .lex "$name", param_175
    .lex "$object", param_176
    if has_param_177, optparam_32
    new $P178, "String"
    assign $P178, "Global"
    set param_177, $P178
  optparam_32:
    .lex "$namespace", param_177
# .annotate "line", 144
    new $P179, "Undef"
    .lex "$nsp", $P179
# .annotate "line", 140
    get_hll_global $P181, ["Opcode"], "isa"
    find_lex $P182, "$namespace"
    $P183 = $P181($P182, "String")
    unless $P183, if_180_end
# .annotate "line", 141
    find_lex $P184, "$namespace"
    $P185 = $P184."split"("::")
    store_lex "$namespace", $P185
  if_180_end:
# .annotate "line", 144
    get_hll_namespace $P186
    store_lex "$nsp", $P186
# .annotate "line", 145
    find_lex $P187, "$nsp"
    find_lex $P188, "$namespace"
    $P189 = $P187."make_namespace"($P188)
    store_lex "$nsp", $P189
# .annotate "line", 147
    find_lex $P190, "$object"
    find_lex $P191, "$name"
    find_lex $P192, "$nsp"
    unless_null $P192, vivify_33
    new $P192, "Hash"
    store_lex "$nsp", $P192
  vivify_33:
    set $P192[$P191], $P190
# .annotate "line", 148
    find_lex $P193, "$name"
    find_lex $P194, "$nsp"
    $P195 = "export"($P193, $P194 :named("namespace"))
# .annotate "line", 139
    .return ($P195)
  control_173:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P196, exception, "payload"
    .return ($P196)
.end


.namespace ["Global"]
.sub "use"  :subid("19_1268405299.14616") :outer("11_1268405299.14616")
    .param pmc param_200 :optional
    .param int has_param_200 :opt_flag
    .param pmc param_203 :optional :named("except")
    .param int has_param_203 :opt_flag
    .param pmc param_205 :optional :named("tags")
    .param int has_param_205 :opt_flag
    .param pmc param_207 :optional :named("symbols")
    .param int has_param_207 :opt_flag
# .annotate "line", 151
    .const 'Sub' $P273 = "21_1268405299.14616" 
    capture_lex $P273
    .const 'Sub' $P260 = "20_1268405299.14616" 
    capture_lex $P260
    new $P199, 'ExceptionHandler'
    set_addr $P199, control_198
    $P199."handle_types"(58)
    push_eh $P199
    if has_param_200, optparam_34
    get_hll_global $P201, ["Parrot"], "caller_namespace"
    $P202 = $P201(0)
    set param_200, $P202
  optparam_34:
    .lex "$module", param_200
    if has_param_203, optparam_35
    new $P204, "ResizablePMCArray"
    set param_203, $P204
  optparam_35:
    .lex "@except", param_203
    if has_param_205, optparam_36
    new $P206, "ResizablePMCArray"
    set param_205, $P206
  optparam_36:
    .lex "@tags", param_205
    if has_param_207, optparam_37
    new $P208, "ResizablePMCArray"
    set param_207, $P208
  optparam_37:
    .lex "@symbols", param_207
# .annotate "line", 183
    new $P209, "Undef"
    .lex "$export_nsp", $P209
# .annotate "line", 184
    new $P210, "Undef"
    .lex "$target_nsp", $P210
# .annotate "line", 186
    new $P211, "Hash"
    .lex "%except", $P211
# .annotate "line", 173
    get_hll_global $P213, ["Opcode"], "isa"
    find_lex $P214, "@tags"
    $P215 = $P213($P214, "String")
    unless $P215, if_212_end
    get_hll_global $P216, ["Array"], "new"
    find_lex $P217, "@tags"
    $P218 = $P216($P217)
    store_lex "@tags", $P218
  if_212_end:
# .annotate "line", 174
    get_hll_global $P220, ["Opcode"], "isa"
    find_lex $P221, "@symbols"
    $P222 = $P220($P221, "String")
    unless $P222, if_219_end
    get_hll_global $P223, ["Array"], "new"
    find_lex $P224, "@symbols"
    $P225 = $P223($P224)
    store_lex "@symbols", $P225
  if_219_end:
# .annotate "line", 176
    get_hll_global $P227, ["Opcode"], "isa"
    find_lex $P228, "$module"
    $P229 = $P227($P228, "P6object")
    unless $P229, if_226_end
    get_hll_global $P230, ["Opcode"], "typeof"
    find_lex $P231, "$module"
    $P232 = $P230($P231)
    store_lex "$module", $P232
  if_226_end:
# .annotate "line", 177
    get_hll_global $P234, ["Opcode"], "isa"
    find_lex $P235, "$module"
    $P236 = $P234($P235, "String")
    unless $P236, if_233_end
    get_hll_global $P237, ["Parrot"], "get_hll_namespace"
    find_lex $P238, "$module"
    $P239 = $P237($P238)
    store_lex "$module", $P239
  if_233_end:
# .annotate "line", 179
    find_lex $P243, "@tags"
    set $N244, $P243
    iseq $I245, $N244, 0.0
    if $I245, if_242
    new $P241, 'Integer'
    set $P241, $I245
    goto if_242_end
  if_242:
    find_lex $P246, "@symbols"
    set $N247, $P246
    iseq $I248, $N247, 0.0
    new $P241, 'Integer'
    set $P241, $I248
  if_242_end:
    unless $P241, if_240_end
# .annotate "line", 180
    find_lex $P249, "@tags"
    $P249."push"("DEFAULT")
  if_240_end:
# .annotate "line", 183
    find_lex $P250, "$module"
    $P251 = $P250."make_namespace"("EXPORT")
    store_lex "$export_nsp", $P251
# .annotate "line", 184
    get_hll_global $P252, ["Parrot"], "caller_namespace"
    $P253 = $P252()
    store_lex "$target_nsp", $P253
    find_lex $P254, "%except"
# .annotate "line", 188
    find_lex $P256, "@except"
    defined $I257, $P256
    unless $I257, for_undef_38
    iter $P255, $P256
    new $P266, 'ExceptionHandler'
    set_addr $P266, loop265_handler
    $P266."handle_types"(65, 67, 66)
    push_eh $P266
  loop265_test:
    unless $P255, loop265_done
    shift $P258, $P255
  loop265_redo:
    .const 'Sub' $P260 = "20_1268405299.14616" 
    capture_lex $P260
    $P260($P258)
  loop265_next:
    goto loop265_test
  loop265_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P267, exception, 'type'
    eq $P267, 65, loop265_next
    eq $P267, 67, loop265_redo
  loop265_done:
    pop_eh 
  for_undef_38:
# .annotate "line", 192
    find_lex $P269, "@tags"
    defined $I270, $P269
    unless $I270, for_undef_40
    iter $P268, $P269
    new $P311, 'ExceptionHandler'
    set_addr $P311, loop310_handler
    $P311."handle_types"(65, 67, 66)
    push_eh $P311
  loop310_test:
    unless $P268, loop310_done
    shift $P271, $P268
  loop310_redo:
    .const 'Sub' $P273 = "21_1268405299.14616" 
    capture_lex $P273
    $P273($P271)
  loop310_next:
    goto loop310_test
  loop310_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P312, exception, 'type'
    eq $P312, 65, loop310_next
    eq $P312, 67, loop310_redo
  loop310_done:
    pop_eh 
  for_undef_40:
# .annotate "line", 207
    find_lex $P315, "@symbols"
    set $N316, $P315
    if $N316, if_314
    new $P313, 'Float'
    set $P313, $N316
    goto if_314_end
  if_314:
# .annotate "line", 208
    find_lex $P317, "$export_nsp"
    unless_null $P317, vivify_44
    new $P317, "Hash"
  vivify_44:
    set $P318, $P317["ALL"]
    unless_null $P318, vivify_45
    new $P318, "Undef"
  vivify_45:
    find_lex $P319, "$target_nsp"
    find_lex $P320, "@symbols"
    $P321 = $P318."export_to"($P319, $P320)
# .annotate "line", 207
    set $P313, $P321
  if_314_end:
# .annotate "line", 151
    .return ($P313)
  control_198:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P322, exception, "payload"
    .return ($P322)
.end


.namespace ["Global"]
.sub "_block259"  :anon :subid("20_1268405299.14616") :outer("19_1268405299.14616")
    .param pmc param_261
# .annotate "line", 188
    .lex "$_", param_261
# .annotate "line", 189
    new $P262, "Integer"
    assign $P262, 1
    find_lex $P263, "$_"
    find_lex $P264, "%except"
    unless_null $P264, vivify_39
    new $P264, "Hash"
    store_lex "%except", $P264
  vivify_39:
    set $P264[$P263], $P262
# .annotate "line", 188
    .return ($P262)
.end


.namespace ["Global"]
.sub "_block272"  :anon :subid("21_1268405299.14616") :outer("19_1268405299.14616")
    .param pmc param_276
# .annotate "line", 192
    .const 'Sub' $P288 = "22_1268405299.14616" 
    capture_lex $P288
# .annotate "line", 193
    new $P274, "Undef"
    .lex "$source_nsp", $P274
# .annotate "line", 194
    new $P275, "ResizablePMCArray"
    .lex "@tag_symbols", $P275
    .lex "$_", param_276
# .annotate "line", 193
    find_lex $P277, "$export_nsp"
    find_lex $P278, "$_"
    set $S279, $P278
    $P280 = $P277."make_namespace"($S279)
    store_lex "$source_nsp", $P280
    find_lex $P281, "@tag_symbols"
# .annotate "line", 196
    find_lex $P283, "$source_nsp"
    $P284 = $P283."keys"()
    defined $I285, $P284
    unless $I285, for_undef_41
    iter $P282, $P284
    new $P300, 'ExceptionHandler'
    set_addr $P300, loop299_handler
    $P300."handle_types"(65, 67, 66)
    push_eh $P300
  loop299_test:
    unless $P282, loop299_done
    shift $P286, $P282
  loop299_redo:
    .const 'Sub' $P288 = "22_1268405299.14616" 
    capture_lex $P288
    $P288($P286)
  loop299_next:
    goto loop299_test
  loop299_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P301, exception, 'type'
    eq $P301, 65, loop299_next
    eq $P301, 67, loop299_redo
  loop299_done:
    pop_eh 
  for_undef_41:
# .annotate "line", 202
    find_lex $P304, "@tag_symbols"
    set $N305, $P304
    if $N305, if_303
    new $P302, 'Float'
    set $P302, $N305
    goto if_303_end
  if_303:
# .annotate "line", 203
    find_lex $P306, "$source_nsp"
    find_lex $P307, "$target_nsp"
    find_lex $P308, "@tag_symbols"
    $P309 = $P306."export_to"($P307, $P308)
# .annotate "line", 202
    set $P302, $P309
  if_303_end:
# .annotate "line", 192
    .return ($P302)
.end


.namespace ["Global"]
.sub "_block287"  :anon :subid("22_1268405299.14616") :outer("21_1268405299.14616")
    .param pmc param_289
# .annotate "line", 196
    .lex "$_", param_289
# .annotate "line", 197
    find_lex $P292, "$_"
    find_lex $P293, "%except"
    unless_null $P293, vivify_42
    new $P293, "Hash"
  vivify_42:
    set $P294, $P293[$P292]
    unless_null $P294, vivify_43
    new $P294, "Undef"
  vivify_43:
    unless $P294, unless_291
    set $P290, $P294
    goto unless_291_end
  unless_291:
# .annotate "line", 198
    find_lex $P295, "@tag_symbols"
    find_lex $P296, "$_"
    set $S297, $P296
    $P298 = $P295."push"($S297)
# .annotate "line", 197
    set $P290, $P298
  unless_291_end:
# .annotate "line", 196
    .return ($P290)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268405385.89747")
# .annotate "line", 0
    get_hll_global $P14, ["Syntax"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Syntax"], "_block13" 
    capture_lex $P14
    $P131 = $P14()
# .annotate "line", 1
    .return ($P131)
.end


.namespace ["Syntax"]
.sub "_block13"  :subid("11_1268405385.89747") :outer("10_1268405385.89747")
# .annotate "line", 7
    .const 'Sub' $P58 = "17_1268405385.89747" 
    capture_lex $P58
    .const 'Sub' $P51 = "16_1268405385.89747" 
    capture_lex $P51
    .const 'Sub' $P44 = "15_1268405385.89747" 
    capture_lex $P44
    .const 'Sub' $P37 = "14_1268405385.89747" 
    capture_lex $P37
    .const 'Sub' $P30 = "13_1268405385.89747" 
    capture_lex $P30
    .const 'Sub' $P15 = "12_1268405385.89747" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268405385.89747" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 15
    .const 'Sub' $P30 = "13_1268405385.89747" 
    capture_lex $P30
    .lex "die", $P30
# .annotate "line", 19
    .const 'Sub' $P37 = "14_1268405385.89747" 
    capture_lex $P37
    .lex "last", $P37
# .annotate "line", 23
    .const 'Sub' $P44 = "15_1268405385.89747" 
    capture_lex $P44
    .lex "next", $P44
# .annotate "line", 27
    .const 'Sub' $P51 = "16_1268405385.89747" 
    capture_lex $P51
    .lex "redo", $P51
# .annotate "line", 31
    .const 'Sub' $P58 = "17_1268405385.89747" 
    capture_lex $P58
    .lex "super", $P58
# .annotate "line", 7
    find_lex $P125, "_pre_initload"
    find_lex $P126, "die"
    find_lex $P127, "last"
    find_lex $P128, "next"
    find_lex $P129, "redo"
    find_lex $P130, "super"
    .return ($P130)
.end


.namespace ["Syntax"]
.sub "_pre_initload"  :subid("12_1268405385.89747") :outer("11_1268405385.89747")
# .annotate "line", 7
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 8
    get_hll_global $P18, ["Global"], "inject_root_symbol"
    get_hll_global $P19, ["Syntax"], "die"
    $P18($P19)
# .annotate "line", 9
    get_hll_global $P20, ["Global"], "inject_root_symbol"
    get_hll_global $P21, ["Syntax"], "last"
    $P20($P21)
# .annotate "line", 10
    get_hll_global $P22, ["Global"], "inject_root_symbol"
    get_hll_global $P23, ["Syntax"], "next"
    $P22($P23)
# .annotate "line", 11
    get_hll_global $P24, ["Global"], "inject_root_symbol"
    get_hll_global $P25, ["Syntax"], "redo"
    $P24($P25)
# .annotate "line", 12
    get_hll_global $P26, ["Global"], "inject_root_symbol"
    get_hll_global $P27, ["Syntax"], "super"
    $P28 = $P26($P27)
# .annotate "line", 7
    .return ($P28)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P29, exception, "payload"
    .return ($P29)
.end


.namespace ["Syntax"]
.sub "die"  :subid("13_1268405385.89747") :outer("11_1268405385.89747")
    .param pmc param_33 :slurpy
# .annotate "line", 15
    new $P32, 'ExceptionHandler'
    set_addr $P32, control_31
    $P32."handle_types"(58)
    push_eh $P32
    .lex "@why", param_33
# .annotate "line", 16
    find_lex $P34, "@why"
    $S35 = $P34."join"()
    die $S35
# .annotate "line", 15
    .return ()
  control_31:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P36, exception, "payload"
    .return ($P36)
.end


.namespace ["Syntax"]
.sub "last"  :subid("14_1268405385.89747") :outer("11_1268405385.89747")
# .annotate "line", 19
    new $P39, 'ExceptionHandler'
    set_addr $P39, control_38
    $P39."handle_types"(58)
    push_eh $P39
# .annotate "line", 20
    get_hll_global $P40, ["Control"], "LoopLast"
    $P41 = $P40."new"("Uncaught LAST control exception" :named("message"))
    $P42 = $P41."throw"()
# .annotate "line", 19
    .return ($P42)
  control_38:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P43, exception, "payload"
    .return ($P43)
.end


.namespace ["Syntax"]
.sub "next"  :subid("15_1268405385.89747") :outer("11_1268405385.89747")
# .annotate "line", 23
    new $P46, 'ExceptionHandler'
    set_addr $P46, control_45
    $P46."handle_types"(58)
    push_eh $P46
# .annotate "line", 24
    get_hll_global $P47, ["Control"], "LoopNext"
    $P48 = $P47."new"("Uncaught NEXT control exception" :named("message"))
    $P49 = $P48."throw"()
# .annotate "line", 23
    .return ($P49)
  control_45:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P50, exception, "payload"
    .return ($P50)
.end


.namespace ["Syntax"]
.sub "redo"  :subid("16_1268405385.89747") :outer("11_1268405385.89747")
# .annotate "line", 27
    new $P53, 'ExceptionHandler'
    set_addr $P53, control_52
    $P53."handle_types"(58)
    push_eh $P53
# .annotate "line", 28
    get_hll_global $P54, ["Control"], "LoopRedo"
    $P55 = $P54."new"("Uncaught REDO control exception" :named("message"))
    $P56 = $P55."throw"()
# .annotate "line", 27
    .return ($P56)
  control_52:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P57, exception, "payload"
    .return ($P57)
.end


.namespace ["Syntax"]
.sub "super"  :subid("17_1268405385.89747") :outer("11_1268405385.89747")
    .param pmc param_61 :slurpy
    .param pmc param_62 :slurpy :named
# .annotate "line", 31
    .const 'Sub' $P89 = "18_1268405385.89747" 
    capture_lex $P89
    new $P60, 'ExceptionHandler'
    set_addr $P60, control_59
    $P60."handle_types"(58)
    push_eh $P60
    .lex "@pos", param_61
    .lex "%named", param_62
# .annotate "line", 32
    new $P63, "Undef"
    .lex "$self", $P63
# .annotate "line", 33
    new $P64, "Undef"
    .lex "$class", $P64
# .annotate "line", 34
    new $P65, "ResizablePMCArray"
    .lex "@mro", $P65
# .annotate "line", 40
    new $P66, "Undef"
    .lex "&caller", $P66
# .annotate "line", 41
    new $P67, "Undef"
    .lex "$caller_name", $P67
# .annotate "line", 42
    new $P68, "Undef"
    .lex "$found_myself", $P68
# .annotate "line", 43
    new $P69, "Undef"
    .lex "&super", $P69
# .annotate "line", 32
    get_hll_global $P70, ["Parrot"], "get_self"
    $P71 = $P70()
    store_lex "$self", $P71
# .annotate "line", 33
    find_lex $P72, "$self"
    class $P73, $P72
    store_lex "$class", $P73
# .annotate "line", 34
    find_lex $P74, "$class"
    $P75 = $P74."inspect"("all_parents")
    store_lex "@mro", $P75
# .annotate "line", 36
    find_lex $P77, "@mro"
    set $N78, $P77
    iseq $I79, $N78, 1.0
    unless $I79, if_76_end
# .annotate "line", 37
    "die"("Call to 'super' on object with no parent classes")
  if_76_end:
# .annotate "line", 40
    get_hll_global $P80, ["Parrot"], "caller"
    $P81 = $P80()
    store_lex "&caller", $P81
# .annotate "line", 41
    find_lex $P82, "&caller"
    set $S83, $P82
    new $P84, 'String'
    set $P84, $S83
    store_lex "$caller_name", $P84
# .annotate "line", 42
    new $P85, "Integer"
    assign $P85, 0
    store_lex "$found_myself", $P85
    find_lex $P86, "&super"
# .annotate "line", 45
    new $P115, 'ExceptionHandler'
    set_addr $P115, loop114_handler
    $P115."handle_types"(65, 67, 66)
    push_eh $P115
  loop114_test:
    find_lex $P87, "@mro"
    unless $P87, loop114_done
  loop114_redo:
    .const 'Sub' $P89 = "18_1268405385.89747" 
    capture_lex $P89
    $P89()
  loop114_next:
    goto loop114_test
  loop114_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, 'type'
    eq $P116, 65, loop114_next
    eq $P116, 67, loop114_redo
  loop114_done:
    pop_eh 
# .annotate "line", 59
    get_hll_global $P117, ["Exception"], "MethodNotFound"
    new $P118, 'String'
    set $P118, "Could not find superclass method '"
    find_lex $P119, "$caller_name"
    concat $P120, $P118, $P119
    concat $P121, $P120, "'"
    $P122 = $P117."new"($P121 :named("message"))
    $P123 = $P122."throw"()
# .annotate "line", 31
    .return ($P123)
  control_59:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P124, exception, "payload"
    .return ($P124)
.end


.namespace ["Syntax"]
.sub "_block88"  :anon :subid("18_1268405385.89747") :outer("17_1268405385.89747")
# .annotate "line", 46
    new $P90, "Undef"
    .lex "$parent", $P90
    find_lex $P91, "@mro"
    $P92 = $P91."shift"()
    store_lex "$parent", $P92
# .annotate "line", 47
    find_lex $P93, "$parent"
    find_lex $P94, "$caller_name"
    $P95 = $P93."find_method"($P94)
    store_lex "&super", $P95
# .annotate "line", 49
    find_lex $P98, "$found_myself"
    if $P98, if_97
# .annotate "line", 55
    find_lex $P110, "&super"
    find_lex $P111, "&caller"
    issame $I112, $P110, $P111
    new $P113, 'Integer'
    set $P113, $I112
    store_lex "$found_myself", $P113
# .annotate "line", 54
    set $P96, $P113
# .annotate "line", 49
    goto if_97_end
  if_97:
# .annotate "line", 50
    find_lex $P101, "&super"
    find_lex $P102, "&caller"
    issame $I103, $P101, $P102
    unless $I103, unless_100
    new $P99, 'Integer'
    set $P99, $I103
    goto unless_100_end
  unless_100:
# .annotate "line", 51
    new $P104, "Exception"
    set $P104['type'], 58
    find_lex $P105, "&super"
    find_lex $P106, "$self"
    find_lex $P107, "@pos"
    find_lex $P108, "%named"
    $P109 = $P105($P106, $P107 :flat, $P108 :flat)
    setattribute $P104, 'payload', $P109
    throw $P104
  unless_100_end:
# .annotate "line", 49
    set $P96, $P99
  if_97_end:
# .annotate "line", 45
    .return ($P96)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268405399.01767")
# .annotate "line", 0
    get_hll_global $P14, ["Kakapo"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Kakapo"], "_block13" 
    capture_lex $P14
    $P83 = $P14()
# .annotate "line", 1
    .return ($P83)
.end


.namespace ["Kakapo"]
.sub "_block13"  :subid("11_1268405399.01767") :outer("10_1268405399.01767")
# .annotate "line", 7
    .const 'Sub' $P54 = "15_1268405399.01767" 
    capture_lex $P54
    .const 'Sub' $P50 = "14_1268405399.01767" 
    capture_lex $P50
    .const 'Sub' $P15 = "12_1268405399.01767" 
    capture_lex $P15
# .annotate "line", 13
    .const 'Sub' $P15 = "12_1268405399.01767" 
    capture_lex $P15
    .lex "call_preinit_subs", $P15
# .annotate "line", 31
    .const 'Sub' $P50 = "14_1268405399.01767" 
    capture_lex $P50
    .lex "is_loaded", $P50
# .annotate "line", 39
    .const 'Sub' $P54 = "15_1268405399.01767" 
    capture_lex $P54
    .lex "_pre_initload", $P54
# .annotate "line", 7
    find_lex $P76, "call_preinit_subs"
    find_lex $P77, "is_loaded"
    find_lex $P78, "_pre_initload"
    .return ($P78)
.end


.namespace ["Kakapo"]
.sub "" :load :init :subid("post16") :outer("11_1268405399.01767")
# .annotate "line", 7
    get_hll_global $P14, ["Kakapo"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 8
    get_hll_global $P80, ["Opcode"], "isnull"
    get_hll_global $P81, ["Kakapo";"krt0"], "main"
    $P82 = $P80($P81)
    unless $P82, if_79_end
  if_79_end:
.end


.namespace ["Kakapo"]
.sub "call_preinit_subs"  :subid("12_1268405399.01767") :outer("11_1268405399.01767")
    .param pmc param_18
# .annotate "line", 13
    .const 'Sub' $P28 = "13_1268405399.01767" 
    capture_lex $P28
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "@list", param_18
# .annotate "line", 15
    new $P19, "Undef"
    .lex "$nsp", $P19
# .annotate "line", 16
    new $P20, "Undef"
    .lex "&sub", $P20
# .annotate "line", 13
    find_lex $P21, "$nsp"
    find_lex $P22, "&sub"
# .annotate "line", 18
    find_lex $P24, "@list"
    defined $I25, $P24
    unless $I25, for_undef_17
    iter $P23, $P24
    new $P47, 'ExceptionHandler'
    set_addr $P47, loop46_handler
    $P47."handle_types"(65, 67, 66)
    push_eh $P47
  loop46_test:
    unless $P23, loop46_done
    shift $P26, $P23
  loop46_redo:
    .const 'Sub' $P28 = "13_1268405399.01767" 
    capture_lex $P28
    $P28($P26)
  loop46_next:
    goto loop46_test
  loop46_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P48, exception, 'type'
    eq $P48, 65, loop46_next
    eq $P48, 67, loop46_redo
  loop46_done:
    pop_eh 
  for_undef_17:
# .annotate "line", 13
    .return ($P23)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P49, exception, "payload"
    .return ($P49)
.end


.namespace ["Kakapo"]
.sub "_block27"  :anon :subid("13_1268405399.01767") :outer("12_1268405399.01767")
    .param pmc param_29
# .annotate "line", 18
    .lex "$_", param_29
# .annotate "line", 19
    find_lex $P30, "$_"
    set $S31, $P30
    split $P32, "::", $S31
    get_hll_namespace $P33, $P32
    store_lex "$nsp", $P33
# .annotate "line", 20
    find_lex $P34, "$nsp"
    $P35 = $P34."find_sub"("_pre_initload")
    store_lex "&sub", $P35
# .annotate "line", 22
    find_lex $P38, "&sub"
    isnull $I39, $P38
    if $I39, if_37
# .annotate "line", 26
    find_lex $P44, "&sub"
    $P45 = $P44()
# .annotate "line", 25
    set $P36, $P45
# .annotate "line", 22
    goto if_37_end
  if_37:
# .annotate "line", 23
    new $P40, 'String'
    set $P40, "*** WARNING: No _pre_initload sub found for namespace "
    find_lex $P41, "$_"
    concat $P42, $P40, $P41
    $P43 = "say"($P42)
# .annotate "line", 22
    set $P36, $P43
  if_37_end:
# .annotate "line", 18
    .return ($P36)
.end


.namespace ["Kakapo"]
.sub "is_loaded"  :subid("14_1268405399.01767") :outer("11_1268405399.01767")
# .annotate "line", 31
    new $P52, 'ExceptionHandler'
    set_addr $P52, control_51
    $P52."handle_types"(58)
    push_eh $P52
    .return (1)
  control_51:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P53, exception, "payload"
    .return ($P53)
.end


.namespace ["Kakapo"]
.sub "_pre_initload"  :subid("15_1268405399.01767") :outer("11_1268405399.01767")
# .annotate "line", 39
    new $P56, 'ExceptionHandler'
    set_addr $P56, control_55
    $P56."handle_types"(58)
    push_eh $P56
# .annotate "line", 41
    get_global $P57, "$_Pre_initload_done"
    unless_null $P57, vivify_18
    new $P57, "Undef"
    set_global "$_Pre_initload_done", $P57
  vivify_18:
    get_global $P59, "$_Pre_initload_done"
    unless $P59, if_58_end
    new $P60, "Exception"
    set $P60['type'], 58
    new $P61, "Integer"
    assign $P61, 0
    setattribute $P60, 'payload', $P61
    throw $P60
  if_58_end:
# .annotate "line", 42
    new $P62, "Integer"
    assign $P62, 1
    set_global "$_Pre_initload_done", $P62
# .annotate "line", 44
    get_hll_global $P64, ["Opcode"], "defined"
    get_hll_global $P65, "say"
    $P66 = $P64($P65)
    if $P66, unless_63_end
# .annotate "line", 45
    get_hll_global $P67, ["Opcode"], "load_language"
    $P67("nqp")
  unless_63_end:
# .annotate "line", 48
    get_hll_global $P69, ["Opcode"], "defined"
    get_hll_global $P70, ["P6object"], "HOW"
    $P71 = $P69($P70)
    if $P71, unless_68_end
# .annotate "line", 49
    get_hll_global $P72, ["Opcode"], "load_bytecode"
    $P72("P6object.pbc")
  unless_68_end:
# .annotate "line", 52
    $P73 = "get_preinit_subs"()
    $P74 = "call_preinit_subs"($P73)
# .annotate "line", 39
    .return ($P74)
  control_55:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P75, exception, "payload"
    .return ($P75)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268405315.85642")
# .annotate "line", 0
    get_hll_global $P14, ["Opcode"], "_block13" 
    capture_lex $P14
# .annotate "line", 9
    get_hll_global $P14, ["Opcode"], "_block13" 
    capture_lex $P14
    $P371 = $P14()
# .annotate "line", 1
    .return ($P371)
.end


.namespace ["Opcode"]
.sub "_block13"  :subid("11_1268405315.85642") :outer("10_1268405315.85642")
# .annotate "line", 9
    .const 'Sub' $P309 = "46_1268405315.85642" 
    capture_lex $P309
    .const 'Sub' $P283 = "45_1268405315.85642" 
    capture_lex $P283
    .const 'Sub' $P257 = "44_1268405315.85642" 
    capture_lex $P257
    .const 'Sub' $P250 = "43_1268405315.85642" 
    capture_lex $P250
    .const 'Sub' $P244 = "42_1268405315.85642" 
    capture_lex $P244
    .const 'Sub' $P235 = "41_1268405315.85642" 
    capture_lex $P235
    .const 'Sub' $P224 = "40_1268405315.85642" 
    capture_lex $P224
    .const 'Sub' $P217 = "39_1268405315.85642" 
    capture_lex $P217
    .const 'Sub' $P210 = "38_1268405315.85642" 
    capture_lex $P210
    .const 'Sub' $P203 = "37_1268405315.85642" 
    capture_lex $P203
    .const 'Sub' $P196 = "36_1268405315.85642" 
    capture_lex $P196
    .const 'Sub' $P186 = "35_1268405315.85642" 
    capture_lex $P186
    .const 'Sub' $P177 = "34_1268405315.85642" 
    capture_lex $P177
    .const 'Sub' $P167 = "33_1268405315.85642" 
    capture_lex $P167
    .const 'Sub' $P160 = "32_1268405315.85642" 
    capture_lex $P160
    .const 'Sub' $P150 = "31_1268405315.85642" 
    capture_lex $P150
    .const 'Sub' $P143 = "30_1268405315.85642" 
    capture_lex $P143
    .const 'Sub' $P136 = "29_1268405315.85642" 
    capture_lex $P136
    .const 'Sub' $P129 = "28_1268405315.85642" 
    capture_lex $P129
    .const 'Sub' $P124 = "27_1268405315.85642" 
    capture_lex $P124
    .const 'Sub' $P116 = "26_1268405315.85642" 
    capture_lex $P116
    .const 'Sub' $P109 = "25_1268405315.85642" 
    capture_lex $P109
    .const 'Sub' $P102 = "24_1268405315.85642" 
    capture_lex $P102
    .const 'Sub' $P92 = "23_1268405315.85642" 
    capture_lex $P92
    .const 'Sub' $P85 = "22_1268405315.85642" 
    capture_lex $P85
    .const 'Sub' $P78 = "21_1268405315.85642" 
    capture_lex $P78
    .const 'Sub' $P71 = "20_1268405315.85642" 
    capture_lex $P71
    .const 'Sub' $P61 = "19_1268405315.85642" 
    capture_lex $P61
    .const 'Sub' $P55 = "18_1268405315.85642" 
    capture_lex $P55
    .const 'Sub' $P48 = "17_1268405315.85642" 
    capture_lex $P48
    .const 'Sub' $P41 = "16_1268405315.85642" 
    capture_lex $P41
    .const 'Sub' $P34 = "15_1268405315.85642" 
    capture_lex $P34
    .const 'Sub' $P24 = "14_1268405315.85642" 
    capture_lex $P24
    .const 'Sub' $P20 = "13_1268405315.85642" 
    capture_lex $P20
    .const 'Sub' $P15 = "12_1268405315.85642" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268405315.85642" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 15
    .const 'Sub' $P20 = "13_1268405315.85642" 
    capture_lex $P20
    .lex "backtrace", $P20
# .annotate "line", 16
    .const 'Sub' $P24 = "14_1268405315.85642" 
    capture_lex $P24
    .lex "can", $P24
# .annotate "line", 17
    .const 'Sub' $P34 = "15_1268405315.85642" 
    capture_lex $P34
    .lex "class", $P34
# .annotate "line", 18
    .const 'Sub' $P41 = "16_1268405315.85642" 
    capture_lex $P41
    .lex "clone", $P41
# .annotate "line", 19
    .const 'Sub' $P48 = "17_1268405315.85642" 
    capture_lex $P48
    .lex "defined", $P48
# .annotate "line", 22
    .const 'Sub' $P55 = "18_1268405315.85642" 
    capture_lex $P55
    .lex "delete", $P55
# .annotate "line", 30
    .const 'Sub' $P61 = "19_1268405315.85642" 
    capture_lex $P61
    .lex "does", $P61
# .annotate "line", 31
    .const 'Sub' $P71 = "20_1268405315.85642" 
    capture_lex $P71
    .lex "elements", $P71
# .annotate "line", 32
    .const 'Sub' $P78 = "21_1268405315.85642" 
    capture_lex $P78
    .lex "exit", $P78
# .annotate "line", 33
    .const 'Sub' $P85 = "22_1268405315.85642" 
    capture_lex $P85
    .lex "get_addr", $P85
# .annotate "line", 34
    .const 'Sub' $P92 = "23_1268405315.85642" 
    capture_lex $P92
    .lex "getattribute", $P92
# .annotate "line", 35
    .const 'Sub' $P102 = "24_1268405315.85642" 
    capture_lex $P102
    .lex "get_class", $P102
# .annotate "line", 36
    .const 'Sub' $P109 = "25_1268405315.85642" 
    capture_lex $P109
    .lex "get_integer", $P109
# .annotate "line", 37
    .const 'Sub' $P116 = "26_1268405315.85642" 
    capture_lex $P116
    .lex "get_global", $P116
# .annotate "line", 38
    .const 'Sub' $P124 = "27_1268405315.85642" 
    capture_lex $P124
    .lex "getinterp", $P124
# .annotate "line", 39
    .const 'Sub' $P129 = "28_1268405315.85642" 
    capture_lex $P129
    .lex "get_namespace", $P129
# .annotate "line", 40
    .const 'Sub' $P136 = "29_1268405315.85642" 
    capture_lex $P136
    .lex "get_root_namespace", $P136
# .annotate "line", 41
    .const 'Sub' $P143 = "30_1268405315.85642" 
    capture_lex $P143
    .lex "inspect", $P143
# .annotate "line", 42
    .const 'Sub' $P150 = "31_1268405315.85642" 
    capture_lex $P150
    .lex "inspect_string", $P150
# .annotate "line", 43
    .const 'Sub' $P160 = "32_1268405315.85642" 
    capture_lex $P160
    .lex "isnull", $P160
# .annotate "line", 44
    .const 'Sub' $P167 = "33_1268405315.85642" 
    capture_lex $P167
    .lex "isa", $P167
# .annotate "line", 45
    .const 'Sub' $P177 = "34_1268405315.85642" 
    capture_lex $P177
    .lex "iseq", $P177
# .annotate "line", 46
    .const 'Sub' $P186 = "35_1268405315.85642" 
    capture_lex $P186
    .lex "join", $P186
# .annotate "line", 47
    .const 'Sub' $P196 = "36_1268405315.85642" 
    capture_lex $P196
    .lex "load_bytecode", $P196
# .annotate "line", 48
    .const 'Sub' $P203 = "37_1268405315.85642" 
    capture_lex $P203
    .lex "load_language", $P203
# .annotate "line", 49
    .const 'Sub' $P210 = "38_1268405315.85642" 
    capture_lex $P210
    .lex "new", $P210
# .annotate "line", 50
    .const 'Sub' $P217 = "39_1268405315.85642" 
    capture_lex $P217
    .lex "newclass", $P217
# .annotate "line", 51
    .const 'Sub' $P224 = "40_1268405315.85642" 
    capture_lex $P224
    .lex "setattribute", $P224
# .annotate "line", 53
    .const 'Sub' $P235 = "41_1268405315.85642" 
    capture_lex $P235
    .lex "set_integer", $P235
# .annotate "line", 54
    .const 'Sub' $P244 = "42_1268405315.85642" 
    capture_lex $P244
    .lex "throw", $P244
# .annotate "line", 55
    .const 'Sub' $P250 = "43_1268405315.85642" 
    capture_lex $P250
    .lex "typeof", $P250
# .annotate "line", 59
    .const 'Sub' $P257 = "44_1268405315.85642" 
    capture_lex $P257
    .lex "get_hll_global", $P257
# .annotate "line", 80
    .const 'Sub' $P283 = "45_1268405315.85642" 
    capture_lex $P283
    .lex "get_root_global", $P283
# .annotate "line", 101
    .const 'Sub' $P309 = "46_1268405315.85642" 
    capture_lex $P309
    .lex "make_root_namespace", $P309
# .annotate "line", 9
    find_lex $P336, "_pre_initload"
    find_lex $P337, "backtrace"
    find_lex $P338, "can"
    find_lex $P339, "class"
    find_lex $P340, "clone"
    find_lex $P341, "defined"
    find_lex $P342, "delete"
    find_lex $P343, "does"
    find_lex $P344, "elements"
    find_lex $P345, "exit"
    find_lex $P346, "get_addr"
    find_lex $P347, "getattribute"
    find_lex $P348, "get_class"
    find_lex $P349, "get_integer"
    find_lex $P350, "get_global"
    find_lex $P351, "getinterp"
    find_lex $P352, "get_namespace"
    find_lex $P353, "get_root_namespace"
    find_lex $P354, "inspect"
    find_lex $P355, "inspect_string"
    find_lex $P356, "isnull"
    find_lex $P357, "isa"
    find_lex $P358, "iseq"
    find_lex $P359, "join"
    find_lex $P360, "load_bytecode"
    find_lex $P361, "load_language"
    find_lex $P362, "new"
    find_lex $P363, "newclass"
    find_lex $P364, "setattribute"
    find_lex $P365, "set_integer"
    find_lex $P366, "throw"
    find_lex $P367, "typeof"
    find_lex $P368, "get_hll_global"
    find_lex $P369, "get_root_global"
    find_lex $P370, "make_root_namespace"
    .return ($P370)
.end


.namespace ["Opcode"]
.sub "_pre_initload"  :subid("12_1268405315.85642") :outer("11_1268405315.85642")
# .annotate "line", 9
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 11
    "export"("defined", "DEFAULT" :named("tags"))
# .annotate "line", 12
    $P18 = "export"("can", "does", "get_class", "isa", "new", "typeof", "TYPE" :named("tags"))
# .annotate "line", 9
    .return ($P18)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P19, exception, "payload"
    .return ($P19)
.end


.namespace ["Opcode"]
.sub "backtrace"  :subid("13_1268405315.85642") :outer("11_1268405315.85642")
# .annotate "line", 15
    new $P22, 'ExceptionHandler'
    set_addr $P22, control_21
    $P22."handle_types"(58)
    push_eh $P22
    backtrace 
    .return ()
  control_21:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P23, exception, "payload"
    .return ($P23)
.end


.namespace ["Opcode"]
.sub "can"  :subid("14_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_27
    .param pmc param_28
# .annotate "line", 16
    new $P26, 'ExceptionHandler'
    set_addr $P26, control_25
    $P26."handle_types"(58)
    push_eh $P26
    .lex "$object", param_27
    .lex "$method", param_28
    find_lex $P29, "$object"
    find_lex $P30, "$method"
    set $S31, $P30
    can $I32, $P29, $S31
    .return ($I32)
  control_25:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P33, exception, "payload"
    .return ($P33)
.end


.namespace ["Opcode"]
.sub "class"  :subid("15_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_37
# .annotate "line", 17
    new $P36, 'ExceptionHandler'
    set_addr $P36, control_35
    $P36."handle_types"(58)
    push_eh $P36
    .lex "$object", param_37
    find_lex $P38, "$object"
    class $P39, $P38
    .return ($P39)
  control_35:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P40, exception, "payload"
    .return ($P40)
.end


.namespace ["Opcode"]
.sub "clone"  :subid("16_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_44
# .annotate "line", 18
    new $P43, 'ExceptionHandler'
    set_addr $P43, control_42
    $P43."handle_types"(58)
    push_eh $P43
    .lex "$object", param_44
    find_lex $P45, "$object"
    clone $P46, $P45
    .return ($P46)
  control_42:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P47, exception, "payload"
    .return ($P47)
.end


.namespace ["Opcode"]
.sub "defined"  :subid("17_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_51
# .annotate "line", 19
    new $P50, 'ExceptionHandler'
    set_addr $P50, control_49
    $P50."handle_types"(58)
    push_eh $P50
    .lex "$object", param_51
    find_lex $P52, "$object"
    defined $I53, $P52
    .return ($I53)
  control_49:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P54, exception, "payload"
    .return ($P54)
.end


.namespace ["Opcode"]
.sub "delete"  :subid("18_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_58
    .param pmc param_59
# .annotate "line", 22
    new $P57, 'ExceptionHandler'
    set_addr $P57, control_56
    $P57."handle_types"(58)
    push_eh $P57
    .lex "$object", param_58
    .lex "$key", param_59
# .annotate "line", 23

		$P0 = find_lex '$object'
		$P1 = find_lex '$key'
		delete $P0[$P1]
	
# .annotate "line", 22
    .return ()
  control_56:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P60, exception, "payload"
    .return ($P60)
.end


.namespace ["Opcode"]
.sub "does"  :subid("19_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_64
    .param pmc param_65
# .annotate "line", 30
    new $P63, 'ExceptionHandler'
    set_addr $P63, control_62
    $P63."handle_types"(58)
    push_eh $P63
    .lex "$object", param_64
    .lex "$role", param_65
    find_lex $P66, "$object"
    find_lex $P67, "$role"
    set $S68, $P67
    does $I69, $P66, $S68
    .return ($I69)
  control_62:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P70, exception, "payload"
    .return ($P70)
.end


.namespace ["Opcode"]
.sub "elements"  :subid("20_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_74
# .annotate "line", 31
    new $P73, 'ExceptionHandler'
    set_addr $P73, control_72
    $P73."handle_types"(58)
    push_eh $P73
    .lex "$object", param_74
    find_lex $P75, "$object"
    elements $I76, $P75
    .return ($I76)
  control_72:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P77, exception, "payload"
    .return ($P77)
.end


.namespace ["Opcode"]
.sub "exit"  :subid("21_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_81
# .annotate "line", 32
    new $P80, 'ExceptionHandler'
    set_addr $P80, control_79
    $P80."handle_types"(58)
    push_eh $P80
    .lex "$status", param_81
    find_lex $P82, "$status"
    set $I83, $P82
    exit $I83
    .return ()
  control_79:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P84, exception, "payload"
    .return ($P84)
.end


.namespace ["Opcode"]
.sub "get_addr"  :subid("22_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_88
# .annotate "line", 33
    new $P87, 'ExceptionHandler'
    set_addr $P87, control_86
    $P87."handle_types"(58)
    push_eh $P87
    .lex "$object", param_88
    find_lex $P89, "$object"
    get_addr $I90, $P89
    .return ($I90)
  control_86:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P91, exception, "payload"
    .return ($P91)
.end


.namespace ["Opcode"]
.sub "getattribute"  :subid("23_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_95
    .param pmc param_96
# .annotate "line", 34
    new $P94, 'ExceptionHandler'
    set_addr $P94, control_93
    $P94."handle_types"(58)
    push_eh $P94
    .lex "$object", param_95
    .lex "$name", param_96
    find_lex $P97, "$object"
    find_lex $P98, "$name"
    set $S99, $P98
    getattribute $P100, $P97, $S99
    .return ($P100)
  control_93:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["Opcode"]
.sub "get_class"  :subid("24_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_105
# .annotate "line", 35
    new $P104, 'ExceptionHandler'
    set_addr $P104, control_103
    $P104."handle_types"(58)
    push_eh $P104
    .lex "$object", param_105
    find_lex $P106, "$object"
    get_class $P107, $P106
    .return ($P107)
  control_103:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["Opcode"]
.sub "get_integer"  :subid("25_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_112
# .annotate "line", 36
    new $P111, 'ExceptionHandler'
    set_addr $P111, control_110
    $P111."handle_types"(58)
    push_eh $P111
    .lex "$object", param_112
    find_lex $P113, "$object"
    set $I114, $P113
    .return ($I114)
  control_110:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, "payload"
    .return ($P115)
.end


.namespace ["Opcode"]
.sub "get_global"  :subid("26_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_119
# .annotate "line", 37
    new $P118, 'ExceptionHandler'
    set_addr $P118, control_117
    $P118."handle_types"(58)
    push_eh $P118
    .lex "$name", param_119
    find_lex $P120, "$name"
    set $S121, $P120
    get_global $P122, $S121
    .return ($P122)
  control_117:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P123, exception, "payload"
    .return ($P123)
.end


.namespace ["Opcode"]
.sub "getinterp"  :subid("27_1268405315.85642") :outer("11_1268405315.85642")
# .annotate "line", 38
    new $P126, 'ExceptionHandler'
    set_addr $P126, control_125
    $P126."handle_types"(58)
    push_eh $P126
    getinterp $P127
    .return ($P127)
  control_125:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P128, exception, "payload"
    .return ($P128)
.end


.namespace ["Opcode"]
.sub "get_namespace"  :subid("28_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_132
# .annotate "line", 39
    new $P131, 'ExceptionHandler'
    set_addr $P131, control_130
    $P131."handle_types"(58)
    push_eh $P131
    .lex "$namespace", param_132
    find_lex $P133, "$namespace"
    get_namespace $P134, $P133
    .return ($P134)
  control_130:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P135, exception, "payload"
    .return ($P135)
.end


.namespace ["Opcode"]
.sub "get_root_namespace"  :subid("29_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_139
# .annotate "line", 40
    new $P138, 'ExceptionHandler'
    set_addr $P138, control_137
    $P138."handle_types"(58)
    push_eh $P138
    .lex "@parts", param_139
    find_lex $P140, "@parts"
    get_root_namespace $P141, $P140
    .return ($P141)
  control_137:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P142, exception, "payload"
    .return ($P142)
.end


.namespace ["Opcode"]
.sub "inspect"  :subid("30_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_146
# .annotate "line", 41
    new $P145, 'ExceptionHandler'
    set_addr $P145, control_144
    $P145."handle_types"(58)
    push_eh $P145
    .lex "$object", param_146
    find_lex $P147, "$object"
    inspect $P148, $P147
    .return ($P148)
  control_144:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P149, exception, "payload"
    .return ($P149)
.end


.namespace ["Opcode"]
.sub "inspect_string"  :subid("31_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_153
    .param pmc param_154
# .annotate "line", 42
    new $P152, 'ExceptionHandler'
    set_addr $P152, control_151
    $P152."handle_types"(58)
    push_eh $P152
    .lex "$object", param_153
    .lex "$key", param_154
    find_lex $P155, "$object"
    find_lex $P156, "$key"
    set $S157, $P156
    inspect $P158, $P155, $S157
    .return ($P158)
  control_151:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P159, exception, "payload"
    .return ($P159)
.end


.namespace ["Opcode"]
.sub "isnull"  :subid("32_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_163
# .annotate "line", 43
    new $P162, 'ExceptionHandler'
    set_addr $P162, control_161
    $P162."handle_types"(58)
    push_eh $P162
    .lex "$object", param_163
    find_lex $P164, "$object"
    isnull $I165, $P164
    .return ($I165)
  control_161:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P166, exception, "payload"
    .return ($P166)
.end


.namespace ["Opcode"]
.sub "isa"  :subid("33_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_170
    .param pmc param_171
# .annotate "line", 44
    new $P169, 'ExceptionHandler'
    set_addr $P169, control_168
    $P169."handle_types"(58)
    push_eh $P169
    .lex "$object", param_170
    .lex "$class", param_171
    find_lex $P172, "$object"
    find_lex $P173, "$class"
    set $S174, $P173
    isa $I175, $P172, $S174
    .return ($I175)
  control_168:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P176, exception, "payload"
    .return ($P176)
.end


.namespace ["Opcode"]
.sub "iseq"  :subid("34_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_180
    .param pmc param_181
# .annotate "line", 45
    new $P179, 'ExceptionHandler'
    set_addr $P179, control_178
    $P179."handle_types"(58)
    push_eh $P179
    .lex "$object", param_180
    .lex "$other", param_181
    find_lex $P182, "$object"
    find_lex $P183, "$other"
    iseq $I184, $P182, $P183
    .return ($I184)
  control_178:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P185, exception, "payload"
    .return ($P185)
.end


.namespace ["Opcode"]
.sub "join"  :subid("35_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_189
    .param pmc param_190
# .annotate "line", 46
    new $P188, 'ExceptionHandler'
    set_addr $P188, control_187
    $P188."handle_types"(58)
    push_eh $P188
    .lex "$object", param_189
    .lex "$delim", param_190
    find_lex $P191, "$delim"
    set $S192, $P191
    find_lex $P193, "$object"
    join $S194, $S192, $P193
    .return ($S194)
  control_187:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P195, exception, "payload"
    .return ($P195)
.end


.namespace ["Opcode"]
.sub "load_bytecode"  :subid("36_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_199
# .annotate "line", 47
    new $P198, 'ExceptionHandler'
    set_addr $P198, control_197
    $P198."handle_types"(58)
    push_eh $P198
    .lex "$path", param_199
    find_lex $P200, "$path"
    set $S201, $P200
    load_bytecode $S201
    .return ()
  control_197:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P202, exception, "payload"
    .return ($P202)
.end


.namespace ["Opcode"]
.sub "load_language"  :subid("37_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_206
# .annotate "line", 48
    new $P205, 'ExceptionHandler'
    set_addr $P205, control_204
    $P205."handle_types"(58)
    push_eh $P205
    .lex "$name", param_206
    find_lex $P207, "$name"
    set $S208, $P207
    load_language $S208
    .return ()
  control_204:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P209, exception, "payload"
    .return ($P209)
.end


.namespace ["Opcode"]
.sub "new"  :subid("38_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_213
# .annotate "line", 49
    new $P212, 'ExceptionHandler'
    set_addr $P212, control_211
    $P212."handle_types"(58)
    push_eh $P212
    .lex "$type", param_213
    find_lex $P214, "$type"
    new $P215, $P214
    .return ($P215)
  control_211:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P216, exception, "payload"
    .return ($P216)
.end


.namespace ["Opcode"]
.sub "newclass"  :subid("39_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_220
# .annotate "line", 50
    new $P219, 'ExceptionHandler'
    set_addr $P219, control_218
    $P219."handle_types"(58)
    push_eh $P219
    .lex "$name", param_220
    find_lex $P221, "$name"
    newclass $P222, $P221
    .return ($P222)
  control_218:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P223, exception, "payload"
    .return ($P223)
.end


.namespace ["Opcode"]
.sub "setattribute"  :subid("40_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_227
    .param pmc param_228
    .param pmc param_229
# .annotate "line", 51
    new $P226, 'ExceptionHandler'
    set_addr $P226, control_225
    $P226."handle_types"(58)
    push_eh $P226
    .lex "$object", param_227
    .lex "$name", param_228
    .lex "$value", param_229
    find_lex $P230, "$object"
    find_lex $P231, "$name"
    set $S232, $P231
    find_lex $P233, "$value"
    setattribute $P230, $S232, $P233
    .return ()
  control_225:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P234, exception, "payload"
    .return ($P234)
.end


.namespace ["Opcode"]
.sub "set_integer"  :subid("41_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_238
    .param pmc param_239
# .annotate "line", 53
    new $P237, 'ExceptionHandler'
    set_addr $P237, control_236
    $P237."handle_types"(58)
    push_eh $P237
    .lex "$object", param_238
    .lex "$value", param_239
    find_lex $P240, "$object"
    find_lex $P241, "$value"
    set $I242, $P241
    assign $P240, $I242
    .return ()
  control_236:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P243, exception, "payload"
    .return ($P243)
.end


.namespace ["Opcode"]
.sub "throw"  :subid("42_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_247
# .annotate "line", 54
    new $P246, 'ExceptionHandler'
    set_addr $P246, control_245
    $P246."handle_types"(58)
    push_eh $P246
    .lex "$exception", param_247
    find_lex $P248, "$exception"
    throw $P248
    .return ()
  control_245:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P249, exception, "payload"
    .return ($P249)
.end


.namespace ["Opcode"]
.sub "typeof"  :subid("43_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_253
# .annotate "line", 55
    new $P252, 'ExceptionHandler'
    set_addr $P252, control_251
    $P252."handle_types"(58)
    push_eh $P252
    .lex "$object", param_253
    find_lex $P254, "$object"
    typeof $S255, $P254
    .return ($S255)
  control_251:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P256, exception, "payload"
    .return ($P256)
.end


.namespace ["Opcode"]
.sub "get_hll_global"  :subid("44_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_260
    .param pmc param_261 :optional
    .param int has_param_261 :opt_flag
# .annotate "line", 59
    new $P259, 'ExceptionHandler'
    set_addr $P259, control_258
    $P259."handle_types"(58)
    push_eh $P259
    .lex "$p1", param_260
    if has_param_261, optparam_48
    new $P262, "Undef"
    set param_261, $P262
  optparam_48:
    .lex "$p2", param_261
# .annotate "line", 62
    new $P263, "ResizablePMCArray"
    .lex "@parts", $P263
# .annotate "line", 68
    new $P264, "Undef"
    .lex "$name", $P264
# .annotate "line", 70
    new $P265, "Undef"
    .lex "$result", $P265
# .annotate "line", 62
    find_lex $P268, "$p1"
    $P269 = "isa"($P268, "String")
    if $P269, if_267
    find_lex $P272, "$p1"
    set $P266, $P272
    goto if_267_end
  if_267:
    find_lex $P270, "$p1"
    $P271 = $P270."split"("::")
    set $P266, $P271
  if_267_end:
    store_lex "@parts", $P266
# .annotate "line", 64
    find_lex $P274, "$p2"
    unless $P274, if_273_end
# .annotate "line", 65
    find_lex $P275, "@parts"
    find_lex $P276, "$p2"
    $P275."push"($P276)
  if_273_end:
# .annotate "line", 68
    find_lex $P277, "@parts"
    $P278 = $P277."pop"()
    store_lex "$name", $P278
# .annotate "line", 70

		$P0 = find_lex '@parts'
		$P1 = find_lex '$name'
		$S1 = $P1
		$P279 = get_hll_global [$P0], $S1
	
    store_lex "$result", $P279
# .annotate "line", 77
    new $P280, "Exception"
    set $P280['type'], 58
    find_lex $P281, "$result"
    setattribute $P280, 'payload', $P281
    throw $P280
# .annotate "line", 59
    .return ()
  control_258:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P282, exception, "payload"
    .return ($P282)
.end


.namespace ["Opcode"]
.sub "get_root_global"  :subid("45_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_286
    .param pmc param_287 :optional
    .param int has_param_287 :opt_flag
# .annotate "line", 80
    new $P285, 'ExceptionHandler'
    set_addr $P285, control_284
    $P285."handle_types"(58)
    push_eh $P285
    .lex "$p1", param_286
    if has_param_287, optparam_49
    new $P288, "Undef"
    set param_287, $P288
  optparam_49:
    .lex "$p2", param_287
# .annotate "line", 83
    new $P289, "ResizablePMCArray"
    .lex "@parts", $P289
# .annotate "line", 89
    new $P290, "Undef"
    .lex "$name", $P290
# .annotate "line", 91
    new $P291, "Undef"
    .lex "$result", $P291
# .annotate "line", 83
    find_lex $P294, "$p1"
    isa $I295, $P294, "String"
    if $I295, if_293
    find_lex $P298, "$p1"
    set $P292, $P298
    goto if_293_end
  if_293:
    find_lex $P296, "$p1"
    $P297 = $P296."split"("::")
    set $P292, $P297
  if_293_end:
    store_lex "@parts", $P292
# .annotate "line", 85
    find_lex $P300, "$p2"
    unless $P300, if_299_end
# .annotate "line", 86
    find_lex $P301, "@parts"
    find_lex $P302, "$p2"
    $P301."push"($P302)
  if_299_end:
# .annotate "line", 89
    find_lex $P303, "@parts"
    $P304 = $P303."pop"()
    store_lex "$name", $P304
# .annotate "line", 91

		$P0 = find_lex '@parts'
		$P1 = find_lex '$name'
		$S1 = $P1
		$P305 = get_root_global [$P0], $S1
	
    store_lex "$result", $P305
# .annotate "line", 98
    new $P306, "Exception"
    set $P306['type'], 58
    find_lex $P307, "$result"
    setattribute $P306, 'payload', $P307
    throw $P306
# .annotate "line", 80
    .return ()
  control_284:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P308, exception, "payload"
    .return ($P308)
.end


.namespace ["Opcode"]
.sub "make_root_namespace"  :subid("46_1268405315.85642") :outer("11_1268405315.85642")
    .param pmc param_312
# .annotate "line", 101
    .const 'Sub' $P319 = "47_1268405315.85642" 
    capture_lex $P319
    new $P311, 'ExceptionHandler'
    set_addr $P311, control_310
    $P311."handle_types"(58)
    push_eh $P311
    .lex "$p1", param_312
# .annotate "line", 102
    new $P313, "Undef"
    .lex "$result", $P313
# .annotate "line", 101
    find_lex $P314, "$result"
# .annotate "line", 104
    find_lex $P316, "$p1"
    $P317 = "defined"($P316)
    if $P317, if_315
# .annotate "line", 111
    "die"("Undefined namespace path")
# .annotate "line", 110
    goto if_315_end
  if_315:
# .annotate "line", 104
    .const 'Sub' $P319 = "47_1268405315.85642" 
    capture_lex $P319
    $P319()
  if_315_end:
# .annotate "line", 114
    new $P333, "Exception"
    set $P333['type'], 58
    find_lex $P334, "$result"
    setattribute $P333, 'payload', $P334
    throw $P333
# .annotate "line", 101
    .return ()
  control_310:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P335, exception, "payload"
    .return ($P335)
.end


.namespace ["Opcode"]
.sub "_block318"  :anon :subid("47_1268405315.85642") :outer("46_1268405315.85642")
# .annotate "line", 105
    new $P320, "ResizablePMCArray"
    .lex "@parts", $P320
# .annotate "line", 107
    new $P321, "Undef"
    .lex "$nsp", $P321
# .annotate "line", 105
    find_lex $P324, "$p1"
    $P325 = "isa"($P324, "String")
    if $P325, if_323
    find_lex $P328, "$p1"
    set $P322, $P328
    goto if_323_end
  if_323:
    find_lex $P326, "$p1"
    $P327 = $P326."split"("::")
    set $P322, $P327
  if_323_end:
    store_lex "@parts", $P322
# .annotate "line", 107
    $P329 = "get_root_namespace"()
    store_lex "$nsp", $P329
# .annotate "line", 108
    find_lex $P330, "$nsp"
    find_lex $P331, "@parts"
    $P332 = $P330."make_namespace"($P331)
    store_lex "$result", $P332
# .annotate "line", 104
    .return ($P332)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268405311.81635")
# .annotate "line", 0
    get_hll_global $P14, ["Parrot"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Parrot"], "_block13" 
    capture_lex $P14
    $P496 = $P14()
# .annotate "line", 1
    .return ($P496)
.end


.namespace []
.sub "" :load :init :subid("post39") :outer("10_1268405311.81635")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268405311.81635" 
    .local pmc block
    set block, $P12
    $P497 = get_root_global ["parrot"], "P6metaclass"
    $P497."new_class"("Parrot")
.end


.namespace ["Parrot"]
.sub "_block13"  :subid("11_1268405311.81635") :outer("10_1268405311.81635")
# .annotate "line", 7
    .const 'Sub' $P381 = "35_1268405311.81635" 
    capture_lex $P381
    .const 'Sub' $P359 = "34_1268405311.81635" 
    capture_lex $P359
    .const 'Sub' $P347 = "33_1268405311.81635" 
    capture_lex $P347
    .const 'Sub' $P327 = "31_1268405311.81635" 
    capture_lex $P327
    .const 'Sub' $P317 = "30_1268405311.81635" 
    capture_lex $P317
    .const 'Sub' $P310 = "29_1268405311.81635" 
    capture_lex $P310
    .const 'Sub' $P279 = "28_1268405311.81635" 
    capture_lex $P279
    .const 'Sub' $P237 = "27_1268405311.81635" 
    capture_lex $P237
    .const 'Sub' $P224 = "26_1268405311.81635" 
    capture_lex $P224
    .const 'Sub' $P198 = "25_1268405311.81635" 
    capture_lex $P198
    .const 'Sub' $P163 = "24_1268405311.81635" 
    capture_lex $P163
    .const 'Sub' $P154 = "23_1268405311.81635" 
    capture_lex $P154
    .const 'Sub' $P133 = "22_1268405311.81635" 
    capture_lex $P133
    .const 'Sub' $P122 = "21_1268405311.81635" 
    capture_lex $P122
    .const 'Sub' $P115 = "20_1268405311.81635" 
    capture_lex $P115
    .const 'Sub' $P103 = "19_1268405311.81635" 
    capture_lex $P103
    .const 'Sub' $P93 = "18_1268405311.81635" 
    capture_lex $P93
    .const 'Sub' $P80 = "17_1268405311.81635" 
    capture_lex $P80
    .const 'Sub' $P70 = "16_1268405311.81635" 
    capture_lex $P70
    .const 'Sub' $P57 = "15_1268405311.81635" 
    capture_lex $P57
    .const 'Sub' $P42 = "14_1268405311.81635" 
    capture_lex $P42
    .const 'Sub' $P27 = "13_1268405311.81635" 
    capture_lex $P27
    .const 'Sub' $P15 = "12_1268405311.81635" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268405311.81635" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 32
    .const 'Sub' $P27 = "13_1268405311.81635" 
    capture_lex $P27
    .lex "caller", $P27
# .annotate "line", 39
    .const 'Sub' $P42 = "14_1268405311.81635" 
    capture_lex $P42
    .lex "caller_namespace", $P42
# .annotate "line", 44
    .const 'Sub' $P57 = "15_1268405311.81635" 
    capture_lex $P57
    .lex "call_method", $P57
# .annotate "line", 50
    .const 'Sub' $P70 = "16_1268405311.81635" 
    capture_lex $P70
    .lex "call_method_", $P70
# .annotate "line", 70
    .const 'Sub' $P80 = "17_1268405311.81635" 
    capture_lex $P80
    .lex "call_tuple_method", $P80
# .annotate "line", 76
    .const 'Sub' $P93 = "18_1268405311.81635" 
    capture_lex $P93
    .lex "call_tuple_method_", $P93
# .annotate "line", 98
    .const 'Sub' $P103 = "19_1268405311.81635" 
    capture_lex $P103
    .lex "call_sub", $P103
# .annotate "line", 102
    .const 'Sub' $P115 = "20_1268405311.81635" 
    capture_lex $P115
    .lex "call_sub_", $P115
# .annotate "line", 123
    .const 'Sub' $P122 = "21_1268405311.81635" 
    capture_lex $P122
    .lex "call_tuple_sub", $P122
# .annotate "line", 127
    .const 'Sub' $P133 = "22_1268405311.81635" 
    capture_lex $P133
    .lex "call_tuple_sub_", $P133
# .annotate "line", 152
    .const 'Sub' $P154 = "23_1268405311.81635" 
    capture_lex $P154
    .lex "get_address_of", $P154
# .annotate "line", 157
    .const 'Sub' $P163 = "24_1268405311.81635" 
    capture_lex $P163
    .lex "get_hll_global", $P163
# .annotate "line", 180
    .const 'Sub' $P198 = "25_1268405311.81635" 
    capture_lex $P198
    .lex "get_hll_namespace", $P198
# .annotate "line", 198
    .const 'Sub' $P224 = "26_1268405311.81635" 
    capture_lex $P224
    .lex "get_self", $P224
# .annotate "line", 208
    .const 'Sub' $P237 = "27_1268405311.81635" 
    capture_lex $P237
    .lex "get_sub", $P237
# .annotate "line", 232
    .const 'Sub' $P279 = "28_1268405311.81635" 
    capture_lex $P279
    .lex "isa", $P279
# .annotate "line", 247
    .const 'Sub' $P310 = "29_1268405311.81635" 
    capture_lex $P310
    .lex "is_null", $P310
# .annotate "line", 251
    .const 'Sub' $P317 = "30_1268405311.81635" 
    capture_lex $P317
    .lex "key", $P317
# .annotate "line", 256
    .const 'Sub' $P327 = "31_1268405311.81635" 
    capture_lex $P327
    .lex "key_", $P327
# .annotate "line", 313
    .const 'Sub' $P347 = "33_1268405311.81635" 
    capture_lex $P347
    .lex "namespace_name", $P347
# .annotate "line", 319
    .const 'Sub' $P359 = "34_1268405311.81635" 
    capture_lex $P359
    .lex "new", $P359
# .annotate "line", 327
    .const 'Sub' $P381 = "35_1268405311.81635" 
    capture_lex $P381
    .lex "qualified_name", $P381
# .annotate "line", 7
    find_lex $P473, "_pre_initload"
    find_lex $P474, "caller"
    find_lex $P475, "caller_namespace"
    find_lex $P476, "call_method"
    find_lex $P477, "call_method_"
    find_lex $P478, "call_tuple_method"
    find_lex $P479, "call_tuple_method_"
    find_lex $P480, "call_sub"
    find_lex $P481, "call_sub_"
    find_lex $P482, "call_tuple_sub"
    find_lex $P483, "call_tuple_sub_"
    find_lex $P484, "get_address_of"
    find_lex $P485, "get_hll_global"
    find_lex $P486, "get_hll_namespace"
    find_lex $P487, "get_self"
    find_lex $P488, "get_sub"
    find_lex $P489, "isa"
    find_lex $P490, "is_null"
    find_lex $P491, "key"
    find_lex $P492, "key_"
    find_lex $P493, "namespace_name"
    find_lex $P494, "new"
    find_lex $P495, "qualified_name"
    .return ($P495)
.end


.namespace ["Parrot"]
.sub "_pre_initload"  :subid("12_1268405311.81635") :outer("11_1268405311.81635")
# .annotate "line", 7
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 8
    new $P18, "ResizablePMCArray"
    push $P18, "call_method"
    push $P18, "call_method_"
    push $P18, "call_sub"
    push $P18, "call_sub_"
    push $P18, "call_tuple_method"
    push $P18, "call_tuple_method_"
    push $P18, "call_tuple_sub"
    push $P18, "call_tuple_sub_"
    "export"($P18, "CALL" :named("tags"))
# .annotate "line", 15
    new $P19, "ResizablePMCArray"
    push $P19, "caller"
    push $P19, "caller_namespace"
    "export"($P19, "CALLER" :named("tags"))
# .annotate "line", 20
    new $P20, "ResizablePMCArray"
    push $P20, "caller_namespace"
    push $P20, "get_hll_namespace"
    push $P20, "namespace_name"
    "export"($P20, "NAMESPACE" :named("tags"))
# .annotate "line", 26
    get_hll_global $P21, ["Global"], "inject_root_symbol"
    get_hll_global $P22, ["Parrot"], "is_null"
    $P21($P22)
# .annotate "line", 27
    get_hll_global $P23, ["Global"], "inject_root_symbol"
    get_hll_global $P24, ["Parrot"], "isa"
    $P25 = $P23($P24)
# .annotate "line", 7
    .return ($P25)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P26, exception, "payload"
    .return ($P26)
.end


.namespace ["Parrot"]
.sub "caller"  :subid("13_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_30 :optional
    .param int has_param_30 :opt_flag
# .annotate "line", 32
    new $P29, 'ExceptionHandler'
    set_addr $P29, control_28
    $P29."handle_types"(58)
    push_eh $P29
    if has_param_30, optparam_40
    new $P31, "Integer"
    assign $P31, 1
    set param_30, $P31
  optparam_40:
    .lex "$index", param_30
# .annotate "line", 33
    new $P32, "Undef"
    .lex "$key", $P32
# .annotate "line", 34
    new $P33, "Undef"
    .lex "&sub", $P33
# .annotate "line", 33
    get_hll_global $P34, ["Key"], "create_key"
    find_lex $P35, "$index"
    add $P36, $P35, 1
    $P37 = $P34("sub", $P36)
    store_lex "$key", $P37
# .annotate "line", 34
    find_lex $P38, "$key"
    getinterp $P39
    set $P40, $P39[$P38]
    unless_null $P40, vivify_41
    new $P40, "Undef"
  vivify_41:
    store_lex "&sub", $P40
# .annotate "line", 32
    .return ($P40)
  control_28:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P41, exception, "payload"
    .return ($P41)
.end


.namespace ["Parrot"]
.sub "caller_namespace"  :subid("14_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_45 :optional
    .param int has_param_45 :opt_flag
# .annotate "line", 39
    new $P44, 'ExceptionHandler'
    set_addr $P44, control_43
    $P44."handle_types"(58)
    push_eh $P44
    if has_param_45, optparam_42
    new $P46, "Integer"
    assign $P46, 1
    set param_45, $P46
  optparam_42:
    .lex "$index", param_45
# .annotate "line", 40
    new $P47, "Undef"
    .lex "$key", $P47
# .annotate "line", 41
    new $P48, "Undef"
    .lex "$nsp", $P48
# .annotate "line", 40
    get_hll_global $P49, ["Key"], "create_key"
    find_lex $P50, "$index"
    add $P51, $P50, 1
    $P52 = $P49("namespace", $P51)
    store_lex "$key", $P52
# .annotate "line", 41
    find_lex $P53, "$key"
    getinterp $P54
    set $P55, $P54[$P53]
    unless_null $P55, vivify_43
    new $P55, "Undef"
  vivify_43:
    store_lex "$nsp", $P55
# .annotate "line", 39
    .return ($P55)
  control_43:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P56, exception, "payload"
    .return ($P56)
.end


.namespace ["Parrot"]
.sub "call_method"  :subid("15_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_60
    .param pmc param_61
    .param pmc param_62 :slurpy
    .param pmc param_63 :slurpy :named
# .annotate "line", 44
    new $P59, 'ExceptionHandler'
    set_addr $P59, control_58
    $P59."handle_types"(58)
    push_eh $P59
    .lex "$object", param_60
    .lex "$method_name", param_61
    .lex "@args", param_62
    .lex "%opts", param_63
# .annotate "line", 45
    find_lex $P64, "$object"
    find_lex $P65, "$method_name"
    find_lex $P66, "@args"
    find_lex $P67, "%opts"
    $P68 = "call_method_"($P64, $P65, $P66, $P67)
# .annotate "line", 44
    .return ($P68)
  control_58:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P69, exception, "payload"
    .return ($P69)
.end


.namespace ["Parrot"]
.sub "call_method_"  :subid("16_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_73
    .param pmc param_74
    .param pmc param_75 :optional
    .param int has_param_75 :opt_flag
    .param pmc param_77 :optional
    .param int has_param_77 :opt_flag
# .annotate "line", 50
    new $P72, 'ExceptionHandler'
    set_addr $P72, control_71
    $P72."handle_types"(58)
    push_eh $P72
    .lex "$object", param_73
    .lex "$method_name", param_74
    if has_param_75, optparam_44
    new $P76, "ResizablePMCArray"
    set param_75, $P76
  optparam_44:
    .lex "@args", param_75
    if has_param_77, optparam_45
    new $P78, "Hash"
    set param_77, $P78
  optparam_45:
    .lex "%opts", param_77
# .annotate "line", 52

		.local pmc object, meth, args, opts
		object	= find_lex '$object'
		meth	= find_lex '$method_name'
		args	= find_lex '@args'
		opts	= find_lex '%opts'
		
		$I0 = isa meth, 'Sub'
		unless $I0 goto call_string
		
		.tailcall object.meth(args :flat, opts :named :flat)
		
	call_string:
		$S0 = meth
		.tailcall object.$S0(args :flat, opts :named :flat)
	
# .annotate "line", 50
    .return ()
  control_71:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P79, exception, "payload"
    .return ($P79)
.end


.namespace ["Parrot"]
.sub "call_tuple_method"  :subid("17_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_83
    .param pmc param_84
    .param pmc param_85 :slurpy
    .param pmc param_86 :slurpy :named
# .annotate "line", 70
    new $P82, 'ExceptionHandler'
    set_addr $P82, control_81
    $P82."handle_types"(58)
    push_eh $P82
    .lex "$object", param_83
    .lex "$method", param_84
    .lex "@args", param_85
    .lex "%opts", param_86
# .annotate "line", 71
    find_lex $P87, "$object"
    find_lex $P88, "$method"
    find_lex $P89, "@args"
    find_lex $P90, "%opts"
    $P91 = "call_tuple_method_"($P87, $P88, $P89, $P90)
# .annotate "line", 70
    .return ($P91)
  control_81:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P92, exception, "payload"
    .return ($P92)
.end


.namespace ["Parrot"]
.sub "call_tuple_method_"  :subid("18_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_96
    .param pmc param_97
    .param pmc param_98 :optional
    .param int has_param_98 :opt_flag
    .param pmc param_100 :optional
    .param int has_param_100 :opt_flag
# .annotate "line", 76
    new $P95, 'ExceptionHandler'
    set_addr $P95, control_94
    $P95."handle_types"(58)
    push_eh $P95
    .lex "$object", param_96
    .lex "$method", param_97
    if has_param_98, optparam_46
    new $P99, "ResizablePMCArray"
    set param_98, $P99
  optparam_46:
    .lex "@args", param_98
    if has_param_100, optparam_47
    new $P101, "Hash"
    set param_100, $P101
  optparam_47:
    .lex "%opts", param_100
# .annotate "line", 78

		.local pmc object, meth, args, opts
		object	= find_lex '$object'
		meth	= find_lex '$method'
		args	= find_lex '@args'
		opts	= find_lex '%opts'
		
		$I0 = isa meth, 'Sub'
		unless $I0 goto call_string
		
		( $P0 :slurpy ) = object.meth(args :flat, opts :named :flat)
		.return ($P0)
		
	call_string:
		$S0 = meth
		( $P0 :slurpy ) = object.$S0(args :flat, opts :named :flat)
		.return ($P0)
	
# .annotate "line", 76
    .return ()
  control_94:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["Parrot"]
.sub "call_sub"  :subid("19_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_106
    .param pmc param_107 :slurpy
    .param pmc param_108 :slurpy :named
# .annotate "line", 98
    new $P105, 'ExceptionHandler'
    set_addr $P105, control_104
    $P105."handle_types"(58)
    push_eh $P105
    .lex "$sub_name", param_106
    .lex "@args", param_107
    .lex "%opts", param_108
# .annotate "line", 99
    new $P109, "Exception"
    set $P109['type'], 58
    find_lex $P110, "$sub_name"
    find_lex $P111, "@args"
    find_lex $P112, "%opts"
    $P113 = "call_sub_"($P110, $P111, $P112)
    setattribute $P109, 'payload', $P113
    throw $P109
# .annotate "line", 98
    .return ()
  control_104:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["Parrot"]
.sub "call_sub_"  :subid("20_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_118
    .param pmc param_119
    .param pmc param_120
# .annotate "line", 102
    new $P117, 'ExceptionHandler'
    set_addr $P117, control_116
    $P117."handle_types"(58)
    push_eh $P117
    .lex "$sub_name", param_118
    .lex "@args", param_119
    .lex "%opts", param_120
# .annotate "line", 106

		.local pmc sub, args, opts
		sub	= find_lex '$sub_name'
		args 	= find_lex '@args'
		opts	= find_lex '%opts'
		
		$I0 = isa sub, 'Sub'
		if $I0 goto call_sub
		
		$S0 = sub
		sub = find_sub_not_null $S0
		
	call_sub:
		.tailcall sub(args :flat, opts :named :flat)
	
# .annotate "line", 102
    .return ()
  control_116:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, "payload"
    .return ($P121)
.end


.namespace ["Parrot"]
.sub "call_tuple_sub"  :subid("21_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_125
    .param pmc param_126 :slurpy
    .param pmc param_127 :slurpy :named
# .annotate "line", 123
    new $P124, 'ExceptionHandler'
    set_addr $P124, control_123
    $P124."handle_types"(58)
    push_eh $P124
    .lex "$sub", param_125
    .lex "@args", param_126
    .lex "%opts", param_127
# .annotate "line", 124
    find_lex $P128, "$sub"
    find_lex $P129, "@args"
    find_lex $P130, "%opts"
    $P131 = "call_tuple_sub_"($P128, $P129, $P130)
# .annotate "line", 123
    .return ($P131)
  control_123:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P132, exception, "payload"
    .return ($P132)
.end


.namespace ["Parrot"]
.sub "call_tuple_sub_"  :subid("22_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_136
    .param pmc param_137 :optional
    .param int has_param_137 :opt_flag
    .param pmc param_139 :optional
    .param int has_param_139 :opt_flag
# .annotate "line", 127
    new $P135, 'ExceptionHandler'
    set_addr $P135, control_134
    $P135."handle_types"(58)
    push_eh $P135
    .lex "$sub", param_136
    if has_param_137, optparam_48
    new $P138, "ResizablePMCArray"
    set param_137, $P138
  optparam_48:
    .lex "@args", param_137
    if has_param_139, optparam_49
    new $P140, "Hash"
    set param_139, $P140
  optparam_49:
    .lex "%opts", param_139
# .annotate "line", 131
    get_hll_global $P142, ["Opcode"], "defined"
    find_lex $P143, "@args"
    $P144 = $P142($P143)
    if $P144, unless_141_end
    get_hll_global $P145, ["Array"], "new"
    $P146 = $P145()
    store_lex "@args", $P146
  unless_141_end:
# .annotate "line", 132
    get_hll_global $P148, ["Opcode"], "defined"
    find_lex $P149, "%opts"
    $P150 = $P148($P149)
    if $P150, unless_147_end
    get_hll_global $P151, ["Hash"], "empty"
    $P152 = $P151()
    store_lex "%opts", $P152
  unless_147_end:
# .annotate "line", 134

		.local pmc sub, args, opts
		sub	= find_lex '$sub'
		args	= find_lex '@args'
		opts	= find_lex '%opts'
		
		$I0 = isa sub, 'Sub'
		if $I0 goto call_sub
		
		$S0 = sub
		sub = find_sub_not_null $S0
	
	call_sub:
		( $P0 :slurpy ) = sub(args :flat, opts :named :flat)
		.return ($P0)		
	
# .annotate "line", 127
    .return ()
  control_134:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P153, exception, "payload"
    .return ($P153)
.end


.namespace ["Parrot"]
.sub "get_address_of"  :subid("23_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_157
# .annotate "line", 152
    new $P156, 'ExceptionHandler'
    set_addr $P156, control_155
    $P156."handle_types"(58)
    push_eh $P156
    .lex "$what", param_157
# .annotate "line", 153
    new $P158, "Exception"
    set $P158['type'], 58
    get_hll_global $P159, ["Opcode"], "get_addr"
    find_lex $P160, "$what"
    $P161 = $P159($P160)
    setattribute $P158, 'payload', $P161
    throw $P158
# .annotate "line", 152
    .return ()
  control_155:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P162, exception, "payload"
    .return ($P162)
.end


.namespace ["Parrot"]
.sub "get_hll_global"  :subid("24_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_166
# .annotate "line", 157
    new $P165, 'ExceptionHandler'
    set_addr $P165, control_164
    $P165."handle_types"(58)
    push_eh $P165
    .lex "$path", param_166
# .annotate "line", 166
    new $P167, "Undef"
    .lex "$name", $P167
# .annotate "line", 167
    new $P168, "Undef"
    .lex "$key", $P168
# .annotate "line", 158
    find_lex $P170, "$path"
    $P171 = $P170."isa"("String")
    unless $P171, if_169_end
# .annotate "line", 159
    find_lex $P172, "$path"
    $P173 = $P172."split"("::")
    store_lex "$path", $P173
  if_169_end:
# .annotate "line", 162
    find_lex $P175, "$path"
    new $P176, "String"
    assign $P176, "array"
    set $S177, $P176
    does $I178, $P175, $S177
    if $I178, unless_174_end
# .annotate "line", 163
    find_lex $P179, "$path"
    concat $P180, $P179, " parameter must be a ::string or array of strings, not: "
    find_lex $P181, "$path"
    "die"($P180, $P181)
  unless_174_end:
# .annotate "line", 166
    find_lex $P182, "$path"
    $P183 = $P182."pop"()
    store_lex "$name", $P183
# .annotate "line", 167
    find_lex $P184, "$path"
    $P185 = "key_"($P184)
    store_lex "$key", $P185
# .annotate "line", 169
    find_lex $P188, "$key"
    $P189 = $P188."defined"()
    if $P189, if_187
# .annotate "line", 171
    find_lex $P194, "$name"
    set $S195, $P194
    get_hll_global $P196, $S195
    set $P186, $P196
# .annotate "line", 169
    goto if_187_end
  if_187:
# .annotate "line", 170
    find_lex $P190, "$key"
    find_lex $P191, "$name"
    set $S192, $P191
    get_hll_global $P193, $P190, $S192
    set $P186, $P193
  if_187_end:
# .annotate "line", 157
    .return ($P186)
  control_164:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P197, exception, "payload"
    .return ($P197)
.end


.namespace ["Parrot"]
.sub "get_hll_namespace"  :subid("25_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_201 :optional
    .param int has_param_201 :opt_flag
# .annotate "line", 180
    new $P200, 'ExceptionHandler'
    set_addr $P200, control_199
    $P200."handle_types"(58)
    push_eh $P200
    if has_param_201, optparam_50
    new $P202, "Undef"
    set param_201, $P202
  optparam_50:
    .lex "$path", param_201
# .annotate "line", 182
    new $P203, "Undef"
    .lex "$result", $P203
# .annotate "line", 180
    find_lex $P204, "$result"
# .annotate "line", 184
    find_lex $P206, "$path"
    defined $I207, $P206
    if $I207, if_205
# .annotate "line", 192
    get_hll_namespace $P221
    store_lex "$result", $P221
# .annotate "line", 191
    goto if_205_end
  if_205:
# .annotate "line", 185
    find_lex $P209, "$path"
    new $P210, "String"
    assign $P210, "String"
    set $S211, $P210
    isa $I212, $P209, $S211
    unless $I212, if_208_end
# .annotate "line", 186
    new $P213, "String"
    assign $P213, "::"
    set $S214, $P213
    find_lex $P215, "$path"
    set $S216, $P215
    split $P217, $S214, $S216
    $P218 = "key_"($P217)
    store_lex "$path", $P218
  if_208_end:
# .annotate "line", 189
    find_lex $P219, "$path"
    get_hll_namespace $P220, $P219
    store_lex "$result", $P220
  if_205_end:
# .annotate "line", 184
    find_lex $P222, "$result"
# .annotate "line", 180
    .return ($P222)
  control_199:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P223, exception, "payload"
    .return ($P223)
.end


.namespace ["Parrot"]
.sub "get_self"  :subid("26_1268405311.81635") :outer("11_1268405311.81635")
# .annotate "line", 198
    new $P226, 'ExceptionHandler'
    set_addr $P226, control_225
    $P226."handle_types"(58)
    push_eh $P226
# .annotate "line", 199
    new $P227, "Undef"
    .lex "$self", $P227
    new $P228, "String"
    assign $P228, "self"
    set $S229, $P228
    find_dynamic_lex $P230, $S229
    store_lex "$self", $P230
# .annotate "line", 201
    find_lex $P232, "$self"
    isnull $I233, $P232
    unless $I233, if_231_end
# .annotate "line", 202
    die "Fatal: No 'self' lexical in any caller scope"
  if_231_end:
# .annotate "line", 205
    new $P234, "Exception"
    set $P234['type'], 58
    find_lex $P235, "$self"
    setattribute $P234, 'payload', $P235
    throw $P234
# .annotate "line", 198
    .return ()
  control_225:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P236, exception, "payload"
    .return ($P236)
.end


.namespace ["Parrot"]
.sub "get_sub"  :subid("27_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_240
    .param pmc param_241 :optional :named("caller_nsp")
    .param int has_param_241 :opt_flag
# .annotate "line", 208
    new $P239, 'ExceptionHandler'
    set_addr $P239, control_238
    $P239."handle_types"(58)
    push_eh $P239
    .lex "$path", param_240
    if has_param_241, optparam_51
    new $P242, "Undef"
    set param_241, $P242
  optparam_51:
    .lex "$caller_nsp", param_241
# .annotate "line", 209
    new $P243, "ResizablePMCArray"
    .lex "@parts", $P243
# .annotate "line", 210
    new $P244, "Undef"
    .lex "$name", $P244
# .annotate "line", 211
    new $P245, "Undef"
    .lex "&sub", $P245
# .annotate "line", 223
    new $P246, "Undef"
    .lex "$namespace", $P246
# .annotate "line", 209
    find_lex $P247, "$path"
    $P248 = $P247."split"("::")
    store_lex "@parts", $P248
# .annotate "line", 210
    find_lex $P249, "@parts"
    $P250 = $P249."pop"()
    store_lex "$name", $P250
    find_lex $P251, "&sub"
# .annotate "line", 213
    find_lex $P253, "@parts"
    set $N254, $P253
    iseq $I255, $N254, 0.0
    unless $I255, if_252_end
# .annotate "line", 214
    find_lex $P257, "$caller_nsp"
    if $P257, unless_256_end
    $P258 = "caller_namespace"(2)
    store_lex "$caller_nsp", $P258
  unless_256_end:
# .annotate "line", 216
    find_lex $P259, "$caller_nsp"
    find_lex $P260, "$name"
    $P261 = $P259."find_sub"($P260)
    store_lex "&sub", $P261
# .annotate "line", 218
    get_hll_global $P263, ["Opcode"], "defined"
    find_lex $P264, "&sub"
    $P265 = $P263($P264)
    unless $P265, if_262_end
# .annotate "line", 219
    new $P266, "Exception"
    set $P266['type'], 58
    find_lex $P267, "&sub"
    setattribute $P266, 'payload', $P267
    throw $P266
  if_262_end:
  if_252_end:
# .annotate "line", 223
    get_hll_global $P268, ["Opcode"], "get_hll_namespace"
    find_lex $P269, "@parts"
    $P270 = $P268($P269)
    store_lex "$namespace", $P270
# .annotate "line", 225
    find_lex $P272, "$namespace"
    unless $P272, if_271_end
# .annotate "line", 226
    find_lex $P273, "$namespace"
    find_lex $P274, "$name"
    $P275 = $P273."find_sub"($P274)
    store_lex "&sub", $P275
  if_271_end:
# .annotate "line", 229
    new $P276, "Exception"
    set $P276['type'], 58
    find_lex $P277, "&sub"
    setattribute $P276, 'payload', $P277
    throw $P276
# .annotate "line", 208
    .return ()
  control_238:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P278, exception, "payload"
    .return ($P278)
.end


.namespace ["Parrot"]
.sub "isa"  :subid("28_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_282
    .param pmc param_283
# .annotate "line", 232
    new $P281, 'ExceptionHandler'
    set_addr $P281, control_280
    $P281."handle_types"(58)
    push_eh $P281
    .lex "$obj", param_282
    .lex "$class", param_283
# .annotate "line", 233
    find_lex $P285, "$class"
    new $P286, "String"
    assign $P286, "P6protoobject"
    set $S287, $P286
    isa $I288, $P285, $S287
    if $I288, if_284
# .annotate "line", 236
    find_lex $P293, "$class"
    new $P294, "String"
    assign $P294, "String"
    set $S295, $P294
    isa $I296, $P293, $S295
    unless $I296, if_292_end
# .annotate "line", 237
    find_lex $P297, "$class"
    $P298 = $P297."split"("::")
    store_lex "$class", $P298
# .annotate "line", 239
    find_lex $P300, "$class"
    elements $I301, $P300
    set $N302, $I301
    iseq $I303, $N302, 1.0
    unless $I303, if_299_end
# .annotate "line", 240
    find_lex $P304, "$class"
    $P305 = $P304."shift"()
    store_lex "$class", $P305
  if_299_end:
  if_292_end:
# .annotate "line", 236
    goto if_284_end
  if_284:
# .annotate "line", 234
    get_hll_global $P289, "P6metaclass"
    find_lex $P290, "$class"
    $P291 = $P289."get_parrotclass"($P290)
    store_lex "$class", $P291
  if_284_end:
# .annotate "line", 244
    find_lex $P306, "$obj"
    find_lex $P307, "$class"
    isa $I308, $P306, $P307
# .annotate "line", 232
    .return ($I308)
  control_280:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P309, exception, "payload"
    .return ($P309)
.end


.namespace ["Parrot"]
.sub "is_null"  :subid("29_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_313
# .annotate "line", 247
    new $P312, 'ExceptionHandler'
    set_addr $P312, control_311
    $P312."handle_types"(58)
    push_eh $P312
    .lex "$obj", param_313
# .annotate "line", 248
    find_lex $P314, "$obj"
    isnull $I315, $P314
# .annotate "line", 247
    .return ($I315)
  control_311:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P316, exception, "payload"
    .return ($P316)
.end


.namespace ["Parrot"]
.sub "key"  :subid("30_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_320
    .param pmc param_321 :slurpy
# .annotate "line", 251
    new $P319, 'ExceptionHandler'
    set_addr $P319, control_318
    $P319."handle_types"(58)
    push_eh $P319
    .lex "$first", param_320
    .lex "@parts", param_321
# .annotate "line", 252
    find_lex $P322, "@parts"
    find_lex $P323, "$first"
    $P322."unshift"($P323)
# .annotate "line", 253
    find_lex $P324, "@parts"
    $P325 = "key_"($P324)
# .annotate "line", 251
    .return ($P325)
  control_318:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P326, exception, "payload"
    .return ($P326)
.end


.namespace ["Parrot"]
.sub "key_"  :subid("31_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_330
# .annotate "line", 256
    .const 'Sub' $P338 = "32_1268405311.81635" 
    capture_lex $P338
    new $P329, 'ExceptionHandler'
    set_addr $P329, control_328
    $P329."handle_types"(58)
    push_eh $P329
    .lex "@parts", param_330
# .annotate "line", 257
    new $P331, "Undef"
    .lex "$key", $P331
# .annotate "line", 256
    find_lex $P332, "$key"
# .annotate "line", 259
    find_lex $P334, "@parts"
    defined $I335, $P334
    unless $I335, for_undef_52
    iter $P333, $P334
    new $P343, 'ExceptionHandler'
    set_addr $P343, loop342_handler
    $P343."handle_types"(65, 67, 66)
    push_eh $P343
  loop342_test:
    unless $P333, loop342_done
    shift $P336, $P333
  loop342_redo:
    .const 'Sub' $P338 = "32_1268405311.81635" 
    capture_lex $P338
    $P338($P336)
  loop342_next:
    goto loop342_test
  loop342_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P344, exception, 'type'
    eq $P344, 65, loop342_next
    eq $P344, 67, loop342_redo
  loop342_done:
    pop_eh 
  for_undef_52:
    find_lex $P345, "$key"
# .annotate "line", 256
    .return ($P345)
  control_328:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P346, exception, "payload"
    .return ($P346)
.end


.namespace ["Parrot"]
.sub "_block337"  :anon :subid("32_1268405311.81635") :outer("31_1268405311.81635")
    .param pmc param_340
# .annotate "line", 260
    new $P339, "Undef"
    .lex "$element", $P339
    .lex "$_", param_340
    find_lex $P341, "$_"
    store_lex "$element", $P341
# .annotate "line", 261

			.local pmc segment
			segment = new [ 'Key' ]
			
			.local pmc element
			element = find_lex '$element'
			
			$I0 = isa element, 'Integer'
			unless $I0 goto not_Integer
			$I0 = element
			segment = $I0
			goto have_key
			
		not_Integer:
			
			$I0 = isa element, 'Float'
			unless $I0 goto not_Float
			$N0 = element
			segment = $N0
			goto have_key
			
		not_Float:
			
			$I0 = isa element, 'String'
			unless $I0 goto not_String
			$S0 = element
			segment = $S0
			goto have_key
			
		not_String:
			die "Invalid PMC type passed to Parrot::key"
			
		have_key:
			.local pmc key
			key = find_lex '$key'
			
			$I0 = isa key, 'Key'
			unless $I0 goto set_key
			push key, segment
			goto done
		
		set_key:
			key = segment
			store_lex '$key', key
			
		done:
		
# .annotate "line", 259
    .return ()
.end


.namespace ["Parrot"]
.sub "namespace_name"  :subid("33_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_350
# .annotate "line", 313
    new $P349, 'ExceptionHandler'
    set_addr $P349, control_348
    $P349."handle_types"(58)
    push_eh $P349
    .lex "$nsp", param_350
# .annotate "line", 314
    find_lex $P353, "$nsp"
    isa $I354, $P353, "String"
    if $I354, if_352
# .annotate "line", 316
    find_lex $P356, "$nsp"
    $P357 = $P356."string_name"()
    set $P351, $P357
# .annotate "line", 314
    goto if_352_end
  if_352:
    find_lex $P355, "$nsp"
    set $P351, $P355
  if_352_end:
# .annotate "line", 313
    .return ($P351)
  control_348:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P358, exception, "payload"
    .return ($P358)
.end


.namespace ["Parrot"]
.sub "new"  :subid("34_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_362
    .param pmc param_363 :optional
    .param int has_param_363 :opt_flag
# .annotate "line", 319
    new $P361, 'ExceptionHandler'
    set_addr $P361, control_360
    $P361."handle_types"(58)
    push_eh $P361
    .lex "$pmc", param_362
    if has_param_363, optparam_53
    new $P364, "Hash"
    set param_363, $P364
  optparam_53:
    .lex "%args", param_363
# .annotate "line", 320
    new $P365, "Undef"
    .lex "$key", $P365
    get_hll_global $P366, "Key"
    find_lex $P367, "$pmc"
    $P368 = $P367."split"("::")
    $P369 = $P366."new"($P368 :flat)
    store_lex "$key", $P369
# .annotate "line", 322
    find_lex $P372, "%args"
    $N373 = $P372."elems"()
    iseq $I374, $N373, 0.0
    if $I374, if_371
# .annotate "line", 324
    find_lex $P377, "$key"
    find_lex $P378, "%args"
    new $P379, $P377, $P378
    set $P370, $P379
# .annotate "line", 322
    goto if_371_end
  if_371:
# .annotate "line", 323
    find_lex $P375, "$key"
    new $P376, $P375
    set $P370, $P376
  if_371_end:
# .annotate "line", 319
    .return ($P370)
  control_360:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P380, exception, "payload"
    .return ($P380)
.end


.namespace ["Parrot"]
.sub "qualified_name"  :subid("35_1268405311.81635") :outer("11_1268405311.81635")
    .param pmc param_384
    .param pmc param_385 :optional :named("namespace")
    .param int has_param_385 :opt_flag
# .annotate "line", 327
    .const 'Sub' $P459 = "38_1268405311.81635" 
    capture_lex $P459
    .const 'Sub' $P448 = "37_1268405311.81635" 
    capture_lex $P448
    .const 'Sub' $P427 = "36_1268405311.81635" 
    capture_lex $P427
    new $P383, 'ExceptionHandler'
    set_addr $P383, control_382
    $P383."handle_types"(58)
    push_eh $P383
    .lex "$x", param_384
    if has_param_385, optparam_54
    $P386 = "caller_namespace"(2)
    set param_385, $P386
  optparam_54:
    .lex "$namespace", param_385
# .annotate "line", 328
    find_lex $P388, "$x"
    new $P389, "String"
    assign $P389, "P6protoobject"
    set $S390, $P389
    isa $I391, $P388, $S390
    if $I391, if_387
# .annotate "line", 331
    find_lex $P397, "$x"
    new $P398, "String"
    assign $P398, "Class"
    set $S399, $P398
    isa $I400, $P397, $S399
    unless $I400, unless_396
    new $P395, 'Integer'
    set $P395, $I400
    goto unless_396_end
  unless_396:
    find_lex $P401, "$x"
    new $P402, "String"
    assign $P402, "PMCProxy"
    set $S403, $P402
    isa $I404, $P401, $S403
    new $P395, 'Integer'
    set $P395, $I404
  unless_396_end:
    unless $P395, if_394_end
# .annotate "line", 332
    find_lex $P405, "$x"
    $P406 = $P405."get_namespace"()
    store_lex "$x", $P406
  if_394_end:
# .annotate "line", 331
    goto if_387_end
  if_387:
# .annotate "line", 329
    find_lex $P392, "$x"
    $P393 = $P392."WHO"()
    store_lex "$x", $P393
  if_387_end:
# .annotate "line", 337
    find_lex $P408, "$x"
    new $P409, "String"
    assign $P409, "NameSpace"
    set $S410, $P409
    isa $I411, $P408, $S410
    if $I411, if_407
# .annotate "line", 340
    find_lex $P416, "$x"
    new $P417, "String"
    assign $P417, "String"
    set $S418, $P417
    isa $I419, $P416, $S418
    if $I419, if_415
# .annotate "line", 355
    find_lex $P443, "$x"
    new $P444, "String"
    assign $P444, "Sub"
    set $S445, $P444
    isa $I446, $P443, $S445
    if $I446, if_442
# .annotate "line", 360
    .const 'Sub' $P459 = "38_1268405311.81635" 
    capture_lex $P459
    $P459()
    goto if_442_end
  if_442:
# .annotate "line", 355
    .const 'Sub' $P448 = "37_1268405311.81635" 
    capture_lex $P448
    $P448()
  if_442_end:
    goto if_415_end
  if_415:
# .annotate "line", 341
    find_lex $P421, "$x"
    set $S422, $P421
    split $P423, "::", $S422
    set $N424, $P423
    isgt $I425, $N424, 1.0
    if $I425, if_420
# .annotate "line", 344
    .const 'Sub' $P427 = "36_1268405311.81635" 
    capture_lex $P427
    $P427()
    goto if_420_end
  if_420:
  if_420_end:
  if_415_end:
# .annotate "line", 340
    goto if_407_end
  if_407:
# .annotate "line", 338
    find_lex $P412, "$x"
    $P413 = $P412."get_name"()
    $P414 = $P413."join"("::")
    store_lex "$x", $P414
  if_407_end:
# .annotate "line", 337
    find_lex $P471, "$x"
# .annotate "line", 327
    .return ($P471)
  control_382:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P472, exception, "payload"
    .return ($P472)
.end


.namespace ["Parrot"]
.sub "_block458"  :anon :subid("38_1268405311.81635") :outer("35_1268405311.81635")
# .annotate "line", 361
    new $P460, "Undef"
    .lex "$type", $P460
    find_lex $P461, "$x"
    typeof $S462, $P461
    new $P463, 'String'
    set $P463, $S462
    store_lex "$type", $P463
# .annotate "line", 362
    new $P464, 'String'
    set $P464, "Don't know how to make qualified name from "
    find_lex $P465, "$type"
    concat $P466, $P464, $P465
    concat $P467, $P466, ": "
    find_lex $P468, "$x"
    concat $P469, $P467, $P468
    $P470 = "die"($P469)
# .annotate "line", 360
    .return ($P470)
.end


.namespace ["Parrot"]
.sub "_block447"  :anon :subid("37_1268405311.81635") :outer("35_1268405311.81635")
# .annotate "line", 356
    new $P449, "ResizablePMCArray"
    .lex "@temp", $P449
    find_lex $P450, "$x"
    $P451 = $P450."get_namespace"()
    $P452 = $P451."get_name"()
    store_lex "@temp", $P452
# .annotate "line", 357
    find_lex $P453, "@temp"
    find_lex $P454, "$x"
    set $S455, $P454
    $P453."push"($S455)
# .annotate "line", 358
    find_lex $P456, "@temp"
    $P457 = $P456."join"("::")
    store_lex "$x", $P457
# .annotate "line", 355
    .return ($P457)
.end


.namespace ["Parrot"]
.sub "_block426"  :anon :subid("36_1268405311.81635") :outer("35_1268405311.81635")
# .annotate "line", 345
    new $P428, "ResizablePMCArray"
    .lex "@temp", $P428
    find_lex $P429, "$x"
    set $S430, $P429
    split $P431, ";", $S430
    store_lex "@temp", $P431
# .annotate "line", 347
    find_lex $P433, "@temp"
    set $N434, $P433
    iseq $I435, $N434, 1.0
    unless $I435, if_432_end
# .annotate "line", 348
    find_lex $P436, "$namespace"
    $P437 = $P436."get_name"()
    store_lex "@temp", $P437
# .annotate "line", 349
    find_lex $P438, "@temp"
    find_lex $P439, "$x"
    $P438."push"($P439)
  if_432_end:
# .annotate "line", 352
    find_lex $P440, "@temp"
    $P441 = $P440."join"("::")
    store_lex "$x", $P441
# .annotate "line", 344
    .return ($P441)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268405358.74706")
# .annotate "line", 0
    get_hll_global $P14, ["Pir"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Pir"], "_block13" 
    capture_lex $P14
    $P174 = $P14()
# .annotate "line", 1
    .return ($P174)
.end


.namespace ["Pir"]
.sub "_block13"  :subid("11_1268405358.74706") :outer("10_1268405358.74706")
# .annotate "line", 7
    .const 'Sub' $P141 = "16_1268405358.74706" 
    capture_lex $P141
    .const 'Sub' $P35 = "14_1268405358.74706" 
    capture_lex $P35
    .const 'Sub' $P23 = "13_1268405358.74706" 
    capture_lex $P23
    .const 'Sub' $P15 = "12_1268405358.74706" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268405358.74706" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 12
    .const 'Sub' $P23 = "13_1268405358.74706" 
    capture_lex $P23
    .lex "compile", $P23
# .annotate "line", 17
    .const 'Sub' $P35 = "14_1268405358.74706" 
    capture_lex $P35
    .lex "compile_sub", $P35
# .annotate "line", 59
    .const 'Sub' $P141 = "16_1268405358.74706" 
    capture_lex $P141
    .lex "pir_namespace", $P141
# .annotate "line", 7
    find_lex $P170, "_pre_initload"
    find_lex $P171, "compile"
    find_lex $P172, "compile_sub"
    find_lex $P173, "pir_namespace"
    .return ($P173)
.end


.namespace ["Pir"]
.sub "_pre_initload"  :subid("12_1268405358.74706") :outer("11_1268405358.74706")
# .annotate "line", 7
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 8
    get_hll_global $P18, "Opcode"
    new $P19, "ResizablePMCArray"
    push $P19, "DEFAULT"
    push $P19, "TYPE"
    "use"($P18, $P19 :named("tags"))
# .annotate "line", 9
    get_hll_global $P20, "Parrot"
    $P21 = "use"($P20, "NAMESPACE" :named("tags"))
# .annotate "line", 7
    .return ($P21)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P22, exception, "payload"
    .return ($P22)
.end


.namespace ["Pir"]
.sub "compile"  :subid("13_1268405358.74706") :outer("11_1268405358.74706")
    .param pmc param_26
# .annotate "line", 12
    new $P25, 'ExceptionHandler'
    set_addr $P25, control_24
    $P25."handle_types"(58)
    push_eh $P25
    .lex "$string", param_26
# .annotate "line", 13
    new $P27, "Undef"
    .lex "$compiler", $P27
    new $P28, "String"
    assign $P28, "PIR"
    set $S29, $P28
    compreg $P30, $S29
    store_lex "$compiler", $P30
# .annotate "line", 14
    find_lex $P31, "$compiler"
    find_lex $P32, "$string"
    $P33 = $P31($P32)
# .annotate "line", 12
    .return ($P33)
  control_24:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P34, exception, "payload"
    .return ($P34)
.end


.namespace ["Pir"]
.sub "compile_sub"  :subid("14_1268405358.74706") :outer("11_1268405358.74706")
    .param pmc param_38 :optional :named("body")
    .param int has_param_38 :opt_flag
    .param pmc param_40 :optional :named("name")
    .param int has_param_40 :opt_flag
    .param pmc param_42 :optional :named("namespace")
    .param int has_param_42 :opt_flag
    .param pmc param_44 :optional :named("method")
    .param int has_param_44 :opt_flag
    .param pmc param_46 :optional :named("params")
    .param int has_param_46 :opt_flag
    .param pmc param_48 :optional :named("vtable")
    .param int has_param_48 :opt_flag
# .annotate "line", 17
    .const 'Sub' $P120 = "15_1268405358.74706" 
    capture_lex $P120
    new $P37, 'ExceptionHandler'
    set_addr $P37, control_36
    $P37."handle_types"(58)
    push_eh $P37
    if has_param_38, optparam_17
    new $P39, "ResizablePMCArray"
    set param_38, $P39
  optparam_17:
    .lex "@body", param_38
    if has_param_40, optparam_18
    new $P41, "Undef"
    set param_40, $P41
  optparam_18:
    .lex "$name", param_40
    if has_param_42, optparam_19
    new $P43, "Undef"
    set param_42, $P43
  optparam_19:
    .lex "$namespace", param_42
    if has_param_44, optparam_20
    new $P45, "Undef"
    set param_44, $P45
  optparam_20:
    .lex "$method", param_44
    if has_param_46, optparam_21
    new $P47, "ResizablePMCArray"
    set param_46, $P47
  optparam_21:
    .lex "@params", param_46
    if has_param_48, optparam_22
    new $P49, "Undef"
    set param_48, $P49
  optparam_22:
    .lex "$vtable", param_48
# .annotate "line", 22
    new $P50, "ResizablePMCArray"
    .lex "@sub_decl", $P50
# .annotate "line", 55
    new $P51, "Undef"
    .lex "$sub", $P51
# .annotate "line", 18
    find_lex $P53, "@params"
    $P54 = $P53."defined"()
    isfalse $I55, $P54
    if $I55, if_52
# .annotate "line", 19
    find_lex $P59, "@params"
    $P60 = "does"($P59, "array")
    isfalse $I61, $P60
    unless $I61, if_58_end
    get_hll_global $P62, ["Array"], "new"
    find_lex $P63, "@params"
    $P64 = $P62($P63)
    store_lex "@params", $P64
  if_58_end:
    goto if_52_end
  if_52:
# .annotate "line", 18
    get_hll_global $P56, ["Array"], "new"
    $P57 = $P56()
    store_lex "@params", $P57
  if_52_end:
# .annotate "line", 20
    find_lex $P66, "@body"
    $P67 = "does"($P66, "array")
    if $P67, unless_65_end
    get_hll_global $P68, ["Array"], "new"
    find_lex $P69, "@body"
    $P70 = $P68($P69)
    store_lex "@body", $P70
  unless_65_end:
# .annotate "line", 22
    get_hll_global $P71, ["Array"], "new"
    new $P72, "String"
    assign $P72, ".sub '"
    find_lex $P73, "$name"
    concat $P74, $P72, $P73
    concat $P75, $P74, "'"
    $P76 = $P71($P75)
    store_lex "@sub_decl", $P76
# .annotate "line", 24
    find_lex $P78, "$method"
    unless $P78, if_77_end
# .annotate "line", 25
    find_lex $P79, "@sub_decl"
    $P79."push"(":method")
  if_77_end:
# .annotate "line", 28
    find_lex $P81, "$vtable"
    unless $P81, if_80_end
# .annotate "line", 29
    find_lex $P83, "$vtable"
    $P84 = $P83."isa"("String")
    if $P84, if_82
# .annotate "line", 37
    find_lex $P105, "@sub_decl"
    $P105."push"(":vtable")
# .annotate "line", 36
    goto if_82_end
  if_82:
# .annotate "line", 30
    find_lex $P88, "$vtable"
    unless_null $P88, vivify_23
    new $P88, "ResizablePMCArray"
  vivify_23:
    set $P89, $P88[0]
    unless_null $P89, vivify_24
    new $P89, "Undef"
  vivify_24:
    set $S90, $P89
    isne $I91, $S90, "'"
    if $I91, if_87
    new $P86, 'Integer'
    set $P86, $I91
    goto if_87_end
  if_87:
    find_lex $P92, "$vtable"
    unless_null $P92, vivify_25
    new $P92, "ResizablePMCArray"
  vivify_25:
    set $P93, $P92[0]
    unless_null $P93, vivify_26
    new $P93, "Undef"
  vivify_26:
    set $S94, $P93
    isne $I95, $S94, "\""
    new $P86, 'Integer'
    set $P86, $I95
  if_87_end:
    unless $P86, if_85_end
# .annotate "line", 31
    new $P96, "String"
    assign $P96, "'"
    find_lex $P97, "$vtable"
    concat $P98, $P96, $P97
    concat $P99, $P98, "'"
    store_lex "$vtable", $P99
  if_85_end:
# .annotate "line", 34
    find_lex $P100, "@sub_decl"
    new $P101, "String"
    assign $P101, ":vtable("
    find_lex $P102, "$vtable"
    concat $P103, $P101, $P102
    concat $P104, $P103, ")"
    $P100."push"($P104)
  if_82_end:
  if_80_end:
# .annotate "line", 41
    get_hll_global $P106, ["Array"], "new"
    find_lex $P107, "@sub_decl"
    $P108 = $P107."join"(" ")
    $P109 = $P106($P108)
    store_lex "@sub_decl", $P109
# .annotate "line", 42
    find_lex $P110, "@sub_decl"
    new $P111, "String"
    assign $P111, ".namespace "
    find_lex $P112, "$namespace"
    $S113 = "pir_namespace"($P112)
    concat $P114, $P111, $S113
    $P110."unshift"($P114)
# .annotate "line", 44
    find_lex $P116, "@params"
    defined $I117, $P116
    unless $I117, for_undef_27
    iter $P115, $P116
    new $P128, 'ExceptionHandler'
    set_addr $P128, loop127_handler
    $P128."handle_types"(65, 67, 66)
    push_eh $P128
  loop127_test:
    unless $P115, loop127_done
    shift $P118, $P115
  loop127_redo:
    .const 'Sub' $P120 = "15_1268405358.74706" 
    capture_lex $P120
    $P120($P118)
  loop127_next:
    goto loop127_test
  loop127_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P129, exception, 'type'
    eq $P129, 65, loop127_next
    eq $P129, 67, loop127_redo
  loop127_done:
    pop_eh 
  for_undef_27:
# .annotate "line", 48
    find_lex $P131, "@params"
    unless $P131, if_130_end
# .annotate "line", 49
    find_lex $P132, "@sub_decl"
    $P132."push"("")
  if_130_end:
# .annotate "line", 52
    find_lex $P133, "@sub_decl"
    find_lex $P134, "@body"
    $P133."append"($P134)
# .annotate "line", 53
    find_lex $P135, "@sub_decl"
    $P135."push"(".end\n")
# .annotate "line", 55
    find_lex $P136, "@sub_decl"
    $P137 = $P136."join"("\n")
    store_lex "$sub", $P137
# .annotate "line", 56
    find_lex $P138, "$sub"
    $P139 = "compile"($P138)
# .annotate "line", 17
    .return ($P139)
  control_36:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P140, exception, "payload"
    .return ($P140)
.end


.namespace ["Pir"]
.sub "_block119"  :anon :subid("15_1268405358.74706") :outer("14_1268405358.74706")
    .param pmc param_121
# .annotate "line", 44
    .lex "$_", param_121
# .annotate "line", 45
    find_lex $P122, "@sub_decl"
    new $P123, "String"
    assign $P123, "\t"
    find_lex $P124, "$_"
    concat $P125, $P123, $P124
    $P126 = $P122."push"($P125)
# .annotate "line", 44
    .return ($P126)
.end


.namespace ["Pir"]
.sub "pir_namespace"  :subid("16_1268405358.74706") :outer("11_1268405358.74706")
    .param pmc param_144
# .annotate "line", 59
    new $P143, 'ExceptionHandler'
    set_addr $P143, control_142
    $P143."handle_types"(58)
    push_eh $P143
    .lex "$nsp", param_144
# .annotate "line", 64
    new $P145, "ResizablePMCArray"
    .lex "@parts", $P145
# .annotate "line", 66
    new $P146, "Undef"
    .lex "$result", $P146
# .annotate "line", 60
    get_hll_global $P148, ["Opcode"], "isa"
    find_lex $P149, "$nsp"
    $P150 = $P148($P149, "String")
    if $P150, unless_147_end
# .annotate "line", 61
    get_hll_global $P151, ["Parrot"], "namespace_name"
    find_lex $P152, "$nsp"
    $P153 = $P151($P152)
    store_lex "$nsp", $P153
  unless_147_end:
# .annotate "line", 64
    find_lex $P154, "$nsp"
    $P155 = $P154."split"("::")
    store_lex "@parts", $P155
# .annotate "line", 66
    new $P156, "String"
    assign $P156, "["
    store_lex "$result", $P156
# .annotate "line", 68
    find_lex $P158, "@parts"
    unless $P158, if_157_end
# .annotate "line", 70
    find_lex $P159, "$result"
    concat $P160, $P159, " '"
# .annotate "line", 71
    find_lex $P161, "@parts"
    $S162 = $P161."join"("' ; '")
    concat $P163, $P160, $S162
    concat $P164, $P163, "'"
# .annotate "line", 72
    store_lex "$result", $P164
  if_157_end:
# .annotate "line", 75
    find_lex $P165, "$result"
    concat $P166, $P165, " ]"
    store_lex "$result", $P166
# .annotate "line", 76
    new $P167, "Exception"
    set $P167['type'], 58
    find_lex $P168, "$result"
    setattribute $P167, 'payload', $P168
    throw $P167
# .annotate "line", 59
    .return ()
  control_142:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P169, exception, "payload"
    .return ($P169)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268405338.77676")
# .annotate "line", 0
    get_hll_global $P14, ["Array"], "_block13" 
    capture_lex $P14
# .annotate "line", 9
    get_hll_global $P14, ["Array"], "_block13" 
    capture_lex $P14
    $P968 = $P14()
# .annotate "line", 1
    .return ($P968)
.end


.namespace ["Array"]
.sub "_block13"  :subid("11_1268405338.77676") :outer("10_1268405338.77676")
# .annotate "line", 9
    .const 'Sub' $P901 = "56_1268405338.77676" 
    capture_lex $P901
    .const 'Sub' $P885 = "55_1268405338.77676" 
    capture_lex $P885
    .const 'Sub' $P824 = "54_1268405338.77676" 
    capture_lex $P824
    .const 'Sub' $P815 = "53_1268405338.77676" 
    capture_lex $P815
    .const 'Sub' $P757 = "52_1268405338.77676" 
    capture_lex $P757
    .const 'Sub' $P724 = "50_1268405338.77676" 
    capture_lex $P724
    .const 'Sub' $P699 = "48_1268405338.77676" 
    capture_lex $P699
    .const 'Sub' $P688 = "47_1268405338.77676" 
    capture_lex $P688
    .const 'Sub' $P663 = "45_1268405338.77676" 
    capture_lex $P663
    .const 'Sub' $P634 = "44_1268405338.77676" 
    capture_lex $P634
    .const 'Sub' $P597 = "43_1268405338.77676" 
    capture_lex $P597
    .const 'Sub' $P571 = "41_1268405338.77676" 
    capture_lex $P571
    .const 'Sub' $P564 = "40_1268405338.77676" 
    capture_lex $P564
    .const 'Sub' $P559 = "39_1268405338.77676" 
    capture_lex $P559
    .const 'Sub' $P507 = "38_1268405338.77676" 
    capture_lex $P507
    .const 'Sub' $P498 = "37_1268405338.77676" 
    capture_lex $P498
    .const 'Sub' $P476 = "35_1268405338.77676" 
    capture_lex $P476
    .const 'Sub' $P357 = "34_1268405338.77676" 
    capture_lex $P357
    .const 'Sub' $P339 = "32_1268405338.77676" 
    capture_lex $P339
    .const 'Sub' $P275 = "29_1268405338.77676" 
    capture_lex $P275
    .const 'Sub' $P234 = "27_1268405338.77676" 
    capture_lex $P234
    .const 'Sub' $P225 = "26_1268405338.77676" 
    capture_lex $P225
    .const 'Sub' $P219 = "25_1268405338.77676" 
    capture_lex $P219
    .const 'Sub' $P210 = "24_1268405338.77676" 
    capture_lex $P210
    .const 'Sub' $P201 = "23_1268405338.77676" 
    capture_lex $P201
    .const 'Sub' $P180 = "21_1268405338.77676" 
    capture_lex $P180
    .const 'Sub' $P163 = "20_1268405338.77676" 
    capture_lex $P163
    .const 'Sub' $P146 = "19_1268405338.77676" 
    capture_lex $P146
    .const 'Sub' $P136 = "18_1268405338.77676" 
    capture_lex $P136
    .const 'Sub' $P126 = "17_1268405338.77676" 
    capture_lex $P126
    .const 'Sub' $P15 = "12_1268405338.77676" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268405338.77676" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 185
    .const 'Sub' $P126 = "17_1268405338.77676" 
    capture_lex $P126
    .lex "cmp_numeric", $P126
# .annotate "line", 186
    .const 'Sub' $P136 = "18_1268405338.77676" 
    capture_lex $P136
    .lex "cmp_numeric_R", $P136
# .annotate "line", 187
    .const 'Sub' $P146 = "19_1268405338.77676" 
    capture_lex $P146
    .lex "cmp_string", $P146
# .annotate "line", 188
    .const 'Sub' $P163 = "20_1268405338.77676" 
    capture_lex $P163
    .lex "cmp_string_R", $P163
# .annotate "line", 193
    .const 'Sub' $P180 = "21_1268405338.77676" 
    capture_lex $P180
    .lex "cat", $P180
# .annotate "line", 245
    .const 'Sub' $P201 = "23_1268405338.77676" 
    capture_lex $P201
    .lex "grep_args", $P201
# .annotate "line", 307
    .const 'Sub' $P210 = "24_1268405338.77676" 
    capture_lex $P210
    .lex "map_args", $P210
# .annotate "line", 321
    .const 'Sub' $P219 = "25_1268405338.77676" 
    capture_lex $P219
    .lex "new", $P219
# .annotate "line", 325
    .const 'Sub' $P225 = "26_1268405338.77676" 
    capture_lex $P225
    .lex "reduce_args", $P225
# .annotate "line", 371
    .const 'Sub' $P234 = "27_1268405338.77676" 
    capture_lex $P234
    .lex "roundrobin", $P234
# .annotate "line", 447
    .const 'Sub' $P275 = "29_1268405338.77676" 
    capture_lex $P275
    .lex "zip", $P275
# .annotate "line", 9
    find_lex $P338, "_pre_initload"
# .annotate "line", 129
    find_lex $P471, "cmp_numeric"
    find_lex $P472, "cmp_numeric_R"
    find_lex $P473, "cmp_string"
    find_lex $P474, "cmp_string_R"
    find_lex $P475, "cat"
# .annotate "line", 241
    find_lex $P570, "grep_args"
# .annotate "line", 303
    find_lex $P698, "map_args"
# .annotate "line", 311
    find_lex $P722, "new"
    find_lex $P723, "reduce_args"
# .annotate "line", 348
    find_lex $P814, "roundrobin"
# .annotate "line", 422
    find_lex $P967, "zip"
# .annotate "line", 9
    .return ($P967)
.end


.namespace ["Array"]
.sub "_pre_initload"  :subid("12_1268405338.77676") :outer("11_1268405338.77676")
# .annotate "line", 9
    .const 'Sub' $P111 = "16_1268405338.77676" 
    capture_lex $P111
    .const 'Sub' $P96 = "15_1268405338.77676" 
    capture_lex $P96
    .const 'Sub' $P46 = "13_1268405338.77676" 
    capture_lex $P46
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 11
    get_global $P18, "%Bsearch_compare_func"
    unless_null $P18, vivify_58
    new $P18, "Hash"
    set_global "%Bsearch_compare_func", $P18
  vivify_58:
# .annotate "line", 18
    new $P19, "ResizablePMCArray"
    .lex "@methods", $P19
# .annotate "line", 37
    new $P20, "Hash"
    .lex "%pmcs", $P20
# .annotate "line", 44
    new $P21, "Undef"
    .lex "$from_nsp", $P21
# .annotate "line", 9
    get_global $P22, "%Bsearch_compare_func"
# .annotate "line", 13
    get_hll_global $P23, ["Array"], "cmp_numeric"
    get_global $P24, "%Bsearch_compare_func"
    unless_null $P24, vivify_59
    new $P24, "Hash"
    set_global "%Bsearch_compare_func", $P24
  vivify_59:
    set $P24["<=>"], $P23
# .annotate "line", 14
    get_hll_global $P25, ["Array"], "cmp_numeric_R"
    get_global $P26, "%Bsearch_compare_func"
    unless_null $P26, vivify_60
    new $P26, "Hash"
    set_global "%Bsearch_compare_func", $P26
  vivify_60:
    set $P26["R<=>"], $P25
# .annotate "line", 15
    get_hll_global $P27, ["Array"], "cmp_string"
    get_global $P28, "%Bsearch_compare_func"
    unless_null $P28, vivify_61
    new $P28, "Hash"
    set_global "%Bsearch_compare_func", $P28
  vivify_61:
    set $P28["cmp"], $P27
# .annotate "line", 16
    get_hll_global $P29, ["Array"], "cmp_string_R"
    get_global $P30, "%Bsearch_compare_func"
    unless_null $P30, vivify_62
    new $P30, "Hash"
    set_global "%Bsearch_compare_func", $P30
  vivify_62:
    set $P30["Rcmp"], $P29
# .annotate "line", 18
    new $P31, "ResizablePMCArray"
    push $P31, "bsearch"
    push $P31, "contains"
    push $P31, "delete"
    push $P31, "distinct"
    push $P31, "elems"
    push $P31, "grep"
    push $P31, "is_sorted"
    push $P31, "keys"
    push $P31, "kv"
    push $P31, "join"
    push $P31, "map"
    push $P31, "reduce"
    push $P31, "reverse"
    push $P31, "slice"
    push $P31, "splice"
    push $P31, "unsort"
    store_lex "@methods", $P31
    find_lex $P32, "%pmcs"
# .annotate "line", 39
    find_lex $P33, "@methods"
    find_lex $P34, "%pmcs"
    unless_null $P34, vivify_63
    new $P34, "Hash"
    store_lex "%pmcs", $P34
  vivify_63:
    set $P34["ResizablePMCArray"], $P33
# .annotate "line", 41
    find_lex $P35, "@methods"
    clone $P36, $P35
    find_lex $P37, "%pmcs"
    unless_null $P37, vivify_64
    new $P37, "Hash"
    store_lex "%pmcs", $P37
  vivify_64:
    set $P37["ResizableStringArray"], $P36
# .annotate "line", 42
    find_lex $P38, "%pmcs"
    unless_null $P38, vivify_65
    new $P38, "Hash"
  vivify_65:
    set $P39, $P38["ResizableStringArray"]
    unless_null $P39, vivify_66
    new $P39, "Undef"
  vivify_66:
    $P39."push"("append")
# .annotate "line", 44
    get_namespace $P40
    store_lex "$from_nsp", $P40
# .annotate "line", 46
    find_lex $P42, "%pmcs"
    defined $I43, $P42
    unless $I43, for_undef_67
    iter $P41, $P42
    new $P89, 'ExceptionHandler'
    set_addr $P89, loop88_handler
    $P89."handle_types"(65, 67, 66)
    push_eh $P89
  loop88_test:
    unless $P41, loop88_done
    shift $P44, $P41
  loop88_redo:
    .const 'Sub' $P46 = "13_1268405338.77676" 
    capture_lex $P46
    $P46($P44)
  loop88_next:
    goto loop88_test
  loop88_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P90, exception, 'type'
    eq $P90, 65, loop88_next
    eq $P90, 67, loop88_redo
  loop88_done:
    pop_eh 
  for_undef_67:
# .annotate "line", 67
    new $P92, "ResizablePMCArray"
    push $P92, "cat"
    push $P92, "roundrobin"
    push $P92, "zip"
    defined $I93, $P92
    unless $I93, for_undef_74
    iter $P91, $P92
    new $P104, 'ExceptionHandler'
    set_addr $P104, loop103_handler
    $P104."handle_types"(65, 67, 66)
    push_eh $P104
  loop103_test:
    unless $P91, loop103_done
    shift $P94, $P91
  loop103_redo:
    .const 'Sub' $P96 = "15_1268405338.77676" 
    capture_lex $P96
    $P96($P94)
  loop103_next:
    goto loop103_test
  loop103_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, 'type'
    eq $P105, 65, loop103_next
    eq $P105, 67, loop103_redo
  loop103_done:
    pop_eh 
  for_undef_74:
# .annotate "line", 72
    new $P107, "ResizablePMCArray"
    push $P107, "grep"
    push $P107, "map"
    push $P107, "reduce"
    defined $I108, $P107
    unless $I108, for_undef_77
    iter $P106, $P107
    new $P123, 'ExceptionHandler'
    set_addr $P123, loop122_handler
    $P123."handle_types"(65, 67, 66)
    push_eh $P123
  loop122_test:
    unless $P106, loop122_done
    shift $P109, $P106
  loop122_redo:
    .const 'Sub' $P111 = "16_1268405338.77676" 
    capture_lex $P111
    $P111($P109)
  loop122_next:
    goto loop122_test
  loop122_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P124, exception, 'type'
    eq $P124, 65, loop122_next
    eq $P124, 67, loop122_redo
  loop122_done:
    pop_eh 
  for_undef_77:
# .annotate "line", 9
    .return ($P106)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P125, exception, "payload"
    .return ($P125)
.end


.namespace ["Array"]
.sub "_block45"  :anon :subid("13_1268405338.77676") :outer("12_1268405338.77676")
    .param pmc param_50
# .annotate "line", 46
    .const 'Sub' $P65 = "14_1268405338.77676" 
    capture_lex $P65
# .annotate "line", 47
    new $P47, "Hash"
    .lex "%export_subs", $P47
# .annotate "line", 48
    new $P48, "Undef"
    .lex "$pmc_name", $P48
# .annotate "line", 49
    new $P49, "Undef"
    .lex "$to_nsp", $P49
    .lex "$_", param_50
# .annotate "line", 46
    find_lex $P51, "%export_subs"
# .annotate "line", 48
    find_lex $P52, "$_"
    set $S53, $P52
    new $P54, 'String'
    set $P54, $S53
    store_lex "$pmc_name", $P54
# .annotate "line", 49
    get_hll_global $P55, ["Parrot"], "get_hll_namespace"
    find_lex $P56, "$pmc_name"
    $P57 = $P55($P56)
    store_lex "$to_nsp", $P57
# .annotate "line", 51
    find_lex $P59, "$_"
    find_lex $P60, "%pmcs"
    unless_null $P60, vivify_68
    new $P60, "Hash"
  vivify_68:
    set $P61, $P60[$P59]
    unless_null $P61, vivify_69
    new $P61, "Undef"
  vivify_69:
    defined $I62, $P61
    unless $I62, for_undef_70
    iter $P58, $P61
    new $P82, 'ExceptionHandler'
    set_addr $P82, loop81_handler
    $P82."handle_types"(65, 67, 66)
    push_eh $P82
  loop81_test:
    unless $P58, loop81_done
    shift $P63, $P58
  loop81_redo:
    .const 'Sub' $P65 = "14_1268405338.77676" 
    capture_lex $P65
    $P65($P63)
  loop81_next:
    goto loop81_test
  loop81_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P83, exception, 'type'
    eq $P83, 65, loop81_next
    eq $P83, 67, loop81_redo
  loop81_done:
    pop_eh 
  for_undef_70:
# .annotate "line", 61
    find_lex $P84, "$from_nsp"
    find_lex $P85, "$to_nsp"
    find_lex $P86, "%export_subs"
    $P87 = $P84."export_to"($P85, $P86)
# .annotate "line", 46
    .return ($P87)
.end


.namespace ["Array"]
.sub "_block64"  :anon :subid("14_1268405338.77676") :outer("13_1268405338.77676")
    .param pmc param_66
# .annotate "line", 51
    .lex "$_", param_66
# .annotate "line", 52
    find_lex $P69, "$from_nsp"
    find_lex $P70, "$_"
    $P71 = $P69."contains"($P70)
    if $P71, if_68
# .annotate "line", 56
    new $P77, 'String'
    set $P77, "Request to export unknown Array method '"
    find_lex $P78, "$_"
    concat $P79, $P77, $P78
    concat $P80, $P79, "'"
    die $P80
# .annotate "line", 55
    goto if_68_end
  if_68:
# .annotate "line", 53
    find_lex $P72, "$_"
    find_lex $P73, "$from_nsp"
    unless_null $P73, vivify_71
    new $P73, "Hash"
  vivify_71:
    set $P74, $P73[$P72]
    unless_null $P74, vivify_72
    new $P74, "Undef"
  vivify_72:
    find_lex $P75, "$_"
    find_lex $P76, "%export_subs"
    unless_null $P76, vivify_73
    new $P76, "Hash"
    store_lex "%export_subs", $P76
  vivify_73:
    set $P76[$P75], $P74
# .annotate "line", 52
    set $P67, $P74
  if_68_end:
# .annotate "line", 51
    .return ($P67)
.end


.namespace ["Array"]
.sub "_block95"  :anon :subid("15_1268405338.77676") :outer("12_1268405338.77676")
    .param pmc param_97
# .annotate "line", 67
    .lex "$_", param_97
# .annotate "line", 68
    get_hll_global $P98, ["Global"], "inject_root_symbol"
    find_lex $P99, "$_"
    find_lex $P100, "$from_nsp"
    unless_null $P100, vivify_75
    new $P100, "Hash"
  vivify_75:
    set $P101, $P100[$P99]
    unless_null $P101, vivify_76
    new $P101, "Undef"
  vivify_76:
    $P102 = $P98($P101)
# .annotate "line", 67
    .return ($P102)
.end


.namespace ["Array"]
.sub "_block110"  :anon :subid("16_1268405338.77676") :outer("12_1268405338.77676")
    .param pmc param_112
# .annotate "line", 72
    .lex "$_", param_112
# .annotate "line", 73
    get_hll_global $P113, ["Global"], "inject_root_symbol"
# .annotate "line", 74
    get_hll_global $P114, ["Parrot"], "get_hll_global"
    new $P115, "String"
    assign $P115, "Array::"
    find_lex $P116, "$_"
    concat $P117, $P115, $P116
    concat $P118, $P117, "_args"
    $P119 = $P114($P118)
    find_lex $P120, "$_"
    $P121 = $P113($P119, $P120 :named("as"))
# .annotate "line", 72
    .return ($P121)
.end


.namespace ["Array"]
.sub "cmp_numeric"  :subid("17_1268405338.77676") :outer("11_1268405338.77676")
    .param pmc param_129
    .param pmc param_130
# .annotate "line", 185
    new $P128, 'ExceptionHandler'
    set_addr $P128, control_127
    $P128."handle_types"(58)
    push_eh $P128
    .lex "$a", param_129
    .lex "$b", param_130
    new $P131, "Exception"
    set $P131['type'], 58
    find_lex $P132, "$a"
    find_lex $P133, "$b"
    sub $P134, $P132, $P133
    setattribute $P131, 'payload', $P134
    throw $P131
    .return ()
  control_127:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P135, exception, "payload"
    .return ($P135)
.end


.namespace ["Array"]
.sub "cmp_numeric_R"  :subid("18_1268405338.77676") :outer("11_1268405338.77676")
    .param pmc param_139
    .param pmc param_140
# .annotate "line", 186
    new $P138, 'ExceptionHandler'
    set_addr $P138, control_137
    $P138."handle_types"(58)
    push_eh $P138
    .lex "$a", param_139
    .lex "$b", param_140
    new $P141, "Exception"
    set $P141['type'], 58
    find_lex $P142, "$b"
    find_lex $P143, "$a"
    sub $P144, $P142, $P143
    setattribute $P141, 'payload', $P144
    throw $P141
    .return ()
  control_137:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P145, exception, "payload"
    .return ($P145)
.end


.namespace ["Array"]
.sub "cmp_string"  :subid("19_1268405338.77676") :outer("11_1268405338.77676")
    .param pmc param_149
    .param pmc param_150
# .annotate "line", 187
    new $P148, 'ExceptionHandler'
    set_addr $P148, control_147
    $P148."handle_types"(58)
    push_eh $P148
    .lex "$a", param_149
    .lex "$b", param_150
    find_lex $P153, "$a"
    set $S154, $P153
    find_lex $P155, "$b"
    set $S156, $P155
    islt $I157, $S154, $S156
    if $I157, if_152
    new $P160, "Exception"
    set $P160['type'], 58
    new $P161, "Integer"
    assign $P161, 1
    setattribute $P160, 'payload', $P161
    throw $P160
    goto if_152_end
  if_152:
    new $P158, "Exception"
    set $P158['type'], 58
    new $P159, "Integer"
    assign $P159, -1
    setattribute $P158, 'payload', $P159
    throw $P158
  if_152_end:
    .return ($P151)
  control_147:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P162, exception, "payload"
    .return ($P162)
.end


.namespace ["Array"]
.sub "cmp_string_R"  :subid("20_1268405338.77676") :outer("11_1268405338.77676")
    .param pmc param_166
    .param pmc param_167
# .annotate "line", 188
    new $P165, 'ExceptionHandler'
    set_addr $P165, control_164
    $P165."handle_types"(58)
    push_eh $P165
    .lex "$a", param_166
    .lex "$b", param_167
    find_lex $P170, "$b"
    set $S171, $P170
    find_lex $P172, "$a"
    set $S173, $P172
    islt $I174, $S171, $S173
    if $I174, if_169
    new $P177, "Exception"
    set $P177['type'], 58
    new $P178, "Integer"
    assign $P178, 1
    setattribute $P177, 'payload', $P178
    throw $P177
    goto if_169_end
  if_169:
    new $P175, "Exception"
    set $P175['type'], 58
    new $P176, "Integer"
    assign $P176, -1
    setattribute $P175, 'payload', $P176
    throw $P175
  if_169_end:
    .return ($P168)
  control_164:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P179, exception, "payload"
    .return ($P179)
.end


.namespace ["Array"]
.sub "cat"  :subid("21_1268405338.77676") :outer("11_1268405338.77676")
    .param pmc param_183 :slurpy
# .annotate "line", 193
    .const 'Sub' $P191 = "22_1268405338.77676" 
    capture_lex $P191
    new $P182, 'ExceptionHandler'
    set_addr $P182, control_181
    $P182."handle_types"(58)
    push_eh $P182
    .lex "@sources", param_183
# .annotate "line", 194
    new $P184, "ResizablePMCArray"
    .lex "@cat", $P184
# .annotate "line", 193
    find_lex $P185, "@cat"
# .annotate "line", 196
    find_lex $P187, "@sources"
    defined $I188, $P187
    unless $I188, for_undef_78
    iter $P186, $P187
    new $P197, 'ExceptionHandler'
    set_addr $P197, loop196_handler
    $P197."handle_types"(65, 67, 66)
    push_eh $P197
  loop196_test:
    unless $P186, loop196_done
    shift $P189, $P186
  loop196_redo:
    .const 'Sub' $P191 = "22_1268405338.77676" 
    capture_lex $P191
    $P191($P189)
  loop196_next:
    goto loop196_test
  loop196_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P198, exception, 'type'
    eq $P198, 65, loop196_next
    eq $P198, 67, loop196_redo
  loop196_done:
    pop_eh 
  for_undef_78:
    find_lex $P199, "@cat"
# .annotate "line", 193
    .return ($P199)
  control_181:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P200, exception, "payload"
    .return ($P200)
.end


.namespace ["Array"]
.sub "_block190"  :anon :subid("22_1268405338.77676") :outer("21_1268405338.77676")
    .param pmc param_192
# .annotate "line", 196
    .lex "$_", param_192
# .annotate "line", 197
    find_lex $P193, "@cat"
    find_lex $P194, "$_"
    $P195 = $P193."append"($P194)
# .annotate "line", 196
    .return ($P195)
.end


.namespace ["Array"]
.sub "grep_args"  :subid("23_1268405338.77676") :outer("11_1268405338.77676")
    .param pmc param_204
    .param pmc param_205 :slurpy
# .annotate "line", 245
    new $P203, 'ExceptionHandler'
    set_addr $P203, control_202
    $P203."handle_types"(58)
    push_eh $P203
    .lex "&match", param_204
    .lex "@values", param_205
# .annotate "line", 246
    find_lex $P206, "@values"
    find_lex $P207, "&match"
    $P208 = $P206."grep"($P207)
# .annotate "line", 245
    .return ($P208)
  control_202:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P209, exception, "payload"
    .return ($P209)
.end


.namespace ["Array"]
.sub "map_args"  :subid("24_1268405338.77676") :outer("11_1268405338.77676")
    .param pmc param_213
    .param pmc param_214 :slurpy
# .annotate "line", 307
    new $P212, 'ExceptionHandler'
    set_addr $P212, control_211
    $P212."handle_types"(58)
    push_eh $P212
    .lex "&func", param_213
    .lex "@args", param_214
# .annotate "line", 308
    find_lex $P215, "@args"
    find_lex $P216, "&func"
    $P217 = $P215."map"($P216)
# .annotate "line", 307
    .return ($P217)
  control_211:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P218, exception, "payload"
    .return ($P218)
.end


.namespace ["Array"]
.sub "new"  :subid("25_1268405338.77676") :outer("11_1268405338.77676")
    .param pmc param_222 :slurpy
# .annotate "line", 321
    new $P221, 'ExceptionHandler'
    set_addr $P221, control_220
    $P221."handle_types"(58)
    push_eh $P221
    .lex "@elements", param_222
    find_lex $P223, "@elements"
    .return ($P223)
  control_220:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P224, exception, "payload"
    .return ($P224)
.end


.namespace ["Array"]
.sub "reduce_args"  :subid("26_1268405338.77676") :outer("11_1268405338.77676")
    .param pmc param_228
    .param pmc param_229 :slurpy
# .annotate "line", 325
    new $P227, 'ExceptionHandler'
    set_addr $P227, control_226
    $P227."handle_types"(58)
    push_eh $P227
    .lex "&expression", param_228
    .lex "@values", param_229
# .annotate "line", 326
    find_lex $P230, "@values"
    find_lex $P231, "&expression"
    $P232 = $P230."reduce"($P231)
# .annotate "line", 325
    .return ($P232)
  control_226:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P233, exception, "payload"
    .return ($P233)
.end


.namespace ["Array"]
.sub "roundrobin"  :subid("27_1268405338.77676") :outer("11_1268405338.77676")
    .param pmc param_237 :slurpy
# .annotate "line", 371
    .const 'Sub' $P251 = "28_1268405338.77676" 
    capture_lex $P251
    new $P236, 'ExceptionHandler'
    set_addr $P236, control_235
    $P236."handle_types"(58)
    push_eh $P236
    .lex "@sources", param_237
# .annotate "line", 372
    new $P238, "ResizablePMCArray"
    .lex "@result", $P238
# .annotate "line", 373
    new $P239, "Undef"
    .lex "$i", $P239
# .annotate "line", 374
    new $P240, "Undef"
    .lex "$done", $P240
# .annotate "line", 371
    find_lex $P241, "@result"
# .annotate "line", 373
    new $P242, "Integer"
    assign $P242, 0
    store_lex "$i", $P242
    find_lex $P243, "$done"
# .annotate "line", 376
    new $P271, 'ExceptionHandler'
    set_addr $P271, loop270_handler
    $P271."handle_types"(65, 67, 66)
    push_eh $P271
  loop270_test:
    find_lex $P244, "$done"
    if $P244, loop270_done
  loop270_redo:
# .annotate "line", 377
    new $P245, "Integer"
    assign $P245, 1
    store_lex "$done", $P245
# .annotate "line", 379
    find_lex $P247, "@sources"
    defined $I248, $P247
    unless $I248, for_undef_79
    iter $P246, $P247
    new $P268, 'ExceptionHandler'
    set_addr $P268, loop267_handler
    $P268."handle_types"(65, 67, 66)
    push_eh $P268
  loop267_test:
    unless $P246, loop267_done
    shift $P249, $P246
  loop267_redo:
    .const 'Sub' $P251 = "28_1268405338.77676" 
    capture_lex $P251
    $P251($P249)
  loop267_next:
    goto loop267_test
  loop267_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P269, exception, 'type'
    eq $P269, 65, loop267_next
    eq $P269, 67, loop267_redo
  loop267_done:
    pop_eh 
  for_undef_79:
  loop270_next:
# .annotate "line", 376
    goto loop270_test
  loop270_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P272, exception, 'type'
    eq $P272, 65, loop270_next
    eq $P272, 67, loop270_redo
  loop270_done:
    pop_eh 
    find_lex $P273, "@result"
# .annotate "line", 371
    .return ($P273)
  control_235:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P274, exception, "payload"
    .return ($P274)
.end


.namespace ["Array"]
.sub "_block250"  :anon :subid("28_1268405338.77676") :outer("27_1268405338.77676")
    .param pmc param_252
# .annotate "line", 379
    .lex "@a", param_252
# .annotate "line", 380
    find_lex $P255, "@a"
    $N256 = $P255."elems"()
    find_lex $P257, "$i"
    set $N258, $P257
    isgt $I259, $N256, $N258
    if $I259, if_254
    new $P253, 'Integer'
    set $P253, $I259
    goto if_254_end
  if_254:
# .annotate "line", 381
    new $P260, "Integer"
    assign $P260, 0
    store_lex "$done", $P260
# .annotate "line", 382
    find_lex $P261, "@result"
    find_lex $P262, "$i"
    set $I263, $P262
    find_lex $P264, "@a"
    unless_null $P264, vivify_80
    new $P264, "ResizablePMCArray"
  vivify_80:
    set $P265, $P264[$I263]
    unless_null $P265, vivify_81
    new $P265, "Undef"
  vivify_81:
    $P266 = $P261."push"($P265)
# .annotate "line", 380
    set $P253, $P266
  if_254_end:
# .annotate "line", 379
    .return ($P253)
.end


.namespace ["Array"]
.sub "zip"  :subid("29_1268405338.77676") :outer("11_1268405338.77676")
    .param pmc param_278 :slurpy
# .annotate "line", 447
    .const 'Sub' $P320 = "31_1268405338.77676" 
    capture_lex $P320
    .const 'Sub' $P295 = "30_1268405338.77676" 
    capture_lex $P295
    new $P277, 'ExceptionHandler'
    set_addr $P277, control_276
    $P277."handle_types"(58)
    push_eh $P277
    .lex "@sources", param_278
# .annotate "line", 448
    new $P279, "ResizablePMCArray"
    .lex "@result", $P279
# .annotate "line", 449
    new $P280, "Undef"
    .lex "$limit", $P280
# .annotate "line", 460
    new $P281, "Undef"
    .lex "$i", $P281
# .annotate "line", 447
    find_lex $P282, "@result"
# .annotate "line", 449
    new $P283, "Integer"
    assign $P283, 0
    store_lex "$limit", $P283
# .annotate "line", 451
    find_lex $P285, "@sources"
    $P286 = $P285."elems"()
    unless $P286, if_284_end
# .annotate "line", 452
    find_lex $P287, "@sources"
    unless_null $P287, vivify_82
    new $P287, "ResizablePMCArray"
  vivify_82:
    set $P288, $P287[0]
    unless_null $P288, vivify_83
    new $P288, "Undef"
  vivify_83:
    $P289 = $P288."elems"()
    store_lex "$limit", $P289
  if_284_end:
# .annotate "line", 455
    find_lex $P291, "@sources"
    defined $I292, $P291
    unless $I292, for_undef_84
    iter $P290, $P291
    new $P307, 'ExceptionHandler'
    set_addr $P307, loop306_handler
    $P307."handle_types"(65, 67, 66)
    push_eh $P307
  loop306_test:
    unless $P290, loop306_done
    shift $P293, $P290
  loop306_redo:
    .const 'Sub' $P295 = "30_1268405338.77676" 
    capture_lex $P295
    $P295($P293)
  loop306_next:
    goto loop306_test
  loop306_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P308, exception, 'type'
    eq $P308, 65, loop306_next
    eq $P308, 67, loop306_redo
  loop306_done:
    pop_eh 
  for_undef_84:
# .annotate "line", 460
    new $P309, "Integer"
    assign $P309, 0
    store_lex "$i", $P309
# .annotate "line", 462
    new $P334, 'ExceptionHandler'
    set_addr $P334, loop333_handler
    $P334."handle_types"(65, 67, 66)
    push_eh $P334
  loop333_test:
    find_lex $P310, "$i"
    set $N311, $P310
    find_lex $P312, "$limit"
    set $N313, $P312
    islt $I314, $N311, $N313
    unless $I314, loop333_done
  loop333_redo:
# .annotate "line", 463
    find_lex $P316, "@sources"
    defined $I317, $P316
    unless $I317, for_undef_85
    iter $P315, $P316
    new $P329, 'ExceptionHandler'
    set_addr $P329, loop328_handler
    $P329."handle_types"(65, 67, 66)
    push_eh $P329
  loop328_test:
    unless $P315, loop328_done
    shift $P318, $P315
  loop328_redo:
    .const 'Sub' $P320 = "31_1268405338.77676" 
    capture_lex $P320
    $P320($P318)
  loop328_next:
    goto loop328_test
  loop328_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P330, exception, 'type'
    eq $P330, 65, loop328_next
    eq $P330, 67, loop328_redo
  loop328_done:
    pop_eh 
  for_undef_85:
    find_lex $P331, "$i"
    clone $P332, $P331
    inc $P331
  loop333_next:
# .annotate "line", 462
    goto loop333_test
  loop333_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P335, exception, 'type'
    eq $P335, 65, loop333_next
    eq $P335, 67, loop333_redo
  loop333_done:
    pop_eh 
    find_lex $P336, "@result"
# .annotate "line", 447
    .return ($P336)
  control_276:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P337, exception, "payload"
    .return ($P337)
.end


.namespace ["Array"]
.sub "_block294"  :anon :subid("30_1268405338.77676") :outer("29_1268405338.77676")
    .param pmc param_296
# .annotate "line", 455
    .lex "@a", param_296
# .annotate "line", 457
    find_lex $P299, "@a"
    $N300 = $P299."elems"()
    find_lex $P301, "$limit"
    set $N302, $P301
    islt $I303, $N300, $N302
    if $I303, if_298
    new $P297, 'Integer'
    set $P297, $I303
    goto if_298_end
  if_298:
# .annotate "line", 456
    find_lex $P304, "@a"
    $P305 = $P304."elems"()
    store_lex "$limit", $P305
    set $P297, $P305
  if_298_end:
# .annotate "line", 455
    .return ($P297)
.end


.namespace ["Array"]
.sub "_block319"  :anon :subid("31_1268405338.77676") :outer("29_1268405338.77676")
    .param pmc param_321
# .annotate "line", 463
    .lex "@a", param_321
# .annotate "line", 464
    find_lex $P322, "@result"
    find_lex $P323, "$i"
    set $I324, $P323
    find_lex $P325, "@a"
    unless_null $P325, vivify_86
    new $P325, "ResizablePMCArray"
  vivify_86:
    set $P326, $P325[$I324]
    unless_null $P326, vivify_87
    new $P326, "Undef"
  vivify_87:
    $P327 = $P322."push"($P326)
# .annotate "line", 463
    .return ($P327)
.end


.namespace ["Array"]
.sub "append"  :subid("32_1268405338.77676") :method :outer("11_1268405338.77676")
    .param pmc param_342
# .annotate "line", 80
    .const 'Sub' $P348 = "33_1268405338.77676" 
    capture_lex $P348
    new $P341, 'ExceptionHandler'
    set_addr $P341, control_340
    $P341."handle_types"(58)
    push_eh $P341
    .lex "self", self
    .lex "@other", param_342
# .annotate "line", 81
    find_lex $P344, "@other"
    defined $I345, $P344
    unless $I345, for_undef_88
    iter $P343, $P344
    new $P354, 'ExceptionHandler'
    set_addr $P354, loop353_handler
    $P354."handle_types"(65, 67, 66)
    push_eh $P354
  loop353_test:
    unless $P343, loop353_done
    shift $P346, $P343
  loop353_redo:
    .const 'Sub' $P348 = "33_1268405338.77676" 
    capture_lex $P348
    $P348($P346)
  loop353_next:
    goto loop353_test
  loop353_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P355, exception, 'type'
    eq $P355, 65, loop353_next
    eq $P355, 67, loop353_redo
  loop353_done:
    pop_eh 
  for_undef_88:
# .annotate "line", 80
    .return ($P343)
  control_340:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P356, exception, "payload"
    .return ($P356)
.end


.namespace ["Array"]
.sub "_block347"  :anon :subid("33_1268405338.77676") :outer("32_1268405338.77676")
    .param pmc param_349
# .annotate "line", 81
    .lex "$_", param_349
# .annotate "line", 82
    find_lex $P350, "self"
    find_lex $P351, "$_"
    $P352 = $P350."push"($P351)
# .annotate "line", 81
    .return ($P352)
.end


.namespace ["Array"]
.sub "bsearch"  :subid("34_1268405338.77676") :method :outer("11_1268405338.77676")
    .param pmc param_360
    .param pmc param_361 :slurpy :named
# .annotate "line", 129
    new $P359, 'ExceptionHandler'
    set_addr $P359, control_358
    $P359."handle_types"(58)
    push_eh $P359
    .lex "self", self
    .lex "$value", param_360
    .lex "%opts", param_361
# .annotate "line", 130
    get_global $P362, "%Bsearch_compare_func"
    unless_null $P362, vivify_89
    new $P362, "Hash"
    set_global "%Bsearch_compare_func", $P362
  vivify_89:
# .annotate "line", 132
    new $P363, "Undef"
    .lex "$cmp", $P363
# .annotate "line", 133
    new $P364, "Undef"
    .lex "$high", $P364
# .annotate "line", 134
    new $P365, "Undef"
    .lex "$low", $P365
# .annotate "line", 135
    new $P366, "Undef"
    .lex "$top", $P366
# .annotate "line", 137
    new $P367, "Undef"
    .lex "$elts", $P367
# .annotate "line", 142
    new $P368, "Undef"
    .lex "&comparator", $P368
# .annotate "line", 150
    new $P369, "Undef"
    .lex "$mid", $P369
# .annotate "line", 175
    new $P370, "Undef"
    .lex "$result", $P370
# .annotate "line", 129
    get_global $P371, "%Bsearch_compare_func"
# .annotate "line", 132
    find_lex $P374, "%opts"
    unless_null $P374, vivify_90
    new $P374, "Hash"
  vivify_90:
    set $P375, $P374["cmp"]
    unless_null $P375, vivify_91
    new $P375, "Undef"
  vivify_91:
    if $P375, if_373
    new $P378, "String"
    assign $P378, "<=>"
    set $P372, $P378
    goto if_373_end
  if_373:
    find_lex $P376, "%opts"
    unless_null $P376, vivify_92
    new $P376, "Hash"
  vivify_92:
    set $P377, $P376["cmp"]
    unless_null $P377, vivify_93
    new $P377, "Undef"
  vivify_93:
    set $P372, $P377
  if_373_end:
    store_lex "$cmp", $P372
# .annotate "line", 133
    find_lex $P381, "%opts"
    unless_null $P381, vivify_94
    new $P381, "Hash"
  vivify_94:
    set $P382, $P381["high"]
    unless_null $P382, vivify_95
    new $P382, "Undef"
  vivify_95:
    set $N383, $P382
    isgt $I384, $N383, 0.0
    if $I384, if_380
    find_lex $P387, "self"
    $P388 = $P387."elems"()
    set $P379, $P388
    goto if_380_end
  if_380:
    find_lex $P385, "%opts"
    unless_null $P385, vivify_96
    new $P385, "Hash"
  vivify_96:
    set $P386, $P385["high"]
    unless_null $P386, vivify_97
    new $P386, "Undef"
  vivify_97:
    set $P379, $P386
  if_380_end:
    store_lex "$high", $P379
# .annotate "line", 134
    new $P389, "Integer"
    assign $P389, 0
    find_lex $P390, "%opts"
    unless_null $P390, vivify_98
    new $P390, "Hash"
  vivify_98:
    set $P391, $P390["low"]
    unless_null $P391, vivify_99
    new $P391, "Undef"
  vivify_99:
    add $P392, $P389, $P391
    store_lex "$low", $P392
# .annotate "line", 135
    find_lex $P393, "$high"
    store_lex "$top", $P393
# .annotate "line", 137
    find_lex $P394, "self"
    $P395 = $P394."elems"()
    store_lex "$elts", $P395
# .annotate "line", 139
    find_lex $P397, "$high"
    set $N398, $P397
    find_lex $P399, "$elts"
    set $N400, $P399
    isgt $I401, $N398, $N400
    unless $I401, if_396_end
    find_lex $P402, "$elts"
    store_lex "$high", $P402
  if_396_end:
# .annotate "line", 140
    find_lex $P404, "$low"
    set $N405, $P404
    islt $I406, $N405, 0.0
    unless $I406, if_403_end
    find_lex $P407, "$low"
    find_lex $P408, "$elts"
    add $P409, $P407, $P408
    store_lex "$low", $P409
  if_403_end:
# .annotate "line", 142
    get_global $P412, "%Bsearch_compare_func"
    find_lex $P413, "$cmp"
    $P414 = $P412."contains"($P413)
    if $P414, if_411
    find_lex $P418, "$cmp"
    set $P410, $P418
    goto if_411_end
  if_411:
    find_lex $P415, "$cmp"
    get_global $P416, "%Bsearch_compare_func"
    unless_null $P416, vivify_100
    new $P416, "Hash"
  vivify_100:
    set $P417, $P416[$P415]
    unless_null $P417, vivify_101
    new $P417, "Undef"
  vivify_101:
    set $P410, $P417
  if_411_end:
# .annotate "line", 143
    store_lex "&comparator", $P410
# .annotate "line", 146
    find_lex $P422, "&comparator"
    $P423 = $P422."isa"("Sub")
    unless $P423, unless_421
    set $P420, $P423
    goto unless_421_end
  unless_421:
    find_lex $P424, "&comparator"
    $P425 = $P424."isa"("MultiSub")
    set $P420, $P425
  unless_421_end:
    if $P420, unless_419_end
# .annotate "line", 147
    get_hll_global $P426, ["Opcode"], "die"
    $P426("Bsearch :cmp function parameter was not a (Multi)Sub")
  unless_419_end:
# .annotate "line", 146
    find_lex $P427, "$mid"
# .annotate "line", 152
    new $P447, 'ExceptionHandler'
    set_addr $P447, loop446_handler
    $P447."handle_types"(65, 67, 66)
    push_eh $P447
  loop446_test:
    find_lex $P428, "$low"
    set $N429, $P428
    find_lex $P430, "$high"
    set $N431, $P430
    islt $I432, $N429, $N431
    unless $I432, loop446_done
  loop446_redo:
# .annotate "line", 155

			.local int high, low
			$P0 = find_lex '$high'
			high = $P0
			$P0 = find_lex '$low'
			low = $P0
			$I0 = high - low
			$I0 = $I0 / 2
			$I0 = $I0 + low
			$P433 = box $I0
		
    store_lex "$mid", $P433
# .annotate "line", 167
    find_lex $P435, "&comparator"
    find_lex $P436, "$mid"
    set $I437, $P436
    find_lex $P438, "self"
    unless_null $P438, vivify_102
    new $P438, "ResizablePMCArray"
  vivify_102:
    set $P439, $P438[$I437]
    unless_null $P439, vivify_103
    new $P439, "Undef"
  vivify_103:
    find_lex $P440, "$value"
    $N441 = $P435($P439, $P440)
    islt $I442, $N441, 0.0
    if $I442, if_434
# .annotate "line", 171
    find_lex $P445, "$mid"
    store_lex "$high", $P445
# .annotate "line", 170
    goto if_434_end
  if_434:
# .annotate "line", 168
    find_lex $P443, "$mid"
    add $P444, $P443, 1
    store_lex "$low", $P444
  if_434_end:
  loop446_next:
# .annotate "line", 152
    goto loop446_test
  loop446_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P448, exception, 'type'
    eq $P448, 65, loop446_next
    eq $P448, 67, loop446_redo
  loop446_done:
    pop_eh 
# .annotate "line", 175
    find_lex $P449, "$low"
    add $P450, $P449, 1
    neg $P451, $P450
    store_lex "$result", $P451
# .annotate "line", 177
    find_lex $P455, "$low"
    set $N456, $P455
    find_lex $P457, "$top"
    set $N458, $P457
    islt $I459, $N456, $N458
    if $I459, if_454
    new $P453, 'Integer'
    set $P453, $I459
    goto if_454_end
  if_454:
# .annotate "line", 178
    find_lex $P460, "&comparator"
    find_lex $P461, "$low"
    set $I462, $P461
    find_lex $P463, "self"
    unless_null $P463, vivify_104
    new $P463, "ResizablePMCArray"
  vivify_104:
    set $P464, $P463[$I462]
    unless_null $P464, vivify_105
    new $P464, "Undef"
  vivify_105:
    find_lex $P465, "$value"
    $N466 = $P460($P464, $P465)
    iseq $I467, $N466, 0.0
    new $P453, 'Integer'
    set $P453, $I467
  if_454_end:
    unless $P453, if_452_end
# .annotate "line", 179
    find_lex $P468, "$low"
    store_lex "$result", $P468
  if_452_end:
# .annotate "line", 177
    find_lex $P469, "$result"
# .annotate "line", 129
    .return ($P469)
  control_358:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P470, exception, "payload"
    .return ($P470)
.end


.namespace ["Array"]
.sub "contains"  :subid("35_1268405338.77676") :method :outer("11_1268405338.77676")
    .param pmc param_479
# .annotate "line", 203
    .const 'Sub' $P485 = "36_1268405338.77676" 
    capture_lex $P485
    new $P478, 'ExceptionHandler'
    set_addr $P478, control_477
    $P478."handle_types"(58)
    push_eh $P478
    .lex "self", self
    .lex "$item", param_479
# .annotate "line", 204
    find_lex $P481, "self"
    defined $I482, $P481
    unless $I482, for_undef_106
    iter $P480, $P481
    new $P495, 'ExceptionHandler'
    set_addr $P495, loop494_handler
    $P495."handle_types"(65, 67, 66)
    push_eh $P495
  loop494_test:
    unless $P480, loop494_done
    shift $P483, $P480
  loop494_redo:
    .const 'Sub' $P485 = "36_1268405338.77676" 
    capture_lex $P485
    $P485($P483)
  loop494_next:
    goto loop494_test
  loop494_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P496, exception, 'type'
    eq $P496, 65, loop494_next
    eq $P496, 67, loop494_redo
  loop494_done:
    pop_eh 
  for_undef_106:
# .annotate "line", 203
    .return (0)
  control_477:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P497, exception, "payload"
    .return ($P497)
.end


.namespace ["Array"]
.sub "_block484"  :anon :subid("36_1268405338.77676") :outer("35_1268405338.77676")
    .param pmc param_486
# .annotate "line", 204
    .lex "$_", param_486
# .annotate "line", 205
    find_lex $P489, "$item"
    find_lex $P490, "$_"
    iseq $I491, $P489, $P490
    if $I491, if_488
    new $P487, 'Integer'
    set $P487, $I491
    goto if_488_end
  if_488:
# .annotate "line", 206
    new $P492, "Exception"
    set $P492['type'], 58
    new $P493, "Integer"
    assign $P493, 1
    setattribute $P492, 'payload', $P493
    throw $P492
  if_488_end:
# .annotate "line", 204
    .return ($P487)
.end


.namespace ["Array"]
.sub "delete"  :subid("37_1268405338.77676") :method :outer("11_1268405338.77676")
    .param pmc param_501
# .annotate "line", 213
    new $P500, 'ExceptionHandler'
    set_addr $P500, control_499
    $P500."handle_types"(58)
    push_eh $P500
    .lex "self", self
    .lex "$key", param_501
# .annotate "line", 214
    get_hll_global $P502, ["Opcode"], "delete"
    find_lex $P503, "self"
    find_lex $P504, "$key"
    $P502($P503, $P504)
    find_lex $P505, "self"
# .annotate "line", 213
    .return ($P505)
  control_499:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P506, exception, "payload"
    .return ($P506)
.end


.namespace ["Array"]
.sub "distinct"  :subid("38_1268405338.77676") :method :outer("11_1268405338.77676")
    .param pmc param_510 :optional :named("cmp")
    .param int has_param_510 :opt_flag
# .annotate "line", 218
    new $P509, 'ExceptionHandler'
    set_addr $P509, control_508
    $P509."handle_types"(58)
    push_eh $P509
    .lex "self", self
    if has_param_510, optparam_107
    get_hll_global $P511, ["Array"], "cmp_string"
    set param_510, $P511
  optparam_107:
    .lex "&cmp", param_510
# .annotate "line", 219
    new $P512, "Undef"
    .lex "$elems", $P512
# .annotate "line", 220
    new $P513, "Undef"
    .lex "$i", $P513
# .annotate "line", 221
    new $P514, "Undef"
    .lex "$j", $P514
# .annotate "line", 222
    new $P515, "Undef"
    .lex "$array_i", $P515
# .annotate "line", 219
    find_lex $P516, "self"
    $P517 = $P516."elems"()
    store_lex "$elems", $P517
# .annotate "line", 220
    new $P518, "Integer"
    assign $P518, 0
    store_lex "$i", $P518
    find_lex $P519, "$j"
    find_lex $P520, "$array_i"
# .annotate "line", 224
    new $P555, 'ExceptionHandler'
    set_addr $P555, loop554_handler
    $P555."handle_types"(65, 67, 66)
    push_eh $P555
  loop554_test:
    find_lex $P521, "$i"
    set $N522, $P521
    find_lex $P523, "$elems"
    set $N524, $P523
    islt $I525, $N522, $N524
    unless $I525, loop554_done
  loop554_redo:
# .annotate "line", 225
    find_lex $P526, "$i"
    set $I527, $P526
    find_lex $P528, "self"
    unless_null $P528, vivify_108
    new $P528, "ResizablePMCArray"
  vivify_108:
    set $P529, $P528[$I527]
    unless_null $P529, vivify_109
    new $P529, "Undef"
  vivify_109:
    store_lex "$array_i", $P529
    find_lex $P530, "$i"
    clone $P531, $P530
    inc $P530
# .annotate "line", 228
    new $P552, 'ExceptionHandler'
    set_addr $P552, loop551_handler
    $P552."handle_types"(65, 67, 66)
    push_eh $P552
  loop551_test:
    find_lex $P534, "$i"
    set $N535, $P534
    find_lex $P536, "$elems"
    set $N537, $P536
    islt $I538, $N535, $N537
    if $I538, if_533
    new $P532, 'Integer'
    set $P532, $I538
    goto if_533_end
  if_533:
    find_lex $P539, "&cmp"
    find_lex $P540, "$array_i"
    find_lex $P541, "$i"
    set $I542, $P541
    find_lex $P543, "self"
    unless_null $P543, vivify_110
    new $P543, "ResizablePMCArray"
  vivify_110:
    set $P544, $P543[$I542]
    unless_null $P544, vivify_111
    new $P544, "Undef"
  vivify_111:
    $N545 = $P539($P540, $P544)
    iseq $I546, $N545, 0.0
    new $P532, 'Integer'
    set $P532, $I546
  if_533_end:
    unless $P532, loop551_done
  loop551_redo:
# .annotate "line", 229
    find_lex $P547, "self"
    find_lex $P548, "$i"
    $P547."delete"($P548)
    find_lex $P549, "$elems"
    clone $P550, $P549
    dec $P549
  loop551_next:
# .annotate "line", 228
    goto loop551_test
  loop551_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P553, exception, 'type'
    eq $P553, 65, loop551_next
    eq $P553, 67, loop551_redo
  loop551_done:
    pop_eh 
  loop554_next:
# .annotate "line", 224
    goto loop554_test
  loop554_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P556, exception, 'type'
    eq $P556, 65, loop554_next
    eq $P556, 67, loop554_redo
  loop554_done:
    pop_eh 
    find_lex $P557, "self"
# .annotate "line", 218
    .return ($P557)
  control_508:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P558, exception, "payload"
    .return ($P558)
.end


.namespace ["Array"]
.sub "elements"  :subid("39_1268405338.77676") :method :outer("11_1268405338.77676")
# .annotate "line", 237
    new $P561, 'ExceptionHandler'
    set_addr $P561, control_560
    $P561."handle_types"(58)
    push_eh $P561
    .lex "self", self
# .annotate "line", 238
    $P562 = "die"("No more elements! Use .elems")
# .annotate "line", 237
    .return ($P562)
  control_560:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P563, exception, "payload"
    .return ($P563)
.end


.namespace ["Array"]
.sub "elems"  :subid("40_1268405338.77676") :method :outer("11_1268405338.77676")
# .annotate "line", 241
    new $P566, 'ExceptionHandler'
    set_addr $P566, control_565
    $P566."handle_types"(58)
    push_eh $P566
    .lex "self", self
# .annotate "line", 242
    find_lex $P567, "self"
    elements $I568, $P567
# .annotate "line", 241
    .return ($I568)
  control_565:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P569, exception, "payload"
    .return ($P569)
.end


.namespace ["Array"]
.sub "grep"  :subid("41_1268405338.77676") :method :outer("11_1268405338.77676")
    .param pmc param_574
# .annotate "line", 249
    .const 'Sub' $P582 = "42_1268405338.77676" 
    capture_lex $P582
    new $P573, 'ExceptionHandler'
    set_addr $P573, control_572
    $P573."handle_types"(58)
    push_eh $P573
    .lex "self", self
    .lex "&match", param_574
# .annotate "line", 250
    new $P575, "ResizablePMCArray"
    .lex "@matches", $P575
# .annotate "line", 249
    find_lex $P576, "@matches"
# .annotate "line", 252
    find_lex $P578, "self"
    defined $I579, $P578
    unless $I579, for_undef_112
    iter $P577, $P578
    new $P593, 'ExceptionHandler'
    set_addr $P593, loop592_handler
    $P593."handle_types"(65, 67, 66)
    push_eh $P593
  loop592_test:
    unless $P577, loop592_done
    shift $P580, $P577
  loop592_redo:
    .const 'Sub' $P582 = "42_1268405338.77676" 
    capture_lex $P582
    $P582($P580)
  loop592_next:
    goto loop592_test
  loop592_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P594, exception, 'type'
    eq $P594, 65, loop592_next
    eq $P594, 67, loop592_redo
  loop592_done:
    pop_eh 
  for_undef_112:
    find_lex $P595, "@matches"
# .annotate "line", 249
    .return ($P595)
  control_572:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P596, exception, "payload"
    .return ($P596)
.end


.namespace ["Array"]
.sub "_block581"  :anon :subid("42_1268405338.77676") :outer("41_1268405338.77676")
    .param pmc param_583
# .annotate "line", 252
    .lex "$_", param_583
# .annotate "line", 254
    find_lex $P586, "&match"
    find_lex $P587, "$_"
    $P588 = $P586($P587)
    if $P588, if_585
    set $P584, $P588
    goto if_585_end
  if_585:
# .annotate "line", 253
    find_lex $P589, "@matches"
    find_lex $P590, "$_"
    $P591 = $P589."push"($P590)
    set $P584, $P591
  if_585_end:
# .annotate "line", 252
    .return ($P584)
.end


.namespace ["Array"]
.sub "is_sorted"  :subid("43_1268405338.77676") :method :outer("11_1268405338.77676")
    .param pmc param_600 :optional :named("cmp")
    .param int has_param_600 :opt_flag
# .annotate "line", 260
    new $P599, 'ExceptionHandler'
    set_addr $P599, control_598
    $P599."handle_types"(58)
    push_eh $P599
    .lex "self", self
    if has_param_600, optparam_113
    new $P601, "Undef"
    set param_600, $P601
  optparam_113:
    .lex "&cmp", param_600
# .annotate "line", 261
    new $P602, "Undef"
    .lex "$index", $P602
# .annotate "line", 262
    new $P603, "Undef"
    .lex "$limit", $P603
# .annotate "line", 261
    new $P604, "Integer"
    assign $P604, 0
    store_lex "$index", $P604
# .annotate "line", 262
    find_lex $P605, "self"
    $P606 = $P605."elems"()
    sub $P607, $P606, 1
    store_lex "$limit", $P607
# .annotate "line", 264
    new $P629, 'ExceptionHandler'
    set_addr $P629, loop628_handler
    $P629."handle_types"(65, 67, 66)
    push_eh $P629
  loop628_test:
    find_lex $P608, "$index"
    set $N609, $P608
    find_lex $P610, "$limit"
    set $N611, $P610
    islt $I612, $N609, $N611
    unless $I612, loop628_done
  loop628_redo:
# .annotate "line", 265
    find_lex $P614, "&cmp"
    find_lex $P615, "$index"
    set $I616, $P615
    find_lex $P617, "self"
    unless_null $P617, vivify_114
    new $P617, "ResizablePMCArray"
  vivify_114:
    set $P618, $P617[$I616]
    unless_null $P618, vivify_115
    new $P618, "Undef"
  vivify_115:
    find_lex $P619, "$index"
    add $P620, $P619, 1
    set $I621, $P620
    find_lex $P622, "self"
    unless_null $P622, vivify_116
    new $P622, "ResizablePMCArray"
  vivify_116:
    set $P623, $P622[$I621]
    unless_null $P623, vivify_117
    new $P623, "Undef"
  vivify_117:
    $N624 = $P614($P618, $P623)
    isgt $I625, $N624, 0.0
    unless $I625, if_613_end
# .annotate "line", 266
    new $P626, "Exception"
    set $P626['type'], 58
    new $P627, "Integer"
    assign $P627, 0
    setattribute $P626, 'payload', $P627
    throw $P626
  if_613_end:
  loop628_next:
# .annotate "line", 264
    goto loop628_test
  loop628_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P630, exception, 'type'
    eq $P630, 65, loop628_next
    eq $P630, 67, loop628_redo
  loop628_done:
    pop_eh 
# .annotate "line", 270
    new $P631, "Exception"
    set $P631['type'], 58
    new $P632, "Integer"
    assign $P632, 1
    setattribute $P631, 'payload', $P632
    throw $P631
# .annotate "line", 260
    .return ()
  control_598:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P633, exception, "payload"
    .return ($P633)
.end


.namespace ["Array"]
.sub "keys"  :subid("44_1268405338.77676") :method :outer("11_1268405338.77676")
# .annotate "line", 273
    new $P636, 'ExceptionHandler'
    set_addr $P636, control_635
    $P636."handle_types"(58)
    push_eh $P636
    .lex "self", self
# .annotate "line", 274
    new $P637, "ResizablePMCArray"
    .lex "@result", $P637
# .annotate "line", 276
    new $P638, "Undef"
    .lex "$i", $P638
# .annotate "line", 277
    new $P639, "Undef"
    .lex "$limit", $P639
# .annotate "line", 273
    find_lex $P640, "@result"
# .annotate "line", 276
    new $P641, "Integer"
    assign $P641, 0
    store_lex "$i", $P641
# .annotate "line", 277
    find_lex $P642, "self"
    $P643 = $P642."elems"()
    store_lex "$limit", $P643
# .annotate "line", 279
    new $P659, 'ExceptionHandler'
    set_addr $P659, loop658_handler
    $P659."handle_types"(65, 67, 66)
    push_eh $P659
  loop658_test:
    find_lex $P644, "$i"
    set $N645, $P644
    find_lex $P646, "$limit"
    set $N647, $P646
    islt $I648, $N645, $N647
    unless $I648, loop658_done
  loop658_redo:
# .annotate "line", 280
    find_lex $P650, "self"
    find_lex $P651, "$i"
    $P652 = $P650."exists"($P651)
    unless $P652, if_649_end
# .annotate "line", 281
    find_lex $P653, "@result"
    find_lex $P654, "$i"
    $P655 = $P654."clone"()
    $P653."push"($P655)
  if_649_end:
# .annotate "line", 280
    find_lex $P656, "$i"
    clone $P657, $P656
    inc $P656
  loop658_next:
# .annotate "line", 279
    goto loop658_test
  loop658_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P660, exception, 'type'
    eq $P660, 65, loop658_next
    eq $P660, 67, loop658_redo
  loop658_done:
    pop_eh 
    find_lex $P661, "@result"
# .annotate "line", 273
    .return ($P661)
  control_635:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P662, exception, "payload"
    .return ($P662)
.end


.namespace ["Array"]
.sub "kv"  :subid("45_1268405338.77676") :method :outer("11_1268405338.77676")
# .annotate "line", 290
    .const 'Sub' $P675 = "46_1268405338.77676" 
    capture_lex $P675
    new $P665, 'ExceptionHandler'
    set_addr $P665, control_664
    $P665."handle_types"(58)
    push_eh $P665
    .lex "self", self
# .annotate "line", 291
    new $P666, "ResizablePMCArray"
    .lex "@result", $P666
# .annotate "line", 293
    new $P667, "Undef"
    .lex "$i", $P667
# .annotate "line", 290
    find_lex $P668, "@result"
# .annotate "line", 293
    new $P669, "Integer"
    assign $P669, 0
    store_lex "$i", $P669
# .annotate "line", 295
    find_lex $P671, "self"
    defined $I672, $P671
    unless $I672, for_undef_118
    iter $P670, $P671
    new $P684, 'ExceptionHandler'
    set_addr $P684, loop683_handler
    $P684."handle_types"(65, 67, 66)
    push_eh $P684
  loop683_test:
    unless $P670, loop683_done
    shift $P673, $P670
  loop683_redo:
    .const 'Sub' $P675 = "46_1268405338.77676" 
    capture_lex $P675
    $P675($P673)
  loop683_next:
    goto loop683_test
  loop683_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P685, exception, 'type'
    eq $P685, 65, loop683_next
    eq $P685, 67, loop683_redo
  loop683_done:
    pop_eh 
  for_undef_118:
    find_lex $P686, "@result"
# .annotate "line", 290
    .return ($P686)
  control_664:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P687, exception, "payload"
    .return ($P687)
.end


.namespace ["Array"]
.sub "_block674"  :anon :subid("46_1268405338.77676") :outer("45_1268405338.77676")
    .param pmc param_676
# .annotate "line", 295
    .lex "$_", param_676
# .annotate "line", 296
    find_lex $P677, "@result"
    find_lex $P678, "$i"
    $P679 = $P678."clone"()
    $P677."push"($P679)
# .annotate "line", 297
    find_lex $P680, "@result"
    find_lex $P681, "$_"
    $P682 = $P680."push"($P681)
# .annotate "line", 295
    .return ($P682)
.end


.namespace ["Array"]
.sub "join"  :subid("47_1268405338.77676") :method :outer("11_1268405338.77676")
    .param pmc param_691 :optional
    .param int has_param_691 :opt_flag
# .annotate "line", 303
    new $P690, 'ExceptionHandler'
    set_addr $P690, control_689
    $P690."handle_types"(58)
    push_eh $P690
    .lex "self", self
    if has_param_691, optparam_119
    new $P692, "String"
    assign $P692, ""
    set param_691, $P692
  optparam_119:
    .lex "$delim", param_691
# .annotate "line", 304
    find_lex $P693, "$delim"
    set $S694, $P693
    find_lex $P695, "self"
    join $S696, $S694, $P695
# .annotate "line", 303
    .return ($S696)
  control_689:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P697, exception, "payload"
    .return ($P697)
.end


.namespace ["Array"]
.sub "map"  :subid("48_1268405338.77676") :method :outer("11_1268405338.77676")
    .param pmc param_702
# .annotate "line", 311
    .const 'Sub' $P710 = "49_1268405338.77676" 
    capture_lex $P710
    new $P701, 'ExceptionHandler'
    set_addr $P701, control_700
    $P701."handle_types"(58)
    push_eh $P701
    .lex "self", self
    .lex "&func", param_702
# .annotate "line", 312
    new $P703, "ResizablePMCArray"
    .lex "@result", $P703
# .annotate "line", 311
    find_lex $P704, "@result"
# .annotate "line", 314
    find_lex $P706, "self"
    defined $I707, $P706
    unless $I707, for_undef_120
    iter $P705, $P706
    new $P718, 'ExceptionHandler'
    set_addr $P718, loop717_handler
    $P718."handle_types"(65, 67, 66)
    push_eh $P718
  loop717_test:
    unless $P705, loop717_done
    shift $P708, $P705
  loop717_redo:
    .const 'Sub' $P710 = "49_1268405338.77676" 
    capture_lex $P710
    $P710($P708)
  loop717_next:
    goto loop717_test
  loop717_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P719, exception, 'type'
    eq $P719, 65, loop717_next
    eq $P719, 67, loop717_redo
  loop717_done:
    pop_eh 
  for_undef_120:
    find_lex $P720, "@result"
# .annotate "line", 311
    .return ($P720)
  control_700:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P721, exception, "payload"
    .return ($P721)
.end


.namespace ["Array"]
.sub "_block709"  :anon :subid("49_1268405338.77676") :outer("48_1268405338.77676")
    .param pmc param_711
# .annotate "line", 314
    .lex "$_", param_711
# .annotate "line", 315
    find_lex $P712, "@result"
    find_lex $P713, "&func"
    find_lex $P714, "$_"
    $P715 = $P713($P714)
    $P716 = $P712."push"($P715)
# .annotate "line", 314
    .return ($P716)
.end


.namespace ["Array"]
.sub "reduce"  :subid("50_1268405338.77676") :method :outer("11_1268405338.77676")
    .param pmc param_727
# .annotate "line", 329
    .const 'Sub' $P740 = "51_1268405338.77676" 
    capture_lex $P740
    new $P726, 'ExceptionHandler'
    set_addr $P726, control_725
    $P726."handle_types"(58)
    push_eh $P726
    .lex "self", self
    .lex "&expression", param_727
# .annotate "line", 330
    new $P728, "Undef"
    .lex "$result", $P728
# .annotate "line", 331
    new $P729, "Undef"
    .lex "$first", $P729
# .annotate "line", 329
    find_lex $P730, "$result"
# .annotate "line", 331
    new $P731, "Integer"
    assign $P731, 1
    store_lex "$first", $P731
# .annotate "line", 333
    find_lex $P733, "self"
    $P734 = $P733."elems"()
    unless $P734, if_732_end
# .annotate "line", 334
    find_lex $P736, "self"
    defined $I737, $P736
    unless $I737, for_undef_121
    iter $P735, $P736
    new $P753, 'ExceptionHandler'
    set_addr $P753, loop752_handler
    $P753."handle_types"(65, 67, 66)
    push_eh $P753
  loop752_test:
    unless $P735, loop752_done
    shift $P738, $P735
  loop752_redo:
    .const 'Sub' $P740 = "51_1268405338.77676" 
    capture_lex $P740
    $P740($P738)
  loop752_next:
    goto loop752_test
  loop752_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P754, exception, 'type'
    eq $P754, 65, loop752_next
    eq $P754, 67, loop752_redo
  loop752_done:
    pop_eh 
  for_undef_121:
  if_732_end:
# .annotate "line", 333
    find_lex $P755, "$result"
# .annotate "line", 329
    .return ($P755)
  control_725:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P756, exception, "payload"
    .return ($P756)
.end


.namespace ["Array"]
.sub "_block739"  :anon :subid("51_1268405338.77676") :outer("50_1268405338.77676")
    .param pmc param_741
# .annotate "line", 334
    .lex "$_", param_741
# .annotate "line", 335
    find_lex $P744, "$first"
    if $P744, if_743
# .annotate "line", 340
    find_lex $P748, "&expression"
    find_lex $P749, "$result"
    find_lex $P750, "$_"
    $P751 = $P748($P749, $P750)
    store_lex "$result", $P751
# .annotate "line", 339
    set $P742, $P751
# .annotate "line", 335
    goto if_743_end
  if_743:
    find_lex $P745, "$first"
    clone $P746, $P745
    dec $P745
# .annotate "line", 337
    find_lex $P747, "$_"
    store_lex "$result", $P747
# .annotate "line", 335
    set $P742, $P747
  if_743_end:
# .annotate "line", 334
    .return ($P742)
.end


.namespace ["Array"]
.sub "reverse"  :subid("52_1268405338.77676") :method :outer("11_1268405338.77676")
    .param pmc param_760 :optional :named("from")
    .param int has_param_760 :opt_flag
    .param pmc param_762 :optional :named("to")
    .param int has_param_762 :opt_flag
# .annotate "line", 348
    new $P759, 'ExceptionHandler'
    set_addr $P759, control_758
    $P759."handle_types"(58)
    push_eh $P759
    .lex "self", self
    if has_param_760, optparam_122
    new $P761, "Integer"
    assign $P761, 0
    set param_760, $P761
  optparam_122:
    .lex "$from", param_760
    if has_param_762, optparam_123
    new $P763, "Undef"
    set param_762, $P763
  optparam_123:
    .lex "$to", param_762
# .annotate "line", 350
    new $P764, "Undef"
    .lex "$temp", $P764
# .annotate "line", 349
    find_lex $P766, "$to"
    $P767 = $P766."defined"()
    if $P767, unless_765_end
    find_lex $P768, "self"
    $P769 = $P768."elems"()
    sub $P770, $P769, 1
    store_lex "$to", $P770
  unless_765_end:
    find_lex $P771, "$temp"
# .annotate "line", 352
    find_lex $P773, "$from"
    set $N774, $P773
    find_lex $P775, "$to"
    set $N776, $P775
    isgt $I777, $N774, $N776
    unless $I777, if_772_end
# .annotate "line", 353
    find_lex $P778, "$from"
    store_lex "$temp", $P778
# .annotate "line", 354
    find_lex $P779, "$to"
    store_lex "$from", $P779
# .annotate "line", 355
    find_lex $P780, "$temp"
    store_lex "$to", $P780
  if_772_end:
# .annotate "line", 358
    find_lex $P782, "$from"
    set $N783, $P782
    isge $I784, $N783, 0.0
    unless $I784, if_781_end
# .annotate "line", 359
    new $P810, 'ExceptionHandler'
    set_addr $P810, loop809_handler
    $P810."handle_types"(65, 67, 66)
    push_eh $P810
  loop809_test:
    find_lex $P785, "$from"
    set $N786, $P785
    find_lex $P787, "$to"
    set $N788, $P787
    islt $I789, $N786, $N788
    unless $I789, loop809_done
  loop809_redo:
# .annotate "line", 360
    find_lex $P790, "$from"
    set $I791, $P790
    find_lex $P792, "self"
    unless_null $P792, vivify_124
    new $P792, "ResizablePMCArray"
  vivify_124:
    set $P793, $P792[$I791]
    unless_null $P793, vivify_125
    new $P793, "Undef"
  vivify_125:
    store_lex "$temp", $P793
# .annotate "line", 361
    find_lex $P794, "$to"
    set $I795, $P794
    find_lex $P796, "self"
    unless_null $P796, vivify_126
    new $P796, "ResizablePMCArray"
  vivify_126:
    set $P797, $P796[$I795]
    unless_null $P797, vivify_127
    new $P797, "Undef"
  vivify_127:
    find_lex $P798, "$from"
    set $I799, $P798
    find_lex $P800, "self"
    unless_null $P800, vivify_128
    new $P800, "ResizablePMCArray"
    store_lex "self", $P800
  vivify_128:
    set $P800[$I799], $P797
# .annotate "line", 362
    find_lex $P801, "$temp"
    find_lex $P802, "$to"
    set $I803, $P802
    find_lex $P804, "self"
    unless_null $P804, vivify_129
    new $P804, "ResizablePMCArray"
    store_lex "self", $P804
  vivify_129:
    set $P804[$I803], $P801
    find_lex $P805, "$from"
    clone $P806, $P805
    inc $P805
    find_lex $P807, "$to"
    clone $P808, $P807
    dec $P807
  loop809_next:
# .annotate "line", 359
    goto loop809_test
  loop809_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P811, exception, 'type'
    eq $P811, 65, loop809_next
    eq $P811, 67, loop809_redo
  loop809_done:
    pop_eh 
  if_781_end:
# .annotate "line", 358
    find_lex $P812, "self"
# .annotate "line", 348
    .return ($P812)
  control_758:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P813, exception, "payload"
    .return ($P813)
.end


.namespace ["Array"]
.sub "set_size"  :subid("53_1268405338.77676") :method :outer("11_1268405338.77676")
    .param pmc param_818
# .annotate "line", 390
    new $P817, 'ExceptionHandler'
    set_addr $P817, control_816
    $P817."handle_types"(58)
    push_eh $P817
    .lex "self", self
    .lex "$size", param_818
# .annotate "line", 391
    find_lex $P819, "self"
    find_lex $P820, "$size"
    set $I821, $P820
    assign $P819, $I821
    find_lex $P822, "self"
# .annotate "line", 390
    .return ($P822)
  control_816:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P823, exception, "payload"
    .return ($P823)
.end


.namespace ["Array"]
.sub "slice"  :subid("54_1268405338.77676") :method :outer("11_1268405338.77676")
    .param pmc param_827 :optional :named("from")
    .param int has_param_827 :opt_flag
    .param pmc param_829 :optional :named("to")
    .param int has_param_829 :opt_flag
# .annotate "line", 395
    new $P826, 'ExceptionHandler'
    set_addr $P826, control_825
    $P826."handle_types"(58)
    push_eh $P826
    .lex "self", self
    if has_param_827, optparam_130
    new $P828, "Integer"
    assign $P828, 0
    set param_827, $P828
  optparam_130:
    .lex "$from", param_827
    if has_param_829, optparam_131
    new $P830, "Undef"
    set param_829, $P830
  optparam_131:
    .lex "$to", param_829
# .annotate "line", 396
    new $P831, "Undef"
    .lex "$elems", $P831
# .annotate "line", 410
    get_global $P832, "@Empty"
    unless_null $P832, vivify_132
    new $P832, "ResizablePMCArray"
    set_global "@Empty", $P832
  vivify_132:
# .annotate "line", 411
    new $P833, "ResizablePMCArray"
    .lex "@slice", $P833
# .annotate "line", 396
    find_lex $P834, "self"
    $P835 = $P834."elems"()
    store_lex "$elems", $P835
# .annotate "line", 397
    find_lex $P837, "$to"
    $P838 = $P837."defined"()
    if $P838, unless_836_end
    find_lex $P839, "$elems"
    store_lex "$to", $P839
  unless_836_end:
# .annotate "line", 399
    find_lex $P841, "$from"
    set $N842, $P841
    islt $I843, $N842, 0.0
    unless $I843, if_840_end
    find_lex $P844, "$from"
    find_lex $P845, "$elems"
    add $P846, $P844, $P845
    store_lex "$from", $P846
  if_840_end:
# .annotate "line", 400
    find_lex $P848, "$to"
    set $N849, $P848
    islt $I850, $N849, 0.0
    unless $I850, if_847_end
    find_lex $P851, "$to"
    find_lex $P852, "$elems"
    add $P853, $P851, $P852
    store_lex "$to", $P853
  if_847_end:
# .annotate "line", 402
    find_lex $P855, "$from"
    set $N856, $P855
    find_lex $P857, "$elems"
    set $N858, $P857
    isge $I859, $N856, $N858
    unless $I859, if_854_end
# .annotate "line", 403
    find_lex $P860, "$from"
    find_lex $P861, "$elems"
    "die"("$from parameter out of range: ", $P860, " exceeds # elements: ", $P861)
  if_854_end:
# .annotate "line", 406
    find_lex $P863, "$to"
    set $N864, $P863
    find_lex $P865, "$elems"
    set $N866, $P865
    isgt $I867, $N864, $N866
    unless $I867, if_862_end
# .annotate "line", 407
    find_lex $P868, "$from"
    find_lex $P869, "$elems"
    "die"("$to parameter out of range: ", $P868, " exceeds # elements: ", $P869)
  if_862_end:
# .annotate "line", 406
    get_global $P870, "@Empty"
# .annotate "line", 411
    find_lex $P871, "self"
    $P872 = $P871."clone"()
    store_lex "@slice", $P872
# .annotate "line", 412
    find_lex $P873, "@slice"
    get_global $P874, "@Empty"
    find_lex $P875, "$to"
    add $P876, $P875, 1
    find_lex $P877, "$elems"
    find_lex $P878, "$to"
    sub $P879, $P877, $P878
    $P873."splice"($P874, $P876 :named("from"), $P879 :named("replacing"))
# .annotate "line", 413
    find_lex $P880, "@slice"
    get_global $P881, "@Empty"
    find_lex $P882, "$from"
    $P880."splice"($P881, 0 :named("from"), $P882 :named("replacing"))
    find_lex $P883, "@slice"
# .annotate "line", 395
    .return ($P883)
  control_825:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P884, exception, "payload"
    .return ($P884)
.end


.namespace ["Array"]
.sub "splice"  :subid("55_1268405338.77676") :method :outer("11_1268405338.77676")
    .param pmc param_888
    .param pmc param_889 :optional :named("from")
    .param int has_param_889 :opt_flag
    .param pmc param_891 :optional :named("replacing")
    .param int has_param_891 :opt_flag
# .annotate "line", 417
    new $P887, 'ExceptionHandler'
    set_addr $P887, control_886
    $P887."handle_types"(58)
    push_eh $P887
    .lex "self", self
    .lex "@value", param_888
    if has_param_889, optparam_133
    new $P890, "Integer"
    assign $P890, 0
    set param_889, $P890
  optparam_133:
    .lex "$from", param_889
    if has_param_891, optparam_134
    new $P892, "Integer"
    assign $P892, 0
    set param_891, $P892
  optparam_134:
    .lex "$replacing", param_891
# .annotate "line", 418
    find_lex $P893, "self"
    find_lex $P894, "@value"
    find_lex $P895, "$from"
    set $I896, $P895
    find_lex $P897, "$replacing"
    set $I898, $P897
    splice $P893, $P894, $I896, $I898
    find_lex $P899, "self"
# .annotate "line", 417
    .return ($P899)
  control_886:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P900, exception, "payload"
    .return ($P900)
.end


.namespace ["Array"]
.sub "unsort"  :subid("56_1268405338.77676") :method :outer("11_1268405338.77676")
# .annotate "line", 422
    .const 'Sub' $P915 = "57_1268405338.77676" 
    capture_lex $P915
    new $P903, 'ExceptionHandler'
    set_addr $P903, control_902
    $P903."handle_types"(58)
    push_eh $P903
    .lex "self", self
# .annotate "line", 423
    get_global $P904, "&Parrot_range_rand"
    unless_null $P904, vivify_135
    new $P904, "Undef"
    set_global "&Parrot_range_rand", $P904
  vivify_135:
# .annotate "line", 431
    new $P905, "Undef"
    .lex "$bound", $P905
# .annotate "line", 432
    new $P906, "Undef"
    .lex "$swap", $P906
# .annotate "line", 433
    new $P907, "Undef"
    .lex "$temp", $P907
# .annotate "line", 422
    get_global $P908, "&Parrot_range_rand"
# .annotate "line", 425
    get_global $P910, "&Parrot_range_rand"
    defined $I911, $P910
    new $P912, 'Integer'
    set $P912, $I911
    isfalse $I913, $P912
    unless $I913, if_909_end
    .const 'Sub' $P915 = "57_1268405338.77676" 
    capture_lex $P915
    $P915()
  if_909_end:
# .annotate "line", 431
    find_lex $P925, "self"
    $P926 = $P925."elems"()
    sub $P927, $P926, 1
    store_lex "$bound", $P927
    find_lex $P928, "$swap"
    find_lex $P929, "$temp"
# .annotate "line", 435
    new $P963, 'ExceptionHandler'
    set_addr $P963, loop962_handler
    $P963."handle_types"(65, 67, 66)
    push_eh $P963
  loop962_test:
    find_lex $P930, "$bound"
    set $N931, $P930
    isgt $I932, $N931, 0.0
    unless $I932, loop962_done
  loop962_redo:
# .annotate "line", 436
    get_global $P933, "&Parrot_range_rand"
    find_lex $P934, "$bound"
    add $P935, $P934, 1
    $P936 = $P933(0, $P935, 0)
    store_lex "$swap", $P936
# .annotate "line", 437
    find_lex $P938, "$swap"
    set $N939, $P938
    find_lex $P940, "$bound"
    set $N941, $P940
    isgt $I942, $N939, $N941
    unless $I942, if_937_end
    find_lex $P943, "$swap"
    clone $P944, $P943
    dec $P943
  if_937_end:
# .annotate "line", 438
    find_lex $P945, "$bound"
    set $I946, $P945
    find_lex $P947, "self"
    unless_null $P947, vivify_136
    new $P947, "ResizablePMCArray"
  vivify_136:
    set $P948, $P947[$I946]
    unless_null $P948, vivify_137
    new $P948, "Undef"
  vivify_137:
    store_lex "$temp", $P948
# .annotate "line", 439
    find_lex $P949, "$swap"
    set $I950, $P949
    find_lex $P951, "self"
    unless_null $P951, vivify_138
    new $P951, "ResizablePMCArray"
  vivify_138:
    set $P952, $P951[$I950]
    unless_null $P952, vivify_139
    new $P952, "Undef"
  vivify_139:
    find_lex $P953, "$bound"
    set $I954, $P953
    find_lex $P955, "self"
    unless_null $P955, vivify_140
    new $P955, "ResizablePMCArray"
    store_lex "self", $P955
  vivify_140:
    set $P955[$I954], $P952
# .annotate "line", 440
    find_lex $P956, "$temp"
    find_lex $P957, "$swap"
    set $I958, $P957
    find_lex $P959, "self"
    unless_null $P959, vivify_141
    new $P959, "ResizablePMCArray"
    store_lex "self", $P959
  vivify_141:
    set $P959[$I958], $P956
    find_lex $P960, "$bound"
    clone $P961, $P960
    dec $P960
  loop962_next:
# .annotate "line", 435
    goto loop962_test
  loop962_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P964, exception, 'type'
    eq $P964, 65, loop962_next
    eq $P964, 67, loop962_redo
  loop962_done:
    pop_eh 
    find_lex $P965, "self"
# .annotate "line", 422
    .return ($P965)
  control_902:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P966, exception, "payload"
    .return ($P966)
.end


.namespace ["Array"]
.sub "_block914"  :anon :subid("57_1268405338.77676") :outer("56_1268405338.77676")
# .annotate "line", 427
    new $P916, "Undef"
    .lex "$lib", $P916
    null $S917
    loadlib $P918, $S917
    store_lex "$lib", $P918
# .annotate "line", 428
    find_lex $P919, "$lib"
    new $P920, "String"
    assign $P920, "Parrot_range_rand"
    set $S921, $P920
    new $P922, "String"
    assign $P922, "iiii"
    set $S923, $P922
    dlfunc $P924, $P919, $S921, $S923
    set_global "&Parrot_range_rand", $P924
# .annotate "line", 425
    .return ($P924)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268405374.06729")
# .annotate "line", 0
    get_hll_global $P14, ["Class"], "_block13" 
    capture_lex $P14
# .annotate "line", 8
    get_hll_global $P14, ["Class"], "_block13" 
    capture_lex $P14
    $P190 = $P14()
# .annotate "line", 1
    .return ($P190)
.end


.namespace ["Class"]
.sub "_block13"  :subid("11_1268405374.06729") :outer("10_1268405374.06729")
# .annotate "line", 8
    .const 'Sub' $P15 = "12_1268405374.06729" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268405374.06729" 
    capture_lex $P15
    .return ($P15)
.end


.namespace ["Class"]
.sub "__dump"  :subid("12_1268405374.06729") :method :outer("11_1268405374.06729")
    .param pmc param_18
    .param pmc param_19
# .annotate "line", 8
    .const 'Sub' $P110 = "15_1268405374.06729" 
    capture_lex $P110
    .const 'Sub' $P87 = "14_1268405374.06729" 
    capture_lex $P87
    .const 'Sub' $P65 = "13_1268405374.06729" 
    capture_lex $P65
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
    .lex "$dumper", param_18
    .lex "$label", param_19
# .annotate "line", 9
    new $P20, "ResizablePMCArray"
    .lex "@results", $P20
# .annotate "line", 10
    new $P21, "Undef"
    .lex "$subindent", $P21
# .annotate "line", 11
    new $P22, "Undef"
    .lex "$indent", $P22
# .annotate "line", 13
    new $P23, "Undef"
    .lex "$name", $P23
# .annotate "line", 14
    new $P24, "Undef"
    .lex "$nsp", $P24
# .annotate "line", 22
    new $P25, "ResizablePMCArray"
    .lex "@parents", $P25
# .annotate "line", 34
    new $P26, "Undef"
    .lex "$comma", $P26
# .annotate "line", 35
    new $P27, "ResizablePMCArray"
    .lex "@attributes", $P27
# .annotate "line", 48
    new $P28, "Hash"
    .lex "%methods_seen", $P28
# .annotate "line", 50
    new $P29, "ResizablePMCArray"
    .lex "@mro", $P29
# .annotate "line", 9
    get_hll_global $P30, ["Parrot"], "call_tuple_method"
    find_lex $P31, "$dumper"
    $P32 = $P30($P31, "newIndent")
    store_lex "@results", $P32
# .annotate "line", 10
    new $P33, "String"
    assign $P33, "\n"
    find_lex $P34, "@results"
    $S35 = $P34."shift"()
    concat $P36, $P33, $S35
    store_lex "$subindent", $P36
# .annotate "line", 11
    new $P37, "String"
    assign $P37, "\n"
    find_lex $P38, "@results"
    $S39 = $P38."shift"()
    concat $P40, $P37, $S39
    store_lex "$indent", $P40
# .annotate "line", 13
    find_lex $P43, "self"
    set $S44, $P43
    unless $S44, unless_42
    new $P41, 'String'
    set $P41, $S44
    goto unless_42_end
  unless_42:
    new $P45, "String"
    assign $P45, "<anonymous>"
    set $P41, $P45
  unless_42_end:
    store_lex "$name", $P41
# .annotate "line", 14
    find_lex $P46, "self"
    $P47 = $P46."get_namespace"()
    store_lex "$nsp", $P47
# .annotate "line", 16
    find_lex $P49, "$nsp"
    isnull $I50, $P49
    if $I50, unless_48_end
# .annotate "line", 17
    get_hll_global $P51, ["Parrot"], "namespace_name"
    find_lex $P52, "$nsp"
    $P53 = $P51($P52)
    store_lex "$name", $P53
  unless_48_end:
# .annotate "line", 20
    find_lex $P54, "$name"
    "print"($P54, " {")
# .annotate "line", 22
    find_lex $P55, "self"
    $P56 = $P55."inspect"("parents")
    store_lex "@parents", $P56
# .annotate "line", 23
    find_lex $P58, "@parents"
    if $P58, if_57
# .annotate "line", 31
    find_lex $P73, "$subindent"
    "print"($P73, "---- No parents.")
# .annotate "line", 30
    goto if_57_end
  if_57:
# .annotate "line", 24
    find_lex $P59, "$subindent"
    "print"($P59, "---- Parents: ")
# .annotate "line", 26
    find_lex $P61, "@parents"
    defined $I62, $P61
    unless $I62, for_undef_18
    iter $P60, $P61
    new $P71, 'ExceptionHandler'
    set_addr $P71, loop70_handler
    $P71."handle_types"(65, 67, 66)
    push_eh $P71
  loop70_test:
    unless $P60, loop70_done
    shift $P63, $P60
  loop70_redo:
    .const 'Sub' $P65 = "13_1268405374.06729" 
    capture_lex $P65
    $P65($P63)
  loop70_next:
    goto loop70_test
  loop70_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P72, exception, 'type'
    eq $P72, 65, loop70_next
    eq $P72, 67, loop70_redo
  loop70_done:
    pop_eh 
  for_undef_18:
  if_57_end:
# .annotate "line", 34
    new $P74, "String"
    assign $P74, ""
    store_lex "$comma", $P74
# .annotate "line", 35
    find_lex $P75, "self"
    $P76 = $P75."inspect"("attributes")
    $P77 = $P76."keys"()
    store_lex "@attributes", $P77
# .annotate "line", 37
    find_lex $P79, "@attributes"
    unless $P79, if_78_end
# .annotate "line", 38
    find_lex $P80, "$subindent"
    "print"($P80, "---- Attributes")
# .annotate "line", 40
    find_lex $P81, "@attributes"
    $P81."sort"()
# .annotate "line", 42
    find_lex $P83, "@attributes"
    defined $I84, $P83
    unless $I84, for_undef_19
    iter $P82, $P83
    new $P95, 'ExceptionHandler'
    set_addr $P95, loop94_handler
    $P95."handle_types"(65, 67, 66)
    push_eh $P95
  loop94_test:
    unless $P82, loop94_done
    shift $P85, $P82
  loop94_redo:
    .const 'Sub' $P87 = "14_1268405374.06729" 
    capture_lex $P87
    $P87($P85)
  loop94_next:
    goto loop94_test
  loop94_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P96, exception, 'type'
    eq $P96, 65, loop94_next
    eq $P96, 67, loop94_redo
  loop94_done:
    pop_eh 
  for_undef_19:
  if_78_end:
# .annotate "line", 37
    find_lex $P97, "%methods_seen"
# .annotate "line", 50
    find_lex $P98, "self"
    $P99 = $P98."inspect"("all_parents")
    store_lex "@mro", $P99
# .annotate "line", 52
    find_lex $P101, "@mro"
    set $N102, $P101
    iseq $I103, $N102, 0.0
    if $I103, if_100
# .annotate "line", 56
    find_lex $P106, "@mro"
    defined $I107, $P106
    unless $I107, for_undef_20
    iter $P105, $P106
    new $P184, 'ExceptionHandler'
    set_addr $P184, loop183_handler
    $P184."handle_types"(65, 67, 66)
    push_eh $P184
  loop183_test:
    unless $P105, loop183_done
    shift $P108, $P105
  loop183_redo:
    .const 'Sub' $P110 = "15_1268405374.06729" 
    capture_lex $P110
    $P110($P108)
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
  for_undef_20:
# .annotate "line", 55
    goto if_100_end
  if_100:
# .annotate "line", 53
    find_lex $P104, "$subindent"
    "print"($P104, "<No parents, even myself. This class is messed up.>")
  if_100_end:
# .annotate "line", 86
    find_lex $P186, "$indent"
    "print"($P186, "}")
# .annotate "line", 87
    find_lex $P187, "$dumper"
    $P188 = $P187."deleteIndent"()
# .annotate "line", 8
    .return ($P188)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P189, exception, "payload"
    .return ($P189)
.end


.namespace ["Class"]
.sub "_block64"  :anon :subid("13_1268405374.06729") :outer("12_1268405374.06729")
    .param pmc param_66
# .annotate "line", 26
    .lex "$parent", param_66
# .annotate "line", 27
    find_lex $P67, "$subindent"
    find_lex $P68, "$parent"
    $P69 = "print"($P67, $P68)
# .annotate "line", 26
    .return ($P69)
.end


.namespace ["Class"]
.sub "_block86"  :anon :subid("14_1268405374.06729") :outer("12_1268405374.06729")
    .param pmc param_88
# .annotate "line", 42
    .lex "$_", param_88
# .annotate "line", 43
    find_lex $P89, "$comma"
    find_lex $P90, "$subindent"
    find_lex $P91, "$_"
    set $S92, $P91
    "print"($P89, $P90, $S92)
# .annotate "line", 44
    new $P93, "String"
    assign $P93, ","
    store_lex "$comma", $P93
# .annotate "line", 42
    .return ($P93)
.end


.namespace ["Class"]
.sub "_block109"  :anon :subid("15_1268405374.06729") :outer("12_1268405374.06729")
    .param pmc param_113
# .annotate "line", 56
    .const 'Sub' $P132 = "16_1268405374.06729" 
    capture_lex $P132
# .annotate "line", 57
    new $P111, "Undef"
    .lex "$label", $P111
# .annotate "line", 62
    new $P112, "Hash"
    .lex "%methods", $P112
    .lex "$_", param_113
# .annotate "line", 57
    find_lex $P116, "$_"
    find_lex $P117, "self"
    issame $I118, $P116, $P117
    if $I118, if_115
# .annotate "line", 60
    new $P120, "String"
    assign $P120, "---- Methods inherited from "
    get_hll_global $P121, ["Parrot"], "namespace_name"
    find_lex $P122, "$_"
    $P123 = $P122."get_namespace"()
    $S124 = $P121($P123)
    concat $P125, $P120, $S124
    set $P114, $P125
# .annotate "line", 57
    goto if_115_end
  if_115:
    new $P119, "String"
    assign $P119, "---- Methods defined locally"
    set $P114, $P119
  if_115_end:
# .annotate "line", 58
    store_lex "$label", $P114
# .annotate "line", 62
    find_lex $P126, "$_"
    $P127 = $P126."methods"()
    store_lex "%methods", $P127
# .annotate "line", 64
    find_lex $P130, "%methods"
    if $P130, if_129
    set $P128, $P130
    goto if_129_end
  if_129:
    .const 'Sub' $P132 = "16_1268405374.06729" 
    capture_lex $P132
    $P182 = $P132()
    set $P128, $P182
  if_129_end:
# .annotate "line", 56
    .return ($P128)
.end


.namespace ["Class"]
.sub "_block131"  :anon :subid("16_1268405374.06729") :outer("15_1268405374.06729")
# .annotate "line", 64
    .const 'Sub' $P148 = "17_1268405374.06729" 
    capture_lex $P148
# .annotate "line", 67
    new $P133, "ResizablePMCArray"
    .lex "@methods", $P133
# .annotate "line", 69
    new $P134, "Undef"
    .lex "$arrow", $P134
# .annotate "line", 65
    find_lex $P135, "$subindent"
    find_lex $P136, "$label"
    "print"($P135, $P136)
# .annotate "line", 67
    find_lex $P137, "%methods"
    $P138 = $P137."keys"()
    store_lex "@methods", $P138
# .annotate "line", 68
    find_lex $P139, "@methods"
    $P139."sort"()
# .annotate "line", 69
    get_hll_global $P140, ["String"], "repeat"
    $P141 = $P140(" ", 24)
    concat $P142, $P141, " => "
    store_lex "$arrow", $P142
# .annotate "line", 71
    find_lex $P144, "@methods"
    defined $I145, $P144
    unless $I145, for_undef_21
    iter $P143, $P144
    new $P180, 'ExceptionHandler'
    set_addr $P180, loop179_handler
    $P180."handle_types"(65, 67, 66)
    push_eh $P180
  loop179_test:
    unless $P143, loop179_done
    shift $P146, $P143
  loop179_redo:
    .const 'Sub' $P148 = "17_1268405374.06729" 
    capture_lex $P148
    $P148($P146)
  loop179_next:
    goto loop179_test
  loop179_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P181, exception, 'type'
    eq $P181, 65, loop179_next
    eq $P181, 67, loop179_redo
  loop179_done:
    pop_eh 
  for_undef_21:
# .annotate "line", 64
    .return ($P143)
.end


.namespace ["Class"]
.sub "_block147"  :anon :subid("17_1268405374.06729") :outer("16_1268405374.06729")
    .param pmc param_150
# .annotate "line", 72
    new $P149, "Undef"
    .lex "$name", $P149
    .lex "$_", param_150
    find_lex $P151, "$_"
    set $S152, $P151
    new $P153, 'String'
    set $P153, $S152
    store_lex "$name", $P153
# .annotate "line", 74
    find_lex $P156, "$name"
    find_lex $P157, "%methods_seen"
    unless_null $P157, vivify_22
    new $P157, "Hash"
  vivify_22:
    set $P158, $P157[$P156]
    unless_null $P158, vivify_23
    new $P158, "Undef"
  vivify_23:
    unless $P158, unless_155
    set $P154, $P158
    goto unless_155_end
  unless_155:
# .annotate "line", 75
    find_lex $P159, "$subindent"
    find_lex $P160, "$name"
    "print"($P159, $P160)
# .annotate "line", 76
    find_lex $P161, "$arrow"
    find_lex $P164, "$name"
    $N165 = $P164."length"()
    isgt $I166, $N165, 24.0
    if $I166, if_163
    find_lex $P168, "$name"
    $P169 = $P168."length"()
    set $P162, $P169
    goto if_163_end
  if_163:
    new $P167, "Integer"
    assign $P167, 24
    set $P162, $P167
  if_163_end:
    $P170 = $P161."substr"($P162)
    "print"($P170)
# .annotate "line", 77
    find_lex $P171, "$dumper"
    find_lex $P172, "$label"
    find_lex $P173, "$name"
    find_lex $P174, "%methods"
    unless_null $P174, vivify_24
    new $P174, "Hash"
  vivify_24:
    set $P175, $P174[$P173]
    unless_null $P175, vivify_25
    new $P175, "Undef"
  vivify_25:
    $P171."dump"($P172, $P175)
# .annotate "line", 78
    "print"(",")
# .annotate "line", 79
    new $P176, "Integer"
    assign $P176, 1
    find_lex $P177, "$name"
    find_lex $P178, "%methods_seen"
    unless_null $P178, vivify_26
    new $P178, "Hash"
    store_lex "%methods_seen", $P178
  vivify_26:
    set $P178[$P177], $P176
# .annotate "line", 74
    set $P154, $P176
  unless_155_end:
# .annotate "line", 71
    .return ($P154)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268405364.20714")
# .annotate "line", 0
    get_hll_global $P14, ["Kakapo";"Pmc";"COMMON"], "_block13" 
    capture_lex $P14
# .annotate "line", 18
    get_hll_global $P14, ["Kakapo";"Pmc";"COMMON"], "_block13" 
    capture_lex $P14
    $P268 = $P14()
# .annotate "line", 1
    .return ($P268)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block13"  :subid("11_1268405364.20714") :outer("10_1268405364.20714")
# .annotate "line", 18
    .const 'Sub' $P260 = "25_1268405364.20714" 
    capture_lex $P260
    .const 'Sub' $P252 = "24_1268405364.20714" 
    capture_lex $P252
    .const 'Sub' $P242 = "23_1268405364.20714" 
    capture_lex $P242
    .const 'Sub' $P238 = "22_1268405364.20714" 
    capture_lex $P238
    .const 'Sub' $P231 = "21_1268405364.20714" 
    capture_lex $P231
    .const 'Sub' $P222 = "20_1268405364.20714" 
    capture_lex $P222
    .const 'Sub' $P154 = "18_1268405364.20714" 
    capture_lex $P154
    .const 'Sub' $P131 = "17_1268405364.20714" 
    capture_lex $P131
    .const 'Sub' $P15 = "12_1268405364.20714" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268405364.20714" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 112
    .const 'Sub' $P131 = "17_1268405364.20714" 
    capture_lex $P131
    .lex "create_new_method", $P131
# .annotate "line", 153
    .const 'Sub' $P154 = "18_1268405364.20714" 
    capture_lex $P154
    .lex "install_methods", $P154
# .annotate "line", 18
    find_lex $P221, "_pre_initload"
# .annotate "line", 108
    find_lex $P237, "create_new_method"
# .annotate "line", 151
    find_lex $P251, "install_methods"
# .annotate "line", 184
    .const 'Sub' $P260 = "25_1268405364.20714" 
    capture_lex $P260
# .annotate "line", 18
    .return ($P260)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_pre_initload"  :subid("12_1268405364.20714") :outer("11_1268405364.20714")
# .annotate "line", 18
    .const 'Sub' $P103 = "15_1268405364.20714" 
    capture_lex $P103
    .const 'Sub' $P78 = "14_1268405364.20714" 
    capture_lex $P78
    .const 'Sub' $P55 = "13_1268405364.20714" 
    capture_lex $P55
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 23
    new $P18, "Hash"
    .lex "%methods_for", $P18
# .annotate "line", 39
    new $P19, "Undef"
    .lex "$from_nsp", $P19
# .annotate "line", 42
    new $P20, "ResizablePMCArray"
    .lex "@first_pmcs", $P20
# .annotate "line", 20
    new $P21, "ResizablePMCArray"
    push $P21, "can"
    push $P21, "clone"
    push $P21, "defined"
    push $P21, "does"
    push $P21, "isa"
    "export"($P21)
    find_lex $P22, "%methods_for"
# .annotate "line", 24
    get_hll_global $P23, ["Array"], "new"
    $P24 = $P23("defined")
    find_lex $P25, "%methods_for"
    unless_null $P25, vivify_26
    new $P25, "Hash"
    store_lex "%methods_for", $P25
  vivify_26:
    set $P25["Class"], $P24
# .annotate "line", 25
    new $P26, "ResizablePMCArray"
    push $P26, "can"
    push $P26, "clone"
    push $P26, "defined"
    push $P26, "does"
    push $P26, "isa"
    push $P26, "is_equal"
    push $P26, "new"
    find_lex $P27, "%methods_for"
    unless_null $P27, vivify_27
    new $P27, "Hash"
    store_lex "%methods_for", $P27
  vivify_27:
    set $P27["Exception"], $P26
# .annotate "line", 27
    new $P28, "ResizablePMCArray"
    push $P28, "can"
    push $P28, "clone"
    push $P28, "defined"
    push $P28, "does"
    push $P28, "isa"
    push $P28, "is_equal"
    find_lex $P29, "%methods_for"
    unless_null $P29, vivify_28
    new $P29, "Hash"
    store_lex "%methods_for", $P29
  vivify_28:
    set $P29["Float"], $P28
# .annotate "line", 28
    new $P30, "ResizablePMCArray"
    push $P30, "can"
    push $P30, "clone"
    push $P30, "defined"
    push $P30, "does"
    push $P30, "isa"
    push $P30, "is_equal"
    find_lex $P31, "%methods_for"
    unless_null $P31, vivify_29
    new $P31, "Hash"
    store_lex "%methods_for", $P31
  vivify_29:
    set $P31["Hash"], $P30
# .annotate "line", 29
    new $P32, "ResizablePMCArray"
    push $P32, "can"
    push $P32, "clone"
    push $P32, "defined"
    push $P32, "does"
    push $P32, "isa"
    push $P32, "is_equal"
    find_lex $P33, "%methods_for"
    unless_null $P33, vivify_30
    new $P33, "Hash"
    store_lex "%methods_for", $P33
  vivify_30:
    set $P33["Integer"], $P32
# .annotate "line", 30
    new $P34, "ResizablePMCArray"
    push $P34, "can"
    push $P34, "clone"
    push $P34, "defined"
    push $P34, "does"
    push $P34, "isa"
    push $P34, "is_equal"
    find_lex $P35, "%methods_for"
    unless_null $P35, vivify_31
    new $P35, "Hash"
    store_lex "%methods_for", $P35
  vivify_31:
    set $P35["Key"], $P34
# .annotate "line", 31
    new $P36, "ResizablePMCArray"
    push $P36, "can"
    push $P36, "clone"
    push $P36, "defined"
    push $P36, "does"
    push $P36, "isa"
    push $P36, "is_equal"
    find_lex $P37, "%methods_for"
    unless_null $P37, vivify_32
    new $P37, "Hash"
    store_lex "%methods_for", $P37
  vivify_32:
    set $P37["NameSpace"], $P36
# .annotate "line", 32
    new $P38, "ResizablePMCArray"
    push $P38, "can"
    push $P38, "clone"
    push $P38, "defined"
    push $P38, "does"
    push $P38, "isa"
    push $P38, "is_equal"
    push $P38, "new"
    find_lex $P39, "%methods_for"
    unless_null $P39, vivify_33
    new $P39, "Hash"
    store_lex "%methods_for", $P39
  vivify_33:
    set $P39["ResizablePMCArray"], $P38
# .annotate "line", 33
    new $P40, "ResizablePMCArray"
    push $P40, "can"
    push $P40, "clone"
    push $P40, "defined"
    push $P40, "does"
    push $P40, "isa"
    push $P40, "is_equal"
    push $P40, "new"
    find_lex $P41, "%methods_for"
    unless_null $P41, vivify_34
    new $P41, "Hash"
    store_lex "%methods_for", $P41
  vivify_34:
    set $P41["ResizableStringArray"], $P40
# .annotate "line", 34
    new $P42, "ResizablePMCArray"
    push $P42, "can"
    push $P42, "clone"
    push $P42, "defined"
    push $P42, "does"
    push $P42, "is_equal"
    find_lex $P43, "%methods_for"
    unless_null $P43, vivify_35
    new $P43, "Hash"
    store_lex "%methods_for", $P43
  vivify_35:
    set $P43["String"], $P42
# .annotate "line", 36
    new $P44, "ResizablePMCArray"
    push $P44, "can"
    push $P44, "clone"
    push $P44, "defined"
    push $P44, "does"
    push $P44, "isa"
    push $P44, "is_equal"
    find_lex $P45, "%methods_for"
    unless_null $P45, vivify_36
    new $P45, "Hash"
    store_lex "%methods_for", $P45
  vivify_36:
    set $P45["Sub"], $P44
# .annotate "line", 37
    new $P46, "ResizablePMCArray"
    push $P46, "can"
    push $P46, "clone"
    push $P46, "does"
    push $P46, "isa"
    push $P46, "is_equal"
    push $P46, "new"
    find_lex $P47, "%methods_for"
    unless_null $P47, vivify_37
    new $P47, "Hash"
    store_lex "%methods_for", $P47
  vivify_37:
    set $P47["Undef"], $P46
# .annotate "line", 39
    get_namespace $P48
    store_lex "$from_nsp", $P48
# .annotate "line", 42
    new $P49, "ResizablePMCArray"
    push $P49, "Undef"
    push $P49, "String"
    push $P49, "Hash"
    push $P49, "ResizablePMCArray"
    push $P49, "ResizableStringArray"
    store_lex "@first_pmcs", $P49
# .annotate "line", 51
    find_lex $P51, "@first_pmcs"
    defined $I52, $P51
    unless $I52, for_undef_38
    iter $P50, $P51
    new $P71, 'ExceptionHandler'
    set_addr $P71, loop70_handler
    $P71."handle_types"(65, 67, 66)
    push_eh $P71
  loop70_test:
    unless $P50, loop70_done
    shift $P53, $P50
  loop70_redo:
    .const 'Sub' $P55 = "13_1268405364.20714" 
    capture_lex $P55
    $P55($P53)
  loop70_next:
    goto loop70_test
  loop70_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P72, exception, 'type'
    eq $P72, 65, loop70_next
    eq $P72, 67, loop70_redo
  loop70_done:
    pop_eh 
  for_undef_38:
# .annotate "line", 58
    find_lex $P74, "@first_pmcs"
    defined $I75, $P74
    unless $I75, for_undef_41
    iter $P73, $P74
    new $P94, 'ExceptionHandler'
    set_addr $P94, loop93_handler
    $P94."handle_types"(65, 67, 66)
    push_eh $P94
  loop93_test:
    unless $P73, loop93_done
    shift $P76, $P73
  loop93_redo:
    .const 'Sub' $P78 = "14_1268405364.20714" 
    capture_lex $P78
    $P78($P76)
  loop93_next:
    goto loop93_test
  loop93_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P95, exception, 'type'
    eq $P95, 65, loop93_next
    eq $P95, 67, loop93_redo
  loop93_done:
    pop_eh 
  for_undef_41:
# .annotate "line", 65
    find_lex $P97, "%methods_for"
    $P98 = $P97."kv"()
    defined $I99, $P98
    unless $I99, for_undef_45
    iter $P96, $P98
    new $P128, 'ExceptionHandler'
    set_addr $P128, loop127_handler
    $P128."handle_types"(65, 67, 66)
    push_eh $P128
  loop127_test:
    unless $P96, loop127_done
    shift $P100, $P96
    shift $P101, $P96
  loop127_redo:
    .const 'Sub' $P103 = "15_1268405364.20714" 
    capture_lex $P103
    $P103($P100, $P101)
  loop127_next:
    goto loop127_test
  loop127_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P129, exception, 'type'
    eq $P129, 65, loop127_next
    eq $P129, 67, loop127_redo
  loop127_done:
    pop_eh 
  for_undef_45:
# .annotate "line", 18
    .return ($P96)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P130, exception, "payload"
    .return ($P130)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block54"  :anon :subid("13_1268405364.20714") :outer("12_1268405364.20714")
    .param pmc param_57
# .annotate "line", 53
    new $P56, "Undef"
    .lex "$namespace", $P56
    .lex "$_", param_57
# .annotate "line", 52
    get_hll_global $P58, "P6metaclass"
    find_lex $P59, "$_"
    set $S60, $P59
    $P58."register"($S60)
# .annotate "line", 53
    get_hll_global $P61, ["Parrot"], "get_hll_namespace"
    find_lex $P62, "$_"
    set $S63, $P62
    $P64 = $P61($S63)
    store_lex "$namespace", $P64
# .annotate "line", 54
    find_lex $P65, "$namespace"
    find_lex $P66, "$_"
    find_lex $P67, "%methods_for"
    unless_null $P67, vivify_39
    new $P67, "Hash"
  vivify_39:
    set $P68, $P67[$P66]
    unless_null $P68, vivify_40
    new $P68, "Undef"
  vivify_40:
    $P69 = "install_methods"($P65, $P68, 1 :named("skip_new"))
# .annotate "line", 51
    .return ($P69)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block77"  :anon :subid("14_1268405364.20714") :outer("12_1268405364.20714")
    .param pmc param_81
# .annotate "line", 59
    new $P79, "Undef"
    .lex "$namespace", $P79
# .annotate "line", 61
    new $P80, "Undef"
    .lex "$undef", $P80
    .lex "$_", param_81
# .annotate "line", 59
    get_hll_global $P82, ["Parrot"], "get_hll_namespace"
    find_lex $P83, "$_"
    set $S84, $P83
    $P85 = $P82($S84)
    store_lex "$namespace", $P85
# .annotate "line", 60
    find_lex $P86, "$namespace"
    find_lex $P87, "$_"
    find_lex $P88, "%methods_for"
    unless_null $P88, vivify_42
    new $P88, "Hash"
  vivify_42:
    set $P89, $P88[$P87]
    unless_null $P89, vivify_43
    new $P89, "Undef"
  vivify_43:
    "install_methods"($P86, $P89)
# .annotate "line", 61
    find_lex $P90, "$undef"
    find_lex $P91, "$_"
    find_lex $P92, "%methods_for"
    unless_null $P92, vivify_44
    new $P92, "Hash"
    store_lex "%methods_for", $P92
  vivify_44:
    set $P92[$P91], $P90
# .annotate "line", 58
    .return ($P90)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block102"  :anon :subid("15_1268405364.20714") :outer("12_1268405364.20714")
    .param pmc param_104
    .param pmc param_105
# .annotate "line", 65
    .const 'Sub' $P110 = "16_1268405364.20714" 
    capture_lex $P110
    .lex "$pmc_type", param_104
    .lex "@methods", param_105
# .annotate "line", 66
    find_lex $P108, "@methods"
    if $P108, if_107
    set $P106, $P108
    goto if_107_end
  if_107:
    .const 'Sub' $P110 = "16_1268405364.20714" 
    capture_lex $P110
    $P126 = $P110()
    set $P106, $P126
  if_107_end:
# .annotate "line", 65
    .return ($P106)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block109"  :anon :subid("16_1268405364.20714") :outer("15_1268405364.20714")
# .annotate "line", 71
    new $P111, "Undef"
    .lex "$namespace", $P111
# .annotate "line", 67
    get_hll_global $P113, ["Parrot"], "get_hll_global"
    find_lex $P114, "$pmc_type"
    $P115 = $P113($P114)
    typeof $S116, $P115
    iseq $I117, $S116, "NameSpace"
    unless $I117, if_112_end
# .annotate "line", 68
    get_hll_global $P118, "P6metaclass"
    find_lex $P119, "$pmc_type"
    $P118."register"($P119)
  if_112_end:
# .annotate "line", 71
    get_hll_global $P120, ["Parrot"], "get_hll_namespace"
    find_lex $P121, "$pmc_type"
    $P122 = $P120($P121)
    store_lex "$namespace", $P122
# .annotate "line", 72
    find_lex $P123, "$namespace"
    find_lex $P124, "@methods"
    $P125 = "install_methods"($P123, $P124)
# .annotate "line", 66
    .return ($P125)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "create_new_method"  :subid("17_1268405364.20714") :outer("11_1268405364.20714")
    .param pmc param_134
# .annotate "line", 112
    new $P133, 'ExceptionHandler'
    set_addr $P133, control_132
    $P133."handle_types"(58)
    push_eh $P133
    .lex "$namespace", param_134
# .annotate "line", 113
    new $P135, "Undef"
    .lex "$type", $P135
# .annotate "line", 114
    new $P136, "Undef"
    .lex "&new", $P136
# .annotate "line", 113
    find_lex $P137, "$namespace"
    set $S138, $P137
    new $P139, 'String'
    set $P139, $S138
    store_lex "$type", $P139
# .annotate "line", 114
    get_hll_global $P140, ["Pir"], "compile_sub"
    find_lex $P141, "$namespace"
# .annotate "line", 119
    new $P142, "String"
    assign $P142, "\t"
    concat $P143, $P142, "$P0 = "
    new $P144, 'String'
    set $P144, "new [ '"
    find_lex $P145, "$type"
    concat $P146, $P144, $P145
    concat $P147, $P146, "' ]"
    concat $P148, $P143, $P147
# .annotate "line", 120
    new $P149, "String"
    assign $P149, "\t"
    concat $P150, $P149, ".return ($P0)"
    new $P151, "ResizablePMCArray"
    push $P151, $P148
    push $P151, $P150
    $P152 = $P140("new" :named("name"), $P141 :named("namespace"), 1 :named("method"), $P151 :named("body"))
# .annotate "line", 114
    store_lex "&new", $P152
# .annotate "line", 112
    .return ($P152)
  control_132:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P153, exception, "payload"
    .return ($P153)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "install_methods"  :subid("18_1268405364.20714") :outer("11_1268405364.20714")
    .param pmc param_157
    .param pmc param_158
    .param pmc param_159 :optional :named("skip_new")
    .param int has_param_159 :opt_flag
# .annotate "line", 153
    .const 'Sub' $P174 = "19_1268405364.20714" 
    capture_lex $P174
    new $P156, 'ExceptionHandler'
    set_addr $P156, control_155
    $P156."handle_types"(58)
    push_eh $P156
    .lex "$namespace", param_157
    .lex "@methods", param_158
    if has_param_159, optparam_46
    new $P160, "Undef"
    set param_159, $P160
  optparam_46:
    .lex "$skip_new", param_159
# .annotate "line", 154
    new $P161, "Undef"
    .lex "$from_nsp", $P161
# .annotate "line", 156
    new $P162, "Hash"
    .lex "%export_subs", $P162
# .annotate "line", 157
    new $P163, "Undef"
    .lex "$pmc_name", $P163
# .annotate "line", 154
    get_namespace $P164
    store_lex "$from_nsp", $P164
    find_lex $P165, "%export_subs"
# .annotate "line", 157
    find_lex $P166, "$namespace"
    set $S167, $P166
    new $P168, 'String'
    set $P168, $S167
    store_lex "$pmc_name", $P168
# .annotate "line", 159
    find_lex $P170, "@methods"
    defined $I171, $P170
    unless $I171, for_undef_47
    iter $P169, $P170
    new $P211, 'ExceptionHandler'
    set_addr $P211, loop210_handler
    $P211."handle_types"(65, 67, 66)
    push_eh $P211
  loop210_test:
    unless $P169, loop210_done
    shift $P172, $P169
  loop210_redo:
    .const 'Sub' $P174 = "19_1268405364.20714" 
    capture_lex $P174
    $P174($P172)
  loop210_next:
    goto loop210_test
  loop210_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P212, exception, 'type'
    eq $P212, 65, loop210_next
    eq $P212, 67, loop210_redo
  loop210_done:
    pop_eh 
  for_undef_47:
# .annotate "line", 175
    find_lex $P215, "%export_subs"
    if $P215, if_214
    set $P213, $P215
    goto if_214_end
  if_214:
# .annotate "line", 176
    find_lex $P216, "$from_nsp"
    find_lex $P217, "$namespace"
    find_lex $P218, "%export_subs"
    $P219 = $P216."export_to"($P217, $P218)
# .annotate "line", 175
    set $P213, $P219
  if_214_end:
# .annotate "line", 153
    .return ($P213)
  control_155:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P220, exception, "payload"
    .return ($P220)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block173"  :anon :subid("19_1268405364.20714") :outer("18_1268405364.20714")
    .param pmc param_175
# .annotate "line", 159
    .lex "$_", param_175
# .annotate "line", 160
    find_lex $P178, "$_"
    set $S179, $P178
    find_lex $P180, "$namespace"
    unless_null $P180, vivify_48
    new $P180, "Hash"
  vivify_48:
    set $P181, $P180[$S179]
    unless_null $P181, vivify_49
    new $P181, "Undef"
  vivify_49:
    unless $P181, unless_177
    set $P176, $P181
    goto unless_177_end
  unless_177:
# .annotate "line", 161
    find_lex $P184, "$_"
    set $S185, $P184
    find_lex $P186, "$from_nsp"
    unless_null $P186, vivify_50
    new $P186, "Hash"
  vivify_50:
    set $P187, $P186[$S185]
    unless_null $P187, vivify_51
    new $P187, "Undef"
  vivify_51:
    if $P187, if_183
# .annotate "line", 164
    find_lex $P197, "$_"
    set $S198, $P197
    iseq $I199, $S198, "new"
    if $I199, if_196
# .annotate "line", 170
    new $P206, 'String'
    set $P206, "Request to export unknown COMMON method '"
    find_lex $P207, "$_"
    concat $P208, $P206, $P207
    concat $P209, $P208, "'"
    die $P209
# .annotate "line", 169
    goto if_196_end
  if_196:
# .annotate "line", 165
    find_lex $P202, "$skip_new"
    unless $P202, unless_201
    set $P200, $P202
    goto unless_201_end
  unless_201:
# .annotate "line", 166
    find_lex $P203, "$_"
    set $S204, $P203
    $P205 = "create_new_method"($S204)
# .annotate "line", 165
    set $P200, $P205
  unless_201_end:
# .annotate "line", 164
    set $P195, $P200
  if_196_end:
    set $P182, $P195
# .annotate "line", 161
    goto if_183_end
  if_183:
# .annotate "line", 162
    find_lex $P188, "$_"
    set $S189, $P188
    find_lex $P190, "$from_nsp"
    unless_null $P190, vivify_52
    new $P190, "Hash"
  vivify_52:
    set $P191, $P190[$S189]
    unless_null $P191, vivify_53
    new $P191, "Undef"
  vivify_53:
    find_lex $P192, "$_"
    set $S193, $P192
    find_lex $P194, "%export_subs"
    unless_null $P194, vivify_54
    new $P194, "Hash"
    store_lex "%export_subs", $P194
  vivify_54:
    set $P194[$S193], $P191
# .annotate "line", 161
    set $P182, $P191
  if_183_end:
# .annotate "line", 160
    set $P176, $P182
  unless_177_end:
# .annotate "line", 159
    .return ($P176)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "can"  :subid("20_1268405364.20714") :method :outer("11_1268405364.20714")
    .param pmc param_225
# .annotate "line", 88
    new $P224, 'ExceptionHandler'
    set_addr $P224, control_223
    $P224."handle_types"(58)
    push_eh $P224
    .lex "self", self
    .lex "$method", param_225
# .annotate "line", 89
    find_lex $P226, "self"
    find_lex $P227, "$method"
    set $S228, $P227
    can $I229, $P226, $S228
# .annotate "line", 88
    .return ($I229)
  control_223:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P230, exception, "payload"
    .return ($P230)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "clone"  :subid("21_1268405364.20714") :method :outer("11_1268405364.20714")
# .annotate "line", 108
    new $P233, 'ExceptionHandler'
    set_addr $P233, control_232
    $P233."handle_types"(58)
    push_eh $P233
    .lex "self", self
# .annotate "line", 109
    find_lex $P234, "self"
    clone $P235, $P234
# .annotate "line", 108
    .return ($P235)
  control_232:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P236, exception, "payload"
    .return ($P236)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "defined"  :subid("22_1268405364.20714") :method :outer("11_1268405364.20714")
# .annotate "line", 136
    new $P240, 'ExceptionHandler'
    set_addr $P240, control_239
    $P240."handle_types"(58)
    push_eh $P240
    .lex "self", self
    .return (1)
  control_239:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P241, exception, "payload"
    .return ($P241)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "does"  :subid("23_1268405364.20714") :method :outer("11_1268405364.20714")
    .param pmc param_245
# .annotate "line", 151
    new $P244, 'ExceptionHandler'
    set_addr $P244, control_243
    $P244."handle_types"(58)
    push_eh $P244
    .lex "self", self
    .lex "$role", param_245
    find_lex $P246, "self"
    find_lex $P247, "$role"
    set $S248, $P247
    does $I249, $P246, $S248
    .return ($I249)
  control_243:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P250, exception, "payload"
    .return ($P250)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "isa"  :subid("24_1268405364.20714") :method :outer("11_1268405364.20714")
    .param pmc param_255
# .annotate "line", 180
    new $P254, 'ExceptionHandler'
    set_addr $P254, control_253
    $P254."handle_types"(58)
    push_eh $P254
    .lex "self", self
    .lex "$type", param_255
# .annotate "line", 181
    find_lex $P256, "self"
    find_lex $P257, "$type"
    isa $I258, $P256, $P257
# .annotate "line", 180
    .return ($I258)
  control_253:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P259, exception, "payload"
    .return ($P259)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "is_equal"  :subid("25_1268405364.20714") :method :outer("11_1268405364.20714")
    .param pmc param_263
# .annotate "line", 184
    new $P262, 'ExceptionHandler'
    set_addr $P262, control_261
    $P262."handle_types"(58)
    push_eh $P262
    .lex "self", self
    .lex "$other", param_263
# .annotate "line", 185
    find_lex $P264, "self"
    find_lex $P265, "$other"
    iseq $I266, $P264, $P265
# .annotate "line", 184
    .return ($I266)
  control_261:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P267, exception, "payload"
    .return ($P267)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268405401.2777")
# .annotate "line", 0
    get_hll_global $P14, ["Exception"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Exception"], "_block13" 
    capture_lex $P14
    $P335 = $P14()
# .annotate "line", 1
    .return ($P335)
.end


.namespace ["Exception"]
.sub "_block13"  :subid("11_1268405401.2777") :outer("10_1268405401.2777")
# .annotate "line", 7
    get_hll_global $P176, ["Exception";"Wrapper"], "_block175" 
    capture_lex $P176
    get_hll_global $P146, ["Exception";"Severity"], "_block145" 
    capture_lex $P146
    .const 'Sub' $P137 = "23_1268405401.2777" 
    capture_lex $P137
    .const 'Sub' $P132 = "22_1268405401.2777" 
    capture_lex $P132
    .const 'Sub' $P124 = "21_1268405401.2777" 
    capture_lex $P124
    .const 'Sub' $P119 = "20_1268405401.2777" 
    capture_lex $P119
    .const 'Sub' $P111 = "19_1268405401.2777" 
    capture_lex $P111
    .const 'Sub' $P103 = "18_1268405401.2777" 
    capture_lex $P103
    .const 'Sub' $P95 = "17_1268405401.2777" 
    capture_lex $P95
    .const 'Sub' $P87 = "16_1268405401.2777" 
    capture_lex $P87
    .const 'Sub' $P40 = "14_1268405401.2777" 
    capture_lex $P40
    .const 'Sub' $P20 = "13_1268405401.2777" 
    capture_lex $P20
    .const 'Sub' $P15 = "12_1268405401.2777" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268405401.2777" 
    capture_lex $P15
    .lex "_pre_initload", $P15
    find_lex $P19, "_pre_initload"
# .annotate "line", 51
    get_hll_global $P146, ["Exception";"Severity"], "_block145" 
    capture_lex $P146
    $P146()
# .annotate "line", 66
    get_hll_global $P176, ["Exception";"Wrapper"], "_block175" 
    capture_lex $P176
    $P332 = $P176()
# .annotate "line", 7
    .return ($P332)
.end


.namespace ["Exception"]
.sub "" :load :init :subid("post45") :outer("11_1268405401.2777")
# .annotate "line", 7
    get_hll_global $P14, ["Exception"], "_block13" 
    .local pmc block
    set block, $P14
    $P333 = get_root_global ["parrot"], "P6metaclass"
    $P333."new_class"("Exception::Severity")
    $P334 = get_root_global ["parrot"], "P6metaclass"
    $P334."new_class"("Exception::Wrapper")
.end


.namespace ["Exception"]
.sub "_pre_initload"  :subid("12_1268405401.2777") :outer("11_1268405401.2777")
# .annotate "line", 7
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .return ()
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P18, exception, "payload"
    .return ($P18)
.end


.namespace ["Exception"]
.sub "_attr"  :subid("13_1268405401.2777") :method :outer("11_1268405401.2777")
    .param pmc param_23
    .param pmc param_24
# .annotate "line", 13
    new $P22, 'ExceptionHandler'
    set_addr $P22, control_21
    $P22."handle_types"(58)
    push_eh $P22
    .lex "self", self
    .lex "$name", param_23
    .lex "@value", param_24
# .annotate "line", 14
    find_lex $P27, "@value"
    set $N28, $P27
    if $N28, if_26
# .annotate "line", 19
    find_lex $P35, "self"
    find_lex $P36, "$name"
    set $S37, $P36
    getattribute $P38, $P35, $S37
# .annotate "line", 18
    set $P25, $P38
# .annotate "line", 14
    goto if_26_end
  if_26:
# .annotate "line", 15
    find_lex $P29, "self"
    find_lex $P30, "$name"
    set $S31, $P30
    find_lex $P32, "@value"
    $P33 = $P32."shift"()
    setattribute $P29, $S31, $P33
    find_lex $P34, "self"
# .annotate "line", 14
    set $P25, $P34
  if_26_end:
# .annotate "line", 13
    .return ($P25)
  control_21:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P39, exception, "payload"
    .return ($P39)
.end


.namespace ["Exception"]
.sub "backtrace_string"  :subid("14_1268405401.2777") :method :outer("11_1268405401.2777")
# .annotate "line", 23
    .const 'Sub' $P56 = "15_1268405401.2777" 
    capture_lex $P56
    new $P42, 'ExceptionHandler'
    set_addr $P42, control_41
    $P42."handle_types"(58)
    push_eh $P42
    .lex "self", self
# .annotate "line", 24
    new $P43, "ResizablePMCArray"
    .lex "@parts", $P43
# .annotate "line", 25
    new $P44, "Undef"
    .lex "$sub", $P44
# .annotate "line", 26
    new $P45, "Undef"
    .lex "$sub_name", $P45
# .annotate "line", 24
    get_hll_global $P46, ["Array"], "new"
    $P47 = $P46()
    store_lex "@parts", $P47
    find_lex $P48, "$sub"
    find_lex $P49, "$sub_name"
# .annotate "line", 28
    find_lex $P51, "self"
    $P52 = $P51."backtrace"()
    defined $I53, $P52
    unless $I53, for_undef_46
    iter $P50, $P52
    new $P81, 'ExceptionHandler'
    set_addr $P81, loop80_handler
    $P81."handle_types"(65, 67, 66)
    push_eh $P81
  loop80_test:
    unless $P50, loop80_done
    shift $P54, $P50
  loop80_redo:
    .const 'Sub' $P56 = "15_1268405401.2777" 
    capture_lex $P56
    $P56($P54)
  loop80_next:
    goto loop80_test
  loop80_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P82, exception, 'type'
    eq $P82, 65, loop80_next
    eq $P82, 67, loop80_redo
  loop80_done:
    pop_eh 
  for_undef_46:
# .annotate "line", 38
    new $P83, "Exception"
    set $P83['type'], 58
    find_lex $P84, "@parts"
    $P85 = $P84."join"("\n")
    setattribute $P83, 'payload', $P85
    throw $P83
# .annotate "line", 23
    .return ()
  control_41:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P86, exception, "payload"
    .return ($P86)
.end


.namespace ["Exception"]
.sub "_block55"  :anon :subid("15_1268405401.2777") :outer("14_1268405401.2777")
    .param pmc param_57
# .annotate "line", 28
    .lex "$_", param_57
# .annotate "line", 29
    find_lex $P58, "$_"
    unless_null $P58, vivify_47
    new $P58, "Hash"
  vivify_47:
    set $P59, $P58["sub"]
    unless_null $P59, vivify_48
    new $P59, "Undef"
  vivify_48:
    store_lex "$sub", $P59
# .annotate "line", 31
    find_lex $P64, "$sub"
    isnull $I65, $P64
    new $P66, 'Integer'
    set $P66, $I65
    isfalse $I67, $P66
    if $I67, if_63
    new $P62, 'Integer'
    set $P62, $I67
    goto if_63_end
  if_63:
    find_lex $P68, "$sub"
    defined $I69, $P68
    new $P62, 'Integer'
    set $P62, $I69
  if_63_end:
    if $P62, if_61
    set $P60, $P62
    goto if_61_end
  if_61:
# .annotate "line", 32
    find_lex $P70, "$sub"
    $P71 = $P70."get_namespace"()
    $P72 = $P71."get_name"()
    $P73 = $P72."join"("::")
    concat $P74, $P73, "::"
# .annotate "line", 33
    find_lex $P75, "$sub"
    concat $P76, $P74, $P75
    store_lex "$sub_name", $P76
# .annotate "line", 34
    find_lex $P77, "@parts"
    find_lex $P78, "$sub_name"
    $P79 = $P77."push"($P78)
# .annotate "line", 31
    set $P60, $P79
  if_61_end:
# .annotate "line", 28
    .return ($P60)
.end


.namespace ["Exception"]
.sub "exit_code"  :subid("16_1268405401.2777") :method :outer("11_1268405401.2777")
    .param pmc param_90 :slurpy
# .annotate "line", 41
    new $P89, 'ExceptionHandler'
    set_addr $P89, control_88
    $P89."handle_types"(58)
    push_eh $P89
    .lex "self", self
    .lex "@value", param_90
    find_lex $P91, "self"
    find_lex $P92, "@value"
    $P93 = $P91."_attr"("exit_code", $P92)
    .return ($P93)
  control_88:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P94, exception, "payload"
    .return ($P94)
.end


.namespace ["Exception"]
.sub "handled"  :subid("17_1268405401.2777") :method :outer("11_1268405401.2777")
    .param pmc param_98 :slurpy
# .annotate "line", 42
    new $P97, 'ExceptionHandler'
    set_addr $P97, control_96
    $P97."handle_types"(58)
    push_eh $P97
    .lex "self", self
    .lex "@value", param_98
    find_lex $P99, "self"
    find_lex $P100, "@value"
    $P101 = $P99."_attr"("handled", $P100)
    .return ($P101)
  control_96:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["Exception"]
.sub "message"  :subid("18_1268405401.2777") :method :outer("11_1268405401.2777")
    .param pmc param_106 :slurpy
# .annotate "line", 43
    new $P105, 'ExceptionHandler'
    set_addr $P105, control_104
    $P105."handle_types"(58)
    push_eh $P105
    .lex "self", self
    .lex "@value", param_106
    find_lex $P107, "self"
    find_lex $P108, "@value"
    $P109 = $P107."_attr"("message", $P108)
    .return ($P109)
  control_104:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Exception"]
.sub "payload"  :subid("19_1268405401.2777") :method :outer("11_1268405401.2777")
    .param pmc param_114 :slurpy
# .annotate "line", 44
    new $P113, 'ExceptionHandler'
    set_addr $P113, control_112
    $P113."handle_types"(58)
    push_eh $P113
    .lex "self", self
    .lex "@value", param_114
    find_lex $P115, "self"
    find_lex $P116, "@value"
    $P117 = $P115."_attr"("payload", $P116)
    .return ($P117)
  control_112:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, "payload"
    .return ($P118)
.end


.namespace ["Exception"]
.sub "rethrow"  :subid("20_1268405401.2777") :method :outer("11_1268405401.2777")
# .annotate "line", 46
    new $P121, 'ExceptionHandler'
    set_addr $P121, control_120
    $P121."handle_types"(58)
    push_eh $P121
    .lex "self", self
    find_lex $P122, "self"
    rethrow $P122
    .return ()
  control_120:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P123, exception, "payload"
    .return ($P123)
.end


.namespace ["Exception"]
.sub "severity"  :subid("21_1268405401.2777") :method :outer("11_1268405401.2777")
    .param pmc param_127 :slurpy
# .annotate "line", 47
    new $P126, 'ExceptionHandler'
    set_addr $P126, control_125
    $P126."handle_types"(58)
    push_eh $P126
    .lex "self", self
    .lex "@value", param_127
    find_lex $P128, "self"
    find_lex $P129, "@value"
    $P130 = $P128."_attr"("severity", $P129)
    .return ($P130)
  control_125:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P131, exception, "payload"
    .return ($P131)
.end


.namespace ["Exception"]
.sub "throw"  :subid("22_1268405401.2777") :method :outer("11_1268405401.2777")
# .annotate "line", 48
    new $P134, 'ExceptionHandler'
    set_addr $P134, control_133
    $P134."handle_types"(58)
    push_eh $P134
    .lex "self", self
    find_lex $P135, "self"
    throw $P135
    .return ()
  control_133:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P136, exception, "payload"
    .return ($P136)
.end


.namespace ["Exception"]
.sub "type"  :subid("23_1268405401.2777") :method :outer("11_1268405401.2777")
    .param pmc param_140 :slurpy
# .annotate "line", 49
    new $P139, 'ExceptionHandler'
    set_addr $P139, control_138
    $P139."handle_types"(58)
    push_eh $P139
    .lex "self", self
    .lex "@value", param_140
    find_lex $P141, "self"
    find_lex $P142, "@value"
    $P143 = $P141."_attr"("type", $P142)
    .return ($P143)
  control_138:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P144, exception, "payload"
    .return ($P144)
.end


.namespace ["Exception";"Severity"]
.sub "_block145"  :subid("24_1268405401.2777") :outer("11_1268405401.2777")
# .annotate "line", 51
    .const 'Sub' $P171 = "31_1268405401.2777" 
    capture_lex $P171
    .const 'Sub' $P167 = "30_1268405401.2777" 
    capture_lex $P167
    .const 'Sub' $P163 = "29_1268405401.2777" 
    capture_lex $P163
    .const 'Sub' $P159 = "28_1268405401.2777" 
    capture_lex $P159
    .const 'Sub' $P155 = "27_1268405401.2777" 
    capture_lex $P155
    .const 'Sub' $P151 = "26_1268405401.2777" 
    capture_lex $P151
    .const 'Sub' $P147 = "25_1268405401.2777" 
    capture_lex $P147
# .annotate "line", 58
    .const 'Sub' $P171 = "31_1268405401.2777" 
    capture_lex $P171
# .annotate "line", 51
    .return ($P171)
.end


.namespace ["Exception";"Severity"]
.sub "NORMAL"  :subid("25_1268405401.2777") :method :outer("24_1268405401.2777")
# .annotate "line", 52
    new $P149, 'ExceptionHandler'
    set_addr $P149, control_148
    $P149."handle_types"(58)
    push_eh $P149
    .lex "self", self
    .return (0)
  control_148:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P150, exception, "payload"
    .return ($P150)
.end


.namespace ["Exception";"Severity"]
.sub "WARNING"  :subid("26_1268405401.2777") :method :outer("24_1268405401.2777")
# .annotate "line", 53
    new $P153, 'ExceptionHandler'
    set_addr $P153, control_152
    $P153."handle_types"(58)
    push_eh $P153
    .lex "self", self
    .return (1)
  control_152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P154, exception, "payload"
    .return ($P154)
.end


.namespace ["Exception";"Severity"]
.sub "ERROR"  :subid("27_1268405401.2777") :method :outer("24_1268405401.2777")
# .annotate "line", 54
    new $P157, 'ExceptionHandler'
    set_addr $P157, control_156
    $P157."handle_types"(58)
    push_eh $P157
    .lex "self", self
    .return (2)
  control_156:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P158, exception, "payload"
    .return ($P158)
.end


.namespace ["Exception";"Severity"]
.sub "SEVERE"  :subid("28_1268405401.2777") :method :outer("24_1268405401.2777")
# .annotate "line", 55
    new $P161, 'ExceptionHandler'
    set_addr $P161, control_160
    $P161."handle_types"(58)
    push_eh $P161
    .lex "self", self
    .return (3)
  control_160:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P162, exception, "payload"
    .return ($P162)
.end


.namespace ["Exception";"Severity"]
.sub "FATAL"  :subid("29_1268405401.2777") :method :outer("24_1268405401.2777")
# .annotate "line", 56
    new $P165, 'ExceptionHandler'
    set_addr $P165, control_164
    $P165."handle_types"(58)
    push_eh $P165
    .lex "self", self
    .return (4)
  control_164:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P166, exception, "payload"
    .return ($P166)
.end


.namespace ["Exception";"Severity"]
.sub "DOOMED"  :subid("30_1268405401.2777") :method :outer("24_1268405401.2777")
# .annotate "line", 57
    new $P169, 'ExceptionHandler'
    set_addr $P169, control_168
    $P169."handle_types"(58)
    push_eh $P169
    .lex "self", self
    .return (5)
  control_168:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P170, exception, "payload"
    .return ($P170)
.end


.namespace ["Exception";"Severity"]
.sub "EXIT"  :subid("31_1268405401.2777") :method :outer("24_1268405401.2777")
# .annotate "line", 58
    new $P173, 'ExceptionHandler'
    set_addr $P173, control_172
    $P173."handle_types"(58)
    push_eh $P173
    .lex "self", self
    .return (6)
  control_172:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P174, exception, "payload"
    .return ($P174)
.end


.namespace ["Exception";"Wrapper"]
.sub "_block175"  :subid("32_1268405401.2777") :outer("11_1268405401.2777")
# .annotate "line", 66
    .const 'Sub' $P314 = "44_1268405401.2777" 
    capture_lex $P314
    .const 'Sub' $P307 = "43_1268405401.2777" 
    capture_lex $P307
    .const 'Sub' $P301 = "42_1268405401.2777" 
    capture_lex $P301
    .const 'Sub' $P294 = "41_1268405401.2777" 
    capture_lex $P294
    .const 'Sub' $P247 = "39_1268405401.2777" 
    capture_lex $P247
    .const 'Sub' $P238 = "38_1268405401.2777" 
    capture_lex $P238
    .const 'Sub' $P229 = "37_1268405401.2777" 
    capture_lex $P229
    .const 'Sub' $P220 = "36_1268405401.2777" 
    capture_lex $P220
    .const 'Sub' $P211 = "35_1268405401.2777" 
    capture_lex $P211
    .const 'Sub' $P193 = "34_1268405401.2777" 
    capture_lex $P193
    .const 'Sub' $P177 = "33_1268405401.2777" 
    capture_lex $P177
# .annotate "line", 118
    .const 'Sub' $P314 = "44_1268405401.2777" 
    capture_lex $P314
# .annotate "line", 66
    .return ($P314)
.end


.namespace ["Exception";"Wrapper"]
.sub "" :load :init :subid("post49") :outer("32_1268405401.2777")
# .annotate "line", 66
    get_hll_global $P176, ["Exception";"Wrapper"], "_block175" 
    .local pmc block
    set block, $P176
# .annotate "line", 68
    get_hll_global $P330, "P6metaclass"
    get_hll_global $P331, ["Exception"], "Wrapper"
    $P330."add_attribute"($P331, "$!exception")
.end


.namespace ["Exception";"Wrapper"]
.sub "create_exception"  :subid("33_1268405401.2777") :method :outer("32_1268405401.2777")
# .annotate "line", 71
    new $P179, 'ExceptionHandler'
    set_addr $P179, control_178
    $P179."handle_types"(58)
    push_eh $P179
    .lex "self", self
# .annotate "line", 73
    new $P180, "Undef"
    .lex "$e", $P180
    get_hll_global $P181, "Exception"
    $P182 = $P181."new"()
    store_lex "$e", $P182
# .annotate "line", 74
    find_lex $P183, "$e"
    find_lex $P184, "self"
    $P185 = $P184."type"()
    $P183."type"($P185)
# .annotate "line", 75
    find_lex $P186, "$e"
    find_lex $P187, "self"
    $P188 = $P187."severity"()
    $P186."severity"($P188)
# .annotate "line", 76
    find_lex $P189, "self"
    find_lex $P190, "$e"
    $P191 = $P189."exception"($P190)
# .annotate "line", 71
    .return ($P191)
  control_178:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P192, exception, "payload"
    .return ($P192)
.end


.namespace ["Exception";"Wrapper"]
.sub "exception"  :subid("34_1268405401.2777") :method :outer("32_1268405401.2777")
    .param pmc param_196 :slurpy
# .annotate "line", 79
    new $P195, 'ExceptionHandler'
    set_addr $P195, control_194
    $P195."handle_types"(58)
    push_eh $P195
    .lex "self", self
    .lex "@value", param_196
# .annotate "line", 80
    find_lex $P199, "@value"
    if $P199, if_198
# .annotate "line", 85
    find_lex $P206, "self"
    new $P207, "String"
    assign $P207, "$!exception"
    set $S208, $P207
    getattribute $P209, $P206, $S208
# .annotate "line", 84
    set $P197, $P209
# .annotate "line", 80
    goto if_198_end
  if_198:
# .annotate "line", 81
    find_lex $P200, "self"
    new $P201, "String"
    assign $P201, "$!exception"
    set $S202, $P201
    find_lex $P203, "@value"
    unless_null $P203, vivify_50
    new $P203, "ResizablePMCArray"
  vivify_50:
    set $P204, $P203[0]
    unless_null $P204, vivify_51
    new $P204, "Undef"
  vivify_51:
    setattribute $P200, $S202, $P204
    find_lex $P205, "self"
# .annotate "line", 80
    set $P197, $P205
  if_198_end:
# .annotate "line", 79
    .return ($P197)
  control_194:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P210, exception, "payload"
    .return ($P210)
.end


.namespace ["Exception";"Wrapper"]
.sub "exit_code"  :subid("35_1268405401.2777") :method :outer("32_1268405401.2777")
    .param pmc param_214 :slurpy
# .annotate "line", 89
    new $P213, 'ExceptionHandler'
    set_addr $P213, control_212
    $P213."handle_types"(58)
    push_eh $P213
    .lex "self", self
    .lex "@value", param_214
    find_lex $P215, "self"
    $P216 = $P215."exception"()
    find_lex $P217, "@value"
    $P218 = $P216."_attr"("exit_code", $P217)
    .return ($P218)
  control_212:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P219, exception, "payload"
    .return ($P219)
.end


.namespace ["Exception";"Wrapper"]
.sub "handled"  :subid("36_1268405401.2777") :method :outer("32_1268405401.2777")
    .param pmc param_223 :slurpy
# .annotate "line", 90
    new $P222, 'ExceptionHandler'
    set_addr $P222, control_221
    $P222."handle_types"(58)
    push_eh $P222
    .lex "self", self
    .lex "@value", param_223
    find_lex $P224, "self"
    $P225 = $P224."exception"()
    find_lex $P226, "@value"
    $P227 = $P225."_attr"("handled", $P226)
    .return ($P227)
  control_221:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P228, exception, "payload"
    .return ($P228)
.end


.namespace ["Exception";"Wrapper"]
.sub "message"  :subid("37_1268405401.2777") :method :outer("32_1268405401.2777")
    .param pmc param_232 :slurpy
# .annotate "line", 91
    new $P231, 'ExceptionHandler'
    set_addr $P231, control_230
    $P231."handle_types"(58)
    push_eh $P231
    .lex "self", self
    .lex "@value", param_232
    find_lex $P233, "self"
    $P234 = $P233."exception"()
    find_lex $P235, "@value"
    $P236 = $P234."_attr"("message", $P235)
    .return ($P236)
  control_230:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P237, exception, "payload"
    .return ($P237)
.end


.namespace ["Exception";"Wrapper"]
.sub "payload"  :subid("38_1268405401.2777") :method :outer("32_1268405401.2777")
    .param pmc param_241 :slurpy
# .annotate "line", 92
    new $P240, 'ExceptionHandler'
    set_addr $P240, control_239
    $P240."handle_types"(58)
    push_eh $P240
    .lex "self", self
    .lex "@value", param_241
    find_lex $P242, "self"
    $P243 = $P242."exception"()
    find_lex $P244, "@value"
    $P245 = $P243."_attr"("payload", $P244)
    .return ($P245)
  control_239:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P246, exception, "payload"
    .return ($P246)
.end


.namespace ["Exception";"Wrapper"]
.sub "new"  :subid("39_1268405401.2777") :method :outer("32_1268405401.2777")
    .param pmc param_250 :slurpy
    .param pmc param_251 :slurpy :named
# .annotate "line", 94
    .const 'Sub' $P266 = "40_1268405401.2777" 
    capture_lex $P266
    new $P249, 'ExceptionHandler'
    set_addr $P249, control_248
    $P249."handle_types"(58)
    push_eh $P249
    .lex "self", self
    .lex "@pos", param_250
    .lex "%named", param_251
# .annotate "line", 95
    new $P252, "Undef"
    .lex "$class", $P252
# .annotate "line", 96
    new $P253, "Undef"
    .lex "$new_object", $P253
# .annotate "line", 95
    get_hll_global $P254, ["Opcode"], "getattribute"
    find_lex $P255, "self"
    $P256 = $P255."HOW"()
    $P257 = $P254($P256, "parrotclass")
    store_lex "$class", $P257
# .annotate "line", 96
    find_lex $P258, "$class"
    new $P259, $P258
    store_lex "$new_object", $P259
# .annotate "line", 98
    find_lex $P260, "$new_object"
    $P260."create_exception"()
# .annotate "line", 100
    find_lex $P262, "%named"
    defined $I263, $P262
    unless $I263, for_undef_52
    iter $P261, $P262
    new $P290, 'ExceptionHandler'
    set_addr $P290, loop289_handler
    $P290."handle_types"(65, 67, 66)
    push_eh $P290
  loop289_test:
    unless $P261, loop289_done
    shift $P264, $P261
  loop289_redo:
    .const 'Sub' $P266 = "40_1268405401.2777" 
    capture_lex $P266
    $P266($P264)
  loop289_next:
    goto loop289_test
  loop289_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P291, exception, 'type'
    eq $P291, 65, loop289_next
    eq $P291, 67, loop289_redo
  loop289_done:
    pop_eh 
  for_undef_52:
    find_lex $P292, "$new_object"
# .annotate "line", 94
    .return ($P292)
  control_248:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P293, exception, "payload"
    .return ($P293)
.end


.namespace ["Exception";"Wrapper"]
.sub "_block265"  :anon :subid("40_1268405401.2777") :outer("39_1268405401.2777")
    .param pmc param_268
# .annotate "line", 101
    new $P267, "Undef"
    .lex "$name", $P267
    .lex "$_", param_268
    find_lex $P269, "$_"
    set $S270, $P269
    new $P271, 'String'
    set $P271, $S270
    store_lex "$name", $P271
# .annotate "line", 103
    get_hll_global $P274, ["Opcode"], "can"
    find_lex $P275, "$new_object"
    find_lex $P276, "$name"
    $P277 = $P274($P275, $P276)
    if $P277, if_273
# .annotate "line", 107
    new $P285, 'String'
    set $P285, "No accessor defined for attribute '"
    find_lex $P286, "$name"
    concat $P287, $P285, $P286
    concat $P288, $P287, "'."
    die $P288
# .annotate "line", 106
    goto if_273_end
  if_273:
# .annotate "line", 104
    get_hll_global $P278, ["Parrot"], "call_method"
    find_lex $P279, "$new_object"
    find_lex $P280, "$name"
    find_lex $P281, "$name"
    find_lex $P282, "%named"
    unless_null $P282, vivify_53
    new $P282, "Hash"
  vivify_53:
    set $P283, $P282[$P281]
    unless_null $P283, vivify_54
    new $P283, "Undef"
  vivify_54:
    $P284 = $P278($P279, $P280, $P283)
# .annotate "line", 103
    set $P272, $P284
  if_273_end:
# .annotate "line", 100
    .return ($P272)
.end


.namespace ["Exception";"Wrapper"]
.sub "rethrow"  :subid("41_1268405401.2777") :method :outer("32_1268405401.2777")
# .annotate "line", 114
    new $P296, 'ExceptionHandler'
    set_addr $P296, control_295
    $P296."handle_types"(58)
    push_eh $P296
    .lex "self", self
    find_lex $P297, "self"
    $P298 = $P297."exception"()
    $P299 = $P298."rethrow"()
    .return ($P299)
  control_295:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P300, exception, "payload"
    .return ($P300)
.end


.namespace ["Exception";"Wrapper"]
.sub "severity"  :subid("42_1268405401.2777") :method :outer("32_1268405401.2777")
# .annotate "line", 115
    new $P303, 'ExceptionHandler'
    set_addr $P303, control_302
    $P303."handle_types"(58)
    push_eh $P303
    .lex "self", self
    get_hll_global $P304, ["Exception"], "Severity"
    $P305 = $P304."SEVERE"()
    .return ($P305)
  control_302:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P306, exception, "payload"
    .return ($P306)
.end


.namespace ["Exception";"Wrapper"]
.sub "throw"  :subid("43_1268405401.2777") :method :outer("32_1268405401.2777")
# .annotate "line", 116
    new $P309, 'ExceptionHandler'
    set_addr $P309, control_308
    $P309."handle_types"(58)
    push_eh $P309
    .lex "self", self
    find_lex $P310, "self"
    $P311 = $P310."exception"()
    $P312 = $P311."throw"()
    .return ($P312)
  control_308:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P313, exception, "payload"
    .return ($P313)
.end


.namespace ["Exception";"Wrapper"]
.sub "type"  :subid("44_1268405401.2777") :method :outer("32_1268405401.2777")
# .annotate "line", 118
    new $P316, 'ExceptionHandler'
    set_addr $P316, control_315
    $P316."handle_types"(58)
    push_eh $P316
    .lex "self", self
# .annotate "line", 119
    new $P317, "Undef"
    .lex "$class", $P317
# .annotate "line", 120
    new $P318, "Undef"
    .lex "$type", $P318
# .annotate "line", 119
    get_hll_global $P319, "P6metaclass"
    find_lex $P320, "self"
    $P321 = $P319."get_parrotclass"($P320)
    store_lex "$class", $P321
# .annotate "line", 120
    find_lex $P322, "$class"
    new $P323, "String"
    assign $P323, "id"
    set $S324, $P323
    inspect $P325, $P322, $S324
    store_lex "$type", $P325
# .annotate "line", 121
    new $P326, "Exception"
    set $P326['type'], 58
    find_lex $P327, "$type"
    add $P328, $P327, 2000
    setattribute $P326, 'payload', $P328
    throw $P326
# .annotate "line", 118
    .return ()
  control_315:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P329, exception, "payload"
    .return ($P329)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268405319.95648")
# .annotate "line", 0
    get_hll_global $P422, ["Exception";"AbstractMethodCalled"], "_block421" 
    capture_lex $P422
    get_hll_global $P416, ["Control";"LoopRedo"], "_block415" 
    capture_lex $P416
    get_hll_global $P410, ["Control";"LoopLast"], "_block409" 
    capture_lex $P410
    get_hll_global $P404, ["Control";"LoopNext"], "_block403" 
    capture_lex $P404
    get_hll_global $P398, ["Control";"Leave"], "_block397" 
    capture_lex $P398
    get_hll_global $P392, ["Control";"Take"], "_block391" 
    capture_lex $P392
    get_hll_global $P386, ["Control";"Error"], "_block385" 
    capture_lex $P386
    get_hll_global $P380, ["Control";"Continue"], "_block379" 
    capture_lex $P380
    get_hll_global $P374, ["Control";"Break"], "_block373" 
    capture_lex $P374
    get_hll_global $P368, ["Control";"Ok"], "_block367" 
    capture_lex $P368
    get_hll_global $P362, ["Control";"Return"], "_block361" 
    capture_lex $P362
    get_hll_global $P356, ["Exception";"MalformedPackfile"], "_block355" 
    capture_lex $P356
    get_hll_global $P350, ["Exception";"SyntaxError"], "_block349" 
    capture_lex $P350
    get_hll_global $P344, ["Exception";"LibraryNotLoaded"], "_block343" 
    capture_lex $P344
    get_hll_global $P338, ["Exception";"LibraryError"], "_block337" 
    capture_lex $P338
    get_hll_global $P332, ["Exception";"UnexpectedNull"], "_block331" 
    capture_lex $P332
    get_hll_global $P326, ["Exception";"RoleCompositionMethodConflict"], "_block325" 
    capture_lex $P326
    get_hll_global $P320, ["Exception";"LossyConversion"], "_block319" 
    capture_lex $P320
    get_hll_global $P314, ["Exception";"ErrOverflow"], "_block313" 
    capture_lex $P314
    get_hll_global $P308, ["Exception";"InternalNotImplemented"], "_block307" 
    capture_lex $P308
    get_hll_global $P302, ["Exception";"Nospawn"], "_block301" 
    capture_lex $P302
    get_hll_global $P296, ["Exception";"WriteToConstclass"], "_block295" 
    capture_lex $P296
    get_hll_global $P290, ["Exception";"VtableNotFound"], "_block289" 
    capture_lex $P290
    get_hll_global $P284, ["Exception";"MethodNotFound"], "_block283" 
    capture_lex $P284
    get_hll_global $P278, ["Exception";"ExternalError"], "_block277" 
    capture_lex $P278
    get_hll_global $P272, ["Exception";"GlobalNotFound"], "_block271" 
    capture_lex $P272
    get_hll_global $P266, ["Exception";"AttribNotFound"], "_block265" 
    capture_lex $P266
    get_hll_global $P260, ["Exception";"PadNotFound"], "_block259" 
    capture_lex $P260
    get_hll_global $P254, ["Exception";"LexNotFound"], "_block253" 
    capture_lex $P254
    get_hll_global $P248, ["Exception";"NoClass"], "_block247" 
    capture_lex $P248
    get_hll_global $P242, ["Exception";"NoPrevCs"], "_block241" 
    capture_lex $P242
    get_hll_global $P236, ["Exception";"IllInherit"], "_block235" 
    capture_lex $P236
    get_hll_global $P230, ["Exception";"ExecError"], "_block229" 
    capture_lex $P230
    get_hll_global $P224, ["Exception";"JitError"], "_block223" 
    capture_lex $P224
    get_hll_global $P218, ["Exception";"OutOfBounds"], "_block217" 
    capture_lex $P218
    get_hll_global $P212, ["Exception";"InternalPanic"], "_block211" 
    capture_lex $P212
    get_hll_global $P206, ["Exception";"AllocationError"], "_block205" 
    capture_lex $P206
    get_hll_global $P200, ["Exception";"PioNotImplemented"], "_block199" 
    capture_lex $P200
    get_hll_global $P194, ["Exception";"DivByZero"], "_block193" 
    capture_lex $P194
    get_hll_global $P188, ["Exception";"ParrotPointerError"], "_block187" 
    capture_lex $P188
    get_hll_global $P182, ["Exception";"PioError"], "_block181" 
    capture_lex $P182
    get_hll_global $P176, ["Exception";"ParrotUsageError"], "_block175" 
    capture_lex $P176
    get_hll_global $P170, ["Exception";"PrederefLoadError"], "_block169" 
    capture_lex $P170
    get_hll_global $P164, ["Exception";"InterpError"], "_block163" 
    capture_lex $P164
    get_hll_global $P158, ["Exception";"ExecUnavailable"], "_block157" 
    capture_lex $P158
    get_hll_global $P152, ["Exception";"JitUnavailable"], "_block151" 
    capture_lex $P152
    get_hll_global $P146, ["Exception";"KeyNotFound"], "_block145" 
    capture_lex $P146
    get_hll_global $P140, ["Exception";"ArgOpNotHandled"], "_block139" 
    capture_lex $P140
    get_hll_global $P134, ["Exception";"InvalidOperation"], "_block133" 
    capture_lex $P134
    get_hll_global $P128, ["Exception";"NegChop"], "_block127" 
    capture_lex $P128
    get_hll_global $P122, ["Exception";"NegSleep"], "_block121" 
    capture_lex $P122
    get_hll_global $P116, ["Exception";"NegSubstr"], "_block115" 
    capture_lex $P116
    get_hll_global $P110, ["Exception";"NegRepeat"], "_block109" 
    capture_lex $P110
    get_hll_global $P104, ["Exception";"InvalidCharclass"], "_block103" 
    capture_lex $P104
    get_hll_global $P98, ["Exception";"InvalidEncoding"], "_block97" 
    capture_lex $P98
    get_hll_global $P92, ["Exception";"InvalidChartype"], "_block91" 
    capture_lex $P92
    get_hll_global $P86, ["Exception";"InvalidCharacter"], "_block85" 
    capture_lex $P86
    get_hll_global $P80, ["Exception";"MalformedUtf32"], "_block79" 
    capture_lex $P80
    get_hll_global $P74, ["Exception";"MalformedUtf16"], "_block73" 
    capture_lex $P74
    get_hll_global $P68, ["Exception";"MalformedUtf8"], "_block67" 
    capture_lex $P68
    get_hll_global $P62, ["Exception";"OrdOutOfString"], "_block61" 
    capture_lex $P62
    get_hll_global $P56, ["Exception";"SubstrOutOfString"], "_block55" 
    capture_lex $P56
    get_hll_global $P50, ["Exception";"NoRegFrames"], "_block49" 
    capture_lex $P50
    get_hll_global $P44, ["Exception";"NullRegAccess"], "_block43" 
    capture_lex $P44
    get_hll_global $P38, ["Exception";"Unimplemented"], "_block37" 
    capture_lex $P38
    get_hll_global $P32, ["Exception";"IcuError"], "_block31" 
    capture_lex $P32
    get_hll_global $P26, ["Exception";"InvalidStringRepresentation"], "_block25" 
    capture_lex $P26
    get_hll_global $P20, ["Exception";"MissingEncodingName"], "_block19" 
    capture_lex $P20
    get_hll_global $P14, ["Exception";"BadBufferSize"], "_block13" 
    capture_lex $P14
# .annotate "line", 9
    get_hll_global $P14, ["Exception";"BadBufferSize"], "_block13" 
    capture_lex $P14
    $P14()
# .annotate "line", 13
    get_hll_global $P20, ["Exception";"MissingEncodingName"], "_block19" 
    capture_lex $P20
    $P20()
# .annotate "line", 17
    get_hll_global $P26, ["Exception";"InvalidStringRepresentation"], "_block25" 
    capture_lex $P26
    $P26()
# .annotate "line", 21
    get_hll_global $P32, ["Exception";"IcuError"], "_block31" 
    capture_lex $P32
    $P32()
# .annotate "line", 25
    get_hll_global $P38, ["Exception";"Unimplemented"], "_block37" 
    capture_lex $P38
    $P38()
# .annotate "line", 29
    get_hll_global $P44, ["Exception";"NullRegAccess"], "_block43" 
    capture_lex $P44
    $P44()
# .annotate "line", 33
    get_hll_global $P50, ["Exception";"NoRegFrames"], "_block49" 
    capture_lex $P50
    $P50()
# .annotate "line", 37
    get_hll_global $P56, ["Exception";"SubstrOutOfString"], "_block55" 
    capture_lex $P56
    $P56()
# .annotate "line", 41
    get_hll_global $P62, ["Exception";"OrdOutOfString"], "_block61" 
    capture_lex $P62
    $P62()
# .annotate "line", 45
    get_hll_global $P68, ["Exception";"MalformedUtf8"], "_block67" 
    capture_lex $P68
    $P68()
# .annotate "line", 49
    get_hll_global $P74, ["Exception";"MalformedUtf16"], "_block73" 
    capture_lex $P74
    $P74()
# .annotate "line", 53
    get_hll_global $P80, ["Exception";"MalformedUtf32"], "_block79" 
    capture_lex $P80
    $P80()
# .annotate "line", 57
    get_hll_global $P86, ["Exception";"InvalidCharacter"], "_block85" 
    capture_lex $P86
    $P86()
# .annotate "line", 61
    get_hll_global $P92, ["Exception";"InvalidChartype"], "_block91" 
    capture_lex $P92
    $P92()
# .annotate "line", 65
    get_hll_global $P98, ["Exception";"InvalidEncoding"], "_block97" 
    capture_lex $P98
    $P98()
# .annotate "line", 69
    get_hll_global $P104, ["Exception";"InvalidCharclass"], "_block103" 
    capture_lex $P104
    $P104()
# .annotate "line", 73
    get_hll_global $P110, ["Exception";"NegRepeat"], "_block109" 
    capture_lex $P110
    $P110()
# .annotate "line", 77
    get_hll_global $P116, ["Exception";"NegSubstr"], "_block115" 
    capture_lex $P116
    $P116()
# .annotate "line", 81
    get_hll_global $P122, ["Exception";"NegSleep"], "_block121" 
    capture_lex $P122
    $P122()
# .annotate "line", 85
    get_hll_global $P128, ["Exception";"NegChop"], "_block127" 
    capture_lex $P128
    $P128()
# .annotate "line", 89
    get_hll_global $P134, ["Exception";"InvalidOperation"], "_block133" 
    capture_lex $P134
    $P134()
# .annotate "line", 93
    get_hll_global $P140, ["Exception";"ArgOpNotHandled"], "_block139" 
    capture_lex $P140
    $P140()
# .annotate "line", 97
    get_hll_global $P146, ["Exception";"KeyNotFound"], "_block145" 
    capture_lex $P146
    $P146()
# .annotate "line", 101
    get_hll_global $P152, ["Exception";"JitUnavailable"], "_block151" 
    capture_lex $P152
    $P152()
# .annotate "line", 105
    get_hll_global $P158, ["Exception";"ExecUnavailable"], "_block157" 
    capture_lex $P158
    $P158()
# .annotate "line", 109
    get_hll_global $P164, ["Exception";"InterpError"], "_block163" 
    capture_lex $P164
    $P164()
# .annotate "line", 113
    get_hll_global $P170, ["Exception";"PrederefLoadError"], "_block169" 
    capture_lex $P170
    $P170()
# .annotate "line", 117
    get_hll_global $P176, ["Exception";"ParrotUsageError"], "_block175" 
    capture_lex $P176
    $P176()
# .annotate "line", 121
    get_hll_global $P182, ["Exception";"PioError"], "_block181" 
    capture_lex $P182
    $P182()
# .annotate "line", 125
    get_hll_global $P188, ["Exception";"ParrotPointerError"], "_block187" 
    capture_lex $P188
    $P188()
# .annotate "line", 129
    get_hll_global $P194, ["Exception";"DivByZero"], "_block193" 
    capture_lex $P194
    $P194()
# .annotate "line", 133
    get_hll_global $P200, ["Exception";"PioNotImplemented"], "_block199" 
    capture_lex $P200
    $P200()
# .annotate "line", 137
    get_hll_global $P206, ["Exception";"AllocationError"], "_block205" 
    capture_lex $P206
    $P206()
# .annotate "line", 141
    get_hll_global $P212, ["Exception";"InternalPanic"], "_block211" 
    capture_lex $P212
    $P212()
# .annotate "line", 145
    get_hll_global $P218, ["Exception";"OutOfBounds"], "_block217" 
    capture_lex $P218
    $P218()
# .annotate "line", 149
    get_hll_global $P224, ["Exception";"JitError"], "_block223" 
    capture_lex $P224
    $P224()
# .annotate "line", 153
    get_hll_global $P230, ["Exception";"ExecError"], "_block229" 
    capture_lex $P230
    $P230()
# .annotate "line", 157
    get_hll_global $P236, ["Exception";"IllInherit"], "_block235" 
    capture_lex $P236
    $P236()
# .annotate "line", 161
    get_hll_global $P242, ["Exception";"NoPrevCs"], "_block241" 
    capture_lex $P242
    $P242()
# .annotate "line", 165
    get_hll_global $P248, ["Exception";"NoClass"], "_block247" 
    capture_lex $P248
    $P248()
# .annotate "line", 169
    get_hll_global $P254, ["Exception";"LexNotFound"], "_block253" 
    capture_lex $P254
    $P254()
# .annotate "line", 173
    get_hll_global $P260, ["Exception";"PadNotFound"], "_block259" 
    capture_lex $P260
    $P260()
# .annotate "line", 177
    get_hll_global $P266, ["Exception";"AttribNotFound"], "_block265" 
    capture_lex $P266
    $P266()
# .annotate "line", 181
    get_hll_global $P272, ["Exception";"GlobalNotFound"], "_block271" 
    capture_lex $P272
    $P272()
# .annotate "line", 185
    get_hll_global $P278, ["Exception";"ExternalError"], "_block277" 
    capture_lex $P278
    $P278()
# .annotate "line", 189
    get_hll_global $P284, ["Exception";"MethodNotFound"], "_block283" 
    capture_lex $P284
    $P284()
# .annotate "line", 193
    get_hll_global $P290, ["Exception";"VtableNotFound"], "_block289" 
    capture_lex $P290
    $P290()
# .annotate "line", 197
    get_hll_global $P296, ["Exception";"WriteToConstclass"], "_block295" 
    capture_lex $P296
    $P296()
# .annotate "line", 201
    get_hll_global $P302, ["Exception";"Nospawn"], "_block301" 
    capture_lex $P302
    $P302()
# .annotate "line", 205
    get_hll_global $P308, ["Exception";"InternalNotImplemented"], "_block307" 
    capture_lex $P308
    $P308()
# .annotate "line", 209
    get_hll_global $P314, ["Exception";"ErrOverflow"], "_block313" 
    capture_lex $P314
    $P314()
# .annotate "line", 213
    get_hll_global $P320, ["Exception";"LossyConversion"], "_block319" 
    capture_lex $P320
    $P320()
# .annotate "line", 217
    get_hll_global $P326, ["Exception";"RoleCompositionMethodConflict"], "_block325" 
    capture_lex $P326
    $P326()
# .annotate "line", 221
    get_hll_global $P332, ["Exception";"UnexpectedNull"], "_block331" 
    capture_lex $P332
    $P332()
# .annotate "line", 225
    get_hll_global $P338, ["Exception";"LibraryError"], "_block337" 
    capture_lex $P338
    $P338()
# .annotate "line", 229
    get_hll_global $P344, ["Exception";"LibraryNotLoaded"], "_block343" 
    capture_lex $P344
    $P344()
# .annotate "line", 233
    get_hll_global $P350, ["Exception";"SyntaxError"], "_block349" 
    capture_lex $P350
    $P350()
# .annotate "line", 237
    get_hll_global $P356, ["Exception";"MalformedPackfile"], "_block355" 
    capture_lex $P356
    $P356()
# .annotate "line", 241
    get_hll_global $P362, ["Control";"Return"], "_block361" 
    capture_lex $P362
    $P362()
# .annotate "line", 245
    get_hll_global $P368, ["Control";"Ok"], "_block367" 
    capture_lex $P368
    $P368()
# .annotate "line", 249
    get_hll_global $P374, ["Control";"Break"], "_block373" 
    capture_lex $P374
    $P374()
# .annotate "line", 253
    get_hll_global $P380, ["Control";"Continue"], "_block379" 
    capture_lex $P380
    $P380()
# .annotate "line", 257
    get_hll_global $P386, ["Control";"Error"], "_block385" 
    capture_lex $P386
    $P386()
# .annotate "line", 261
    get_hll_global $P392, ["Control";"Take"], "_block391" 
    capture_lex $P392
    $P392()
# .annotate "line", 265
    get_hll_global $P398, ["Control";"Leave"], "_block397" 
    capture_lex $P398
    $P398()
# .annotate "line", 269
    get_hll_global $P404, ["Control";"LoopNext"], "_block403" 
    capture_lex $P404
    $P404()
# .annotate "line", 273
    get_hll_global $P410, ["Control";"LoopLast"], "_block409" 
    capture_lex $P410
    $P410()
# .annotate "line", 277
    get_hll_global $P416, ["Control";"LoopRedo"], "_block415" 
    capture_lex $P416
    $P416()
# .annotate "line", 285
    get_hll_global $P422, ["Exception";"AbstractMethodCalled"], "_block421" 
    capture_lex $P422
    $P427 = $P422()
# .annotate "line", 1
    .return ($P427)
.end


.namespace []
.sub "" :load :init :subid("post149") :outer("10_1268405319.95648")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268405319.95648" 
    .local pmc block
    set block, $P12
    $P428 = get_root_global ["parrot"], "P6metaclass"
    $P428."new_class"("Exception::BadBufferSize", "Exception::Wrapper" :named("parent"))
    $P429 = get_root_global ["parrot"], "P6metaclass"
    $P429."new_class"("Exception::MissingEncodingName", "Exception::Wrapper" :named("parent"))
    $P430 = get_root_global ["parrot"], "P6metaclass"
    $P430."new_class"("Exception::InvalidStringRepresentation", "Exception::Wrapper" :named("parent"))
    $P431 = get_root_global ["parrot"], "P6metaclass"
    $P431."new_class"("Exception::IcuError", "Exception::Wrapper" :named("parent"))
    $P432 = get_root_global ["parrot"], "P6metaclass"
    $P432."new_class"("Exception::Unimplemented", "Exception::Wrapper" :named("parent"))
    $P433 = get_root_global ["parrot"], "P6metaclass"
    $P433."new_class"("Exception::NullRegAccess", "Exception::Wrapper" :named("parent"))
    $P434 = get_root_global ["parrot"], "P6metaclass"
    $P434."new_class"("Exception::NoRegFrames", "Exception::Wrapper" :named("parent"))
    $P435 = get_root_global ["parrot"], "P6metaclass"
    $P435."new_class"("Exception::SubstrOutOfString", "Exception::Wrapper" :named("parent"))
    $P436 = get_root_global ["parrot"], "P6metaclass"
    $P436."new_class"("Exception::OrdOutOfString", "Exception::Wrapper" :named("parent"))
    $P437 = get_root_global ["parrot"], "P6metaclass"
    $P437."new_class"("Exception::MalformedUtf8", "Exception::Wrapper" :named("parent"))
    $P438 = get_root_global ["parrot"], "P6metaclass"
    $P438."new_class"("Exception::MalformedUtf16", "Exception::Wrapper" :named("parent"))
    $P439 = get_root_global ["parrot"], "P6metaclass"
    $P439."new_class"("Exception::MalformedUtf32", "Exception::Wrapper" :named("parent"))
    $P440 = get_root_global ["parrot"], "P6metaclass"
    $P440."new_class"("Exception::InvalidCharacter", "Exception::Wrapper" :named("parent"))
    $P441 = get_root_global ["parrot"], "P6metaclass"
    $P441."new_class"("Exception::InvalidChartype", "Exception::Wrapper" :named("parent"))
    $P442 = get_root_global ["parrot"], "P6metaclass"
    $P442."new_class"("Exception::InvalidEncoding", "Exception::Wrapper" :named("parent"))
    $P443 = get_root_global ["parrot"], "P6metaclass"
    $P443."new_class"("Exception::InvalidCharclass", "Exception::Wrapper" :named("parent"))
    $P444 = get_root_global ["parrot"], "P6metaclass"
    $P444."new_class"("Exception::NegRepeat", "Exception::Wrapper" :named("parent"))
    $P445 = get_root_global ["parrot"], "P6metaclass"
    $P445."new_class"("Exception::NegSubstr", "Exception::Wrapper" :named("parent"))
    $P446 = get_root_global ["parrot"], "P6metaclass"
    $P446."new_class"("Exception::NegSleep", "Exception::Wrapper" :named("parent"))
    $P447 = get_root_global ["parrot"], "P6metaclass"
    $P447."new_class"("Exception::NegChop", "Exception::Wrapper" :named("parent"))
    $P448 = get_root_global ["parrot"], "P6metaclass"
    $P448."new_class"("Exception::InvalidOperation", "Exception::Wrapper" :named("parent"))
    $P449 = get_root_global ["parrot"], "P6metaclass"
    $P449."new_class"("Exception::ArgOpNotHandled", "Exception::Wrapper" :named("parent"))
    $P450 = get_root_global ["parrot"], "P6metaclass"
    $P450."new_class"("Exception::KeyNotFound", "Exception::Wrapper" :named("parent"))
    $P451 = get_root_global ["parrot"], "P6metaclass"
    $P451."new_class"("Exception::JitUnavailable", "Exception::Wrapper" :named("parent"))
    $P452 = get_root_global ["parrot"], "P6metaclass"
    $P452."new_class"("Exception::ExecUnavailable", "Exception::Wrapper" :named("parent"))
    $P453 = get_root_global ["parrot"], "P6metaclass"
    $P453."new_class"("Exception::InterpError", "Exception::Wrapper" :named("parent"))
    $P454 = get_root_global ["parrot"], "P6metaclass"
    $P454."new_class"("Exception::PrederefLoadError", "Exception::Wrapper" :named("parent"))
    $P455 = get_root_global ["parrot"], "P6metaclass"
    $P455."new_class"("Exception::ParrotUsageError", "Exception::Wrapper" :named("parent"))
    $P456 = get_root_global ["parrot"], "P6metaclass"
    $P456."new_class"("Exception::PioError", "Exception::Wrapper" :named("parent"))
    $P457 = get_root_global ["parrot"], "P6metaclass"
    $P457."new_class"("Exception::ParrotPointerError", "Exception::Wrapper" :named("parent"))
    $P458 = get_root_global ["parrot"], "P6metaclass"
    $P458."new_class"("Exception::DivByZero", "Exception::Wrapper" :named("parent"))
    $P459 = get_root_global ["parrot"], "P6metaclass"
    $P459."new_class"("Exception::PioNotImplemented", "Exception::Wrapper" :named("parent"))
    $P460 = get_root_global ["parrot"], "P6metaclass"
    $P460."new_class"("Exception::AllocationError", "Exception::Wrapper" :named("parent"))
    $P461 = get_root_global ["parrot"], "P6metaclass"
    $P461."new_class"("Exception::InternalPanic", "Exception::Wrapper" :named("parent"))
    $P462 = get_root_global ["parrot"], "P6metaclass"
    $P462."new_class"("Exception::OutOfBounds", "Exception::Wrapper" :named("parent"))
    $P463 = get_root_global ["parrot"], "P6metaclass"
    $P463."new_class"("Exception::JitError", "Exception::Wrapper" :named("parent"))
    $P464 = get_root_global ["parrot"], "P6metaclass"
    $P464."new_class"("Exception::ExecError", "Exception::Wrapper" :named("parent"))
    $P465 = get_root_global ["parrot"], "P6metaclass"
    $P465."new_class"("Exception::IllInherit", "Exception::Wrapper" :named("parent"))
    $P466 = get_root_global ["parrot"], "P6metaclass"
    $P466."new_class"("Exception::NoPrevCs", "Exception::Wrapper" :named("parent"))
    $P467 = get_root_global ["parrot"], "P6metaclass"
    $P467."new_class"("Exception::NoClass", "Exception::Wrapper" :named("parent"))
    $P468 = get_root_global ["parrot"], "P6metaclass"
    $P468."new_class"("Exception::LexNotFound", "Exception::Wrapper" :named("parent"))
    $P469 = get_root_global ["parrot"], "P6metaclass"
    $P469."new_class"("Exception::PadNotFound", "Exception::Wrapper" :named("parent"))
    $P470 = get_root_global ["parrot"], "P6metaclass"
    $P470."new_class"("Exception::AttribNotFound", "Exception::Wrapper" :named("parent"))
    $P471 = get_root_global ["parrot"], "P6metaclass"
    $P471."new_class"("Exception::GlobalNotFound", "Exception::Wrapper" :named("parent"))
    $P472 = get_root_global ["parrot"], "P6metaclass"
    $P472."new_class"("Exception::ExternalError", "Exception::Wrapper" :named("parent"))
    $P473 = get_root_global ["parrot"], "P6metaclass"
    $P473."new_class"("Exception::MethodNotFound", "Exception::Wrapper" :named("parent"))
    $P474 = get_root_global ["parrot"], "P6metaclass"
    $P474."new_class"("Exception::VtableNotFound", "Exception::Wrapper" :named("parent"))
    $P475 = get_root_global ["parrot"], "P6metaclass"
    $P475."new_class"("Exception::WriteToConstclass", "Exception::Wrapper" :named("parent"))
    $P476 = get_root_global ["parrot"], "P6metaclass"
    $P476."new_class"("Exception::Nospawn", "Exception::Wrapper" :named("parent"))
    $P477 = get_root_global ["parrot"], "P6metaclass"
    $P477."new_class"("Exception::InternalNotImplemented", "Exception::Wrapper" :named("parent"))
    $P478 = get_root_global ["parrot"], "P6metaclass"
    $P478."new_class"("Exception::ErrOverflow", "Exception::Wrapper" :named("parent"))
    $P479 = get_root_global ["parrot"], "P6metaclass"
    $P479."new_class"("Exception::LossyConversion", "Exception::Wrapper" :named("parent"))
    $P480 = get_root_global ["parrot"], "P6metaclass"
    $P480."new_class"("Exception::RoleCompositionMethodConflict", "Exception::Wrapper" :named("parent"))
    $P481 = get_root_global ["parrot"], "P6metaclass"
    $P481."new_class"("Exception::UnexpectedNull", "Exception::Wrapper" :named("parent"))
    $P482 = get_root_global ["parrot"], "P6metaclass"
    $P482."new_class"("Exception::LibraryError", "Exception::Wrapper" :named("parent"))
    $P483 = get_root_global ["parrot"], "P6metaclass"
    $P483."new_class"("Exception::LibraryNotLoaded", "Exception::Wrapper" :named("parent"))
    $P484 = get_root_global ["parrot"], "P6metaclass"
    $P484."new_class"("Exception::SyntaxError", "Exception::Wrapper" :named("parent"))
    $P485 = get_root_global ["parrot"], "P6metaclass"
    $P485."new_class"("Exception::MalformedPackfile", "Exception::Wrapper" :named("parent"))
    $P486 = get_root_global ["parrot"], "P6metaclass"
    $P486."new_class"("Control::Return", "Exception::Wrapper" :named("parent"))
    $P487 = get_root_global ["parrot"], "P6metaclass"
    $P487."new_class"("Control::Ok", "Exception::Wrapper" :named("parent"))
    $P488 = get_root_global ["parrot"], "P6metaclass"
    $P488."new_class"("Control::Break", "Exception::Wrapper" :named("parent"))
    $P489 = get_root_global ["parrot"], "P6metaclass"
    $P489."new_class"("Control::Continue", "Exception::Wrapper" :named("parent"))
    $P490 = get_root_global ["parrot"], "P6metaclass"
    $P490."new_class"("Control::Error", "Exception::Wrapper" :named("parent"))
    $P491 = get_root_global ["parrot"], "P6metaclass"
    $P491."new_class"("Control::Take", "Exception::Wrapper" :named("parent"))
    $P492 = get_root_global ["parrot"], "P6metaclass"
    $P492."new_class"("Control::Leave", "Exception::Wrapper" :named("parent"))
    $P493 = get_root_global ["parrot"], "P6metaclass"
    $P493."new_class"("Control::LoopNext", "Exception::Wrapper" :named("parent"))
    $P494 = get_root_global ["parrot"], "P6metaclass"
    $P494."new_class"("Control::LoopLast", "Exception::Wrapper" :named("parent"))
    $P495 = get_root_global ["parrot"], "P6metaclass"
    $P495."new_class"("Control::LoopRedo", "Exception::Wrapper" :named("parent"))
    $P496 = get_root_global ["parrot"], "P6metaclass"
    $P496."new_class"("Exception::AbstractMethodCalled", "Exception::Wrapper" :named("parent"))
.end


.namespace ["Exception";"BadBufferSize"]
.sub "_block13"  :subid("11_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 9
    .const 'Sub' $P15 = "12_1268405319.95648" 
    capture_lex $P15
# .annotate "line", 10
    .const 'Sub' $P15 = "12_1268405319.95648" 
    capture_lex $P15
# .annotate "line", 9
    .return ($P15)
.end


.namespace ["Exception";"BadBufferSize"]
.sub "type"  :subid("12_1268405319.95648") :method :outer("11_1268405319.95648")
# .annotate "line", 10
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
    .return (0)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P18, exception, "payload"
    .return ($P18)
.end


.namespace ["Exception";"MissingEncodingName"]
.sub "_block19"  :subid("13_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 13
    .const 'Sub' $P21 = "14_1268405319.95648" 
    capture_lex $P21
# .annotate "line", 14
    .const 'Sub' $P21 = "14_1268405319.95648" 
    capture_lex $P21
# .annotate "line", 13
    .return ($P21)
.end


.namespace ["Exception";"MissingEncodingName"]
.sub "type"  :subid("14_1268405319.95648") :method :outer("13_1268405319.95648")
# .annotate "line", 14
    new $P23, 'ExceptionHandler'
    set_addr $P23, control_22
    $P23."handle_types"(58)
    push_eh $P23
    .lex "self", self
    .return (1)
  control_22:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P24, exception, "payload"
    .return ($P24)
.end


.namespace ["Exception";"InvalidStringRepresentation"]
.sub "_block25"  :subid("15_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 17
    .const 'Sub' $P27 = "16_1268405319.95648" 
    capture_lex $P27
# .annotate "line", 18
    .const 'Sub' $P27 = "16_1268405319.95648" 
    capture_lex $P27
# .annotate "line", 17
    .return ($P27)
.end


.namespace ["Exception";"InvalidStringRepresentation"]
.sub "type"  :subid("16_1268405319.95648") :method :outer("15_1268405319.95648")
# .annotate "line", 18
    new $P29, 'ExceptionHandler'
    set_addr $P29, control_28
    $P29."handle_types"(58)
    push_eh $P29
    .lex "self", self
    .return (2)
  control_28:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P30, exception, "payload"
    .return ($P30)
.end


.namespace ["Exception";"IcuError"]
.sub "_block31"  :subid("17_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 21
    .const 'Sub' $P33 = "18_1268405319.95648" 
    capture_lex $P33
# .annotate "line", 22
    .const 'Sub' $P33 = "18_1268405319.95648" 
    capture_lex $P33
# .annotate "line", 21
    .return ($P33)
.end


.namespace ["Exception";"IcuError"]
.sub "type"  :subid("18_1268405319.95648") :method :outer("17_1268405319.95648")
# .annotate "line", 22
    new $P35, 'ExceptionHandler'
    set_addr $P35, control_34
    $P35."handle_types"(58)
    push_eh $P35
    .lex "self", self
    .return (3)
  control_34:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P36, exception, "payload"
    .return ($P36)
.end


.namespace ["Exception";"Unimplemented"]
.sub "_block37"  :subid("19_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 25
    .const 'Sub' $P39 = "20_1268405319.95648" 
    capture_lex $P39
# .annotate "line", 26
    .const 'Sub' $P39 = "20_1268405319.95648" 
    capture_lex $P39
# .annotate "line", 25
    .return ($P39)
.end


.namespace ["Exception";"Unimplemented"]
.sub "type"  :subid("20_1268405319.95648") :method :outer("19_1268405319.95648")
# .annotate "line", 26
    new $P41, 'ExceptionHandler'
    set_addr $P41, control_40
    $P41."handle_types"(58)
    push_eh $P41
    .lex "self", self
    .return (4)
  control_40:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P42, exception, "payload"
    .return ($P42)
.end


.namespace ["Exception";"NullRegAccess"]
.sub "_block43"  :subid("21_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 29
    .const 'Sub' $P45 = "22_1268405319.95648" 
    capture_lex $P45
# .annotate "line", 30
    .const 'Sub' $P45 = "22_1268405319.95648" 
    capture_lex $P45
# .annotate "line", 29
    .return ($P45)
.end


.namespace ["Exception";"NullRegAccess"]
.sub "type"  :subid("22_1268405319.95648") :method :outer("21_1268405319.95648")
# .annotate "line", 30
    new $P47, 'ExceptionHandler'
    set_addr $P47, control_46
    $P47."handle_types"(58)
    push_eh $P47
    .lex "self", self
    .return (5)
  control_46:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P48, exception, "payload"
    .return ($P48)
.end


.namespace ["Exception";"NoRegFrames"]
.sub "_block49"  :subid("23_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 33
    .const 'Sub' $P51 = "24_1268405319.95648" 
    capture_lex $P51
# .annotate "line", 34
    .const 'Sub' $P51 = "24_1268405319.95648" 
    capture_lex $P51
# .annotate "line", 33
    .return ($P51)
.end


.namespace ["Exception";"NoRegFrames"]
.sub "type"  :subid("24_1268405319.95648") :method :outer("23_1268405319.95648")
# .annotate "line", 34
    new $P53, 'ExceptionHandler'
    set_addr $P53, control_52
    $P53."handle_types"(58)
    push_eh $P53
    .lex "self", self
    .return (6)
  control_52:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P54, exception, "payload"
    .return ($P54)
.end


.namespace ["Exception";"SubstrOutOfString"]
.sub "_block55"  :subid("25_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 37
    .const 'Sub' $P57 = "26_1268405319.95648" 
    capture_lex $P57
# .annotate "line", 38
    .const 'Sub' $P57 = "26_1268405319.95648" 
    capture_lex $P57
# .annotate "line", 37
    .return ($P57)
.end


.namespace ["Exception";"SubstrOutOfString"]
.sub "type"  :subid("26_1268405319.95648") :method :outer("25_1268405319.95648")
# .annotate "line", 38
    new $P59, 'ExceptionHandler'
    set_addr $P59, control_58
    $P59."handle_types"(58)
    push_eh $P59
    .lex "self", self
    .return (7)
  control_58:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P60, exception, "payload"
    .return ($P60)
.end


.namespace ["Exception";"OrdOutOfString"]
.sub "_block61"  :subid("27_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 41
    .const 'Sub' $P63 = "28_1268405319.95648" 
    capture_lex $P63
# .annotate "line", 42
    .const 'Sub' $P63 = "28_1268405319.95648" 
    capture_lex $P63
# .annotate "line", 41
    .return ($P63)
.end


.namespace ["Exception";"OrdOutOfString"]
.sub "type"  :subid("28_1268405319.95648") :method :outer("27_1268405319.95648")
# .annotate "line", 42
    new $P65, 'ExceptionHandler'
    set_addr $P65, control_64
    $P65."handle_types"(58)
    push_eh $P65
    .lex "self", self
    .return (8)
  control_64:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P66, exception, "payload"
    .return ($P66)
.end


.namespace ["Exception";"MalformedUtf8"]
.sub "_block67"  :subid("29_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 45
    .const 'Sub' $P69 = "30_1268405319.95648" 
    capture_lex $P69
# .annotate "line", 46
    .const 'Sub' $P69 = "30_1268405319.95648" 
    capture_lex $P69
# .annotate "line", 45
    .return ($P69)
.end


.namespace ["Exception";"MalformedUtf8"]
.sub "type"  :subid("30_1268405319.95648") :method :outer("29_1268405319.95648")
# .annotate "line", 46
    new $P71, 'ExceptionHandler'
    set_addr $P71, control_70
    $P71."handle_types"(58)
    push_eh $P71
    .lex "self", self
    .return (9)
  control_70:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P72, exception, "payload"
    .return ($P72)
.end


.namespace ["Exception";"MalformedUtf16"]
.sub "_block73"  :subid("31_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 49
    .const 'Sub' $P75 = "32_1268405319.95648" 
    capture_lex $P75
# .annotate "line", 50
    .const 'Sub' $P75 = "32_1268405319.95648" 
    capture_lex $P75
# .annotate "line", 49
    .return ($P75)
.end


.namespace ["Exception";"MalformedUtf16"]
.sub "type"  :subid("32_1268405319.95648") :method :outer("31_1268405319.95648")
# .annotate "line", 50
    new $P77, 'ExceptionHandler'
    set_addr $P77, control_76
    $P77."handle_types"(58)
    push_eh $P77
    .lex "self", self
    .return (10)
  control_76:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P78, exception, "payload"
    .return ($P78)
.end


.namespace ["Exception";"MalformedUtf32"]
.sub "_block79"  :subid("33_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 53
    .const 'Sub' $P81 = "34_1268405319.95648" 
    capture_lex $P81
# .annotate "line", 54
    .const 'Sub' $P81 = "34_1268405319.95648" 
    capture_lex $P81
# .annotate "line", 53
    .return ($P81)
.end


.namespace ["Exception";"MalformedUtf32"]
.sub "type"  :subid("34_1268405319.95648") :method :outer("33_1268405319.95648")
# .annotate "line", 54
    new $P83, 'ExceptionHandler'
    set_addr $P83, control_82
    $P83."handle_types"(58)
    push_eh $P83
    .lex "self", self
    .return (11)
  control_82:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P84, exception, "payload"
    .return ($P84)
.end


.namespace ["Exception";"InvalidCharacter"]
.sub "_block85"  :subid("35_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 57
    .const 'Sub' $P87 = "36_1268405319.95648" 
    capture_lex $P87
# .annotate "line", 58
    .const 'Sub' $P87 = "36_1268405319.95648" 
    capture_lex $P87
# .annotate "line", 57
    .return ($P87)
.end


.namespace ["Exception";"InvalidCharacter"]
.sub "type"  :subid("36_1268405319.95648") :method :outer("35_1268405319.95648")
# .annotate "line", 58
    new $P89, 'ExceptionHandler'
    set_addr $P89, control_88
    $P89."handle_types"(58)
    push_eh $P89
    .lex "self", self
    .return (12)
  control_88:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P90, exception, "payload"
    .return ($P90)
.end


.namespace ["Exception";"InvalidChartype"]
.sub "_block91"  :subid("37_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 61
    .const 'Sub' $P93 = "38_1268405319.95648" 
    capture_lex $P93
# .annotate "line", 62
    .const 'Sub' $P93 = "38_1268405319.95648" 
    capture_lex $P93
# .annotate "line", 61
    .return ($P93)
.end


.namespace ["Exception";"InvalidChartype"]
.sub "type"  :subid("38_1268405319.95648") :method :outer("37_1268405319.95648")
# .annotate "line", 62
    new $P95, 'ExceptionHandler'
    set_addr $P95, control_94
    $P95."handle_types"(58)
    push_eh $P95
    .lex "self", self
    .return (13)
  control_94:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P96, exception, "payload"
    .return ($P96)
.end


.namespace ["Exception";"InvalidEncoding"]
.sub "_block97"  :subid("39_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 65
    .const 'Sub' $P99 = "40_1268405319.95648" 
    capture_lex $P99
# .annotate "line", 66
    .const 'Sub' $P99 = "40_1268405319.95648" 
    capture_lex $P99
# .annotate "line", 65
    .return ($P99)
.end


.namespace ["Exception";"InvalidEncoding"]
.sub "type"  :subid("40_1268405319.95648") :method :outer("39_1268405319.95648")
# .annotate "line", 66
    new $P101, 'ExceptionHandler'
    set_addr $P101, control_100
    $P101."handle_types"(58)
    push_eh $P101
    .lex "self", self
    .return (14)
  control_100:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["Exception";"InvalidCharclass"]
.sub "_block103"  :subid("41_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 69
    .const 'Sub' $P105 = "42_1268405319.95648" 
    capture_lex $P105
# .annotate "line", 70
    .const 'Sub' $P105 = "42_1268405319.95648" 
    capture_lex $P105
# .annotate "line", 69
    .return ($P105)
.end


.namespace ["Exception";"InvalidCharclass"]
.sub "type"  :subid("42_1268405319.95648") :method :outer("41_1268405319.95648")
# .annotate "line", 70
    new $P107, 'ExceptionHandler'
    set_addr $P107, control_106
    $P107."handle_types"(58)
    push_eh $P107
    .lex "self", self
    .return (15)
  control_106:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["Exception";"NegRepeat"]
.sub "_block109"  :subid("43_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 73
    .const 'Sub' $P111 = "44_1268405319.95648" 
    capture_lex $P111
# .annotate "line", 74
    .const 'Sub' $P111 = "44_1268405319.95648" 
    capture_lex $P111
# .annotate "line", 73
    .return ($P111)
.end


.namespace ["Exception";"NegRepeat"]
.sub "type"  :subid("44_1268405319.95648") :method :outer("43_1268405319.95648")
# .annotate "line", 74
    new $P113, 'ExceptionHandler'
    set_addr $P113, control_112
    $P113."handle_types"(58)
    push_eh $P113
    .lex "self", self
    .return (16)
  control_112:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["Exception";"NegSubstr"]
.sub "_block115"  :subid("45_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 77
    .const 'Sub' $P117 = "46_1268405319.95648" 
    capture_lex $P117
# .annotate "line", 78
    .const 'Sub' $P117 = "46_1268405319.95648" 
    capture_lex $P117
# .annotate "line", 77
    .return ($P117)
.end


.namespace ["Exception";"NegSubstr"]
.sub "type"  :subid("46_1268405319.95648") :method :outer("45_1268405319.95648")
# .annotate "line", 78
    new $P119, 'ExceptionHandler'
    set_addr $P119, control_118
    $P119."handle_types"(58)
    push_eh $P119
    .lex "self", self
    .return (17)
  control_118:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P120, exception, "payload"
    .return ($P120)
.end


.namespace ["Exception";"NegSleep"]
.sub "_block121"  :subid("47_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 81
    .const 'Sub' $P123 = "48_1268405319.95648" 
    capture_lex $P123
# .annotate "line", 82
    .const 'Sub' $P123 = "48_1268405319.95648" 
    capture_lex $P123
# .annotate "line", 81
    .return ($P123)
.end


.namespace ["Exception";"NegSleep"]
.sub "type"  :subid("48_1268405319.95648") :method :outer("47_1268405319.95648")
# .annotate "line", 82
    new $P125, 'ExceptionHandler'
    set_addr $P125, control_124
    $P125."handle_types"(58)
    push_eh $P125
    .lex "self", self
    .return (18)
  control_124:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P126, exception, "payload"
    .return ($P126)
.end


.namespace ["Exception";"NegChop"]
.sub "_block127"  :subid("49_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 85
    .const 'Sub' $P129 = "50_1268405319.95648" 
    capture_lex $P129
# .annotate "line", 86
    .const 'Sub' $P129 = "50_1268405319.95648" 
    capture_lex $P129
# .annotate "line", 85
    .return ($P129)
.end


.namespace ["Exception";"NegChop"]
.sub "type"  :subid("50_1268405319.95648") :method :outer("49_1268405319.95648")
# .annotate "line", 86
    new $P131, 'ExceptionHandler'
    set_addr $P131, control_130
    $P131."handle_types"(58)
    push_eh $P131
    .lex "self", self
    .return (19)
  control_130:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P132, exception, "payload"
    .return ($P132)
.end


.namespace ["Exception";"InvalidOperation"]
.sub "_block133"  :subid("51_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 89
    .const 'Sub' $P135 = "52_1268405319.95648" 
    capture_lex $P135
# .annotate "line", 90
    .const 'Sub' $P135 = "52_1268405319.95648" 
    capture_lex $P135
# .annotate "line", 89
    .return ($P135)
.end


.namespace ["Exception";"InvalidOperation"]
.sub "type"  :subid("52_1268405319.95648") :method :outer("51_1268405319.95648")
# .annotate "line", 90
    new $P137, 'ExceptionHandler'
    set_addr $P137, control_136
    $P137."handle_types"(58)
    push_eh $P137
    .lex "self", self
    .return (20)
  control_136:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P138, exception, "payload"
    .return ($P138)
.end


.namespace ["Exception";"ArgOpNotHandled"]
.sub "_block139"  :subid("53_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 93
    .const 'Sub' $P141 = "54_1268405319.95648" 
    capture_lex $P141
# .annotate "line", 94
    .const 'Sub' $P141 = "54_1268405319.95648" 
    capture_lex $P141
# .annotate "line", 93
    .return ($P141)
.end


.namespace ["Exception";"ArgOpNotHandled"]
.sub "type"  :subid("54_1268405319.95648") :method :outer("53_1268405319.95648")
# .annotate "line", 94
    new $P143, 'ExceptionHandler'
    set_addr $P143, control_142
    $P143."handle_types"(58)
    push_eh $P143
    .lex "self", self
    .return (21)
  control_142:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P144, exception, "payload"
    .return ($P144)
.end


.namespace ["Exception";"KeyNotFound"]
.sub "_block145"  :subid("55_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 97
    .const 'Sub' $P147 = "56_1268405319.95648" 
    capture_lex $P147
# .annotate "line", 98
    .const 'Sub' $P147 = "56_1268405319.95648" 
    capture_lex $P147
# .annotate "line", 97
    .return ($P147)
.end


.namespace ["Exception";"KeyNotFound"]
.sub "type"  :subid("56_1268405319.95648") :method :outer("55_1268405319.95648")
# .annotate "line", 98
    new $P149, 'ExceptionHandler'
    set_addr $P149, control_148
    $P149."handle_types"(58)
    push_eh $P149
    .lex "self", self
    .return (22)
  control_148:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P150, exception, "payload"
    .return ($P150)
.end


.namespace ["Exception";"JitUnavailable"]
.sub "_block151"  :subid("57_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 101
    .const 'Sub' $P153 = "58_1268405319.95648" 
    capture_lex $P153
# .annotate "line", 102
    .const 'Sub' $P153 = "58_1268405319.95648" 
    capture_lex $P153
# .annotate "line", 101
    .return ($P153)
.end


.namespace ["Exception";"JitUnavailable"]
.sub "type"  :subid("58_1268405319.95648") :method :outer("57_1268405319.95648")
# .annotate "line", 102
    new $P155, 'ExceptionHandler'
    set_addr $P155, control_154
    $P155."handle_types"(58)
    push_eh $P155
    .lex "self", self
    .return (23)
  control_154:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P156, exception, "payload"
    .return ($P156)
.end


.namespace ["Exception";"ExecUnavailable"]
.sub "_block157"  :subid("59_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 105
    .const 'Sub' $P159 = "60_1268405319.95648" 
    capture_lex $P159
# .annotate "line", 106
    .const 'Sub' $P159 = "60_1268405319.95648" 
    capture_lex $P159
# .annotate "line", 105
    .return ($P159)
.end


.namespace ["Exception";"ExecUnavailable"]
.sub "type"  :subid("60_1268405319.95648") :method :outer("59_1268405319.95648")
# .annotate "line", 106
    new $P161, 'ExceptionHandler'
    set_addr $P161, control_160
    $P161."handle_types"(58)
    push_eh $P161
    .lex "self", self
    .return (24)
  control_160:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P162, exception, "payload"
    .return ($P162)
.end


.namespace ["Exception";"InterpError"]
.sub "_block163"  :subid("61_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 109
    .const 'Sub' $P165 = "62_1268405319.95648" 
    capture_lex $P165
# .annotate "line", 110
    .const 'Sub' $P165 = "62_1268405319.95648" 
    capture_lex $P165
# .annotate "line", 109
    .return ($P165)
.end


.namespace ["Exception";"InterpError"]
.sub "type"  :subid("62_1268405319.95648") :method :outer("61_1268405319.95648")
# .annotate "line", 110
    new $P167, 'ExceptionHandler'
    set_addr $P167, control_166
    $P167."handle_types"(58)
    push_eh $P167
    .lex "self", self
    .return (25)
  control_166:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P168, exception, "payload"
    .return ($P168)
.end


.namespace ["Exception";"PrederefLoadError"]
.sub "_block169"  :subid("63_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 113
    .const 'Sub' $P171 = "64_1268405319.95648" 
    capture_lex $P171
# .annotate "line", 114
    .const 'Sub' $P171 = "64_1268405319.95648" 
    capture_lex $P171
# .annotate "line", 113
    .return ($P171)
.end


.namespace ["Exception";"PrederefLoadError"]
.sub "type"  :subid("64_1268405319.95648") :method :outer("63_1268405319.95648")
# .annotate "line", 114
    new $P173, 'ExceptionHandler'
    set_addr $P173, control_172
    $P173."handle_types"(58)
    push_eh $P173
    .lex "self", self
    .return (26)
  control_172:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P174, exception, "payload"
    .return ($P174)
.end


.namespace ["Exception";"ParrotUsageError"]
.sub "_block175"  :subid("65_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 117
    .const 'Sub' $P177 = "66_1268405319.95648" 
    capture_lex $P177
# .annotate "line", 118
    .const 'Sub' $P177 = "66_1268405319.95648" 
    capture_lex $P177
# .annotate "line", 117
    .return ($P177)
.end


.namespace ["Exception";"ParrotUsageError"]
.sub "type"  :subid("66_1268405319.95648") :method :outer("65_1268405319.95648")
# .annotate "line", 118
    new $P179, 'ExceptionHandler'
    set_addr $P179, control_178
    $P179."handle_types"(58)
    push_eh $P179
    .lex "self", self
    .return (27)
  control_178:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P180, exception, "payload"
    .return ($P180)
.end


.namespace ["Exception";"PioError"]
.sub "_block181"  :subid("67_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 121
    .const 'Sub' $P183 = "68_1268405319.95648" 
    capture_lex $P183
# .annotate "line", 122
    .const 'Sub' $P183 = "68_1268405319.95648" 
    capture_lex $P183
# .annotate "line", 121
    .return ($P183)
.end


.namespace ["Exception";"PioError"]
.sub "type"  :subid("68_1268405319.95648") :method :outer("67_1268405319.95648")
# .annotate "line", 122
    new $P185, 'ExceptionHandler'
    set_addr $P185, control_184
    $P185."handle_types"(58)
    push_eh $P185
    .lex "self", self
    .return (28)
  control_184:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P186, exception, "payload"
    .return ($P186)
.end


.namespace ["Exception";"ParrotPointerError"]
.sub "_block187"  :subid("69_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 125
    .const 'Sub' $P189 = "70_1268405319.95648" 
    capture_lex $P189
# .annotate "line", 126
    .const 'Sub' $P189 = "70_1268405319.95648" 
    capture_lex $P189
# .annotate "line", 125
    .return ($P189)
.end


.namespace ["Exception";"ParrotPointerError"]
.sub "type"  :subid("70_1268405319.95648") :method :outer("69_1268405319.95648")
# .annotate "line", 126
    new $P191, 'ExceptionHandler'
    set_addr $P191, control_190
    $P191."handle_types"(58)
    push_eh $P191
    .lex "self", self
    .return (29)
  control_190:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P192, exception, "payload"
    .return ($P192)
.end


.namespace ["Exception";"DivByZero"]
.sub "_block193"  :subid("71_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 129
    .const 'Sub' $P195 = "72_1268405319.95648" 
    capture_lex $P195
# .annotate "line", 130
    .const 'Sub' $P195 = "72_1268405319.95648" 
    capture_lex $P195
# .annotate "line", 129
    .return ($P195)
.end


.namespace ["Exception";"DivByZero"]
.sub "type"  :subid("72_1268405319.95648") :method :outer("71_1268405319.95648")
# .annotate "line", 130
    new $P197, 'ExceptionHandler'
    set_addr $P197, control_196
    $P197."handle_types"(58)
    push_eh $P197
    .lex "self", self
    .return (30)
  control_196:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P198, exception, "payload"
    .return ($P198)
.end


.namespace ["Exception";"PioNotImplemented"]
.sub "_block199"  :subid("73_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 133
    .const 'Sub' $P201 = "74_1268405319.95648" 
    capture_lex $P201
# .annotate "line", 134
    .const 'Sub' $P201 = "74_1268405319.95648" 
    capture_lex $P201
# .annotate "line", 133
    .return ($P201)
.end


.namespace ["Exception";"PioNotImplemented"]
.sub "type"  :subid("74_1268405319.95648") :method :outer("73_1268405319.95648")
# .annotate "line", 134
    new $P203, 'ExceptionHandler'
    set_addr $P203, control_202
    $P203."handle_types"(58)
    push_eh $P203
    .lex "self", self
    .return (31)
  control_202:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P204, exception, "payload"
    .return ($P204)
.end


.namespace ["Exception";"AllocationError"]
.sub "_block205"  :subid("75_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 137
    .const 'Sub' $P207 = "76_1268405319.95648" 
    capture_lex $P207
# .annotate "line", 138
    .const 'Sub' $P207 = "76_1268405319.95648" 
    capture_lex $P207
# .annotate "line", 137
    .return ($P207)
.end


.namespace ["Exception";"AllocationError"]
.sub "type"  :subid("76_1268405319.95648") :method :outer("75_1268405319.95648")
# .annotate "line", 138
    new $P209, 'ExceptionHandler'
    set_addr $P209, control_208
    $P209."handle_types"(58)
    push_eh $P209
    .lex "self", self
    .return (32)
  control_208:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P210, exception, "payload"
    .return ($P210)
.end


.namespace ["Exception";"InternalPanic"]
.sub "_block211"  :subid("77_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 141
    .const 'Sub' $P213 = "78_1268405319.95648" 
    capture_lex $P213
# .annotate "line", 142
    .const 'Sub' $P213 = "78_1268405319.95648" 
    capture_lex $P213
# .annotate "line", 141
    .return ($P213)
.end


.namespace ["Exception";"InternalPanic"]
.sub "type"  :subid("78_1268405319.95648") :method :outer("77_1268405319.95648")
# .annotate "line", 142
    new $P215, 'ExceptionHandler'
    set_addr $P215, control_214
    $P215."handle_types"(58)
    push_eh $P215
    .lex "self", self
    .return (33)
  control_214:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P216, exception, "payload"
    .return ($P216)
.end


.namespace ["Exception";"OutOfBounds"]
.sub "_block217"  :subid("79_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 145
    .const 'Sub' $P219 = "80_1268405319.95648" 
    capture_lex $P219
# .annotate "line", 146
    .const 'Sub' $P219 = "80_1268405319.95648" 
    capture_lex $P219
# .annotate "line", 145
    .return ($P219)
.end


.namespace ["Exception";"OutOfBounds"]
.sub "type"  :subid("80_1268405319.95648") :method :outer("79_1268405319.95648")
# .annotate "line", 146
    new $P221, 'ExceptionHandler'
    set_addr $P221, control_220
    $P221."handle_types"(58)
    push_eh $P221
    .lex "self", self
    .return (34)
  control_220:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P222, exception, "payload"
    .return ($P222)
.end


.namespace ["Exception";"JitError"]
.sub "_block223"  :subid("81_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 149
    .const 'Sub' $P225 = "82_1268405319.95648" 
    capture_lex $P225
# .annotate "line", 150
    .const 'Sub' $P225 = "82_1268405319.95648" 
    capture_lex $P225
# .annotate "line", 149
    .return ($P225)
.end


.namespace ["Exception";"JitError"]
.sub "type"  :subid("82_1268405319.95648") :method :outer("81_1268405319.95648")
# .annotate "line", 150
    new $P227, 'ExceptionHandler'
    set_addr $P227, control_226
    $P227."handle_types"(58)
    push_eh $P227
    .lex "self", self
    .return (35)
  control_226:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P228, exception, "payload"
    .return ($P228)
.end


.namespace ["Exception";"ExecError"]
.sub "_block229"  :subid("83_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 153
    .const 'Sub' $P231 = "84_1268405319.95648" 
    capture_lex $P231
# .annotate "line", 154
    .const 'Sub' $P231 = "84_1268405319.95648" 
    capture_lex $P231
# .annotate "line", 153
    .return ($P231)
.end


.namespace ["Exception";"ExecError"]
.sub "type"  :subid("84_1268405319.95648") :method :outer("83_1268405319.95648")
# .annotate "line", 154
    new $P233, 'ExceptionHandler'
    set_addr $P233, control_232
    $P233."handle_types"(58)
    push_eh $P233
    .lex "self", self
    .return (36)
  control_232:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P234, exception, "payload"
    .return ($P234)
.end


.namespace ["Exception";"IllInherit"]
.sub "_block235"  :subid("85_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 157
    .const 'Sub' $P237 = "86_1268405319.95648" 
    capture_lex $P237
# .annotate "line", 158
    .const 'Sub' $P237 = "86_1268405319.95648" 
    capture_lex $P237
# .annotate "line", 157
    .return ($P237)
.end


.namespace ["Exception";"IllInherit"]
.sub "type"  :subid("86_1268405319.95648") :method :outer("85_1268405319.95648")
# .annotate "line", 158
    new $P239, 'ExceptionHandler'
    set_addr $P239, control_238
    $P239."handle_types"(58)
    push_eh $P239
    .lex "self", self
    .return (37)
  control_238:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P240, exception, "payload"
    .return ($P240)
.end


.namespace ["Exception";"NoPrevCs"]
.sub "_block241"  :subid("87_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 161
    .const 'Sub' $P243 = "88_1268405319.95648" 
    capture_lex $P243
# .annotate "line", 162
    .const 'Sub' $P243 = "88_1268405319.95648" 
    capture_lex $P243
# .annotate "line", 161
    .return ($P243)
.end


.namespace ["Exception";"NoPrevCs"]
.sub "type"  :subid("88_1268405319.95648") :method :outer("87_1268405319.95648")
# .annotate "line", 162
    new $P245, 'ExceptionHandler'
    set_addr $P245, control_244
    $P245."handle_types"(58)
    push_eh $P245
    .lex "self", self
    .return (38)
  control_244:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P246, exception, "payload"
    .return ($P246)
.end


.namespace ["Exception";"NoClass"]
.sub "_block247"  :subid("89_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 165
    .const 'Sub' $P249 = "90_1268405319.95648" 
    capture_lex $P249
# .annotate "line", 166
    .const 'Sub' $P249 = "90_1268405319.95648" 
    capture_lex $P249
# .annotate "line", 165
    .return ($P249)
.end


.namespace ["Exception";"NoClass"]
.sub "type"  :subid("90_1268405319.95648") :method :outer("89_1268405319.95648")
# .annotate "line", 166
    new $P251, 'ExceptionHandler'
    set_addr $P251, control_250
    $P251."handle_types"(58)
    push_eh $P251
    .lex "self", self
    .return (39)
  control_250:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P252, exception, "payload"
    .return ($P252)
.end


.namespace ["Exception";"LexNotFound"]
.sub "_block253"  :subid("91_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 169
    .const 'Sub' $P255 = "92_1268405319.95648" 
    capture_lex $P255
# .annotate "line", 170
    .const 'Sub' $P255 = "92_1268405319.95648" 
    capture_lex $P255
# .annotate "line", 169
    .return ($P255)
.end


.namespace ["Exception";"LexNotFound"]
.sub "type"  :subid("92_1268405319.95648") :method :outer("91_1268405319.95648")
# .annotate "line", 170
    new $P257, 'ExceptionHandler'
    set_addr $P257, control_256
    $P257."handle_types"(58)
    push_eh $P257
    .lex "self", self
    .return (40)
  control_256:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P258, exception, "payload"
    .return ($P258)
.end


.namespace ["Exception";"PadNotFound"]
.sub "_block259"  :subid("93_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 173
    .const 'Sub' $P261 = "94_1268405319.95648" 
    capture_lex $P261
# .annotate "line", 174
    .const 'Sub' $P261 = "94_1268405319.95648" 
    capture_lex $P261
# .annotate "line", 173
    .return ($P261)
.end


.namespace ["Exception";"PadNotFound"]
.sub "type"  :subid("94_1268405319.95648") :method :outer("93_1268405319.95648")
# .annotate "line", 174
    new $P263, 'ExceptionHandler'
    set_addr $P263, control_262
    $P263."handle_types"(58)
    push_eh $P263
    .lex "self", self
    .return (41)
  control_262:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P264, exception, "payload"
    .return ($P264)
.end


.namespace ["Exception";"AttribNotFound"]
.sub "_block265"  :subid("95_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 177
    .const 'Sub' $P267 = "96_1268405319.95648" 
    capture_lex $P267
# .annotate "line", 178
    .const 'Sub' $P267 = "96_1268405319.95648" 
    capture_lex $P267
# .annotate "line", 177
    .return ($P267)
.end


.namespace ["Exception";"AttribNotFound"]
.sub "type"  :subid("96_1268405319.95648") :method :outer("95_1268405319.95648")
# .annotate "line", 178
    new $P269, 'ExceptionHandler'
    set_addr $P269, control_268
    $P269."handle_types"(58)
    push_eh $P269
    .lex "self", self
    .return (42)
  control_268:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P270, exception, "payload"
    .return ($P270)
.end


.namespace ["Exception";"GlobalNotFound"]
.sub "_block271"  :subid("97_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 181
    .const 'Sub' $P273 = "98_1268405319.95648" 
    capture_lex $P273
# .annotate "line", 182
    .const 'Sub' $P273 = "98_1268405319.95648" 
    capture_lex $P273
# .annotate "line", 181
    .return ($P273)
.end


.namespace ["Exception";"GlobalNotFound"]
.sub "type"  :subid("98_1268405319.95648") :method :outer("97_1268405319.95648")
# .annotate "line", 182
    new $P275, 'ExceptionHandler'
    set_addr $P275, control_274
    $P275."handle_types"(58)
    push_eh $P275
    .lex "self", self
    .return (43)
  control_274:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P276, exception, "payload"
    .return ($P276)
.end


.namespace ["Exception";"ExternalError"]
.sub "_block277"  :subid("99_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 185
    .const 'Sub' $P279 = "100_1268405319.95648" 
    capture_lex $P279
# .annotate "line", 186
    .const 'Sub' $P279 = "100_1268405319.95648" 
    capture_lex $P279
# .annotate "line", 185
    .return ($P279)
.end


.namespace ["Exception";"ExternalError"]
.sub "type"  :subid("100_1268405319.95648") :method :outer("99_1268405319.95648")
# .annotate "line", 186
    new $P281, 'ExceptionHandler'
    set_addr $P281, control_280
    $P281."handle_types"(58)
    push_eh $P281
    .lex "self", self
    .return (44)
  control_280:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P282, exception, "payload"
    .return ($P282)
.end


.namespace ["Exception";"MethodNotFound"]
.sub "_block283"  :subid("101_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 189
    .const 'Sub' $P285 = "102_1268405319.95648" 
    capture_lex $P285
# .annotate "line", 190
    .const 'Sub' $P285 = "102_1268405319.95648" 
    capture_lex $P285
# .annotate "line", 189
    .return ($P285)
.end


.namespace ["Exception";"MethodNotFound"]
.sub "type"  :subid("102_1268405319.95648") :method :outer("101_1268405319.95648")
# .annotate "line", 190
    new $P287, 'ExceptionHandler'
    set_addr $P287, control_286
    $P287."handle_types"(58)
    push_eh $P287
    .lex "self", self
    .return (45)
  control_286:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P288, exception, "payload"
    .return ($P288)
.end


.namespace ["Exception";"VtableNotFound"]
.sub "_block289"  :subid("103_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 193
    .const 'Sub' $P291 = "104_1268405319.95648" 
    capture_lex $P291
# .annotate "line", 194
    .const 'Sub' $P291 = "104_1268405319.95648" 
    capture_lex $P291
# .annotate "line", 193
    .return ($P291)
.end


.namespace ["Exception";"VtableNotFound"]
.sub "type"  :subid("104_1268405319.95648") :method :outer("103_1268405319.95648")
# .annotate "line", 194
    new $P293, 'ExceptionHandler'
    set_addr $P293, control_292
    $P293."handle_types"(58)
    push_eh $P293
    .lex "self", self
    .return (46)
  control_292:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P294, exception, "payload"
    .return ($P294)
.end


.namespace ["Exception";"WriteToConstclass"]
.sub "_block295"  :subid("105_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 197
    .const 'Sub' $P297 = "106_1268405319.95648" 
    capture_lex $P297
# .annotate "line", 198
    .const 'Sub' $P297 = "106_1268405319.95648" 
    capture_lex $P297
# .annotate "line", 197
    .return ($P297)
.end


.namespace ["Exception";"WriteToConstclass"]
.sub "type"  :subid("106_1268405319.95648") :method :outer("105_1268405319.95648")
# .annotate "line", 198
    new $P299, 'ExceptionHandler'
    set_addr $P299, control_298
    $P299."handle_types"(58)
    push_eh $P299
    .lex "self", self
    .return (47)
  control_298:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P300, exception, "payload"
    .return ($P300)
.end


.namespace ["Exception";"Nospawn"]
.sub "_block301"  :subid("107_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 201
    .const 'Sub' $P303 = "108_1268405319.95648" 
    capture_lex $P303
# .annotate "line", 202
    .const 'Sub' $P303 = "108_1268405319.95648" 
    capture_lex $P303
# .annotate "line", 201
    .return ($P303)
.end


.namespace ["Exception";"Nospawn"]
.sub "type"  :subid("108_1268405319.95648") :method :outer("107_1268405319.95648")
# .annotate "line", 202
    new $P305, 'ExceptionHandler'
    set_addr $P305, control_304
    $P305."handle_types"(58)
    push_eh $P305
    .lex "self", self
    .return (48)
  control_304:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P306, exception, "payload"
    .return ($P306)
.end


.namespace ["Exception";"InternalNotImplemented"]
.sub "_block307"  :subid("109_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 205
    .const 'Sub' $P309 = "110_1268405319.95648" 
    capture_lex $P309
# .annotate "line", 206
    .const 'Sub' $P309 = "110_1268405319.95648" 
    capture_lex $P309
# .annotate "line", 205
    .return ($P309)
.end


.namespace ["Exception";"InternalNotImplemented"]
.sub "type"  :subid("110_1268405319.95648") :method :outer("109_1268405319.95648")
# .annotate "line", 206
    new $P311, 'ExceptionHandler'
    set_addr $P311, control_310
    $P311."handle_types"(58)
    push_eh $P311
    .lex "self", self
    .return (49)
  control_310:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P312, exception, "payload"
    .return ($P312)
.end


.namespace ["Exception";"ErrOverflow"]
.sub "_block313"  :subid("111_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 209
    .const 'Sub' $P315 = "112_1268405319.95648" 
    capture_lex $P315
# .annotate "line", 210
    .const 'Sub' $P315 = "112_1268405319.95648" 
    capture_lex $P315
# .annotate "line", 209
    .return ($P315)
.end


.namespace ["Exception";"ErrOverflow"]
.sub "type"  :subid("112_1268405319.95648") :method :outer("111_1268405319.95648")
# .annotate "line", 210
    new $P317, 'ExceptionHandler'
    set_addr $P317, control_316
    $P317."handle_types"(58)
    push_eh $P317
    .lex "self", self
    .return (50)
  control_316:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P318, exception, "payload"
    .return ($P318)
.end


.namespace ["Exception";"LossyConversion"]
.sub "_block319"  :subid("113_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 213
    .const 'Sub' $P321 = "114_1268405319.95648" 
    capture_lex $P321
# .annotate "line", 214
    .const 'Sub' $P321 = "114_1268405319.95648" 
    capture_lex $P321
# .annotate "line", 213
    .return ($P321)
.end


.namespace ["Exception";"LossyConversion"]
.sub "type"  :subid("114_1268405319.95648") :method :outer("113_1268405319.95648")
# .annotate "line", 214
    new $P323, 'ExceptionHandler'
    set_addr $P323, control_322
    $P323."handle_types"(58)
    push_eh $P323
    .lex "self", self
    .return (51)
  control_322:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P324, exception, "payload"
    .return ($P324)
.end


.namespace ["Exception";"RoleCompositionMethodConflict"]
.sub "_block325"  :subid("115_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 217
    .const 'Sub' $P327 = "116_1268405319.95648" 
    capture_lex $P327
# .annotate "line", 218
    .const 'Sub' $P327 = "116_1268405319.95648" 
    capture_lex $P327
# .annotate "line", 217
    .return ($P327)
.end


.namespace ["Exception";"RoleCompositionMethodConflict"]
.sub "type"  :subid("116_1268405319.95648") :method :outer("115_1268405319.95648")
# .annotate "line", 218
    new $P329, 'ExceptionHandler'
    set_addr $P329, control_328
    $P329."handle_types"(58)
    push_eh $P329
    .lex "self", self
    .return (52)
  control_328:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P330, exception, "payload"
    .return ($P330)
.end


.namespace ["Exception";"UnexpectedNull"]
.sub "_block331"  :subid("117_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 221
    .const 'Sub' $P333 = "118_1268405319.95648" 
    capture_lex $P333
# .annotate "line", 222
    .const 'Sub' $P333 = "118_1268405319.95648" 
    capture_lex $P333
# .annotate "line", 221
    .return ($P333)
.end


.namespace ["Exception";"UnexpectedNull"]
.sub "type"  :subid("118_1268405319.95648") :method :outer("117_1268405319.95648")
# .annotate "line", 222
    new $P335, 'ExceptionHandler'
    set_addr $P335, control_334
    $P335."handle_types"(58)
    push_eh $P335
    .lex "self", self
    .return (53)
  control_334:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P336, exception, "payload"
    .return ($P336)
.end


.namespace ["Exception";"LibraryError"]
.sub "_block337"  :subid("119_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 225
    .const 'Sub' $P339 = "120_1268405319.95648" 
    capture_lex $P339
# .annotate "line", 226
    .const 'Sub' $P339 = "120_1268405319.95648" 
    capture_lex $P339
# .annotate "line", 225
    .return ($P339)
.end


.namespace ["Exception";"LibraryError"]
.sub "type"  :subid("120_1268405319.95648") :method :outer("119_1268405319.95648")
# .annotate "line", 226
    new $P341, 'ExceptionHandler'
    set_addr $P341, control_340
    $P341."handle_types"(58)
    push_eh $P341
    .lex "self", self
    .return (54)
  control_340:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P342, exception, "payload"
    .return ($P342)
.end


.namespace ["Exception";"LibraryNotLoaded"]
.sub "_block343"  :subid("121_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 229
    .const 'Sub' $P345 = "122_1268405319.95648" 
    capture_lex $P345
# .annotate "line", 230
    .const 'Sub' $P345 = "122_1268405319.95648" 
    capture_lex $P345
# .annotate "line", 229
    .return ($P345)
.end


.namespace ["Exception";"LibraryNotLoaded"]
.sub "type"  :subid("122_1268405319.95648") :method :outer("121_1268405319.95648")
# .annotate "line", 230
    new $P347, 'ExceptionHandler'
    set_addr $P347, control_346
    $P347."handle_types"(58)
    push_eh $P347
    .lex "self", self
    .return (55)
  control_346:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P348, exception, "payload"
    .return ($P348)
.end


.namespace ["Exception";"SyntaxError"]
.sub "_block349"  :subid("123_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 233
    .const 'Sub' $P351 = "124_1268405319.95648" 
    capture_lex $P351
# .annotate "line", 234
    .const 'Sub' $P351 = "124_1268405319.95648" 
    capture_lex $P351
# .annotate "line", 233
    .return ($P351)
.end


.namespace ["Exception";"SyntaxError"]
.sub "type"  :subid("124_1268405319.95648") :method :outer("123_1268405319.95648")
# .annotate "line", 234
    new $P353, 'ExceptionHandler'
    set_addr $P353, control_352
    $P353."handle_types"(58)
    push_eh $P353
    .lex "self", self
    .return (56)
  control_352:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P354, exception, "payload"
    .return ($P354)
.end


.namespace ["Exception";"MalformedPackfile"]
.sub "_block355"  :subid("125_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 237
    .const 'Sub' $P357 = "126_1268405319.95648" 
    capture_lex $P357
# .annotate "line", 238
    .const 'Sub' $P357 = "126_1268405319.95648" 
    capture_lex $P357
# .annotate "line", 237
    .return ($P357)
.end


.namespace ["Exception";"MalformedPackfile"]
.sub "type"  :subid("126_1268405319.95648") :method :outer("125_1268405319.95648")
# .annotate "line", 238
    new $P359, 'ExceptionHandler'
    set_addr $P359, control_358
    $P359."handle_types"(58)
    push_eh $P359
    .lex "self", self
    .return (57)
  control_358:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P360, exception, "payload"
    .return ($P360)
.end


.namespace ["Control";"Return"]
.sub "_block361"  :subid("127_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 241
    .const 'Sub' $P363 = "128_1268405319.95648" 
    capture_lex $P363
# .annotate "line", 242
    .const 'Sub' $P363 = "128_1268405319.95648" 
    capture_lex $P363
# .annotate "line", 241
    .return ($P363)
.end


.namespace ["Control";"Return"]
.sub "type"  :subid("128_1268405319.95648") :method :outer("127_1268405319.95648")
# .annotate "line", 242
    new $P365, 'ExceptionHandler'
    set_addr $P365, control_364
    $P365."handle_types"(58)
    push_eh $P365
    .lex "self", self
    .return (58)
  control_364:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P366, exception, "payload"
    .return ($P366)
.end


.namespace ["Control";"Ok"]
.sub "_block367"  :subid("129_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 245
    .const 'Sub' $P369 = "130_1268405319.95648" 
    capture_lex $P369
# .annotate "line", 246
    .const 'Sub' $P369 = "130_1268405319.95648" 
    capture_lex $P369
# .annotate "line", 245
    .return ($P369)
.end


.namespace ["Control";"Ok"]
.sub "type"  :subid("130_1268405319.95648") :method :outer("129_1268405319.95648")
# .annotate "line", 246
    new $P371, 'ExceptionHandler'
    set_addr $P371, control_370
    $P371."handle_types"(58)
    push_eh $P371
    .lex "self", self
    .return (59)
  control_370:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P372, exception, "payload"
    .return ($P372)
.end


.namespace ["Control";"Break"]
.sub "_block373"  :subid("131_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 249
    .const 'Sub' $P375 = "132_1268405319.95648" 
    capture_lex $P375
# .annotate "line", 250
    .const 'Sub' $P375 = "132_1268405319.95648" 
    capture_lex $P375
# .annotate "line", 249
    .return ($P375)
.end


.namespace ["Control";"Break"]
.sub "type"  :subid("132_1268405319.95648") :method :outer("131_1268405319.95648")
# .annotate "line", 250
    new $P377, 'ExceptionHandler'
    set_addr $P377, control_376
    $P377."handle_types"(58)
    push_eh $P377
    .lex "self", self
    .return (60)
  control_376:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P378, exception, "payload"
    .return ($P378)
.end


.namespace ["Control";"Continue"]
.sub "_block379"  :subid("133_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 253
    .const 'Sub' $P381 = "134_1268405319.95648" 
    capture_lex $P381
# .annotate "line", 254
    .const 'Sub' $P381 = "134_1268405319.95648" 
    capture_lex $P381
# .annotate "line", 253
    .return ($P381)
.end


.namespace ["Control";"Continue"]
.sub "type"  :subid("134_1268405319.95648") :method :outer("133_1268405319.95648")
# .annotate "line", 254
    new $P383, 'ExceptionHandler'
    set_addr $P383, control_382
    $P383."handle_types"(58)
    push_eh $P383
    .lex "self", self
    .return (61)
  control_382:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P384, exception, "payload"
    .return ($P384)
.end


.namespace ["Control";"Error"]
.sub "_block385"  :subid("135_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 257
    .const 'Sub' $P387 = "136_1268405319.95648" 
    capture_lex $P387
# .annotate "line", 258
    .const 'Sub' $P387 = "136_1268405319.95648" 
    capture_lex $P387
# .annotate "line", 257
    .return ($P387)
.end


.namespace ["Control";"Error"]
.sub "type"  :subid("136_1268405319.95648") :method :outer("135_1268405319.95648")
# .annotate "line", 258
    new $P389, 'ExceptionHandler'
    set_addr $P389, control_388
    $P389."handle_types"(58)
    push_eh $P389
    .lex "self", self
    .return (62)
  control_388:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P390, exception, "payload"
    .return ($P390)
.end


.namespace ["Control";"Take"]
.sub "_block391"  :subid("137_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 261
    .const 'Sub' $P393 = "138_1268405319.95648" 
    capture_lex $P393
# .annotate "line", 262
    .const 'Sub' $P393 = "138_1268405319.95648" 
    capture_lex $P393
# .annotate "line", 261
    .return ($P393)
.end


.namespace ["Control";"Take"]
.sub "type"  :subid("138_1268405319.95648") :method :outer("137_1268405319.95648")
# .annotate "line", 262
    new $P395, 'ExceptionHandler'
    set_addr $P395, control_394
    $P395."handle_types"(58)
    push_eh $P395
    .lex "self", self
    .return (63)
  control_394:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P396, exception, "payload"
    .return ($P396)
.end


.namespace ["Control";"Leave"]
.sub "_block397"  :subid("139_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 265
    .const 'Sub' $P399 = "140_1268405319.95648" 
    capture_lex $P399
# .annotate "line", 266
    .const 'Sub' $P399 = "140_1268405319.95648" 
    capture_lex $P399
# .annotate "line", 265
    .return ($P399)
.end


.namespace ["Control";"Leave"]
.sub "type"  :subid("140_1268405319.95648") :method :outer("139_1268405319.95648")
# .annotate "line", 266
    new $P401, 'ExceptionHandler'
    set_addr $P401, control_400
    $P401."handle_types"(58)
    push_eh $P401
    .lex "self", self
    .return (64)
  control_400:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P402, exception, "payload"
    .return ($P402)
.end


.namespace ["Control";"LoopNext"]
.sub "_block403"  :subid("141_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 269
    .const 'Sub' $P405 = "142_1268405319.95648" 
    capture_lex $P405
# .annotate "line", 270
    .const 'Sub' $P405 = "142_1268405319.95648" 
    capture_lex $P405
# .annotate "line", 269
    .return ($P405)
.end


.namespace ["Control";"LoopNext"]
.sub "type"  :subid("142_1268405319.95648") :method :outer("141_1268405319.95648")
# .annotate "line", 270
    new $P407, 'ExceptionHandler'
    set_addr $P407, control_406
    $P407."handle_types"(58)
    push_eh $P407
    .lex "self", self
    .return (65)
  control_406:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P408, exception, "payload"
    .return ($P408)
.end


.namespace ["Control";"LoopLast"]
.sub "_block409"  :subid("143_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 273
    .const 'Sub' $P411 = "144_1268405319.95648" 
    capture_lex $P411
# .annotate "line", 274
    .const 'Sub' $P411 = "144_1268405319.95648" 
    capture_lex $P411
# .annotate "line", 273
    .return ($P411)
.end


.namespace ["Control";"LoopLast"]
.sub "type"  :subid("144_1268405319.95648") :method :outer("143_1268405319.95648")
# .annotate "line", 274
    new $P413, 'ExceptionHandler'
    set_addr $P413, control_412
    $P413."handle_types"(58)
    push_eh $P413
    .lex "self", self
    .return (66)
  control_412:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P414, exception, "payload"
    .return ($P414)
.end


.namespace ["Control";"LoopRedo"]
.sub "_block415"  :subid("145_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 277
    .const 'Sub' $P417 = "146_1268405319.95648" 
    capture_lex $P417
# .annotate "line", 278
    .const 'Sub' $P417 = "146_1268405319.95648" 
    capture_lex $P417
# .annotate "line", 277
    .return ($P417)
.end


.namespace ["Control";"LoopRedo"]
.sub "type"  :subid("146_1268405319.95648") :method :outer("145_1268405319.95648")
# .annotate "line", 278
    new $P419, 'ExceptionHandler'
    set_addr $P419, control_418
    $P419."handle_types"(58)
    push_eh $P419
    .lex "self", self
    .return (67)
  control_418:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P420, exception, "payload"
    .return ($P420)
.end


.namespace ["Exception";"AbstractMethodCalled"]
.sub "_block421"  :subid("147_1268405319.95648") :outer("10_1268405319.95648")
# .annotate "line", 285
    get_hll_global $P424, ["Exception";"InvalidArgument"], "_block423" 
    capture_lex $P424
    get_hll_global $P424, ["Exception";"InvalidArgument"], "_block423" 
    capture_lex $P424
    $P425 = $P424()
    .return ($P425)
.end


.namespace ["Exception";"AbstractMethodCalled"]
.sub "" :load :init :subid("post150") :outer("147_1268405319.95648")
# .annotate "line", 285
    get_hll_global $P422, ["Exception";"AbstractMethodCalled"], "_block421" 
    .local pmc block
    set block, $P422
    $P426 = get_root_global ["parrot"], "P6metaclass"
    $P426."new_class"("Exception::InvalidArgument", "Exception::Wrapper" :named("parent"))
.end


.namespace ["Exception";"InvalidArgument"]
.sub "_block423"  :subid("148_1268405319.95648") :outer("147_1268405319.95648")
# .annotate "line", 285
    .return ()
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268405356.73703")
# .annotate "line", 0
    get_hll_global $P14, ["File"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["File"], "_block13" 
    capture_lex $P14
    $P167 = $P14()
# .annotate "line", 1
    .return ($P167)
.end


.namespace ["File"]
.sub "_block13"  :subid("11_1268405356.73703") :outer("10_1268405356.73703")
# .annotate "line", 7
    .const 'Sub' $P144 = "22_1268405356.73703" 
    capture_lex $P144
    .const 'Sub' $P134 = "21_1268405356.73703" 
    capture_lex $P134
    .const 'Sub' $P125 = "20_1268405356.73703" 
    capture_lex $P125
    .const 'Sub' $P116 = "19_1268405356.73703" 
    capture_lex $P116
    .const 'Sub' $P107 = "18_1268405356.73703" 
    capture_lex $P107
    .const 'Sub' $P96 = "17_1268405356.73703" 
    capture_lex $P96
    .const 'Sub' $P47 = "15_1268405356.73703" 
    capture_lex $P47
    .const 'Sub' $P38 = "14_1268405356.73703" 
    capture_lex $P38
    .const 'Sub' $P28 = "13_1268405356.73703" 
    capture_lex $P28
    .const 'Sub' $P15 = "12_1268405356.73703" 
    capture_lex $P15
# .annotate "line", 9
    .const 'Sub' $P15 = "12_1268405356.73703" 
    capture_lex $P15
    .lex "_get_pmc", $P15
# .annotate "line", 21
    .const 'Sub' $P28 = "13_1268405356.73703" 
    capture_lex $P28
    .lex "copy", $P28
# .annotate "line", 25
    .const 'Sub' $P38 = "14_1268405356.73703" 
    capture_lex $P38
    .lex "exists", $P38
# .annotate "line", 29
    .const 'Sub' $P47 = "15_1268405356.73703" 
    capture_lex $P47
    .lex "find_all", $P47
# .annotate "line", 56
    .const 'Sub' $P96 = "17_1268405356.73703" 
    capture_lex $P96
    .lex "find_first", $P96
# .annotate "line", 60
    .const 'Sub' $P107 = "18_1268405356.73703" 
    capture_lex $P107
    .lex "is_dir", $P107
# .annotate "line", 64
    .const 'Sub' $P116 = "19_1268405356.73703" 
    capture_lex $P116
    .lex "is_file", $P116
# .annotate "line", 68
    .const 'Sub' $P125 = "20_1268405356.73703" 
    capture_lex $P125
    .lex "is_link", $P125
# .annotate "line", 72
    .const 'Sub' $P134 = "21_1268405356.73703" 
    capture_lex $P134
    .lex "rename", $P134
# .annotate "line", 76
    .const 'Sub' $P144 = "22_1268405356.73703" 
    capture_lex $P144
    .lex "slurp", $P144
# .annotate "line", 7
    "use"("Dumper")
    find_lex $P157, "_get_pmc"
    find_lex $P158, "copy"
    find_lex $P159, "exists"
    find_lex $P160, "find_all"
    find_lex $P161, "find_first"
    find_lex $P162, "is_dir"
    find_lex $P163, "is_file"
    find_lex $P164, "is_link"
    find_lex $P165, "rename"
    find_lex $P166, "slurp"
    .return ($P166)
.end


.namespace ["File"]
.sub "_get_pmc"  :subid("12_1268405356.73703") :outer("11_1268405356.73703")
# .annotate "line", 9
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 10
    get_global $P18, "$_Pmc"
    unless_null $P18, vivify_23
    new $P18, "Undef"
    set_global "$_Pmc", $P18
  vivify_23:
# .annotate "line", 9
    get_global $P19, "$_Pmc"
# .annotate "line", 12
    get_hll_global $P21, ["Opcode"], "defined"
    get_global $P22, "$_Pmc"
    $P23 = $P21($P22)
    if $P23, unless_20_end
# .annotate "line", 13

			$P24 = root_new [ 'parrot' ; 'File' ]
		
    set_global "$_Pmc", $P24
  unless_20_end:
# .annotate "line", 18
    new $P25, "Exception"
    set $P25['type'], 58
    get_global $P26, "$_Pmc"
    setattribute $P25, 'payload', $P26
    throw $P25
# .annotate "line", 9
    .return ()
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P27, exception, "payload"
    .return ($P27)
.end


.namespace ["File"]
.sub "copy"  :subid("13_1268405356.73703") :outer("11_1268405356.73703")
    .param pmc param_31
    .param pmc param_32
# .annotate "line", 21
    new $P30, 'ExceptionHandler'
    set_addr $P30, control_29
    $P30."handle_types"(58)
    push_eh $P30
    .lex "$from", param_31
    .lex "$to", param_32
# .annotate "line", 22
    $P33 = "_get_pmc"()
    find_lex $P34, "$from"
    find_lex $P35, "$to"
    $P36 = $P33."copy"($P34, $P35)
# .annotate "line", 21
    .return ($P36)
  control_29:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P37, exception, "payload"
    .return ($P37)
.end


.namespace ["File"]
.sub "exists"  :subid("14_1268405356.73703") :outer("11_1268405356.73703")
    .param pmc param_41
# .annotate "line", 25
    new $P40, 'ExceptionHandler'
    set_addr $P40, control_39
    $P40."handle_types"(58)
    push_eh $P40
    .lex "$path", param_41
# .annotate "line", 26
    new $P42, "Exception"
    set $P42['type'], 58
    $P43 = "_get_pmc"()
    find_lex $P44, "$path"
    $P45 = $P43."exists"($P44)
    setattribute $P42, 'payload', $P45
    throw $P42
# .annotate "line", 25
    .return ()
  control_39:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P46, exception, "payload"
    .return ($P46)
.end


.namespace ["File"]
.sub "find_all"  :subid("15_1268405356.73703") :outer("11_1268405356.73703")
    .param pmc param_50
    .param pmc param_51
# .annotate "line", 29
    .const 'Sub' $P73 = "16_1268405356.73703" 
    capture_lex $P73
    new $P49, 'ExceptionHandler'
    set_addr $P49, control_48
    $P49."handle_types"(58)
    push_eh $P49
    .lex "$path", param_50
    .lex "@search_list", param_51
# .annotate "line", 31
    new $P52, "ResizablePMCArray"
    .lex "@results", $P52
# .annotate "line", 30
    find_lex $P53, "$path"
    find_lex $P54, "@search_list"
    set $N55, $P54
    "NOTE"("Finding all paths matching '", $P53, "' in ", $N55, " directories")
# .annotate "line", 31
    get_hll_global $P56, ["Array"], "new"
    $P57 = $P56()
    store_lex "@results", $P57
# .annotate "line", 33
    get_hll_global $P59, ["String"], "char_at"
    find_lex $P60, "$path"
    $S61 = $P59($P60, 0)
    iseq $I62, $S61, "/"
    if $I62, if_58
# .annotate "line", 38
    new $P65, "String"
    assign $P65, "/"
    find_lex $P66, "$path"
    concat $P67, $P65, $P66
    store_lex "$path", $P67
# .annotate "line", 37
    goto if_58_end
  if_58:
# .annotate "line", 34
    "NOTE"("Path is rooted - not using search paths")
# .annotate "line", 35
    get_hll_global $P63, ["Array"], "new"
    $P64 = $P63("")
    store_lex "@search_list", $P64
  if_58_end:
# .annotate "line", 41
    find_lex $P69, "@search_list"
    defined $I70, $P69
    unless $I70, for_undef_24
    iter $P68, $P69
    new $P88, 'ExceptionHandler'
    set_addr $P88, loop87_handler
    $P88."handle_types"(65, 67, 66)
    push_eh $P88
  loop87_test:
    unless $P68, loop87_done
    shift $P71, $P68
  loop87_redo:
    .const 'Sub' $P73 = "16_1268405356.73703" 
    capture_lex $P73
    $P73($P71)
  loop87_next:
    goto loop87_test
  loop87_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P89, exception, 'type'
    eq $P89, 65, loop87_next
    eq $P89, 67, loop87_redo
  loop87_done:
    pop_eh 
  for_undef_24:
# .annotate "line", 51
    find_lex $P90, "@results"
    set $N91, $P90
    "NOTE"("Found ", $N91, " results")
# .annotate "line", 52
    find_lex $P92, "@results"
    "DUMP"($P92)
# .annotate "line", 53
    new $P93, "Exception"
    set $P93['type'], 58
    find_lex $P94, "@results"
    setattribute $P93, 'payload', $P94
    throw $P93
# .annotate "line", 29
    .return ()
  control_48:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P95, exception, "payload"
    .return ($P95)
.end


.namespace ["File"]
.sub "_block72"  :anon :subid("16_1268405356.73703") :outer("15_1268405356.73703")
    .param pmc param_75
# .annotate "line", 42
    new $P74, "Undef"
    .lex "$name", $P74
    .lex "$_", param_75
    find_lex $P76, "$_"
    find_lex $P77, "$path"
    concat $P78, $P76, $P77
    store_lex "$name", $P78
# .annotate "line", 43
    find_lex $P79, "$name"
    "NOTE"("Trying ", $P79)
# .annotate "line", 45
    find_lex $P82, "$name"
    $P83 = "exists"($P82)
    if $P83, if_81
    set $P80, $P83
    goto if_81_end
  if_81:
# .annotate "line", 46
    "NOTE"("Success! it's a match")
# .annotate "line", 47
    find_lex $P84, "@results"
    find_lex $P85, "$name"
    $P86 = $P84."push"($P85)
# .annotate "line", 45
    set $P80, $P86
  if_81_end:
# .annotate "line", 41
    .return ($P80)
.end


.namespace ["File"]
.sub "find_first"  :subid("17_1268405356.73703") :outer("11_1268405356.73703")
    .param pmc param_99
    .param pmc param_100
# .annotate "line", 56
    new $P98, 'ExceptionHandler'
    set_addr $P98, control_97
    $P98."handle_types"(58)
    push_eh $P98
    .lex "$path", param_99
    .lex "@search_list", param_100
# .annotate "line", 57
    new $P101, "Exception"
    set $P101['type'], 58
    find_lex $P102, "$path"
    find_lex $P103, "@search_list"
    $P104 = "find_all"($P102, $P103)
    set $P105, $P104[0]
    unless_null $P105, vivify_25
    new $P105, "Undef"
  vivify_25:
    setattribute $P101, 'payload', $P105
    throw $P101
# .annotate "line", 56
    .return ()
  control_97:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["File"]
.sub "is_dir"  :subid("18_1268405356.73703") :outer("11_1268405356.73703")
    .param pmc param_110
# .annotate "line", 60
    new $P109, 'ExceptionHandler'
    set_addr $P109, control_108
    $P109."handle_types"(58)
    push_eh $P109
    .lex "$path", param_110
# .annotate "line", 61
    new $P111, "Exception"
    set $P111['type'], 58
    $P112 = "_get_pmc"()
    find_lex $P113, "$path"
    $P114 = $P112."is_dir"($P113)
    setattribute $P111, 'payload', $P114
    throw $P111
# .annotate "line", 60
    .return ()
  control_108:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, "payload"
    .return ($P115)
.end


.namespace ["File"]
.sub "is_file"  :subid("19_1268405356.73703") :outer("11_1268405356.73703")
    .param pmc param_119
# .annotate "line", 64
    new $P118, 'ExceptionHandler'
    set_addr $P118, control_117
    $P118."handle_types"(58)
    push_eh $P118
    .lex "$path", param_119
# .annotate "line", 65
    new $P120, "Exception"
    set $P120['type'], 58
    $P121 = "_get_pmc"()
    find_lex $P122, "$path"
    $P123 = $P121."is_file"($P122)
    setattribute $P120, 'payload', $P123
    throw $P120
# .annotate "line", 64
    .return ()
  control_117:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P124, exception, "payload"
    .return ($P124)
.end


.namespace ["File"]
.sub "is_link"  :subid("20_1268405356.73703") :outer("11_1268405356.73703")
    .param pmc param_128
# .annotate "line", 68
    new $P127, 'ExceptionHandler'
    set_addr $P127, control_126
    $P127."handle_types"(58)
    push_eh $P127
    .lex "$path", param_128
# .annotate "line", 69
    new $P129, "Exception"
    set $P129['type'], 58
    $P130 = "_get_pmc"()
    find_lex $P131, "$path"
    $P132 = $P130."is_link"($P131)
    setattribute $P129, 'payload', $P132
    throw $P129
# .annotate "line", 68
    .return ()
  control_126:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P133, exception, "payload"
    .return ($P133)
.end


.namespace ["File"]
.sub "rename"  :subid("21_1268405356.73703") :outer("11_1268405356.73703")
    .param pmc param_137
    .param pmc param_138
# .annotate "line", 72
    new $P136, 'ExceptionHandler'
    set_addr $P136, control_135
    $P136."handle_types"(58)
    push_eh $P136
    .lex "$from", param_137
    .lex "$to", param_138
# .annotate "line", 73
    $P139 = "_get_pmc"()
    find_lex $P140, "$from"
    find_lex $P141, "$to"
    $P142 = $P139."rename"($P140, $P141)
# .annotate "line", 72
    .return ($P142)
  control_135:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P143, exception, "payload"
    .return ($P143)
.end


.namespace ["File"]
.sub "slurp"  :subid("22_1268405356.73703") :outer("11_1268405356.73703")
    .param pmc param_147
# .annotate "line", 76
    new $P146, 'ExceptionHandler'
    set_addr $P146, control_145
    $P146."handle_types"(58)
    push_eh $P146
    .lex "$path", param_147
# .annotate "line", 77
    new $P148, "Undef"
    .lex "$fh", $P148
# .annotate "line", 78
    new $P149, "Undef"
    .lex "$data", $P149
# .annotate "line", 77
    new $P150, "String"
    assign $P150, "FileHandle"
    set $S151, $P150
    new $P152, $S151
    store_lex "$fh", $P152
# .annotate "line", 78
    find_lex $P153, "$fh"
    find_lex $P154, "$path"
    $P155 = $P153."readall"($P154)
    store_lex "$data", $P155
# .annotate "line", 76
    .return ($P155)
  control_145:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P156, exception, "payload"
    .return ($P156)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268405360.30709")
# .annotate "line", 0
    get_hll_global $P14, ["Key"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["Key"], "_block13" 
    capture_lex $P14
    $P108 = $P14()
# .annotate "line", 1
    .return ($P108)
.end


.namespace ["Key"]
.sub "_block13"  :subid("11_1268405360.30709") :outer("10_1268405360.30709")
# .annotate "line", 6
    .const 'Sub' $P100 = "18_1268405360.30709" 
    capture_lex $P100
    .const 'Sub' $P96 = "17_1268405360.30709" 
    capture_lex $P96
    .const 'Sub' $P86 = "16_1268405360.30709" 
    capture_lex $P86
    .const 'Sub' $P77 = "15_1268405360.30709" 
    capture_lex $P77
    .const 'Sub' $P21 = "13_1268405360.30709" 
    capture_lex $P21
    .const 'Sub' $P15 = "12_1268405360.30709" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268405360.30709" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 19
    .const 'Sub' $P21 = "13_1268405360.30709" 
    capture_lex $P21
    .lex "create_key", $P21
# .annotate "line", 6
    find_lex $P76, "_pre_initload"
# .annotate "line", 14
    find_lex $P95, "create_key"
# .annotate "line", 54
    .const 'Sub' $P100 = "18_1268405360.30709" 
    capture_lex $P100
# .annotate "line", 6
    .return ($P100)
.end


.namespace ["Key"]
.sub "_pre_initload"  :subid("12_1268405360.30709") :outer("11_1268405360.30709")
# .annotate "line", 6
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 7
    get_hll_global $P18, "P6metaclass"
    $P19 = $P18."register"("Key")
# .annotate "line", 6
    .return ($P19)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P20, exception, "payload"
    .return ($P20)
.end


.namespace ["Key"]
.sub "create_key"  :subid("13_1268405360.30709") :outer("11_1268405360.30709")
    .param pmc param_24 :slurpy
    .param pmc param_25 :slurpy :named
# .annotate "line", 19
    .const 'Sub' $P35 = "14_1268405360.30709" 
    capture_lex $P35
    new $P23, 'ExceptionHandler'
    set_addr $P23, control_22
    $P23."handle_types"(58)
    push_eh $P23
    .lex "@parts", param_24
    .lex "%opts", param_25
# .annotate "line", 20
    new $P26, "Undef"
    .lex "$key", $P26
# .annotate "line", 21
    new $P27, "Undef"
    .lex "$segment", $P27
# .annotate "line", 19
    find_lex $P28, "$key"
    find_lex $P29, "$segment"
# .annotate "line", 23
    find_lex $P31, "@parts"
    defined $I32, $P31
    unless $I32, for_undef_19
    iter $P30, $P31
    new $P72, 'ExceptionHandler'
    set_addr $P72, loop71_handler
    $P72."handle_types"(65, 67, 66)
    push_eh $P72
  loop71_test:
    unless $P30, loop71_done
    shift $P33, $P30
  loop71_redo:
    .const 'Sub' $P35 = "14_1268405360.30709" 
    capture_lex $P35
    $P35($P33)
  loop71_next:
    goto loop71_test
  loop71_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P73, exception, 'type'
    eq $P73, 65, loop71_next
    eq $P73, 67, loop71_redo
  loop71_done:
    pop_eh 
  for_undef_19:
    find_lex $P74, "$key"
# .annotate "line", 19
    .return ($P74)
  control_22:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P75, exception, "payload"
    .return ($P75)
.end


.namespace ["Key"]
.sub "_block34"  :anon :subid("14_1268405360.30709") :outer("13_1268405360.30709")
    .param pmc param_36
# .annotate "line", 23
    .lex "$_", param_36
# .annotate "line", 24
    new $P37, "String"
    assign $P37, "Key"
    set $S38, $P37
    new $P39, $S38
    store_lex "$segment", $P39
# .annotate "line", 26
    find_lex $P41, "$_"
    isa $I42, $P41, "Integer"
    if $I42, if_40
# .annotate "line", 27
    find_lex $P47, "$_"
    isa $I48, $P47, "Float"
    if $I48, if_46
# .annotate "line", 28
    find_lex $P53, "$_"
    isa $I54, $P53, "String"
    if $I54, if_52
# .annotate "line", 30
    get_hll_global $P59, ["Exception"], "InvalidArgument"
    isa $I60, $P59, "P6protoobject"
    if $I60, if_58
# .annotate "line", 36
    die "Arguments to Key.new must be Integer, String, or Float"
# .annotate "line", 35
    goto if_58_end
  if_58:
# .annotate "line", 31
    get_hll_global $P61, ["Exception"], "InvalidArgument"
    $P62 = $P61."new"("Arguments to Key.new must be Integer, String, or Float" :named("message"))
    $P62."throw"()
  if_58_end:
# .annotate "line", 29
    goto if_52_end
  if_52:
# .annotate "line", 28
    find_lex $P55, "$segment"
    find_lex $P56, "$_"
    set $S57, $P56
    assign $P55, $S57
  if_52_end:
    goto if_46_end
  if_46:
# .annotate "line", 27
    find_lex $P49, "$segment"
    find_lex $P50, "$_"
    set $N51, $P50
    assign $P49, $N51
  if_46_end:
    goto if_40_end
  if_40:
# .annotate "line", 26
    find_lex $P43, "$segment"
    find_lex $P44, "$_"
    set $I45, $P44
    assign $P43, $I45
  if_40_end:
# .annotate "line", 40
    find_lex $P65, "$key"
    defined $I66, $P65
    if $I66, if_64
# .annotate "line", 44
    find_lex $P70, "$segment"
    store_lex "$key", $P70
# .annotate "line", 43
    set $P63, $P70
# .annotate "line", 40
    goto if_64_end
  if_64:
# .annotate "line", 41
    find_lex $P67, "$key"
    find_lex $P68, "$segment"
    $P69 = $P67."push"($P68)
# .annotate "line", 40
    set $P63, $P69
  if_64_end:
# .annotate "line", 23
    .return ($P63)
.end


.namespace ["Key"]
.sub "__dump"  :subid("15_1268405360.30709") :method :outer("11_1268405360.30709")
    .param pmc param_80
    .param pmc param_81
# .annotate "line", 10
    new $P79, 'ExceptionHandler'
    set_addr $P79, control_78
    $P79."handle_types"(58)
    push_eh $P79
    .lex "self", self
    .lex "$dumper", param_80
    .lex "$label", param_81
# .annotate "line", 11
    find_lex $P82, "self"
    get_repr $S83, $P82
    $P84 = "print"($S83)
# .annotate "line", 10
    .return ($P84)
  control_78:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P85, exception, "payload"
    .return ($P85)
.end


.namespace ["Key"]
.sub "new"  :subid("16_1268405360.30709") :method :outer("11_1268405360.30709")
    .param pmc param_89 :slurpy
    .param pmc param_90 :slurpy :named
# .annotate "line", 14
    new $P88, 'ExceptionHandler'
    set_addr $P88, control_87
    $P88."handle_types"(58)
    push_eh $P88
    .lex "self", self
    .lex "@parts", param_89
    .lex "%named", param_90
# .annotate "line", 15
    find_lex $P91, "@parts"
    find_lex $P92, "%named"
    $P93 = "create_key"($P91 :flat, $P92 :flat)
# .annotate "line", 14
    .return ($P93)
  control_87:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P94, exception, "payload"
    .return ($P94)
.end


.namespace ["Key"]
.sub "defined"  :subid("17_1268405360.30709") :method :outer("11_1268405360.30709")
# .annotate "line", 52
    new $P98, 'ExceptionHandler'
    set_addr $P98, control_97
    $P98."handle_types"(58)
    push_eh $P98
    .lex "self", self
    .return (1)
  control_97:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P99, exception, "payload"
    .return ($P99)
.end


.namespace ["Key"]
.sub "push"  :subid("18_1268405360.30709") :method :outer("11_1268405360.30709")
    .param pmc param_103
# .annotate "line", 54
    new $P102, 'ExceptionHandler'
    set_addr $P102, control_101
    $P102."handle_types"(58)
    push_eh $P102
    .lex "self", self
    .lex "$obj", param_103
# .annotate "line", 55
    find_lex $P104, "self"
    find_lex $P105, "$obj"
    push $P104, $P105
    find_lex $P106, "self"
# .annotate "line", 54
    .return ($P106)
  control_101:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268405395.94762")
# .annotate "line", 0
    get_hll_global $P14, ["Hash"], "_block13" 
    capture_lex $P14
# .annotate "line", 53
    get_hll_global $P14, ["Hash"], "_block13" 
    capture_lex $P14
    $P322 = $P14()
# .annotate "line", 1
    .return ($P322)
.end


.namespace ["Hash"]
.sub "_block13"  :subid("11_1268405395.94762") :outer("10_1268405395.94762")
# .annotate "line", 53
    .const 'Sub' $P301 = "32_1268405395.94762" 
    capture_lex $P301
    .const 'Sub' $P276 = "30_1268405395.94762" 
    capture_lex $P276
    .const 'Sub' $P250 = "28_1268405395.94762" 
    capture_lex $P250
    .const 'Sub' $P226 = "26_1268405395.94762" 
    capture_lex $P226
    .const 'Sub' $P205 = "24_1268405395.94762" 
    capture_lex $P205
    .const 'Sub' $P177 = "22_1268405395.94762" 
    capture_lex $P177
    .const 'Sub' $P169 = "21_1268405395.94762" 
    capture_lex $P169
    .const 'Sub' $P163 = "20_1268405395.94762" 
    capture_lex $P163
    .const 'Sub' $P157 = "19_1268405395.94762" 
    capture_lex $P157
    .const 'Sub' $P151 = "18_1268405395.94762" 
    capture_lex $P151
    .const 'Sub' $P73 = "15_1268405395.94762" 
    capture_lex $P73
    .const 'Sub' $P15 = "12_1268405395.94762" 
    capture_lex $P15
# .annotate "line", 138
    .const 'Sub' $P15 = "12_1268405395.94762" 
    capture_lex $P15
    .lex "merge", $P15
# .annotate "line", 170
    .const 'Sub' $P73 = "15_1268405395.94762" 
    capture_lex $P73
    .lex "merge_keys", $P73
# .annotate "line", 121
    find_lex $P274, "merge"
    find_lex $P275, "merge_keys"
# .annotate "line", 233
    .const 'Sub' $P301 = "32_1268405395.94762" 
    capture_lex $P301
# .annotate "line", 53
    .return ($P301)
.end


.namespace ["Hash"]
.sub "merge"  :subid("12_1268405395.94762") :outer("11_1268405395.94762")
    .param pmc param_18
    .param pmc param_19 :slurpy
    .param pmc param_20 :optional :named("into")
    .param int has_param_20 :opt_flag
    .param pmc param_22 :optional :named("use_last")
    .param int has_param_22 :opt_flag
# .annotate "line", 138
    .const 'Sub' $P40 = "13_1268405395.94762" 
    capture_lex $P40
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "%first", param_18
    .lex "@hashes", param_19
    if has_param_20, optparam_34
    find_lex $P21, "%first"
    set param_20, $P21
  optparam_34:
    .lex "%into", param_20
    if has_param_22, optparam_35
    new $P23, "Undef"
    set param_22, $P23
  optparam_35:
    .lex "$use_last", param_22
# .annotate "line", 142
    new $P24, "Hash"
    .lex "%stored", $P24
# .annotate "line", 140
    find_lex $P25, "@hashes"
    find_lex $P26, "%first"
    $P25."unshift"($P26)
# .annotate "line", 142
    find_lex $P27, "%into"
    store_lex "%stored", $P27
# .annotate "line", 144
    find_lex $P29, "$use_last"
    unless $P29, if_28_end
# .annotate "line", 145
    get_hll_global $P30, ["Array"], "reverse"
    find_lex $P31, "@hashes"
    $P32 = $P30($P31)
    store_lex "@hashes", $P32
# .annotate "line", 146
    get_hll_global $P33, ["Hash"], "empty"
    $P34 = $P33()
    store_lex "%stored", $P34
  if_28_end:
# .annotate "line", 149
    find_lex $P36, "@hashes"
    defined $I37, $P36
    unless $I37, for_undef_36
    iter $P35, $P36
    new $P68, 'ExceptionHandler'
    set_addr $P68, loop67_handler
    $P68."handle_types"(65, 67, 66)
    push_eh $P68
  loop67_test:
    unless $P35, loop67_done
    shift $P38, $P35
  loop67_redo:
    .const 'Sub' $P40 = "13_1268405395.94762" 
    capture_lex $P40
    $P40($P38)
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
  for_undef_36:
# .annotate "line", 160
    new $P70, "Exception"
    set $P70['type'], 58
    find_lex $P71, "%into"
    setattribute $P70, 'payload', $P71
    throw $P70
# .annotate "line", 138
    .return ()
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P72, exception, "payload"
    .return ($P72)
.end


.namespace ["Hash"]
.sub "_block39"  :anon :subid("13_1268405395.94762") :outer("12_1268405395.94762")
    .param pmc param_42
# .annotate "line", 149
    .const 'Sub' $P49 = "14_1268405395.94762" 
    capture_lex $P49
# .annotate "line", 150
    new $P41, "Undef"
    .lex "$hash", $P41
    .lex "$_", param_42
    find_lex $P43, "$_"
    store_lex "$hash", $P43
# .annotate "line", 151
    find_lex $P45, "$hash"
    defined $I46, $P45
    unless $I46, for_undef_37
    iter $P44, $P45
    new $P65, 'ExceptionHandler'
    set_addr $P65, loop64_handler
    $P65."handle_types"(65, 67, 66)
    push_eh $P65
  loop64_test:
    unless $P44, loop64_done
    shift $P47, $P44
  loop64_redo:
    .const 'Sub' $P49 = "14_1268405395.94762" 
    capture_lex $P49
    $P49($P47)
  loop64_next:
    goto loop64_test
  loop64_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P66, exception, 'type'
    eq $P66, 65, loop64_next
    eq $P66, 67, loop64_redo
  loop64_done:
    pop_eh 
  for_undef_37:
# .annotate "line", 149
    .return ($P44)
.end


.namespace ["Hash"]
.sub "_block48"  :anon :subid("14_1268405395.94762") :outer("13_1268405395.94762")
    .param pmc param_50
# .annotate "line", 151
    .lex "$_", param_50
# .annotate "line", 152
    get_hll_global $P53, ["Hash"], "exists"
    find_lex $P54, "%stored"
    find_lex $P55, "$_"
    $P56 = $P53($P54, $P55)
    unless $P56, unless_52
    set $P51, $P56
    goto unless_52_end
  unless_52:
# .annotate "line", 155
    find_lex $P57, "$_"
    find_lex $P58, "$hash"
    unless_null $P58, vivify_38
    new $P58, "Hash"
  vivify_38:
    set $P59, $P58[$P57]
    unless_null $P59, vivify_39
    new $P59, "Undef"
  vivify_39:
    find_lex $P60, "$_"
    find_lex $P61, "%stored"
    unless_null $P61, vivify_40
    new $P61, "Hash"
    store_lex "%stored", $P61
  vivify_40:
    set $P61[$P60], $P59
    find_lex $P62, "$_"
    find_lex $P63, "%into"
    unless_null $P63, vivify_41
    new $P63, "Hash"
    store_lex "%into", $P63
  vivify_41:
    set $P63[$P62], $P59
# .annotate "line", 152
    set $P51, $P59
  unless_52_end:
# .annotate "line", 151
    .return ($P51)
.end


.namespace ["Hash"]
.sub "merge_keys"  :subid("15_1268405395.94762") :outer("11_1268405395.94762")
    .param pmc param_76
    .param pmc param_77 :slurpy
    .param pmc param_78 :named("keys")
    .param pmc param_79 :optional :named("into")
    .param int has_param_79 :opt_flag
    .param pmc param_81 :optional :named("use_last")
    .param int has_param_81 :opt_flag
# .annotate "line", 170
    .const 'Sub' $P111 = "16_1268405395.94762" 
    capture_lex $P111
    new $P75, 'ExceptionHandler'
    set_addr $P75, control_74
    $P75."handle_types"(58)
    push_eh $P75
    .lex "%first", param_76
    .lex "@hashes", param_77
    .lex "@keys", param_78
    if has_param_79, optparam_42
    new $P80, "Hash"
    set param_79, $P80
  optparam_42:
    .lex "%into", param_79
    if has_param_81, optparam_43
    new $P82, "Undef"
    set param_81, $P82
  optparam_43:
    .lex "$use_last", param_81
# .annotate "line", 181
    new $P83, "Hash"
    .lex "%stored", $P83
# .annotate "line", 171
    find_lex $P84, "@hashes"
    find_lex $P85, "%first"
    $P84."unshift"($P85)
# .annotate "line", 173
    get_hll_global $P87, ["Opcode"], "defined"
    find_lex $P88, "%into"
    $P89 = $P87($P88)
    if $P89, unless_86_end
# .annotate "line", 174
    find_lex $P90, "@hashes"
    $P91 = $P90."shift"()
    store_lex "%into", $P91
# .annotate "line", 176
    get_hll_global $P93, ["Opcode"], "defined"
    find_lex $P94, "%into"
    $P95 = $P93($P94)
    if $P95, unless_92_end
# .annotate "line", 177
    get_hll_global $P96, "Hash"
    $P97 = $P96."new"()
    store_lex "%into", $P97
  unless_92_end:
  unless_86_end:
# .annotate "line", 181
    find_lex $P98, "%into"
    store_lex "%stored", $P98
# .annotate "line", 183
    find_lex $P100, "$use_last"
    unless $P100, if_99_end
# .annotate "line", 184
    get_hll_global $P101, ["Array"], "reverse"
    find_lex $P102, "@hashes"
    $P103 = $P101($P102)
    store_lex "@hashes", $P103
# .annotate "line", 185
    get_hll_global $P104, ["Hash"], "empty"
    $P105 = $P104()
    store_lex "%stored", $P105
  if_99_end:
# .annotate "line", 188
    find_lex $P107, "@hashes"
    defined $I108, $P107
    unless $I108, for_undef_44
    iter $P106, $P107
    new $P146, 'ExceptionHandler'
    set_addr $P146, loop145_handler
    $P146."handle_types"(65, 67, 66)
    push_eh $P146
  loop145_test:
    unless $P106, loop145_done
    shift $P109, $P106
  loop145_redo:
    .const 'Sub' $P111 = "16_1268405395.94762" 
    capture_lex $P111
    $P111($P109)
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
  for_undef_44:
# .annotate "line", 199
    new $P148, "Exception"
    set $P148['type'], 58
    find_lex $P149, "%into"
    setattribute $P148, 'payload', $P149
    throw $P148
# .annotate "line", 170
    .return ()
  control_74:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P150, exception, "payload"
    .return ($P150)
.end


.namespace ["Hash"]
.sub "_block110"  :anon :subid("16_1268405395.94762") :outer("15_1268405395.94762")
    .param pmc param_113
# .annotate "line", 188
    .const 'Sub' $P120 = "17_1268405395.94762" 
    capture_lex $P120
# .annotate "line", 189
    new $P112, "Undef"
    .lex "$hash", $P112
    .lex "$_", param_113
    find_lex $P114, "$_"
    store_lex "$hash", $P114
# .annotate "line", 191
    find_lex $P116, "@keys"
    defined $I117, $P116
    unless $I117, for_undef_45
    iter $P115, $P116
    new $P143, 'ExceptionHandler'
    set_addr $P143, loop142_handler
    $P143."handle_types"(65, 67, 66)
    push_eh $P143
  loop142_test:
    unless $P115, loop142_done
    shift $P118, $P115
  loop142_redo:
    .const 'Sub' $P120 = "17_1268405395.94762" 
    capture_lex $P120
    $P120($P118)
  loop142_next:
    goto loop142_test
  loop142_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P144, exception, 'type'
    eq $P144, 65, loop142_next
    eq $P144, 67, loop142_redo
  loop142_done:
    pop_eh 
  for_undef_45:
# .annotate "line", 188
    .return ($P115)
.end


.namespace ["Hash"]
.sub "_block119"  :anon :subid("17_1268405395.94762") :outer("16_1268405395.94762")
    .param pmc param_121
# .annotate "line", 191
    .lex "$_", param_121
# .annotate "line", 192
    get_hll_global $P126, ["Hash"], "exists"
    find_lex $P127, "%stored"
    find_lex $P128, "$_"
    $P129 = $P126($P127, $P128)
    isfalse $I130, $P129
    if $I130, if_125
    new $P124, 'Integer'
    set $P124, $I130
    goto if_125_end
  if_125:
    get_hll_global $P131, ["Hash"], "exists"
    find_lex $P132, "$hash"
    find_lex $P133, "$_"
    $P134 = $P131($P132, $P133)
    set $P124, $P134
  if_125_end:
    if $P124, if_123
    set $P122, $P124
    goto if_123_end
  if_123:
# .annotate "line", 194
    find_lex $P135, "$_"
    find_lex $P136, "$hash"
    unless_null $P136, vivify_46
    new $P136, "Hash"
  vivify_46:
    set $P137, $P136[$P135]
    unless_null $P137, vivify_47
    new $P137, "Undef"
  vivify_47:
    find_lex $P138, "$_"
    find_lex $P139, "%stored"
    unless_null $P139, vivify_48
    new $P139, "Hash"
    store_lex "%stored", $P139
  vivify_48:
    set $P139[$P138], $P137
    find_lex $P140, "$_"
    find_lex $P141, "%into"
    unless_null $P141, vivify_49
    new $P141, "Hash"
    store_lex "%into", $P141
  vivify_49:
    set $P141[$P140], $P137
# .annotate "line", 192
    set $P122, $P137
  if_123_end:
# .annotate "line", 191
    .return ($P122)
.end


.namespace ["Hash"]
.sub "contains"  :subid("18_1268405395.94762") :method :outer("11_1268405395.94762")
    .param pmc param_154
# .annotate "line", 53
    new $P153, 'ExceptionHandler'
    set_addr $P153, control_152
    $P153."handle_types"(58)
    push_eh $P153
    .lex "self", self
    .lex "$key", param_154
# .annotate "line", 54

		$P0 = find_lex 'self'
		$P1 = find_lex '$key'
		$I0 = exists $P0[$P1]
		$P155 = box $I0
	
# .annotate "line", 53
    .return ($P155)
  control_152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P156, exception, "payload"
    .return ($P156)
.end


.namespace ["Hash"]
.sub "delete"  :subid("19_1268405395.94762") :method :outer("11_1268405395.94762")
    .param pmc param_160
# .annotate "line", 73
    new $P159, 'ExceptionHandler'
    set_addr $P159, control_158
    $P159."handle_types"(58)
    push_eh $P159
    .lex "self", self
    .lex "$key", param_160
# .annotate "line", 74

		$P161  = find_lex 'self'
		$P1 = find_lex '$key'
		delete $P161[$P1]
	
# .annotate "line", 73
    .return ($P161)
  control_158:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P162, exception, "payload"
    .return ($P162)
.end


.namespace ["Hash"]
.sub "elems"  :subid("20_1268405395.94762") :method :outer("11_1268405395.94762")
# .annotate "line", 81
    new $P165, 'ExceptionHandler'
    set_addr $P165, control_164
    $P165."handle_types"(58)
    push_eh $P165
    .lex "self", self
# .annotate "line", 82
    find_lex $P166, "self"
    elements $I167, $P166
# .annotate "line", 81
    .return ($I167)
  control_164:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P168, exception, "payload"
    .return ($P168)
.end


.namespace ["Hash"]
.sub "exists"  :subid("21_1268405395.94762") :method :outer("11_1268405395.94762")
    .param pmc param_172
# .annotate "line", 85
    new $P171, 'ExceptionHandler'
    set_addr $P171, control_170
    $P171."handle_types"(58)
    push_eh $P171
    .lex "self", self
    .lex "$key", param_172
# .annotate "line", 86
    find_lex $P173, "self"
    find_lex $P174, "$key"
    $P175 = $P173."contains"($P174)
# .annotate "line", 85
    .return ($P175)
  control_170:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P176, exception, "payload"
    .return ($P176)
.end


.namespace ["Hash"]
.sub "grep"  :subid("22_1268405395.94762") :method :outer("11_1268405395.94762")
    .param pmc param_180
# .annotate "line", 89
    .const 'Sub' $P188 = "23_1268405395.94762" 
    capture_lex $P188
    new $P179, 'ExceptionHandler'
    set_addr $P179, control_178
    $P179."handle_types"(58)
    push_eh $P179
    .lex "self", self
    .lex "&match", param_180
# .annotate "line", 90
    new $P181, "Hash"
    .lex "%matches", $P181
# .annotate "line", 89
    find_lex $P182, "%matches"
# .annotate "line", 92
    find_lex $P184, "self"
    defined $I185, $P184
    unless $I185, for_undef_50
    iter $P183, $P184
    new $P201, 'ExceptionHandler'
    set_addr $P201, loop200_handler
    $P201."handle_types"(65, 67, 66)
    push_eh $P201
  loop200_test:
    unless $P183, loop200_done
    shift $P186, $P183
  loop200_redo:
    .const 'Sub' $P188 = "23_1268405395.94762" 
    capture_lex $P188
    $P188($P186)
  loop200_next:
    goto loop200_test
  loop200_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P202, exception, 'type'
    eq $P202, 65, loop200_next
    eq $P202, 67, loop200_redo
  loop200_done:
    pop_eh 
  for_undef_50:
    find_lex $P203, "%matches"
# .annotate "line", 89
    .return ($P203)
  control_178:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P204, exception, "payload"
    .return ($P204)
.end


.namespace ["Hash"]
.sub "_block187"  :anon :subid("23_1268405395.94762") :outer("22_1268405395.94762")
    .param pmc param_189
# .annotate "line", 92
    .lex "$_", param_189
# .annotate "line", 94
    find_lex $P192, "&match"
    find_lex $P193, "$_"
    $P194 = $P192($P193)
    if $P194, if_191
    set $P190, $P194
    goto if_191_end
  if_191:
# .annotate "line", 93
    find_lex $P195, "$_"
    $P196 = $P195."value"()
    find_lex $P197, "$_"
    $P198 = $P197."key"()
    find_lex $P199, "%matches"
    unless_null $P199, vivify_51
    new $P199, "Hash"
    store_lex "%matches", $P199
  vivify_51:
    set $P199[$P198], $P196
    set $P190, $P196
  if_191_end:
# .annotate "line", 92
    .return ($P190)
.end


.namespace ["Hash"]
.sub "keys"  :subid("24_1268405395.94762") :method :outer("11_1268405395.94762")
# .annotate "line", 100
    .const 'Sub' $P215 = "25_1268405395.94762" 
    capture_lex $P215
    new $P207, 'ExceptionHandler'
    set_addr $P207, control_206
    $P207."handle_types"(58)
    push_eh $P207
    .lex "self", self
# .annotate "line", 101
    new $P208, "ResizablePMCArray"
    .lex "@keys", $P208
# .annotate "line", 100
    find_lex $P209, "@keys"
# .annotate "line", 103
    find_lex $P211, "self"
    defined $I212, $P211
    unless $I212, for_undef_52
    iter $P210, $P211
    new $P222, 'ExceptionHandler'
    set_addr $P222, loop221_handler
    $P222."handle_types"(65, 67, 66)
    push_eh $P222
  loop221_test:
    unless $P210, loop221_done
    shift $P213, $P210
  loop221_redo:
    .const 'Sub' $P215 = "25_1268405395.94762" 
    capture_lex $P215
    $P215($P213)
  loop221_next:
    goto loop221_test
  loop221_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P223, exception, 'type'
    eq $P223, 65, loop221_next
    eq $P223, 67, loop221_redo
  loop221_done:
    pop_eh 
  for_undef_52:
    find_lex $P224, "@keys"
# .annotate "line", 100
    .return ($P224)
  control_206:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P225, exception, "payload"
    .return ($P225)
.end


.namespace ["Hash"]
.sub "_block214"  :anon :subid("25_1268405395.94762") :outer("24_1268405395.94762")
    .param pmc param_216
# .annotate "line", 103
    .lex "$_", param_216
# .annotate "line", 104
    find_lex $P217, "@keys"
    find_lex $P218, "$_"
    $P219 = $P218."key"()
    $P220 = $P217."push"($P219)
# .annotate "line", 103
    .return ($P220)
.end


.namespace ["Hash"]
.sub "kv"  :subid("26_1268405395.94762") :method :outer("11_1268405395.94762")
# .annotate "line", 110
    .const 'Sub' $P236 = "27_1268405395.94762" 
    capture_lex $P236
    new $P228, 'ExceptionHandler'
    set_addr $P228, control_227
    $P228."handle_types"(58)
    push_eh $P228
    .lex "self", self
# .annotate "line", 111
    new $P229, "ResizablePMCArray"
    .lex "@kv", $P229
# .annotate "line", 110
    find_lex $P230, "@kv"
# .annotate "line", 113
    find_lex $P232, "self"
    defined $I233, $P232
    unless $I233, for_undef_53
    iter $P231, $P232
    new $P246, 'ExceptionHandler'
    set_addr $P246, loop245_handler
    $P246."handle_types"(65, 67, 66)
    push_eh $P246
  loop245_test:
    unless $P231, loop245_done
    shift $P234, $P231
  loop245_redo:
    .const 'Sub' $P236 = "27_1268405395.94762" 
    capture_lex $P236
    $P236($P234)
  loop245_next:
    goto loop245_test
  loop245_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P247, exception, 'type'
    eq $P247, 65, loop245_next
    eq $P247, 67, loop245_redo
  loop245_done:
    pop_eh 
  for_undef_53:
    find_lex $P248, "@kv"
# .annotate "line", 110
    .return ($P248)
  control_227:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P249, exception, "payload"
    .return ($P249)
.end


.namespace ["Hash"]
.sub "_block235"  :anon :subid("27_1268405395.94762") :outer("26_1268405395.94762")
    .param pmc param_237
# .annotate "line", 113
    .lex "$_", param_237
# .annotate "line", 114
    find_lex $P238, "@kv"
    find_lex $P239, "$_"
    $P240 = $P239."key"()
    $P238."push"($P240)
# .annotate "line", 115
    find_lex $P241, "@kv"
    find_lex $P242, "$_"
    $P243 = $P242."value"()
    $P244 = $P241."push"($P243)
# .annotate "line", 113
    .return ($P244)
.end


.namespace ["Hash"]
.sub "map"  :subid("28_1268405395.94762") :method :outer("11_1268405395.94762")
    .param pmc param_253
# .annotate "line", 121
    .const 'Sub' $P261 = "29_1268405395.94762" 
    capture_lex $P261
    new $P252, 'ExceptionHandler'
    set_addr $P252, control_251
    $P252."handle_types"(58)
    push_eh $P252
    .lex "self", self
    .lex "&match", param_253
# .annotate "line", 122
    new $P254, "Hash"
    .lex "%result", $P254
# .annotate "line", 121
    find_lex $P255, "%result"
# .annotate "line", 124
    find_lex $P257, "self"
    defined $I258, $P257
    unless $I258, for_undef_54
    iter $P256, $P257
    new $P270, 'ExceptionHandler'
    set_addr $P270, loop269_handler
    $P270."handle_types"(65, 67, 66)
    push_eh $P270
  loop269_test:
    unless $P256, loop269_done
    shift $P259, $P256
  loop269_redo:
    .const 'Sub' $P261 = "29_1268405395.94762" 
    capture_lex $P261
    $P261($P259)
  loop269_next:
    goto loop269_test
  loop269_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P271, exception, 'type'
    eq $P271, 65, loop269_next
    eq $P271, 67, loop269_redo
  loop269_done:
    pop_eh 
  for_undef_54:
    find_lex $P272, "%result"
# .annotate "line", 121
    .return ($P272)
  control_251:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P273, exception, "payload"
    .return ($P273)
.end


.namespace ["Hash"]
.sub "_block260"  :anon :subid("29_1268405395.94762") :outer("28_1268405395.94762")
    .param pmc param_262
# .annotate "line", 124
    .lex "$_", param_262
# .annotate "line", 125
    find_lex $P263, "&match"
    find_lex $P264, "$_"
    $P265 = $P263($P264)
    find_lex $P266, "$_"
    $P267 = $P266."key"()
    find_lex $P268, "%result"
    unless_null $P268, vivify_55
    new $P268, "Hash"
    store_lex "%result", $P268
  vivify_55:
    set $P268[$P267], $P265
# .annotate "line", 124
    .return ($P265)
.end


.namespace ["Hash"]
.sub "new"  :subid("30_1268405395.94762") :method :outer("11_1268405395.94762")
    .param pmc param_279 :slurpy
    .param pmc param_280 :slurpy :named
# .annotate "line", 217
    .const 'Sub' $P285 = "31_1268405395.94762" 
    capture_lex $P285
    new $P278, 'ExceptionHandler'
    set_addr $P278, control_277
    $P278."handle_types"(58)
    push_eh $P278
    .lex "self", self
    .lex "@pos", param_279
    .lex "%pairs", param_280
# .annotate "line", 218
    find_lex $P282, "@pos"
    $P283 = $P282."elems"()
    unless $P283, if_281_end
    .const 'Sub' $P285 = "31_1268405395.94762" 
    capture_lex $P285
    $P285()
  if_281_end:
    find_lex $P299, "%pairs"
# .annotate "line", 217
    .return ($P299)
  control_277:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P300, exception, "payload"
    .return ($P300)
.end


.namespace ["Hash"]
.sub "_block284"  :anon :subid("31_1268405395.94762") :outer("30_1268405395.94762")
# .annotate "line", 219
    new $P286, "Undef"
    .lex "$message", $P286
    new $P287, "String"
    assign $P287, "Invalid call to Hash.new with positional args."
    store_lex "$message", $P287
# .annotate "line", 221
    find_lex $P289, "@pos"
    unless_null $P289, vivify_56
    new $P289, "ResizablePMCArray"
  vivify_56:
    set $P290, $P289[0]
    unless_null $P290, vivify_57
    new $P290, "Undef"
  vivify_57:
    new $P291, "String"
    assign $P291, "NameSpace"
    set $S292, $P291
    isa $I293, $P290, $S292
    unless $I293, if_288_end
# .annotate "line", 223
    find_lex $P294, "$message"
    concat $P295, $P294, " Likely a call to {@pos[0].string_name}.new() - before class was created"
    store_lex "$message", $P295
  if_288_end:
# .annotate "line", 226
    find_lex $P296, "@pos"
    find_lex $P297, "%pairs"
    "_dumper"($P296, $P297)
# .annotate "line", 227
    find_lex $P298, "$message"
    die $P298
# .annotate "line", 218
    .return ()
.end


.namespace ["Hash"]
.sub "values"  :subid("32_1268405395.94762") :method :outer("11_1268405395.94762")
# .annotate "line", 233
    .const 'Sub' $P311 = "33_1268405395.94762" 
    capture_lex $P311
    new $P303, 'ExceptionHandler'
    set_addr $P303, control_302
    $P303."handle_types"(58)
    push_eh $P303
    .lex "self", self
# .annotate "line", 234
    new $P304, "ResizablePMCArray"
    .lex "@values", $P304
# .annotate "line", 233
    find_lex $P305, "@values"
# .annotate "line", 236
    find_lex $P307, "self"
    defined $I308, $P307
    unless $I308, for_undef_58
    iter $P306, $P307
    new $P318, 'ExceptionHandler'
    set_addr $P318, loop317_handler
    $P318."handle_types"(65, 67, 66)
    push_eh $P318
  loop317_test:
    unless $P306, loop317_done
    shift $P309, $P306
  loop317_redo:
    .const 'Sub' $P311 = "33_1268405395.94762" 
    capture_lex $P311
    $P311($P309)
  loop317_next:
    goto loop317_test
  loop317_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P319, exception, 'type'
    eq $P319, 65, loop317_next
    eq $P319, 67, loop317_redo
  loop317_done:
    pop_eh 
  for_undef_58:
    find_lex $P320, "@values"
# .annotate "line", 233
    .return ($P320)
  control_302:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P321, exception, "payload"
    .return ($P321)
.end


.namespace ["Hash"]
.sub "_block310"  :anon :subid("33_1268405395.94762") :outer("32_1268405395.94762")
    .param pmc param_312
# .annotate "line", 236
    .lex "$_", param_312
# .annotate "line", 237
    find_lex $P313, "@values"
    find_lex $P314, "$_"
    $P315 = $P314."value"()
    $P316 = $P313."push"($P315)
# .annotate "line", 236
    .return ($P316)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268405348.1069")
# .annotate "line", 0
    get_hll_global $P14, ["NameSpace"], "_block13" 
    capture_lex $P14
# .annotate "line", 9
    get_hll_global $P14, ["NameSpace"], "_block13" 
    capture_lex $P14
    $P119 = $P14()
# .annotate "line", 1
    .return ($P119)
.end


.namespace ["NameSpace"]
.sub "_block13"  :subid("11_1268405348.1069") :outer("10_1268405348.1069")
# .annotate "line", 9
    .const 'Sub' $P79 = "15_1268405348.1069" 
    capture_lex $P79
    .const 'Sub' $P34 = "13_1268405348.1069" 
    capture_lex $P34
    .const 'Sub' $P15 = "12_1268405348.1069" 
    capture_lex $P15
# .annotate "line", 33
    .const 'Sub' $P79 = "15_1268405348.1069" 
    capture_lex $P79
# .annotate "line", 9
    .return ($P79)
.end


.namespace ["NameSpace"]
.sub "contains"  :subid("12_1268405348.1069") :method :outer("11_1268405348.1069")
    .param pmc param_18
# .annotate "line", 9
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
    .lex "$name", param_18
# .annotate "line", 10
    find_lex $P21, "self"
    find_lex $P22, "$name"
    $P23 = $P21."find_var"($P22)
    isnull $I24, $P23
    new $P25, 'Integer'
    set $P25, $I24
    isfalse $I26, $P25
    unless $I26, unless_20
    new $P19, 'Integer'
    set $P19, $I26
    goto unless_20_end
  unless_20:
# .annotate "line", 11
    find_lex $P27, "self"
    find_lex $P28, "$name"
    $P29 = $P27."find_namespace"($P28)
    isnull $I30, $P29
    new $P31, 'Integer'
    set $P31, $I30
    isfalse $I32, $P31
    new $P19, 'Integer'
    set $P19, $I32
  unless_20_end:
# .annotate "line", 9
    .return ($P19)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P33, exception, "payload"
    .return ($P33)
.end


.namespace ["NameSpace"]
.sub "__dump"  :subid("13_1268405348.1069") :method :outer("11_1268405348.1069")
    .param pmc param_37
    .param pmc param_38
# .annotate "line", 14
    .const 'Sub' $P62 = "14_1268405348.1069" 
    capture_lex $P62
    new $P36, 'ExceptionHandler'
    set_addr $P36, control_35
    $P36."handle_types"(58)
    push_eh $P36
    .lex "self", self
    .lex "$dumper", param_37
    .lex "$label", param_38
# .annotate "line", 15
    new $P39, "ResizablePMCArray"
    .lex "@results", $P39
# .annotate "line", 16
    new $P40, "Undef"
    .lex "$subindent", $P40
# .annotate "line", 17
    new $P41, "Undef"
    .lex "$indent", $P41
# .annotate "line", 19
    new $P42, "Undef"
    .lex "$name", $P42
# .annotate "line", 15
    get_hll_global $P43, ["Parrot"], "call_tuple_method"
    find_lex $P44, "$dumper"
    $P45 = $P43($P44, "newIndent")
    store_lex "@results", $P45
# .annotate "line", 16
    new $P46, "String"
    assign $P46, "\n"
    find_lex $P47, "@results"
    $S48 = $P47."shift"()
    concat $P49, $P46, $S48
    store_lex "$subindent", $P49
# .annotate "line", 17
    new $P50, "String"
    assign $P50, "\n"
    find_lex $P51, "@results"
    $S52 = $P51."shift"()
    concat $P53, $P50, $S52
    store_lex "$indent", $P53
# .annotate "line", 19
    find_lex $P54, "self"
    $P55 = $P54."string_name"("pir" :named("format"), 1 :named("with_hll"))
    store_lex "$name", $P55
# .annotate "line", 21
    find_lex $P56, "$name"
    "print"($P56, " {")
# .annotate "line", 23
    find_lex $P58, "self"
    defined $I59, $P58
    unless $I59, for_undef_16
    iter $P57, $P58
    new $P73, 'ExceptionHandler'
    set_addr $P73, loop72_handler
    $P73."handle_types"(65, 67, 66)
    push_eh $P73
  loop72_test:
    unless $P57, loop72_done
    shift $P60, $P57
  loop72_redo:
    .const 'Sub' $P62 = "14_1268405348.1069" 
    capture_lex $P62
    $P62($P60)
  loop72_next:
    goto loop72_test
  loop72_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P74, exception, 'type'
    eq $P74, 65, loop72_next
    eq $P74, 67, loop72_redo
  loop72_done:
    pop_eh 
  for_undef_16:
# .annotate "line", 29
    find_lex $P75, "$indent"
    "print"($P75, "}")
# .annotate "line", 30
    find_lex $P76, "$dumper"
    $P77 = $P76."deleteIndent"()
# .annotate "line", 14
    .return ($P77)
  control_35:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P78, exception, "payload"
    .return ($P78)
.end


.namespace ["NameSpace"]
.sub "_block61"  :anon :subid("14_1268405348.1069") :outer("13_1268405348.1069")
    .param pmc param_63
# .annotate "line", 23
    .lex "$_", param_63
# .annotate "line", 24
    find_lex $P64, "$subindent"
    find_lex $P65, "$_"
    $P66 = $P65."key"()
    "print"($P64, $P66)
# .annotate "line", 25
    find_lex $P67, "$dumper"
    find_lex $P68, "$label"
    find_lex $P69, "$_"
    $P70 = $P69."value"()
    $P67."dump"($P68, $P70)
# .annotate "line", 26
    $P71 = "print"(",")
# .annotate "line", 23
    .return ($P71)
.end


.namespace ["NameSpace"]
.sub "string_name"  :subid("15_1268405348.1069") :method :outer("11_1268405348.1069")
    .param pmc param_82 :optional :named("format")
    .param int has_param_82 :opt_flag
    .param pmc param_84 :optional :named("with_hll")
    .param int has_param_84 :opt_flag
# .annotate "line", 33
    new $P81, 'ExceptionHandler'
    set_addr $P81, control_80
    $P81."handle_types"(58)
    push_eh $P81
    .lex "self", self
    if has_param_82, optparam_17
    new $P83, "Undef"
    set param_82, $P83
  optparam_17:
    .lex "$format", param_82
    if has_param_84, optparam_18
    new $P85, "Undef"
    set param_84, $P85
  optparam_18:
    .lex "$with_hll", param_84
# .annotate "line", 36
    new $P86, "ResizablePMCArray"
    .lex "@parts", $P86
# .annotate "line", 37
    new $P87, "Undef"
    .lex "$delim", $P87
# .annotate "line", 34
    find_lex $P89, "$format"
    set $P88, $P89
    defined $I91, $P88
    if $I91, default_90
    new $P92, "String"
    assign $P92, "perl6"
    set $P88, $P92
  default_90:
    store_lex "$format", $P88
# .annotate "line", 36
    find_lex $P93, "self"
    $P94 = $P93."get_name"()
    store_lex "@parts", $P94
# .annotate "line", 37
    find_lex $P97, "$format"
    set $S98, $P97
    iseq $I99, $S98, "pir"
    if $I99, if_96
    new $P101, "String"
    assign $P101, "::"
    set $P95, $P101
    goto if_96_end
  if_96:
    new $P100, "String"
    assign $P100, "'; '"
    set $P95, $P100
  if_96_end:
    store_lex "$delim", $P95
# .annotate "line", 39
    find_lex $P103, "$with_hll"
    if $P103, unless_102_end
    find_lex $P104, "@parts"
    $P104."shift"()
  unless_102_end:
# .annotate "line", 41
    find_lex $P107, "$format"
    set $S108, $P107
    iseq $I109, $S108, "pir"
    if $I109, if_106
# .annotate "line", 43
    find_lex $P116, "@parts"
    $P117 = $P116."join"("::")
    set $P105, $P117
# .annotate "line", 41
    goto if_106_end
  if_106:
# .annotate "line", 42
    new $P110, "String"
    assign $P110, "['"
    find_lex $P111, "@parts"
    find_lex $P112, "$delim"
    $S113 = $P111."join"($P112)
    concat $P114, $P110, $S113
    concat $P115, $P114, "']"
    set $P105, $P115
  if_106_end:
# .annotate "line", 33
    .return ($P105)
  control_80:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, "payload"
    .return ($P118)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268405381.4074")
# .annotate "line", 0
    get_hll_global $P14, ["String"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["String"], "_block13" 
    capture_lex $P14
    $P498 = $P14()
# .annotate "line", 1
    .return ($P498)
.end


.namespace ["String"]
.sub "_block13"  :subid("11_1268405381.4074") :outer("10_1268405381.4074")
# .annotate "line", 7
    .const 'Sub' $P458 = "29_1268405381.4074" 
    capture_lex $P458
    .const 'Sub' $P407 = "28_1268405381.4074" 
    capture_lex $P407
    .const 'Sub' $P396 = "27_1268405381.4074" 
    capture_lex $P396
    .const 'Sub' $P387 = "26_1268405381.4074" 
    capture_lex $P387
    .const 'Sub' $P377 = "25_1268405381.4074" 
    capture_lex $P377
    .const 'Sub' $P352 = "24_1268405381.4074" 
    capture_lex $P352
    .const 'Sub' $P300 = "23_1268405381.4074" 
    capture_lex $P300
    .const 'Sub' $P258 = "22_1268405381.4074" 
    capture_lex $P258
    .const 'Sub' $P224 = "21_1268405381.4074" 
    capture_lex $P224
    .const 'Sub' $P200 = "20_1268405381.4074" 
    capture_lex $P200
    .const 'Sub' $P184 = "19_1268405381.4074" 
    capture_lex $P184
    .const 'Sub' $P150 = "18_1268405381.4074" 
    capture_lex $P150
    .const 'Sub' $P117 = "17_1268405381.4074" 
    capture_lex $P117
    .const 'Sub' $P109 = "16_1268405381.4074" 
    capture_lex $P109
    .const 'Sub' $P69 = "14_1268405381.4074" 
    capture_lex $P69
    .const 'Sub' $P22 = "13_1268405381.4074" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1268405381.4074" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268405381.4074" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 30
    .const 'Sub' $P22 = "13_1268405381.4074" 
    capture_lex $P22
    .lex "character_offset_of", $P22
# .annotate "line", 52
    .const 'Sub' $P69 = "14_1268405381.4074" 
    capture_lex $P69
    .lex "display_width", $P69
# .annotate "line", 80
    .const 'Sub' $P109 = "16_1268405381.4074" 
    capture_lex $P109
    .lex "downcase", $P109
# .annotate "line", 84
    .const 'Sub' $P117 = "17_1268405381.4074" 
    capture_lex $P117
    .lex "find_cclass", $P117
# .annotate "line", 126
    .const 'Sub' $P150 = "18_1268405381.4074" 
    capture_lex $P150
    .lex "find_not_cclass", $P150
# .annotate "line", 165
    .const 'Sub' $P184 = "19_1268405381.4074" 
    capture_lex $P184
    .lex "index", $P184
# .annotate "line", 188
    .const 'Sub' $P200 = "20_1268405381.4074" 
    capture_lex $P200
    .lex "is_cclass", $P200
# .annotate "line", 232
    .const 'Sub' $P224 = "21_1268405381.4074" 
    capture_lex $P224
    .lex "_init_line_number_info", $P224
# .annotate "line", 267
    .const 'Sub' $P258 = "22_1268405381.4074" 
    capture_lex $P258
    .lex "line_number_of", $P258
# .annotate "line", 297
    .const 'Sub' $P300 = "23_1268405381.4074" 
    capture_lex $P300
    .lex "ltrim_indent", $P300
# .annotate "line", 7
    find_lex $P344, "_pre_initload"
    find_lex $P345, "character_offset_of"
    find_lex $P346, "display_width"
    find_lex $P347, "downcase"
    find_lex $P348, "find_cclass"
    find_lex $P349, "find_not_cclass"
    find_lex $P350, "index"
    find_lex $P351, "is_cclass"
# .annotate "line", 210
    find_lex $P376, "_init_line_number_info"
# .annotate "line", 263
    find_lex $P385, "line_number_of"
    find_lex $P386, "ltrim_indent"
# .annotate "line", 373
    .const 'Sub' $P458 = "29_1268405381.4074" 
    capture_lex $P458
# .annotate "line", 7
    .return ($P458)
.end


.namespace ["String"]
.sub "_pre_initload"  :subid("12_1268405381.4074") :outer("11_1268405381.4074")
# .annotate "line", 7
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 8
    get_global $P18, "%Cclass_id"
    unless_null $P18, vivify_31
    new $P18, "Hash"
    set_global "%Cclass_id", $P18
  vivify_31:
    get_hll_global $P19, "Hash"
    $P20 = $P19."new"(0 :named("NONE"), 65535 :named("ANY"), 1 :named("UPPERCASE"), 2 :named("LOWERCASE"), 4 :named("ALPHABETIC"), 8 :named("NUMERIC"), 16 :named("HEXADECIMAL"), 32 :named("WHITESPACE"), 64 :named("PRINTING"), 128 :named("GRAPHICAL"), 256 :named("BLANK"), 512 :named("CONTROL"), 1024 :named("PUNCTUATION"), 2048 :named("ALPHANUMERIC"), 4096 :named("NEWLINE"), 8192 :named("WORD"))
    set_global "%Cclass_id", $P20
# .annotate "line", 7
    .return ($P20)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P21, exception, "payload"
    .return ($P21)
.end


.namespace ["String"]
.sub "character_offset_of"  :subid("13_1268405381.4074") :outer("11_1268405381.4074")
    .param pmc param_25
    .param pmc param_26 :slurpy :named
# .annotate "line", 30
    new $P24, 'ExceptionHandler'
    set_addr $P24, control_23
    $P24."handle_types"(58)
    push_eh $P24
    .lex "$string", param_25
    .lex "%opts", param_26
# .annotate "line", 33
    get_global $P27, "%Line_number_info"
    unless_null $P27, vivify_32
    new $P27, "Hash"
    set_global "%Line_number_info", $P27
  vivify_32:
# .annotate "line", 39
    new $P28, "Undef"
    .lex "$offset", $P28
# .annotate "line", 45
    new $P29, "Undef"
    .lex "$line", $P29
# .annotate "line", 46
    new $P30, "Undef"
    .lex "$line_offset", $P30
# .annotate "line", 48
    new $P31, "Undef"
    .lex "$result", $P31
# .annotate "line", 31
    find_lex $P32, "$string"
    find_lex $P33, "%opts"
    "DUMP"($P32 :named("string"), $P33 :named("options"))
    get_global $P34, "%Line_number_info"
# .annotate "line", 35
    find_lex $P36, "$string"
    get_global $P37, "%Line_number_info"
    unless_null $P37, vivify_33
    new $P37, "Hash"
  vivify_33:
    set $P38, $P37[$P36]
    unless_null $P38, vivify_34
    new $P38, "Undef"
  vivify_34:
    if $P38, unless_35_end
# .annotate "line", 36
    find_lex $P39, "$string"
    "_init_line_number_info"($P39)
  unless_35_end:
# .annotate "line", 39
    new $P40, "Integer"
    assign $P40, 0
    find_lex $P41, "%opts"
    unless_null $P41, vivify_35
    new $P41, "Hash"
  vivify_35:
    set $P42, $P41["offset"]
    unless_null $P42, vivify_36
    new $P42, "Undef"
  vivify_36:
    add $P43, $P40, $P42
    store_lex "$offset", $P43
# .annotate "line", 41
    get_hll_global $P45, ["Hash"], "exists"
    find_lex $P46, "%opts"
    $P47 = $P45($P46, "line")
    if $P47, unless_44_end
# .annotate "line", 42
    find_lex $P48, "$string"
    find_lex $P49, "$offset"
    $P50 = "line_number_of"($P48, $P49 :named("offset"))
    find_lex $P51, "%opts"
    unless_null $P51, vivify_37
    new $P51, "Hash"
    store_lex "%opts", $P51
  vivify_37:
    set $P51["line"], $P50
  unless_44_end:
# .annotate "line", 45
    new $P52, "Integer"
    assign $P52, -1
    find_lex $P53, "%opts"
    unless_null $P53, vivify_38
    new $P53, "Hash"
  vivify_38:
    set $P54, $P53["line"]
    unless_null $P54, vivify_39
    new $P54, "Undef"
  vivify_39:
    add $P55, $P52, $P54
    store_lex "$line", $P55
# .annotate "line", 46
    find_lex $P56, "$line"
    set $I57, $P56
    find_lex $P58, "$string"
    get_global $P59, "%Line_number_info"
    unless_null $P59, vivify_40
    new $P59, "Hash"
  vivify_40:
    set $P60, $P59[$P58]
    unless_null $P60, vivify_41
    new $P60, "ResizablePMCArray"
  vivify_41:
    set $P61, $P60[$I57]
    unless_null $P61, vivify_42
    new $P61, "Undef"
  vivify_42:
    store_lex "$line_offset", $P61
# .annotate "line", 47
    find_lex $P62, "$line_offset"
    "NOTE"("Line number offset is: ", $P62)
# .annotate "line", 48
    find_lex $P63, "$offset"
    find_lex $P64, "$line_offset"
    sub $P65, $P63, $P64
    store_lex "$result", $P65
# .annotate "line", 49
    new $P66, "Exception"
    set $P66['type'], 58
    find_lex $P67, "$result"
    setattribute $P66, 'payload', $P67
    throw $P66
# .annotate "line", 30
    .return ()
  control_23:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P68, exception, "payload"
    .return ($P68)
.end


.namespace ["String"]
.sub "display_width"  :subid("14_1268405381.4074") :outer("11_1268405381.4074")
    .param pmc param_72
# .annotate "line", 52
    .const 'Sub' $P78 = "15_1268405381.4074" 
    capture_lex $P78
    new $P71, 'ExceptionHandler'
    set_addr $P71, control_70
    $P71."handle_types"(58)
    push_eh $P71
    .lex "$str", param_72
# .annotate "line", 59
    new $P73, "Undef"
    .lex "$width", $P73
    new $P74, "Integer"
    assign $P74, 0
    store_lex "$width", $P74
# .annotate "line", 61
    find_lex $P76, "$str"
    unless $P76, if_75_end
    .const 'Sub' $P78 = "15_1268405381.4074" 
    capture_lex $P78
    $P78()
  if_75_end:
# .annotate "line", 77
    new $P106, "Exception"
    set $P106['type'], 58
    find_lex $P107, "$width"
    setattribute $P106, 'payload', $P107
    throw $P106
# .annotate "line", 52
    .return ()
  control_70:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["String"]
.sub "_block77"  :anon :subid("15_1268405381.4074") :outer("14_1268405381.4074")
# .annotate "line", 62
    new $P79, "Undef"
    .lex "$i", $P79
# .annotate "line", 63
    new $P80, "Undef"
    .lex "$len", $P80
# .annotate "line", 62
    new $P81, "Integer"
    assign $P81, 0
    store_lex "$i", $P81
# .annotate "line", 63
    find_lex $P82, "$str"
    $P83 = "length"($P82)
    store_lex "$len", $P83
# .annotate "line", 65
    new $P104, 'ExceptionHandler'
    set_addr $P104, loop103_handler
    $P104."handle_types"(65, 67, 66)
    push_eh $P104
  loop103_test:
    find_lex $P84, "$i"
    set $N85, $P84
    find_lex $P86, "$len"
    set $N87, $P86
    islt $I88, $N85, $N87
    unless $I88, loop103_done
  loop103_redo:
# .annotate "line", 66
    find_lex $P90, "$str"
    find_lex $P91, "$i"
    $S92 = "char_at"($P90, $P91)
    iseq $I93, $S92, "\t"
    if $I93, if_89
# .annotate "line", 69
    find_lex $P99, "$width"
    clone $P100, $P99
    inc $P99
    goto if_89_end
  if_89:
# .annotate "line", 67
    find_lex $P94, "$width"
    add $P95, $P94, 8
    find_lex $P96, "$width"
    mod $P97, $P96, 8
    sub $P98, $P95, $P97
    store_lex "$width", $P98
  if_89_end:
# .annotate "line", 66
    find_lex $P101, "$i"
    clone $P102, $P101
    inc $P101
  loop103_next:
# .annotate "line", 65
    goto loop103_test
  loop103_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, 'type'
    eq $P105, 65, loop103_next
    eq $P105, 67, loop103_redo
  loop103_done:
    pop_eh 
# .annotate "line", 61
    .return ($I88)
.end


.namespace ["String"]
.sub "downcase"  :subid("16_1268405381.4074") :outer("11_1268405381.4074")
    .param pmc param_112
# .annotate "line", 80
    new $P111, 'ExceptionHandler'
    set_addr $P111, control_110
    $P111."handle_types"(58)
    push_eh $P111
    .lex "$str", param_112
# .annotate "line", 81
    find_lex $P113, "$str"
    set $S114, $P113
    downcase $S115, $S114
# .annotate "line", 80
    .return ($S115)
  control_110:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["String"]
.sub "find_cclass"  :subid("17_1268405381.4074") :outer("11_1268405381.4074")
    .param pmc param_120
    .param pmc param_121
    .param pmc param_122 :slurpy :named
# .annotate "line", 84
    new $P119, 'ExceptionHandler'
    set_addr $P119, control_118
    $P119."handle_types"(58)
    push_eh $P119
    .lex "$class_name", param_120
    .lex "$str", param_121
    .lex "%opts", param_122
# .annotate "line", 92
    new $P123, "Undef"
    .lex "$offset", $P123
# .annotate "line", 93
    new $P124, "Undef"
    .lex "$count", $P124
# .annotate "line", 99
    get_global $P125, "%Cclass_id"
    unless_null $P125, vivify_43
    new $P125, "Hash"
    set_global "%Cclass_id", $P125
  vivify_43:
# .annotate "line", 100
    new $P126, "Undef"
    .lex "$cclass", $P126
# .annotate "line", 104
    new $P127, "Undef"
    .lex "$result", $P127
# .annotate "line", 92
    new $P128, "Integer"
    assign $P128, 0
    find_lex $P129, "%opts"
    unless_null $P129, vivify_44
    new $P129, "Hash"
  vivify_44:
    set $P130, $P129["offset"]
    unless_null $P130, vivify_45
    new $P130, "Undef"
  vivify_45:
    add $P131, $P128, $P130
    store_lex "$offset", $P131
# .annotate "line", 93
    find_lex $P132, "%opts"
    unless_null $P132, vivify_46
    new $P132, "Hash"
  vivify_46:
    set $P133, $P132["count"]
    unless_null $P133, vivify_47
    new $P133, "Undef"
  vivify_47:
    store_lex "$count", $P133
# .annotate "line", 95
    find_lex $P135, "$count"
    if $P135, unless_134_end
# .annotate "line", 96
    find_lex $P136, "$str"
    $P137 = "length"($P136)
    find_lex $P138, "$offset"
    sub $P139, $P137, $P138
    store_lex "$count", $P139
  unless_134_end:
# .annotate "line", 95
    get_global $P140, "%Cclass_id"
# .annotate "line", 100
    new $P141, "Integer"
    assign $P141, 0
    find_lex $P142, "$class_name"
    get_global $P143, "%Cclass_id"
    unless_null $P143, vivify_48
    new $P143, "Hash"
  vivify_48:
    set $P144, $P143[$P142]
    unless_null $P144, vivify_49
    new $P144, "Undef"
  vivify_49:
    add $P145, $P141, $P144
    store_lex "$cclass", $P145
# .annotate "line", 104

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
		$P146 = box $I0
		
	
    store_lex "$result", $P146
# .annotate "line", 123
    new $P147, "Exception"
    set $P147['type'], 58
    find_lex $P148, "$result"
    setattribute $P147, 'payload', $P148
    throw $P147
# .annotate "line", 84
    .return ()
  control_118:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P149, exception, "payload"
    .return ($P149)
.end


.namespace ["String"]
.sub "find_not_cclass"  :subid("18_1268405381.4074") :outer("11_1268405381.4074")
    .param pmc param_153
    .param pmc param_154
    .param pmc param_155 :slurpy :named
# .annotate "line", 126
    new $P152, 'ExceptionHandler'
    set_addr $P152, control_151
    $P152."handle_types"(58)
    push_eh $P152
    .lex "$class_name", param_153
    .lex "$str", param_154
    .lex "%opts", param_155
# .annotate "line", 131
    new $P156, "Undef"
    .lex "$offset", $P156
# .annotate "line", 137
    new $P157, "Undef"
    .lex "$count", $P157
# .annotate "line", 143
    get_global $P158, "%Cclass_id"
    unless_null $P158, vivify_50
    new $P158, "Hash"
    set_global "%Cclass_id", $P158
  vivify_50:
# .annotate "line", 144
    new $P159, "Undef"
    .lex "$class", $P159
# .annotate "line", 148
    new $P160, "Undef"
    .lex "$result", $P160
# .annotate "line", 131
    find_lex $P161, "%opts"
    unless_null $P161, vivify_51
    new $P161, "Hash"
  vivify_51:
    set $P162, $P161["offset"]
    unless_null $P162, vivify_52
    new $P162, "Undef"
  vivify_52:
    store_lex "$offset", $P162
# .annotate "line", 133
    find_lex $P164, "$offset"
    if $P164, unless_163_end
# .annotate "line", 134
    new $P165, "Integer"
    assign $P165, 0
    store_lex "$offset", $P165
  unless_163_end:
# .annotate "line", 137
    find_lex $P166, "%opts"
    unless_null $P166, vivify_53
    new $P166, "Hash"
  vivify_53:
    set $P167, $P166["count"]
    unless_null $P167, vivify_54
    new $P167, "Undef"
  vivify_54:
    store_lex "$count", $P167
# .annotate "line", 139
    find_lex $P169, "$count"
    if $P169, unless_168_end
# .annotate "line", 140
    find_lex $P170, "$str"
    $P171 = "length"($P170)
    find_lex $P172, "$offset"
    sub $P173, $P171, $P172
    store_lex "$count", $P173
  unless_168_end:
# .annotate "line", 139
    get_global $P174, "%Cclass_id"
# .annotate "line", 144
    new $P175, "Integer"
    assign $P175, 0
    find_lex $P176, "$class_name"
    get_global $P177, "%Cclass_id"
    unless_null $P177, vivify_55
    new $P177, "Hash"
  vivify_55:
    set $P178, $P177[$P176]
    unless_null $P178, vivify_56
    new $P178, "Undef"
  vivify_56:
    add $P179, $P175, $P178
    store_lex "$class", $P179
# .annotate "line", 148

		$P0 = find_lex '$class'
		$I1 = $P0
		$P0 = find_lex '$str'
		$S2 = $P0
		$P0 = find_lex '$offset'
		$I3 = $P0
		$P0 = find_lex '$count'
		$I4 = $P0
		$I0 = find_not_cclass $I1, $S2, $I3, $I4
		$P180 = box $I0
	
    store_lex "$result", $P180
# .annotate "line", 162
    new $P181, "Exception"
    set $P181['type'], 58
    find_lex $P182, "$result"
    setattribute $P181, 'payload', $P182
    throw $P181
# .annotate "line", 126
    .return ()
  control_151:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P183, exception, "payload"
    .return ($P183)
.end


.namespace ["String"]
.sub "index"  :subid("19_1268405381.4074") :outer("11_1268405381.4074")
    .param pmc param_187
    .param pmc param_188
    .param pmc param_189 :slurpy :named
# .annotate "line", 165
    new $P186, 'ExceptionHandler'
    set_addr $P186, control_185
    $P186."handle_types"(58)
    push_eh $P186
    .lex "$haystack", param_187
    .lex "$needle", param_188
    .lex "%opts", param_189
# .annotate "line", 166
    new $P190, "Undef"
    .lex "$offset", $P190
# .annotate "line", 168
    new $P191, "Undef"
    .lex "$result", $P191
# .annotate "line", 166
    new $P192, "Integer"
    assign $P192, 0
    find_lex $P193, "%opts"
    unless_null $P193, vivify_57
    new $P193, "Hash"
  vivify_57:
    set $P194, $P193["offset"]
    unless_null $P194, vivify_58
    new $P194, "Undef"
  vivify_58:
    add $P195, $P192, $P194
    store_lex "$offset", $P195
# .annotate "line", 168

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
		$P196 = box $I0
	
    store_lex "$result", $P196
# .annotate "line", 185
    new $P197, "Exception"
    set $P197['type'], 58
    find_lex $P198, "$result"
    setattribute $P197, 'payload', $P198
    throw $P197
# .annotate "line", 165
    .return ()
  control_185:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P199, exception, "payload"
    .return ($P199)
.end


.namespace ["String"]
.sub "is_cclass"  :subid("20_1268405381.4074") :outer("11_1268405381.4074")
    .param pmc param_203
    .param pmc param_204
    .param pmc param_205 :slurpy :named
# .annotate "line", 188
    new $P202, 'ExceptionHandler'
    set_addr $P202, control_201
    $P202."handle_types"(58)
    push_eh $P202
    .lex "$class_name", param_203
    .lex "$str", param_204
    .lex "%opts", param_205
# .annotate "line", 189
    get_global $P206, "%Cclass_id"
    unless_null $P206, vivify_59
    new $P206, "Hash"
    set_global "%Cclass_id", $P206
  vivify_59:
# .annotate "line", 190
    new $P207, "Undef"
    .lex "$offset", $P207
# .annotate "line", 191
    new $P208, "Undef"
    .lex "$class", $P208
# .annotate "line", 195
    new $P209, "Undef"
    .lex "$result", $P209
# .annotate "line", 188
    get_global $P210, "%Cclass_id"
# .annotate "line", 190
    new $P211, "Integer"
    assign $P211, 0
    find_lex $P212, "%opts"
    unless_null $P212, vivify_60
    new $P212, "Hash"
  vivify_60:
    set $P213, $P212["offset"]
    unless_null $P213, vivify_61
    new $P213, "Undef"
  vivify_61:
    add $P214, $P211, $P213
    store_lex "$offset", $P214
# .annotate "line", 191
    new $P215, "Integer"
    assign $P215, 0
    find_lex $P216, "$class_name"
    get_global $P217, "%Cclass_id"
    unless_null $P217, vivify_62
    new $P217, "Hash"
  vivify_62:
    set $P218, $P217[$P216]
    unless_null $P218, vivify_63
    new $P218, "Undef"
  vivify_63:
    add $P219, $P215, $P218
    store_lex "$class", $P219
# .annotate "line", 195

		$P0 = find_lex '$class'
		$I1 = $P0
		$P0 = find_lex '$str'
		$S2 = $P0
		$P0 = find_lex '$offset'
		$I3 = $P0
		$I0 = is_cclass $I1, $S2, $I3
		$P220 = box $I0
	
    store_lex "$result", $P220
# .annotate "line", 207
    new $P221, "Exception"
    set $P221['type'], 58
    find_lex $P222, "$result"
    setattribute $P221, 'payload', $P222
    throw $P221
# .annotate "line", 188
    .return ()
  control_201:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P223, exception, "payload"
    .return ($P223)
.end


.namespace ["String"]
.sub "_init_line_number_info"  :subid("21_1268405381.4074") :outer("11_1268405381.4074")
    .param pmc param_227
# .annotate "line", 232
    new $P226, 'ExceptionHandler'
    set_addr $P226, control_225
    $P226."handle_types"(58)
    push_eh $P226
    .lex "$string", param_227
# .annotate "line", 236
    new $P228, "ResizablePMCArray"
    .lex "@lines", $P228
# .annotate "line", 237
    new $P229, "Undef"
    .lex "$len", $P229
# .annotate "line", 238
    new $P230, "Undef"
    .lex "$i", $P230
# .annotate "line", 245
    get_global $P231, "%Line_number_info"
    unless_null $P231, vivify_64
    new $P231, "Hash"
    set_global "%Line_number_info", $P231
  vivify_64:
# .annotate "line", 236
    get_hll_global $P232, ["Array"], "new"
    $P233 = $P232(-1)
    store_lex "@lines", $P233
# .annotate "line", 237
    get_hll_global $P234, ["String"], "length"
    find_lex $P235, "$string"
    $P236 = $P234($P235)
    store_lex "$len", $P236
# .annotate "line", 238
    new $P237, "Integer"
    assign $P237, -1
    store_lex "$i", $P237
# .annotate "line", 240
    new $P251, 'ExceptionHandler'
    set_addr $P251, loop250_handler
    $P251."handle_types"(65, 67, 66)
    push_eh $P251
  loop250_test:
    find_lex $P238, "$i"
    set $N239, $P238
    find_lex $P240, "$len"
    set $N241, $P240
    islt $I242, $N239, $N241
    unless $I242, loop250_done
  loop250_redo:
# .annotate "line", 241
    get_hll_global $P243, ["String"], "find_cclass"
    find_lex $P244, "$string"
    find_lex $P245, "$i"
    add $P246, $P245, 1
    $P247 = $P243("NEWLINE", $P244, $P246 :named("offset"))
    store_lex "$i", $P247
# .annotate "line", 242
    find_lex $P248, "@lines"
    find_lex $P249, "$i"
    $P248."push"($P249)
  loop250_next:
# .annotate "line", 240
    goto loop250_test
  loop250_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P252, exception, 'type'
    eq $P252, 65, loop250_next
    eq $P252, 67, loop250_redo
  loop250_done:
    pop_eh 
    get_global $P253, "%Line_number_info"
# .annotate "line", 247
    find_lex $P254, "@lines"
    find_lex $P255, "$string"
    get_global $P256, "%Line_number_info"
    unless_null $P256, vivify_65
    new $P256, "Hash"
    set_global "%Line_number_info", $P256
  vivify_65:
    set $P256[$P255], $P254
# .annotate "line", 232
    .return ($P254)
  control_225:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P257, exception, "payload"
    .return ($P257)
.end


.namespace ["String"]
.sub "line_number_of"  :subid("22_1268405381.4074") :outer("11_1268405381.4074")
    .param pmc param_261
    .param pmc param_262 :slurpy :named
# .annotate "line", 267
    new $P260, 'ExceptionHandler'
    set_addr $P260, control_259
    $P260."handle_types"(58)
    push_eh $P260
    .lex "$string", param_261
    .lex "%opts", param_262
# .annotate "line", 275
    get_global $P263, "%Line_number_info"
    unless_null $P263, vivify_66
    new $P263, "Hash"
    set_global "%Line_number_info", $P263
  vivify_66:
# .annotate "line", 281
    new $P264, "Undef"
    .lex "$offset", $P264
# .annotate "line", 285
    new $P265, "Undef"
    .lex "$line", $P265
# .annotate "line", 268
    find_lex $P266, "$string"
    find_lex $P267, "%opts"
    "DUMP"($P266 :named("string"), $P267 :named("options"))
# .annotate "line", 270
    find_lex $P269, "$string"
    if $P269, unless_268_end
# .annotate "line", 271
    "NOTE"("String is empty or undef. Returning 1")
# .annotate "line", 272
    new $P270, "Exception"
    set $P270['type'], 58
    new $P271, "Integer"
    assign $P271, 1
    setattribute $P270, 'payload', $P271
    throw $P270
  unless_268_end:
# .annotate "line", 270
    get_global $P272, "%Line_number_info"
# .annotate "line", 277
    find_lex $P274, "$string"
    get_global $P275, "%Line_number_info"
    unless_null $P275, vivify_67
    new $P275, "Hash"
  vivify_67:
    set $P276, $P275[$P274]
    unless_null $P276, vivify_68
    new $P276, "Undef"
  vivify_68:
    if $P276, unless_273_end
# .annotate "line", 278
    find_lex $P277, "$string"
    "_init_line_number_info"($P277)
  unless_273_end:
# .annotate "line", 281
    new $P278, "Integer"
    assign $P278, 0
    find_lex $P279, "%opts"
    unless_null $P279, vivify_69
    new $P279, "Hash"
  vivify_69:
    set $P280, $P279["offset"]
    unless_null $P280, vivify_70
    new $P280, "Undef"
  vivify_70:
    add $P281, $P278, $P280
    store_lex "$offset", $P281
# .annotate "line", 283
    find_lex $P282, "$offset"
    "NOTE"("Bsearching for line number of ", $P282, " in string")
# .annotate "line", 285
    get_hll_global $P283, ["Array"], "bsearch"
    find_lex $P284, "$string"
    get_global $P285, "%Line_number_info"
    unless_null $P285, vivify_71
    new $P285, "Hash"
  vivify_71:
    set $P286, $P285[$P284]
    unless_null $P286, vivify_72
    new $P286, "Undef"
  vivify_72:
    find_lex $P287, "$offset"
    $P288 = $P283($P286, $P287, "<=>" :named("cmp"))
    store_lex "$line", $P288
# .annotate "line", 287
    find_lex $P290, "$line"
    set $N291, $P290
    islt $I292, $N291, 0.0
    unless $I292, if_289_end
# .annotate "line", 289
    find_lex $P293, "$line"
    neg $P294, $P293
    sub $P295, $P294, 1
    store_lex "$line", $P295
  if_289_end:
# .annotate "line", 293
    find_lex $P296, "$line"
    "NOTE"("Returning line number (1-based): ", $P296)
# .annotate "line", 294
    new $P297, "Exception"
    set $P297['type'], 58
    find_lex $P298, "$line"
    setattribute $P297, 'payload', $P298
    throw $P297
# .annotate "line", 267
    .return ()
  control_259:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P299, exception, "payload"
    .return ($P299)
.end


.namespace ["String"]
.sub "ltrim_indent"  :subid("23_1268405381.4074") :outer("11_1268405381.4074")
    .param pmc param_303
    .param pmc param_304
# .annotate "line", 297
    new $P302, 'ExceptionHandler'
    set_addr $P302, control_301
    $P302."handle_types"(58)
    push_eh $P302
    .lex "$str", param_303
    .lex "$indent", param_304
# .annotate "line", 298
    new $P305, "Undef"
    .lex "$limit", $P305
# .annotate "line", 300
    new $P306, "Undef"
    .lex "$i", $P306
# .annotate "line", 301
    new $P307, "Undef"
    .lex "$prefix", $P307
# .annotate "line", 298
    find_lex $P308, "$str"
    $P309 = "find_not_cclass"("WHITESPACE", $P308)
    store_lex "$limit", $P309
# .annotate "line", 300
    new $P310, "Integer"
    assign $P310, 0
    store_lex "$i", $P310
# .annotate "line", 301
    new $P311, "Integer"
    assign $P311, 0
    store_lex "$prefix", $P311
# .annotate "line", 303
    new $P337, 'ExceptionHandler'
    set_addr $P337, loop336_handler
    $P337."handle_types"(65, 67, 66)
    push_eh $P337
  loop336_test:
    find_lex $P314, "$i"
    set $N315, $P314
    find_lex $P316, "$limit"
    set $N317, $P316
    islt $I318, $N315, $N317
    if $I318, if_313
    new $P312, 'Integer'
    set $P312, $I318
    goto if_313_end
  if_313:
    find_lex $P319, "$prefix"
    set $N320, $P319
    find_lex $P321, "$indent"
    set $N322, $P321
    islt $I323, $N320, $N322
    new $P312, 'Integer'
    set $P312, $I323
  if_313_end:
    unless $P312, loop336_done
  loop336_redo:
# .annotate "line", 304
    find_lex $P325, "$str"
    find_lex $P326, "$i"
    $S327 = "char_at"($P325, $P326)
    iseq $I328, $S327, "\t"
    if $I328, if_324
# .annotate "line", 307
    find_lex $P334, "$prefix"
    clone $P335, $P334
    inc $P334
    goto if_324_end
  if_324:
# .annotate "line", 305
    find_lex $P329, "$prefix"
    add $P330, $P329, 8
    find_lex $P331, "$prefix"
    mod $P332, $P331, 8
    sub $P333, $P330, $P332
    store_lex "$prefix", $P333
  if_324_end:
  loop336_next:
# .annotate "line", 303
    goto loop336_test
  loop336_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P338, exception, 'type'
    eq $P338, 65, loop336_next
    eq $P338, 67, loop336_redo
  loop336_done:
    pop_eh 
# .annotate "line", 312
    new $P339, "Exception"
    set $P339['type'], 58
    find_lex $P340, "$str"
    find_lex $P341, "$i"
    $P342 = "substr"($P340, $P341)
    setattribute $P339, 'payload', $P342
    throw $P339
# .annotate "line", 297
    .return ()
  control_301:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P343, exception, "payload"
    .return ($P343)
.end


.namespace ["String"]
.sub "length"  :subid("24_1268405381.4074") :method :outer("11_1268405381.4074")
    .param pmc param_355 :slurpy :named
# .annotate "line", 210
    new $P354, 'ExceptionHandler'
    set_addr $P354, control_353
    $P354."handle_types"(58)
    push_eh $P354
    .lex "self", self
    .lex "%opts", param_355
# .annotate "line", 211
    new $P356, "Undef"
    .lex "$offset", $P356
# .annotate "line", 215
    new $P357, "Undef"
    .lex "$result", $P357
# .annotate "line", 211
    new $P358, "Integer"
    assign $P358, 0
    find_lex $P359, "%opts"
    unless_null $P359, vivify_73
    new $P359, "Hash"
  vivify_73:
    set $P360, $P359["offset"]
    unless_null $P360, vivify_74
    new $P360, "Undef"
  vivify_74:
    add $P361, $P358, $P360
    store_lex "$offset", $P361
# .annotate "line", 215

		$P0 = find_lex 'self'
		$S0 = $P0
		$I0 = length $S0
		$P362 = box $I0
	
    store_lex "$result", $P362
# .annotate "line", 222
    find_lex $P364, "$offset"
    set $N365, $P364
    find_lex $P366, "$result"
    set $N367, $P366
    isgt $I368, $N365, $N367
    unless $I368, if_363_end
# .annotate "line", 223
    find_lex $P369, "$result"
    store_lex "$offset", $P369
  if_363_end:
# .annotate "line", 226
    find_lex $P370, "$result"
    find_lex $P371, "$offset"
    sub $P372, $P370, $P371
    store_lex "$result", $P372
# .annotate "line", 229
    new $P373, "Exception"
    set $P373['type'], 58
    find_lex $P374, "$result"
    setattribute $P373, 'payload', $P374
    throw $P373
# .annotate "line", 210
    .return ()
  control_353:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P375, exception, "payload"
    .return ($P375)
.end


.namespace ["String"]
.sub "isa"  :subid("25_1268405381.4074") :method :outer("11_1268405381.4074")
    .param pmc param_380
# .annotate "line", 263
    new $P379, 'ExceptionHandler'
    set_addr $P379, control_378
    $P379."handle_types"(58)
    push_eh $P379
    .lex "self", self
    .lex "$type", param_380
# .annotate "line", 264
    find_lex $P381, "self"
    find_lex $P382, "$type"
    isa $I383, $P381, $P382
# .annotate "line", 263
    .return ($I383)
  control_378:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P384, exception, "payload"
    .return ($P384)
.end


.namespace ["String"]
.sub "repeat"  :subid("26_1268405381.4074") :method :outer("11_1268405381.4074")
    .param pmc param_390
# .annotate "line", 315
    new $P389, 'ExceptionHandler'
    set_addr $P389, control_388
    $P389."handle_types"(58)
    push_eh $P389
    .lex "self", self
    .lex "$times", param_390
# .annotate "line", 316
    new $P391, "Undef"
    .lex "$result", $P391

		$P0 = find_lex 'self'
		$S0 = $P0
		$P0 = find_lex '$times'
		$I0 = $P0
		$S1 = repeat $S0, $I0
		$P392 = box $S1
	
    store_lex "$result", $P392
# .annotate "line", 325
    new $P393, "Exception"
    set $P393['type'], 58
    find_lex $P394, "$result"
    setattribute $P393, 'payload', $P394
    throw $P393
# .annotate "line", 315
    .return ()
  control_388:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P395, exception, "payload"
    .return ($P395)
.end


.namespace ["String"]
.sub "split"  :subid("27_1268405381.4074") :method :outer("11_1268405381.4074")
    .param pmc param_399 :optional
    .param int has_param_399 :opt_flag
# .annotate "line", 328
    new $P398, 'ExceptionHandler'
    set_addr $P398, control_397
    $P398."handle_types"(58)
    push_eh $P398
    .lex "self", self
    if has_param_399, optparam_75
    new $P400, "String"
    assign $P400, ""
    set param_399, $P400
  optparam_75:
    .lex "$delim", param_399
# .annotate "line", 329
    find_lex $P401, "$delim"
    set $S402, $P401
    find_lex $P403, "self"
    set $S404, $P403
    split $P405, $S402, $S404
# .annotate "line", 328
    .return ($P405)
  control_397:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P406, exception, "payload"
    .return ($P406)
.end


.namespace ["String"]
.sub "substr"  :subid("28_1268405381.4074") :method :outer("11_1268405381.4074")
    .param pmc param_410
    .param pmc param_411 :slurpy
# .annotate "line", 332
    new $P409, 'ExceptionHandler'
    set_addr $P409, control_408
    $P409."handle_types"(58)
    push_eh $P409
    .lex "self", self
    .lex "$start", param_410
    .lex "@rest", param_411
# .annotate "line", 333
    new $P412, "Undef"
    .lex "$len", $P412
# .annotate "line", 345
    new $P413, "Undef"
    .lex "$limit", $P413
# .annotate "line", 359
    new $P414, "Undef"
    .lex "$result", $P414
# .annotate "line", 333
    find_lex $P415, "self"
    $P416 = "length"($P415)
    store_lex "$len", $P416
# .annotate "line", 335
    find_lex $P418, "$start"
    set $N419, $P418
    islt $I420, $N419, 0.0
    unless $I420, if_417_end
# .annotate "line", 336
    find_lex $P421, "$start"
    find_lex $P422, "$len"
    add $P423, $P421, $P422
    store_lex "$start", $P423
  if_417_end:
# .annotate "line", 339
    find_lex $P425, "$start"
    set $N426, $P425
    find_lex $P427, "$len"
    set $N428, $P427
    isgt $I429, $N426, $N428
    unless $I429, if_424_end
# .annotate "line", 340
    find_lex $P430, "$len"
    store_lex "$start", $P430
  if_424_end:
# .annotate "line", 343
    find_lex $P431, "$len"
    find_lex $P432, "$start"
    sub $P433, $P431, $P432
    store_lex "$len", $P433
# .annotate "line", 345
    find_lex $P434, "$len"
    store_lex "$limit", $P434
# .annotate "line", 347
    find_lex $P436, "@rest"
    set $N437, $P436
    unless $N437, if_435_end
# .annotate "line", 348
    find_lex $P438, "@rest"
    $P439 = $P438."shift"()
    store_lex "$limit", $P439
# .annotate "line", 350
    find_lex $P441, "$limit"
    set $N442, $P441
    islt $I443, $N442, 0.0
    unless $I443, if_440_end
# .annotate "line", 351
    find_lex $P444, "$limit"
    find_lex $P445, "$len"
    add $P446, $P444, $P445
    store_lex "$limit", $P446
  if_440_end:
# .annotate "line", 354
    find_lex $P448, "$limit"
    set $N449, $P448
    find_lex $P450, "$len"
    set $N451, $P450
    isgt $I452, $N449, $N451
    unless $I452, if_447_end
# .annotate "line", 355
    find_lex $P453, "$len"
    store_lex "$limit", $P453
  if_447_end:
  if_435_end:
# .annotate "line", 359

		$P0 = find_lex 'self'
		$S0 = $P0
		$P0 = find_lex '$start'
		$I0 = $P0
		$P0 = find_lex '$limit'
		$I1 = $P0
		$S1 = substr $S0, $I0, $I1
		$P454 = box $S1
	
    store_lex "$result", $P454
# .annotate "line", 370
    new $P455, "Exception"
    set $P455['type'], 58
    find_lex $P456, "$result"
    setattribute $P455, 'payload', $P456
    throw $P455
# .annotate "line", 332
    .return ()
  control_408:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P457, exception, "payload"
    .return ($P457)
.end


.namespace ["String"]
.sub "trim"  :subid("29_1268405381.4074") :method :outer("11_1268405381.4074")
# .annotate "line", 373
    .const 'Sub' $P476 = "30_1268405381.4074" 
    capture_lex $P476
    new $P460, 'ExceptionHandler'
    set_addr $P460, control_459
    $P460."handle_types"(58)
    push_eh $P460
    .lex "self", self
# .annotate "line", 374
    new $P461, "Undef"
    .lex "$result", $P461
# .annotate "line", 375
    new $P462, "Undef"
    .lex "$left", $P462
# .annotate "line", 378
    new $P463, "Undef"
    .lex "$len", $P463
# .annotate "line", 374
    new $P464, "String"
    assign $P464, ""
    store_lex "$result", $P464
# .annotate "line", 375
    find_lex $P465, "self"
    $P466 = "find_not_cclass"("WHITESPACE", $P465)
    store_lex "$left", $P466
# .annotate "line", 378
    find_lex $P467, "self"
    $P468 = "length"($P467)
    store_lex "$len", $P468
# .annotate "line", 381
    find_lex $P470, "$left"
    set $N471, $P470
    find_lex $P472, "$len"
    set $N473, $P472
    islt $I474, $N471, $N473
    unless $I474, if_469_end
    .const 'Sub' $P476 = "30_1268405381.4074" 
    capture_lex $P476
    $P476()
  if_469_end:
# .annotate "line", 395
    new $P495, "Exception"
    set $P495['type'], 58
    find_lex $P496, "$result"
    setattribute $P495, 'payload', $P496
    throw $P495
# .annotate "line", 373
    .return ()
  control_459:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P497, exception, "payload"
    .return ($P497)
.end


.namespace ["String"]
.sub "_block475"  :anon :subid("30_1268405381.4074") :outer("29_1268405381.4074")
# .annotate "line", 382
    new $P477, "Undef"
    .lex "$right", $P477
    find_lex $P478, "$len"
    sub $P479, $P478, 1
    store_lex "$right", $P479
# .annotate "line", 384
    new $P486, 'ExceptionHandler'
    set_addr $P486, loop485_handler
    $P486."handle_types"(65, 67, 66)
    push_eh $P486
  loop485_test:
    find_lex $P480, "self"
    find_lex $P481, "$right"
    $P482 = "is_cclass"("WHITESPACE", $P480, $P481 :named("offset"))
    unless $P482, loop485_done
  loop485_redo:
    find_lex $P483, "$right"
    clone $P484, $P483
    dec $P483
  loop485_next:
    goto loop485_test
  loop485_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P487, exception, 'type'
    eq $P487, 65, loop485_next
    eq $P487, 67, loop485_redo
  loop485_done:
    pop_eh 
# .annotate "line", 391
    find_lex $P488, "self"
    find_lex $P489, "$left"
    find_lex $P490, "$right"
    find_lex $P491, "$left"
    sub $P492, $P490, $P491
    add $P493, $P492, 1
    $P494 = "substr"($P488, $P489, $P493)
    store_lex "$result", $P494
# .annotate "line", 381
    .return ($P494)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268405366.70718")
# .annotate "line", 0
    get_hll_global $P14, ["Sub"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["Sub"], "_block13" 
    capture_lex $P14
    $P154 = $P14()
# .annotate "line", 1
    .return ($P154)
.end


.namespace ["Sub"]
.sub "_block13"  :subid("11_1268405366.70718") :outer("10_1268405366.70718")
# .annotate "line", 6
    .const 'Sub' $P37 = "14_1268405366.70718" 
    capture_lex $P37
    .const 'Sub' $P22 = "13_1268405366.70718" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1268405366.70718" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268405366.70718" 
    capture_lex $P15
    .lex "set_dump_detail", $P15
# .annotate "line", 10
    .const 'Sub' $P22 = "13_1268405366.70718" 
    capture_lex $P22
    .lex "get_dump_detail", $P22
# .annotate "line", 6
    find_lex $P35, "set_dump_detail"
    find_lex $P36, "get_dump_detail"
# .annotate "line", 20
    .const 'Sub' $P37 = "14_1268405366.70718" 
    capture_lex $P37
# .annotate "line", 6
    .return ($P37)
.end


.namespace ["Sub"]
.sub "set_dump_detail"  :subid("12_1268405366.70718") :outer("11_1268405366.70718")
    .param pmc param_18
# .annotate "line", 6
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "$level", param_18
# .annotate "line", 7
    get_global $P19, "$Dump_detail"
    unless_null $P19, vivify_16
    new $P19, "Undef"
    set_global "$Dump_detail", $P19
  vivify_16:
    find_lex $P20, "$level"
    set_global "$Dump_detail", $P20
# .annotate "line", 6
    .return ($P20)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P21, exception, "payload"
    .return ($P21)
.end


.namespace ["Sub"]
.sub "get_dump_detail"  :subid("13_1268405366.70718") :outer("11_1268405366.70718")
# .annotate "line", 10
    new $P24, 'ExceptionHandler'
    set_addr $P24, control_23
    $P24."handle_types"(58)
    push_eh $P24
# .annotate "line", 11
    get_global $P25, "$Dump_detail"
    unless_null $P25, vivify_17
    new $P25, "Undef"
    set_global "$Dump_detail", $P25
  vivify_17:
# .annotate "line", 10
    get_global $P26, "$Dump_detail"
# .annotate "line", 13
    get_hll_global $P28, ["Opcode"], "isnull"
    get_global $P29, "$Dump_detail"
    $P30 = $P28($P29)
    unless $P30, if_27_end
# .annotate "line", 14
    new $P31, "Integer"
    assign $P31, 0
    set_global "$Dump_detail", $P31
  if_27_end:
# .annotate "line", 17
    new $P32, "Exception"
    set $P32['type'], 58
    get_global $P33, "$Dump_detail"
    setattribute $P32, 'payload', $P33
    throw $P32
# .annotate "line", 10
    .return ()
  control_23:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P34, exception, "payload"
    .return ($P34)
.end


.namespace ["Sub"]
.sub "__dump"  :subid("14_1268405366.70718") :method :outer("11_1268405366.70718")
    .param pmc param_40
    .param pmc param_41
# .annotate "line", 20
    .const 'Sub' $P62 = "15_1268405366.70718" 
    capture_lex $P62
    new $P39, 'ExceptionHandler'
    set_addr $P39, control_38
    $P39."handle_types"(58)
    push_eh $P39
    .lex "self", self
    .lex "$dumper", param_40
    .lex "$label", param_41
# .annotate "line", 21
    new $P42, "ResizablePMCArray"
    .lex "@results", $P42
# .annotate "line", 22
    new $P43, "Undef"
    .lex "$subindent", $P43
# .annotate "line", 23
    new $P44, "Undef"
    .lex "$indent", $P44
# .annotate "line", 21
    get_hll_global $P45, ["Parrot"], "call_tuple_method"
    find_lex $P46, "$dumper"
    $P47 = $P45($P46, "newIndent")
    store_lex "@results", $P47
# .annotate "line", 22
    new $P48, "String"
    assign $P48, "\n"
    find_lex $P49, "@results"
    $S50 = $P49."shift"()
    concat $P51, $P48, $S50
    store_lex "$subindent", $P51
# .annotate "line", 23
    new $P52, "String"
    assign $P52, "\n"
    find_lex $P53, "@results"
    $S54 = $P53."shift"()
    concat $P55, $P52, $S54
    store_lex "$indent", $P55
# .annotate "line", 25
    $N57 = "get_dump_detail"()
    iseq $I58, $N57, 0.0
    if $I58, if_56
# .annotate "line", 28
    .const 'Sub' $P62 = "15_1268405366.70718" 
    capture_lex $P62
    $P62()
    goto if_56_end
  if_56:
# .annotate "line", 26
    find_lex $P59, "self"
    set $S60, $P59
    "print"("'", $S60, "'")
  if_56_end:
# .annotate "line", 61
    find_lex $P151, "$dumper"
    $P152 = $P151."deleteIndent"()
# .annotate "line", 20
    .return ($P152)
  control_38:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P153, exception, "payload"
    .return ($P153)
.end


.namespace ["Sub"]
.sub "_block61"  :anon :subid("15_1268405366.70718") :outer("14_1268405366.70718")
# .annotate "line", 29
    new $P63, "Undef"
    .lex "$nsp", $P63
# .annotate "line", 41
    new $P64, "Undef"
    .lex "$flags", $P64
# .annotate "line", 43
    new $P65, "Undef"
    .lex "$subid", $P65
# .annotate "line", 46
    new $P66, "Undef"
    .lex "$outer", $P66
# .annotate "line", 29
    find_lex $P67, "self"
    $P68 = $P67."get_namespace"()
    store_lex "$nsp", $P68
# .annotate "line", 31
    get_hll_global $P72, ["Opcode"], "isnull"
    find_lex $P73, "$nsp"
    $P74 = $P72($P73)
    isfalse $I75, $P74
    if $I75, if_71
    new $P70, 'Integer'
    set $P70, $I75
    goto if_71_end
  if_71:
    get_hll_global $P76, ["Opcode"], "defined"
    find_lex $P77, "$nsp"
    $P78 = $P76($P77)
    set $P70, $P78
  if_71_end:
    if $P70, if_69
# .annotate "line", 35
    new $P82, "String"
    assign $P82, "<no namespace>"
    store_lex "$nsp", $P82
# .annotate "line", 34
    goto if_69_end
  if_69:
# .annotate "line", 32
    find_lex $P79, "$nsp"
    $P80 = $P79."get_name"()
    $P81 = $P80."join"("::")
    store_lex "$nsp", $P81
  if_69_end:
# .annotate "line", 38
    find_lex $P83, "self"
    set $S84, $P83
    "print"("'", $S84, "'  {")
# .annotate "line", 39
    find_lex $P85, "$subindent"
    find_lex $P86, "$nsp"
    "print"($P85, "Namespace : ", $P86)
# .annotate "line", 41
    new $P87, "String"
    assign $P87, ""
    store_lex "$flags", $P87
# .annotate "line", 43
    find_lex $P88, "self"
    $P89 = $P88."get_subid"()
    store_lex "$subid", $P89
# .annotate "line", 44
    get_hll_global $P93, ["Opcode"], "isnull"
    find_lex $P94, "$subid"
    $P95 = $P93($P94)
    isfalse $I96, $P95
    if $I96, if_92
    new $P91, 'Integer'
    set $P91, $I96
    goto if_92_end
  if_92:
    find_lex $P97, "$subid"
    set $P91, $P97
  if_92_end:
    unless $P91, if_90_end
    new $P98, "String"
    assign $P98, " subid('"
    find_lex $P99, "$subid"
    concat $P100, $P98, $P99
    concat $P101, $P100, "')"
    store_lex "$flags", $P101
  if_90_end:
# .annotate "line", 46
    find_lex $P102, "self"
    $P103 = $P102."get_outer"()
    store_lex "$outer", $P103
# .annotate "line", 47
    get_hll_global $P107, ["Opcode"], "isnull"
    find_lex $P108, "$outer"
    $P109 = $P107($P108)
    isfalse $I110, $P109
    if $I110, if_106
    new $P105, 'Integer'
    set $P105, $I110
    goto if_106_end
  if_106:
    find_lex $P111, "$outer"
    set $P105, $P111
  if_106_end:
    unless $P105, if_104_end
    new $P112, "String"
    assign $P112, " outer('"
    find_lex $P113, "$outer"
    concat $P114, $P112, $P113
    concat $P115, $P114, "')"
    store_lex "$flags", $P115
  if_104_end:
# .annotate "line", 49
    find_lex $P116, "$subindent"
    find_lex $P119, "$flags"
    if $P119, if_118
    new $P121, "String"
    assign $P121, "<none>"
    set $P117, $P121
    goto if_118_end
  if_118:
    find_lex $P120, "$flags"
    set $P117, $P120
  if_118_end:
    "print"($P116, "Flags     :", $P117)
# .annotate "line", 51
    find_lex $P122, "$subindent"
    get_hll_global $P123, ["Opcode"], "inspect_string"
    find_lex $P124, "self"
    $P125 = $P123($P124, "pos_required")
# .annotate "line", 52
    get_hll_global $P126, ["Opcode"], "inspect_string"
    find_lex $P127, "self"
    $P128 = $P126($P127, "pos_optional")
# .annotate "line", 53
    get_hll_global $P131, ["Opcode"], "inspect_string"
    find_lex $P132, "self"
    $P133 = $P131($P132, "pos_slurpy")
    if $P133, if_130
    new $P135, "String"
    assign $P135, ""
    set $P129, $P135
    goto if_130_end
  if_130:
    new $P134, "String"
    assign $P134, ", *@"
    set $P129, $P134
  if_130_end:
# .annotate "line", 54
    get_hll_global $P136, ["Opcode"], "inspect_string"
    find_lex $P137, "self"
    $P138 = $P136($P137, "named_required")
# .annotate "line", 55
    get_hll_global $P139, ["Opcode"], "inspect_string"
    find_lex $P140, "self"
    $P141 = $P139($P140, "named_optional")
# .annotate "line", 56
    get_hll_global $P144, ["Opcode"], "inspect_string"
    find_lex $P145, "self"
    $P146 = $P144($P145, "named_slurpy")
    if $P146, if_143
    new $P148, "String"
    assign $P148, ""
    set $P142, $P148
    goto if_143_end
  if_143:
    new $P147, "String"
    assign $P147, ", *%"
    set $P142, $P147
  if_143_end:
    "print"($P122, "Parameters: (+", $P125, ", ?", $P128, $P129, ", :+", $P138, ", :?", $P141, $P142, ")")
# .annotate "line", 58
    find_lex $P149, "$indent"
    $P150 = "print"($P149, "}")
# .annotate "line", 28
    .return ($P150)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268405313.59638")
# .annotate "line", 0
    get_hll_global $P14, ["Undef"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Undef"], "_block13" 
    capture_lex $P14
    $P19 = $P14()
# .annotate "line", 1
    .return ($P19)
.end


.namespace ["Undef"]
.sub "_block13"  :subid("11_1268405313.59638") :outer("10_1268405313.59638")
# .annotate "line", 7
    .const 'Sub' $P15 = "12_1268405313.59638" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268405313.59638" 
    capture_lex $P15
    .return ($P15)
.end


.namespace ["Undef"]
.sub "defined"  :subid("12_1268405313.59638") :method :outer("11_1268405313.59638")
# .annotate "line", 7
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
    .return (0)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P18, exception, "payload"
    .return ($P18)
.end

# kakapo_bottom.pir - code to be attached to the end of kakapo libraries.

# Copyright (C) 2009, Austin Hastings. See LICENSE distributed with this file 
# or at http://www.opensource.org/licenses/artistic-license-2.0.php

.namespace [ 'Kakapo' ]

.sub kakapo_bottom_init :init
	$S0 = 'library_init_done'
	.tailcall kakapo_bottom_notify($S0)
.end

.sub kakapo_bottom_load :load
	$S0 = 'library_load_done'
	.tailcall kakapo_bottom_notify($S0)
.end

.sub kakapo_bottom_notify
	.param string sub_name
	
	$P0 = get_hll_global [ 'Kakapo' ], sub_name
	unless null $P0 goto notify
	
	$S0 = "Could not locate 'Kakapo::"
	concat $S0, sub_name
	concat $S0, "' function"
	die $S0

notify:
	.tailcall $P0()
.end
