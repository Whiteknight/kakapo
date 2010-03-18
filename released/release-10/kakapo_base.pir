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
.sub "_block11"  :anon :subid("10_1268929875.00473")
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
.sub "_block13"  :subid("11_1268929875.00473") :outer("10_1268929875.00473")
# .annotate "line", 6
    .const 'Sub' $P28 = "15_1268929875.00473" 
    capture_lex $P28
    .const 'Sub' $P24 = "14_1268929875.00473" 
    capture_lex $P24
    .const 'Sub' $P19 = "13_1268929875.00473" 
    capture_lex $P19
    .const 'Sub' $P15 = "12_1268929875.00473" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929875.00473" 
    capture_lex $P15
    .lex "is_loaded", $P15
# .annotate "line", 10
    .const 'Sub' $P19 = "13_1268929875.00473" 
    capture_lex $P19
    .lex "get_preinit_subs", $P19
# .annotate "line", 27
    .const 'Sub' $P24 = "14_1268929875.00473" 
    capture_lex $P24
    .lex "library_init_done", $P24
# .annotate "line", 31
    .const 'Sub' $P28 = "15_1268929875.00473" 
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
.sub "is_loaded"  :subid("12_1268929875.00473") :outer("11_1268929875.00473")
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
.sub "get_preinit_subs"  :subid("13_1268929875.00473") :outer("11_1268929875.00473")
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
.sub "library_init_done"  :subid("14_1268929875.00473") :outer("11_1268929875.00473")
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
.sub "library_load_done"  :subid("15_1268929875.00473") :outer("11_1268929875.00473")
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
.sub "_block11"  :anon :subid("10_1268929836.49415")
# .annotate "line", 0
    get_hll_global $P14, ["Global"], "_block13" 
    capture_lex $P14
# .annotate "line", 31
    get_hll_global $P14, ["Global"], "_block13" 
    capture_lex $P14
    $P344 = $P14()
# .annotate "line", 1
    .return ($P344)
.end


.namespace ["Global"]
.sub "_block13"  :subid("11_1268929836.49415") :outer("10_1268929836.49415")
# .annotate "line", 31
    .const 'Sub' $P218 = "20_1268929836.49415" 
    capture_lex $P218
    .const 'Sub' $P193 = "19_1268929836.49415" 
    capture_lex $P193
    .const 'Sub' $P135 = "17_1268929836.49415" 
    capture_lex $P135
    .const 'Sub' $P119 = "16_1268929836.49415" 
    capture_lex $P119
    .const 'Sub' $P22 = "13_1268929836.49415" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1268929836.49415" 
    capture_lex $P15
# .annotate "line", 151
    .const 'Sub' $P218 = "20_1268929836.49415" 
    capture_lex $P218
# .annotate "line", 31
    .return ($P218)
.end


.namespace ["Global"]
.sub "_pre_initload"  :subid("12_1268929836.49415") :outer("11_1268929836.49415")
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
.sub "export"  :subid("13_1268929836.49415") :outer("11_1268929836.49415")
    .param pmc param_25
    .param pmc param_26 :slurpy
    .param pmc param_27 :optional :named("as")
    .param int has_param_27 :opt_flag
    .param pmc param_29 :optional :named("namespace")
    .param int has_param_29 :opt_flag
    .param pmc param_32 :optional :named("tags")
    .param int has_param_32 :opt_flag
# .annotate "line", 65
    .const 'Sub' $P82 = "14_1268929836.49415" 
    capture_lex $P82
    new $P24, 'ExceptionHandler'
    set_addr $P24, control_23
    $P24."handle_types"(58)
    push_eh $P24
    .lex "$symbol", param_25
    .lex "@symbols", param_26
    if has_param_27, optparam_24
    new $P28, "Undef"
    set param_27, $P28
  optparam_24:
    .lex "$as", param_27
    if has_param_29, optparam_25
    get_hll_global $P30, ["Parrot"], "caller_namespace"
    $P31 = $P30()
    set param_29, $P31
  optparam_25:
    .lex "$namespace", param_29
    if has_param_32, optparam_26
    $P33 = root_new ['parrot';'ResizablePMCArray']
    set param_32, $P33
  optparam_26:
    .lex "@tags", param_32
# .annotate "line", 80
    new $P34, "Undef"
    .lex "$export_nsp", $P34
# .annotate "line", 66
    find_lex $P38, "$symbol"
    new $P39, "String"
    assign $P39, "String"
    set $S40, $P39
    isa $I41, $P38, $S40
    unless $I41, unless_37
    new $P36, 'Integer'
    set $P36, $I41
    goto unless_37_end
  unless_37:
    find_lex $P42, "$symbol"
    new $P43, "String"
    assign $P43, "array"
    set $S44, $P43
    does $I45, $P42, $S44
    new $P46, 'Integer'
    set $P46, $I45
    isfalse $I47, $P46
    new $P36, 'Integer'
    set $P36, $I47
  unless_37_end:
    if $P36, if_35
# .annotate "line", 70
    find_lex $P50, "$symbol"
    store_lex "@symbols", $P50
# .annotate "line", 69
    goto if_35_end
  if_35:
# .annotate "line", 67
    find_lex $P48, "@symbols"
    find_lex $P49, "$symbol"
    $P48."unshift"($P49)
  if_35_end:
# .annotate "line", 73
    find_lex $P52, "@tags"
    new $P53, "String"
    assign $P53, "ResizablePMCArray"
    set $S54, $P53
    isa $I55, $P52, $S54
    new $P56, 'Integer'
    set $P56, $I55
    isfalse $I57, $P56
    if $I57, if_51
# .annotate "line", 74
    find_lex $P62, "@tags"
    set $N63, $P62
    iseq $I64, $N63, 0.0
    unless $I64, if_61_end
    find_lex $P65, "@tags"
    $P65."push"("DEFAULT")
  if_61_end:
    goto if_51_end
  if_51:
# .annotate "line", 73
    get_hll_global $P58, ["Array"], "new"
    find_lex $P59, "@tags"
    $P60 = $P58($P59)
    store_lex "@tags", $P60
  if_51_end:
# .annotate "line", 76
    get_hll_global $P67, ["Opcode"], "isa"
    find_lex $P68, "$namespace"
    $P69 = $P67($P68, "String")
    unless $P69, if_66_end
# .annotate "line", 77
    get_hll_global $P70, ["Parrot"], "get_hll_namespace"
    find_lex $P71, "$namespace"
    $P72 = $P70($P71)
    store_lex "$namespace", $P72
  if_66_end:
# .annotate "line", 80
    get_hll_global $P73, ["Parrot"], "caller_namespace"
    $P74 = $P73()
    $P75 = $P74."make_namespace"("EXPORT")
    store_lex "$export_nsp", $P75
# .annotate "line", 82
    find_lex $P76, "@tags"
    $P76."push"("ALL")
# .annotate "line", 84
    find_lex $P78, "@tags"
    defined $I79, $P78
    unless $I79, for_undef_27
    iter $P77, $P78
    new $P116, 'ExceptionHandler'
    set_addr $P116, loop115_handler
    $P116."handle_types"(65, 67, 66)
    push_eh $P116
  loop115_test:
    unless $P77, loop115_done
    shift $P80, $P77
  loop115_redo:
    .const 'Sub' $P82 = "14_1268929836.49415" 
    capture_lex $P82
    $P82($P80)
  loop115_next:
    goto loop115_test
  loop115_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, 'type'
    eq $P117, 65, loop115_next
    eq $P117, 67, loop115_redo
  loop115_done:
    pop_eh 
  for_undef_27:
# .annotate "line", 65
    .return ($P77)
  control_23:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, "payload"
    .return ($P118)
.end


.namespace ["Global"]
.sub "_block81"  :anon :subid("14_1268929836.49415") :outer("13_1268929836.49415")
    .param pmc param_84
# .annotate "line", 84
    .const 'Sub' $P95 = "15_1268929836.49415" 
    capture_lex $P95
# .annotate "line", 85
    new $P83, "Undef"
    .lex "$tag_nsp", $P83
    .lex "$_", param_84
    find_lex $P85, "$export_nsp"
    find_lex $P86, "$_"
    set $S87, $P86
    $P88 = $P85."make_namespace"($S87)
    store_lex "$tag_nsp", $P88
# .annotate "line", 87
    get_hll_global $P91, ["Opcode"], "defined"
    find_lex $P92, "$as"
    $P93 = $P91($P92)
    if $P93, if_90
# .annotate "line", 96
    find_lex $P111, "$namespace"
    find_lex $P112, "$tag_nsp"
    find_lex $P113, "@symbols"
    $P114 = $P111."export_to"($P112, $P113)
# .annotate "line", 95
    set $P89, $P114
# .annotate "line", 87
    goto if_90_end
  if_90:
    .const 'Sub' $P95 = "15_1268929836.49415" 
    capture_lex $P95
    $P110 = $P95()
    set $P89, $P110
  if_90_end:
# .annotate "line", 84
    .return ($P89)
.end


.namespace ["Global"]
.sub "_block94"  :anon :subid("15_1268929836.49415") :outer("14_1268929836.49415")
# .annotate "line", 88
    new $P96, "Undef"
    .lex "$export_sym", $P96
    find_lex $P97, "@symbols"
    unless_null $P97, vivify_28
    $P97 = root_new ['parrot';'ResizablePMCArray']
  vivify_28:
    set $P98, $P97[0]
    unless_null $P98, vivify_29
    new $P98, "Undef"
  vivify_29:
    store_lex "$export_sym", $P98
# .annotate "line", 89
    get_hll_global $P100, ["Opcode"], "isa"
    find_lex $P101, "$export_sym"
    $P102 = $P100($P101, "String")
    unless $P102, if_99_end
# .annotate "line", 90
    find_lex $P103, "$namespace"
    find_lex $P104, "$export_sym"
    $P105 = $P103."get_sym"($P104)
    store_lex "$export_sym", $P105
  if_99_end:
# .annotate "line", 93
    find_lex $P106, "$export_sym"
    find_lex $P107, "$as"
    find_lex $P108, "$tag_nsp"
    $P109 = "inject_symbol"($P106, $P107 :named("as"), $P108 :named("namespace"))
# .annotate "line", 87
    .return ($P109)
.end


.namespace ["Global"]
.sub "inject_root_symbol"  :subid("16_1268929836.49415") :outer("11_1268929836.49415")
    .param pmc param_122
    .param pmc param_123 :optional :named("as")
    .param int has_param_123 :opt_flag
    .param pmc param_125 :optional :named("force")
    .param int has_param_125 :opt_flag
# .annotate "line", 101
    new $P121, 'ExceptionHandler'
    set_addr $P121, control_120
    $P121."handle_types"(58)
    push_eh $P121
    .lex "$pmc", param_122
    if has_param_123, optparam_30
    new $P124, "Undef"
    set param_123, $P124
  optparam_30:
    .lex "$as", param_123
    if has_param_125, optparam_31
    new $P126, "Undef"
    set param_125, $P126
  optparam_31:
    .lex "$force", param_125
# .annotate "line", 102
    new $P127, "Undef"
    .lex "$hll_namespace", $P127
    get_hll_namespace $P128
    store_lex "$hll_namespace", $P128
# .annotate "line", 103
    find_lex $P129, "$pmc"
    find_lex $P130, "$as"
    find_lex $P131, "$hll_namespace"
    find_lex $P132, "$force"
    $P133 = "inject_symbol"($P129, $P130 :named("as"), $P131 :named("namespace"), $P132 :named("force"))
# .annotate "line", 101
    .return ($P133)
  control_120:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P134, exception, "payload"
    .return ($P134)
.end


.namespace ["Global"]
.sub "inject_symbol"  :subid("17_1268929836.49415") :outer("11_1268929836.49415")
    .param pmc param_138
    .param pmc param_139 :optional :named("namespace")
    .param int has_param_139 :opt_flag
    .param pmc param_141 :optional :named("as")
    .param int has_param_141 :opt_flag
    .param pmc param_143 :optional :named("force")
    .param int has_param_143 :opt_flag
# .annotate "line", 107
    .const 'Sub' $P168 = "18_1268929836.49415" 
    capture_lex $P168
    new $P137, 'ExceptionHandler'
    set_addr $P137, control_136
    $P137."handle_types"(58)
    push_eh $P137
    .lex "$object", param_138
    if has_param_139, optparam_32
    new $P140, "Undef"
    set param_139, $P140
  optparam_32:
    .lex "$namespace", param_139
    if has_param_141, optparam_33
    new $P142, "Undef"
    set param_141, $P142
  optparam_33:
    .lex "$as", param_141
    if has_param_143, optparam_34
    new $P144, "Undef"
    set param_143, $P144
  optparam_34:
    .lex "$force", param_143
# .annotate "line", 114
    find_lex $P146, "$as"
    set $P145, $P146
    defined $I148, $P145
    if $I148, default_147
    find_lex $P149, "$object"
    set $S150, $P149
    set $P145, $S150
  default_147:
    store_lex "$as", $P145
# .annotate "line", 116
    find_lex $P152, "$namespace"
    isa $I153, $P152, "NameSpace"
    if $I153, unless_151_end
# .annotate "line", 117
    get_hll_global $P154, ["Opcode"], "get_hll_namespace"
    find_lex $P155, "$namespace"
    $P156 = $P154($P155)
    store_lex "$namespace", $P156
  unless_151_end:
# .annotate "line", 122
    find_lex $P160, "$force"
    isfalse $I161, $P160
    if $I161, if_159
    new $P158, 'Integer'
    set $P158, $I161
    goto if_159_end
  if_159:
    get_hll_global $P162, ["Opcode"], "defined"
    find_lex $P163, "$namespace"
    find_lex $P164, "$as"
    $P165 = $P163."find_var"($P164)
    $P166 = $P162($P165)
    set $P158, $P166
  if_159_end:
    unless $P158, if_157_end
    .const 'Sub' $P168 = "18_1268929836.49415" 
    capture_lex $P168
    $P168()
  if_157_end:
# .annotate "line", 130
    find_lex $P188, "$namespace"
    find_lex $P189, "$as"
    find_lex $P190, "$object"
    $P191 = $P188."add_var"($P189, $P190)
# .annotate "line", 107
    .return ($P191)
  control_136:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P192, exception, "payload"
    .return ($P192)
.end


.namespace ["Global"]
.sub "_block167"  :anon :subid("18_1268929836.49415") :outer("17_1268929836.49415")
# .annotate "line", 123
    new $P169, "Undef"
    .lex "$ns_name", $P169
    new $P170, "String"
    assign $P170, "::"
    set $S171, $P170
    find_lex $P172, "$namespace"
    $P173 = $P172."get_name"()
    join $S174, $S171, $P173
    new $P175, 'String'
    set $P175, $S174
    store_lex "$ns_name", $P175
# .annotate "line", 124
    new $P176, 'String'
    set $P176, "Warning: symbol "
    find_lex $P177, "$as"
    concat $P178, $P176, $P177
    concat $P179, $P178, " already exists in namespace "
    find_lex $P180, "$ns_name"
    concat $P181, $P179, $P180
    say $P181
# .annotate "line", 125
    get_hll_global $P182, ["Sub"], "set_dump_detail"
    $P182(1)
# .annotate "line", 126
    find_lex $P183, "$namespace"
    find_lex $P184, "$as"
    $P185 = $P183."find_var"($P184)
    "_dumper"($P185)
# .annotate "line", 127
    new $P186, "Exception"
    set $P186['type'], 58
    new $P187, "Integer"
    assign $P187, 0
    setattribute $P186, 'payload', $P187
    throw $P186
# .annotate "line", 122
    .return ()
.end


.namespace ["Global"]
.sub "register_global"  :subid("19_1268929836.49415") :outer("11_1268929836.49415")
    .param pmc param_196
    .param pmc param_197
    .param pmc param_198 :optional :named("namespace")
    .param int has_param_198 :opt_flag
# .annotate "line", 139
    new $P195, 'ExceptionHandler'
    set_addr $P195, control_194
    $P195."handle_types"(58)
    push_eh $P195
    .lex "$name", param_196
    .lex "$object", param_197
    if has_param_198, optparam_35
    new $P199, "String"
    assign $P199, "Global"
    set param_198, $P199
  optparam_35:
    .lex "$namespace", param_198
# .annotate "line", 144
    new $P200, "Undef"
    .lex "$nsp", $P200
# .annotate "line", 140
    get_hll_global $P202, ["Opcode"], "isa"
    find_lex $P203, "$namespace"
    $P204 = $P202($P203, "String")
    unless $P204, if_201_end
# .annotate "line", 141
    find_lex $P205, "$namespace"
    $P206 = $P205."split"("::")
    store_lex "$namespace", $P206
  if_201_end:
# .annotate "line", 144
    get_hll_namespace $P207
    store_lex "$nsp", $P207
# .annotate "line", 145
    find_lex $P208, "$nsp"
    find_lex $P209, "$namespace"
    $P210 = $P208."make_namespace"($P209)
    store_lex "$nsp", $P210
# .annotate "line", 147
    find_lex $P211, "$object"
    find_lex $P212, "$name"
    find_lex $P213, "$nsp"
    unless_null $P213, vivify_36
    $P213 = root_new ['parrot';'Hash']
    store_lex "$nsp", $P213
  vivify_36:
    set $P213[$P212], $P211
# .annotate "line", 148
    find_lex $P214, "$name"
    find_lex $P215, "$nsp"
    $P216 = "export"($P214, $P215 :named("namespace"))
# .annotate "line", 139
    .return ($P216)
  control_194:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P217, exception, "payload"
    .return ($P217)
.end


.namespace ["Global"]
.sub "use"  :subid("20_1268929836.49415") :outer("11_1268929836.49415")
    .param pmc param_221 :optional
    .param int has_param_221 :opt_flag
    .param pmc param_224 :optional :named("except")
    .param int has_param_224 :opt_flag
    .param pmc param_226 :optional :named("tags")
    .param int has_param_226 :opt_flag
    .param pmc param_228 :optional :named("symbols")
    .param int has_param_228 :opt_flag
# .annotate "line", 151
    .const 'Sub' $P294 = "22_1268929836.49415" 
    capture_lex $P294
    .const 'Sub' $P281 = "21_1268929836.49415" 
    capture_lex $P281
    new $P220, 'ExceptionHandler'
    set_addr $P220, control_219
    $P220."handle_types"(58)
    push_eh $P220
    if has_param_221, optparam_37
    get_hll_global $P222, ["Parrot"], "caller_namespace"
    $P223 = $P222(0)
    set param_221, $P223
  optparam_37:
    .lex "$module", param_221
    if has_param_224, optparam_38
    $P225 = root_new ['parrot';'ResizablePMCArray']
    set param_224, $P225
  optparam_38:
    .lex "@except", param_224
    if has_param_226, optparam_39
    $P227 = root_new ['parrot';'ResizablePMCArray']
    set param_226, $P227
  optparam_39:
    .lex "@tags", param_226
    if has_param_228, optparam_40
    $P229 = root_new ['parrot';'ResizablePMCArray']
    set param_228, $P229
  optparam_40:
    .lex "@symbols", param_228
# .annotate "line", 183
    new $P230, "Undef"
    .lex "$export_nsp", $P230
# .annotate "line", 184
    new $P231, "Undef"
    .lex "$target_nsp", $P231
# .annotate "line", 186
    $P232 = root_new ['parrot';'Hash']
    .lex "%except", $P232
# .annotate "line", 173
    get_hll_global $P234, ["Opcode"], "isa"
    find_lex $P235, "@tags"
    $P236 = $P234($P235, "String")
    unless $P236, if_233_end
    get_hll_global $P237, ["Array"], "new"
    find_lex $P238, "@tags"
    $P239 = $P237($P238)
    store_lex "@tags", $P239
  if_233_end:
# .annotate "line", 174
    get_hll_global $P241, ["Opcode"], "isa"
    find_lex $P242, "@symbols"
    $P243 = $P241($P242, "String")
    unless $P243, if_240_end
    get_hll_global $P244, ["Array"], "new"
    find_lex $P245, "@symbols"
    $P246 = $P244($P245)
    store_lex "@symbols", $P246
  if_240_end:
# .annotate "line", 176
    get_hll_global $P248, ["Opcode"], "isa"
    find_lex $P249, "$module"
    $P250 = $P248($P249, "P6object")
    unless $P250, if_247_end
    get_hll_global $P251, ["Opcode"], "typeof"
    find_lex $P252, "$module"
    $P253 = $P251($P252)
    store_lex "$module", $P253
  if_247_end:
# .annotate "line", 177
    get_hll_global $P255, ["Opcode"], "isa"
    find_lex $P256, "$module"
    $P257 = $P255($P256, "String")
    unless $P257, if_254_end
    get_hll_global $P258, ["Parrot"], "get_hll_namespace"
    find_lex $P259, "$module"
    $P260 = $P258($P259)
    store_lex "$module", $P260
  if_254_end:
# .annotate "line", 179
    find_lex $P264, "@tags"
    set $N265, $P264
    iseq $I266, $N265, 0.0
    if $I266, if_263
    new $P262, 'Integer'
    set $P262, $I266
    goto if_263_end
  if_263:
    find_lex $P267, "@symbols"
    set $N268, $P267
    iseq $I269, $N268, 0.0
    new $P262, 'Integer'
    set $P262, $I269
  if_263_end:
    unless $P262, if_261_end
# .annotate "line", 180
    find_lex $P270, "@tags"
    $P270."push"("DEFAULT")
  if_261_end:
# .annotate "line", 183
    find_lex $P271, "$module"
    $P272 = $P271."make_namespace"("EXPORT")
    store_lex "$export_nsp", $P272
# .annotate "line", 184
    get_hll_global $P273, ["Parrot"], "caller_namespace"
    $P274 = $P273()
    store_lex "$target_nsp", $P274
    find_lex $P275, "%except"
# .annotate "line", 188
    find_lex $P277, "@except"
    defined $I278, $P277
    unless $I278, for_undef_41
    iter $P276, $P277
    new $P287, 'ExceptionHandler'
    set_addr $P287, loop286_handler
    $P287."handle_types"(65, 67, 66)
    push_eh $P287
  loop286_test:
    unless $P276, loop286_done
    shift $P279, $P276
  loop286_redo:
    .const 'Sub' $P281 = "21_1268929836.49415" 
    capture_lex $P281
    $P281($P279)
  loop286_next:
    goto loop286_test
  loop286_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P288, exception, 'type'
    eq $P288, 65, loop286_next
    eq $P288, 67, loop286_redo
  loop286_done:
    pop_eh 
  for_undef_41:
# .annotate "line", 192
    find_lex $P290, "@tags"
    defined $I291, $P290
    unless $I291, for_undef_43
    iter $P289, $P290
    new $P332, 'ExceptionHandler'
    set_addr $P332, loop331_handler
    $P332."handle_types"(65, 67, 66)
    push_eh $P332
  loop331_test:
    unless $P289, loop331_done
    shift $P292, $P289
  loop331_redo:
    .const 'Sub' $P294 = "22_1268929836.49415" 
    capture_lex $P294
    $P294($P292)
  loop331_next:
    goto loop331_test
  loop331_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P333, exception, 'type'
    eq $P333, 65, loop331_next
    eq $P333, 67, loop331_redo
  loop331_done:
    pop_eh 
  for_undef_43:
# .annotate "line", 207
    find_lex $P336, "@symbols"
    set $N337, $P336
    if $N337, if_335
    new $P334, 'Float'
    set $P334, $N337
    goto if_335_end
  if_335:
# .annotate "line", 208
    find_lex $P338, "$export_nsp"
    unless_null $P338, vivify_47
    $P338 = root_new ['parrot';'Hash']
  vivify_47:
    set $P339, $P338["ALL"]
    unless_null $P339, vivify_48
    new $P339, "Undef"
  vivify_48:
    find_lex $P340, "$target_nsp"
    find_lex $P341, "@symbols"
    $P342 = $P339."export_to"($P340, $P341)
# .annotate "line", 207
    set $P334, $P342
  if_335_end:
# .annotate "line", 151
    .return ($P334)
  control_219:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P343, exception, "payload"
    .return ($P343)
.end


.namespace ["Global"]
.sub "_block280"  :anon :subid("21_1268929836.49415") :outer("20_1268929836.49415")
    .param pmc param_282
# .annotate "line", 188
    .lex "$_", param_282
# .annotate "line", 189
    new $P283, "Integer"
    assign $P283, 1
    find_lex $P284, "$_"
    find_lex $P285, "%except"
    unless_null $P285, vivify_42
    $P285 = root_new ['parrot';'Hash']
    store_lex "%except", $P285
  vivify_42:
    set $P285[$P284], $P283
# .annotate "line", 188
    .return ($P283)
.end


.namespace ["Global"]
.sub "_block293"  :anon :subid("22_1268929836.49415") :outer("20_1268929836.49415")
    .param pmc param_297
# .annotate "line", 192
    .const 'Sub' $P309 = "23_1268929836.49415" 
    capture_lex $P309
# .annotate "line", 193
    new $P295, "Undef"
    .lex "$source_nsp", $P295
# .annotate "line", 194
    $P296 = root_new ['parrot';'ResizablePMCArray']
    .lex "@tag_symbols", $P296
    .lex "$_", param_297
# .annotate "line", 193
    find_lex $P298, "$export_nsp"
    find_lex $P299, "$_"
    set $S300, $P299
    $P301 = $P298."make_namespace"($S300)
    store_lex "$source_nsp", $P301
    find_lex $P302, "@tag_symbols"
# .annotate "line", 196
    find_lex $P304, "$source_nsp"
    $P305 = $P304."keys"()
    defined $I306, $P305
    unless $I306, for_undef_44
    iter $P303, $P305
    new $P321, 'ExceptionHandler'
    set_addr $P321, loop320_handler
    $P321."handle_types"(65, 67, 66)
    push_eh $P321
  loop320_test:
    unless $P303, loop320_done
    shift $P307, $P303
  loop320_redo:
    .const 'Sub' $P309 = "23_1268929836.49415" 
    capture_lex $P309
    $P309($P307)
  loop320_next:
    goto loop320_test
  loop320_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P322, exception, 'type'
    eq $P322, 65, loop320_next
    eq $P322, 67, loop320_redo
  loop320_done:
    pop_eh 
  for_undef_44:
# .annotate "line", 202
    find_lex $P325, "@tag_symbols"
    set $N326, $P325
    if $N326, if_324
    new $P323, 'Float'
    set $P323, $N326
    goto if_324_end
  if_324:
# .annotate "line", 203
    find_lex $P327, "$source_nsp"
    find_lex $P328, "$target_nsp"
    find_lex $P329, "@tag_symbols"
    $P330 = $P327."export_to"($P328, $P329)
# .annotate "line", 202
    set $P323, $P330
  if_324_end:
# .annotate "line", 192
    .return ($P323)
.end


.namespace ["Global"]
.sub "_block308"  :anon :subid("23_1268929836.49415") :outer("22_1268929836.49415")
    .param pmc param_310
# .annotate "line", 196
    .lex "$_", param_310
# .annotate "line", 197
    find_lex $P313, "$_"
    find_lex $P314, "%except"
    unless_null $P314, vivify_45
    $P314 = root_new ['parrot';'Hash']
  vivify_45:
    set $P315, $P314[$P313]
    unless_null $P315, vivify_46
    new $P315, "Undef"
  vivify_46:
    unless $P315, unless_312
    set $P311, $P315
    goto unless_312_end
  unless_312:
# .annotate "line", 198
    find_lex $P316, "@tag_symbols"
    find_lex $P317, "$_"
    set $S318, $P317
    $P319 = $P316."push"($S318)
# .annotate "line", 197
    set $P311, $P319
  unless_312_end:
# .annotate "line", 196
    .return ($P311)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929937.27567")
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
.sub "_block13"  :subid("11_1268929937.27567") :outer("10_1268929937.27567")
# .annotate "line", 7
    .const 'Sub' $P58 = "17_1268929937.27567" 
    capture_lex $P58
    .const 'Sub' $P51 = "16_1268929937.27567" 
    capture_lex $P51
    .const 'Sub' $P44 = "15_1268929937.27567" 
    capture_lex $P44
    .const 'Sub' $P37 = "14_1268929937.27567" 
    capture_lex $P37
    .const 'Sub' $P30 = "13_1268929937.27567" 
    capture_lex $P30
    .const 'Sub' $P15 = "12_1268929937.27567" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929937.27567" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 15
    .const 'Sub' $P30 = "13_1268929937.27567" 
    capture_lex $P30
    .lex "die", $P30
# .annotate "line", 19
    .const 'Sub' $P37 = "14_1268929937.27567" 
    capture_lex $P37
    .lex "last", $P37
# .annotate "line", 23
    .const 'Sub' $P44 = "15_1268929937.27567" 
    capture_lex $P44
    .lex "next", $P44
# .annotate "line", 27
    .const 'Sub' $P51 = "16_1268929937.27567" 
    capture_lex $P51
    .lex "redo", $P51
# .annotate "line", 31
    .const 'Sub' $P58 = "17_1268929937.27567" 
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
.sub "_pre_initload"  :subid("12_1268929937.27567") :outer("11_1268929937.27567")
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
.sub "die"  :subid("13_1268929937.27567") :outer("11_1268929937.27567")
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
.sub "last"  :subid("14_1268929937.27567") :outer("11_1268929937.27567")
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
.sub "next"  :subid("15_1268929937.27567") :outer("11_1268929937.27567")
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
.sub "redo"  :subid("16_1268929937.27567") :outer("11_1268929937.27567")
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
.sub "super"  :subid("17_1268929937.27567") :outer("11_1268929937.27567")
    .param pmc param_61 :slurpy
    .param pmc param_62 :slurpy :named
# .annotate "line", 31
    .const 'Sub' $P89 = "18_1268929937.27567" 
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
    $P65 = root_new ['parrot';'ResizablePMCArray']
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
    .const 'Sub' $P89 = "18_1268929937.27567" 
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
.sub "_block88"  :anon :subid("18_1268929937.27567") :outer("17_1268929937.27567")
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
.sub "_block11"  :anon :subid("10_1268929869.18464")
# .annotate "line", 0
    get_hll_global $P14, ["Kakapo"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Kakapo"], "_block13" 
    capture_lex $P14
    $P90 = $P14()
# .annotate "line", 1
    .return ($P90)
.end


.namespace ["Kakapo"]
.sub "_block13"  :subid("11_1268929869.18464") :outer("10_1268929869.18464")
# .annotate "line", 7
    .const 'Sub' $P76 = "16_1268929869.18464" 
    capture_lex $P76
    .const 'Sub' $P72 = "15_1268929869.18464" 
    capture_lex $P72
    .const 'Sub' $P37 = "13_1268929869.18464" 
    capture_lex $P37
    .const 'Sub' $P15 = "12_1268929869.18464" 
    capture_lex $P15
# .annotate "line", 17
    .const 'Sub' $P15 = "12_1268929869.18464" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 33
    .const 'Sub' $P37 = "13_1268929869.18464" 
    capture_lex $P37
    .lex "call_preinit_subs", $P37
# .annotate "line", 51
    .const 'Sub' $P72 = "15_1268929869.18464" 
    capture_lex $P72
    .lex "is_loaded", $P72
# .annotate "line", 55
    .const 'Sub' $P76 = "16_1268929869.18464" 
    capture_lex $P76
    .lex "ident", $P76
# .annotate "line", 7
    find_lex $P82, "_pre_initload"
    find_lex $P83, "call_preinit_subs"
    find_lex $P84, "is_loaded"
    find_lex $P85, "ident"
    .return ($P85)
.end


.namespace ["Kakapo"]
.sub "" :load :init :subid("post17") :outer("11_1268929869.18464")
# .annotate "line", 7
    get_hll_global $P14, ["Kakapo"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 8
    get_hll_global $P87, ["Opcode"], "isnull"
    get_hll_global $P88, ["Kakapo";"krt0"], "main"
    $P89 = $P87($P88)
    unless $P89, if_86_end
  if_86_end:
.end


.namespace ["Kakapo"]
.sub "_pre_initload"  :subid("12_1268929869.18464") :outer("11_1268929869.18464")
# .annotate "line", 17
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 19
    get_global $P18, "$_Pre_initload_done"
    unless_null $P18, vivify_18
    new $P18, "Undef"
    set_global "$_Pre_initload_done", $P18
  vivify_18:
    get_global $P20, "$_Pre_initload_done"
    unless $P20, if_19_end
    new $P21, "Exception"
    set $P21['type'], 58
    new $P22, "Integer"
    assign $P22, 0
    setattribute $P21, 'payload', $P22
    throw $P21
  if_19_end:
# .annotate "line", 20
    new $P23, "Integer"
    assign $P23, 1
    set_global "$_Pre_initload_done", $P23
# .annotate "line", 22
    get_hll_global $P25, ["Opcode"], "defined"
    get_hll_global $P26, "say"
    $P27 = $P25($P26)
    if $P27, unless_24_end
# .annotate "line", 23
    get_hll_global $P28, ["Opcode"], "load_language"
    $P28("nqp")
  unless_24_end:
# .annotate "line", 26
    get_hll_global $P30, ["Opcode"], "defined"
    get_hll_global $P31, ["P6object"], "HOW"
    $P32 = $P30($P31)
    if $P32, unless_29_end
# .annotate "line", 27
    get_hll_global $P33, ["Opcode"], "load_bytecode"
    $P33("P6object.pbc")
  unless_29_end:
# .annotate "line", 30
    $P34 = "get_preinit_subs"()
    $P35 = "call_preinit_subs"($P34)
# .annotate "line", 17
    .return ($P35)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P36, exception, "payload"
    .return ($P36)
.end


.namespace ["Kakapo"]
.sub "call_preinit_subs"  :subid("13_1268929869.18464") :outer("11_1268929869.18464")
    .param pmc param_40
# .annotate "line", 33
    .const 'Sub' $P50 = "14_1268929869.18464" 
    capture_lex $P50
    new $P39, 'ExceptionHandler'
    set_addr $P39, control_38
    $P39."handle_types"(58)
    push_eh $P39
    .lex "@list", param_40
# .annotate "line", 35
    new $P41, "Undef"
    .lex "$nsp", $P41
# .annotate "line", 36
    new $P42, "Undef"
    .lex "&sub", $P42
# .annotate "line", 33
    find_lex $P43, "$nsp"
    find_lex $P44, "&sub"
# .annotate "line", 38
    find_lex $P46, "@list"
    defined $I47, $P46
    unless $I47, for_undef_19
    iter $P45, $P46
    new $P69, 'ExceptionHandler'
    set_addr $P69, loop68_handler
    $P69."handle_types"(65, 67, 66)
    push_eh $P69
  loop68_test:
    unless $P45, loop68_done
    shift $P48, $P45
  loop68_redo:
    .const 'Sub' $P50 = "14_1268929869.18464" 
    capture_lex $P50
    $P50($P48)
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
  for_undef_19:
# .annotate "line", 33
    .return ($P45)
  control_38:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P71, exception, "payload"
    .return ($P71)
.end


.namespace ["Kakapo"]
.sub "_block49"  :anon :subid("14_1268929869.18464") :outer("13_1268929869.18464")
    .param pmc param_51
# .annotate "line", 38
    .lex "$_", param_51
# .annotate "line", 39
    find_lex $P52, "$_"
    set $S53, $P52
    split $P54, "::", $S53
    get_hll_namespace $P55, $P54
    store_lex "$nsp", $P55
# .annotate "line", 40
    find_lex $P56, "$nsp"
    $P57 = $P56."find_sub"("_pre_initload")
    store_lex "&sub", $P57
# .annotate "line", 42
    find_lex $P60, "&sub"
    isnull $I61, $P60
    if $I61, if_59
# .annotate "line", 46
    find_lex $P66, "&sub"
    $P67 = $P66()
# .annotate "line", 45
    set $P58, $P67
# .annotate "line", 42
    goto if_59_end
  if_59:
# .annotate "line", 43
    new $P62, 'String'
    set $P62, "*** WARNING: No _pre_initload sub found for namespace "
    find_lex $P63, "$_"
    concat $P64, $P62, $P63
    $P65 = "say"($P64)
# .annotate "line", 42
    set $P58, $P65
  if_59_end:
# .annotate "line", 38
    .return ($P58)
.end


.namespace ["Kakapo"]
.sub "is_loaded"  :subid("15_1268929869.18464") :outer("11_1268929869.18464")
# .annotate "line", 51
    new $P74, 'ExceptionHandler'
    set_addr $P74, control_73
    $P74."handle_types"(58)
    push_eh $P74
    .return (1)
  control_73:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P75, exception, "payload"
    .return ($P75)
.end


.namespace ["Kakapo"]
.sub "ident"  :subid("16_1268929869.18464") :outer("11_1268929869.18464")
# .annotate "line", 55
    new $P78, 'ExceptionHandler'
    set_addr $P78, control_77
    $P78."handle_types"(58)
    push_eh $P78
# .annotate "line", 56
    get_global $P79, "$_Ident"
    unless_null $P79, vivify_20
    new $P79, "Undef"
    set_global "$_Ident", $P79
  vivify_20:
    new $P80, "String"
    assign $P80, "Git blob $Id: a2095affbbadab41f4c6969f48c705b465e5abfa $"
    set_global "$_Ident", $P80
# .annotate "line", 55
    .return ($P80)
  control_77:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P81, exception, "payload"
    .return ($P81)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929927.49552")
# .annotate "line", 0
    get_hll_global $P14, ["Parrot"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["Parrot"], "_block13" 
    capture_lex $P14
    $P125 = $P14()
# .annotate "line", 1
    .return ($P125)
.end


.namespace ["Parrot"]
.sub "_block13"  :subid("11_1268929927.49552") :outer("10_1268929927.49552")
# .annotate "line", 6
    get_hll_global $P16, ["Parrot";"Unix";"Stat"], "_block15" 
    capture_lex $P16
# .annotate "line", 139
    get_hll_global $P16, ["Parrot";"Unix";"Stat"], "_block15" 
    capture_lex $P16
    $P124 = $P16()
# .annotate "line", 6
    .return ($P124)
.end


.namespace ["Parrot"]
.sub "" :load :init :subid("post20") :outer("11_1268929927.49552")
# .annotate "line", 6
    get_hll_global $P14, ["Parrot"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 7
    "macro_const"(0 :named("DATATYPE_UNDEF"), -100 :named("DATATYPE_INTVAL"), -99 :named("DATATYPE_FLOATVAL"), -98 :named("DATATYPE_STRING"), -97 :named("DATATYPE_PMC"), -96 :named("DATATYPE_BIGINT"), -95 :named("DATATYPE_DPOINTER"), -94 :named("DATATYPE_CHAR"), -93 :named("DATATYPE_SHORT"), -92 :named("DATATYPE_INT"), -91 :named("DATATYPE_LONG"), -90 :named("DATATYPE_LONGLONG"), -89 :named("DATATYPE_UCHAR"), -88 :named("DATATYPE_USHORT"), -87 :named("DATATYPE_UINT"), -86 :named("DATATYPE_ULONG"), -85 :named("DATATYPE_ULONGLONG"), -84 :named("DATATYPE_FLOAT"), -83 :named("DATATYPE_DOUBLE"), -82 :named("DATATYPE_LONGDOUBLE"), -81 :named("DATATYPE_BIT"), -81 :named("DATATYPE_INT1"), -80 :named("DATATYPE_INT4"), -79 :named("DATATYPE_INT8"), -78 :named("DATATYPE_INT16"), -77 :named("DATATYPE_INT32"), -76 :named("DATATYPE_INT64"), -75 :named("DATATYPE_UINT8"), -74 :named("DATATYPE_UINT16"), -73 :named("DATATYPE_UINT32"), -72 :named("DATATYPE_UINT64"), -71 :named("DATATYPE_PTR"), -70 :named("DATATYPE_CSTR"), -69 :named("DATATYPE_STRUCT_PTR"), -68 :named("DATATYPE_STRUCT"), -67 :named("DATATYPE_FUNC_PTR"), -66 :named("DATATYPE_SIZED"))
# .annotate "line", 47
    "macro_const"(0 :named("PMCTYPE_default"), 1 :named("PMCTYPE_Null"), 2 :named("PMCTYPE_Env"), 3 :named("PMCTYPE_Key"), 4 :named("PMCTYPE_UnManagedStruct"), 5 :named("PMCTYPE_ManagedStruct"), 6 :named("PMCTYPE_Exception"), 7 :named("PMCTYPE_ParrotLibrary"), 8 :named("PMCTYPE_ParrotInterpreter"), 9 :named("PMCTYPE_ParrotThread"), 10 :named("PMCTYPE_LexPad"), 11 :named("PMCTYPE_Pointer"), 12 :named("PMCTYPE_Sub"), 13 :named("PMCTYPE_Coroutine"), 14 :named("PMCTYPE_Eval"), 15 :named("PMCTYPE_EventHandler"), 16 :named("PMCTYPE_Continuation"), 17 :named("PMCTYPE_RetContinuation"), 18 :named("PMCTYPE_ExceptionHandler"), 19 :named("PMCTYPE_NCI"), 20 :named("PMCTYPE_BigInt"), 21 :named("PMCTYPE_BigNum"), 22 :named("PMCTYPE_Complex"), 23 :named("PMCTYPE_FixedIntegerArray"), 24 :named("PMCTYPE_ResizableIntegerArray"), 25 :named("PMCTYPE_Iterator"), 26 :named("PMCTYPE_ArrayIterator"), 27 :named("PMCTYPE_HashIterator"), 28 :named("PMCTYPE_OrderedHashIterator"), 29 :named("PMCTYPE_StringIterator"), 30 :named("PMCTYPE_FixedStringArray"), 31 :named("PMCTYPE_ResizableStringArray"), 32 :named("PMCTYPE_Hash"), 33 :named("PMCTYPE_AddrRegistry"), 34 :named("PMCTYPE_LexInfo"), 35 :named("PMCTYPE_NameSpace"), 36 :named("PMCTYPE_OrderedHash"), 37 :named("PMCTYPE_OS"), 38 :named("PMCTYPE_File"), 39 :named("PMCTYPE_OpLib"), 40 :named("PMCTYPE_Opcode"), 41 :named("PMCTYPE_CallContext"), 42 :named("PMCTYPE_Capture"), 43 :named("PMCTYPE_Class"), 44 :named("PMCTYPE_PMCProxy"), 45 :named("PMCTYPE_CPointer"), 46 :named("PMCTYPE_Exporter"), 47 :named("PMCTYPE_FixedBooleanArray"), 48 :named("PMCTYPE_ResizableBooleanArray"), 49 :named("PMCTYPE_FixedFloatArray"), 50 :named("PMCTYPE_ResizableFloatArray"), 51 :named("PMCTYPE_FixedPMCArray"), 52 :named("PMCTYPE_ResizablePMCArray"), 53 :named("PMCTYPE_MultiSub"), 54 :named("PMCTYPE_Handle"), 55 :named("PMCTYPE_FileHandle"), 56 :named("PMCTYPE_Socket"), 57 :named("PMCTYPE_StringHandle"), 58 :named("PMCTYPE_HashIteratorKey"), 59 :named("PMCTYPE_ImageIO"), 60 :named("PMCTYPE_ImageIOSize"), 61 :named("PMCTYPE_Object"), 62 :named("PMCTYPE_Packfile"), 63 :named("PMCTYPE_PackfileAnnotation"), 64 :named("PMCTYPE_PackfileFixupEntry"), 65 :named("PMCTYPE_PackfileSegment"), 66 :named("PMCTYPE_PackfileAnnotations"), 67 :named("PMCTYPE_PackfileConstantTable"), 68 :named("PMCTYPE_PackfileDirectory"), 69 :named("PMCTYPE_PackfileFixupTable"), 70 :named("PMCTYPE_PackfileRawSegment"), 71 :named("PMCTYPE_ParrotRunningThread"), 72 :named("PMCTYPE_Role"), 73 :named("PMCTYPE_scalar"), 74 :named("PMCTYPE_Float"), 75 :named("PMCTYPE_Integer"), 76 :named("PMCTYPE_Boolean"), 77 :named("PMCTYPE_String"), 78 :named("PMCTYPE_CodeString"), 79 :named("PMCTYPE_Scheduler"), 80 :named("PMCTYPE_SchedulerMessage"), 81 :named("PMCTYPE_Sockaddr"), 82 :named("PMCTYPE_Task"), 83 :named("PMCTYPE_Timer"), 84 :named("PMCTYPE_Undef"), 85 :named("PMCTYPE_core_max"))
.end


.namespace ["Parrot";"Unix";"Stat"]
.sub "_block15"  :subid("12_1268929927.49552") :outer("11_1268929927.49552")
# .annotate "line", 139
    .const 'Sub' $P101 = "19_1268929927.49552" 
    capture_lex $P101
    .const 'Sub' $P87 = "18_1268929927.49552" 
    capture_lex $P87
    .const 'Sub' $P73 = "17_1268929927.49552" 
    capture_lex $P73
    .const 'Sub' $P59 = "16_1268929927.49552" 
    capture_lex $P59
    .const 'Sub' $P45 = "15_1268929927.49552" 
    capture_lex $P45
    .const 'Sub' $P31 = "14_1268929927.49552" 
    capture_lex $P31
    .const 'Sub' $P17 = "13_1268929927.49552" 
    capture_lex $P17
# .annotate "line", 180
    .const 'Sub' $P17 = "13_1268929927.49552" 
    capture_lex $P17
    .lex "S_ISBLK", $P17
# .annotate "line", 181
    .const 'Sub' $P31 = "14_1268929927.49552" 
    capture_lex $P31
    .lex "S_ISCHR", $P31
# .annotate "line", 182
    .const 'Sub' $P45 = "15_1268929927.49552" 
    capture_lex $P45
    .lex "S_ISDIR", $P45
# .annotate "line", 183
    .const 'Sub' $P59 = "16_1268929927.49552" 
    capture_lex $P59
    .lex "S_ISFIFO", $P59
# .annotate "line", 184
    .const 'Sub' $P73 = "17_1268929927.49552" 
    capture_lex $P73
    .lex "S_ISLNK", $P73
# .annotate "line", 185
    .const 'Sub' $P87 = "18_1268929927.49552" 
    capture_lex $P87
    .lex "S_ISREG", $P87
# .annotate "line", 186
    .const 'Sub' $P101 = "19_1268929927.49552" 
    capture_lex $P101
    .lex "S_ISSOCK", $P101
# .annotate "line", 139
    find_lex $P115, "S_ISBLK"
    find_lex $P116, "S_ISCHR"
    find_lex $P117, "S_ISDIR"
    find_lex $P118, "S_ISFIFO"
    find_lex $P119, "S_ISLNK"
    find_lex $P120, "S_ISREG"
    find_lex $P121, "S_ISSOCK"
    .return ($P121)
.end


.namespace ["Parrot";"Unix";"Stat"]
.sub "" :load :init :subid("post21") :outer("12_1268929927.49552")
# .annotate "line", 139
    get_hll_global $P16, ["Parrot";"Unix";"Stat"], "_block15" 
    .local pmc block
    set block, $P16
# .annotate "line", 140
    get_hll_global $P122, ["Parrot"], "macro_const"
    $P122(61440 :named("S_IFMT"), 49152 :named("S_IFSOCK"), 40960 :named("S_IFLNK"), 32768 :named("S_IFREG"), 24576 :named("S_IFBLK"), 16384 :named("S_IFDIR"), 8192 :named("S_IFCHR"), 4096 :named("S_IFIFO"), 2048 :named("S_ISUID"), 1024 :named("S_ISGID"), 512 :named("S_ISVTX"), 448 :named("S_IRWXU"), 256 :named("S_IRUSR"), 128 :named("S_IWUSR"), 64 :named("S_IXUSR"), 56 :named("S_IRWXG"), 32 :named("S_IRGRP"), 16 :named("S_IWGRP"), 8 :named("S_IXGRP"), 56 :named("S_IRWXO"), 4 :named("S_IROTH"), 2 :named("S_IWOTH"), 1 :named("S_IXOTH"))
# .annotate "line", 169
    new $P123, "ResizablePMCArray"
    push $P123, "S_ISBLK"
    push $P123, "S_ISCHR"
    push $P123, "S_ISDIR"
    push $P123, "S_ISFIFO"
    push $P123, "S_ISLNK"
    push $P123, "S_ISREG"
    push $P123, "S_ISSOCK"
    "export"($P123)
.end


.namespace ["Parrot";"Unix";"Stat"]
.sub "S_ISBLK"  :subid("13_1268929927.49552") :outer("12_1268929927.49552")
    .param pmc param_20
# .annotate "line", 180
    new $P19, 'ExceptionHandler'
    set_addr $P19, control_18
    $P19."handle_types"(58)
    push_eh $P19
    .lex "$mode", param_20
    find_lex $P21, "$mode"
    set $I22, $P21
    get_hll_global $P23, ["Parrot";"Unix";"Stat"], "S_IFMT"
    set $I24, $P23
    band $I25, $I22, $I24
    set $N26, $I25
    get_hll_global $P27, ["Parrot";"Unix";"Stat"], "S_IFBLK"
    set $N28, $P27
    iseq $I29, $N26, $N28
    .return ($I29)
  control_18:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P30, exception, "payload"
    .return ($P30)
.end


.namespace ["Parrot";"Unix";"Stat"]
.sub "S_ISCHR"  :subid("14_1268929927.49552") :outer("12_1268929927.49552")
    .param pmc param_34
# .annotate "line", 181
    new $P33, 'ExceptionHandler'
    set_addr $P33, control_32
    $P33."handle_types"(58)
    push_eh $P33
    .lex "$mode", param_34
    find_lex $P35, "$mode"
    set $I36, $P35
    get_hll_global $P37, ["Parrot";"Unix";"Stat"], "S_IFMT"
    set $I38, $P37
    band $I39, $I36, $I38
    set $N40, $I39
    get_hll_global $P41, ["Parrot";"Unix";"Stat"], "S_IFCHR"
    set $N42, $P41
    iseq $I43, $N40, $N42
    .return ($I43)
  control_32:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P44, exception, "payload"
    .return ($P44)
.end


.namespace ["Parrot";"Unix";"Stat"]
.sub "S_ISDIR"  :subid("15_1268929927.49552") :outer("12_1268929927.49552")
    .param pmc param_48
# .annotate "line", 182
    new $P47, 'ExceptionHandler'
    set_addr $P47, control_46
    $P47."handle_types"(58)
    push_eh $P47
    .lex "$mode", param_48
    find_lex $P49, "$mode"
    set $I50, $P49
    get_hll_global $P51, ["Parrot";"Unix";"Stat"], "S_IFMT"
    set $I52, $P51
    band $I53, $I50, $I52
    set $N54, $I53
    get_hll_global $P55, ["Parrot";"Unix";"Stat"], "S_IFDIR"
    set $N56, $P55
    iseq $I57, $N54, $N56
    .return ($I57)
  control_46:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P58, exception, "payload"
    .return ($P58)
.end


.namespace ["Parrot";"Unix";"Stat"]
.sub "S_ISFIFO"  :subid("16_1268929927.49552") :outer("12_1268929927.49552")
    .param pmc param_62
# .annotate "line", 183
    new $P61, 'ExceptionHandler'
    set_addr $P61, control_60
    $P61."handle_types"(58)
    push_eh $P61
    .lex "$mode", param_62
    find_lex $P63, "$mode"
    set $I64, $P63
    get_hll_global $P65, ["Parrot";"Unix";"Stat"], "S_IFMT"
    set $I66, $P65
    band $I67, $I64, $I66
    set $N68, $I67
    get_hll_global $P69, ["Parrot";"Unix";"Stat"], "S_IFFIFO"
    set $N70, $P69
    iseq $I71, $N68, $N70
    .return ($I71)
  control_60:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P72, exception, "payload"
    .return ($P72)
.end


.namespace ["Parrot";"Unix";"Stat"]
.sub "S_ISLNK"  :subid("17_1268929927.49552") :outer("12_1268929927.49552")
    .param pmc param_76
# .annotate "line", 184
    new $P75, 'ExceptionHandler'
    set_addr $P75, control_74
    $P75."handle_types"(58)
    push_eh $P75
    .lex "$mode", param_76
    find_lex $P77, "$mode"
    set $I78, $P77
    get_hll_global $P79, ["Parrot";"Unix";"Stat"], "S_IFMT"
    set $I80, $P79
    band $I81, $I78, $I80
    set $N82, $I81
    get_hll_global $P83, ["Parrot";"Unix";"Stat"], "S_IFLNK"
    set $N84, $P83
    iseq $I85, $N82, $N84
    .return ($I85)
  control_74:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P86, exception, "payload"
    .return ($P86)
.end


.namespace ["Parrot";"Unix";"Stat"]
.sub "S_ISREG"  :subid("18_1268929927.49552") :outer("12_1268929927.49552")
    .param pmc param_90
# .annotate "line", 185
    new $P89, 'ExceptionHandler'
    set_addr $P89, control_88
    $P89."handle_types"(58)
    push_eh $P89
    .lex "$mode", param_90
    find_lex $P91, "$mode"
    set $I92, $P91
    get_hll_global $P93, ["Parrot";"Unix";"Stat"], "S_IFMT"
    set $I94, $P93
    band $I95, $I92, $I94
    set $N96, $I95
    get_hll_global $P97, ["Parrot";"Unix";"Stat"], "S_IFREG"
    set $N98, $P97
    iseq $I99, $N96, $N98
    .return ($I99)
  control_88:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["Parrot";"Unix";"Stat"]
.sub "S_ISSOCK"  :subid("19_1268929927.49552") :outer("12_1268929927.49552")
    .param pmc param_104
# .annotate "line", 186
    new $P103, 'ExceptionHandler'
    set_addr $P103, control_102
    $P103."handle_types"(58)
    push_eh $P103
    .lex "$mode", param_104
    find_lex $P105, "$mode"
    set $I106, $P105
    get_hll_global $P107, ["Parrot";"Unix";"Stat"], "S_IFMT"
    set $I108, $P107
    band $I109, $I106, $I108
    set $N110, $I109
    get_hll_global $P111, ["Parrot";"Unix";"Stat"], "S_IFSOCK"
    set $N112, $P111
    iseq $I113, $N110, $N112
    .return ($I113)
  control_102:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929839.13419")
# .annotate "line", 0
    get_hll_global $P14, ["Parrot"], "_block13" 
    capture_lex $P14
# .annotate "line", 10
    get_hll_global $P14, ["Parrot"], "_block13" 
    capture_lex $P14
    $P281 = $P14()
# .annotate "line", 1
    .return ($P281)
.end


.namespace ["Parrot"]
.sub "_block13"  :subid("11_1268929839.13419") :outer("10_1268929839.13419")
# .annotate "line", 10
    .const 'Sub' $P200 = "20_1268929839.13419" 
    capture_lex $P200
    .const 'Sub' $P158 = "19_1268929839.13419" 
    capture_lex $P158
    .const 'Sub' $P137 = "17_1268929839.13419" 
    capture_lex $P137
    .const 'Sub' $P15 = "12_1268929839.13419" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929839.13419" 
    capture_lex $P15
    .lex "define_multisub", $P15
# .annotate "line", 62
    .const 'Sub' $P137 = "17_1268929839.13419" 
    capture_lex $P137
    .lex "parse_multisig", $P137
# .annotate "line", 68
    .const 'Sub' $P158 = "19_1268929839.13419" 
    capture_lex $P158
    .lex "trampoline", $P158
# .annotate "line", 91
    .const 'Sub' $P200 = "20_1268929839.13419" 
    capture_lex $P200
    .lex "trampoline_default", $P200
# .annotate "line", 10
    find_lex $P277, "define_multisub"
    find_lex $P278, "parse_multisig"
    find_lex $P279, "trampoline"
    find_lex $P280, "trampoline_default"
    .return ($P280)
.end


.namespace ["Parrot"]
.sub "define_multisub"  :subid("12_1268929839.13419") :outer("11_1268929839.13419")
    .param pmc param_18
    .param pmc param_19 :optional
    .param int has_param_19 :opt_flag
    .param pmc param_21 :optional :named("method")
    .param int has_param_21 :opt_flag
    .param pmc param_23 :optional :named("namespace")
    .param int has_param_23 :opt_flag
    .param pmc param_25 :optional :named("signatures")
    .param int has_param_25 :opt_flag
    .param pmc param_27 :optional :named("starting_with")
    .param int has_param_27 :opt_flag
# .annotate "line", 10
    .const 'Sub' $P103 = "16_1268929839.13419" 
    capture_lex $P103
    .const 'Sub' $P85 = "15_1268929839.13419" 
    capture_lex $P85
    .const 'Sub' $P44 = "13_1268929839.13419" 
    capture_lex $P44
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "$name", param_18
    if has_param_19, optparam_21
    $P20 = root_new ['parrot';'ResizablePMCArray']
    set param_19, $P20
  optparam_21:
    .lex "@subs", param_19
    if has_param_21, optparam_22
    new $P22, "Undef"
    set param_21, $P22
  optparam_22:
    .lex "$method", param_21
    if has_param_23, optparam_23
    $P24 = "caller_namespace"()
    set param_23, $P24
  optparam_23:
    .lex "$namespace", param_23
    if has_param_25, optparam_24
    $P26 = root_new ['parrot';'ResizablePMCArray']
    set param_25, $P26
  optparam_24:
    .lex "@signatures", param_25
    if has_param_27, optparam_25
    new $P28, "Undef"
    set param_27, $P28
  optparam_25:
    .lex "$starting_with", param_27
# .annotate "line", 38
    $P29 = root_new ['parrot';'ResizablePMCArray']
    .lex "@adverbs", $P29
# .annotate "line", 39
    new $P30, "Undef"
    .lex "$index", $P30
# .annotate "line", 12
    find_lex $P32, "$namespace"
    $P33 = $P32."isa"("String")
    unless $P33, if_31_end
# .annotate "line", 11
    find_lex $P34, "$namespace"
    $P35 = "get_hll_namespace"($P34)
    store_lex "$namespace", $P35
  if_31_end:
# .annotate "line", 14
    find_lex $P37, "$namespace"
    $P38 = $P37."isa"("P6protoobject")
    unless $P38, if_36_end
# .annotate "line", 13
    find_lex $P39, "$namespace"
    $P40 = $P39."WHO"()
    store_lex "$namespace", $P40
  if_36_end:
# .annotate "line", 16
    find_lex $P42, "@subs"
    if $P42, unless_41_end
    .const 'Sub' $P44 = "13_1268929839.13419" 
    capture_lex $P44
    $P44()
  unless_41_end:
# .annotate "line", 28
    find_lex $P75, "@signatures"
    if $P75, if_74
    set $P73, $P75
    goto if_74_end
  if_74:
    find_lex $P76, "@signatures"
    $N77 = $P76."elems"()
    find_lex $P78, "@subs"
    $N79 = $P78."elems"()
    isne $I80, $N77, $N79
    new $P73, 'Integer'
    set $P73, $I80
  if_74_end:
    unless $P73, if_72_end
# .annotate "line", 27
    "die"("@signatures must have same #elements as @subs, if provided")
  if_72_end:
# .annotate "line", 30
    find_lex $P82, "@signatures"
    if $P82, unless_81_end
# .annotate "line", 31
    find_lex $P83, "@subs"
    .const 'Sub' $P85 = "15_1268929839.13419" 
    capture_lex $P85
    $P95 = $P83."map"($P85)
    store_lex "@signatures", $P95
  unless_81_end:
# .annotate "line", 30
    find_lex $P96, "@adverbs"
# .annotate "line", 39
    new $P97, "Integer"
    assign $P97, 0
    store_lex "$index", $P97
# .annotate "line", 41
    find_lex $P99, "@subs"
    defined $I100, $P99
    unless $I100, for_undef_27
    iter $P98, $P99
    new $P134, 'ExceptionHandler'
    set_addr $P134, loop133_handler
    $P134."handle_types"(65, 67, 66)
    push_eh $P134
  loop133_test:
    unless $P98, loop133_done
    shift $P101, $P98
  loop133_redo:
    .const 'Sub' $P103 = "16_1268929839.13419" 
    capture_lex $P103
    $P103($P101)
  loop133_next:
    goto loop133_test
  loop133_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P135, exception, 'type'
    eq $P135, 65, loop133_next
    eq $P135, 67, loop133_redo
  loop133_done:
    pop_eh 
  for_undef_27:
# .annotate "line", 10
    .return ($P98)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P136, exception, "payload"
    .return ($P136)
.end


.namespace ["Parrot"]
.sub "_block43"  :anon :subid("13_1268929839.13419") :outer("12_1268929839.13419")
# .annotate "line", 16
    .const 'Sub' $P56 = "14_1268929839.13419" 
    capture_lex $P56
# .annotate "line", 20
    new $P45, "Undef"
    .lex "$len", $P45
# .annotate "line", 17
    find_lex $P47, "$starting_with"
    if $P47, unless_46_end
    "die"("You must provide either @subs or a :starting_with prefix")
  unless_46_end:
# .annotate "line", 20
    find_lex $P48, "$starting_with"
    $P49 = $P48."length"()
    store_lex "$len", $P49
# .annotate "line", 21
    find_lex $P51, "$namespace"
    $P52 = $P51."keys"()
    defined $I53, $P52
    unless $I53, for_undef_26
    iter $P50, $P52
    new $P70, 'ExceptionHandler'
    set_addr $P70, loop69_handler
    $P70."handle_types"(65, 67, 66)
    push_eh $P70
  loop69_test:
    unless $P50, loop69_done
    shift $P54, $P50
  loop69_redo:
    .const 'Sub' $P56 = "14_1268929839.13419" 
    capture_lex $P56
    $P56($P54)
  loop69_next:
    goto loop69_test
  loop69_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P71, exception, 'type'
    eq $P71, 65, loop69_next
    eq $P71, 67, loop69_redo
  loop69_done:
    pop_eh 
  for_undef_26:
# .annotate "line", 16
    .return ($P50)
.end


.namespace ["Parrot"]
.sub "_block55"  :anon :subid("14_1268929839.13419") :outer("13_1268929839.13419")
    .param pmc param_57
# .annotate "line", 21
    .lex "$sub", param_57
# .annotate "line", 23
    find_lex $P60, "$sub"
    find_lex $P61, "$len"
    $S62 = $P60."substr"(0, $P61)
    find_lex $P63, "$starting_with"
    set $S64, $P63
    iseq $I65, $S62, $S64
    if $I65, if_59
    new $P58, 'Integer'
    set $P58, $I65
    goto if_59_end
  if_59:
# .annotate "line", 22
    find_lex $P66, "@subs"
    find_lex $P67, "$sub"
    $P68 = $P66."push"($P67)
    set $P58, $P68
  if_59_end:
# .annotate "line", 21
    .return ($P58)
.end


.namespace ["Parrot"]
.sub "_block84"  :anon :subid("15_1268929839.13419") :outer("12_1268929839.13419")
    .param pmc param_86
# .annotate "line", 31
    .lex "$name", param_86
# .annotate "line", 32
    $P87 = root_new ['parrot';'ResizablePMCArray']
    .lex "@sig", $P87
    find_lex $P88, "$name"
    set $S89, $P88
    $P90 = "parse_multisig"($S89)
    store_lex "@sig", $P90
# .annotate "line", 33
    find_lex $P92, "$method"
    unless $P92, if_91_end
    find_lex $P93, "@sig"
    $P93."unshift"("_")
  if_91_end:
    find_lex $P94, "@sig"
# .annotate "line", 31
    .return ($P94)
.end


.namespace ["Parrot"]
.sub "_block102"  :anon :subid("16_1268929839.13419") :outer("12_1268929839.13419")
    .param pmc param_104
# .annotate "line", 41
    .lex "$sub", param_104
# .annotate "line", 51
    new $P105, "Undef"
    .lex "$source", $P105
# .annotate "line", 43
    find_lex $P107, "$sub"
    $P108 = "is_null"($P107)
    unless $P108, if_106_end
# .annotate "line", 42
    "die"("Null sub in call to define_multisub")
  if_106_end:
# .annotate "line", 45
    new $P109, 'String'
    set $P109, ":multi("
    find_lex $P110, "$index"
    set $I111, $P110
    find_lex $P112, "@signatures"
    unless_null $P112, vivify_28
    $P112 = root_new ['parrot';'ResizablePMCArray']
  vivify_28:
    set $P113, $P112[$I111]
    unless_null $P113, vivify_29
    new $P113, "Undef"
  vivify_29:
    $P114 = $P113."join"(", ")
    set $S115, $P114
    concat $P116, $P109, $S115
    concat $P117, $P116, ")"
    new $P118, "ResizablePMCArray"
    push $P118, $P117
    store_lex "@adverbs", $P118
# .annotate "line", 46
    find_lex $P120, "$method"
    unless $P120, if_119_end
    find_lex $P121, "@adverbs"
    $P121."unshift"(":method")
  if_119_end:
    find_lex $P122, "$index"
    clone $P123, $P122
    inc $P122
# .annotate "line", 51
    find_lex $P124, "$name"
    find_lex $P125, "@adverbs"
    find_lex $P126, "$method"
    find_lex $P127, "$namespace"
    find_lex $P128, "$sub"
    $P129 = "trampoline"($P124, $P125 :named("adverbs"), $P126 :named("method"), $P127 :named("namespace"), $P128 :named("target"))
    store_lex "$source", $P129
# .annotate "line", 58
    get_hll_global $P130, ["Pir"], "compile"
    find_lex $P131, "$source"
    $P132 = $P130($P131)
# .annotate "line", 41
    .return ($P132)
.end


.namespace ["Parrot"]
.sub "parse_multisig"  :subid("17_1268929839.13419") :outer("11_1268929839.13419")
    .param pmc param_140
# .annotate "line", 62
    .const 'Sub' $P147 = "18_1268929839.13419" 
    capture_lex $P147
    new $P139, 'ExceptionHandler'
    set_addr $P139, control_138
    $P139."handle_types"(58)
    push_eh $P139
    .lex "$name", param_140
# .annotate "line", 63
    $P141 = root_new ['parrot';'ResizablePMCArray']
    .lex "@sig", $P141
    find_lex $P142, "$name"
    $P143 = $P142."split"("__")
    store_lex "@sig", $P143
# .annotate "line", 64
    find_lex $P144, "@sig"
    $P144."shift"()
# .annotate "line", 65
    find_lex $P145, "@sig"
    .const 'Sub' $P147 = "18_1268929839.13419" 
    capture_lex $P147
    $P156 = $P145."map"($P147)
    store_lex "@sig", $P156
# .annotate "line", 62
    .return ($P156)
  control_138:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P157, exception, "payload"
    .return ($P157)
.end


.namespace ["Parrot"]
.sub "_block146"  :anon :subid("18_1268929839.13419") :outer("17_1268929839.13419")
    .param pmc param_148
# .annotate "line", 65
    .lex "$sig", param_148
    find_lex $P151, "$sig"
    set $S152, $P151
    iseq $I153, $S152, "ANY"
    if $I153, if_150
    find_lex $P155, "$sig"
    set $P149, $P155
    goto if_150_end
  if_150:
    new $P154, "String"
    assign $P154, "_"
    set $P149, $P154
  if_150_end:
    .return ($P149)
.end


.namespace ["Parrot"]
.sub "trampoline"  :subid("19_1268929839.13419") :outer("11_1268929839.13419")
    .param pmc param_161
    .param pmc param_162 :named("namespace")
    .param pmc param_169 :named("target")
    .param pmc param_163 :optional :named("adverbs")
    .param int has_param_163 :opt_flag
    .param pmc param_165 :optional :named("body")
    .param int has_param_165 :opt_flag
    .param pmc param_167 :optional :named("method")
    .param int has_param_167 :opt_flag
# .annotate "line", 68
    new $P160, 'ExceptionHandler'
    set_addr $P160, control_159
    $P160."handle_types"(58)
    push_eh $P160
    .lex "$name", param_161
    .lex "$namespace", param_162
    if has_param_163, optparam_30
    $P164 = root_new ['parrot';'ResizablePMCArray']
    set param_163, $P164
  optparam_30:
    .lex "@adverbs", param_163
    if has_param_165, optparam_31
    $P166 = root_new ['parrot';'ResizablePMCArray']
    set param_165, $P166
  optparam_31:
    .lex "@body", param_165
    if has_param_167, optparam_32
    new $P168, "Integer"
    assign $P168, 0
    set param_167, $P168
  optparam_32:
    .lex "$method", param_167
    .lex "$target", param_169
# .annotate "line", 78
    new $P170, "Undef"
    .lex "$pir_namespace", $P170
# .annotate "line", 79
    new $P171, "Undef"
    .lex "$sub_modifiers", $P171
# .annotate "line", 81
    new $P172, "Undef"
    .lex "$code", $P172
# .annotate "line", 70
    find_lex $P174, "@body"
    if $P174, unless_173_end
# .annotate "line", 71
    find_lex $P175, "$method"
    find_lex $P176, "$namespace"
    find_lex $P177, "$target"
    $P178 = "trampoline_default"($P175 :named("method"), $P176 :named("namespace"), $P177 :named("target"))
    store_lex "@body", $P178
  unless_173_end:
# .annotate "line", 78
    get_hll_global $P179, ["Pir"], "pir_namespace"
    find_lex $P180, "$namespace"
    $P181 = $P179($P180)
    store_lex "$pir_namespace", $P181
# .annotate "line", 79
    find_lex $P182, "@adverbs"
    $P183 = $P182."join"(" ")
    store_lex "$sub_modifiers", $P183
# .annotate "line", 81
    new $P184, 'String'
    set $P184, "\n.namespace "
    find_lex $P185, "$pir_namespace"
    concat $P186, $P184, $P185
    concat $P187, $P186, "\n.sub '"
    find_lex $P188, "$name"
    concat $P189, $P187, $P188
    concat $P190, $P189, "' "
    find_lex $P191, "$sub_modifiers"
    concat $P192, $P190, $P191
    concat $P193, $P192, "\n\t.param pmc pos   :slurpy\n\t.param pmc named :slurpy :named\n\t"
# .annotate "line", 86
    find_lex $P194, "@body"
    $P195 = $P194."join"("\n")
    set $S196, $P195
    concat $P197, $P193, $S196
# .annotate "line", 81
    concat $P198, $P197, "\n.end\n\t"
    store_lex "$code", $P198
# .annotate "line", 68
    .return ($P198)
  control_159:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P199, exception, "payload"
    .return ($P199)
.end


.namespace ["Parrot"]
.sub "trampoline_default"  :subid("20_1268929839.13419") :outer("11_1268929839.13419")
    .param pmc param_203 :named("method")
    .param pmc param_204 :named("namespace")
    .param pmc param_205 :named("target")
# .annotate "line", 91
    new $P202, 'ExceptionHandler'
    set_addr $P202, control_201
    $P202."handle_types"(58)
    push_eh $P202
    .lex "$method", param_203
    .lex "$namespace", param_204
    .lex "$target", param_205
# .annotate "line", 92
    new $P206, "Undef"
    .lex "$tailcall", $P206
# .annotate "line", 96
    $P207 = root_new ['parrot';'ResizablePMCArray']
    .lex "@nsp_parts", $P207
# .annotate "line", 97
    new $P208, "Undef"
    .lex "$target_nsp", $P208
# .annotate "line", 98
    new $P209, "Undef"
    .lex "$target_name", $P209
# .annotate "line", 116
    new $P210, "Undef"
    .lex "$body", $P210
# .annotate "line", 93
    find_lex $P213, "$method"
    if $P213, if_212
    new $P215, "String"
    assign $P215, ".tailcall "
    set $P211, $P215
    goto if_212_end
  if_212:
    new $P214, "String"
    assign $P214, ".tailcall self."
    set $P211, $P214
  if_212_end:
    store_lex "$tailcall", $P211
# .annotate "line", 92
    find_lex $P216, "@nsp_parts"
    find_lex $P217, "$target_nsp"
    find_lex $P218, "$target_name"
# .annotate "line", 100
    find_lex $P220, "$target"
    $P221 = $P220."isa"("String")
    if $P221, if_219
# .annotate "line", 107
    find_lex $P232, "$target"
    $P233 = $P232."isa"("Sub")
    if $P233, if_231
# .annotate "line", 112
    find_lex $P239, "$target"
    typeof $S240, $P239
    new $P241, 'String'
    set $P241, " "
    find_lex $P242, "$target"
    concat $P243, $P241, $P242
    "die"("Don't know how to build trampoline for ", $S240, $P243)
# .annotate "line", 111
    goto if_231_end
  if_231:
# .annotate "line", 108
    find_lex $P234, "$target"
    $P235 = $P234."get_namespace"()
    store_lex "$target_nsp", $P235
# .annotate "line", 109
    find_lex $P236, "$target"
    set $S237, $P236
    new $P238, 'String'
    set $P238, $S237
    store_lex "$target_name", $P238
  if_231_end:
# .annotate "line", 107
    goto if_219_end
  if_219:
# .annotate "line", 101
    find_lex $P222, "$target"
    $P223 = $P222."split"("::")
    store_lex "@nsp_parts", $P223
# .annotate "line", 102
    find_lex $P224, "@nsp_parts"
    $P225 = $P224."pop"()
    store_lex "$target_name", $P225
# .annotate "line", 103
    find_lex $P226, "@nsp_parts"
    $P227 = $P226."join"("::")
    store_lex "$target_nsp", $P227
# .annotate "line", 104
    find_lex $P229, "$target_nsp"
    if $P229, unless_228_end
    find_lex $P230, "$namespace"
    store_lex "$target_nsp", $P230
  unless_228_end:
  if_219_end:
# .annotate "line", 115
    get_hll_global $P244, ["Pir"], "pir_namespace"
    find_lex $P245, "$target_nsp"
    $P246 = $P244($P245)
    store_lex "$target_nsp", $P246
    find_lex $P247, "$body"
# .annotate "line", 118
    find_lex $P249, "$target_nsp"
    set $S250, $P249
    get_hll_global $P251, ["Pir"], "pir_namespace"
    find_lex $P252, "$namespace"
    $S253 = $P251($P252)
    isne $I254, $S250, $S253
    if $I254, if_248
# .annotate "line", 126
    new $P266, 'String'
    set $P266, "\n\t"
# .annotate "line", 127
    find_lex $P267, "$tailcall"
    set $S268, $P267
    concat $P269, $P266, $S268
# .annotate "line", 126
    concat $P270, $P269, "'"
    find_lex $P271, "$target_name"
    concat $P272, $P270, $P271
    concat $P273, $P272, "'(pos :flat, named :flat :named)\n\t\t"
    store_lex "$body", $P273
# .annotate "line", 125
    goto if_248_end
  if_248:
# .annotate "line", 119
    new $P255, 'String'
    set $P255, "\n\t.local pmc target_sub\n\ttarget_sub = get_hll_global "
    find_lex $P256, "$target_nsp"
    concat $P257, $P255, $P256
    concat $P258, $P257, ", '"
    find_lex $P259, "$target_name"
    concat $P260, $P258, $P259
    concat $P261, $P260, "'\n\t"
# .annotate "line", 122
    find_lex $P262, "$tailcall"
    set $S263, $P262
    concat $P264, $P261, $S263
# .annotate "line", 119
    concat $P265, $P264, "target_sub(pos :flat, named :flat :named)\n\t\t"
    store_lex "$body", $P265
  if_248_end:
# .annotate "line", 118
    find_lex $P274, "$body"
    new $P275, "ResizablePMCArray"
    push $P275, $P274
# .annotate "line", 91
    .return ($P275)
  control_201:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P276, exception, "payload"
    .return ($P276)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929915.54534")
# .annotate "line", 0
    get_hll_global $P14, ["Nqp"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["Nqp"], "_block13" 
    capture_lex $P14
    $P32 = $P14()
# .annotate "line", 1
    .return ($P32)
.end


.namespace ["Nqp"]
.sub "_block13"  :subid("11_1268929915.54534") :outer("10_1268929915.54534")
# .annotate "line", 6
    .const 'Sub' $P15 = "12_1268929915.54534" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929915.54534" 
    capture_lex $P15
    .lex "compile_file", $P15
    find_lex $P31, "compile_file"
    .return ($P31)
.end


.namespace ["Nqp"]
.sub "compile_file"  :subid("12_1268929915.54534") :outer("11_1268929915.54534")
    .param pmc param_18
# .annotate "line", 6
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "$name", param_18
# .annotate "line", 7
    new $P19, "Undef"
    .lex "$compiler", $P19
# .annotate "line", 8
    new $P20, "Undef"
    .lex "$code", $P20
# .annotate "line", 7
    new $P21, "String"
    assign $P21, "NQP-rx"
    set $S22, $P21
    compreg $P23, $S22
    store_lex "$compiler", $P23
# .annotate "line", 8
    find_dynamic_lex $P24, "$*FileSystem"
    unless_null $P24, vivify_13
    get_hll_global $P24, "$FileSystem"
    unless_null $P24, vivify_14
    die "Contextual $*FileSystem not found"
  vivify_14:
  vivify_13:
    find_lex $P25, "$name"
    $P26 = $P24."get_contents"($P25)
    store_lex "$code", $P26
# .annotate "line", 9
    find_lex $P27, "$compiler"
    find_lex $P28, "$code"
    $P29 = $P27."compile"($P28)
    store_lex "$code", $P29
# .annotate "line", 6
    .return ($P29)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P30, exception, "payload"
    .return ($P30)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929887.23492")
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
.sub "_block13"  :subid("11_1268929887.23492") :outer("10_1268929887.23492")
# .annotate "line", 9
    .const 'Sub' $P309 = "46_1268929887.23492" 
    capture_lex $P309
    .const 'Sub' $P283 = "45_1268929887.23492" 
    capture_lex $P283
    .const 'Sub' $P257 = "44_1268929887.23492" 
    capture_lex $P257
    .const 'Sub' $P250 = "43_1268929887.23492" 
    capture_lex $P250
    .const 'Sub' $P244 = "42_1268929887.23492" 
    capture_lex $P244
    .const 'Sub' $P235 = "41_1268929887.23492" 
    capture_lex $P235
    .const 'Sub' $P224 = "40_1268929887.23492" 
    capture_lex $P224
    .const 'Sub' $P217 = "39_1268929887.23492" 
    capture_lex $P217
    .const 'Sub' $P210 = "38_1268929887.23492" 
    capture_lex $P210
    .const 'Sub' $P203 = "37_1268929887.23492" 
    capture_lex $P203
    .const 'Sub' $P196 = "36_1268929887.23492" 
    capture_lex $P196
    .const 'Sub' $P186 = "35_1268929887.23492" 
    capture_lex $P186
    .const 'Sub' $P177 = "34_1268929887.23492" 
    capture_lex $P177
    .const 'Sub' $P167 = "33_1268929887.23492" 
    capture_lex $P167
    .const 'Sub' $P160 = "32_1268929887.23492" 
    capture_lex $P160
    .const 'Sub' $P150 = "31_1268929887.23492" 
    capture_lex $P150
    .const 'Sub' $P143 = "30_1268929887.23492" 
    capture_lex $P143
    .const 'Sub' $P136 = "29_1268929887.23492" 
    capture_lex $P136
    .const 'Sub' $P129 = "28_1268929887.23492" 
    capture_lex $P129
    .const 'Sub' $P124 = "27_1268929887.23492" 
    capture_lex $P124
    .const 'Sub' $P116 = "26_1268929887.23492" 
    capture_lex $P116
    .const 'Sub' $P109 = "25_1268929887.23492" 
    capture_lex $P109
    .const 'Sub' $P102 = "24_1268929887.23492" 
    capture_lex $P102
    .const 'Sub' $P92 = "23_1268929887.23492" 
    capture_lex $P92
    .const 'Sub' $P85 = "22_1268929887.23492" 
    capture_lex $P85
    .const 'Sub' $P78 = "21_1268929887.23492" 
    capture_lex $P78
    .const 'Sub' $P71 = "20_1268929887.23492" 
    capture_lex $P71
    .const 'Sub' $P61 = "19_1268929887.23492" 
    capture_lex $P61
    .const 'Sub' $P55 = "18_1268929887.23492" 
    capture_lex $P55
    .const 'Sub' $P48 = "17_1268929887.23492" 
    capture_lex $P48
    .const 'Sub' $P41 = "16_1268929887.23492" 
    capture_lex $P41
    .const 'Sub' $P34 = "15_1268929887.23492" 
    capture_lex $P34
    .const 'Sub' $P24 = "14_1268929887.23492" 
    capture_lex $P24
    .const 'Sub' $P20 = "13_1268929887.23492" 
    capture_lex $P20
    .const 'Sub' $P15 = "12_1268929887.23492" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929887.23492" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 15
    .const 'Sub' $P20 = "13_1268929887.23492" 
    capture_lex $P20
    .lex "backtrace", $P20
# .annotate "line", 16
    .const 'Sub' $P24 = "14_1268929887.23492" 
    capture_lex $P24
    .lex "can", $P24
# .annotate "line", 17
    .const 'Sub' $P34 = "15_1268929887.23492" 
    capture_lex $P34
    .lex "class", $P34
# .annotate "line", 18
    .const 'Sub' $P41 = "16_1268929887.23492" 
    capture_lex $P41
    .lex "clone", $P41
# .annotate "line", 19
    .const 'Sub' $P48 = "17_1268929887.23492" 
    capture_lex $P48
    .lex "defined", $P48
# .annotate "line", 22
    .const 'Sub' $P55 = "18_1268929887.23492" 
    capture_lex $P55
    .lex "delete", $P55
# .annotate "line", 30
    .const 'Sub' $P61 = "19_1268929887.23492" 
    capture_lex $P61
    .lex "does", $P61
# .annotate "line", 31
    .const 'Sub' $P71 = "20_1268929887.23492" 
    capture_lex $P71
    .lex "elements", $P71
# .annotate "line", 32
    .const 'Sub' $P78 = "21_1268929887.23492" 
    capture_lex $P78
    .lex "exit", $P78
# .annotate "line", 33
    .const 'Sub' $P85 = "22_1268929887.23492" 
    capture_lex $P85
    .lex "get_addr", $P85
# .annotate "line", 34
    .const 'Sub' $P92 = "23_1268929887.23492" 
    capture_lex $P92
    .lex "getattribute", $P92
# .annotate "line", 35
    .const 'Sub' $P102 = "24_1268929887.23492" 
    capture_lex $P102
    .lex "get_class", $P102
# .annotate "line", 36
    .const 'Sub' $P109 = "25_1268929887.23492" 
    capture_lex $P109
    .lex "get_integer", $P109
# .annotate "line", 37
    .const 'Sub' $P116 = "26_1268929887.23492" 
    capture_lex $P116
    .lex "get_global", $P116
# .annotate "line", 38
    .const 'Sub' $P124 = "27_1268929887.23492" 
    capture_lex $P124
    .lex "getinterp", $P124
# .annotate "line", 39
    .const 'Sub' $P129 = "28_1268929887.23492" 
    capture_lex $P129
    .lex "get_namespace", $P129
# .annotate "line", 40
    .const 'Sub' $P136 = "29_1268929887.23492" 
    capture_lex $P136
    .lex "get_root_namespace", $P136
# .annotate "line", 41
    .const 'Sub' $P143 = "30_1268929887.23492" 
    capture_lex $P143
    .lex "inspect", $P143
# .annotate "line", 42
    .const 'Sub' $P150 = "31_1268929887.23492" 
    capture_lex $P150
    .lex "inspect_string", $P150
# .annotate "line", 43
    .const 'Sub' $P160 = "32_1268929887.23492" 
    capture_lex $P160
    .lex "isnull", $P160
# .annotate "line", 44
    .const 'Sub' $P167 = "33_1268929887.23492" 
    capture_lex $P167
    .lex "isa", $P167
# .annotate "line", 45
    .const 'Sub' $P177 = "34_1268929887.23492" 
    capture_lex $P177
    .lex "iseq", $P177
# .annotate "line", 46
    .const 'Sub' $P186 = "35_1268929887.23492" 
    capture_lex $P186
    .lex "join", $P186
# .annotate "line", 47
    .const 'Sub' $P196 = "36_1268929887.23492" 
    capture_lex $P196
    .lex "load_bytecode", $P196
# .annotate "line", 48
    .const 'Sub' $P203 = "37_1268929887.23492" 
    capture_lex $P203
    .lex "load_language", $P203
# .annotate "line", 49
    .const 'Sub' $P210 = "38_1268929887.23492" 
    capture_lex $P210
    .lex "new", $P210
# .annotate "line", 50
    .const 'Sub' $P217 = "39_1268929887.23492" 
    capture_lex $P217
    .lex "newclass", $P217
# .annotate "line", 51
    .const 'Sub' $P224 = "40_1268929887.23492" 
    capture_lex $P224
    .lex "setattribute", $P224
# .annotate "line", 53
    .const 'Sub' $P235 = "41_1268929887.23492" 
    capture_lex $P235
    .lex "set_integer", $P235
# .annotate "line", 54
    .const 'Sub' $P244 = "42_1268929887.23492" 
    capture_lex $P244
    .lex "throw", $P244
# .annotate "line", 55
    .const 'Sub' $P250 = "43_1268929887.23492" 
    capture_lex $P250
    .lex "typeof", $P250
# .annotate "line", 59
    .const 'Sub' $P257 = "44_1268929887.23492" 
    capture_lex $P257
    .lex "get_hll_global", $P257
# .annotate "line", 80
    .const 'Sub' $P283 = "45_1268929887.23492" 
    capture_lex $P283
    .lex "get_root_global", $P283
# .annotate "line", 101
    .const 'Sub' $P309 = "46_1268929887.23492" 
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
.sub "_pre_initload"  :subid("12_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "backtrace"  :subid("13_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "can"  :subid("14_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "class"  :subid("15_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "clone"  :subid("16_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "defined"  :subid("17_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "delete"  :subid("18_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "does"  :subid("19_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "elements"  :subid("20_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "exit"  :subid("21_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "get_addr"  :subid("22_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "getattribute"  :subid("23_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "get_class"  :subid("24_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "get_integer"  :subid("25_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "get_global"  :subid("26_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "getinterp"  :subid("27_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "get_namespace"  :subid("28_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "get_root_namespace"  :subid("29_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "inspect"  :subid("30_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "inspect_string"  :subid("31_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "isnull"  :subid("32_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "isa"  :subid("33_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "iseq"  :subid("34_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "join"  :subid("35_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "load_bytecode"  :subid("36_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "load_language"  :subid("37_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "new"  :subid("38_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "newclass"  :subid("39_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "setattribute"  :subid("40_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "set_integer"  :subid("41_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "throw"  :subid("42_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "typeof"  :subid("43_1268929887.23492") :outer("11_1268929887.23492")
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
.sub "get_hll_global"  :subid("44_1268929887.23492") :outer("11_1268929887.23492")
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
    $P263 = root_new ['parrot';'ResizablePMCArray']
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
.sub "get_root_global"  :subid("45_1268929887.23492") :outer("11_1268929887.23492")
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
    $P289 = root_new ['parrot';'ResizablePMCArray']
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
.sub "make_root_namespace"  :subid("46_1268929887.23492") :outer("11_1268929887.23492")
    .param pmc param_312
# .annotate "line", 101
    .const 'Sub' $P319 = "47_1268929887.23492" 
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
    .const 'Sub' $P319 = "47_1268929887.23492" 
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
.sub "_block318"  :anon :subid("47_1268929887.23492") :outer("46_1268929887.23492")
# .annotate "line", 105
    $P320 = root_new ['parrot';'ResizablePMCArray']
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
.sub "_block11"  :anon :subid("10_1268929883.25486")
# .annotate "line", 0
    get_hll_global $P14, ["Parrot"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Parrot"], "_block13" 
    capture_lex $P14
    $P575 = $P14()
# .annotate "line", 1
    .return ($P575)
.end


.namespace ["Parrot"]
.sub "_block13"  :subid("11_1268929883.25486") :outer("10_1268929883.25486")
# .annotate "line", 7
    .const 'Sub' $P514 = "41_1268929883.25486" 
    capture_lex $P514
    .const 'Sub' $P422 = "37_1268929883.25486" 
    capture_lex $P422
    .const 'Sub' $P400 = "36_1268929883.25486" 
    capture_lex $P400
    .const 'Sub' $P388 = "35_1268929883.25486" 
    capture_lex $P388
    .const 'Sub' $P348 = "33_1268929883.25486" 
    capture_lex $P348
    .const 'Sub' $P328 = "31_1268929883.25486" 
    capture_lex $P328
    .const 'Sub' $P318 = "30_1268929883.25486" 
    capture_lex $P318
    .const 'Sub' $P311 = "29_1268929883.25486" 
    capture_lex $P311
    .const 'Sub' $P280 = "28_1268929883.25486" 
    capture_lex $P280
    .const 'Sub' $P238 = "27_1268929883.25486" 
    capture_lex $P238
    .const 'Sub' $P225 = "26_1268929883.25486" 
    capture_lex $P225
    .const 'Sub' $P199 = "25_1268929883.25486" 
    capture_lex $P199
    .const 'Sub' $P164 = "24_1268929883.25486" 
    capture_lex $P164
    .const 'Sub' $P155 = "23_1268929883.25486" 
    capture_lex $P155
    .const 'Sub' $P134 = "22_1268929883.25486" 
    capture_lex $P134
    .const 'Sub' $P123 = "21_1268929883.25486" 
    capture_lex $P123
    .const 'Sub' $P116 = "20_1268929883.25486" 
    capture_lex $P116
    .const 'Sub' $P104 = "19_1268929883.25486" 
    capture_lex $P104
    .const 'Sub' $P94 = "18_1268929883.25486" 
    capture_lex $P94
    .const 'Sub' $P81 = "17_1268929883.25486" 
    capture_lex $P81
    .const 'Sub' $P71 = "16_1268929883.25486" 
    capture_lex $P71
    .const 'Sub' $P58 = "15_1268929883.25486" 
    capture_lex $P58
    .const 'Sub' $P43 = "14_1268929883.25486" 
    capture_lex $P43
    .const 'Sub' $P27 = "13_1268929883.25486" 
    capture_lex $P27
    .const 'Sub' $P15 = "12_1268929883.25486" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929883.25486" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 32
    .const 'Sub' $P27 = "13_1268929883.25486" 
    capture_lex $P27
    .lex "caller", $P27
# .annotate "line", 39
    .const 'Sub' $P43 = "14_1268929883.25486" 
    capture_lex $P43
    .lex "caller_namespace", $P43
# .annotate "line", 44
    .const 'Sub' $P58 = "15_1268929883.25486" 
    capture_lex $P58
    .lex "call_method", $P58
# .annotate "line", 50
    .const 'Sub' $P71 = "16_1268929883.25486" 
    capture_lex $P71
    .lex "call_method_", $P71
# .annotate "line", 70
    .const 'Sub' $P81 = "17_1268929883.25486" 
    capture_lex $P81
    .lex "call_tuple_method", $P81
# .annotate "line", 76
    .const 'Sub' $P94 = "18_1268929883.25486" 
    capture_lex $P94
    .lex "call_tuple_method_", $P94
# .annotate "line", 98
    .const 'Sub' $P104 = "19_1268929883.25486" 
    capture_lex $P104
    .lex "call_sub", $P104
# .annotate "line", 102
    .const 'Sub' $P116 = "20_1268929883.25486" 
    capture_lex $P116
    .lex "call_sub_", $P116
# .annotate "line", 123
    .const 'Sub' $P123 = "21_1268929883.25486" 
    capture_lex $P123
    .lex "call_tuple_sub", $P123
# .annotate "line", 127
    .const 'Sub' $P134 = "22_1268929883.25486" 
    capture_lex $P134
    .lex "call_tuple_sub_", $P134
# .annotate "line", 152
    .const 'Sub' $P155 = "23_1268929883.25486" 
    capture_lex $P155
    .lex "get_address_of", $P155
# .annotate "line", 157
    .const 'Sub' $P164 = "24_1268929883.25486" 
    capture_lex $P164
    .lex "get_hll_global", $P164
# .annotate "line", 180
    .const 'Sub' $P199 = "25_1268929883.25486" 
    capture_lex $P199
    .lex "get_hll_namespace", $P199
# .annotate "line", 198
    .const 'Sub' $P225 = "26_1268929883.25486" 
    capture_lex $P225
    .lex "get_self", $P225
# .annotate "line", 208
    .const 'Sub' $P238 = "27_1268929883.25486" 
    capture_lex $P238
    .lex "get_sub", $P238
# .annotate "line", 232
    .const 'Sub' $P280 = "28_1268929883.25486" 
    capture_lex $P280
    .lex "isa", $P280
# .annotate "line", 247
    .const 'Sub' $P311 = "29_1268929883.25486" 
    capture_lex $P311
    .lex "is_null", $P311
# .annotate "line", 251
    .const 'Sub' $P318 = "30_1268929883.25486" 
    capture_lex $P318
    .lex "key", $P318
# .annotate "line", 256
    .const 'Sub' $P328 = "31_1268929883.25486" 
    capture_lex $P328
    .lex "key_", $P328
# .annotate "line", 313
    .const 'Sub' $P348 = "33_1268929883.25486" 
    capture_lex $P348
    .lex "macro_const", $P348
# .annotate "line", 324
    .const 'Sub' $P388 = "35_1268929883.25486" 
    capture_lex $P388
    .lex "namespace_name", $P388
# .annotate "line", 330
    .const 'Sub' $P400 = "36_1268929883.25486" 
    capture_lex $P400
    .lex "new", $P400
# .annotate "line", 338
    .const 'Sub' $P422 = "37_1268929883.25486" 
    capture_lex $P422
    .lex "qualified_name", $P422
# .annotate "line", 380
    .const 'Sub' $P514 = "41_1268929883.25486" 
    capture_lex $P514
    .lex "set_hll_global", $P514
# .annotate "line", 7
    find_lex $P550, "_pre_initload"
    find_lex $P551, "caller"
    find_lex $P552, "caller_namespace"
    find_lex $P553, "call_method"
    find_lex $P554, "call_method_"
    find_lex $P555, "call_tuple_method"
    find_lex $P556, "call_tuple_method_"
    find_lex $P557, "call_sub"
    find_lex $P558, "call_sub_"
    find_lex $P559, "call_tuple_sub"
    find_lex $P560, "call_tuple_sub_"
    find_lex $P561, "get_address_of"
    find_lex $P562, "get_hll_global"
    find_lex $P563, "get_hll_namespace"
    find_lex $P564, "get_self"
    find_lex $P565, "get_sub"
    find_lex $P566, "isa"
    find_lex $P567, "is_null"
    find_lex $P568, "key"
    find_lex $P569, "key_"
    find_lex $P570, "macro_const"
    find_lex $P571, "namespace_name"
    find_lex $P572, "new"
    find_lex $P573, "qualified_name"
    find_lex $P574, "set_hll_global"
    .return ($P574)
.end


.namespace ["Parrot"]
.sub "_pre_initload"  :subid("12_1268929883.25486") :outer("11_1268929883.25486")
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
.sub "caller"  :subid("13_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_30 :optional
    .param int has_param_30 :opt_flag
# .annotate "line", 32
    new $P29, 'ExceptionHandler'
    set_addr $P29, control_28
    $P29."handle_types"(58)
    push_eh $P29
    if has_param_30, optparam_42
    new $P31, "Integer"
    assign $P31, 1
    set param_30, $P31
  optparam_42:
    .lex "$index", param_30
# .annotate "line", 33
    new $P32, "Undef"
    .lex "$key", $P32
# .annotate "line", 34
    new $P33, "Undef"
    .lex "&sub", $P33
# .annotate "line", 33
    get_hll_global $P34, ["Key"], "create_key"
    new $P35, "Integer"
    assign $P35, 1
    find_lex $P36, "$index"
    add $P37, $P35, $P36
    $P38 = $P34("sub", $P37)
    store_lex "$key", $P38
# .annotate "line", 34
    find_lex $P39, "$key"
    getinterp $P40
    set $P41, $P40[$P39]
    unless_null $P41, vivify_43
    new $P41, "Undef"
  vivify_43:
    store_lex "&sub", $P41
# .annotate "line", 32
    .return ($P41)
  control_28:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P42, exception, "payload"
    .return ($P42)
.end


.namespace ["Parrot"]
.sub "caller_namespace"  :subid("14_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_46 :optional
    .param int has_param_46 :opt_flag
# .annotate "line", 39
    new $P45, 'ExceptionHandler'
    set_addr $P45, control_44
    $P45."handle_types"(58)
    push_eh $P45
    if has_param_46, optparam_44
    new $P47, "Integer"
    assign $P47, 1
    set param_46, $P47
  optparam_44:
    .lex "$index", param_46
# .annotate "line", 40
    new $P48, "Undef"
    .lex "$key", $P48
# .annotate "line", 41
    new $P49, "Undef"
    .lex "$nsp", $P49
# .annotate "line", 40
    get_hll_global $P50, ["Key"], "create_key"
    find_lex $P51, "$index"
    add $P52, $P51, 1
    $P53 = $P50("namespace", $P52)
    store_lex "$key", $P53
# .annotate "line", 41
    find_lex $P54, "$key"
    getinterp $P55
    set $P56, $P55[$P54]
    unless_null $P56, vivify_45
    new $P56, "Undef"
  vivify_45:
    store_lex "$nsp", $P56
# .annotate "line", 39
    .return ($P56)
  control_44:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P57, exception, "payload"
    .return ($P57)
.end


.namespace ["Parrot"]
.sub "call_method"  :subid("15_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_61
    .param pmc param_62
    .param pmc param_63 :slurpy
    .param pmc param_64 :slurpy :named
# .annotate "line", 44
    new $P60, 'ExceptionHandler'
    set_addr $P60, control_59
    $P60."handle_types"(58)
    push_eh $P60
    .lex "$object", param_61
    .lex "$method_name", param_62
    .lex "@args", param_63
    .lex "%opts", param_64
# .annotate "line", 45
    find_lex $P65, "$object"
    find_lex $P66, "$method_name"
    find_lex $P67, "@args"
    find_lex $P68, "%opts"
    $P69 = "call_method_"($P65, $P66, $P67, $P68)
# .annotate "line", 44
    .return ($P69)
  control_59:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P70, exception, "payload"
    .return ($P70)
.end


.namespace ["Parrot"]
.sub "call_method_"  :subid("16_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_74
    .param pmc param_75
    .param pmc param_76 :optional
    .param int has_param_76 :opt_flag
    .param pmc param_78 :optional
    .param int has_param_78 :opt_flag
# .annotate "line", 50
    new $P73, 'ExceptionHandler'
    set_addr $P73, control_72
    $P73."handle_types"(58)
    push_eh $P73
    .lex "$object", param_74
    .lex "$method_name", param_75
    if has_param_76, optparam_46
    $P77 = root_new ['parrot';'ResizablePMCArray']
    set param_76, $P77
  optparam_46:
    .lex "@args", param_76
    if has_param_78, optparam_47
    $P79 = root_new ['parrot';'Hash']
    set param_78, $P79
  optparam_47:
    .lex "%opts", param_78
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
  control_72:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P80, exception, "payload"
    .return ($P80)
.end


.namespace ["Parrot"]
.sub "call_tuple_method"  :subid("17_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_84
    .param pmc param_85
    .param pmc param_86 :slurpy
    .param pmc param_87 :slurpy :named
# .annotate "line", 70
    new $P83, 'ExceptionHandler'
    set_addr $P83, control_82
    $P83."handle_types"(58)
    push_eh $P83
    .lex "$object", param_84
    .lex "$method", param_85
    .lex "@args", param_86
    .lex "%opts", param_87
# .annotate "line", 71
    find_lex $P88, "$object"
    find_lex $P89, "$method"
    find_lex $P90, "@args"
    find_lex $P91, "%opts"
    $P92 = "call_tuple_method_"($P88, $P89, $P90, $P91)
# .annotate "line", 70
    .return ($P92)
  control_82:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P93, exception, "payload"
    .return ($P93)
.end


.namespace ["Parrot"]
.sub "call_tuple_method_"  :subid("18_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_97
    .param pmc param_98
    .param pmc param_99 :optional
    .param int has_param_99 :opt_flag
    .param pmc param_101 :optional
    .param int has_param_101 :opt_flag
# .annotate "line", 76
    new $P96, 'ExceptionHandler'
    set_addr $P96, control_95
    $P96."handle_types"(58)
    push_eh $P96
    .lex "$object", param_97
    .lex "$method", param_98
    if has_param_99, optparam_48
    $P100 = root_new ['parrot';'ResizablePMCArray']
    set param_99, $P100
  optparam_48:
    .lex "@args", param_99
    if has_param_101, optparam_49
    $P102 = root_new ['parrot';'Hash']
    set param_101, $P102
  optparam_49:
    .lex "%opts", param_101
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
  control_95:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["Parrot"]
.sub "call_sub"  :subid("19_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_107
    .param pmc param_108 :slurpy
    .param pmc param_109 :slurpy :named
# .annotate "line", 98
    new $P106, 'ExceptionHandler'
    set_addr $P106, control_105
    $P106."handle_types"(58)
    push_eh $P106
    .lex "$sub_name", param_107
    .lex "@args", param_108
    .lex "%opts", param_109
# .annotate "line", 99
    new $P110, "Exception"
    set $P110['type'], 58
    find_lex $P111, "$sub_name"
    find_lex $P112, "@args"
    find_lex $P113, "%opts"
    $P114 = "call_sub_"($P111, $P112, $P113)
    setattribute $P110, 'payload', $P114
    throw $P110
# .annotate "line", 98
    .return ()
  control_105:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, "payload"
    .return ($P115)
.end


.namespace ["Parrot"]
.sub "call_sub_"  :subid("20_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_119
    .param pmc param_120
    .param pmc param_121
# .annotate "line", 102
    new $P118, 'ExceptionHandler'
    set_addr $P118, control_117
    $P118."handle_types"(58)
    push_eh $P118
    .lex "$sub_name", param_119
    .lex "@args", param_120
    .lex "%opts", param_121
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
  control_117:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P122, exception, "payload"
    .return ($P122)
.end


.namespace ["Parrot"]
.sub "call_tuple_sub"  :subid("21_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_126
    .param pmc param_127 :slurpy
    .param pmc param_128 :slurpy :named
# .annotate "line", 123
    new $P125, 'ExceptionHandler'
    set_addr $P125, control_124
    $P125."handle_types"(58)
    push_eh $P125
    .lex "$sub", param_126
    .lex "@args", param_127
    .lex "%opts", param_128
# .annotate "line", 124
    find_lex $P129, "$sub"
    find_lex $P130, "@args"
    find_lex $P131, "%opts"
    $P132 = "call_tuple_sub_"($P129, $P130, $P131)
# .annotate "line", 123
    .return ($P132)
  control_124:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P133, exception, "payload"
    .return ($P133)
.end


.namespace ["Parrot"]
.sub "call_tuple_sub_"  :subid("22_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_137
    .param pmc param_138 :optional
    .param int has_param_138 :opt_flag
    .param pmc param_140 :optional
    .param int has_param_140 :opt_flag
# .annotate "line", 127
    new $P136, 'ExceptionHandler'
    set_addr $P136, control_135
    $P136."handle_types"(58)
    push_eh $P136
    .lex "$sub", param_137
    if has_param_138, optparam_50
    $P139 = root_new ['parrot';'ResizablePMCArray']
    set param_138, $P139
  optparam_50:
    .lex "@args", param_138
    if has_param_140, optparam_51
    $P141 = root_new ['parrot';'Hash']
    set param_140, $P141
  optparam_51:
    .lex "%opts", param_140
# .annotate "line", 131
    get_hll_global $P143, ["Opcode"], "defined"
    find_lex $P144, "@args"
    $P145 = $P143($P144)
    if $P145, unless_142_end
    get_hll_global $P146, ["Array"], "new"
    $P147 = $P146()
    store_lex "@args", $P147
  unless_142_end:
# .annotate "line", 132
    get_hll_global $P149, ["Opcode"], "defined"
    find_lex $P150, "%opts"
    $P151 = $P149($P150)
    if $P151, unless_148_end
    get_hll_global $P152, ["Hash"], "empty"
    $P153 = $P152()
    store_lex "%opts", $P153
  unless_148_end:
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
  control_135:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P154, exception, "payload"
    .return ($P154)
.end


.namespace ["Parrot"]
.sub "get_address_of"  :subid("23_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_158
# .annotate "line", 152
    new $P157, 'ExceptionHandler'
    set_addr $P157, control_156
    $P157."handle_types"(58)
    push_eh $P157
    .lex "$what", param_158
# .annotate "line", 153
    new $P159, "Exception"
    set $P159['type'], 58
    get_hll_global $P160, ["Opcode"], "get_addr"
    find_lex $P161, "$what"
    $P162 = $P160($P161)
    setattribute $P159, 'payload', $P162
    throw $P159
# .annotate "line", 152
    .return ()
  control_156:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P163, exception, "payload"
    .return ($P163)
.end


.namespace ["Parrot"]
.sub "get_hll_global"  :subid("24_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_167
# .annotate "line", 157
    new $P166, 'ExceptionHandler'
    set_addr $P166, control_165
    $P166."handle_types"(58)
    push_eh $P166
    .lex "$path", param_167
# .annotate "line", 166
    new $P168, "Undef"
    .lex "$name", $P168
# .annotate "line", 167
    new $P169, "Undef"
    .lex "$key", $P169
# .annotate "line", 158
    find_lex $P171, "$path"
    $P172 = $P171."isa"("String")
    unless $P172, if_170_end
# .annotate "line", 159
    find_lex $P173, "$path"
    $P174 = $P173."split"("::")
    store_lex "$path", $P174
  if_170_end:
# .annotate "line", 162
    find_lex $P176, "$path"
    new $P177, "String"
    assign $P177, "array"
    set $S178, $P177
    does $I179, $P176, $S178
    if $I179, unless_175_end
# .annotate "line", 163
    find_lex $P180, "$path"
    concat $P181, $P180, " parameter must be a ::string or array of strings, not: "
    find_lex $P182, "$path"
    "die"($P181, $P182)
  unless_175_end:
# .annotate "line", 166
    find_lex $P183, "$path"
    $P184 = $P183."pop"()
    store_lex "$name", $P184
# .annotate "line", 167
    find_lex $P185, "$path"
    $P186 = "key_"($P185)
    store_lex "$key", $P186
# .annotate "line", 169
    find_lex $P189, "$key"
    $P190 = $P189."defined"()
    if $P190, if_188
# .annotate "line", 171
    find_lex $P195, "$name"
    set $S196, $P195
    get_hll_global $P197, $S196
    set $P187, $P197
# .annotate "line", 169
    goto if_188_end
  if_188:
# .annotate "line", 170
    find_lex $P191, "$key"
    find_lex $P192, "$name"
    set $S193, $P192
    get_hll_global $P194, $P191, $S193
    set $P187, $P194
  if_188_end:
# .annotate "line", 157
    .return ($P187)
  control_165:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P198, exception, "payload"
    .return ($P198)
.end


.namespace ["Parrot"]
.sub "get_hll_namespace"  :subid("25_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_202 :optional
    .param int has_param_202 :opt_flag
# .annotate "line", 180
    new $P201, 'ExceptionHandler'
    set_addr $P201, control_200
    $P201."handle_types"(58)
    push_eh $P201
    if has_param_202, optparam_52
    new $P203, "Undef"
    set param_202, $P203
  optparam_52:
    .lex "$path", param_202
# .annotate "line", 182
    new $P204, "Undef"
    .lex "$result", $P204
# .annotate "line", 180
    find_lex $P205, "$result"
# .annotate "line", 184
    find_lex $P207, "$path"
    defined $I208, $P207
    if $I208, if_206
# .annotate "line", 192
    get_hll_namespace $P222
    store_lex "$result", $P222
# .annotate "line", 191
    goto if_206_end
  if_206:
# .annotate "line", 185
    find_lex $P210, "$path"
    new $P211, "String"
    assign $P211, "String"
    set $S212, $P211
    isa $I213, $P210, $S212
    unless $I213, if_209_end
# .annotate "line", 186
    new $P214, "String"
    assign $P214, "::"
    set $S215, $P214
    find_lex $P216, "$path"
    set $S217, $P216
    split $P218, $S215, $S217
    $P219 = "key_"($P218)
    store_lex "$path", $P219
  if_209_end:
# .annotate "line", 189
    find_lex $P220, "$path"
    get_hll_namespace $P221, $P220
    store_lex "$result", $P221
  if_206_end:
# .annotate "line", 184
    find_lex $P223, "$result"
# .annotate "line", 180
    .return ($P223)
  control_200:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P224, exception, "payload"
    .return ($P224)
.end


.namespace ["Parrot"]
.sub "get_self"  :subid("26_1268929883.25486") :outer("11_1268929883.25486")
# .annotate "line", 198
    new $P227, 'ExceptionHandler'
    set_addr $P227, control_226
    $P227."handle_types"(58)
    push_eh $P227
# .annotate "line", 199
    new $P228, "Undef"
    .lex "$self", $P228
    new $P229, "String"
    assign $P229, "self"
    set $S230, $P229
    find_dynamic_lex $P231, $S230
    store_lex "$self", $P231
# .annotate "line", 201
    find_lex $P233, "$self"
    isnull $I234, $P233
    unless $I234, if_232_end
# .annotate "line", 202
    die "Fatal: No 'self' lexical in any caller scope"
  if_232_end:
# .annotate "line", 205
    new $P235, "Exception"
    set $P235['type'], 58
    find_lex $P236, "$self"
    setattribute $P235, 'payload', $P236
    throw $P235
# .annotate "line", 198
    .return ()
  control_226:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P237, exception, "payload"
    .return ($P237)
.end


.namespace ["Parrot"]
.sub "get_sub"  :subid("27_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_241
    .param pmc param_242 :optional :named("caller_nsp")
    .param int has_param_242 :opt_flag
# .annotate "line", 208
    new $P240, 'ExceptionHandler'
    set_addr $P240, control_239
    $P240."handle_types"(58)
    push_eh $P240
    .lex "$path", param_241
    if has_param_242, optparam_53
    new $P243, "Undef"
    set param_242, $P243
  optparam_53:
    .lex "$caller_nsp", param_242
# .annotate "line", 209
    $P244 = root_new ['parrot';'ResizablePMCArray']
    .lex "@parts", $P244
# .annotate "line", 210
    new $P245, "Undef"
    .lex "$name", $P245
# .annotate "line", 211
    new $P246, "Undef"
    .lex "&sub", $P246
# .annotate "line", 223
    new $P247, "Undef"
    .lex "$namespace", $P247
# .annotate "line", 209
    find_lex $P248, "$path"
    $P249 = $P248."split"("::")
    store_lex "@parts", $P249
# .annotate "line", 210
    find_lex $P250, "@parts"
    $P251 = $P250."pop"()
    store_lex "$name", $P251
    find_lex $P252, "&sub"
# .annotate "line", 213
    find_lex $P254, "@parts"
    set $N255, $P254
    iseq $I256, $N255, 0.0
    unless $I256, if_253_end
# .annotate "line", 214
    find_lex $P258, "$caller_nsp"
    if $P258, unless_257_end
    $P259 = "caller_namespace"(2)
    store_lex "$caller_nsp", $P259
  unless_257_end:
# .annotate "line", 216
    find_lex $P260, "$caller_nsp"
    find_lex $P261, "$name"
    $P262 = $P260."find_sub"($P261)
    store_lex "&sub", $P262
# .annotate "line", 218
    get_hll_global $P264, ["Opcode"], "defined"
    find_lex $P265, "&sub"
    $P266 = $P264($P265)
    unless $P266, if_263_end
# .annotate "line", 219
    new $P267, "Exception"
    set $P267['type'], 58
    find_lex $P268, "&sub"
    setattribute $P267, 'payload', $P268
    throw $P267
  if_263_end:
  if_253_end:
# .annotate "line", 223
    get_hll_global $P269, ["Opcode"], "get_hll_namespace"
    find_lex $P270, "@parts"
    $P271 = $P269($P270)
    store_lex "$namespace", $P271
# .annotate "line", 225
    find_lex $P273, "$namespace"
    unless $P273, if_272_end
# .annotate "line", 226
    find_lex $P274, "$namespace"
    find_lex $P275, "$name"
    $P276 = $P274."find_sub"($P275)
    store_lex "&sub", $P276
  if_272_end:
# .annotate "line", 229
    new $P277, "Exception"
    set $P277['type'], 58
    find_lex $P278, "&sub"
    setattribute $P277, 'payload', $P278
    throw $P277
# .annotate "line", 208
    .return ()
  control_239:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P279, exception, "payload"
    .return ($P279)
.end


.namespace ["Parrot"]
.sub "isa"  :subid("28_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_283
    .param pmc param_284
# .annotate "line", 232
    new $P282, 'ExceptionHandler'
    set_addr $P282, control_281
    $P282."handle_types"(58)
    push_eh $P282
    .lex "$obj", param_283
    .lex "$class", param_284
# .annotate "line", 233
    find_lex $P286, "$class"
    new $P287, "String"
    assign $P287, "P6protoobject"
    set $S288, $P287
    isa $I289, $P286, $S288
    if $I289, if_285
# .annotate "line", 236
    find_lex $P294, "$class"
    new $P295, "String"
    assign $P295, "String"
    set $S296, $P295
    isa $I297, $P294, $S296
    unless $I297, if_293_end
# .annotate "line", 237
    find_lex $P298, "$class"
    $P299 = $P298."split"("::")
    store_lex "$class", $P299
# .annotate "line", 239
    find_lex $P301, "$class"
    elements $I302, $P301
    set $N303, $I302
    iseq $I304, $N303, 1.0
    unless $I304, if_300_end
# .annotate "line", 240
    find_lex $P305, "$class"
    $P306 = $P305."shift"()
    store_lex "$class", $P306
  if_300_end:
  if_293_end:
# .annotate "line", 236
    goto if_285_end
  if_285:
# .annotate "line", 234
    get_hll_global $P290, "P6metaclass"
    find_lex $P291, "$class"
    $P292 = $P290."get_parrotclass"($P291)
    store_lex "$class", $P292
  if_285_end:
# .annotate "line", 244
    find_lex $P307, "$obj"
    find_lex $P308, "$class"
    isa $I309, $P307, $P308
# .annotate "line", 232
    .return ($I309)
  control_281:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P310, exception, "payload"
    .return ($P310)
.end


.namespace ["Parrot"]
.sub "is_null"  :subid("29_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_314
# .annotate "line", 247
    new $P313, 'ExceptionHandler'
    set_addr $P313, control_312
    $P313."handle_types"(58)
    push_eh $P313
    .lex "$obj", param_314
# .annotate "line", 248
    find_lex $P315, "$obj"
    isnull $I316, $P315
# .annotate "line", 247
    .return ($I316)
  control_312:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P317, exception, "payload"
    .return ($P317)
.end


.namespace ["Parrot"]
.sub "key"  :subid("30_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_321
    .param pmc param_322 :slurpy
# .annotate "line", 251
    new $P320, 'ExceptionHandler'
    set_addr $P320, control_319
    $P320."handle_types"(58)
    push_eh $P320
    .lex "$first", param_321
    .lex "@parts", param_322
# .annotate "line", 252
    find_lex $P323, "@parts"
    find_lex $P324, "$first"
    $P323."unshift"($P324)
# .annotate "line", 253
    find_lex $P325, "@parts"
    $P326 = "key_"($P325)
# .annotate "line", 251
    .return ($P326)
  control_319:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P327, exception, "payload"
    .return ($P327)
.end


.namespace ["Parrot"]
.sub "key_"  :subid("31_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_331
# .annotate "line", 256
    .const 'Sub' $P339 = "32_1268929883.25486" 
    capture_lex $P339
    new $P330, 'ExceptionHandler'
    set_addr $P330, control_329
    $P330."handle_types"(58)
    push_eh $P330
    .lex "@parts", param_331
# .annotate "line", 257
    new $P332, "Undef"
    .lex "$key", $P332
# .annotate "line", 256
    find_lex $P333, "$key"
# .annotate "line", 259
    find_lex $P335, "@parts"
    defined $I336, $P335
    unless $I336, for_undef_54
    iter $P334, $P335
    new $P344, 'ExceptionHandler'
    set_addr $P344, loop343_handler
    $P344."handle_types"(65, 67, 66)
    push_eh $P344
  loop343_test:
    unless $P334, loop343_done
    shift $P337, $P334
  loop343_redo:
    .const 'Sub' $P339 = "32_1268929883.25486" 
    capture_lex $P339
    $P339($P337)
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
  for_undef_54:
    find_lex $P346, "$key"
# .annotate "line", 256
    .return ($P346)
  control_329:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P347, exception, "payload"
    .return ($P347)
.end


.namespace ["Parrot"]
.sub "_block338"  :anon :subid("32_1268929883.25486") :outer("31_1268929883.25486")
    .param pmc param_341
# .annotate "line", 260
    new $P340, "Undef"
    .lex "$element", $P340
    .lex "$_", param_341
    find_lex $P342, "$_"
    store_lex "$element", $P342
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
.sub "macro_const"  :subid("33_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_351 :optional
    .param int has_param_351 :opt_flag
    .param pmc param_353 :optional :named("TAGS")
    .param int has_param_353 :opt_flag
    .param pmc param_355 :slurpy :named
# .annotate "line", 313
    .const 'Sub' $P361 = "34_1268929883.25486" 
    capture_lex $P361
    new $P350, 'ExceptionHandler'
    set_addr $P350, control_349
    $P350."handle_types"(58)
    push_eh $P350
    if has_param_351, optparam_55
    $P352 = "caller_namespace"()
    set param_351, $P352
  optparam_55:
    .lex "$namespace", param_351
    if has_param_353, optparam_56
    $P354 = root_new ['parrot';'ResizablePMCArray']
    set param_353, $P354
  optparam_56:
    .lex "@TAGS", param_353
    .lex "%named", param_355
# .annotate "line", 314
    find_lex $P357, "%named"
    defined $I358, $P357
    unless $I358, for_undef_57
    iter $P356, $P357
    new $P385, 'ExceptionHandler'
    set_addr $P385, loop384_handler
    $P385."handle_types"(65, 67, 66)
    push_eh $P385
  loop384_test:
    unless $P356, loop384_done
    shift $P359, $P356
  loop384_redo:
    .const 'Sub' $P361 = "34_1268929883.25486" 
    capture_lex $P361
    $P361($P359)
  loop384_next:
    goto loop384_test
  loop384_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P386, exception, 'type'
    eq $P386, 65, loop384_next
    eq $P386, 67, loop384_redo
  loop384_done:
    pop_eh 
  for_undef_57:
# .annotate "line", 313
    .return ($P356)
  control_349:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P387, exception, "payload"
    .return ($P387)
.end


.namespace ["Parrot"]
.sub "_block360"  :anon :subid("34_1268929883.25486") :outer("33_1268929883.25486")
    .param pmc param_362
# .annotate "line", 314
    .lex "$macro", param_362
# .annotate "line", 315
    new $P363, "Undef"
    .lex "$name", $P363
    find_lex $P364, "$macro"
    $P365 = $P364."key"()
    store_lex "$name", $P365
# .annotate "line", 318
    find_lex $P367, "$namespace"
    find_lex $P368, "$name"
    $P369 = $P367."contains"($P368)
    unless $P369, if_366_end
# .annotate "line", 317
    new $P370, 'String'
    set $P370, "Cannot define macro "
    find_lex $P371, "$name"
    concat $P372, $P370, $P371
    concat $P373, $P372, " in namespace "
    find_lex $P374, "$namespace"
    $P375 = $P374."string_name"()
    set $S376, $P375
    concat $P377, $P373, $S376
    concat $P378, $P377, " - a symbol with that name already exists"
    "die"($P378)
  if_366_end:
# .annotate "line", 320
    find_lex $P379, "$namespace"
    find_lex $P380, "$name"
    find_lex $P381, "$macro"
    $P382 = $P381."value"()
    $P383 = $P379."add_var"($P380, $P382)
# .annotate "line", 314
    .return ($P383)
.end


.namespace ["Parrot"]
.sub "namespace_name"  :subid("35_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_391
# .annotate "line", 324
    new $P390, 'ExceptionHandler'
    set_addr $P390, control_389
    $P390."handle_types"(58)
    push_eh $P390
    .lex "$nsp", param_391
# .annotate "line", 325
    find_lex $P394, "$nsp"
    isa $I395, $P394, "String"
    if $I395, if_393
# .annotate "line", 327
    find_lex $P397, "$nsp"
    $P398 = $P397."string_name"()
    set $P392, $P398
# .annotate "line", 325
    goto if_393_end
  if_393:
    find_lex $P396, "$nsp"
    set $P392, $P396
  if_393_end:
# .annotate "line", 324
    .return ($P392)
  control_389:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P399, exception, "payload"
    .return ($P399)
.end


.namespace ["Parrot"]
.sub "new"  :subid("36_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_403
    .param pmc param_404 :optional
    .param int has_param_404 :opt_flag
# .annotate "line", 330
    new $P402, 'ExceptionHandler'
    set_addr $P402, control_401
    $P402."handle_types"(58)
    push_eh $P402
    .lex "$pmc", param_403
    if has_param_404, optparam_58
    $P405 = root_new ['parrot';'Hash']
    set param_404, $P405
  optparam_58:
    .lex "%args", param_404
# .annotate "line", 331
    new $P406, "Undef"
    .lex "$key", $P406
    get_hll_global $P407, "Key"
    find_lex $P408, "$pmc"
    $P409 = $P408."split"("::")
    $P410 = $P407."new"($P409 :flat)
    store_lex "$key", $P410
# .annotate "line", 333
    find_lex $P413, "%args"
    $N414 = $P413."elems"()
    iseq $I415, $N414, 0.0
    if $I415, if_412
# .annotate "line", 335
    find_lex $P418, "$key"
    find_lex $P419, "%args"
    new $P420, $P418, $P419
    set $P411, $P420
# .annotate "line", 333
    goto if_412_end
  if_412:
# .annotate "line", 334
    find_lex $P416, "$key"
    new $P417, $P416
    set $P411, $P417
  if_412_end:
# .annotate "line", 330
    .return ($P411)
  control_401:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P421, exception, "payload"
    .return ($P421)
.end


.namespace ["Parrot"]
.sub "qualified_name"  :subid("37_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_425
    .param pmc param_426 :optional :named("namespace")
    .param int has_param_426 :opt_flag
# .annotate "line", 338
    .const 'Sub' $P500 = "40_1268929883.25486" 
    capture_lex $P500
    .const 'Sub' $P489 = "39_1268929883.25486" 
    capture_lex $P489
    .const 'Sub' $P468 = "38_1268929883.25486" 
    capture_lex $P468
    new $P424, 'ExceptionHandler'
    set_addr $P424, control_423
    $P424."handle_types"(58)
    push_eh $P424
    .lex "$x", param_425
    if has_param_426, optparam_59
    $P427 = "caller_namespace"(2)
    set param_426, $P427
  optparam_59:
    .lex "$namespace", param_426
# .annotate "line", 339
    find_lex $P429, "$x"
    new $P430, "String"
    assign $P430, "P6protoobject"
    set $S431, $P430
    isa $I432, $P429, $S431
    if $I432, if_428
# .annotate "line", 342
    find_lex $P438, "$x"
    new $P439, "String"
    assign $P439, "Class"
    set $S440, $P439
    isa $I441, $P438, $S440
    unless $I441, unless_437
    new $P436, 'Integer'
    set $P436, $I441
    goto unless_437_end
  unless_437:
    find_lex $P442, "$x"
    new $P443, "String"
    assign $P443, "PMCProxy"
    set $S444, $P443
    isa $I445, $P442, $S444
    new $P436, 'Integer'
    set $P436, $I445
  unless_437_end:
    unless $P436, if_435_end
# .annotate "line", 343
    find_lex $P446, "$x"
    $P447 = $P446."get_namespace"()
    store_lex "$x", $P447
  if_435_end:
# .annotate "line", 342
    goto if_428_end
  if_428:
# .annotate "line", 340
    find_lex $P433, "$x"
    $P434 = $P433."WHO"()
    store_lex "$x", $P434
  if_428_end:
# .annotate "line", 348
    find_lex $P449, "$x"
    new $P450, "String"
    assign $P450, "NameSpace"
    set $S451, $P450
    isa $I452, $P449, $S451
    if $I452, if_448
# .annotate "line", 351
    find_lex $P457, "$x"
    new $P458, "String"
    assign $P458, "String"
    set $S459, $P458
    isa $I460, $P457, $S459
    if $I460, if_456
# .annotate "line", 366
    find_lex $P484, "$x"
    new $P485, "String"
    assign $P485, "Sub"
    set $S486, $P485
    isa $I487, $P484, $S486
    if $I487, if_483
# .annotate "line", 371
    .const 'Sub' $P500 = "40_1268929883.25486" 
    capture_lex $P500
    $P500()
    goto if_483_end
  if_483:
# .annotate "line", 366
    .const 'Sub' $P489 = "39_1268929883.25486" 
    capture_lex $P489
    $P489()
  if_483_end:
    goto if_456_end
  if_456:
# .annotate "line", 352
    find_lex $P462, "$x"
    set $S463, $P462
    split $P464, "::", $S463
    set $N465, $P464
    isgt $I466, $N465, 1.0
    if $I466, if_461
# .annotate "line", 355
    .const 'Sub' $P468 = "38_1268929883.25486" 
    capture_lex $P468
    $P468()
    goto if_461_end
  if_461:
  if_461_end:
  if_456_end:
# .annotate "line", 351
    goto if_448_end
  if_448:
# .annotate "line", 349
    find_lex $P453, "$x"
    $P454 = $P453."get_name"()
    $P455 = $P454."join"("::")
    store_lex "$x", $P455
  if_448_end:
# .annotate "line", 348
    find_lex $P512, "$x"
# .annotate "line", 338
    .return ($P512)
  control_423:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P513, exception, "payload"
    .return ($P513)
.end


.namespace ["Parrot"]
.sub "_block499"  :anon :subid("40_1268929883.25486") :outer("37_1268929883.25486")
# .annotate "line", 372
    new $P501, "Undef"
    .lex "$type", $P501
    find_lex $P502, "$x"
    typeof $S503, $P502
    new $P504, 'String'
    set $P504, $S503
    store_lex "$type", $P504
# .annotate "line", 373
    new $P505, 'String'
    set $P505, "Don't know how to make qualified name from "
    find_lex $P506, "$type"
    concat $P507, $P505, $P506
    concat $P508, $P507, ": "
    find_lex $P509, "$x"
    concat $P510, $P508, $P509
    $P511 = "die"($P510)
# .annotate "line", 371
    .return ($P511)
.end


.namespace ["Parrot"]
.sub "_block488"  :anon :subid("39_1268929883.25486") :outer("37_1268929883.25486")
# .annotate "line", 367
    $P490 = root_new ['parrot';'ResizablePMCArray']
    .lex "@temp", $P490
    find_lex $P491, "$x"
    $P492 = $P491."get_namespace"()
    $P493 = $P492."get_name"()
    store_lex "@temp", $P493
# .annotate "line", 368
    find_lex $P494, "@temp"
    find_lex $P495, "$x"
    set $S496, $P495
    $P494."push"($S496)
# .annotate "line", 369
    find_lex $P497, "@temp"
    $P498 = $P497."join"("::")
    store_lex "$x", $P498
# .annotate "line", 366
    .return ($P498)
.end


.namespace ["Parrot"]
.sub "_block467"  :anon :subid("38_1268929883.25486") :outer("37_1268929883.25486")
# .annotate "line", 356
    $P469 = root_new ['parrot';'ResizablePMCArray']
    .lex "@temp", $P469
    find_lex $P470, "$x"
    set $S471, $P470
    split $P472, ";", $S471
    store_lex "@temp", $P472
# .annotate "line", 358
    find_lex $P474, "@temp"
    set $N475, $P474
    iseq $I476, $N475, 1.0
    unless $I476, if_473_end
# .annotate "line", 359
    find_lex $P477, "$namespace"
    $P478 = $P477."get_name"()
    store_lex "@temp", $P478
# .annotate "line", 360
    find_lex $P479, "@temp"
    find_lex $P480, "$x"
    $P479."push"($P480)
  if_473_end:
# .annotate "line", 363
    find_lex $P481, "@temp"
    $P482 = $P481."join"("::")
    store_lex "$x", $P482
# .annotate "line", 355
    .return ($P482)
.end


.namespace ["Parrot"]
.sub "set_hll_global"  :subid("41_1268929883.25486") :outer("11_1268929883.25486")
    .param pmc param_517
    .param pmc param_518
# .annotate "line", 380
    new $P516, 'ExceptionHandler'
    set_addr $P516, control_515
    $P516."handle_types"(58)
    push_eh $P516
    .lex "$path", param_517
    .lex "$value", param_518
# .annotate "line", 389
    new $P519, "Undef"
    .lex "$name", $P519
# .annotate "line", 390
    new $P520, "Undef"
    .lex "$key", $P520
# .annotate "line", 381
    find_lex $P522, "$path"
    $P523 = $P522."isa"("String")
    unless $P523, if_521_end
# .annotate "line", 382
    find_lex $P524, "$path"
    $P525 = $P524."split"("::")
    store_lex "$path", $P525
  if_521_end:
# .annotate "line", 385
    find_lex $P527, "$path"
    new $P528, "String"
    assign $P528, "array"
    set $S529, $P528
    does $I530, $P527, $S529
    if $I530, unless_526_end
# .annotate "line", 386
    find_lex $P531, "$path"
    concat $P532, $P531, " parameter must be a ::string or array of strings, not: "
    find_lex $P533, "$path"
    "die"($P532, $P533)
  unless_526_end:
# .annotate "line", 389
    find_lex $P534, "$path"
    $P535 = $P534."pop"()
    store_lex "$name", $P535
# .annotate "line", 390
    find_lex $P536, "$path"
    $P537 = "key_"($P536)
    store_lex "$key", $P537
# .annotate "line", 392
    find_lex $P540, "$key"
    $P541 = $P540."defined"()
    if $P541, if_539
# .annotate "line", 394
    find_lex $P546, "$name"
    set $S547, $P546
    find_lex $P548, "$value"
    set_hll_global $S547, $P548
    goto if_539_end
  if_539:
# .annotate "line", 393
    find_lex $P542, "$key"
    find_lex $P543, "$name"
    set $S544, $P543
    find_lex $P545, "$value"
    set_hll_global $P542, $S544, $P545
  if_539_end:
# .annotate "line", 380
    .return ($P538)
  control_515:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P549, exception, "payload"
    .return ($P549)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929913.19531")
# .annotate "line", 0
    get_hll_global $P14, ["Pir"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Pir"], "_block13" 
    capture_lex $P14
    $P181 = $P14()
# .annotate "line", 1
    .return ($P181)
.end


.namespace ["Pir"]
.sub "_block13"  :subid("11_1268929913.19531") :outer("10_1268929913.19531")
# .annotate "line", 7
    .const 'Sub' $P139 = "16_1268929913.19531" 
    capture_lex $P139
    .const 'Sub' $P35 = "14_1268929913.19531" 
    capture_lex $P35
    .const 'Sub' $P23 = "13_1268929913.19531" 
    capture_lex $P23
    .const 'Sub' $P15 = "12_1268929913.19531" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929913.19531" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 12
    .const 'Sub' $P23 = "13_1268929913.19531" 
    capture_lex $P23
    .lex "compile", $P23
# .annotate "line", 17
    .const 'Sub' $P35 = "14_1268929913.19531" 
    capture_lex $P35
    .lex "compile_sub", $P35
# .annotate "line", 41
    .const 'Sub' $P139 = "16_1268929913.19531" 
    capture_lex $P139
    .lex "pir_namespace", $P139
# .annotate "line", 7
    find_lex $P177, "_pre_initload"
    find_lex $P178, "compile"
    find_lex $P179, "compile_sub"
    find_lex $P180, "pir_namespace"
    .return ($P180)
.end


.namespace ["Pir"]
.sub "_pre_initload"  :subid("12_1268929913.19531") :outer("11_1268929913.19531")
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
.sub "compile"  :subid("13_1268929913.19531") :outer("11_1268929913.19531")
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
.sub "compile_sub"  :subid("14_1268929913.19531") :outer("11_1268929913.19531")
    .param pmc param_38 :optional :named("body")
    .param int has_param_38 :opt_flag
    .param pmc param_40 :optional :named("method")
    .param int has_param_40 :opt_flag
    .param pmc param_42 :optional :named("multi")
    .param int has_param_42 :opt_flag
    .param pmc param_44 :optional :named("name")
    .param int has_param_44 :opt_flag
    .param pmc param_46 :optional :named("namespace")
    .param int has_param_46 :opt_flag
    .param pmc param_48 :optional :named("params")
    .param int has_param_48 :opt_flag
    .param pmc param_50 :optional :named("vtable")
    .param int has_param_50 :opt_flag
# .annotate "line", 17
    .const 'Sub' $P126 = "15_1268929913.19531" 
    capture_lex $P126
    new $P37, 'ExceptionHandler'
    set_addr $P37, control_36
    $P37."handle_types"(58)
    push_eh $P37
    if has_param_38, optparam_17
    new $P39, "String"
    assign $P39, "die 'I-i-i ain\\'t got no- bo-dy!'"
    set param_38, $P39
  optparam_17:
    .lex "@body", param_38
    if has_param_40, optparam_18
    new $P41, "Undef"
    set param_40, $P41
  optparam_18:
    .lex "$method", param_40
    if has_param_42, optparam_19
    $P43 = root_new ['parrot';'ResizablePMCArray']
    set param_42, $P43
  optparam_19:
    .lex "@multi", param_42
    if has_param_44, optparam_20
    new $P45, "Undef"
    set param_44, $P45
  optparam_20:
    .lex "$name", param_44
    if has_param_46, optparam_21
    new $P47, "Undef"
    set param_46, $P47
  optparam_21:
    .lex "$namespace", param_46
    if has_param_48, optparam_22
    $P49 = root_new ['parrot';'ResizablePMCArray']
    set param_48, $P49
  optparam_22:
    .lex "@params", param_48
    if has_param_50, optparam_23
    new $P51, "Undef"
    set param_50, $P51
  optparam_23:
    .lex "$vtable", param_50
# .annotate "line", 23
    new $P52, "Undef"
    .lex "$multi", $P52
# .annotate "line", 28
    $P53 = root_new ['parrot';'ResizablePMCArray']
    .lex "@sub_decl", $P53
# .annotate "line", 37
    new $P54, "Undef"
    .lex "$sub", $P54
# .annotate "line", 18
    find_lex $P56, "@params"
    $P57 = "does"($P56, "array")
    if $P57, unless_55_end
    get_hll_global $P58, ["Array"], "new"
    find_lex $P59, "@params"
    $P60 = $P58($P59)
    store_lex "@params", $P60
  unless_55_end:
# .annotate "line", 19
    find_lex $P62, "@body"
    $P63 = "does"($P62, "array")
    if $P63, unless_61_end
    get_hll_global $P64, ["Array"], "new"
    find_lex $P65, "@body"
    $P66 = $P64($P65)
    store_lex "@body", $P66
  unless_61_end:
# .annotate "line", 20
    find_lex $P70, "@multi"
    $P71 = $P70."defined"()
    isfalse $I72, $P71
    unless $I72, unless_69
    new $P68, 'Integer'
    set $P68, $I72
    goto unless_69_end
  unless_69:
    find_lex $P73, "@multi"
    $P74 = "does"($P73, "array")
    set $P68, $P74
  unless_69_end:
    if $P68, unless_67_end
    get_hll_global $P75, ["Array"], "new"
    find_lex $P76, "@multi"
    $P77 = $P75($P76)
    store_lex "@multi", $P77
  unless_67_end:
# .annotate "line", 22
    find_lex $P80, "$method"
    if $P80, if_79
    new $P82, "String"
    assign $P82, ""
    set $P78, $P82
    goto if_79_end
  if_79:
    new $P81, "String"
    assign $P81, ":method"
    set $P78, $P81
  if_79_end:
    store_lex "$method", $P78
# .annotate "line", 23
    find_lex $P85, "@multi"
    if $P85, if_84
    new $P92, "String"
    assign $P92, ""
    set $P83, $P92
    goto if_84_end
  if_84:
    new $P86, 'String'
    set $P86, ":multi("
    find_lex $P87, "@multi"
    $P88 = $P87."join"(", ")
    set $S89, $P88
    concat $P90, $P86, $S89
    concat $P91, $P90, ")"
    set $P83, $P91
  if_84_end:
    store_lex "$multi", $P83
# .annotate "line", 25
    find_lex $P95, "$vtable"
    if $P95, if_94
    new $P105, "String"
    assign $P105, ""
    set $P93, $P105
    goto if_94_end
  if_94:
    find_lex $P98, "$vtable"
    $P99 = $P98."isa"("String")
    if $P99, if_97
    new $P104, "String"
    assign $P104, ":vtable"
    set $P96, $P104
    goto if_97_end
  if_97:
    new $P100, 'String'
    set $P100, ":vtable('"
    find_lex $P101, "$vtable"
    concat $P102, $P100, $P101
    concat $P103, $P102, "')"
    set $P96, $P103
  if_97_end:
    set $P93, $P96
  if_94_end:
    store_lex "$vtable", $P93
# .annotate "line", 28
    get_hll_global $P106, ["Array"], "new"
    new $P107, 'String'
    set $P107, ".namespace "
# .annotate "line", 29
    find_lex $P108, "$namespace"
    $P109 = "pir_namespace"($P108)
    set $S110, $P109
    concat $P111, $P107, $S110
# .annotate "line", 28
    new $P112, 'String'
    set $P112, ".sub '"
    find_lex $P113, "$name"
    concat $P114, $P112, $P113
    concat $P115, $P114, "' "
    find_lex $P116, "$method"
    concat $P117, $P115, $P116
    concat $P118, $P117, " "
    find_lex $P119, "$multi"
    concat $P120, $P118, $P119
    concat $P121, $P120, " "
    find_lex $P122, "$vtable"
    concat $P123, $P121, $P122
# .annotate "line", 31
    find_lex $P124, "@params"
    .const 'Sub' $P126 = "15_1268929913.19531" 
    capture_lex $P126
    $P131 = $P124."map"($P126)
    find_lex $P132, "@body"
    $P133 = $P106($P111, $P123, $P131 :flat, "", $P132 :flat, ".end\n")
# .annotate "line", 28
    store_lex "@sub_decl", $P133
# .annotate "line", 37
    find_lex $P134, "@sub_decl"
    $P135 = $P134."join"("\n")
    store_lex "$sub", $P135
# .annotate "line", 38
    find_lex $P136, "$sub"
    $P137 = "compile"($P136)
# .annotate "line", 17
    .return ($P137)
  control_36:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P138, exception, "payload"
    .return ($P138)
.end


.namespace ["Pir"]
.sub "_block125"  :anon :subid("15_1268929913.19531") :outer("14_1268929913.19531")
    .param pmc param_127
# .annotate "line", 31
    .lex "$param", param_127
    new $P128, 'String'
    set $P128, "\t"
    find_lex $P129, "$param"
    concat $P130, $P128, $P129
    .return ($P130)
.end


.namespace ["Pir"]
.sub "pir_namespace"  :subid("16_1268929913.19531") :outer("11_1268929913.19531")
    .param pmc param_142
# .annotate "line", 41
    new $P141, 'ExceptionHandler'
    set_addr $P141, control_140
    $P141."handle_types"(58)
    push_eh $P141
    .lex "$nsp", param_142
# .annotate "line", 42
    find_lex $P144, "$nsp"
    isa $I145, $P144, "P6protoobject"
    unless $I145, if_143_end
# .annotate "line", 43
    find_lex $P146, "$nsp"
    typeof $S147, $P146
    new $P148, 'String'
    set $P148, $S147
    store_lex "$nsp", $P148
  if_143_end:
# .annotate "line", 46
    find_lex $P151, "$nsp"
    isa $I152, $P151, "String"
    if $I152, if_150
# .annotate "line", 49
    find_lex $P166, "$nsp"
    isa $I167, $P166, "NameSpace"
    if $I167, if_165
# .annotate "line", 54
    find_lex $P170, "$nsp"
    typeof $S171, $P170
    new $P172, 'String'
    set $P172, " "
    find_lex $P173, "$nsp"
    concat $P174, $P172, $P173
    $P175 = "die"("Don't know how to format namespace name of ", $S171, $P174)
# .annotate "line", 52
    set $P164, $P175
# .annotate "line", 49
    goto if_165_end
  if_165:
# .annotate "line", 50
    find_lex $P168, "$nsp"
    $P169 = $P168."string_name"("pir" :named("format"))
# .annotate "line", 49
    set $P164, $P169
  if_165_end:
    set $P149, $P164
# .annotate "line", 46
    goto if_150_end
  if_150:
# .annotate "line", 47
    find_lex $P155, "$nsp"
    if $P155, if_154
    new $P163, "String"
    assign $P163, "[ ]"
    set $P153, $P163
    goto if_154_end
  if_154:
    new $P156, 'String'
    set $P156, "[ '"
    find_lex $P157, "$nsp"
    $P158 = $P157."split"("::")
    $P159 = $P158."join"("'; '")
    set $S160, $P159
    concat $P161, $P156, $S160
    concat $P162, $P161, "' ]"
    set $P153, $P162
  if_154_end:
# .annotate "line", 46
    set $P149, $P153
  if_150_end:
# .annotate "line", 41
    .return ($P149)
  control_140:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P176, exception, "payload"
    .return ($P176)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929907.54522")
# .annotate "line", 0
    get_hll_global $P14, ["Array"], "_block13" 
    capture_lex $P14
# .annotate "line", 9
    get_hll_global $P14, ["Array"], "_block13" 
    capture_lex $P14
    $P978 = $P14()
# .annotate "line", 1
    .return ($P978)
.end


.namespace ["Array"]
.sub "_block13"  :subid("11_1268929907.54522") :outer("10_1268929907.54522")
# .annotate "line", 9
    .const 'Sub' $P911 = "57_1268929907.54522" 
    capture_lex $P911
    .const 'Sub' $P895 = "56_1268929907.54522" 
    capture_lex $P895
    .const 'Sub' $P834 = "55_1268929907.54522" 
    capture_lex $P834
    .const 'Sub' $P825 = "54_1268929907.54522" 
    capture_lex $P825
    .const 'Sub' $P767 = "53_1268929907.54522" 
    capture_lex $P767
    .const 'Sub' $P734 = "51_1268929907.54522" 
    capture_lex $P734
    .const 'Sub' $P709 = "49_1268929907.54522" 
    capture_lex $P709
    .const 'Sub' $P698 = "48_1268929907.54522" 
    capture_lex $P698
    .const 'Sub' $P673 = "46_1268929907.54522" 
    capture_lex $P673
    .const 'Sub' $P644 = "45_1268929907.54522" 
    capture_lex $P644
    .const 'Sub' $P606 = "44_1268929907.54522" 
    capture_lex $P606
    .const 'Sub' $P580 = "42_1268929907.54522" 
    capture_lex $P580
    .const 'Sub' $P573 = "41_1268929907.54522" 
    capture_lex $P573
    .const 'Sub' $P568 = "40_1268929907.54522" 
    capture_lex $P568
    .const 'Sub' $P516 = "39_1268929907.54522" 
    capture_lex $P516
    .const 'Sub' $P507 = "38_1268929907.54522" 
    capture_lex $P507
    .const 'Sub' $P485 = "36_1268929907.54522" 
    capture_lex $P485
    .const 'Sub' $P366 = "35_1268929907.54522" 
    capture_lex $P366
    .const 'Sub' $P348 = "33_1268929907.54522" 
    capture_lex $P348
    .const 'Sub' $P284 = "30_1268929907.54522" 
    capture_lex $P284
    .const 'Sub' $P243 = "28_1268929907.54522" 
    capture_lex $P243
    .const 'Sub' $P234 = "27_1268929907.54522" 
    capture_lex $P234
    .const 'Sub' $P228 = "26_1268929907.54522" 
    capture_lex $P228
    .const 'Sub' $P219 = "25_1268929907.54522" 
    capture_lex $P219
    .const 'Sub' $P210 = "24_1268929907.54522" 
    capture_lex $P210
    .const 'Sub' $P201 = "23_1268929907.54522" 
    capture_lex $P201
    .const 'Sub' $P180 = "21_1268929907.54522" 
    capture_lex $P180
    .const 'Sub' $P163 = "20_1268929907.54522" 
    capture_lex $P163
    .const 'Sub' $P146 = "19_1268929907.54522" 
    capture_lex $P146
    .const 'Sub' $P136 = "18_1268929907.54522" 
    capture_lex $P136
    .const 'Sub' $P126 = "17_1268929907.54522" 
    capture_lex $P126
    .const 'Sub' $P15 = "12_1268929907.54522" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929907.54522" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 185
    .const 'Sub' $P126 = "17_1268929907.54522" 
    capture_lex $P126
    .lex "cmp_numeric", $P126
# .annotate "line", 186
    .const 'Sub' $P136 = "18_1268929907.54522" 
    capture_lex $P136
    .lex "cmp_numeric_R", $P136
# .annotate "line", 187
    .const 'Sub' $P146 = "19_1268929907.54522" 
    capture_lex $P146
    .lex "cmp_string", $P146
# .annotate "line", 188
    .const 'Sub' $P163 = "20_1268929907.54522" 
    capture_lex $P163
    .lex "cmp_string_R", $P163
# .annotate "line", 193
    .const 'Sub' $P180 = "21_1268929907.54522" 
    capture_lex $P180
    .lex "cat", $P180
# .annotate "line", 245
    .const 'Sub' $P201 = "23_1268929907.54522" 
    capture_lex $P201
    .lex "grep_args", $P201
# .annotate "line", 275
    .const 'Sub' $P210 = "24_1268929907.54522" 
    capture_lex $P210
    .lex "join_args", $P210
# .annotate "line", 313
    .const 'Sub' $P219 = "25_1268929907.54522" 
    capture_lex $P219
    .lex "map_args", $P219
# .annotate "line", 327
    .const 'Sub' $P228 = "26_1268929907.54522" 
    capture_lex $P228
    .lex "new", $P228
# .annotate "line", 331
    .const 'Sub' $P234 = "27_1268929907.54522" 
    capture_lex $P234
    .lex "reduce_args", $P234
# .annotate "line", 377
    .const 'Sub' $P243 = "28_1268929907.54522" 
    capture_lex $P243
    .lex "roundrobin", $P243
# .annotate "line", 453
    .const 'Sub' $P284 = "30_1268929907.54522" 
    capture_lex $P284
    .lex "zip", $P284
# .annotate "line", 9
    find_lex $P347, "_pre_initload"
# .annotate "line", 129
    find_lex $P480, "cmp_numeric"
    find_lex $P481, "cmp_numeric_R"
    find_lex $P482, "cmp_string"
    find_lex $P483, "cmp_string_R"
    find_lex $P484, "cat"
# .annotate "line", 241
    find_lex $P579, "grep_args"
# .annotate "line", 260
    find_lex $P643, "join_args"
# .annotate "line", 309
    find_lex $P708, "map_args"
# .annotate "line", 317
    find_lex $P732, "new"
    find_lex $P733, "reduce_args"
# .annotate "line", 354
    find_lex $P824, "roundrobin"
# .annotate "line", 428
    find_lex $P977, "zip"
# .annotate "line", 9
    .return ($P977)
.end


.namespace ["Array"]
.sub "_pre_initload"  :subid("12_1268929907.54522") :outer("11_1268929907.54522")
# .annotate "line", 9
    .const 'Sub' $P111 = "16_1268929907.54522" 
    capture_lex $P111
    .const 'Sub' $P96 = "15_1268929907.54522" 
    capture_lex $P96
    .const 'Sub' $P46 = "13_1268929907.54522" 
    capture_lex $P46
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 11
    get_global $P18, "%Bsearch_compare_func"
    unless_null $P18, vivify_59
    $P18 = root_new ['parrot';'Hash']
    set_global "%Bsearch_compare_func", $P18
  vivify_59:
# .annotate "line", 18
    $P19 = root_new ['parrot';'ResizablePMCArray']
    .lex "@methods", $P19
# .annotate "line", 37
    $P20 = root_new ['parrot';'Hash']
    .lex "%pmcs", $P20
# .annotate "line", 44
    new $P21, "Undef"
    .lex "$from_nsp", $P21
# .annotate "line", 9
    get_global $P22, "%Bsearch_compare_func"
# .annotate "line", 13
    get_hll_global $P23, ["Array"], "cmp_numeric"
    get_global $P24, "%Bsearch_compare_func"
    unless_null $P24, vivify_60
    $P24 = root_new ['parrot';'Hash']
    set_global "%Bsearch_compare_func", $P24
  vivify_60:
    set $P24["<=>"], $P23
# .annotate "line", 14
    get_hll_global $P25, ["Array"], "cmp_numeric_R"
    get_global $P26, "%Bsearch_compare_func"
    unless_null $P26, vivify_61
    $P26 = root_new ['parrot';'Hash']
    set_global "%Bsearch_compare_func", $P26
  vivify_61:
    set $P26["R<=>"], $P25
# .annotate "line", 15
    get_hll_global $P27, ["Array"], "cmp_string"
    get_global $P28, "%Bsearch_compare_func"
    unless_null $P28, vivify_62
    $P28 = root_new ['parrot';'Hash']
    set_global "%Bsearch_compare_func", $P28
  vivify_62:
    set $P28["cmp"], $P27
# .annotate "line", 16
    get_hll_global $P29, ["Array"], "cmp_string_R"
    get_global $P30, "%Bsearch_compare_func"
    unless_null $P30, vivify_63
    $P30 = root_new ['parrot';'Hash']
    set_global "%Bsearch_compare_func", $P30
  vivify_63:
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
    unless_null $P34, vivify_64
    $P34 = root_new ['parrot';'Hash']
    store_lex "%pmcs", $P34
  vivify_64:
    set $P34["ResizablePMCArray"], $P33
# .annotate "line", 41
    find_lex $P35, "@methods"
    clone $P36, $P35
    find_lex $P37, "%pmcs"
    unless_null $P37, vivify_65
    $P37 = root_new ['parrot';'Hash']
    store_lex "%pmcs", $P37
  vivify_65:
    set $P37["ResizableStringArray"], $P36
# .annotate "line", 42
    find_lex $P38, "%pmcs"
    unless_null $P38, vivify_66
    $P38 = root_new ['parrot';'Hash']
  vivify_66:
    set $P39, $P38["ResizableStringArray"]
    unless_null $P39, vivify_67
    new $P39, "Undef"
  vivify_67:
    $P39."push"("append")
# .annotate "line", 44
    get_namespace $P40
    store_lex "$from_nsp", $P40
# .annotate "line", 46
    find_lex $P42, "%pmcs"
    defined $I43, $P42
    unless $I43, for_undef_68
    iter $P41, $P42
    new $P89, 'ExceptionHandler'
    set_addr $P89, loop88_handler
    $P89."handle_types"(65, 67, 66)
    push_eh $P89
  loop88_test:
    unless $P41, loop88_done
    shift $P44, $P41
  loop88_redo:
    .const 'Sub' $P46 = "13_1268929907.54522" 
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
  for_undef_68:
# .annotate "line", 67
    new $P92, "ResizablePMCArray"
    push $P92, "cat"
    push $P92, "roundrobin"
    push $P92, "zip"
    defined $I93, $P92
    unless $I93, for_undef_75
    iter $P91, $P92
    new $P104, 'ExceptionHandler'
    set_addr $P104, loop103_handler
    $P104."handle_types"(65, 67, 66)
    push_eh $P104
  loop103_test:
    unless $P91, loop103_done
    shift $P94, $P91
  loop103_redo:
    .const 'Sub' $P96 = "15_1268929907.54522" 
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
  for_undef_75:
# .annotate "line", 72
    new $P107, "ResizablePMCArray"
    push $P107, "grep"
    push $P107, "join"
    push $P107, "map"
    push $P107, "reduce"
    defined $I108, $P107
    unless $I108, for_undef_78
    iter $P106, $P107
    new $P123, 'ExceptionHandler'
    set_addr $P123, loop122_handler
    $P123."handle_types"(65, 67, 66)
    push_eh $P123
  loop122_test:
    unless $P106, loop122_done
    shift $P109, $P106
  loop122_redo:
    .const 'Sub' $P111 = "16_1268929907.54522" 
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
  for_undef_78:
# .annotate "line", 9
    .return ($P106)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P125, exception, "payload"
    .return ($P125)
.end


.namespace ["Array"]
.sub "_block45"  :anon :subid("13_1268929907.54522") :outer("12_1268929907.54522")
    .param pmc param_50
# .annotate "line", 46
    .const 'Sub' $P65 = "14_1268929907.54522" 
    capture_lex $P65
# .annotate "line", 47
    $P47 = root_new ['parrot';'Hash']
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
    unless_null $P60, vivify_69
    $P60 = root_new ['parrot';'Hash']
  vivify_69:
    set $P61, $P60[$P59]
    unless_null $P61, vivify_70
    new $P61, "Undef"
  vivify_70:
    defined $I62, $P61
    unless $I62, for_undef_71
    iter $P58, $P61
    new $P82, 'ExceptionHandler'
    set_addr $P82, loop81_handler
    $P82."handle_types"(65, 67, 66)
    push_eh $P82
  loop81_test:
    unless $P58, loop81_done
    shift $P63, $P58
  loop81_redo:
    .const 'Sub' $P65 = "14_1268929907.54522" 
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
  for_undef_71:
# .annotate "line", 61
    find_lex $P84, "$from_nsp"
    find_lex $P85, "$to_nsp"
    find_lex $P86, "%export_subs"
    $P87 = $P84."export_to"($P85, $P86)
# .annotate "line", 46
    .return ($P87)
.end


.namespace ["Array"]
.sub "_block64"  :anon :subid("14_1268929907.54522") :outer("13_1268929907.54522")
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
    unless_null $P73, vivify_72
    $P73 = root_new ['parrot';'Hash']
  vivify_72:
    set $P74, $P73[$P72]
    unless_null $P74, vivify_73
    new $P74, "Undef"
  vivify_73:
    find_lex $P75, "$_"
    find_lex $P76, "%export_subs"
    unless_null $P76, vivify_74
    $P76 = root_new ['parrot';'Hash']
    store_lex "%export_subs", $P76
  vivify_74:
    set $P76[$P75], $P74
# .annotate "line", 52
    set $P67, $P74
  if_68_end:
# .annotate "line", 51
    .return ($P67)
.end


.namespace ["Array"]
.sub "_block95"  :anon :subid("15_1268929907.54522") :outer("12_1268929907.54522")
    .param pmc param_97
# .annotate "line", 67
    .lex "$_", param_97
# .annotate "line", 68
    get_hll_global $P98, ["Global"], "inject_root_symbol"
    find_lex $P99, "$_"
    find_lex $P100, "$from_nsp"
    unless_null $P100, vivify_76
    $P100 = root_new ['parrot';'Hash']
  vivify_76:
    set $P101, $P100[$P99]
    unless_null $P101, vivify_77
    new $P101, "Undef"
  vivify_77:
    $P102 = $P98($P101)
# .annotate "line", 67
    .return ($P102)
.end


.namespace ["Array"]
.sub "_block110"  :anon :subid("16_1268929907.54522") :outer("12_1268929907.54522")
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
.sub "cmp_numeric"  :subid("17_1268929907.54522") :outer("11_1268929907.54522")
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
.sub "cmp_numeric_R"  :subid("18_1268929907.54522") :outer("11_1268929907.54522")
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
.sub "cmp_string"  :subid("19_1268929907.54522") :outer("11_1268929907.54522")
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
.sub "cmp_string_R"  :subid("20_1268929907.54522") :outer("11_1268929907.54522")
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
.sub "cat"  :subid("21_1268929907.54522") :outer("11_1268929907.54522")
    .param pmc param_183 :slurpy
# .annotate "line", 193
    .const 'Sub' $P191 = "22_1268929907.54522" 
    capture_lex $P191
    new $P182, 'ExceptionHandler'
    set_addr $P182, control_181
    $P182."handle_types"(58)
    push_eh $P182
    .lex "@sources", param_183
# .annotate "line", 194
    $P184 = root_new ['parrot';'ResizablePMCArray']
    .lex "@cat", $P184
# .annotate "line", 193
    find_lex $P185, "@cat"
# .annotate "line", 196
    find_lex $P187, "@sources"
    defined $I188, $P187
    unless $I188, for_undef_79
    iter $P186, $P187
    new $P197, 'ExceptionHandler'
    set_addr $P197, loop196_handler
    $P197."handle_types"(65, 67, 66)
    push_eh $P197
  loop196_test:
    unless $P186, loop196_done
    shift $P189, $P186
  loop196_redo:
    .const 'Sub' $P191 = "22_1268929907.54522" 
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
  for_undef_79:
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
.sub "_block190"  :anon :subid("22_1268929907.54522") :outer("21_1268929907.54522")
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
.sub "grep_args"  :subid("23_1268929907.54522") :outer("11_1268929907.54522")
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
.sub "join_args"  :subid("24_1268929907.54522") :outer("11_1268929907.54522")
    .param pmc param_213
    .param pmc param_214 :slurpy
# .annotate "line", 275
    new $P212, 'ExceptionHandler'
    set_addr $P212, control_211
    $P212."handle_types"(58)
    push_eh $P212
    .lex "$delim", param_213
    .lex "@args", param_214
# .annotate "line", 276
    find_lex $P215, "@args"
    find_lex $P216, "$delim"
    $P217 = $P215."join"($P216)
# .annotate "line", 275
    .return ($P217)
  control_211:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P218, exception, "payload"
    .return ($P218)
.end


.namespace ["Array"]
.sub "map_args"  :subid("25_1268929907.54522") :outer("11_1268929907.54522")
    .param pmc param_222
    .param pmc param_223 :slurpy
# .annotate "line", 313
    new $P221, 'ExceptionHandler'
    set_addr $P221, control_220
    $P221."handle_types"(58)
    push_eh $P221
    .lex "&func", param_222
    .lex "@args", param_223
# .annotate "line", 314
    find_lex $P224, "@args"
    find_lex $P225, "&func"
    $P226 = $P224."map"($P225)
# .annotate "line", 313
    .return ($P226)
  control_220:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P227, exception, "payload"
    .return ($P227)
.end


.namespace ["Array"]
.sub "new"  :subid("26_1268929907.54522") :outer("11_1268929907.54522")
    .param pmc param_231 :slurpy
# .annotate "line", 327
    new $P230, 'ExceptionHandler'
    set_addr $P230, control_229
    $P230."handle_types"(58)
    push_eh $P230
    .lex "@elements", param_231
    find_lex $P232, "@elements"
    .return ($P232)
  control_229:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P233, exception, "payload"
    .return ($P233)
.end


.namespace ["Array"]
.sub "reduce_args"  :subid("27_1268929907.54522") :outer("11_1268929907.54522")
    .param pmc param_237
    .param pmc param_238 :slurpy
# .annotate "line", 331
    new $P236, 'ExceptionHandler'
    set_addr $P236, control_235
    $P236."handle_types"(58)
    push_eh $P236
    .lex "&expression", param_237
    .lex "@values", param_238
# .annotate "line", 332
    find_lex $P239, "@values"
    find_lex $P240, "&expression"
    $P241 = $P239."reduce"($P240)
# .annotate "line", 331
    .return ($P241)
  control_235:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P242, exception, "payload"
    .return ($P242)
.end


.namespace ["Array"]
.sub "roundrobin"  :subid("28_1268929907.54522") :outer("11_1268929907.54522")
    .param pmc param_246 :slurpy
# .annotate "line", 377
    .const 'Sub' $P260 = "29_1268929907.54522" 
    capture_lex $P260
    new $P245, 'ExceptionHandler'
    set_addr $P245, control_244
    $P245."handle_types"(58)
    push_eh $P245
    .lex "@sources", param_246
# .annotate "line", 378
    $P247 = root_new ['parrot';'ResizablePMCArray']
    .lex "@result", $P247
# .annotate "line", 379
    new $P248, "Undef"
    .lex "$i", $P248
# .annotate "line", 380
    new $P249, "Undef"
    .lex "$done", $P249
# .annotate "line", 377
    find_lex $P250, "@result"
# .annotate "line", 379
    new $P251, "Integer"
    assign $P251, 0
    store_lex "$i", $P251
    find_lex $P252, "$done"
# .annotate "line", 382
    new $P280, 'ExceptionHandler'
    set_addr $P280, loop279_handler
    $P280."handle_types"(65, 67, 66)
    push_eh $P280
  loop279_test:
    find_lex $P253, "$done"
    if $P253, loop279_done
  loop279_redo:
# .annotate "line", 383
    new $P254, "Integer"
    assign $P254, 1
    store_lex "$done", $P254
# .annotate "line", 385
    find_lex $P256, "@sources"
    defined $I257, $P256
    unless $I257, for_undef_80
    iter $P255, $P256
    new $P277, 'ExceptionHandler'
    set_addr $P277, loop276_handler
    $P277."handle_types"(65, 67, 66)
    push_eh $P277
  loop276_test:
    unless $P255, loop276_done
    shift $P258, $P255
  loop276_redo:
    .const 'Sub' $P260 = "29_1268929907.54522" 
    capture_lex $P260
    $P260($P258)
  loop276_next:
    goto loop276_test
  loop276_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P278, exception, 'type'
    eq $P278, 65, loop276_next
    eq $P278, 67, loop276_redo
  loop276_done:
    pop_eh 
  for_undef_80:
  loop279_next:
# .annotate "line", 382
    goto loop279_test
  loop279_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P281, exception, 'type'
    eq $P281, 65, loop279_next
    eq $P281, 67, loop279_redo
  loop279_done:
    pop_eh 
    find_lex $P282, "@result"
# .annotate "line", 377
    .return ($P282)
  control_244:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P283, exception, "payload"
    .return ($P283)
.end


.namespace ["Array"]
.sub "_block259"  :anon :subid("29_1268929907.54522") :outer("28_1268929907.54522")
    .param pmc param_261
# .annotate "line", 385
    .lex "@a", param_261
# .annotate "line", 386
    find_lex $P264, "@a"
    $N265 = $P264."elems"()
    find_lex $P266, "$i"
    set $N267, $P266
    isgt $I268, $N265, $N267
    if $I268, if_263
    new $P262, 'Integer'
    set $P262, $I268
    goto if_263_end
  if_263:
# .annotate "line", 387
    new $P269, "Integer"
    assign $P269, 0
    store_lex "$done", $P269
# .annotate "line", 388
    find_lex $P270, "@result"
    find_lex $P271, "$i"
    set $I272, $P271
    find_lex $P273, "@a"
    unless_null $P273, vivify_81
    $P273 = root_new ['parrot';'ResizablePMCArray']
  vivify_81:
    set $P274, $P273[$I272]
    unless_null $P274, vivify_82
    new $P274, "Undef"
  vivify_82:
    $P275 = $P270."push"($P274)
# .annotate "line", 386
    set $P262, $P275
  if_263_end:
# .annotate "line", 385
    .return ($P262)
.end


.namespace ["Array"]
.sub "zip"  :subid("30_1268929907.54522") :outer("11_1268929907.54522")
    .param pmc param_287 :slurpy
# .annotate "line", 453
    .const 'Sub' $P329 = "32_1268929907.54522" 
    capture_lex $P329
    .const 'Sub' $P304 = "31_1268929907.54522" 
    capture_lex $P304
    new $P286, 'ExceptionHandler'
    set_addr $P286, control_285
    $P286."handle_types"(58)
    push_eh $P286
    .lex "@sources", param_287
# .annotate "line", 454
    $P288 = root_new ['parrot';'ResizablePMCArray']
    .lex "@result", $P288
# .annotate "line", 455
    new $P289, "Undef"
    .lex "$limit", $P289
# .annotate "line", 466
    new $P290, "Undef"
    .lex "$i", $P290
# .annotate "line", 453
    find_lex $P291, "@result"
# .annotate "line", 455
    new $P292, "Integer"
    assign $P292, 0
    store_lex "$limit", $P292
# .annotate "line", 457
    find_lex $P294, "@sources"
    $P295 = $P294."elems"()
    unless $P295, if_293_end
# .annotate "line", 458
    find_lex $P296, "@sources"
    unless_null $P296, vivify_83
    $P296 = root_new ['parrot';'ResizablePMCArray']
  vivify_83:
    set $P297, $P296[0]
    unless_null $P297, vivify_84
    new $P297, "Undef"
  vivify_84:
    $P298 = $P297."elems"()
    store_lex "$limit", $P298
  if_293_end:
# .annotate "line", 461
    find_lex $P300, "@sources"
    defined $I301, $P300
    unless $I301, for_undef_85
    iter $P299, $P300
    new $P316, 'ExceptionHandler'
    set_addr $P316, loop315_handler
    $P316."handle_types"(65, 67, 66)
    push_eh $P316
  loop315_test:
    unless $P299, loop315_done
    shift $P302, $P299
  loop315_redo:
    .const 'Sub' $P304 = "31_1268929907.54522" 
    capture_lex $P304
    $P304($P302)
  loop315_next:
    goto loop315_test
  loop315_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P317, exception, 'type'
    eq $P317, 65, loop315_next
    eq $P317, 67, loop315_redo
  loop315_done:
    pop_eh 
  for_undef_85:
# .annotate "line", 466
    new $P318, "Integer"
    assign $P318, 0
    store_lex "$i", $P318
# .annotate "line", 468
    new $P343, 'ExceptionHandler'
    set_addr $P343, loop342_handler
    $P343."handle_types"(65, 67, 66)
    push_eh $P343
  loop342_test:
    find_lex $P319, "$i"
    set $N320, $P319
    find_lex $P321, "$limit"
    set $N322, $P321
    islt $I323, $N320, $N322
    unless $I323, loop342_done
  loop342_redo:
# .annotate "line", 469
    find_lex $P325, "@sources"
    defined $I326, $P325
    unless $I326, for_undef_86
    iter $P324, $P325
    new $P338, 'ExceptionHandler'
    set_addr $P338, loop337_handler
    $P338."handle_types"(65, 67, 66)
    push_eh $P338
  loop337_test:
    unless $P324, loop337_done
    shift $P327, $P324
  loop337_redo:
    .const 'Sub' $P329 = "32_1268929907.54522" 
    capture_lex $P329
    $P329($P327)
  loop337_next:
    goto loop337_test
  loop337_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P339, exception, 'type'
    eq $P339, 65, loop337_next
    eq $P339, 67, loop337_redo
  loop337_done:
    pop_eh 
  for_undef_86:
    find_lex $P340, "$i"
    clone $P341, $P340
    inc $P340
  loop342_next:
# .annotate "line", 468
    goto loop342_test
  loop342_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P344, exception, 'type'
    eq $P344, 65, loop342_next
    eq $P344, 67, loop342_redo
  loop342_done:
    pop_eh 
    find_lex $P345, "@result"
# .annotate "line", 453
    .return ($P345)
  control_285:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P346, exception, "payload"
    .return ($P346)
.end


.namespace ["Array"]
.sub "_block303"  :anon :subid("31_1268929907.54522") :outer("30_1268929907.54522")
    .param pmc param_305
# .annotate "line", 461
    .lex "@a", param_305
# .annotate "line", 463
    find_lex $P308, "@a"
    $N309 = $P308."elems"()
    find_lex $P310, "$limit"
    set $N311, $P310
    islt $I312, $N309, $N311
    if $I312, if_307
    new $P306, 'Integer'
    set $P306, $I312
    goto if_307_end
  if_307:
# .annotate "line", 462
    find_lex $P313, "@a"
    $P314 = $P313."elems"()
    store_lex "$limit", $P314
    set $P306, $P314
  if_307_end:
# .annotate "line", 461
    .return ($P306)
.end


.namespace ["Array"]
.sub "_block328"  :anon :subid("32_1268929907.54522") :outer("30_1268929907.54522")
    .param pmc param_330
# .annotate "line", 469
    .lex "@a", param_330
# .annotate "line", 470
    find_lex $P331, "@result"
    find_lex $P332, "$i"
    set $I333, $P332
    find_lex $P334, "@a"
    unless_null $P334, vivify_87
    $P334 = root_new ['parrot';'ResizablePMCArray']
  vivify_87:
    set $P335, $P334[$I333]
    unless_null $P335, vivify_88
    new $P335, "Undef"
  vivify_88:
    $P336 = $P331."push"($P335)
# .annotate "line", 469
    .return ($P336)
.end


.namespace ["Array"]
.sub "append"  :subid("33_1268929907.54522") :method :outer("11_1268929907.54522")
    .param pmc param_351
# .annotate "line", 80
    .const 'Sub' $P357 = "34_1268929907.54522" 
    capture_lex $P357
    new $P350, 'ExceptionHandler'
    set_addr $P350, control_349
    $P350."handle_types"(58)
    push_eh $P350
    .lex "self", self
    .lex "@other", param_351
# .annotate "line", 81
    find_lex $P353, "@other"
    defined $I354, $P353
    unless $I354, for_undef_89
    iter $P352, $P353
    new $P363, 'ExceptionHandler'
    set_addr $P363, loop362_handler
    $P363."handle_types"(65, 67, 66)
    push_eh $P363
  loop362_test:
    unless $P352, loop362_done
    shift $P355, $P352
  loop362_redo:
    .const 'Sub' $P357 = "34_1268929907.54522" 
    capture_lex $P357
    $P357($P355)
  loop362_next:
    goto loop362_test
  loop362_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P364, exception, 'type'
    eq $P364, 65, loop362_next
    eq $P364, 67, loop362_redo
  loop362_done:
    pop_eh 
  for_undef_89:
# .annotate "line", 80
    .return ($P352)
  control_349:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P365, exception, "payload"
    .return ($P365)
.end


.namespace ["Array"]
.sub "_block356"  :anon :subid("34_1268929907.54522") :outer("33_1268929907.54522")
    .param pmc param_358
# .annotate "line", 81
    .lex "$_", param_358
# .annotate "line", 82
    find_lex $P359, "self"
    find_lex $P360, "$_"
    $P361 = $P359."push"($P360)
# .annotate "line", 81
    .return ($P361)
.end


.namespace ["Array"]
.sub "bsearch"  :subid("35_1268929907.54522") :method :outer("11_1268929907.54522")
    .param pmc param_369
    .param pmc param_370 :slurpy :named
# .annotate "line", 129
    new $P368, 'ExceptionHandler'
    set_addr $P368, control_367
    $P368."handle_types"(58)
    push_eh $P368
    .lex "self", self
    .lex "$value", param_369
    .lex "%opts", param_370
# .annotate "line", 130
    get_global $P371, "%Bsearch_compare_func"
    unless_null $P371, vivify_90
    $P371 = root_new ['parrot';'Hash']
    set_global "%Bsearch_compare_func", $P371
  vivify_90:
# .annotate "line", 132
    new $P372, "Undef"
    .lex "$cmp", $P372
# .annotate "line", 133
    new $P373, "Undef"
    .lex "$high", $P373
# .annotate "line", 134
    new $P374, "Undef"
    .lex "$low", $P374
# .annotate "line", 135
    new $P375, "Undef"
    .lex "$top", $P375
# .annotate "line", 137
    new $P376, "Undef"
    .lex "$elts", $P376
# .annotate "line", 142
    new $P377, "Undef"
    .lex "&comparator", $P377
# .annotate "line", 150
    new $P378, "Undef"
    .lex "$mid", $P378
# .annotate "line", 175
    new $P379, "Undef"
    .lex "$result", $P379
# .annotate "line", 129
    get_global $P380, "%Bsearch_compare_func"
# .annotate "line", 132
    find_lex $P383, "%opts"
    unless_null $P383, vivify_91
    $P383 = root_new ['parrot';'Hash']
  vivify_91:
    set $P384, $P383["cmp"]
    unless_null $P384, vivify_92
    new $P384, "Undef"
  vivify_92:
    if $P384, if_382
    new $P387, "String"
    assign $P387, "<=>"
    set $P381, $P387
    goto if_382_end
  if_382:
    find_lex $P385, "%opts"
    unless_null $P385, vivify_93
    $P385 = root_new ['parrot';'Hash']
  vivify_93:
    set $P386, $P385["cmp"]
    unless_null $P386, vivify_94
    new $P386, "Undef"
  vivify_94:
    set $P381, $P386
  if_382_end:
    store_lex "$cmp", $P381
# .annotate "line", 133
    find_lex $P390, "%opts"
    unless_null $P390, vivify_95
    $P390 = root_new ['parrot';'Hash']
  vivify_95:
    set $P391, $P390["high"]
    unless_null $P391, vivify_96
    new $P391, "Undef"
  vivify_96:
    set $N392, $P391
    isgt $I393, $N392, 0.0
    if $I393, if_389
    find_lex $P396, "self"
    $P397 = $P396."elems"()
    set $P388, $P397
    goto if_389_end
  if_389:
    find_lex $P394, "%opts"
    unless_null $P394, vivify_97
    $P394 = root_new ['parrot';'Hash']
  vivify_97:
    set $P395, $P394["high"]
    unless_null $P395, vivify_98
    new $P395, "Undef"
  vivify_98:
    set $P388, $P395
  if_389_end:
    store_lex "$high", $P388
# .annotate "line", 134
    new $P398, "Integer"
    assign $P398, 0
    find_lex $P399, "%opts"
    unless_null $P399, vivify_99
    $P399 = root_new ['parrot';'Hash']
  vivify_99:
    set $P400, $P399["low"]
    unless_null $P400, vivify_100
    new $P400, "Undef"
  vivify_100:
    add $P401, $P398, $P400
    store_lex "$low", $P401
# .annotate "line", 135
    find_lex $P402, "$high"
    store_lex "$top", $P402
# .annotate "line", 137
    find_lex $P403, "self"
    $P404 = $P403."elems"()
    store_lex "$elts", $P404
# .annotate "line", 139
    find_lex $P406, "$high"
    set $N407, $P406
    find_lex $P408, "$elts"
    set $N409, $P408
    isgt $I410, $N407, $N409
    unless $I410, if_405_end
    find_lex $P411, "$elts"
    store_lex "$high", $P411
  if_405_end:
# .annotate "line", 140
    find_lex $P413, "$low"
    set $N414, $P413
    islt $I415, $N414, 0.0
    unless $I415, if_412_end
    find_lex $P416, "$low"
    find_lex $P417, "$elts"
    add $P418, $P416, $P417
    store_lex "$low", $P418
  if_412_end:
# .annotate "line", 142
    get_global $P421, "%Bsearch_compare_func"
    find_lex $P422, "$cmp"
    $P423 = $P421."contains"($P422)
    if $P423, if_420
    find_lex $P427, "$cmp"
    set $P419, $P427
    goto if_420_end
  if_420:
    find_lex $P424, "$cmp"
    get_global $P425, "%Bsearch_compare_func"
    unless_null $P425, vivify_101
    $P425 = root_new ['parrot';'Hash']
  vivify_101:
    set $P426, $P425[$P424]
    unless_null $P426, vivify_102
    new $P426, "Undef"
  vivify_102:
    set $P419, $P426
  if_420_end:
# .annotate "line", 143
    store_lex "&comparator", $P419
# .annotate "line", 146
    find_lex $P431, "&comparator"
    $P432 = $P431."isa"("Sub")
    unless $P432, unless_430
    set $P429, $P432
    goto unless_430_end
  unless_430:
    find_lex $P433, "&comparator"
    $P434 = $P433."isa"("MultiSub")
    set $P429, $P434
  unless_430_end:
    if $P429, unless_428_end
# .annotate "line", 147
    get_hll_global $P435, ["Opcode"], "die"
    $P435("Bsearch :cmp function parameter was not a (Multi)Sub")
  unless_428_end:
# .annotate "line", 146
    find_lex $P436, "$mid"
# .annotate "line", 152
    new $P456, 'ExceptionHandler'
    set_addr $P456, loop455_handler
    $P456."handle_types"(65, 67, 66)
    push_eh $P456
  loop455_test:
    find_lex $P437, "$low"
    set $N438, $P437
    find_lex $P439, "$high"
    set $N440, $P439
    islt $I441, $N438, $N440
    unless $I441, loop455_done
  loop455_redo:
# .annotate "line", 155

			.local int high, low
			$P0 = find_lex '$high'
			high = $P0
			$P0 = find_lex '$low'
			low = $P0
			$I0 = high - low
			$I0 = $I0 / 2
			$I0 = $I0 + low
			$P442 = box $I0
		
    store_lex "$mid", $P442
# .annotate "line", 167
    find_lex $P444, "&comparator"
    find_lex $P445, "$mid"
    set $I446, $P445
    find_lex $P447, "self"
    unless_null $P447, vivify_103
    $P447 = root_new ['parrot';'ResizablePMCArray']
  vivify_103:
    set $P448, $P447[$I446]
    unless_null $P448, vivify_104
    new $P448, "Undef"
  vivify_104:
    find_lex $P449, "$value"
    $N450 = $P444($P448, $P449)
    islt $I451, $N450, 0.0
    if $I451, if_443
# .annotate "line", 171
    find_lex $P454, "$mid"
    store_lex "$high", $P454
# .annotate "line", 170
    goto if_443_end
  if_443:
# .annotate "line", 168
    find_lex $P452, "$mid"
    add $P453, $P452, 1
    store_lex "$low", $P453
  if_443_end:
  loop455_next:
# .annotate "line", 152
    goto loop455_test
  loop455_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P457, exception, 'type'
    eq $P457, 65, loop455_next
    eq $P457, 67, loop455_redo
  loop455_done:
    pop_eh 
# .annotate "line", 175
    find_lex $P458, "$low"
    add $P459, $P458, 1
    neg $P460, $P459
    store_lex "$result", $P460
# .annotate "line", 177
    find_lex $P464, "$low"
    set $N465, $P464
    find_lex $P466, "$top"
    set $N467, $P466
    islt $I468, $N465, $N467
    if $I468, if_463
    new $P462, 'Integer'
    set $P462, $I468
    goto if_463_end
  if_463:
# .annotate "line", 178
    find_lex $P469, "&comparator"
    find_lex $P470, "$low"
    set $I471, $P470
    find_lex $P472, "self"
    unless_null $P472, vivify_105
    $P472 = root_new ['parrot';'ResizablePMCArray']
  vivify_105:
    set $P473, $P472[$I471]
    unless_null $P473, vivify_106
    new $P473, "Undef"
  vivify_106:
    find_lex $P474, "$value"
    $N475 = $P469($P473, $P474)
    iseq $I476, $N475, 0.0
    new $P462, 'Integer'
    set $P462, $I476
  if_463_end:
    unless $P462, if_461_end
# .annotate "line", 179
    find_lex $P477, "$low"
    store_lex "$result", $P477
  if_461_end:
# .annotate "line", 177
    find_lex $P478, "$result"
# .annotate "line", 129
    .return ($P478)
  control_367:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P479, exception, "payload"
    .return ($P479)
.end


.namespace ["Array"]
.sub "contains"  :subid("36_1268929907.54522") :method :outer("11_1268929907.54522")
    .param pmc param_488
# .annotate "line", 203
    .const 'Sub' $P494 = "37_1268929907.54522" 
    capture_lex $P494
    new $P487, 'ExceptionHandler'
    set_addr $P487, control_486
    $P487."handle_types"(58)
    push_eh $P487
    .lex "self", self
    .lex "$item", param_488
# .annotate "line", 204
    find_lex $P490, "self"
    defined $I491, $P490
    unless $I491, for_undef_107
    iter $P489, $P490
    new $P504, 'ExceptionHandler'
    set_addr $P504, loop503_handler
    $P504."handle_types"(65, 67, 66)
    push_eh $P504
  loop503_test:
    unless $P489, loop503_done
    shift $P492, $P489
  loop503_redo:
    .const 'Sub' $P494 = "37_1268929907.54522" 
    capture_lex $P494
    $P494($P492)
  loop503_next:
    goto loop503_test
  loop503_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P505, exception, 'type'
    eq $P505, 65, loop503_next
    eq $P505, 67, loop503_redo
  loop503_done:
    pop_eh 
  for_undef_107:
# .annotate "line", 203
    .return (0)
  control_486:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P506, exception, "payload"
    .return ($P506)
.end


.namespace ["Array"]
.sub "_block493"  :anon :subid("37_1268929907.54522") :outer("36_1268929907.54522")
    .param pmc param_495
# .annotate "line", 204
    .lex "$_", param_495
# .annotate "line", 205
    find_lex $P498, "$item"
    find_lex $P499, "$_"
    iseq $I500, $P498, $P499
    if $I500, if_497
    new $P496, 'Integer'
    set $P496, $I500
    goto if_497_end
  if_497:
# .annotate "line", 206
    new $P501, "Exception"
    set $P501['type'], 58
    new $P502, "Integer"
    assign $P502, 1
    setattribute $P501, 'payload', $P502
    throw $P501
  if_497_end:
# .annotate "line", 204
    .return ($P496)
.end


.namespace ["Array"]
.sub "delete"  :subid("38_1268929907.54522") :method :outer("11_1268929907.54522")
    .param pmc param_510
# .annotate "line", 213
    new $P509, 'ExceptionHandler'
    set_addr $P509, control_508
    $P509."handle_types"(58)
    push_eh $P509
    .lex "self", self
    .lex "$key", param_510
# .annotate "line", 214
    get_hll_global $P511, ["Opcode"], "delete"
    find_lex $P512, "self"
    find_lex $P513, "$key"
    $P511($P512, $P513)
    find_lex $P514, "self"
# .annotate "line", 213
    .return ($P514)
  control_508:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P515, exception, "payload"
    .return ($P515)
.end


.namespace ["Array"]
.sub "distinct"  :subid("39_1268929907.54522") :method :outer("11_1268929907.54522")
    .param pmc param_519 :optional :named("cmp")
    .param int has_param_519 :opt_flag
# .annotate "line", 218
    new $P518, 'ExceptionHandler'
    set_addr $P518, control_517
    $P518."handle_types"(58)
    push_eh $P518
    .lex "self", self
    if has_param_519, optparam_108
    get_hll_global $P520, ["Array"], "cmp_string"
    set param_519, $P520
  optparam_108:
    .lex "&cmp", param_519
# .annotate "line", 219
    new $P521, "Undef"
    .lex "$elems", $P521
# .annotate "line", 220
    new $P522, "Undef"
    .lex "$i", $P522
# .annotate "line", 221
    new $P523, "Undef"
    .lex "$j", $P523
# .annotate "line", 222
    new $P524, "Undef"
    .lex "$array_i", $P524
# .annotate "line", 219
    find_lex $P525, "self"
    $P526 = $P525."elems"()
    store_lex "$elems", $P526
# .annotate "line", 220
    new $P527, "Integer"
    assign $P527, 0
    store_lex "$i", $P527
    find_lex $P528, "$j"
    find_lex $P529, "$array_i"
# .annotate "line", 224
    new $P564, 'ExceptionHandler'
    set_addr $P564, loop563_handler
    $P564."handle_types"(65, 67, 66)
    push_eh $P564
  loop563_test:
    find_lex $P530, "$i"
    set $N531, $P530
    find_lex $P532, "$elems"
    set $N533, $P532
    islt $I534, $N531, $N533
    unless $I534, loop563_done
  loop563_redo:
# .annotate "line", 225
    find_lex $P535, "$i"
    set $I536, $P535
    find_lex $P537, "self"
    unless_null $P537, vivify_109
    $P537 = root_new ['parrot';'ResizablePMCArray']
  vivify_109:
    set $P538, $P537[$I536]
    unless_null $P538, vivify_110
    new $P538, "Undef"
  vivify_110:
    store_lex "$array_i", $P538
    find_lex $P539, "$i"
    clone $P540, $P539
    inc $P539
# .annotate "line", 228
    new $P561, 'ExceptionHandler'
    set_addr $P561, loop560_handler
    $P561."handle_types"(65, 67, 66)
    push_eh $P561
  loop560_test:
    find_lex $P543, "$i"
    set $N544, $P543
    find_lex $P545, "$elems"
    set $N546, $P545
    islt $I547, $N544, $N546
    if $I547, if_542
    new $P541, 'Integer'
    set $P541, $I547
    goto if_542_end
  if_542:
    find_lex $P548, "&cmp"
    find_lex $P549, "$array_i"
    find_lex $P550, "$i"
    set $I551, $P550
    find_lex $P552, "self"
    unless_null $P552, vivify_111
    $P552 = root_new ['parrot';'ResizablePMCArray']
  vivify_111:
    set $P553, $P552[$I551]
    unless_null $P553, vivify_112
    new $P553, "Undef"
  vivify_112:
    $N554 = $P548($P549, $P553)
    iseq $I555, $N554, 0.0
    new $P541, 'Integer'
    set $P541, $I555
  if_542_end:
    unless $P541, loop560_done
  loop560_redo:
# .annotate "line", 229
    find_lex $P556, "self"
    find_lex $P557, "$i"
    $P556."delete"($P557)
    find_lex $P558, "$elems"
    clone $P559, $P558
    dec $P558
  loop560_next:
# .annotate "line", 228
    goto loop560_test
  loop560_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P562, exception, 'type'
    eq $P562, 65, loop560_next
    eq $P562, 67, loop560_redo
  loop560_done:
    pop_eh 
  loop563_next:
# .annotate "line", 224
    goto loop563_test
  loop563_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P565, exception, 'type'
    eq $P565, 65, loop563_next
    eq $P565, 67, loop563_redo
  loop563_done:
    pop_eh 
    find_lex $P566, "self"
# .annotate "line", 218
    .return ($P566)
  control_517:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P567, exception, "payload"
    .return ($P567)
.end


.namespace ["Array"]
.sub "elements"  :subid("40_1268929907.54522") :method :outer("11_1268929907.54522")
# .annotate "line", 237
    new $P570, 'ExceptionHandler'
    set_addr $P570, control_569
    $P570."handle_types"(58)
    push_eh $P570
    .lex "self", self
# .annotate "line", 238
    $P571 = "die"("No more elements! Use .elems")
# .annotate "line", 237
    .return ($P571)
  control_569:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P572, exception, "payload"
    .return ($P572)
.end


.namespace ["Array"]
.sub "elems"  :subid("41_1268929907.54522") :method :outer("11_1268929907.54522")
# .annotate "line", 241
    new $P575, 'ExceptionHandler'
    set_addr $P575, control_574
    $P575."handle_types"(58)
    push_eh $P575
    .lex "self", self
# .annotate "line", 242
    find_lex $P576, "self"
    elements $I577, $P576
# .annotate "line", 241
    .return ($I577)
  control_574:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P578, exception, "payload"
    .return ($P578)
.end


.namespace ["Array"]
.sub "grep"  :subid("42_1268929907.54522") :method :outer("11_1268929907.54522")
    .param pmc param_583
# .annotate "line", 249
    .const 'Sub' $P591 = "43_1268929907.54522" 
    capture_lex $P591
    new $P582, 'ExceptionHandler'
    set_addr $P582, control_581
    $P582."handle_types"(58)
    push_eh $P582
    .lex "self", self
    .lex "&match", param_583
# .annotate "line", 250
    $P584 = root_new ['parrot';'ResizablePMCArray']
    .lex "@matches", $P584
# .annotate "line", 249
    find_lex $P585, "@matches"
# .annotate "line", 252
    find_lex $P587, "self"
    defined $I588, $P587
    unless $I588, for_undef_113
    iter $P586, $P587
    new $P602, 'ExceptionHandler'
    set_addr $P602, loop601_handler
    $P602."handle_types"(65, 67, 66)
    push_eh $P602
  loop601_test:
    unless $P586, loop601_done
    shift $P589, $P586
  loop601_redo:
    .const 'Sub' $P591 = "43_1268929907.54522" 
    capture_lex $P591
    $P591($P589)
  loop601_next:
    goto loop601_test
  loop601_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P603, exception, 'type'
    eq $P603, 65, loop601_next
    eq $P603, 67, loop601_redo
  loop601_done:
    pop_eh 
  for_undef_113:
    find_lex $P604, "@matches"
# .annotate "line", 249
    .return ($P604)
  control_581:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P605, exception, "payload"
    .return ($P605)
.end


.namespace ["Array"]
.sub "_block590"  :anon :subid("43_1268929907.54522") :outer("42_1268929907.54522")
    .param pmc param_592
# .annotate "line", 252
    .lex "$_", param_592
# .annotate "line", 254
    find_lex $P595, "&match"
    find_lex $P596, "$_"
    $P597 = $P595($P596)
    if $P597, if_594
    set $P593, $P597
    goto if_594_end
  if_594:
# .annotate "line", 253
    find_lex $P598, "@matches"
    find_lex $P599, "$_"
    $P600 = $P598."push"($P599)
    set $P593, $P600
  if_594_end:
# .annotate "line", 252
    .return ($P593)
.end


.namespace ["Array"]
.sub "is_sorted"  :subid("44_1268929907.54522") :method :outer("11_1268929907.54522")
    .param pmc param_609 :optional :named("cmp")
    .param int has_param_609 :opt_flag
# .annotate "line", 260
    new $P608, 'ExceptionHandler'
    set_addr $P608, control_607
    $P608."handle_types"(58)
    push_eh $P608
    .lex "self", self
    if has_param_609, optparam_114
    get_hll_global $P610, ["Array"], "cmp_string"
    set param_609, $P610
  optparam_114:
    .lex "&cmp", param_609
# .annotate "line", 261
    new $P611, "Undef"
    .lex "$index", $P611
# .annotate "line", 262
    new $P612, "Undef"
    .lex "$limit", $P612
# .annotate "line", 261
    new $P613, "Integer"
    assign $P613, 0
    store_lex "$index", $P613
# .annotate "line", 262
    find_lex $P614, "self"
    $P615 = $P614."elems"()
    sub $P616, $P615, 1
    store_lex "$limit", $P616
# .annotate "line", 264
    new $P640, 'ExceptionHandler'
    set_addr $P640, loop639_handler
    $P640."handle_types"(65, 67, 66)
    push_eh $P640
  loop639_test:
    find_lex $P617, "$index"
    set $N618, $P617
    find_lex $P619, "$limit"
    set $N620, $P619
    islt $I621, $N618, $N620
    unless $I621, loop639_done
  loop639_redo:
# .annotate "line", 265
    find_lex $P623, "&cmp"
    find_lex $P624, "$index"
    set $I625, $P624
    find_lex $P626, "self"
    unless_null $P626, vivify_115
    $P626 = root_new ['parrot';'ResizablePMCArray']
  vivify_115:
    set $P627, $P626[$I625]
    unless_null $P627, vivify_116
    new $P627, "Undef"
  vivify_116:
    find_lex $P628, "$index"
    add $P629, $P628, 1
    set $I630, $P629
    find_lex $P631, "self"
    unless_null $P631, vivify_117
    $P631 = root_new ['parrot';'ResizablePMCArray']
  vivify_117:
    set $P632, $P631[$I630]
    unless_null $P632, vivify_118
    new $P632, "Undef"
  vivify_118:
    $N633 = $P623($P627, $P632)
    isgt $I634, $N633, 0.0
    unless $I634, if_622_end
# .annotate "line", 266
    new $P635, "Exception"
    set $P635['type'], 58
    new $P636, "Integer"
    assign $P636, 0
    setattribute $P635, 'payload', $P636
    throw $P635
  if_622_end:
# .annotate "line", 265
    find_lex $P637, "$index"
    clone $P638, $P637
    inc $P637
  loop639_next:
# .annotate "line", 264
    goto loop639_test
  loop639_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P641, exception, 'type'
    eq $P641, 65, loop639_next
    eq $P641, 67, loop639_redo
  loop639_done:
    pop_eh 
# .annotate "line", 260
    .return (1)
  control_607:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P642, exception, "payload"
    .return ($P642)
.end


.namespace ["Array"]
.sub "keys"  :subid("45_1268929907.54522") :method :outer("11_1268929907.54522")
# .annotate "line", 279
    new $P646, 'ExceptionHandler'
    set_addr $P646, control_645
    $P646."handle_types"(58)
    push_eh $P646
    .lex "self", self
# .annotate "line", 280
    $P647 = root_new ['parrot';'ResizablePMCArray']
    .lex "@result", $P647
# .annotate "line", 282
    new $P648, "Undef"
    .lex "$i", $P648
# .annotate "line", 283
    new $P649, "Undef"
    .lex "$limit", $P649
# .annotate "line", 279
    find_lex $P650, "@result"
# .annotate "line", 282
    new $P651, "Integer"
    assign $P651, 0
    store_lex "$i", $P651
# .annotate "line", 283
    find_lex $P652, "self"
    $P653 = $P652."elems"()
    store_lex "$limit", $P653
# .annotate "line", 285
    new $P669, 'ExceptionHandler'
    set_addr $P669, loop668_handler
    $P669."handle_types"(65, 67, 66)
    push_eh $P669
  loop668_test:
    find_lex $P654, "$i"
    set $N655, $P654
    find_lex $P656, "$limit"
    set $N657, $P656
    islt $I658, $N655, $N657
    unless $I658, loop668_done
  loop668_redo:
# .annotate "line", 286
    find_lex $P660, "self"
    find_lex $P661, "$i"
    $P662 = $P660."exists"($P661)
    unless $P662, if_659_end
# .annotate "line", 287
    find_lex $P663, "@result"
    find_lex $P664, "$i"
    $P665 = $P664."clone"()
    $P663."push"($P665)
  if_659_end:
# .annotate "line", 286
    find_lex $P666, "$i"
    clone $P667, $P666
    inc $P666
  loop668_next:
# .annotate "line", 285
    goto loop668_test
  loop668_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P670, exception, 'type'
    eq $P670, 65, loop668_next
    eq $P670, 67, loop668_redo
  loop668_done:
    pop_eh 
    find_lex $P671, "@result"
# .annotate "line", 279
    .return ($P671)
  control_645:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P672, exception, "payload"
    .return ($P672)
.end


.namespace ["Array"]
.sub "kv"  :subid("46_1268929907.54522") :method :outer("11_1268929907.54522")
# .annotate "line", 296
    .const 'Sub' $P685 = "47_1268929907.54522" 
    capture_lex $P685
    new $P675, 'ExceptionHandler'
    set_addr $P675, control_674
    $P675."handle_types"(58)
    push_eh $P675
    .lex "self", self
# .annotate "line", 297
    $P676 = root_new ['parrot';'ResizablePMCArray']
    .lex "@result", $P676
# .annotate "line", 299
    new $P677, "Undef"
    .lex "$i", $P677
# .annotate "line", 296
    find_lex $P678, "@result"
# .annotate "line", 299
    new $P679, "Integer"
    assign $P679, 0
    store_lex "$i", $P679
# .annotate "line", 301
    find_lex $P681, "self"
    defined $I682, $P681
    unless $I682, for_undef_119
    iter $P680, $P681
    new $P694, 'ExceptionHandler'
    set_addr $P694, loop693_handler
    $P694."handle_types"(65, 67, 66)
    push_eh $P694
  loop693_test:
    unless $P680, loop693_done
    shift $P683, $P680
  loop693_redo:
    .const 'Sub' $P685 = "47_1268929907.54522" 
    capture_lex $P685
    $P685($P683)
  loop693_next:
    goto loop693_test
  loop693_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P695, exception, 'type'
    eq $P695, 65, loop693_next
    eq $P695, 67, loop693_redo
  loop693_done:
    pop_eh 
  for_undef_119:
    find_lex $P696, "@result"
# .annotate "line", 296
    .return ($P696)
  control_674:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P697, exception, "payload"
    .return ($P697)
.end


.namespace ["Array"]
.sub "_block684"  :anon :subid("47_1268929907.54522") :outer("46_1268929907.54522")
    .param pmc param_686
# .annotate "line", 301
    .lex "$_", param_686
# .annotate "line", 302
    find_lex $P687, "@result"
    find_lex $P688, "$i"
    $P689 = $P688."clone"()
    $P687."push"($P689)
# .annotate "line", 303
    find_lex $P690, "@result"
    find_lex $P691, "$_"
    $P692 = $P690."push"($P691)
# .annotate "line", 301
    .return ($P692)
.end


.namespace ["Array"]
.sub "join"  :subid("48_1268929907.54522") :method :outer("11_1268929907.54522")
    .param pmc param_701 :optional
    .param int has_param_701 :opt_flag
# .annotate "line", 309
    new $P700, 'ExceptionHandler'
    set_addr $P700, control_699
    $P700."handle_types"(58)
    push_eh $P700
    .lex "self", self
    if has_param_701, optparam_120
    new $P702, "String"
    assign $P702, ""
    set param_701, $P702
  optparam_120:
    .lex "$delim", param_701
# .annotate "line", 310
    find_lex $P703, "$delim"
    set $S704, $P703
    find_lex $P705, "self"
    join $S706, $S704, $P705
# .annotate "line", 309
    .return ($S706)
  control_699:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P707, exception, "payload"
    .return ($P707)
.end


.namespace ["Array"]
.sub "map"  :subid("49_1268929907.54522") :method :outer("11_1268929907.54522")
    .param pmc param_712
# .annotate "line", 317
    .const 'Sub' $P720 = "50_1268929907.54522" 
    capture_lex $P720
    new $P711, 'ExceptionHandler'
    set_addr $P711, control_710
    $P711."handle_types"(58)
    push_eh $P711
    .lex "self", self
    .lex "&func", param_712
# .annotate "line", 318
    $P713 = root_new ['parrot';'ResizablePMCArray']
    .lex "@result", $P713
# .annotate "line", 317
    find_lex $P714, "@result"
# .annotate "line", 320
    find_lex $P716, "self"
    defined $I717, $P716
    unless $I717, for_undef_121
    iter $P715, $P716
    new $P728, 'ExceptionHandler'
    set_addr $P728, loop727_handler
    $P728."handle_types"(65, 67, 66)
    push_eh $P728
  loop727_test:
    unless $P715, loop727_done
    shift $P718, $P715
  loop727_redo:
    .const 'Sub' $P720 = "50_1268929907.54522" 
    capture_lex $P720
    $P720($P718)
  loop727_next:
    goto loop727_test
  loop727_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P729, exception, 'type'
    eq $P729, 65, loop727_next
    eq $P729, 67, loop727_redo
  loop727_done:
    pop_eh 
  for_undef_121:
    find_lex $P730, "@result"
# .annotate "line", 317
    .return ($P730)
  control_710:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P731, exception, "payload"
    .return ($P731)
.end


.namespace ["Array"]
.sub "_block719"  :anon :subid("50_1268929907.54522") :outer("49_1268929907.54522")
    .param pmc param_721
# .annotate "line", 320
    .lex "$_", param_721
# .annotate "line", 321
    find_lex $P722, "@result"
    find_lex $P723, "&func"
    find_lex $P724, "$_"
    $P725 = $P723($P724)
    $P726 = $P722."push"($P725)
# .annotate "line", 320
    .return ($P726)
.end


.namespace ["Array"]
.sub "reduce"  :subid("51_1268929907.54522") :method :outer("11_1268929907.54522")
    .param pmc param_737
# .annotate "line", 335
    .const 'Sub' $P750 = "52_1268929907.54522" 
    capture_lex $P750
    new $P736, 'ExceptionHandler'
    set_addr $P736, control_735
    $P736."handle_types"(58)
    push_eh $P736
    .lex "self", self
    .lex "&expression", param_737
# .annotate "line", 336
    new $P738, "Undef"
    .lex "$result", $P738
# .annotate "line", 337
    new $P739, "Undef"
    .lex "$first", $P739
# .annotate "line", 335
    find_lex $P740, "$result"
# .annotate "line", 337
    new $P741, "Integer"
    assign $P741, 1
    store_lex "$first", $P741
# .annotate "line", 339
    find_lex $P743, "self"
    $P744 = $P743."elems"()
    unless $P744, if_742_end
# .annotate "line", 340
    find_lex $P746, "self"
    defined $I747, $P746
    unless $I747, for_undef_122
    iter $P745, $P746
    new $P763, 'ExceptionHandler'
    set_addr $P763, loop762_handler
    $P763."handle_types"(65, 67, 66)
    push_eh $P763
  loop762_test:
    unless $P745, loop762_done
    shift $P748, $P745
  loop762_redo:
    .const 'Sub' $P750 = "52_1268929907.54522" 
    capture_lex $P750
    $P750($P748)
  loop762_next:
    goto loop762_test
  loop762_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P764, exception, 'type'
    eq $P764, 65, loop762_next
    eq $P764, 67, loop762_redo
  loop762_done:
    pop_eh 
  for_undef_122:
  if_742_end:
# .annotate "line", 339
    find_lex $P765, "$result"
# .annotate "line", 335
    .return ($P765)
  control_735:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P766, exception, "payload"
    .return ($P766)
.end


.namespace ["Array"]
.sub "_block749"  :anon :subid("52_1268929907.54522") :outer("51_1268929907.54522")
    .param pmc param_751
# .annotate "line", 340
    .lex "$_", param_751
# .annotate "line", 341
    find_lex $P754, "$first"
    if $P754, if_753
# .annotate "line", 346
    find_lex $P758, "&expression"
    find_lex $P759, "$result"
    find_lex $P760, "$_"
    $P761 = $P758($P759, $P760)
    store_lex "$result", $P761
# .annotate "line", 345
    set $P752, $P761
# .annotate "line", 341
    goto if_753_end
  if_753:
    find_lex $P755, "$first"
    clone $P756, $P755
    dec $P755
# .annotate "line", 343
    find_lex $P757, "$_"
    store_lex "$result", $P757
# .annotate "line", 341
    set $P752, $P757
  if_753_end:
# .annotate "line", 340
    .return ($P752)
.end


.namespace ["Array"]
.sub "reverse"  :subid("53_1268929907.54522") :method :outer("11_1268929907.54522")
    .param pmc param_770 :optional :named("from")
    .param int has_param_770 :opt_flag
    .param pmc param_772 :optional :named("to")
    .param int has_param_772 :opt_flag
# .annotate "line", 354
    new $P769, 'ExceptionHandler'
    set_addr $P769, control_768
    $P769."handle_types"(58)
    push_eh $P769
    .lex "self", self
    if has_param_770, optparam_123
    new $P771, "Integer"
    assign $P771, 0
    set param_770, $P771
  optparam_123:
    .lex "$from", param_770
    if has_param_772, optparam_124
    new $P773, "Undef"
    set param_772, $P773
  optparam_124:
    .lex "$to", param_772
# .annotate "line", 356
    new $P774, "Undef"
    .lex "$temp", $P774
# .annotate "line", 355
    find_lex $P776, "$to"
    $P777 = $P776."defined"()
    if $P777, unless_775_end
    find_lex $P778, "self"
    $P779 = $P778."elems"()
    sub $P780, $P779, 1
    store_lex "$to", $P780
  unless_775_end:
    find_lex $P781, "$temp"
# .annotate "line", 358
    find_lex $P783, "$from"
    set $N784, $P783
    find_lex $P785, "$to"
    set $N786, $P785
    isgt $I787, $N784, $N786
    unless $I787, if_782_end
# .annotate "line", 359
    find_lex $P788, "$from"
    store_lex "$temp", $P788
# .annotate "line", 360
    find_lex $P789, "$to"
    store_lex "$from", $P789
# .annotate "line", 361
    find_lex $P790, "$temp"
    store_lex "$to", $P790
  if_782_end:
# .annotate "line", 364
    find_lex $P792, "$from"
    set $N793, $P792
    isge $I794, $N793, 0.0
    unless $I794, if_791_end
# .annotate "line", 365
    new $P820, 'ExceptionHandler'
    set_addr $P820, loop819_handler
    $P820."handle_types"(65, 67, 66)
    push_eh $P820
  loop819_test:
    find_lex $P795, "$from"
    set $N796, $P795
    find_lex $P797, "$to"
    set $N798, $P797
    islt $I799, $N796, $N798
    unless $I799, loop819_done
  loop819_redo:
# .annotate "line", 366
    find_lex $P800, "$from"
    set $I801, $P800
    find_lex $P802, "self"
    unless_null $P802, vivify_125
    $P802 = root_new ['parrot';'ResizablePMCArray']
  vivify_125:
    set $P803, $P802[$I801]
    unless_null $P803, vivify_126
    new $P803, "Undef"
  vivify_126:
    store_lex "$temp", $P803
# .annotate "line", 367
    find_lex $P804, "$to"
    set $I805, $P804
    find_lex $P806, "self"
    unless_null $P806, vivify_127
    $P806 = root_new ['parrot';'ResizablePMCArray']
  vivify_127:
    set $P807, $P806[$I805]
    unless_null $P807, vivify_128
    new $P807, "Undef"
  vivify_128:
    find_lex $P808, "$from"
    set $I809, $P808
    find_lex $P810, "self"
    unless_null $P810, vivify_129
    $P810 = root_new ['parrot';'ResizablePMCArray']
    store_lex "self", $P810
  vivify_129:
    set $P810[$I809], $P807
# .annotate "line", 368
    find_lex $P811, "$temp"
    find_lex $P812, "$to"
    set $I813, $P812
    find_lex $P814, "self"
    unless_null $P814, vivify_130
    $P814 = root_new ['parrot';'ResizablePMCArray']
    store_lex "self", $P814
  vivify_130:
    set $P814[$I813], $P811
    find_lex $P815, "$from"
    clone $P816, $P815
    inc $P815
    find_lex $P817, "$to"
    clone $P818, $P817
    dec $P817
  loop819_next:
# .annotate "line", 365
    goto loop819_test
  loop819_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P821, exception, 'type'
    eq $P821, 65, loop819_next
    eq $P821, 67, loop819_redo
  loop819_done:
    pop_eh 
  if_791_end:
# .annotate "line", 364
    find_lex $P822, "self"
# .annotate "line", 354
    .return ($P822)
  control_768:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P823, exception, "payload"
    .return ($P823)
.end


.namespace ["Array"]
.sub "set_size"  :subid("54_1268929907.54522") :method :outer("11_1268929907.54522")
    .param pmc param_828
# .annotate "line", 396
    new $P827, 'ExceptionHandler'
    set_addr $P827, control_826
    $P827."handle_types"(58)
    push_eh $P827
    .lex "self", self
    .lex "$size", param_828
# .annotate "line", 397
    find_lex $P829, "self"
    find_lex $P830, "$size"
    set $I831, $P830
    assign $P829, $I831
    find_lex $P832, "self"
# .annotate "line", 396
    .return ($P832)
  control_826:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P833, exception, "payload"
    .return ($P833)
.end


.namespace ["Array"]
.sub "slice"  :subid("55_1268929907.54522") :method :outer("11_1268929907.54522")
    .param pmc param_837 :optional :named("from")
    .param int has_param_837 :opt_flag
    .param pmc param_839 :optional :named("to")
    .param int has_param_839 :opt_flag
# .annotate "line", 401
    new $P836, 'ExceptionHandler'
    set_addr $P836, control_835
    $P836."handle_types"(58)
    push_eh $P836
    .lex "self", self
    if has_param_837, optparam_131
    new $P838, "Integer"
    assign $P838, 0
    set param_837, $P838
  optparam_131:
    .lex "$from", param_837
    if has_param_839, optparam_132
    new $P840, "Undef"
    set param_839, $P840
  optparam_132:
    .lex "$to", param_839
# .annotate "line", 402
    new $P841, "Undef"
    .lex "$elems", $P841
# .annotate "line", 416
    get_global $P842, "@Empty"
    unless_null $P842, vivify_133
    $P842 = root_new ['parrot';'ResizablePMCArray']
    set_global "@Empty", $P842
  vivify_133:
# .annotate "line", 417
    $P843 = root_new ['parrot';'ResizablePMCArray']
    .lex "@slice", $P843
# .annotate "line", 402
    find_lex $P844, "self"
    $P845 = $P844."elems"()
    store_lex "$elems", $P845
# .annotate "line", 403
    find_lex $P847, "$to"
    $P848 = $P847."defined"()
    if $P848, unless_846_end
    find_lex $P849, "$elems"
    store_lex "$to", $P849
  unless_846_end:
# .annotate "line", 405
    find_lex $P851, "$from"
    set $N852, $P851
    islt $I853, $N852, 0.0
    unless $I853, if_850_end
    find_lex $P854, "$from"
    find_lex $P855, "$elems"
    add $P856, $P854, $P855
    store_lex "$from", $P856
  if_850_end:
# .annotate "line", 406
    find_lex $P858, "$to"
    set $N859, $P858
    islt $I860, $N859, 0.0
    unless $I860, if_857_end
    find_lex $P861, "$to"
    find_lex $P862, "$elems"
    add $P863, $P861, $P862
    store_lex "$to", $P863
  if_857_end:
# .annotate "line", 408
    find_lex $P865, "$from"
    set $N866, $P865
    find_lex $P867, "$elems"
    set $N868, $P867
    isge $I869, $N866, $N868
    unless $I869, if_864_end
# .annotate "line", 409
    find_lex $P870, "$from"
    find_lex $P871, "$elems"
    "die"("$from parameter out of range: ", $P870, " exceeds # elements: ", $P871)
  if_864_end:
# .annotate "line", 412
    find_lex $P873, "$to"
    set $N874, $P873
    find_lex $P875, "$elems"
    set $N876, $P875
    isgt $I877, $N874, $N876
    unless $I877, if_872_end
# .annotate "line", 413
    find_lex $P878, "$from"
    find_lex $P879, "$elems"
    "die"("$to parameter out of range: ", $P878, " exceeds # elements: ", $P879)
  if_872_end:
# .annotate "line", 412
    get_global $P880, "@Empty"
# .annotate "line", 417
    find_lex $P881, "self"
    $P882 = $P881."clone"()
    store_lex "@slice", $P882
# .annotate "line", 418
    find_lex $P883, "@slice"
    get_global $P884, "@Empty"
    find_lex $P885, "$to"
    add $P886, $P885, 1
    find_lex $P887, "$elems"
    find_lex $P888, "$to"
    sub $P889, $P887, $P888
    $P883."splice"($P884, $P886 :named("from"), $P889 :named("replacing"))
# .annotate "line", 419
    find_lex $P890, "@slice"
    get_global $P891, "@Empty"
    find_lex $P892, "$from"
    $P890."splice"($P891, 0 :named("from"), $P892 :named("replacing"))
    find_lex $P893, "@slice"
# .annotate "line", 401
    .return ($P893)
  control_835:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P894, exception, "payload"
    .return ($P894)
.end


.namespace ["Array"]
.sub "splice"  :subid("56_1268929907.54522") :method :outer("11_1268929907.54522")
    .param pmc param_898
    .param pmc param_899 :optional :named("from")
    .param int has_param_899 :opt_flag
    .param pmc param_901 :optional :named("replacing")
    .param int has_param_901 :opt_flag
# .annotate "line", 423
    new $P897, 'ExceptionHandler'
    set_addr $P897, control_896
    $P897."handle_types"(58)
    push_eh $P897
    .lex "self", self
    .lex "@value", param_898
    if has_param_899, optparam_134
    new $P900, "Integer"
    assign $P900, 0
    set param_899, $P900
  optparam_134:
    .lex "$from", param_899
    if has_param_901, optparam_135
    new $P902, "Integer"
    assign $P902, 0
    set param_901, $P902
  optparam_135:
    .lex "$replacing", param_901
# .annotate "line", 424
    find_lex $P903, "self"
    find_lex $P904, "@value"
    find_lex $P905, "$from"
    set $I906, $P905
    find_lex $P907, "$replacing"
    set $I908, $P907
    splice $P903, $P904, $I906, $I908
    find_lex $P909, "self"
# .annotate "line", 423
    .return ($P909)
  control_896:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P910, exception, "payload"
    .return ($P910)
.end


.namespace ["Array"]
.sub "unsort"  :subid("57_1268929907.54522") :method :outer("11_1268929907.54522")
# .annotate "line", 428
    .const 'Sub' $P925 = "58_1268929907.54522" 
    capture_lex $P925
    new $P913, 'ExceptionHandler'
    set_addr $P913, control_912
    $P913."handle_types"(58)
    push_eh $P913
    .lex "self", self
# .annotate "line", 429
    get_global $P914, "&Parrot_range_rand"
    unless_null $P914, vivify_136
    new $P914, "Undef"
    set_global "&Parrot_range_rand", $P914
  vivify_136:
# .annotate "line", 437
    new $P915, "Undef"
    .lex "$bound", $P915
# .annotate "line", 438
    new $P916, "Undef"
    .lex "$swap", $P916
# .annotate "line", 439
    new $P917, "Undef"
    .lex "$temp", $P917
# .annotate "line", 428
    get_global $P918, "&Parrot_range_rand"
# .annotate "line", 431
    get_global $P920, "&Parrot_range_rand"
    defined $I921, $P920
    new $P922, 'Integer'
    set $P922, $I921
    isfalse $I923, $P922
    unless $I923, if_919_end
    .const 'Sub' $P925 = "58_1268929907.54522" 
    capture_lex $P925
    $P925()
  if_919_end:
# .annotate "line", 437
    find_lex $P935, "self"
    $P936 = $P935."elems"()
    sub $P937, $P936, 1
    store_lex "$bound", $P937
    find_lex $P938, "$swap"
    find_lex $P939, "$temp"
# .annotate "line", 441
    new $P973, 'ExceptionHandler'
    set_addr $P973, loop972_handler
    $P973."handle_types"(65, 67, 66)
    push_eh $P973
  loop972_test:
    find_lex $P940, "$bound"
    set $N941, $P940
    isgt $I942, $N941, 0.0
    unless $I942, loop972_done
  loop972_redo:
# .annotate "line", 442
    get_global $P943, "&Parrot_range_rand"
    find_lex $P944, "$bound"
    add $P945, $P944, 1
    $P946 = $P943(0, $P945, 0)
    store_lex "$swap", $P946
# .annotate "line", 443
    find_lex $P948, "$swap"
    set $N949, $P948
    find_lex $P950, "$bound"
    set $N951, $P950
    isgt $I952, $N949, $N951
    unless $I952, if_947_end
    find_lex $P953, "$swap"
    clone $P954, $P953
    dec $P953
  if_947_end:
# .annotate "line", 444
    find_lex $P955, "$bound"
    set $I956, $P955
    find_lex $P957, "self"
    unless_null $P957, vivify_137
    $P957 = root_new ['parrot';'ResizablePMCArray']
  vivify_137:
    set $P958, $P957[$I956]
    unless_null $P958, vivify_138
    new $P958, "Undef"
  vivify_138:
    store_lex "$temp", $P958
# .annotate "line", 445
    find_lex $P959, "$swap"
    set $I960, $P959
    find_lex $P961, "self"
    unless_null $P961, vivify_139
    $P961 = root_new ['parrot';'ResizablePMCArray']
  vivify_139:
    set $P962, $P961[$I960]
    unless_null $P962, vivify_140
    new $P962, "Undef"
  vivify_140:
    find_lex $P963, "$bound"
    set $I964, $P963
    find_lex $P965, "self"
    unless_null $P965, vivify_141
    $P965 = root_new ['parrot';'ResizablePMCArray']
    store_lex "self", $P965
  vivify_141:
    set $P965[$I964], $P962
# .annotate "line", 446
    find_lex $P966, "$temp"
    find_lex $P967, "$swap"
    set $I968, $P967
    find_lex $P969, "self"
    unless_null $P969, vivify_142
    $P969 = root_new ['parrot';'ResizablePMCArray']
    store_lex "self", $P969
  vivify_142:
    set $P969[$I968], $P966
    find_lex $P970, "$bound"
    clone $P971, $P970
    dec $P970
  loop972_next:
# .annotate "line", 441
    goto loop972_test
  loop972_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P974, exception, 'type'
    eq $P974, 65, loop972_next
    eq $P974, 67, loop972_redo
  loop972_done:
    pop_eh 
    find_lex $P975, "self"
# .annotate "line", 428
    .return ($P975)
  control_912:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P976, exception, "payload"
    .return ($P976)
.end


.namespace ["Array"]
.sub "_block924"  :anon :subid("58_1268929907.54522") :outer("57_1268929907.54522")
# .annotate "line", 433
    new $P926, "Undef"
    .lex "$lib", $P926
    null $S927
    loadlib $P928, $S927
    store_lex "$lib", $P928
# .annotate "line", 434
    find_lex $P929, "$lib"
    new $P930, "String"
    assign $P930, "Parrot_range_rand"
    set $S931, $P930
    new $P932, "String"
    assign $P932, "iiii"
    set $S933, $P932
    dlfunc $P934, $P929, $S931, $S933
    set_global "&Parrot_range_rand", $P934
# .annotate "line", 431
    .return ($P934)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929824.76397")
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
.sub "_block13"  :subid("11_1268929824.76397") :outer("10_1268929824.76397")
# .annotate "line", 8
    .const 'Sub' $P15 = "12_1268929824.76397" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929824.76397" 
    capture_lex $P15
    .return ($P15)
.end


.namespace ["Class"]
.sub "__dump"  :subid("12_1268929824.76397") :method :outer("11_1268929824.76397")
    .param pmc param_18
    .param pmc param_19
# .annotate "line", 8
    .const 'Sub' $P110 = "15_1268929824.76397" 
    capture_lex $P110
    .const 'Sub' $P87 = "14_1268929824.76397" 
    capture_lex $P87
    .const 'Sub' $P65 = "13_1268929824.76397" 
    capture_lex $P65
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
    .lex "$dumper", param_18
    .lex "$label", param_19
# .annotate "line", 9
    $P20 = root_new ['parrot';'ResizablePMCArray']
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
    $P25 = root_new ['parrot';'ResizablePMCArray']
    .lex "@parents", $P25
# .annotate "line", 34
    new $P26, "Undef"
    .lex "$comma", $P26
# .annotate "line", 35
    $P27 = root_new ['parrot';'ResizablePMCArray']
    .lex "@attributes", $P27
# .annotate "line", 48
    $P28 = root_new ['parrot';'Hash']
    .lex "%methods_seen", $P28
# .annotate "line", 50
    $P29 = root_new ['parrot';'ResizablePMCArray']
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
    .const 'Sub' $P65 = "13_1268929824.76397" 
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
    .const 'Sub' $P87 = "14_1268929824.76397" 
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
    .const 'Sub' $P110 = "15_1268929824.76397" 
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
.sub "_block64"  :anon :subid("13_1268929824.76397") :outer("12_1268929824.76397")
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
.sub "_block86"  :anon :subid("14_1268929824.76397") :outer("12_1268929824.76397")
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
.sub "_block109"  :anon :subid("15_1268929824.76397") :outer("12_1268929824.76397")
    .param pmc param_113
# .annotate "line", 56
    .const 'Sub' $P132 = "16_1268929824.76397" 
    capture_lex $P132
# .annotate "line", 57
    new $P111, "Undef"
    .lex "$label", $P111
# .annotate "line", 62
    $P112 = root_new ['parrot';'Hash']
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
    .const 'Sub' $P132 = "16_1268929824.76397" 
    capture_lex $P132
    $P182 = $P132()
    set $P128, $P182
  if_129_end:
# .annotate "line", 56
    .return ($P128)
.end


.namespace ["Class"]
.sub "_block131"  :anon :subid("16_1268929824.76397") :outer("15_1268929824.76397")
# .annotate "line", 64
    .const 'Sub' $P148 = "17_1268929824.76397" 
    capture_lex $P148
# .annotate "line", 67
    $P133 = root_new ['parrot';'ResizablePMCArray']
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
    .const 'Sub' $P148 = "17_1268929824.76397" 
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
.sub "_block147"  :anon :subid("17_1268929824.76397") :outer("16_1268929824.76397")
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
    $P157 = root_new ['parrot';'Hash']
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
    $P174 = root_new ['parrot';'Hash']
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
    $P178 = root_new ['parrot';'Hash']
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
.sub "_block11"  :anon :subid("10_1268929918.96539")
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
.sub "_block13"  :subid("11_1268929918.96539") :outer("10_1268929918.96539")
# .annotate "line", 18
    .const 'Sub' $P260 = "25_1268929918.96539" 
    capture_lex $P260
    .const 'Sub' $P252 = "24_1268929918.96539" 
    capture_lex $P252
    .const 'Sub' $P242 = "23_1268929918.96539" 
    capture_lex $P242
    .const 'Sub' $P238 = "22_1268929918.96539" 
    capture_lex $P238
    .const 'Sub' $P231 = "21_1268929918.96539" 
    capture_lex $P231
    .const 'Sub' $P222 = "20_1268929918.96539" 
    capture_lex $P222
    .const 'Sub' $P154 = "18_1268929918.96539" 
    capture_lex $P154
    .const 'Sub' $P131 = "17_1268929918.96539" 
    capture_lex $P131
    .const 'Sub' $P15 = "12_1268929918.96539" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929918.96539" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 112
    .const 'Sub' $P131 = "17_1268929918.96539" 
    capture_lex $P131
    .lex "create_new_method", $P131
# .annotate "line", 153
    .const 'Sub' $P154 = "18_1268929918.96539" 
    capture_lex $P154
    .lex "install_methods", $P154
# .annotate "line", 18
    find_lex $P221, "_pre_initload"
# .annotate "line", 108
    find_lex $P237, "create_new_method"
# .annotate "line", 151
    find_lex $P251, "install_methods"
# .annotate "line", 184
    .const 'Sub' $P260 = "25_1268929918.96539" 
    capture_lex $P260
# .annotate "line", 18
    .return ($P260)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_pre_initload"  :subid("12_1268929918.96539") :outer("11_1268929918.96539")
# .annotate "line", 18
    .const 'Sub' $P103 = "15_1268929918.96539" 
    capture_lex $P103
    .const 'Sub' $P78 = "14_1268929918.96539" 
    capture_lex $P78
    .const 'Sub' $P55 = "13_1268929918.96539" 
    capture_lex $P55
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 23
    $P18 = root_new ['parrot';'Hash']
    .lex "%methods_for", $P18
# .annotate "line", 39
    new $P19, "Undef"
    .lex "$from_nsp", $P19
# .annotate "line", 42
    $P20 = root_new ['parrot';'ResizablePMCArray']
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
    $P25 = root_new ['parrot';'Hash']
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
    $P27 = root_new ['parrot';'Hash']
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
    $P29 = root_new ['parrot';'Hash']
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
    $P31 = root_new ['parrot';'Hash']
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
    $P33 = root_new ['parrot';'Hash']
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
    $P35 = root_new ['parrot';'Hash']
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
    $P37 = root_new ['parrot';'Hash']
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
    $P39 = root_new ['parrot';'Hash']
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
    $P41 = root_new ['parrot';'Hash']
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
    $P43 = root_new ['parrot';'Hash']
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
    $P45 = root_new ['parrot';'Hash']
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
    $P47 = root_new ['parrot';'Hash']
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
    .const 'Sub' $P55 = "13_1268929918.96539" 
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
    .const 'Sub' $P78 = "14_1268929918.96539" 
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
    .const 'Sub' $P103 = "15_1268929918.96539" 
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
.sub "_block54"  :anon :subid("13_1268929918.96539") :outer("12_1268929918.96539")
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
    $P67 = root_new ['parrot';'Hash']
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
.sub "_block77"  :anon :subid("14_1268929918.96539") :outer("12_1268929918.96539")
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
    $P88 = root_new ['parrot';'Hash']
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
    $P92 = root_new ['parrot';'Hash']
    store_lex "%methods_for", $P92
  vivify_44:
    set $P92[$P91], $P90
# .annotate "line", 58
    .return ($P90)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block102"  :anon :subid("15_1268929918.96539") :outer("12_1268929918.96539")
    .param pmc param_104
    .param pmc param_105
# .annotate "line", 65
    .const 'Sub' $P110 = "16_1268929918.96539" 
    capture_lex $P110
    .lex "$pmc_type", param_104
    .lex "@methods", param_105
# .annotate "line", 66
    find_lex $P108, "@methods"
    if $P108, if_107
    set $P106, $P108
    goto if_107_end
  if_107:
    .const 'Sub' $P110 = "16_1268929918.96539" 
    capture_lex $P110
    $P126 = $P110()
    set $P106, $P126
  if_107_end:
# .annotate "line", 65
    .return ($P106)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block109"  :anon :subid("16_1268929918.96539") :outer("15_1268929918.96539")
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
.sub "create_new_method"  :subid("17_1268929918.96539") :outer("11_1268929918.96539")
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
.sub "install_methods"  :subid("18_1268929918.96539") :outer("11_1268929918.96539")
    .param pmc param_157
    .param pmc param_158
    .param pmc param_159 :optional :named("skip_new")
    .param int has_param_159 :opt_flag
# .annotate "line", 153
    .const 'Sub' $P174 = "19_1268929918.96539" 
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
    $P162 = root_new ['parrot';'Hash']
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
    .const 'Sub' $P174 = "19_1268929918.96539" 
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
.sub "_block173"  :anon :subid("19_1268929918.96539") :outer("18_1268929918.96539")
    .param pmc param_175
# .annotate "line", 159
    .lex "$_", param_175
# .annotate "line", 160
    find_lex $P178, "$_"
    set $S179, $P178
    find_lex $P180, "$namespace"
    unless_null $P180, vivify_48
    $P180 = root_new ['parrot';'Hash']
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
    $P186 = root_new ['parrot';'Hash']
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
    $P190 = root_new ['parrot';'Hash']
  vivify_52:
    set $P191, $P190[$S189]
    unless_null $P191, vivify_53
    new $P191, "Undef"
  vivify_53:
    find_lex $P192, "$_"
    set $S193, $P192
    find_lex $P194, "%export_subs"
    unless_null $P194, vivify_54
    $P194 = root_new ['parrot';'Hash']
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
.sub "can"  :subid("20_1268929918.96539") :method :outer("11_1268929918.96539")
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
.sub "clone"  :subid("21_1268929918.96539") :method :outer("11_1268929918.96539")
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
.sub "defined"  :subid("22_1268929918.96539") :method :outer("11_1268929918.96539")
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
.sub "does"  :subid("23_1268929918.96539") :method :outer("11_1268929918.96539")
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
.sub "isa"  :subid("24_1268929918.96539") :method :outer("11_1268929918.96539")
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
.sub "is_equal"  :subid("25_1268929918.96539") :method :outer("11_1268929918.96539")
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
.sub "_block11"  :anon :subid("10_1268929841.56423")
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
.sub "_block13"  :subid("11_1268929841.56423") :outer("10_1268929841.56423")
# .annotate "line", 7
    get_hll_global $P176, ["Exception";"Wrapper"], "_block175" 
    capture_lex $P176
    get_hll_global $P146, ["Exception";"Severity"], "_block145" 
    capture_lex $P146
    .const 'Sub' $P137 = "23_1268929841.56423" 
    capture_lex $P137
    .const 'Sub' $P132 = "22_1268929841.56423" 
    capture_lex $P132
    .const 'Sub' $P124 = "21_1268929841.56423" 
    capture_lex $P124
    .const 'Sub' $P119 = "20_1268929841.56423" 
    capture_lex $P119
    .const 'Sub' $P111 = "19_1268929841.56423" 
    capture_lex $P111
    .const 'Sub' $P103 = "18_1268929841.56423" 
    capture_lex $P103
    .const 'Sub' $P95 = "17_1268929841.56423" 
    capture_lex $P95
    .const 'Sub' $P87 = "16_1268929841.56423" 
    capture_lex $P87
    .const 'Sub' $P40 = "14_1268929841.56423" 
    capture_lex $P40
    .const 'Sub' $P20 = "13_1268929841.56423" 
    capture_lex $P20
    .const 'Sub' $P15 = "12_1268929841.56423" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929841.56423" 
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
.sub "" :load :init :subid("post45") :outer("11_1268929841.56423")
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
.sub "_pre_initload"  :subid("12_1268929841.56423") :outer("11_1268929841.56423")
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
.sub "_attr"  :subid("13_1268929841.56423") :method :outer("11_1268929841.56423")
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
.sub "backtrace_string"  :subid("14_1268929841.56423") :method :outer("11_1268929841.56423")
# .annotate "line", 23
    .const 'Sub' $P56 = "15_1268929841.56423" 
    capture_lex $P56
    new $P42, 'ExceptionHandler'
    set_addr $P42, control_41
    $P42."handle_types"(58)
    push_eh $P42
    .lex "self", self
# .annotate "line", 24
    $P43 = root_new ['parrot';'ResizablePMCArray']
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
    .const 'Sub' $P56 = "15_1268929841.56423" 
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
.sub "_block55"  :anon :subid("15_1268929841.56423") :outer("14_1268929841.56423")
    .param pmc param_57
# .annotate "line", 28
    .lex "$_", param_57
# .annotate "line", 29
    find_lex $P58, "$_"
    unless_null $P58, vivify_47
    $P58 = root_new ['parrot';'Hash']
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
.sub "exit_code"  :subid("16_1268929841.56423") :method :outer("11_1268929841.56423")
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
.sub "handled"  :subid("17_1268929841.56423") :method :outer("11_1268929841.56423")
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
.sub "message"  :subid("18_1268929841.56423") :method :outer("11_1268929841.56423")
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
.sub "payload"  :subid("19_1268929841.56423") :method :outer("11_1268929841.56423")
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
.sub "rethrow"  :subid("20_1268929841.56423") :method :outer("11_1268929841.56423")
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
.sub "severity"  :subid("21_1268929841.56423") :method :outer("11_1268929841.56423")
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
.sub "throw"  :subid("22_1268929841.56423") :method :outer("11_1268929841.56423")
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
.sub "type"  :subid("23_1268929841.56423") :method :outer("11_1268929841.56423")
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
.sub "_block145"  :subid("24_1268929841.56423") :outer("11_1268929841.56423")
# .annotate "line", 51
    .const 'Sub' $P171 = "31_1268929841.56423" 
    capture_lex $P171
    .const 'Sub' $P167 = "30_1268929841.56423" 
    capture_lex $P167
    .const 'Sub' $P163 = "29_1268929841.56423" 
    capture_lex $P163
    .const 'Sub' $P159 = "28_1268929841.56423" 
    capture_lex $P159
    .const 'Sub' $P155 = "27_1268929841.56423" 
    capture_lex $P155
    .const 'Sub' $P151 = "26_1268929841.56423" 
    capture_lex $P151
    .const 'Sub' $P147 = "25_1268929841.56423" 
    capture_lex $P147
# .annotate "line", 58
    .const 'Sub' $P171 = "31_1268929841.56423" 
    capture_lex $P171
# .annotate "line", 51
    .return ($P171)
.end


.namespace ["Exception";"Severity"]
.sub "NORMAL"  :subid("25_1268929841.56423") :method :outer("24_1268929841.56423")
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
.sub "WARNING"  :subid("26_1268929841.56423") :method :outer("24_1268929841.56423")
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
.sub "ERROR"  :subid("27_1268929841.56423") :method :outer("24_1268929841.56423")
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
.sub "SEVERE"  :subid("28_1268929841.56423") :method :outer("24_1268929841.56423")
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
.sub "FATAL"  :subid("29_1268929841.56423") :method :outer("24_1268929841.56423")
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
.sub "DOOMED"  :subid("30_1268929841.56423") :method :outer("24_1268929841.56423")
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
.sub "EXIT"  :subid("31_1268929841.56423") :method :outer("24_1268929841.56423")
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
.sub "_block175"  :subid("32_1268929841.56423") :outer("11_1268929841.56423")
# .annotate "line", 66
    .const 'Sub' $P314 = "44_1268929841.56423" 
    capture_lex $P314
    .const 'Sub' $P307 = "43_1268929841.56423" 
    capture_lex $P307
    .const 'Sub' $P301 = "42_1268929841.56423" 
    capture_lex $P301
    .const 'Sub' $P294 = "41_1268929841.56423" 
    capture_lex $P294
    .const 'Sub' $P247 = "39_1268929841.56423" 
    capture_lex $P247
    .const 'Sub' $P238 = "38_1268929841.56423" 
    capture_lex $P238
    .const 'Sub' $P229 = "37_1268929841.56423" 
    capture_lex $P229
    .const 'Sub' $P220 = "36_1268929841.56423" 
    capture_lex $P220
    .const 'Sub' $P211 = "35_1268929841.56423" 
    capture_lex $P211
    .const 'Sub' $P193 = "34_1268929841.56423" 
    capture_lex $P193
    .const 'Sub' $P177 = "33_1268929841.56423" 
    capture_lex $P177
# .annotate "line", 118
    .const 'Sub' $P314 = "44_1268929841.56423" 
    capture_lex $P314
# .annotate "line", 66
    .return ($P314)
.end


.namespace ["Exception";"Wrapper"]
.sub "" :load :init :subid("post49") :outer("32_1268929841.56423")
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
.sub "create_exception"  :subid("33_1268929841.56423") :method :outer("32_1268929841.56423")
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
.sub "exception"  :subid("34_1268929841.56423") :method :outer("32_1268929841.56423")
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
    $P203 = root_new ['parrot';'ResizablePMCArray']
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
.sub "exit_code"  :subid("35_1268929841.56423") :method :outer("32_1268929841.56423")
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
.sub "handled"  :subid("36_1268929841.56423") :method :outer("32_1268929841.56423")
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
.sub "message"  :subid("37_1268929841.56423") :method :outer("32_1268929841.56423")
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
.sub "payload"  :subid("38_1268929841.56423") :method :outer("32_1268929841.56423")
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
.sub "new"  :subid("39_1268929841.56423") :method :outer("32_1268929841.56423")
    .param pmc param_250 :slurpy
    .param pmc param_251 :slurpy :named
# .annotate "line", 94
    .const 'Sub' $P266 = "40_1268929841.56423" 
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
    .const 'Sub' $P266 = "40_1268929841.56423" 
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
.sub "_block265"  :anon :subid("40_1268929841.56423") :outer("39_1268929841.56423")
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
    $P282 = root_new ['parrot';'Hash']
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
.sub "rethrow"  :subid("41_1268929841.56423") :method :outer("32_1268929841.56423")
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
.sub "severity"  :subid("42_1268929841.56423") :method :outer("32_1268929841.56423")
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
.sub "throw"  :subid("43_1268929841.56423") :method :outer("32_1268929841.56423")
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
.sub "type"  :subid("44_1268929841.56423") :method :outer("32_1268929841.56423")
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
.sub "_block11"  :anon :subid("10_1268929852.10439")
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
.sub "" :load :init :subid("post149") :outer("10_1268929852.10439")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268929852.10439" 
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
.sub "_block13"  :subid("11_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 9
    .const 'Sub' $P15 = "12_1268929852.10439" 
    capture_lex $P15
# .annotate "line", 10
    .const 'Sub' $P15 = "12_1268929852.10439" 
    capture_lex $P15
# .annotate "line", 9
    .return ($P15)
.end


.namespace ["Exception";"BadBufferSize"]
.sub "type"  :subid("12_1268929852.10439") :method :outer("11_1268929852.10439")
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
.sub "_block19"  :subid("13_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 13
    .const 'Sub' $P21 = "14_1268929852.10439" 
    capture_lex $P21
# .annotate "line", 14
    .const 'Sub' $P21 = "14_1268929852.10439" 
    capture_lex $P21
# .annotate "line", 13
    .return ($P21)
.end


.namespace ["Exception";"MissingEncodingName"]
.sub "type"  :subid("14_1268929852.10439") :method :outer("13_1268929852.10439")
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
.sub "_block25"  :subid("15_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 17
    .const 'Sub' $P27 = "16_1268929852.10439" 
    capture_lex $P27
# .annotate "line", 18
    .const 'Sub' $P27 = "16_1268929852.10439" 
    capture_lex $P27
# .annotate "line", 17
    .return ($P27)
.end


.namespace ["Exception";"InvalidStringRepresentation"]
.sub "type"  :subid("16_1268929852.10439") :method :outer("15_1268929852.10439")
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
.sub "_block31"  :subid("17_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 21
    .const 'Sub' $P33 = "18_1268929852.10439" 
    capture_lex $P33
# .annotate "line", 22
    .const 'Sub' $P33 = "18_1268929852.10439" 
    capture_lex $P33
# .annotate "line", 21
    .return ($P33)
.end


.namespace ["Exception";"IcuError"]
.sub "type"  :subid("18_1268929852.10439") :method :outer("17_1268929852.10439")
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
.sub "_block37"  :subid("19_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 25
    .const 'Sub' $P39 = "20_1268929852.10439" 
    capture_lex $P39
# .annotate "line", 26
    .const 'Sub' $P39 = "20_1268929852.10439" 
    capture_lex $P39
# .annotate "line", 25
    .return ($P39)
.end


.namespace ["Exception";"Unimplemented"]
.sub "type"  :subid("20_1268929852.10439") :method :outer("19_1268929852.10439")
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
.sub "_block43"  :subid("21_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 29
    .const 'Sub' $P45 = "22_1268929852.10439" 
    capture_lex $P45
# .annotate "line", 30
    .const 'Sub' $P45 = "22_1268929852.10439" 
    capture_lex $P45
# .annotate "line", 29
    .return ($P45)
.end


.namespace ["Exception";"NullRegAccess"]
.sub "type"  :subid("22_1268929852.10439") :method :outer("21_1268929852.10439")
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
.sub "_block49"  :subid("23_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 33
    .const 'Sub' $P51 = "24_1268929852.10439" 
    capture_lex $P51
# .annotate "line", 34
    .const 'Sub' $P51 = "24_1268929852.10439" 
    capture_lex $P51
# .annotate "line", 33
    .return ($P51)
.end


.namespace ["Exception";"NoRegFrames"]
.sub "type"  :subid("24_1268929852.10439") :method :outer("23_1268929852.10439")
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
.sub "_block55"  :subid("25_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 37
    .const 'Sub' $P57 = "26_1268929852.10439" 
    capture_lex $P57
# .annotate "line", 38
    .const 'Sub' $P57 = "26_1268929852.10439" 
    capture_lex $P57
# .annotate "line", 37
    .return ($P57)
.end


.namespace ["Exception";"SubstrOutOfString"]
.sub "type"  :subid("26_1268929852.10439") :method :outer("25_1268929852.10439")
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
.sub "_block61"  :subid("27_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 41
    .const 'Sub' $P63 = "28_1268929852.10439" 
    capture_lex $P63
# .annotate "line", 42
    .const 'Sub' $P63 = "28_1268929852.10439" 
    capture_lex $P63
# .annotate "line", 41
    .return ($P63)
.end


.namespace ["Exception";"OrdOutOfString"]
.sub "type"  :subid("28_1268929852.10439") :method :outer("27_1268929852.10439")
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
.sub "_block67"  :subid("29_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 45
    .const 'Sub' $P69 = "30_1268929852.10439" 
    capture_lex $P69
# .annotate "line", 46
    .const 'Sub' $P69 = "30_1268929852.10439" 
    capture_lex $P69
# .annotate "line", 45
    .return ($P69)
.end


.namespace ["Exception";"MalformedUtf8"]
.sub "type"  :subid("30_1268929852.10439") :method :outer("29_1268929852.10439")
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
.sub "_block73"  :subid("31_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 49
    .const 'Sub' $P75 = "32_1268929852.10439" 
    capture_lex $P75
# .annotate "line", 50
    .const 'Sub' $P75 = "32_1268929852.10439" 
    capture_lex $P75
# .annotate "line", 49
    .return ($P75)
.end


.namespace ["Exception";"MalformedUtf16"]
.sub "type"  :subid("32_1268929852.10439") :method :outer("31_1268929852.10439")
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
.sub "_block79"  :subid("33_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 53
    .const 'Sub' $P81 = "34_1268929852.10439" 
    capture_lex $P81
# .annotate "line", 54
    .const 'Sub' $P81 = "34_1268929852.10439" 
    capture_lex $P81
# .annotate "line", 53
    .return ($P81)
.end


.namespace ["Exception";"MalformedUtf32"]
.sub "type"  :subid("34_1268929852.10439") :method :outer("33_1268929852.10439")
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
.sub "_block85"  :subid("35_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 57
    .const 'Sub' $P87 = "36_1268929852.10439" 
    capture_lex $P87
# .annotate "line", 58
    .const 'Sub' $P87 = "36_1268929852.10439" 
    capture_lex $P87
# .annotate "line", 57
    .return ($P87)
.end


.namespace ["Exception";"InvalidCharacter"]
.sub "type"  :subid("36_1268929852.10439") :method :outer("35_1268929852.10439")
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
.sub "_block91"  :subid("37_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 61
    .const 'Sub' $P93 = "38_1268929852.10439" 
    capture_lex $P93
# .annotate "line", 62
    .const 'Sub' $P93 = "38_1268929852.10439" 
    capture_lex $P93
# .annotate "line", 61
    .return ($P93)
.end


.namespace ["Exception";"InvalidChartype"]
.sub "type"  :subid("38_1268929852.10439") :method :outer("37_1268929852.10439")
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
.sub "_block97"  :subid("39_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 65
    .const 'Sub' $P99 = "40_1268929852.10439" 
    capture_lex $P99
# .annotate "line", 66
    .const 'Sub' $P99 = "40_1268929852.10439" 
    capture_lex $P99
# .annotate "line", 65
    .return ($P99)
.end


.namespace ["Exception";"InvalidEncoding"]
.sub "type"  :subid("40_1268929852.10439") :method :outer("39_1268929852.10439")
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
.sub "_block103"  :subid("41_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 69
    .const 'Sub' $P105 = "42_1268929852.10439" 
    capture_lex $P105
# .annotate "line", 70
    .const 'Sub' $P105 = "42_1268929852.10439" 
    capture_lex $P105
# .annotate "line", 69
    .return ($P105)
.end


.namespace ["Exception";"InvalidCharclass"]
.sub "type"  :subid("42_1268929852.10439") :method :outer("41_1268929852.10439")
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
.sub "_block109"  :subid("43_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 73
    .const 'Sub' $P111 = "44_1268929852.10439" 
    capture_lex $P111
# .annotate "line", 74
    .const 'Sub' $P111 = "44_1268929852.10439" 
    capture_lex $P111
# .annotate "line", 73
    .return ($P111)
.end


.namespace ["Exception";"NegRepeat"]
.sub "type"  :subid("44_1268929852.10439") :method :outer("43_1268929852.10439")
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
.sub "_block115"  :subid("45_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 77
    .const 'Sub' $P117 = "46_1268929852.10439" 
    capture_lex $P117
# .annotate "line", 78
    .const 'Sub' $P117 = "46_1268929852.10439" 
    capture_lex $P117
# .annotate "line", 77
    .return ($P117)
.end


.namespace ["Exception";"NegSubstr"]
.sub "type"  :subid("46_1268929852.10439") :method :outer("45_1268929852.10439")
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
.sub "_block121"  :subid("47_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 81
    .const 'Sub' $P123 = "48_1268929852.10439" 
    capture_lex $P123
# .annotate "line", 82
    .const 'Sub' $P123 = "48_1268929852.10439" 
    capture_lex $P123
# .annotate "line", 81
    .return ($P123)
.end


.namespace ["Exception";"NegSleep"]
.sub "type"  :subid("48_1268929852.10439") :method :outer("47_1268929852.10439")
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
.sub "_block127"  :subid("49_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 85
    .const 'Sub' $P129 = "50_1268929852.10439" 
    capture_lex $P129
# .annotate "line", 86
    .const 'Sub' $P129 = "50_1268929852.10439" 
    capture_lex $P129
# .annotate "line", 85
    .return ($P129)
.end


.namespace ["Exception";"NegChop"]
.sub "type"  :subid("50_1268929852.10439") :method :outer("49_1268929852.10439")
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
.sub "_block133"  :subid("51_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 89
    .const 'Sub' $P135 = "52_1268929852.10439" 
    capture_lex $P135
# .annotate "line", 90
    .const 'Sub' $P135 = "52_1268929852.10439" 
    capture_lex $P135
# .annotate "line", 89
    .return ($P135)
.end


.namespace ["Exception";"InvalidOperation"]
.sub "type"  :subid("52_1268929852.10439") :method :outer("51_1268929852.10439")
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
.sub "_block139"  :subid("53_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 93
    .const 'Sub' $P141 = "54_1268929852.10439" 
    capture_lex $P141
# .annotate "line", 94
    .const 'Sub' $P141 = "54_1268929852.10439" 
    capture_lex $P141
# .annotate "line", 93
    .return ($P141)
.end


.namespace ["Exception";"ArgOpNotHandled"]
.sub "type"  :subid("54_1268929852.10439") :method :outer("53_1268929852.10439")
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
.sub "_block145"  :subid("55_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 97
    .const 'Sub' $P147 = "56_1268929852.10439" 
    capture_lex $P147
# .annotate "line", 98
    .const 'Sub' $P147 = "56_1268929852.10439" 
    capture_lex $P147
# .annotate "line", 97
    .return ($P147)
.end


.namespace ["Exception";"KeyNotFound"]
.sub "type"  :subid("56_1268929852.10439") :method :outer("55_1268929852.10439")
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
.sub "_block151"  :subid("57_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 101
    .const 'Sub' $P153 = "58_1268929852.10439" 
    capture_lex $P153
# .annotate "line", 102
    .const 'Sub' $P153 = "58_1268929852.10439" 
    capture_lex $P153
# .annotate "line", 101
    .return ($P153)
.end


.namespace ["Exception";"JitUnavailable"]
.sub "type"  :subid("58_1268929852.10439") :method :outer("57_1268929852.10439")
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
.sub "_block157"  :subid("59_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 105
    .const 'Sub' $P159 = "60_1268929852.10439" 
    capture_lex $P159
# .annotate "line", 106
    .const 'Sub' $P159 = "60_1268929852.10439" 
    capture_lex $P159
# .annotate "line", 105
    .return ($P159)
.end


.namespace ["Exception";"ExecUnavailable"]
.sub "type"  :subid("60_1268929852.10439") :method :outer("59_1268929852.10439")
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
.sub "_block163"  :subid("61_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 109
    .const 'Sub' $P165 = "62_1268929852.10439" 
    capture_lex $P165
# .annotate "line", 110
    .const 'Sub' $P165 = "62_1268929852.10439" 
    capture_lex $P165
# .annotate "line", 109
    .return ($P165)
.end


.namespace ["Exception";"InterpError"]
.sub "type"  :subid("62_1268929852.10439") :method :outer("61_1268929852.10439")
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
.sub "_block169"  :subid("63_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 113
    .const 'Sub' $P171 = "64_1268929852.10439" 
    capture_lex $P171
# .annotate "line", 114
    .const 'Sub' $P171 = "64_1268929852.10439" 
    capture_lex $P171
# .annotate "line", 113
    .return ($P171)
.end


.namespace ["Exception";"PrederefLoadError"]
.sub "type"  :subid("64_1268929852.10439") :method :outer("63_1268929852.10439")
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
.sub "_block175"  :subid("65_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 117
    .const 'Sub' $P177 = "66_1268929852.10439" 
    capture_lex $P177
# .annotate "line", 118
    .const 'Sub' $P177 = "66_1268929852.10439" 
    capture_lex $P177
# .annotate "line", 117
    .return ($P177)
.end


.namespace ["Exception";"ParrotUsageError"]
.sub "type"  :subid("66_1268929852.10439") :method :outer("65_1268929852.10439")
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
.sub "_block181"  :subid("67_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 121
    .const 'Sub' $P183 = "68_1268929852.10439" 
    capture_lex $P183
# .annotate "line", 122
    .const 'Sub' $P183 = "68_1268929852.10439" 
    capture_lex $P183
# .annotate "line", 121
    .return ($P183)
.end


.namespace ["Exception";"PioError"]
.sub "type"  :subid("68_1268929852.10439") :method :outer("67_1268929852.10439")
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
.sub "_block187"  :subid("69_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 125
    .const 'Sub' $P189 = "70_1268929852.10439" 
    capture_lex $P189
# .annotate "line", 126
    .const 'Sub' $P189 = "70_1268929852.10439" 
    capture_lex $P189
# .annotate "line", 125
    .return ($P189)
.end


.namespace ["Exception";"ParrotPointerError"]
.sub "type"  :subid("70_1268929852.10439") :method :outer("69_1268929852.10439")
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
.sub "_block193"  :subid("71_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 129
    .const 'Sub' $P195 = "72_1268929852.10439" 
    capture_lex $P195
# .annotate "line", 130
    .const 'Sub' $P195 = "72_1268929852.10439" 
    capture_lex $P195
# .annotate "line", 129
    .return ($P195)
.end


.namespace ["Exception";"DivByZero"]
.sub "type"  :subid("72_1268929852.10439") :method :outer("71_1268929852.10439")
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
.sub "_block199"  :subid("73_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 133
    .const 'Sub' $P201 = "74_1268929852.10439" 
    capture_lex $P201
# .annotate "line", 134
    .const 'Sub' $P201 = "74_1268929852.10439" 
    capture_lex $P201
# .annotate "line", 133
    .return ($P201)
.end


.namespace ["Exception";"PioNotImplemented"]
.sub "type"  :subid("74_1268929852.10439") :method :outer("73_1268929852.10439")
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
.sub "_block205"  :subid("75_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 137
    .const 'Sub' $P207 = "76_1268929852.10439" 
    capture_lex $P207
# .annotate "line", 138
    .const 'Sub' $P207 = "76_1268929852.10439" 
    capture_lex $P207
# .annotate "line", 137
    .return ($P207)
.end


.namespace ["Exception";"AllocationError"]
.sub "type"  :subid("76_1268929852.10439") :method :outer("75_1268929852.10439")
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
.sub "_block211"  :subid("77_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 141
    .const 'Sub' $P213 = "78_1268929852.10439" 
    capture_lex $P213
# .annotate "line", 142
    .const 'Sub' $P213 = "78_1268929852.10439" 
    capture_lex $P213
# .annotate "line", 141
    .return ($P213)
.end


.namespace ["Exception";"InternalPanic"]
.sub "type"  :subid("78_1268929852.10439") :method :outer("77_1268929852.10439")
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
.sub "_block217"  :subid("79_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 145
    .const 'Sub' $P219 = "80_1268929852.10439" 
    capture_lex $P219
# .annotate "line", 146
    .const 'Sub' $P219 = "80_1268929852.10439" 
    capture_lex $P219
# .annotate "line", 145
    .return ($P219)
.end


.namespace ["Exception";"OutOfBounds"]
.sub "type"  :subid("80_1268929852.10439") :method :outer("79_1268929852.10439")
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
.sub "_block223"  :subid("81_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 149
    .const 'Sub' $P225 = "82_1268929852.10439" 
    capture_lex $P225
# .annotate "line", 150
    .const 'Sub' $P225 = "82_1268929852.10439" 
    capture_lex $P225
# .annotate "line", 149
    .return ($P225)
.end


.namespace ["Exception";"JitError"]
.sub "type"  :subid("82_1268929852.10439") :method :outer("81_1268929852.10439")
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
.sub "_block229"  :subid("83_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 153
    .const 'Sub' $P231 = "84_1268929852.10439" 
    capture_lex $P231
# .annotate "line", 154
    .const 'Sub' $P231 = "84_1268929852.10439" 
    capture_lex $P231
# .annotate "line", 153
    .return ($P231)
.end


.namespace ["Exception";"ExecError"]
.sub "type"  :subid("84_1268929852.10439") :method :outer("83_1268929852.10439")
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
.sub "_block235"  :subid("85_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 157
    .const 'Sub' $P237 = "86_1268929852.10439" 
    capture_lex $P237
# .annotate "line", 158
    .const 'Sub' $P237 = "86_1268929852.10439" 
    capture_lex $P237
# .annotate "line", 157
    .return ($P237)
.end


.namespace ["Exception";"IllInherit"]
.sub "type"  :subid("86_1268929852.10439") :method :outer("85_1268929852.10439")
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
.sub "_block241"  :subid("87_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 161
    .const 'Sub' $P243 = "88_1268929852.10439" 
    capture_lex $P243
# .annotate "line", 162
    .const 'Sub' $P243 = "88_1268929852.10439" 
    capture_lex $P243
# .annotate "line", 161
    .return ($P243)
.end


.namespace ["Exception";"NoPrevCs"]
.sub "type"  :subid("88_1268929852.10439") :method :outer("87_1268929852.10439")
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
.sub "_block247"  :subid("89_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 165
    .const 'Sub' $P249 = "90_1268929852.10439" 
    capture_lex $P249
# .annotate "line", 166
    .const 'Sub' $P249 = "90_1268929852.10439" 
    capture_lex $P249
# .annotate "line", 165
    .return ($P249)
.end


.namespace ["Exception";"NoClass"]
.sub "type"  :subid("90_1268929852.10439") :method :outer("89_1268929852.10439")
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
.sub "_block253"  :subid("91_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 169
    .const 'Sub' $P255 = "92_1268929852.10439" 
    capture_lex $P255
# .annotate "line", 170
    .const 'Sub' $P255 = "92_1268929852.10439" 
    capture_lex $P255
# .annotate "line", 169
    .return ($P255)
.end


.namespace ["Exception";"LexNotFound"]
.sub "type"  :subid("92_1268929852.10439") :method :outer("91_1268929852.10439")
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
.sub "_block259"  :subid("93_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 173
    .const 'Sub' $P261 = "94_1268929852.10439" 
    capture_lex $P261
# .annotate "line", 174
    .const 'Sub' $P261 = "94_1268929852.10439" 
    capture_lex $P261
# .annotate "line", 173
    .return ($P261)
.end


.namespace ["Exception";"PadNotFound"]
.sub "type"  :subid("94_1268929852.10439") :method :outer("93_1268929852.10439")
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
.sub "_block265"  :subid("95_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 177
    .const 'Sub' $P267 = "96_1268929852.10439" 
    capture_lex $P267
# .annotate "line", 178
    .const 'Sub' $P267 = "96_1268929852.10439" 
    capture_lex $P267
# .annotate "line", 177
    .return ($P267)
.end


.namespace ["Exception";"AttribNotFound"]
.sub "type"  :subid("96_1268929852.10439") :method :outer("95_1268929852.10439")
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
.sub "_block271"  :subid("97_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 181
    .const 'Sub' $P273 = "98_1268929852.10439" 
    capture_lex $P273
# .annotate "line", 182
    .const 'Sub' $P273 = "98_1268929852.10439" 
    capture_lex $P273
# .annotate "line", 181
    .return ($P273)
.end


.namespace ["Exception";"GlobalNotFound"]
.sub "type"  :subid("98_1268929852.10439") :method :outer("97_1268929852.10439")
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
.sub "_block277"  :subid("99_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 185
    .const 'Sub' $P279 = "100_1268929852.10439" 
    capture_lex $P279
# .annotate "line", 186
    .const 'Sub' $P279 = "100_1268929852.10439" 
    capture_lex $P279
# .annotate "line", 185
    .return ($P279)
.end


.namespace ["Exception";"ExternalError"]
.sub "type"  :subid("100_1268929852.10439") :method :outer("99_1268929852.10439")
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
.sub "_block283"  :subid("101_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 189
    .const 'Sub' $P285 = "102_1268929852.10439" 
    capture_lex $P285
# .annotate "line", 190
    .const 'Sub' $P285 = "102_1268929852.10439" 
    capture_lex $P285
# .annotate "line", 189
    .return ($P285)
.end


.namespace ["Exception";"MethodNotFound"]
.sub "type"  :subid("102_1268929852.10439") :method :outer("101_1268929852.10439")
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
.sub "_block289"  :subid("103_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 193
    .const 'Sub' $P291 = "104_1268929852.10439" 
    capture_lex $P291
# .annotate "line", 194
    .const 'Sub' $P291 = "104_1268929852.10439" 
    capture_lex $P291
# .annotate "line", 193
    .return ($P291)
.end


.namespace ["Exception";"VtableNotFound"]
.sub "type"  :subid("104_1268929852.10439") :method :outer("103_1268929852.10439")
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
.sub "_block295"  :subid("105_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 197
    .const 'Sub' $P297 = "106_1268929852.10439" 
    capture_lex $P297
# .annotate "line", 198
    .const 'Sub' $P297 = "106_1268929852.10439" 
    capture_lex $P297
# .annotate "line", 197
    .return ($P297)
.end


.namespace ["Exception";"WriteToConstclass"]
.sub "type"  :subid("106_1268929852.10439") :method :outer("105_1268929852.10439")
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
.sub "_block301"  :subid("107_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 201
    .const 'Sub' $P303 = "108_1268929852.10439" 
    capture_lex $P303
# .annotate "line", 202
    .const 'Sub' $P303 = "108_1268929852.10439" 
    capture_lex $P303
# .annotate "line", 201
    .return ($P303)
.end


.namespace ["Exception";"Nospawn"]
.sub "type"  :subid("108_1268929852.10439") :method :outer("107_1268929852.10439")
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
.sub "_block307"  :subid("109_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 205
    .const 'Sub' $P309 = "110_1268929852.10439" 
    capture_lex $P309
# .annotate "line", 206
    .const 'Sub' $P309 = "110_1268929852.10439" 
    capture_lex $P309
# .annotate "line", 205
    .return ($P309)
.end


.namespace ["Exception";"InternalNotImplemented"]
.sub "type"  :subid("110_1268929852.10439") :method :outer("109_1268929852.10439")
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
.sub "_block313"  :subid("111_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 209
    .const 'Sub' $P315 = "112_1268929852.10439" 
    capture_lex $P315
# .annotate "line", 210
    .const 'Sub' $P315 = "112_1268929852.10439" 
    capture_lex $P315
# .annotate "line", 209
    .return ($P315)
.end


.namespace ["Exception";"ErrOverflow"]
.sub "type"  :subid("112_1268929852.10439") :method :outer("111_1268929852.10439")
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
.sub "_block319"  :subid("113_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 213
    .const 'Sub' $P321 = "114_1268929852.10439" 
    capture_lex $P321
# .annotate "line", 214
    .const 'Sub' $P321 = "114_1268929852.10439" 
    capture_lex $P321
# .annotate "line", 213
    .return ($P321)
.end


.namespace ["Exception";"LossyConversion"]
.sub "type"  :subid("114_1268929852.10439") :method :outer("113_1268929852.10439")
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
.sub "_block325"  :subid("115_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 217
    .const 'Sub' $P327 = "116_1268929852.10439" 
    capture_lex $P327
# .annotate "line", 218
    .const 'Sub' $P327 = "116_1268929852.10439" 
    capture_lex $P327
# .annotate "line", 217
    .return ($P327)
.end


.namespace ["Exception";"RoleCompositionMethodConflict"]
.sub "type"  :subid("116_1268929852.10439") :method :outer("115_1268929852.10439")
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
.sub "_block331"  :subid("117_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 221
    .const 'Sub' $P333 = "118_1268929852.10439" 
    capture_lex $P333
# .annotate "line", 222
    .const 'Sub' $P333 = "118_1268929852.10439" 
    capture_lex $P333
# .annotate "line", 221
    .return ($P333)
.end


.namespace ["Exception";"UnexpectedNull"]
.sub "type"  :subid("118_1268929852.10439") :method :outer("117_1268929852.10439")
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
.sub "_block337"  :subid("119_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 225
    .const 'Sub' $P339 = "120_1268929852.10439" 
    capture_lex $P339
# .annotate "line", 226
    .const 'Sub' $P339 = "120_1268929852.10439" 
    capture_lex $P339
# .annotate "line", 225
    .return ($P339)
.end


.namespace ["Exception";"LibraryError"]
.sub "type"  :subid("120_1268929852.10439") :method :outer("119_1268929852.10439")
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
.sub "_block343"  :subid("121_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 229
    .const 'Sub' $P345 = "122_1268929852.10439" 
    capture_lex $P345
# .annotate "line", 230
    .const 'Sub' $P345 = "122_1268929852.10439" 
    capture_lex $P345
# .annotate "line", 229
    .return ($P345)
.end


.namespace ["Exception";"LibraryNotLoaded"]
.sub "type"  :subid("122_1268929852.10439") :method :outer("121_1268929852.10439")
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
.sub "_block349"  :subid("123_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 233
    .const 'Sub' $P351 = "124_1268929852.10439" 
    capture_lex $P351
# .annotate "line", 234
    .const 'Sub' $P351 = "124_1268929852.10439" 
    capture_lex $P351
# .annotate "line", 233
    .return ($P351)
.end


.namespace ["Exception";"SyntaxError"]
.sub "type"  :subid("124_1268929852.10439") :method :outer("123_1268929852.10439")
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
.sub "_block355"  :subid("125_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 237
    .const 'Sub' $P357 = "126_1268929852.10439" 
    capture_lex $P357
# .annotate "line", 238
    .const 'Sub' $P357 = "126_1268929852.10439" 
    capture_lex $P357
# .annotate "line", 237
    .return ($P357)
.end


.namespace ["Exception";"MalformedPackfile"]
.sub "type"  :subid("126_1268929852.10439") :method :outer("125_1268929852.10439")
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
.sub "_block361"  :subid("127_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 241
    .const 'Sub' $P363 = "128_1268929852.10439" 
    capture_lex $P363
# .annotate "line", 242
    .const 'Sub' $P363 = "128_1268929852.10439" 
    capture_lex $P363
# .annotate "line", 241
    .return ($P363)
.end


.namespace ["Control";"Return"]
.sub "type"  :subid("128_1268929852.10439") :method :outer("127_1268929852.10439")
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
.sub "_block367"  :subid("129_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 245
    .const 'Sub' $P369 = "130_1268929852.10439" 
    capture_lex $P369
# .annotate "line", 246
    .const 'Sub' $P369 = "130_1268929852.10439" 
    capture_lex $P369
# .annotate "line", 245
    .return ($P369)
.end


.namespace ["Control";"Ok"]
.sub "type"  :subid("130_1268929852.10439") :method :outer("129_1268929852.10439")
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
.sub "_block373"  :subid("131_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 249
    .const 'Sub' $P375 = "132_1268929852.10439" 
    capture_lex $P375
# .annotate "line", 250
    .const 'Sub' $P375 = "132_1268929852.10439" 
    capture_lex $P375
# .annotate "line", 249
    .return ($P375)
.end


.namespace ["Control";"Break"]
.sub "type"  :subid("132_1268929852.10439") :method :outer("131_1268929852.10439")
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
.sub "_block379"  :subid("133_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 253
    .const 'Sub' $P381 = "134_1268929852.10439" 
    capture_lex $P381
# .annotate "line", 254
    .const 'Sub' $P381 = "134_1268929852.10439" 
    capture_lex $P381
# .annotate "line", 253
    .return ($P381)
.end


.namespace ["Control";"Continue"]
.sub "type"  :subid("134_1268929852.10439") :method :outer("133_1268929852.10439")
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
.sub "_block385"  :subid("135_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 257
    .const 'Sub' $P387 = "136_1268929852.10439" 
    capture_lex $P387
# .annotate "line", 258
    .const 'Sub' $P387 = "136_1268929852.10439" 
    capture_lex $P387
# .annotate "line", 257
    .return ($P387)
.end


.namespace ["Control";"Error"]
.sub "type"  :subid("136_1268929852.10439") :method :outer("135_1268929852.10439")
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
.sub "_block391"  :subid("137_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 261
    .const 'Sub' $P393 = "138_1268929852.10439" 
    capture_lex $P393
# .annotate "line", 262
    .const 'Sub' $P393 = "138_1268929852.10439" 
    capture_lex $P393
# .annotate "line", 261
    .return ($P393)
.end


.namespace ["Control";"Take"]
.sub "type"  :subid("138_1268929852.10439") :method :outer("137_1268929852.10439")
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
.sub "_block397"  :subid("139_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 265
    .const 'Sub' $P399 = "140_1268929852.10439" 
    capture_lex $P399
# .annotate "line", 266
    .const 'Sub' $P399 = "140_1268929852.10439" 
    capture_lex $P399
# .annotate "line", 265
    .return ($P399)
.end


.namespace ["Control";"Leave"]
.sub "type"  :subid("140_1268929852.10439") :method :outer("139_1268929852.10439")
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
.sub "_block403"  :subid("141_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 269
    .const 'Sub' $P405 = "142_1268929852.10439" 
    capture_lex $P405
# .annotate "line", 270
    .const 'Sub' $P405 = "142_1268929852.10439" 
    capture_lex $P405
# .annotate "line", 269
    .return ($P405)
.end


.namespace ["Control";"LoopNext"]
.sub "type"  :subid("142_1268929852.10439") :method :outer("141_1268929852.10439")
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
.sub "_block409"  :subid("143_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 273
    .const 'Sub' $P411 = "144_1268929852.10439" 
    capture_lex $P411
# .annotate "line", 274
    .const 'Sub' $P411 = "144_1268929852.10439" 
    capture_lex $P411
# .annotate "line", 273
    .return ($P411)
.end


.namespace ["Control";"LoopLast"]
.sub "type"  :subid("144_1268929852.10439") :method :outer("143_1268929852.10439")
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
.sub "_block415"  :subid("145_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 277
    .const 'Sub' $P417 = "146_1268929852.10439" 
    capture_lex $P417
# .annotate "line", 278
    .const 'Sub' $P417 = "146_1268929852.10439" 
    capture_lex $P417
# .annotate "line", 277
    .return ($P417)
.end


.namespace ["Control";"LoopRedo"]
.sub "type"  :subid("146_1268929852.10439") :method :outer("145_1268929852.10439")
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
.sub "_block421"  :subid("147_1268929852.10439") :outer("10_1268929852.10439")
# .annotate "line", 285
    get_hll_global $P424, ["Exception";"InvalidArgument"], "_block423" 
    capture_lex $P424
    get_hll_global $P424, ["Exception";"InvalidArgument"], "_block423" 
    capture_lex $P424
    $P425 = $P424()
    .return ($P425)
.end


.namespace ["Exception";"AbstractMethodCalled"]
.sub "" :load :init :subid("post150") :outer("147_1268929852.10439")
# .annotate "line", 285
    get_hll_global $P422, ["Exception";"AbstractMethodCalled"], "_block421" 
    .local pmc block
    set block, $P422
    $P426 = get_root_global ["parrot"], "P6metaclass"
    $P426."new_class"("Exception::InvalidArgument", "Exception::Wrapper" :named("parent"))
.end


.namespace ["Exception";"InvalidArgument"]
.sub "_block423"  :subid("148_1268929852.10439") :outer("147_1268929852.10439")
# .annotate "line", 285
    .return ()
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929832.73409")
# .annotate "line", 0
    get_hll_global $P14, ["File"], "_block13" 
    capture_lex $P14
# .annotate "line", 70
    get_hll_global $P14, ["File"], "_block13" 
    capture_lex $P14
    $P29 = $P14()
# .annotate "line", 1
    .return ($P29)
.end


.namespace ["File"]
.sub "_block13"  :subid("11_1268929832.73409") :outer("10_1268929832.73409")
# .annotate "line", 70
    .const 'Sub' $P15 = "12_1268929832.73409" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929832.73409" 
    capture_lex $P15
    .lex "slurp", $P15
    find_lex $P28, "slurp"
    .return ($P28)
.end


.namespace ["File"]
.sub "slurp"  :subid("12_1268929832.73409") :outer("11_1268929832.73409")
    .param pmc param_18
# .annotate "line", 70
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "$path", param_18
# .annotate "line", 71
    new $P19, "Undef"
    .lex "$fh", $P19
# .annotate "line", 72
    new $P20, "Undef"
    .lex "$data", $P20
# .annotate "line", 71
    new $P21, "String"
    assign $P21, "FileHandle"
    set $S22, $P21
    new $P23, $S22
    store_lex "$fh", $P23
# .annotate "line", 72
    find_lex $P24, "$fh"
    find_lex $P25, "$path"
    $P26 = $P24."readall"($P25)
    store_lex "$data", $P26
# .annotate "line", 70
    .return ($P26)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P27, exception, "payload"
    .return ($P27)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929871.47468")
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
.sub "_block13"  :subid("11_1268929871.47468") :outer("10_1268929871.47468")
# .annotate "line", 6
    .const 'Sub' $P100 = "18_1268929871.47468" 
    capture_lex $P100
    .const 'Sub' $P96 = "17_1268929871.47468" 
    capture_lex $P96
    .const 'Sub' $P86 = "16_1268929871.47468" 
    capture_lex $P86
    .const 'Sub' $P77 = "15_1268929871.47468" 
    capture_lex $P77
    .const 'Sub' $P21 = "13_1268929871.47468" 
    capture_lex $P21
    .const 'Sub' $P15 = "12_1268929871.47468" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929871.47468" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 19
    .const 'Sub' $P21 = "13_1268929871.47468" 
    capture_lex $P21
    .lex "create_key", $P21
# .annotate "line", 6
    find_lex $P76, "_pre_initload"
# .annotate "line", 14
    find_lex $P95, "create_key"
# .annotate "line", 54
    .const 'Sub' $P100 = "18_1268929871.47468" 
    capture_lex $P100
# .annotate "line", 6
    .return ($P100)
.end


.namespace ["Key"]
.sub "_pre_initload"  :subid("12_1268929871.47468") :outer("11_1268929871.47468")
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
.sub "create_key"  :subid("13_1268929871.47468") :outer("11_1268929871.47468")
    .param pmc param_24 :slurpy
    .param pmc param_25 :slurpy :named
# .annotate "line", 19
    .const 'Sub' $P35 = "14_1268929871.47468" 
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
    .const 'Sub' $P35 = "14_1268929871.47468" 
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
.sub "_block34"  :anon :subid("14_1268929871.47468") :outer("13_1268929871.47468")
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
.sub "__dump"  :subid("15_1268929871.47468") :method :outer("11_1268929871.47468")
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
.sub "new"  :subid("16_1268929871.47468") :method :outer("11_1268929871.47468")
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
.sub "defined"  :subid("17_1268929871.47468") :method :outer("11_1268929871.47468")
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
.sub "push"  :subid("18_1268929871.47468") :method :outer("11_1268929871.47468")
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
.sub "_block11"  :anon :subid("10_1268929867.52462")
# .annotate "line", 0
    get_hll_global $P14, ["Hash"], "_block13" 
    capture_lex $P14
# .annotate "line", 53
    get_hll_global $P14, ["Hash"], "_block13" 
    capture_lex $P14
    $P327 = $P14()
# .annotate "line", 1
    .return ($P327)
.end


.namespace ["Hash"]
.sub "_block13"  :subid("11_1268929867.52462") :outer("10_1268929867.52462")
# .annotate "line", 53
    .const 'Sub' $P306 = "32_1268929867.52462" 
    capture_lex $P306
    .const 'Sub' $P281 = "30_1268929867.52462" 
    capture_lex $P281
    .const 'Sub' $P216 = "27_1268929867.52462" 
    capture_lex $P216
    .const 'Sub' $P192 = "25_1268929867.52462" 
    capture_lex $P192
    .const 'Sub' $P168 = "23_1268929867.52462" 
    capture_lex $P168
    .const 'Sub' $P147 = "21_1268929867.52462" 
    capture_lex $P147
    .const 'Sub' $P119 = "19_1268929867.52462" 
    capture_lex $P119
    .const 'Sub' $P111 = "18_1268929867.52462" 
    capture_lex $P111
    .const 'Sub' $P105 = "17_1268929867.52462" 
    capture_lex $P105
    .const 'Sub' $P99 = "16_1268929867.52462" 
    capture_lex $P99
    .const 'Sub' $P93 = "15_1268929867.52462" 
    capture_lex $P93
    .const 'Sub' $P15 = "12_1268929867.52462" 
    capture_lex $P15
# .annotate "line", 179
    .const 'Sub' $P15 = "12_1268929867.52462" 
    capture_lex $P15
    .lex "merge_keys", $P15
# .annotate "line", 138
    find_lex $P280, "merge_keys"
# .annotate "line", 242
    .const 'Sub' $P306 = "32_1268929867.52462" 
    capture_lex $P306
# .annotate "line", 53
    .return ($P306)
.end


.namespace ["Hash"]
.sub "merge_keys"  :subid("12_1268929867.52462") :outer("11_1268929867.52462")
    .param pmc param_18
    .param pmc param_19 :slurpy
    .param pmc param_20 :named("keys")
    .param pmc param_21 :optional :named("into")
    .param int has_param_21 :opt_flag
    .param pmc param_23 :optional :named("use_last")
    .param int has_param_23 :opt_flag
# .annotate "line", 179
    .const 'Sub' $P53 = "13_1268929867.52462" 
    capture_lex $P53
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "%first", param_18
    .lex "@hashes", param_19
    .lex "@keys", param_20
    if has_param_21, optparam_34
    $P22 = root_new ['parrot';'Hash']
    set param_21, $P22
  optparam_34:
    .lex "%into", param_21
    if has_param_23, optparam_35
    new $P24, "Undef"
    set param_23, $P24
  optparam_35:
    .lex "$use_last", param_23
# .annotate "line", 190
    $P25 = root_new ['parrot';'Hash']
    .lex "%stored", $P25
# .annotate "line", 180
    find_lex $P26, "@hashes"
    find_lex $P27, "%first"
    $P26."unshift"($P27)
# .annotate "line", 182
    get_hll_global $P29, ["Opcode"], "defined"
    find_lex $P30, "%into"
    $P31 = $P29($P30)
    if $P31, unless_28_end
# .annotate "line", 183
    find_lex $P32, "@hashes"
    $P33 = $P32."shift"()
    store_lex "%into", $P33
# .annotate "line", 185
    get_hll_global $P35, ["Opcode"], "defined"
    find_lex $P36, "%into"
    $P37 = $P35($P36)
    if $P37, unless_34_end
# .annotate "line", 186
    get_hll_global $P38, "Hash"
    $P39 = $P38."new"()
    store_lex "%into", $P39
  unless_34_end:
  unless_28_end:
# .annotate "line", 190
    find_lex $P40, "%into"
    store_lex "%stored", $P40
# .annotate "line", 192
    find_lex $P42, "$use_last"
    unless $P42, if_41_end
# .annotate "line", 193
    get_hll_global $P43, ["Array"], "reverse"
    find_lex $P44, "@hashes"
    $P45 = $P43($P44)
    store_lex "@hashes", $P45
# .annotate "line", 194
    get_hll_global $P46, ["Hash"], "empty"
    $P47 = $P46()
    store_lex "%stored", $P47
  if_41_end:
# .annotate "line", 197
    find_lex $P49, "@hashes"
    defined $I50, $P49
    unless $I50, for_undef_36
    iter $P48, $P49
    new $P88, 'ExceptionHandler'
    set_addr $P88, loop87_handler
    $P88."handle_types"(65, 67, 66)
    push_eh $P88
  loop87_test:
    unless $P48, loop87_done
    shift $P51, $P48
  loop87_redo:
    .const 'Sub' $P53 = "13_1268929867.52462" 
    capture_lex $P53
    $P53($P51)
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
  for_undef_36:
# .annotate "line", 208
    new $P90, "Exception"
    set $P90['type'], 58
    find_lex $P91, "%into"
    setattribute $P90, 'payload', $P91
    throw $P90
# .annotate "line", 179
    .return ()
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P92, exception, "payload"
    .return ($P92)
.end


.namespace ["Hash"]
.sub "_block52"  :anon :subid("13_1268929867.52462") :outer("12_1268929867.52462")
    .param pmc param_55
# .annotate "line", 197
    .const 'Sub' $P62 = "14_1268929867.52462" 
    capture_lex $P62
# .annotate "line", 198
    new $P54, "Undef"
    .lex "$hash", $P54
    .lex "$_", param_55
    find_lex $P56, "$_"
    store_lex "$hash", $P56
# .annotate "line", 200
    find_lex $P58, "@keys"
    defined $I59, $P58
    unless $I59, for_undef_37
    iter $P57, $P58
    new $P85, 'ExceptionHandler'
    set_addr $P85, loop84_handler
    $P85."handle_types"(65, 67, 66)
    push_eh $P85
  loop84_test:
    unless $P57, loop84_done
    shift $P60, $P57
  loop84_redo:
    .const 'Sub' $P62 = "14_1268929867.52462" 
    capture_lex $P62
    $P62($P60)
  loop84_next:
    goto loop84_test
  loop84_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P86, exception, 'type'
    eq $P86, 65, loop84_next
    eq $P86, 67, loop84_redo
  loop84_done:
    pop_eh 
  for_undef_37:
# .annotate "line", 197
    .return ($P57)
.end


.namespace ["Hash"]
.sub "_block61"  :anon :subid("14_1268929867.52462") :outer("13_1268929867.52462")
    .param pmc param_63
# .annotate "line", 200
    .lex "$_", param_63
# .annotate "line", 201
    get_hll_global $P68, ["Hash"], "exists"
    find_lex $P69, "%stored"
    find_lex $P70, "$_"
    $P71 = $P68($P69, $P70)
    isfalse $I72, $P71
    if $I72, if_67
    new $P66, 'Integer'
    set $P66, $I72
    goto if_67_end
  if_67:
    get_hll_global $P73, ["Hash"], "exists"
    find_lex $P74, "$hash"
    find_lex $P75, "$_"
    $P76 = $P73($P74, $P75)
    set $P66, $P76
  if_67_end:
    if $P66, if_65
    set $P64, $P66
    goto if_65_end
  if_65:
# .annotate "line", 203
    find_lex $P77, "$_"
    find_lex $P78, "$hash"
    unless_null $P78, vivify_38
    $P78 = root_new ['parrot';'Hash']
  vivify_38:
    set $P79, $P78[$P77]
    unless_null $P79, vivify_39
    new $P79, "Undef"
  vivify_39:
    find_lex $P80, "$_"
    find_lex $P81, "%stored"
    unless_null $P81, vivify_40
    $P81 = root_new ['parrot';'Hash']
    store_lex "%stored", $P81
  vivify_40:
    set $P81[$P80], $P79
    find_lex $P82, "$_"
    find_lex $P83, "%into"
    unless_null $P83, vivify_41
    $P83 = root_new ['parrot';'Hash']
    store_lex "%into", $P83
  vivify_41:
    set $P83[$P82], $P79
# .annotate "line", 201
    set $P64, $P79
  if_65_end:
# .annotate "line", 200
    .return ($P64)
.end


.namespace ["Hash"]
.sub "contains"  :subid("15_1268929867.52462") :method :outer("11_1268929867.52462")
    .param pmc param_96
# .annotate "line", 53
    new $P95, 'ExceptionHandler'
    set_addr $P95, control_94
    $P95."handle_types"(58)
    push_eh $P95
    .lex "self", self
    .lex "$key", param_96
# .annotate "line", 54

		$P0 = find_lex 'self'
		$P1 = find_lex '$key'
		$I0 = exists $P0[$P1]
		$P97 = box $I0
	
# .annotate "line", 53
    .return ($P97)
  control_94:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P98, exception, "payload"
    .return ($P98)
.end


.namespace ["Hash"]
.sub "delete"  :subid("16_1268929867.52462") :method :outer("11_1268929867.52462")
    .param pmc param_102
# .annotate "line", 73
    new $P101, 'ExceptionHandler'
    set_addr $P101, control_100
    $P101."handle_types"(58)
    push_eh $P101
    .lex "self", self
    .lex "$key", param_102
# .annotate "line", 74

		$P103  = find_lex 'self'
		$P1 = find_lex '$key'
		delete $P103[$P1]
	
# .annotate "line", 73
    .return ($P103)
  control_100:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["Hash"]
.sub "elems"  :subid("17_1268929867.52462") :method :outer("11_1268929867.52462")
# .annotate "line", 81
    new $P107, 'ExceptionHandler'
    set_addr $P107, control_106
    $P107."handle_types"(58)
    push_eh $P107
    .lex "self", self
# .annotate "line", 82
    find_lex $P108, "self"
    elements $I109, $P108
# .annotate "line", 81
    .return ($I109)
  control_106:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Hash"]
.sub "exists"  :subid("18_1268929867.52462") :method :outer("11_1268929867.52462")
    .param pmc param_114
# .annotate "line", 85
    new $P113, 'ExceptionHandler'
    set_addr $P113, control_112
    $P113."handle_types"(58)
    push_eh $P113
    .lex "self", self
    .lex "$key", param_114
# .annotate "line", 86
    find_lex $P115, "self"
    find_lex $P116, "$key"
    $P117 = $P115."contains"($P116)
# .annotate "line", 85
    .return ($P117)
  control_112:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, "payload"
    .return ($P118)
.end


.namespace ["Hash"]
.sub "grep"  :subid("19_1268929867.52462") :method :outer("11_1268929867.52462")
    .param pmc param_122
# .annotate "line", 89
    .const 'Sub' $P130 = "20_1268929867.52462" 
    capture_lex $P130
    new $P121, 'ExceptionHandler'
    set_addr $P121, control_120
    $P121."handle_types"(58)
    push_eh $P121
    .lex "self", self
    .lex "&match", param_122
# .annotate "line", 90
    $P123 = root_new ['parrot';'Hash']
    .lex "%matches", $P123
# .annotate "line", 89
    find_lex $P124, "%matches"
# .annotate "line", 92
    find_lex $P126, "self"
    defined $I127, $P126
    unless $I127, for_undef_42
    iter $P125, $P126
    new $P143, 'ExceptionHandler'
    set_addr $P143, loop142_handler
    $P143."handle_types"(65, 67, 66)
    push_eh $P143
  loop142_test:
    unless $P125, loop142_done
    shift $P128, $P125
  loop142_redo:
    .const 'Sub' $P130 = "20_1268929867.52462" 
    capture_lex $P130
    $P130($P128)
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
  for_undef_42:
    find_lex $P145, "%matches"
# .annotate "line", 89
    .return ($P145)
  control_120:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P146, exception, "payload"
    .return ($P146)
.end


.namespace ["Hash"]
.sub "_block129"  :anon :subid("20_1268929867.52462") :outer("19_1268929867.52462")
    .param pmc param_131
# .annotate "line", 92
    .lex "$_", param_131
# .annotate "line", 94
    find_lex $P134, "&match"
    find_lex $P135, "$_"
    $P136 = $P134($P135)
    if $P136, if_133
    set $P132, $P136
    goto if_133_end
  if_133:
# .annotate "line", 93
    find_lex $P137, "$_"
    $P138 = $P137."value"()
    find_lex $P139, "$_"
    $P140 = $P139."key"()
    find_lex $P141, "%matches"
    unless_null $P141, vivify_43
    $P141 = root_new ['parrot';'Hash']
    store_lex "%matches", $P141
  vivify_43:
    set $P141[$P140], $P138
    set $P132, $P138
  if_133_end:
# .annotate "line", 92
    .return ($P132)
.end


.namespace ["Hash"]
.sub "keys"  :subid("21_1268929867.52462") :method :outer("11_1268929867.52462")
# .annotate "line", 100
    .const 'Sub' $P157 = "22_1268929867.52462" 
    capture_lex $P157
    new $P149, 'ExceptionHandler'
    set_addr $P149, control_148
    $P149."handle_types"(58)
    push_eh $P149
    .lex "self", self
# .annotate "line", 101
    $P150 = root_new ['parrot';'ResizablePMCArray']
    .lex "@keys", $P150
# .annotate "line", 100
    find_lex $P151, "@keys"
# .annotate "line", 103
    find_lex $P153, "self"
    defined $I154, $P153
    unless $I154, for_undef_44
    iter $P152, $P153
    new $P164, 'ExceptionHandler'
    set_addr $P164, loop163_handler
    $P164."handle_types"(65, 67, 66)
    push_eh $P164
  loop163_test:
    unless $P152, loop163_done
    shift $P155, $P152
  loop163_redo:
    .const 'Sub' $P157 = "22_1268929867.52462" 
    capture_lex $P157
    $P157($P155)
  loop163_next:
    goto loop163_test
  loop163_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P165, exception, 'type'
    eq $P165, 65, loop163_next
    eq $P165, 67, loop163_redo
  loop163_done:
    pop_eh 
  for_undef_44:
    find_lex $P166, "@keys"
# .annotate "line", 100
    .return ($P166)
  control_148:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P167, exception, "payload"
    .return ($P167)
.end


.namespace ["Hash"]
.sub "_block156"  :anon :subid("22_1268929867.52462") :outer("21_1268929867.52462")
    .param pmc param_158
# .annotate "line", 103
    .lex "$_", param_158
# .annotate "line", 104
    find_lex $P159, "@keys"
    find_lex $P160, "$_"
    $P161 = $P160."key"()
    $P162 = $P159."push"($P161)
# .annotate "line", 103
    .return ($P162)
.end


.namespace ["Hash"]
.sub "kv"  :subid("23_1268929867.52462") :method :outer("11_1268929867.52462")
# .annotate "line", 110
    .const 'Sub' $P178 = "24_1268929867.52462" 
    capture_lex $P178
    new $P170, 'ExceptionHandler'
    set_addr $P170, control_169
    $P170."handle_types"(58)
    push_eh $P170
    .lex "self", self
# .annotate "line", 111
    $P171 = root_new ['parrot';'ResizablePMCArray']
    .lex "@kv", $P171
# .annotate "line", 110
    find_lex $P172, "@kv"
# .annotate "line", 113
    find_lex $P174, "self"
    defined $I175, $P174
    unless $I175, for_undef_45
    iter $P173, $P174
    new $P188, 'ExceptionHandler'
    set_addr $P188, loop187_handler
    $P188."handle_types"(65, 67, 66)
    push_eh $P188
  loop187_test:
    unless $P173, loop187_done
    shift $P176, $P173
  loop187_redo:
    .const 'Sub' $P178 = "24_1268929867.52462" 
    capture_lex $P178
    $P178($P176)
  loop187_next:
    goto loop187_test
  loop187_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P189, exception, 'type'
    eq $P189, 65, loop187_next
    eq $P189, 67, loop187_redo
  loop187_done:
    pop_eh 
  for_undef_45:
    find_lex $P190, "@kv"
# .annotate "line", 110
    .return ($P190)
  control_169:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P191, exception, "payload"
    .return ($P191)
.end


.namespace ["Hash"]
.sub "_block177"  :anon :subid("24_1268929867.52462") :outer("23_1268929867.52462")
    .param pmc param_179
# .annotate "line", 113
    .lex "$_", param_179
# .annotate "line", 114
    find_lex $P180, "@kv"
    find_lex $P181, "$_"
    $P182 = $P181."key"()
    $P180."push"($P182)
# .annotate "line", 115
    find_lex $P183, "@kv"
    find_lex $P184, "$_"
    $P185 = $P184."value"()
    $P186 = $P183."push"($P185)
# .annotate "line", 113
    .return ($P186)
.end


.namespace ["Hash"]
.sub "map"  :subid("25_1268929867.52462") :method :outer("11_1268929867.52462")
    .param pmc param_195
# .annotate "line", 121
    .const 'Sub' $P203 = "26_1268929867.52462" 
    capture_lex $P203
    new $P194, 'ExceptionHandler'
    set_addr $P194, control_193
    $P194."handle_types"(58)
    push_eh $P194
    .lex "self", self
    .lex "&match", param_195
# .annotate "line", 122
    $P196 = root_new ['parrot';'Hash']
    .lex "%result", $P196
# .annotate "line", 121
    find_lex $P197, "%result"
# .annotate "line", 124
    find_lex $P199, "self"
    defined $I200, $P199
    unless $I200, for_undef_46
    iter $P198, $P199
    new $P212, 'ExceptionHandler'
    set_addr $P212, loop211_handler
    $P212."handle_types"(65, 67, 66)
    push_eh $P212
  loop211_test:
    unless $P198, loop211_done
    shift $P201, $P198
  loop211_redo:
    .const 'Sub' $P203 = "26_1268929867.52462" 
    capture_lex $P203
    $P203($P201)
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
  for_undef_46:
    find_lex $P214, "%result"
# .annotate "line", 121
    .return ($P214)
  control_193:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P215, exception, "payload"
    .return ($P215)
.end


.namespace ["Hash"]
.sub "_block202"  :anon :subid("26_1268929867.52462") :outer("25_1268929867.52462")
    .param pmc param_204
# .annotate "line", 124
    .lex "$_", param_204
# .annotate "line", 125
    find_lex $P205, "&match"
    find_lex $P206, "$_"
    $P207 = $P205($P206)
    find_lex $P208, "$_"
    $P209 = $P208."key"()
    find_lex $P210, "%result"
    unless_null $P210, vivify_47
    $P210 = root_new ['parrot';'Hash']
    store_lex "%result", $P210
  vivify_47:
    set $P210[$P209], $P207
# .annotate "line", 124
    .return ($P207)
.end


.namespace ["Hash"]
.sub "merge"  :subid("27_1268929867.52462") :method :outer("11_1268929867.52462")
    .param pmc param_219 :slurpy
    .param pmc param_220 :optional :named("into")
    .param int has_param_220 :opt_flag
    .param pmc param_222 :optional :named("priority")
    .param int has_param_222 :opt_flag
# .annotate "line", 138
    .const 'Sub' $P249 = "28_1268929867.52462" 
    capture_lex $P249
    new $P218, 'ExceptionHandler'
    set_addr $P218, control_217
    $P218."handle_types"(58)
    push_eh $P218
    .lex "self", self
    .lex "@hashes", param_219
    if has_param_220, optparam_48
    find_lex $P221, "self"
    set param_220, $P221
  optparam_48:
    .lex "%into", param_220
    if has_param_222, optparam_49
    new $P223, "String"
    assign $P223, "left"
    set param_222, $P223
  optparam_49:
    .lex "$priority", param_222
# .annotate "line", 151
    $P224 = root_new ['parrot';'Hash']
    .lex "%stored", $P224
# .annotate "line", 140
    find_lex $P226, "self"
    isa $I227, $P226, "P6protoobject"
    new $P228, 'Integer'
    set $P228, $I227
    isfalse $I229, $P228
    if $I229, if_225
# .annotate "line", 143
    find_lex $P233, "@hashes"
    $N234 = $P233."elems"()
    iseq $I235, $N234, 0.0
    unless $I235, if_232_end
# .annotate "line", 144
    "die"("You must provide at least one real hash to .merge()")
  if_232_end:
# .annotate "line", 143
    goto if_225_end
  if_225:
# .annotate "line", 141
    find_lex $P230, "@hashes"
    find_lex $P231, "self"
    $P230."unshift"($P231)
  if_225_end:
# .annotate "line", 151
    find_lex $P236, "%into"
    store_lex "%stored", $P236
# .annotate "line", 153
    find_lex $P238, "$priority"
    set $S239, $P238
    iseq $I240, $S239, "right"
    unless $I240, if_237_end
# .annotate "line", 154
    find_lex $P241, "@hashes"
    $P241."reverse"()
# .annotate "line", 155
    get_hll_global $P242, "Hash"
    $P243 = $P242."new"()
    store_lex "%stored", $P243
  if_237_end:
# .annotate "line", 158
    find_lex $P245, "@hashes"
    defined $I246, $P245
    unless $I246, for_undef_50
    iter $P244, $P245
    new $P276, 'ExceptionHandler'
    set_addr $P276, loop275_handler
    $P276."handle_types"(65, 67, 66)
    push_eh $P276
  loop275_test:
    unless $P244, loop275_done
    shift $P247, $P244
  loop275_redo:
    .const 'Sub' $P249 = "28_1268929867.52462" 
    capture_lex $P249
    $P249($P247)
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
  for_undef_50:
    find_lex $P278, "%into"
# .annotate "line", 138
    .return ($P278)
  control_217:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P279, exception, "payload"
    .return ($P279)
.end


.namespace ["Hash"]
.sub "_block248"  :anon :subid("28_1268929867.52462") :outer("27_1268929867.52462")
    .param pmc param_250
# .annotate "line", 158
    .const 'Sub' $P256 = "29_1268929867.52462" 
    capture_lex $P256
    .lex "$hash", param_250
# .annotate "line", 159
    find_lex $P252, "$hash"
    defined $I253, $P252
    unless $I253, for_undef_51
    iter $P251, $P252
    new $P273, 'ExceptionHandler'
    set_addr $P273, loop272_handler
    $P273."handle_types"(65, 67, 66)
    push_eh $P273
  loop272_test:
    unless $P251, loop272_done
    shift $P254, $P251
  loop272_redo:
    .const 'Sub' $P256 = "29_1268929867.52462" 
    capture_lex $P256
    $P256($P254)
  loop272_next:
    goto loop272_test
  loop272_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P274, exception, 'type'
    eq $P274, 65, loop272_next
    eq $P274, 67, loop272_redo
  loop272_done:
    pop_eh 
  for_undef_51:
# .annotate "line", 158
    .return ($P251)
.end


.namespace ["Hash"]
.sub "_block255"  :anon :subid("29_1268929867.52462") :outer("28_1268929867.52462")
    .param pmc param_258
# .annotate "line", 160
    new $P257, "Undef"
    .lex "$key", $P257
    .lex "$_", param_258
    find_lex $P259, "$_"
    $P260 = $P259."key"()
    store_lex "$key", $P260
# .annotate "line", 162
    find_lex $P263, "%stored"
    find_lex $P264, "$key"
    $P265 = $P263."contains"($P264)
    unless $P265, unless_262
    set $P261, $P265
    goto unless_262_end
  unless_262:
# .annotate "line", 164
    find_lex $P266, "$_"
    $P267 = $P266."value"()
    find_lex $P268, "$key"
    find_lex $P269, "%stored"
    unless_null $P269, vivify_52
    $P269 = root_new ['parrot';'Hash']
    store_lex "%stored", $P269
  vivify_52:
    set $P269[$P268], $P267
    find_lex $P270, "$key"
    find_lex $P271, "%into"
    unless_null $P271, vivify_53
    $P271 = root_new ['parrot';'Hash']
    store_lex "%into", $P271
  vivify_53:
    set $P271[$P270], $P267
# .annotate "line", 162
    set $P261, $P267
  unless_262_end:
# .annotate "line", 159
    .return ($P261)
.end


.namespace ["Hash"]
.sub "new"  :subid("30_1268929867.52462") :method :outer("11_1268929867.52462")
    .param pmc param_284 :slurpy
    .param pmc param_285 :slurpy :named
# .annotate "line", 226
    .const 'Sub' $P290 = "31_1268929867.52462" 
    capture_lex $P290
    new $P283, 'ExceptionHandler'
    set_addr $P283, control_282
    $P283."handle_types"(58)
    push_eh $P283
    .lex "self", self
    .lex "@pos", param_284
    .lex "%pairs", param_285
# .annotate "line", 227
    find_lex $P287, "@pos"
    $P288 = $P287."elems"()
    unless $P288, if_286_end
    .const 'Sub' $P290 = "31_1268929867.52462" 
    capture_lex $P290
    $P290()
  if_286_end:
    find_lex $P304, "%pairs"
# .annotate "line", 226
    .return ($P304)
  control_282:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P305, exception, "payload"
    .return ($P305)
.end


.namespace ["Hash"]
.sub "_block289"  :anon :subid("31_1268929867.52462") :outer("30_1268929867.52462")
# .annotate "line", 228
    new $P291, "Undef"
    .lex "$message", $P291
    new $P292, "String"
    assign $P292, "Invalid call to Hash.new with positional args."
    store_lex "$message", $P292
# .annotate "line", 230
    find_lex $P294, "@pos"
    unless_null $P294, vivify_54
    $P294 = root_new ['parrot';'ResizablePMCArray']
  vivify_54:
    set $P295, $P294[0]
    unless_null $P295, vivify_55
    new $P295, "Undef"
  vivify_55:
    new $P296, "String"
    assign $P296, "NameSpace"
    set $S297, $P296
    isa $I298, $P295, $S297
    unless $I298, if_293_end
# .annotate "line", 232
    find_lex $P299, "$message"
    concat $P300, $P299, " Likely a call to {@pos[0].string_name}.new() - before class was created"
    store_lex "$message", $P300
  if_293_end:
# .annotate "line", 235
    find_lex $P301, "@pos"
    find_lex $P302, "%pairs"
    "_dumper"($P301, $P302)
# .annotate "line", 236
    find_lex $P303, "$message"
    die $P303
# .annotate "line", 227
    .return ()
.end


.namespace ["Hash"]
.sub "values"  :subid("32_1268929867.52462") :method :outer("11_1268929867.52462")
# .annotate "line", 242
    .const 'Sub' $P316 = "33_1268929867.52462" 
    capture_lex $P316
    new $P308, 'ExceptionHandler'
    set_addr $P308, control_307
    $P308."handle_types"(58)
    push_eh $P308
    .lex "self", self
# .annotate "line", 243
    $P309 = root_new ['parrot';'ResizablePMCArray']
    .lex "@values", $P309
# .annotate "line", 242
    find_lex $P310, "@values"
# .annotate "line", 245
    find_lex $P312, "self"
    defined $I313, $P312
    unless $I313, for_undef_56
    iter $P311, $P312
    new $P323, 'ExceptionHandler'
    set_addr $P323, loop322_handler
    $P323."handle_types"(65, 67, 66)
    push_eh $P323
  loop322_test:
    unless $P311, loop322_done
    shift $P314, $P311
  loop322_redo:
    .const 'Sub' $P316 = "33_1268929867.52462" 
    capture_lex $P316
    $P316($P314)
  loop322_next:
    goto loop322_test
  loop322_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P324, exception, 'type'
    eq $P324, 65, loop322_next
    eq $P324, 67, loop322_redo
  loop322_done:
    pop_eh 
  for_undef_56:
    find_lex $P325, "@values"
# .annotate "line", 242
    .return ($P325)
  control_307:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P326, exception, "payload"
    .return ($P326)
.end


.namespace ["Hash"]
.sub "_block315"  :anon :subid("33_1268929867.52462") :outer("32_1268929867.52462")
    .param pmc param_317
# .annotate "line", 245
    .lex "$_", param_317
# .annotate "line", 246
    find_lex $P318, "@values"
    find_lex $P319, "$_"
    $P320 = $P319."value"()
    $P321 = $P318."push"($P320)
# .annotate "line", 245
    .return ($P321)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929924.24547")
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
.sub "_block13"  :subid("11_1268929924.24547") :outer("10_1268929924.24547")
# .annotate "line", 9
    .const 'Sub' $P79 = "15_1268929924.24547" 
    capture_lex $P79
    .const 'Sub' $P34 = "13_1268929924.24547" 
    capture_lex $P34
    .const 'Sub' $P15 = "12_1268929924.24547" 
    capture_lex $P15
# .annotate "line", 33
    .const 'Sub' $P79 = "15_1268929924.24547" 
    capture_lex $P79
# .annotate "line", 9
    .return ($P79)
.end


.namespace ["NameSpace"]
.sub "contains"  :subid("12_1268929924.24547") :method :outer("11_1268929924.24547")
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
.sub "__dump"  :subid("13_1268929924.24547") :method :outer("11_1268929924.24547")
    .param pmc param_37
    .param pmc param_38
# .annotate "line", 14
    .const 'Sub' $P62 = "14_1268929924.24547" 
    capture_lex $P62
    new $P36, 'ExceptionHandler'
    set_addr $P36, control_35
    $P36."handle_types"(58)
    push_eh $P36
    .lex "self", self
    .lex "$dumper", param_37
    .lex "$label", param_38
# .annotate "line", 15
    $P39 = root_new ['parrot';'ResizablePMCArray']
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
    .const 'Sub' $P62 = "14_1268929924.24547" 
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
.sub "_block61"  :anon :subid("14_1268929924.24547") :outer("13_1268929924.24547")
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
.sub "string_name"  :subid("15_1268929924.24547") :method :outer("11_1268929924.24547")
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
    $P86 = root_new ['parrot';'ResizablePMCArray']
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
.sub "_block11"  :anon :subid("10_1268929934.41563")
# .annotate "line", 0
    get_hll_global $P14, ["String"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["String"], "_block13" 
    capture_lex $P14
    $P523 = $P14()
# .annotate "line", 1
    .return ($P523)
.end


.namespace ["String"]
.sub "_block13"  :subid("11_1268929934.41563") :outer("10_1268929934.41563")
# .annotate "line", 7
    .const 'Sub' $P483 = "29_1268929934.41563" 
    capture_lex $P483
    .const 'Sub' $P405 = "28_1268929934.41563" 
    capture_lex $P405
    .const 'Sub' $P394 = "27_1268929934.41563" 
    capture_lex $P394
    .const 'Sub' $P386 = "26_1268929934.41563" 
    capture_lex $P386
    .const 'Sub' $P376 = "25_1268929934.41563" 
    capture_lex $P376
    .const 'Sub' $P351 = "24_1268929934.41563" 
    capture_lex $P351
    .const 'Sub' $P300 = "23_1268929934.41563" 
    capture_lex $P300
    .const 'Sub' $P258 = "22_1268929934.41563" 
    capture_lex $P258
    .const 'Sub' $P224 = "21_1268929934.41563" 
    capture_lex $P224
    .const 'Sub' $P200 = "20_1268929934.41563" 
    capture_lex $P200
    .const 'Sub' $P184 = "19_1268929934.41563" 
    capture_lex $P184
    .const 'Sub' $P150 = "18_1268929934.41563" 
    capture_lex $P150
    .const 'Sub' $P117 = "17_1268929934.41563" 
    capture_lex $P117
    .const 'Sub' $P109 = "16_1268929934.41563" 
    capture_lex $P109
    .const 'Sub' $P69 = "14_1268929934.41563" 
    capture_lex $P69
    .const 'Sub' $P22 = "13_1268929934.41563" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1268929934.41563" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929934.41563" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 30
    .const 'Sub' $P22 = "13_1268929934.41563" 
    capture_lex $P22
    .lex "character_offset_of", $P22
# .annotate "line", 52
    .const 'Sub' $P69 = "14_1268929934.41563" 
    capture_lex $P69
    .lex "display_width", $P69
# .annotate "line", 80
    .const 'Sub' $P109 = "16_1268929934.41563" 
    capture_lex $P109
    .lex "downcase", $P109
# .annotate "line", 84
    .const 'Sub' $P117 = "17_1268929934.41563" 
    capture_lex $P117
    .lex "find_cclass", $P117
# .annotate "line", 126
    .const 'Sub' $P150 = "18_1268929934.41563" 
    capture_lex $P150
    .lex "find_not_cclass", $P150
# .annotate "line", 165
    .const 'Sub' $P184 = "19_1268929934.41563" 
    capture_lex $P184
    .lex "index", $P184
# .annotate "line", 188
    .const 'Sub' $P200 = "20_1268929934.41563" 
    capture_lex $P200
    .lex "is_cclass", $P200
# .annotate "line", 232
    .const 'Sub' $P224 = "21_1268929934.41563" 
    capture_lex $P224
    .lex "_init_line_number_info", $P224
# .annotate "line", 267
    .const 'Sub' $P258 = "22_1268929934.41563" 
    capture_lex $P258
    .lex "line_number_of", $P258
# .annotate "line", 297
    .const 'Sub' $P300 = "23_1268929934.41563" 
    capture_lex $P300
    .lex "ltrim_indent", $P300
# .annotate "line", 7
    find_lex $P343, "_pre_initload"
    find_lex $P344, "character_offset_of"
    find_lex $P345, "display_width"
    find_lex $P346, "downcase"
    find_lex $P347, "find_cclass"
    find_lex $P348, "find_not_cclass"
    find_lex $P349, "index"
    find_lex $P350, "is_cclass"
# .annotate "line", 210
    find_lex $P375, "_init_line_number_info"
# .annotate "line", 263
    find_lex $P384, "line_number_of"
    find_lex $P385, "ltrim_indent"
# .annotate "line", 358
    .const 'Sub' $P483 = "29_1268929934.41563" 
    capture_lex $P483
# .annotate "line", 7
    .return ($P483)
.end


.namespace ["String"]
.sub "_pre_initload"  :subid("12_1268929934.41563") :outer("11_1268929934.41563")
# .annotate "line", 7
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 8
    get_global $P18, "%Cclass_id"
    unless_null $P18, vivify_31
    $P18 = root_new ['parrot';'Hash']
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
.sub "character_offset_of"  :subid("13_1268929934.41563") :outer("11_1268929934.41563")
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
    $P27 = root_new ['parrot';'Hash']
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
    $P37 = root_new ['parrot';'Hash']
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
    $P41 = root_new ['parrot';'Hash']
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
    $P51 = root_new ['parrot';'Hash']
    store_lex "%opts", $P51
  vivify_37:
    set $P51["line"], $P50
  unless_44_end:
# .annotate "line", 45
    new $P52, "Integer"
    assign $P52, -1
    find_lex $P53, "%opts"
    unless_null $P53, vivify_38
    $P53 = root_new ['parrot';'Hash']
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
    $P59 = root_new ['parrot';'Hash']
  vivify_40:
    set $P60, $P59[$P58]
    unless_null $P60, vivify_41
    $P60 = root_new ['parrot';'ResizablePMCArray']
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
.sub "display_width"  :subid("14_1268929934.41563") :outer("11_1268929934.41563")
    .param pmc param_72
# .annotate "line", 52
    .const 'Sub' $P78 = "15_1268929934.41563" 
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
    .const 'Sub' $P78 = "15_1268929934.41563" 
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
.sub "_block77"  :anon :subid("15_1268929934.41563") :outer("14_1268929934.41563")
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
.sub "downcase"  :subid("16_1268929934.41563") :outer("11_1268929934.41563")
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
.sub "find_cclass"  :subid("17_1268929934.41563") :outer("11_1268929934.41563")
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
    $P125 = root_new ['parrot';'Hash']
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
    $P129 = root_new ['parrot';'Hash']
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
    $P132 = root_new ['parrot';'Hash']
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
    $P143 = root_new ['parrot';'Hash']
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
.sub "find_not_cclass"  :subid("18_1268929934.41563") :outer("11_1268929934.41563")
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
    $P158 = root_new ['parrot';'Hash']
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
    $P161 = root_new ['parrot';'Hash']
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
    $P166 = root_new ['parrot';'Hash']
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
    $P177 = root_new ['parrot';'Hash']
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
.sub "index"  :subid("19_1268929934.41563") :outer("11_1268929934.41563")
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
    $P193 = root_new ['parrot';'Hash']
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
.sub "is_cclass"  :subid("20_1268929934.41563") :outer("11_1268929934.41563")
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
    $P206 = root_new ['parrot';'Hash']
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
    $P212 = root_new ['parrot';'Hash']
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
    $P217 = root_new ['parrot';'Hash']
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
.sub "_init_line_number_info"  :subid("21_1268929934.41563") :outer("11_1268929934.41563")
    .param pmc param_227
# .annotate "line", 232
    new $P226, 'ExceptionHandler'
    set_addr $P226, control_225
    $P226."handle_types"(58)
    push_eh $P226
    .lex "$string", param_227
# .annotate "line", 236
    $P228 = root_new ['parrot';'ResizablePMCArray']
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
    $P231 = root_new ['parrot';'Hash']
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
    $P256 = root_new ['parrot';'Hash']
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
.sub "line_number_of"  :subid("22_1268929934.41563") :outer("11_1268929934.41563")
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
    $P263 = root_new ['parrot';'Hash']
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
    $P275 = root_new ['parrot';'Hash']
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
    $P279 = root_new ['parrot';'Hash']
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
    $P285 = root_new ['parrot';'Hash']
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
.sub "ltrim_indent"  :subid("23_1268929934.41563") :outer("11_1268929934.41563")
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
    find_lex $P339, "$str"
    find_lex $P340, "$i"
    $P341 = "substr"($P339, $P340)
# .annotate "line", 297
    .return ($P341)
  control_301:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P342, exception, "payload"
    .return ($P342)
.end


.namespace ["String"]
.sub "length"  :subid("24_1268929934.41563") :method :outer("11_1268929934.41563")
    .param pmc param_354 :slurpy :named
# .annotate "line", 210
    new $P353, 'ExceptionHandler'
    set_addr $P353, control_352
    $P353."handle_types"(58)
    push_eh $P353
    .lex "self", self
    .lex "%opts", param_354
# .annotate "line", 211
    new $P355, "Undef"
    .lex "$offset", $P355
# .annotate "line", 215
    new $P356, "Undef"
    .lex "$result", $P356
# .annotate "line", 211
    new $P357, "Integer"
    assign $P357, 0
    find_lex $P358, "%opts"
    unless_null $P358, vivify_73
    $P358 = root_new ['parrot';'Hash']
  vivify_73:
    set $P359, $P358["offset"]
    unless_null $P359, vivify_74
    new $P359, "Undef"
  vivify_74:
    add $P360, $P357, $P359
    store_lex "$offset", $P360
# .annotate "line", 215

		$P0 = find_lex 'self'
		$S0 = $P0
		$I0 = length $S0
		$P361 = box $I0
	
    store_lex "$result", $P361
# .annotate "line", 222
    find_lex $P363, "$offset"
    set $N364, $P363
    find_lex $P365, "$result"
    set $N366, $P365
    isgt $I367, $N364, $N366
    unless $I367, if_362_end
# .annotate "line", 223
    find_lex $P368, "$result"
    store_lex "$offset", $P368
  if_362_end:
# .annotate "line", 226
    find_lex $P369, "$result"
    find_lex $P370, "$offset"
    sub $P371, $P369, $P370
    store_lex "$result", $P371
# .annotate "line", 229
    new $P372, "Exception"
    set $P372['type'], 58
    find_lex $P373, "$result"
    setattribute $P372, 'payload', $P373
    throw $P372
# .annotate "line", 210
    .return ()
  control_352:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P374, exception, "payload"
    .return ($P374)
.end


.namespace ["String"]
.sub "isa"  :subid("25_1268929934.41563") :method :outer("11_1268929934.41563")
    .param pmc param_379
# .annotate "line", 263
    new $P378, 'ExceptionHandler'
    set_addr $P378, control_377
    $P378."handle_types"(58)
    push_eh $P378
    .lex "self", self
    .lex "$type", param_379
# .annotate "line", 264
    find_lex $P380, "self"
    find_lex $P381, "$type"
    isa $I382, $P380, $P381
# .annotate "line", 263
    .return ($I382)
  control_377:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P383, exception, "payload"
    .return ($P383)
.end


.namespace ["String"]
.sub "repeat"  :subid("26_1268929934.41563") :method :outer("11_1268929934.41563")
    .param pmc param_389
# .annotate "line", 315
    new $P388, 'ExceptionHandler'
    set_addr $P388, control_387
    $P388."handle_types"(58)
    push_eh $P388
    .lex "self", self
    .lex "$times", param_389
# .annotate "line", 316
    new $P390, "Undef"
    .lex "$result", $P390

		$P0 = find_lex 'self'
		$S0 = $P0
		$P0 = find_lex '$times'
		$I0 = $P0
		$S1 = repeat $S0, $I0
		$P391 = box $S1
	
    store_lex "$result", $P391
    find_lex $P392, "$result"
# .annotate "line", 315
    .return ($P392)
  control_387:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P393, exception, "payload"
    .return ($P393)
.end


.namespace ["String"]
.sub "split"  :subid("27_1268929934.41563") :method :outer("11_1268929934.41563")
    .param pmc param_397 :optional
    .param int has_param_397 :opt_flag
# .annotate "line", 328
    new $P396, 'ExceptionHandler'
    set_addr $P396, control_395
    $P396."handle_types"(58)
    push_eh $P396
    .lex "self", self
    if has_param_397, optparam_75
    new $P398, "String"
    assign $P398, ""
    set param_397, $P398
  optparam_75:
    .lex "$delim", param_397
# .annotate "line", 329
    find_lex $P399, "$delim"
    set $S400, $P399
    find_lex $P401, "self"
    set $S402, $P401
    split $P403, $S400, $S402
# .annotate "line", 328
    .return ($P403)
  control_395:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P404, exception, "payload"
    .return ($P404)
.end


.namespace ["String"]
.sub "substr"  :subid("28_1268929934.41563") :method :outer("11_1268929934.41563")
    .param pmc param_408
    .param pmc param_409 :optional
    .param int has_param_409 :opt_flag
# .annotate "line", 332
    new $P407, 'ExceptionHandler'
    set_addr $P407, control_406
    $P407."handle_types"(58)
    push_eh $P407
    .lex "self", self
    .lex "$start", param_408
    if has_param_409, optparam_76
    new $P410, "Undef"
    set param_409, $P410
  optparam_76:
    .lex "$limit", param_409
# .annotate "line", 333
    new $P411, "Undef"
    .lex "$length", $P411
    find_lex $P412, "self"
    $P413 = $P412."length"()
    store_lex "$length", $P413
# .annotate "line", 336
    find_lex $P417, "$start"
    set $N418, $P417
    find_lex $P419, "$length"
    set $N420, $P419
    isgt $I421, $N418, $N420
    unless $I421, unless_416
    new $P415, 'Integer'
    set $P415, $I421
    goto unless_416_end
  unless_416:
    find_lex $P422, "$start"
    find_lex $P423, "$length"
    add $P424, $P422, $P423
    set $N425, $P424
    islt $I426, $N425, 0.0
    new $P415, 'Integer'
    set $P415, $I426
  unless_416_end:
    unless $P415, if_414_end
# .annotate "line", 335
    new $P427, 'String'
    set $P427, "Invalid start offset ("
    find_lex $P428, "$start"
    concat $P429, $P427, $P428
    concat $P430, $P429, ") for .substr"
    "die"($P430)
  if_414_end:
# .annotate "line", 339
    find_lex $P432, "$start"
    set $N433, $P432
    islt $I434, $N433, 0.0
    unless $I434, if_431_end
# .annotate "line", 338
    find_lex $P435, "$start"
    find_lex $P436, "$length"
    add $P437, $P435, $P436
    store_lex "$start", $P437
  if_431_end:
# .annotate "line", 340
    find_lex $P438, "$length"
    find_lex $P439, "$start"
    sub $P440, $P438, $P439
    store_lex "$length", $P440
# .annotate "line", 342
    find_lex $P442, "$limit"
    $P443 = $P442."defined"()
    isfalse $I444, $P443
    if $I444, if_441
# .annotate "line", 345
    find_lex $P447, "$limit"
    set $N448, $P447
    find_lex $P449, "$length"
    set $N450, $P449
    isgt $I451, $N448, $N450
    if $I451, if_446
# .annotate "line", 348
    find_lex $P454, "$limit"
    set $N455, $P454
    islt $I456, $N455, 0.0
    unless $I456, if_453_end
# .annotate "line", 349
    find_lex $P457, "$limit"
    find_lex $P458, "$length"
    add $P459, $P457, $P458
    store_lex "$limit", $P459
  if_453_end:
# .annotate "line", 348
    goto if_446_end
  if_446:
# .annotate "line", 346
    find_lex $P452, "$length"
    store_lex "$limit", $P452
  if_446_end:
# .annotate "line", 345
    goto if_441_end
  if_441:
# .annotate "line", 343
    find_lex $P445, "$length"
    store_lex "$limit", $P445
  if_441_end:
# .annotate "line", 353
    find_lex $P463, "$limit"
    set $N464, $P463
    find_lex $P465, "$length"
    set $N466, $P465
    isgt $I467, $N464, $N466
    unless $I467, unless_462
    new $P461, 'Integer'
    set $P461, $I467
    goto unless_462_end
  unless_462:
    find_lex $P468, "$limit"
    set $N469, $P468
    islt $I470, $N469, 0.0
    new $P461, 'Integer'
    set $P461, $I470
  unless_462_end:
    unless $P461, if_460_end
# .annotate "line", 352
    new $P471, 'String'
    set $P471, "Invalid length limit ("
    find_lex $P472, "$limit"
    concat $P473, $P471, $P472
    concat $P474, $P473, ") for .substr"
    "die"($P474)
  if_460_end:
# .annotate "line", 355
    find_lex $P475, "self"
    set $S476, $P475
    find_lex $P477, "$start"
    set $I478, $P477
    find_lex $P479, "$limit"
    set $I480, $P479
    substr $S481, $S476, $I478, $I480
# .annotate "line", 332
    .return ($S481)
  control_406:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P482, exception, "payload"
    .return ($P482)
.end


.namespace ["String"]
.sub "trim"  :subid("29_1268929934.41563") :method :outer("11_1268929934.41563")
# .annotate "line", 358
    .const 'Sub' $P501 = "30_1268929934.41563" 
    capture_lex $P501
    new $P485, 'ExceptionHandler'
    set_addr $P485, control_484
    $P485."handle_types"(58)
    push_eh $P485
    .lex "self", self
# .annotate "line", 359
    new $P486, "Undef"
    .lex "$result", $P486
# .annotate "line", 360
    new $P487, "Undef"
    .lex "$left", $P487
# .annotate "line", 363
    new $P488, "Undef"
    .lex "$len", $P488
# .annotate "line", 359
    new $P489, "String"
    assign $P489, ""
    store_lex "$result", $P489
# .annotate "line", 360
    find_lex $P490, "self"
    $P491 = "find_not_cclass"("WHITESPACE", $P490)
    store_lex "$left", $P491
# .annotate "line", 363
    find_lex $P492, "self"
    $P493 = "length"($P492)
    store_lex "$len", $P493
# .annotate "line", 366
    find_lex $P495, "$left"
    set $N496, $P495
    find_lex $P497, "$len"
    set $N498, $P497
    islt $I499, $N496, $N498
    unless $I499, if_494_end
    .const 'Sub' $P501 = "30_1268929934.41563" 
    capture_lex $P501
    $P501()
  if_494_end:
# .annotate "line", 380
    new $P520, "Exception"
    set $P520['type'], 58
    find_lex $P521, "$result"
    setattribute $P520, 'payload', $P521
    throw $P520
# .annotate "line", 358
    .return ()
  control_484:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P522, exception, "payload"
    .return ($P522)
.end


.namespace ["String"]
.sub "_block500"  :anon :subid("30_1268929934.41563") :outer("29_1268929934.41563")
# .annotate "line", 367
    new $P502, "Undef"
    .lex "$right", $P502
    find_lex $P503, "$len"
    sub $P504, $P503, 1
    store_lex "$right", $P504
# .annotate "line", 369
    new $P511, 'ExceptionHandler'
    set_addr $P511, loop510_handler
    $P511."handle_types"(65, 67, 66)
    push_eh $P511
  loop510_test:
    find_lex $P505, "self"
    find_lex $P506, "$right"
    $P507 = "is_cclass"("WHITESPACE", $P505, $P506 :named("offset"))
    unless $P507, loop510_done
  loop510_redo:
    find_lex $P508, "$right"
    clone $P509, $P508
    dec $P508
  loop510_next:
    goto loop510_test
  loop510_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P512, exception, 'type'
    eq $P512, 65, loop510_next
    eq $P512, 67, loop510_redo
  loop510_done:
    pop_eh 
# .annotate "line", 376
    find_lex $P513, "self"
    find_lex $P514, "$left"
    find_lex $P515, "$right"
    find_lex $P516, "$left"
    sub $P517, $P515, $P516
    add $P518, $P517, 1
    $P519 = "substr"($P513, $P514, $P518)
    store_lex "$result", $P519
# .annotate "line", 366
    .return ($P519)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929874.19472")
# .annotate "line", 0
    get_hll_global $P14, ["Sub"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["Sub"], "_block13" 
    capture_lex $P14
    $P155 = $P14()
# .annotate "line", 1
    .return ($P155)
.end


.namespace ["Sub"]
.sub "_block13"  :subid("11_1268929874.19472") :outer("10_1268929874.19472")
# .annotate "line", 6
    .const 'Sub' $P37 = "14_1268929874.19472" 
    capture_lex $P37
    .const 'Sub' $P22 = "13_1268929874.19472" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1268929874.19472" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929874.19472" 
    capture_lex $P15
    .lex "set_dump_detail", $P15
# .annotate "line", 10
    .const 'Sub' $P22 = "13_1268929874.19472" 
    capture_lex $P22
    .lex "get_dump_detail", $P22
# .annotate "line", 6
    find_lex $P35, "set_dump_detail"
    find_lex $P36, "get_dump_detail"
# .annotate "line", 20
    .const 'Sub' $P37 = "14_1268929874.19472" 
    capture_lex $P37
# .annotate "line", 6
    .return ($P37)
.end


.namespace ["Sub"]
.sub "set_dump_detail"  :subid("12_1268929874.19472") :outer("11_1268929874.19472")
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
.sub "get_dump_detail"  :subid("13_1268929874.19472") :outer("11_1268929874.19472")
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
.sub "__dump"  :subid("14_1268929874.19472") :method :outer("11_1268929874.19472")
    .param pmc param_40
    .param pmc param_41
# .annotate "line", 20
    .const 'Sub' $P62 = "15_1268929874.19472" 
    capture_lex $P62
    new $P39, 'ExceptionHandler'
    set_addr $P39, control_38
    $P39."handle_types"(58)
    push_eh $P39
    .lex "self", self
    .lex "$dumper", param_40
    .lex "$label", param_41
# .annotate "line", 21
    $P42 = root_new ['parrot';'ResizablePMCArray']
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
    .const 'Sub' $P62 = "15_1268929874.19472" 
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
    find_lex $P152, "$dumper"
    $P153 = $P152."deleteIndent"()
# .annotate "line", 20
    .return ($P153)
  control_38:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P154, exception, "payload"
    .return ($P154)
.end


.namespace ["Sub"]
.sub "_block61"  :anon :subid("15_1268929874.19472") :outer("14_1268929874.19472")
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
    new $P83, "String"
    assign $P83, "<no namespace>"
    store_lex "$nsp", $P83
# .annotate "line", 34
    goto if_69_end
  if_69:
# .annotate "line", 32
    find_lex $P79, "$nsp"
    $P80 = $P79."get_name"()
    join $S81, "::", $P80
    new $P82, 'String'
    set $P82, $S81
    store_lex "$nsp", $P82
  if_69_end:
# .annotate "line", 38
    find_lex $P84, "self"
    set $S85, $P84
    "print"("'", $S85, "'  {")
# .annotate "line", 39
    find_lex $P86, "$subindent"
    find_lex $P87, "$nsp"
    "print"($P86, "Namespace : ", $P87)
# .annotate "line", 41
    new $P88, "String"
    assign $P88, ""
    store_lex "$flags", $P88
# .annotate "line", 43
    find_lex $P89, "self"
    $P90 = $P89."get_subid"()
    store_lex "$subid", $P90
# .annotate "line", 44
    get_hll_global $P94, ["Opcode"], "isnull"
    find_lex $P95, "$subid"
    $P96 = $P94($P95)
    isfalse $I97, $P96
    if $I97, if_93
    new $P92, 'Integer'
    set $P92, $I97
    goto if_93_end
  if_93:
    find_lex $P98, "$subid"
    set $P92, $P98
  if_93_end:
    unless $P92, if_91_end
    new $P99, "String"
    assign $P99, " subid('"
    find_lex $P100, "$subid"
    concat $P101, $P99, $P100
    concat $P102, $P101, "')"
    store_lex "$flags", $P102
  if_91_end:
# .annotate "line", 46
    find_lex $P103, "self"
    $P104 = $P103."get_outer"()
    store_lex "$outer", $P104
# .annotate "line", 47
    get_hll_global $P108, ["Opcode"], "isnull"
    find_lex $P109, "$outer"
    $P110 = $P108($P109)
    isfalse $I111, $P110
    if $I111, if_107
    new $P106, 'Integer'
    set $P106, $I111
    goto if_107_end
  if_107:
    find_lex $P112, "$outer"
    set $P106, $P112
  if_107_end:
    unless $P106, if_105_end
    new $P113, "String"
    assign $P113, " outer('"
    find_lex $P114, "$outer"
    concat $P115, $P113, $P114
    concat $P116, $P115, "')"
    store_lex "$flags", $P116
  if_105_end:
# .annotate "line", 49
    find_lex $P117, "$subindent"
    find_lex $P120, "$flags"
    if $P120, if_119
    new $P122, "String"
    assign $P122, "<none>"
    set $P118, $P122
    goto if_119_end
  if_119:
    find_lex $P121, "$flags"
    set $P118, $P121
  if_119_end:
    "print"($P117, "Flags     :", $P118)
# .annotate "line", 51
    find_lex $P123, "$subindent"
    get_hll_global $P124, ["Opcode"], "inspect_string"
    find_lex $P125, "self"
    $P126 = $P124($P125, "pos_required")
# .annotate "line", 52
    get_hll_global $P127, ["Opcode"], "inspect_string"
    find_lex $P128, "self"
    $P129 = $P127($P128, "pos_optional")
# .annotate "line", 53
    get_hll_global $P132, ["Opcode"], "inspect_string"
    find_lex $P133, "self"
    $P134 = $P132($P133, "pos_slurpy")
    if $P134, if_131
    new $P136, "String"
    assign $P136, ""
    set $P130, $P136
    goto if_131_end
  if_131:
    new $P135, "String"
    assign $P135, ", *@"
    set $P130, $P135
  if_131_end:
# .annotate "line", 54
    get_hll_global $P137, ["Opcode"], "inspect_string"
    find_lex $P138, "self"
    $P139 = $P137($P138, "named_required")
# .annotate "line", 55
    get_hll_global $P140, ["Opcode"], "inspect_string"
    find_lex $P141, "self"
    $P142 = $P140($P141, "named_optional")
# .annotate "line", 56
    get_hll_global $P145, ["Opcode"], "inspect_string"
    find_lex $P146, "self"
    $P147 = $P145($P146, "named_slurpy")
    if $P147, if_144
    new $P149, "String"
    assign $P149, ""
    set $P143, $P149
    goto if_144_end
  if_144:
    new $P148, "String"
    assign $P148, ", *%"
    set $P143, $P148
  if_144_end:
    "print"($P123, "Parameters: (+", $P126, ", ?", $P129, $P130, ", :+", $P139, ", :?", $P142, $P143, ")")
# .annotate "line", 58
    find_lex $P150, "$indent"
    $P151 = "print"($P150, "}")
# .annotate "line", 28
    .return ($P151)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929888.51494")
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
.sub "_block13"  :subid("11_1268929888.51494") :outer("10_1268929888.51494")
# .annotate "line", 7
    .const 'Sub' $P15 = "12_1268929888.51494" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929888.51494" 
    capture_lex $P15
    .return ($P15)
.end


.namespace ["Undef"]
.sub "defined"  :subid("12_1268929888.51494") :method :outer("11_1268929888.51494")
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
