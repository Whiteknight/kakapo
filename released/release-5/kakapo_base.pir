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
.sub "_block11"  :anon :subid("10_1266670844.90165")
# .annotate "line", 0
    get_hll_global $P14, ["Kakapo"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["Kakapo"], "_block13" 
    capture_lex $P14
    $P63 = $P14()
# .annotate "line", 1
    .return ($P63)
.end


.namespace ["Kakapo"]
.sub "_block13"  :subid("11_1266670844.90165") :outer("10_1266670844.90165")
# .annotate "line", 6
    .const 'Sub' $P54 = "15_1266670844.90165" 
    capture_lex $P54
    .const 'Sub' $P49 = "14_1266670844.90165" 
    capture_lex $P49
    .const 'Sub' $P19 = "13_1266670844.90165" 
    capture_lex $P19
    .const 'Sub' $P15 = "12_1266670844.90165" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1266670844.90165" 
    capture_lex $P15
    .lex "is_loaded", $P15
# .annotate "line", 15
    .const 'Sub' $P19 = "13_1266670844.90165" 
    capture_lex $P19
    .lex "_pre_initload", $P19
# .annotate "line", 44
    .const 'Sub' $P49 = "14_1266670844.90165" 
    capture_lex $P49
    .lex "library_init_done", $P49
# .annotate "line", 49
    .const 'Sub' $P54 = "15_1266670844.90165" 
    capture_lex $P54
    .lex "library_load_done", $P54
# .annotate "line", 6
    find_lex $P59, "is_loaded"
    find_lex $P60, "_pre_initload"
    find_lex $P61, "library_init_done"
    find_lex $P62, "library_load_done"
    .return ($P62)
.end


.namespace ["Kakapo"]
.sub "is_loaded"  :subid("12_1266670844.90165") :outer("11_1266670844.90165")
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
.sub "_pre_initload"  :subid("13_1266670844.90165") :outer("11_1266670844.90165")
# .annotate "line", 15
    new $P21, 'ExceptionHandler'
    set_addr $P21, control_20
    $P21."handle_types"(58)
    push_eh $P21
# .annotate "line", 17
    get_global $P22, "$_Pre_initload_done"
    unless_null $P22, vivify_16
    new $P22, "Undef"
    set_global "$_Pre_initload_done", $P22
  vivify_16:
# .annotate "line", 16
    "say"("Base pre-initload")
# .annotate "line", 17
    get_global $P24, "$_Pre_initload_done"
    unless $P24, if_23_end
    new $P25, "Exception"
    set $P25['type'], 58
    new $P26, "Integer"
    assign $P26, 0
    setattribute $P25, 'payload', $P26
    throw $P25
  if_23_end:
# .annotate "line", 18
    new $P27, "Integer"
    assign $P27, 1
    set_global "$_Pre_initload_done", $P27
# .annotate "line", 20
    get_hll_global $P29, ["Opcode"], "defined"
    get_hll_global $P30, "say"
    $P31 = $P29($P30)
    if $P31, unless_28_end
# .annotate "line", 21
    get_hll_global $P32, ["Opcode"], "load_language"
    $P32("nqp")
  unless_28_end:
# .annotate "line", 24
    get_hll_global $P34, ["Opcode"], "defined"
    get_hll_global $P35, ["P6object"], "HOW"
    $P36 = $P34($P35)
    if $P36, unless_33_end
# .annotate "line", 25
    get_hll_global $P37, ["Opcode"], "load_bytecode"
    $P37("P6object.pbc")
  unless_33_end:
# .annotate "line", 29
    get_hll_global $P38, ["Global"], "_pre_initload"
    $P38()
# .annotate "line", 30
    get_hll_global $P39, ["Opcode"], "_pre_initload"
    $P39()
# .annotate "line", 31
    get_hll_global $P40, ["Parrot"], "_pre_initload"
    $P40()
# .annotate "line", 32
    get_hll_global $P41, ["Pir"], "_pre_initload"
    $P41()
# .annotate "line", 33
    get_hll_global $P42, ["Array"], "_pre_initload"
    $P42()
# .annotate "line", 34
    get_hll_global $P43, ["Kakapo";"Pmc";"COMMON"], "_pre_initload"
    $P43()
# .annotate "line", 35
    get_hll_global $P44, ["String"], "_pre_initload"
    $P44()
# .annotate "line", 36
    get_hll_global $P45, ["Exception"], "_pre_initload"
    $P45()
# .annotate "line", 37
    get_hll_global $P46, ["Syntax"], "_pre_initload"
    $P47 = $P46()
# .annotate "line", 15
    .return ($P47)
  control_20:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P48, exception, "payload"
    .return ($P48)
.end


.namespace ["Kakapo"]
.sub "library_init_done"  :subid("14_1266670844.90165") :outer("11_1266670844.90165")
# .annotate "line", 44
    new $P51, 'ExceptionHandler'
    set_addr $P51, control_50
    $P51."handle_types"(58)
    push_eh $P51
# .annotate "line", 45
    $P52 = "say"("Library init done")
# .annotate "line", 44
    .return ($P52)
  control_50:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P53, exception, "payload"
    .return ($P53)
.end


.namespace ["Kakapo"]
.sub "library_load_done"  :subid("15_1266670844.90165") :outer("11_1266670844.90165")
# .annotate "line", 49
    new $P56, 'ExceptionHandler'
    set_addr $P56, control_55
    $P56."handle_types"(58)
    push_eh $P56
# .annotate "line", 50
    $P57 = "say"("Library load done")
# .annotate "line", 49
    .return ($P57)
  control_55:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P58, exception, "payload"
    .return ($P58)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1266670790.87083")
# .annotate "line", 0
    get_hll_global $P14, ["Global"], "_block13" 
    capture_lex $P14
# .annotate "line", 32
    get_hll_global $P14, ["Global"], "_block13" 
    capture_lex $P14
    $P331 = $P14()
# .annotate "line", 1
    .return ($P331)
.end


.namespace ["Global"]
.sub "_block13"  :subid("11_1266670790.87083") :outer("10_1266670790.87083")
# .annotate "line", 32
    .const 'Sub' $P199 = "19_1266670790.87083" 
    capture_lex $P199
    .const 'Sub' $P171 = "18_1266670790.87083" 
    capture_lex $P171
    .const 'Sub' $P129 = "17_1266670790.87083" 
    capture_lex $P129
    .const 'Sub' $P113 = "16_1266670790.87083" 
    capture_lex $P113
    .const 'Sub' $P22 = "13_1266670790.87083" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1266670790.87083" 
    capture_lex $P15
# .annotate "line", 151
    .const 'Sub' $P199 = "19_1266670790.87083" 
    capture_lex $P199
# .annotate "line", 32
    .return ($P199)
.end


.namespace ["Global"]
.sub "_pre_initload"  :subid("12_1266670790.87083") :outer("11_1266670790.87083")
# .annotate "line", 32
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 36
    get_hll_global $P18, ["Global"], "use"
    "inject_root_symbol"($P18)
# .annotate "line", 37
    get_hll_global $P19, ["Global"], "export"
    $P20 = "inject_root_symbol"($P19)
# .annotate "line", 32
    .return ($P20)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P21, exception, "payload"
    .return ($P21)
.end


.namespace ["Global"]
.sub "export"  :subid("13_1266670790.87083") :outer("11_1266670790.87083")
    .param pmc param_25
    .param pmc param_26 :slurpy
    .param pmc param_27 :optional :named("as")
    .param int has_param_27 :opt_flag
    .param pmc param_29 :optional :named("namespace")
    .param int has_param_29 :opt_flag
    .param pmc param_31 :optional :named("tags")
    .param int has_param_31 :opt_flag
# .annotate "line", 68
    .const 'Sub' $P77 = "14_1266670790.87083" 
    capture_lex $P77
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
# .annotate "line", 74
    new $P33, "Undef"
    .lex "$source_nsp", $P33
# .annotate "line", 82
    new $P34, "Undef"
    .lex "$export_nsp", $P34
# .annotate "line", 69
    find_lex $P36, "@symbols"
    if $P36, unless_35_end
    get_hll_global $P37, ["Array"], "empty"
    $P38 = $P37()
    store_lex "@symbols", $P38
  unless_35_end:
# .annotate "line", 70
    find_lex $P39, "@symbols"
    find_lex $P40, "$symbol"
    $P39."unshift"($P40)
# .annotate "line", 71
    get_hll_global $P42, ["Opcode"], "isa"
    find_lex $P43, "@tags"
    $P44 = $P42($P43, "ResizablePMCArray")
    isfalse $I45, $P44
    if $I45, if_41
# .annotate "line", 72
    find_lex $P50, "@tags"
    set $N51, $P50
    iseq $I52, $N51, 0.0
    unless $I52, if_49_end
    find_lex $P53, "@tags"
    $P53."push"("DEFAULT")
  if_49_end:
    goto if_41_end
  if_41:
# .annotate "line", 71
    get_hll_global $P46, ["Array"], "new"
    find_lex $P47, "@tags"
    $P48 = $P46($P47)
    store_lex "@tags", $P48
  if_41_end:
# .annotate "line", 74
    get_hll_global $P56, ["Opcode"], "defined"
    find_lex $P57, "$namespace"
    $P58 = $P56($P57)
    if $P58, if_55
# .annotate "line", 76
    get_hll_global $P60, ["Parrot"], "caller_namespace"
    $P61 = $P60(2)
    set $P54, $P61
# .annotate "line", 74
    goto if_55_end
  if_55:
    find_lex $P59, "$namespace"
    set $P54, $P59
  if_55_end:
# .annotate "line", 75
    store_lex "$source_nsp", $P54
# .annotate "line", 78
    get_hll_global $P63, ["Opcode"], "isa"
    find_lex $P64, "$source_nsp"
    $P65 = $P63($P64, "String")
    unless $P65, if_62_end
# .annotate "line", 79
    get_hll_global $P66, ["Opcode"], "get_namespace"
    find_lex $P67, "$source_nsp"
    $P68 = $P66($P67)
    store_lex "$source_nsp", $P68
  if_62_end:
# .annotate "line", 82
    find_lex $P69, "$source_nsp"
    $P70 = $P69."make_namespace"("EXPORT")
    store_lex "$export_nsp", $P70
# .annotate "line", 84
    find_lex $P71, "@tags"
    $P71."push"("ALL")
# .annotate "line", 86
    find_lex $P73, "@tags"
    defined $I74, $P73
    unless $I74, for_undef_26
    iter $P72, $P73
    new $P110, 'ExceptionHandler'
    set_addr $P110, loop109_handler
    $P110."handle_types"(65, 67, 66)
    push_eh $P110
  loop109_test:
    unless $P72, loop109_done
    shift $P75, $P72
  loop109_redo:
    .const 'Sub' $P77 = "14_1266670790.87083" 
    capture_lex $P77
    $P77($P75)
  loop109_next:
    goto loop109_test
  loop109_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, 'type'
    eq $P111, 65, loop109_next
    eq $P111, 67, loop109_redo
  loop109_done:
    pop_eh 
  for_undef_26:
# .annotate "line", 68
    .return ($P72)
  control_23:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["Global"]
.sub "_block76"  :anon :subid("14_1266670790.87083") :outer("13_1266670790.87083")
    .param pmc param_79
# .annotate "line", 86
    .const 'Sub' $P90 = "15_1266670790.87083" 
    capture_lex $P90
# .annotate "line", 87
    new $P78, "Undef"
    .lex "$tag_nsp", $P78
    .lex "$_", param_79
    find_lex $P80, "$export_nsp"
    find_lex $P81, "$_"
    set $S82, $P81
    $P83 = $P80."make_namespace"($S82)
    store_lex "$tag_nsp", $P83
# .annotate "line", 89
    get_hll_global $P86, ["Opcode"], "defined"
    find_lex $P87, "$as"
    $P88 = $P86($P87)
    if $P88, if_85
# .annotate "line", 98
    find_lex $P105, "$source_nsp"
    find_lex $P106, "$tag_nsp"
    find_lex $P107, "@symbols"
    $P108 = $P105."export_to"($P106, $P107)
# .annotate "line", 97
    set $P84, $P108
# .annotate "line", 89
    goto if_85_end
  if_85:
    .const 'Sub' $P90 = "15_1266670790.87083" 
    capture_lex $P90
    $P104 = $P90()
    set $P84, $P104
  if_85_end:
# .annotate "line", 86
    .return ($P84)
.end


.namespace ["Global"]
.sub "_block89"  :anon :subid("15_1266670790.87083") :outer("14_1266670790.87083")
# .annotate "line", 90
    new $P91, "Undef"
    .lex "$export_sym", $P91
    find_lex $P92, "$symbol"
    store_lex "$export_sym", $P92
# .annotate "line", 91
    get_hll_global $P94, ["Opcode"], "isa"
    find_lex $P95, "$export_sym"
    $P96 = $P94($P95, "String")
    unless $P96, if_93_end
# .annotate "line", 92
    find_lex $P97, "$source_nsp"
    find_lex $P98, "$export_sym"
    $P99 = $P97."get_sym"($P98)
    store_lex "$export_sym", $P99
  if_93_end:
# .annotate "line", 95
    find_lex $P100, "$export_sym"
    find_lex $P101, "$as"
    find_lex $P102, "$tag_nsp"
    $P103 = "inject_symbol"($P100, $P101 :named("as"), $P102 :named("namespace"))
# .annotate "line", 89
    .return ($P103)
.end


.namespace ["Global"]
.sub "inject_root_symbol"  :subid("16_1266670790.87083") :outer("11_1266670790.87083")
    .param pmc param_116
    .param pmc param_117 :optional :named("as")
    .param int has_param_117 :opt_flag
    .param pmc param_119 :optional :named("force")
    .param int has_param_119 :opt_flag
# .annotate "line", 103
    new $P115, 'ExceptionHandler'
    set_addr $P115, control_114
    $P115."handle_types"(58)
    push_eh $P115
    .lex "$pmc", param_116
    if has_param_117, optparam_27
    new $P118, "Undef"
    set param_117, $P118
  optparam_27:
    .lex "$as", param_117
    if has_param_119, optparam_28
    new $P120, "Undef"
    set param_119, $P120
  optparam_28:
    .lex "$force", param_119
# .annotate "line", 104
    new $P121, "Undef"
    .lex "$hll_namespace", $P121
    get_hll_namespace $P122
    store_lex "$hll_namespace", $P122
# .annotate "line", 105
    find_lex $P123, "$pmc"
    find_lex $P124, "$as"
    find_lex $P125, "$hll_namespace"
    find_lex $P126, "$force"
    $P127 = "inject_symbol"($P123, $P124 :named("as"), $P125 :named("namespace"), $P126 :named("force"))
# .annotate "line", 103
    .return ($P127)
  control_114:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P128, exception, "payload"
    .return ($P128)
.end


.namespace ["Global"]
.sub "inject_symbol"  :subid("17_1266670790.87083") :outer("11_1266670790.87083")
    .param pmc param_132
    .param pmc param_133 :optional :named("namespace")
    .param int has_param_133 :opt_flag
    .param pmc param_135 :optional :named("as")
    .param int has_param_135 :opt_flag
    .param pmc param_137 :optional :named("force")
    .param int has_param_137 :opt_flag
# .annotate "line", 109
    new $P131, 'ExceptionHandler'
    set_addr $P131, control_130
    $P131."handle_types"(58)
    push_eh $P131
    .lex "$object", param_132
    if has_param_133, optparam_29
    new $P134, "Undef"
    set param_133, $P134
  optparam_29:
    .lex "$namespace", param_133
    if has_param_135, optparam_30
    new $P136, "Undef"
    set param_135, $P136
  optparam_30:
    .lex "$as", param_135
    if has_param_137, optparam_31
    new $P138, "Undef"
    set param_137, $P138
  optparam_31:
    .lex "$force", param_137
# .annotate "line", 117
    get_hll_global $P140, ["Opcode"], "defined"
    find_lex $P141, "$as"
    $P142 = $P140($P141)
    if $P142, unless_139_end
    find_lex $P143, "$object"
    set $S144, $P143
    new $P145, 'String'
    set $P145, $S144
    store_lex "$as", $P145
  unless_139_end:
# .annotate "line", 119
    get_hll_global $P147, ["Opcode"], "isa"
    find_lex $P148, "$namespace"
    $P149 = $P147($P148, "NameSpace")
    isfalse $I150, $P149
    unless $I150, if_146_end
# .annotate "line", 120
    get_hll_global $P151, ["Opcode"], "get_hll_namespace"
    find_lex $P152, "$namespace"
    $P153 = $P151($P152)
    store_lex "$namespace", $P153
  if_146_end:
# .annotate "line", 125
    find_lex $P157, "$force"
    isfalse $I158, $P157
    if $I158, if_156
    new $P155, 'Integer'
    set $P155, $I158
    goto if_156_end
  if_156:
    get_hll_global $P159, ["Opcode"], "defined"
    find_lex $P160, "$namespace"
    find_lex $P161, "$as"
    $P162 = $P160."find_var"($P161)
    $P163 = $P159($P162)
    set $P155, $P163
  if_156_end:
    unless $P155, if_154_end
# .annotate "line", 126
    new $P164, "Exception"
    set $P164['type'], 58
    new $P165, "Integer"
    assign $P165, 0
    setattribute $P164, 'payload', $P165
    throw $P164
  if_154_end:
# .annotate "line", 129
    find_lex $P166, "$namespace"
    find_lex $P167, "$as"
    find_lex $P168, "$object"
    $P169 = $P166."add_var"($P167, $P168)
# .annotate "line", 109
    .return ($P169)
  control_130:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P170, exception, "payload"
    .return ($P170)
.end


.namespace ["Global"]
.sub "register_global"  :subid("18_1266670790.87083") :outer("11_1266670790.87083")
    .param pmc param_174
    .param pmc param_175
    .param pmc param_176 :optional :named("namespace")
    .param int has_param_176 :opt_flag
# .annotate "line", 132
    new $P173, 'ExceptionHandler'
    set_addr $P173, control_172
    $P173."handle_types"(58)
    push_eh $P173
    .lex "$name", param_174
    .lex "$object", param_175
    if has_param_176, optparam_32
    new $P177, "Undef"
    set param_176, $P177
  optparam_32:
    .lex "$namespace", param_176
# .annotate "line", 144
    new $P178, "Undef"
    .lex "$nsp", $P178
# .annotate "line", 139
    find_lex $P180, "$namespace"
    if $P180, unless_179_end
    new $P181, "String"
    assign $P181, "Global"
    store_lex "$namespace", $P181
  unless_179_end:
# .annotate "line", 140
    get_hll_global $P183, ["Opcode"], "isa"
    find_lex $P184, "$namespace"
    $P185 = $P183($P184, "String")
    unless $P185, if_182_end
# .annotate "line", 141
    find_lex $P186, "$namespace"
    $P187 = $P186."split"("::")
    store_lex "$namespace", $P187
  if_182_end:
# .annotate "line", 144
    get_hll_namespace $P188
    store_lex "$nsp", $P188
# .annotate "line", 145
    find_lex $P189, "$nsp"
    find_lex $P190, "$namespace"
    $P191 = $P189."make_namespace"($P190)
    store_lex "$nsp", $P191
# .annotate "line", 147
    find_lex $P192, "$object"
    find_lex $P193, "$name"
    find_lex $P194, "$nsp"
    unless_null $P194, vivify_33
    new $P194, "Hash"
    store_lex "$nsp", $P194
  vivify_33:
    set $P194[$P193], $P192
# .annotate "line", 148
    find_lex $P195, "$name"
    find_lex $P196, "$nsp"
    $P197 = "export"($P195, $P196 :named("namespace"))
# .annotate "line", 132
    .return ($P197)
  control_172:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P198, exception, "payload"
    .return ($P198)
.end


.namespace ["Global"]
.sub "use"  :subid("19_1266670790.87083") :outer("11_1266670790.87083")
    .param pmc param_202 :optional
    .param int has_param_202 :opt_flag
    .param pmc param_204 :optional :named("except")
    .param int has_param_204 :opt_flag
    .param pmc param_206 :optional :named("tags")
    .param int has_param_206 :opt_flag
    .param pmc param_208 :optional :named("symbols")
    .param int has_param_208 :opt_flag
# .annotate "line", 151
    .const 'Sub' $P281 = "21_1266670790.87083" 
    capture_lex $P281
    .const 'Sub' $P268 = "20_1266670790.87083" 
    capture_lex $P268
    new $P201, 'ExceptionHandler'
    set_addr $P201, control_200
    $P201."handle_types"(58)
    push_eh $P201
    if has_param_202, optparam_34
    new $P203, "Undef"
    set param_202, $P203
  optparam_34:
    .lex "$module", param_202
    if has_param_204, optparam_35
    new $P205, "ResizablePMCArray"
    set param_204, $P205
  optparam_35:
    .lex "@except", param_204
    if has_param_206, optparam_36
    new $P207, "ResizablePMCArray"
    set param_206, $P207
  optparam_36:
    .lex "@tags", param_206
    if has_param_208, optparam_37
    new $P209, "ResizablePMCArray"
    set param_208, $P209
  optparam_37:
    .lex "@symbols", param_208
# .annotate "line", 183
    new $P210, "Undef"
    .lex "$export_nsp", $P210
# .annotate "line", 184
    new $P211, "Undef"
    .lex "$target_nsp", $P211
# .annotate "line", 186
    new $P212, "Hash"
    .lex "%except", $P212
# .annotate "line", 172
    get_hll_global $P214, ["Opcode"], "defined"
    find_lex $P215, "$module"
    $P216 = $P214($P215)
    isfalse $I217, $P216
    unless $I217, if_213_end
    get_hll_global $P218, ["Parrot"], "caller_namespace"
    $P219 = $P218(1)
    store_lex "$module", $P219
  if_213_end:
# .annotate "line", 173
    get_hll_global $P221, ["Opcode"], "isa"
    find_lex $P222, "@tags"
    $P223 = $P221($P222, "String")
    unless $P223, if_220_end
    get_hll_global $P224, ["Array"], "new"
    find_lex $P225, "@tags"
    $P226 = $P224($P225)
    store_lex "@tags", $P226
  if_220_end:
# .annotate "line", 174
    get_hll_global $P228, ["Opcode"], "isa"
    find_lex $P229, "@symbols"
    $P230 = $P228($P229, "String")
    unless $P230, if_227_end
    get_hll_global $P231, ["Array"], "new"
    find_lex $P232, "@symbols"
    $P233 = $P231($P232)
    store_lex "@symbols", $P233
  if_227_end:
# .annotate "line", 176
    get_hll_global $P235, ["Opcode"], "isa"
    find_lex $P236, "$module"
    $P237 = $P235($P236, "P6object")
    unless $P237, if_234_end
    get_hll_global $P238, ["Opcode"], "typeof"
    find_lex $P239, "$module"
    $P240 = $P238($P239)
    store_lex "$module", $P240
  if_234_end:
# .annotate "line", 177
    get_hll_global $P242, ["Opcode"], "isa"
    find_lex $P243, "$module"
    $P244 = $P242($P243, "String")
    unless $P244, if_241_end
    get_hll_global $P245, ["Parrot"], "get_hll_namespace"
    find_lex $P246, "$module"
    $P247 = $P245($P246)
    store_lex "$module", $P247
  if_241_end:
# .annotate "line", 179
    find_lex $P251, "@tags"
    set $N252, $P251
    iseq $I253, $N252, 0.0
    if $I253, if_250
    new $P249, 'Integer'
    set $P249, $I253
    goto if_250_end
  if_250:
    find_lex $P254, "@symbols"
    set $N255, $P254
    iseq $I256, $N255, 0.0
    new $P249, 'Integer'
    set $P249, $I256
  if_250_end:
    unless $P249, if_248_end
# .annotate "line", 180
    find_lex $P257, "@tags"
    $P257."push"("DEFAULT")
  if_248_end:
# .annotate "line", 183
    find_lex $P258, "$module"
    $P259 = $P258."make_namespace"("EXPORT")
    store_lex "$export_nsp", $P259
# .annotate "line", 184
    get_hll_global $P260, ["Parrot"], "caller_namespace"
    $P261 = $P260(2)
    store_lex "$target_nsp", $P261
    find_lex $P262, "%except"
# .annotate "line", 188
    find_lex $P264, "@except"
    defined $I265, $P264
    unless $I265, for_undef_38
    iter $P263, $P264
    new $P274, 'ExceptionHandler'
    set_addr $P274, loop273_handler
    $P274."handle_types"(65, 67, 66)
    push_eh $P274
  loop273_test:
    unless $P263, loop273_done
    shift $P266, $P263
  loop273_redo:
    .const 'Sub' $P268 = "20_1266670790.87083" 
    capture_lex $P268
    $P268($P266)
  loop273_next:
    goto loop273_test
  loop273_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P275, exception, 'type'
    eq $P275, 65, loop273_next
    eq $P275, 67, loop273_redo
  loop273_done:
    pop_eh 
  for_undef_38:
# .annotate "line", 192
    find_lex $P277, "@tags"
    defined $I278, $P277
    unless $I278, for_undef_40
    iter $P276, $P277
    new $P319, 'ExceptionHandler'
    set_addr $P319, loop318_handler
    $P319."handle_types"(65, 67, 66)
    push_eh $P319
  loop318_test:
    unless $P276, loop318_done
    shift $P279, $P276
  loop318_redo:
    .const 'Sub' $P281 = "21_1266670790.87083" 
    capture_lex $P281
    $P281($P279)
  loop318_next:
    goto loop318_test
  loop318_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P320, exception, 'type'
    eq $P320, 65, loop318_next
    eq $P320, 67, loop318_redo
  loop318_done:
    pop_eh 
  for_undef_40:
# .annotate "line", 207
    find_lex $P323, "@symbols"
    set $N324, $P323
    if $N324, if_322
    new $P321, 'Float'
    set $P321, $N324
    goto if_322_end
  if_322:
# .annotate "line", 208
    find_lex $P325, "$export_nsp"
    unless_null $P325, vivify_44
    new $P325, "Hash"
  vivify_44:
    set $P326, $P325["ALL"]
    unless_null $P326, vivify_45
    new $P326, "Undef"
  vivify_45:
    find_lex $P327, "$target_nsp"
    find_lex $P328, "@symbols"
    $P329 = $P326."export_to"($P327, $P328)
# .annotate "line", 207
    set $P321, $P329
  if_322_end:
# .annotate "line", 151
    .return ($P321)
  control_200:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P330, exception, "payload"
    .return ($P330)
.end


.namespace ["Global"]
.sub "_block267"  :anon :subid("20_1266670790.87083") :outer("19_1266670790.87083")
    .param pmc param_269
# .annotate "line", 188
    .lex "$_", param_269
# .annotate "line", 189
    new $P270, "Integer"
    assign $P270, 1
    find_lex $P271, "$_"
    find_lex $P272, "%except"
    unless_null $P272, vivify_39
    new $P272, "Hash"
    store_lex "%except", $P272
  vivify_39:
    set $P272[$P271], $P270
# .annotate "line", 188
    .return ($P270)
.end


.namespace ["Global"]
.sub "_block280"  :anon :subid("21_1266670790.87083") :outer("19_1266670790.87083")
    .param pmc param_284
# .annotate "line", 192
    .const 'Sub' $P296 = "22_1266670790.87083" 
    capture_lex $P296
# .annotate "line", 193
    new $P282, "Undef"
    .lex "$source_nsp", $P282
# .annotate "line", 194
    new $P283, "ResizablePMCArray"
    .lex "@tag_symbols", $P283
    .lex "$_", param_284
# .annotate "line", 193
    find_lex $P285, "$export_nsp"
    find_lex $P286, "$_"
    set $S287, $P286
    $P288 = $P285."make_namespace"($S287)
    store_lex "$source_nsp", $P288
    find_lex $P289, "@tag_symbols"
# .annotate "line", 196
    find_lex $P291, "$source_nsp"
    $P292 = $P291."keys"()
    defined $I293, $P292
    unless $I293, for_undef_41
    iter $P290, $P292
    new $P308, 'ExceptionHandler'
    set_addr $P308, loop307_handler
    $P308."handle_types"(65, 67, 66)
    push_eh $P308
  loop307_test:
    unless $P290, loop307_done
    shift $P294, $P290
  loop307_redo:
    .const 'Sub' $P296 = "22_1266670790.87083" 
    capture_lex $P296
    $P296($P294)
  loop307_next:
    goto loop307_test
  loop307_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P309, exception, 'type'
    eq $P309, 65, loop307_next
    eq $P309, 67, loop307_redo
  loop307_done:
    pop_eh 
  for_undef_41:
# .annotate "line", 202
    find_lex $P312, "@tag_symbols"
    set $N313, $P312
    if $N313, if_311
    new $P310, 'Float'
    set $P310, $N313
    goto if_311_end
  if_311:
# .annotate "line", 203
    find_lex $P314, "$source_nsp"
    find_lex $P315, "$target_nsp"
    find_lex $P316, "@tag_symbols"
    $P317 = $P314."export_to"($P315, $P316)
# .annotate "line", 202
    set $P310, $P317
  if_311_end:
# .annotate "line", 192
    .return ($P310)
.end


.namespace ["Global"]
.sub "_block295"  :anon :subid("22_1266670790.87083") :outer("21_1266670790.87083")
    .param pmc param_297
# .annotate "line", 196
    .lex "$_", param_297
# .annotate "line", 197
    find_lex $P300, "$_"
    find_lex $P301, "%except"
    unless_null $P301, vivify_42
    new $P301, "Hash"
  vivify_42:
    set $P302, $P301[$P300]
    unless_null $P302, vivify_43
    new $P302, "Undef"
  vivify_43:
    unless $P302, unless_299
    set $P298, $P302
    goto unless_299_end
  unless_299:
# .annotate "line", 198
    find_lex $P303, "@tag_symbols"
    find_lex $P304, "$_"
    set $S305, $P304
    $P306 = $P303."push"($S305)
# .annotate "line", 197
    set $P298, $P306
  unless_299_end:
# .annotate "line", 196
    .return ($P298)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1266670826.08136")
# .annotate "line", 0
    get_hll_global $P14, ["Syntax"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Syntax"], "_block13" 
    capture_lex $P14
    $P120 = $P14()
# .annotate "line", 1
    .return ($P120)
.end


.namespace ["Syntax"]
.sub "_block13"  :subid("11_1266670826.08136") :outer("10_1266670826.08136")
# .annotate "line", 7
    .const 'Sub' $P71 = "18_1266670826.08136" 
    capture_lex $P71
    .const 'Sub' $P60 = "17_1266670826.08136" 
    capture_lex $P60
    .const 'Sub' $P53 = "16_1266670826.08136" 
    capture_lex $P53
    .const 'Sub' $P46 = "15_1266670826.08136" 
    capture_lex $P46
    .const 'Sub' $P39 = "14_1266670826.08136" 
    capture_lex $P39
    .const 'Sub' $P32 = "13_1266670826.08136" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1266670826.08136" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1266670826.08136" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 16
    .const 'Sub' $P32 = "13_1266670826.08136" 
    capture_lex $P32
    .lex "die", $P32
# .annotate "line", 20
    .const 'Sub' $P39 = "14_1266670826.08136" 
    capture_lex $P39
    .lex "last", $P39
# .annotate "line", 24
    .const 'Sub' $P46 = "15_1266670826.08136" 
    capture_lex $P46
    .lex "next", $P46
# .annotate "line", 28
    .const 'Sub' $P53 = "16_1266670826.08136" 
    capture_lex $P53
    .lex "redo", $P53
# .annotate "line", 32
    .const 'Sub' $P60 = "17_1266670826.08136" 
    capture_lex $P60
    .lex "super", $P60
# .annotate "line", 36
    .const 'Sub' $P71 = "18_1266670826.08136" 
    capture_lex $P71
    .lex "super_", $P71
# .annotate "line", 7
    find_lex $P113, "_pre_initload"
    find_lex $P114, "die"
    find_lex $P115, "last"
    find_lex $P116, "next"
    find_lex $P117, "redo"
    find_lex $P118, "super"
    find_lex $P119, "super_"
    .return ($P119)
.end


.namespace ["Syntax"]
.sub "_pre_initload"  :subid("12_1266670826.08136") :outer("11_1266670826.08136")
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
    $P26($P27)
# .annotate "line", 13
    get_hll_global $P28, ["Global"], "inject_root_symbol"
    get_hll_global $P29, ["Syntax"], "super_"
    $P30 = $P28($P29)
# .annotate "line", 7
    .return ($P30)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P31, exception, "payload"
    .return ($P31)
.end


.namespace ["Syntax"]
.sub "die"  :subid("13_1266670826.08136") :outer("11_1266670826.08136")
    .param pmc param_35 :slurpy
# .annotate "line", 16
    new $P34, 'ExceptionHandler'
    set_addr $P34, control_33
    $P34."handle_types"(58)
    push_eh $P34
    .lex "@why", param_35
# .annotate "line", 17
    find_lex $P36, "@why"
    $S37 = $P36."join"()
    die $S37
# .annotate "line", 16
    .return ()
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P38, exception, "payload"
    .return ($P38)
.end


.namespace ["Syntax"]
.sub "last"  :subid("14_1266670826.08136") :outer("11_1266670826.08136")
# .annotate "line", 20
    new $P41, 'ExceptionHandler'
    set_addr $P41, control_40
    $P41."handle_types"(58)
    push_eh $P41
# .annotate "line", 21
    get_hll_global $P42, ["Control"], "LoopLast"
    $P43 = $P42."new"("Uncaught LAST control exception" :named("message"))
    $P44 = $P43."throw"()
# .annotate "line", 20
    .return ($P44)
  control_40:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P45, exception, "payload"
    .return ($P45)
.end


.namespace ["Syntax"]
.sub "next"  :subid("15_1266670826.08136") :outer("11_1266670826.08136")
# .annotate "line", 24
    new $P48, 'ExceptionHandler'
    set_addr $P48, control_47
    $P48."handle_types"(58)
    push_eh $P48
# .annotate "line", 25
    get_hll_global $P49, ["Control"], "LoopNext"
    $P50 = $P49."new"("Uncaught NEXT control exception" :named("message"))
    $P51 = $P50."throw"()
# .annotate "line", 24
    .return ($P51)
  control_47:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P52, exception, "payload"
    .return ($P52)
.end


.namespace ["Syntax"]
.sub "redo"  :subid("16_1266670826.08136") :outer("11_1266670826.08136")
# .annotate "line", 28
    new $P55, 'ExceptionHandler'
    set_addr $P55, control_54
    $P55."handle_types"(58)
    push_eh $P55
# .annotate "line", 29
    get_hll_global $P56, ["Control"], "LoopRedo"
    $P57 = $P56."new"("Uncaught REDO control exception" :named("message"))
    $P58 = $P57."throw"()
# .annotate "line", 28
    .return ($P58)
  control_54:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P59, exception, "payload"
    .return ($P59)
.end


.namespace ["Syntax"]
.sub "super"  :subid("17_1266670826.08136") :outer("11_1266670826.08136")
    .param pmc param_63
    .param pmc param_64 :slurpy
    .param pmc param_65 :slurpy :named
# .annotate "line", 32
    new $P62, 'ExceptionHandler'
    set_addr $P62, control_61
    $P62."handle_types"(58)
    push_eh $P62
    .lex "$method", param_63
    .lex "@args", param_64
    .lex "%opts", param_65
# .annotate "line", 33
    find_lex $P66, "$method"
    find_lex $P67, "@args"
    find_lex $P68, "%opts"
    $P69 = "super_"($P66, $P67, $P68)
# .annotate "line", 32
    .return ($P69)
  control_61:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P70, exception, "payload"
    .return ($P70)
.end


.namespace ["Syntax"]
.sub "super_"  :subid("18_1266670826.08136") :outer("11_1266670826.08136")
    .param pmc param_74
    .param pmc param_75
    .param pmc param_76
# .annotate "line", 36
    new $P73, 'ExceptionHandler'
    set_addr $P73, control_72
    $P73."handle_types"(58)
    push_eh $P73
    .lex "$method", param_74
    .lex "@args", param_75
    .lex "%opts", param_76
# .annotate "line", 37
    new $P77, "Undef"
    .lex "$self", $P77
# .annotate "line", 38
    new $P78, "Undef"
    .lex "$class", $P78
# .annotate "line", 39
    new $P79, "ResizablePMCArray"
    .lex "@mro", $P79
# .annotate "line", 45
    new $P80, "Undef"
    .lex "$parent", $P80
# .annotate "line", 46
    new $P81, "Undef"
    .lex "&sub", $P81
# .annotate "line", 37
    get_hll_global $P82, ["Parrot"], "get_self"
    $P83 = $P82()
    store_lex "$self", $P83
# .annotate "line", 38
    find_lex $P84, "$self"
    class $P85, $P84
    store_lex "$class", $P85
# .annotate "line", 39
    find_lex $P86, "$class"
    $P87 = $P86."inspect"("all_parents")
    store_lex "@mro", $P87
# .annotate "line", 41
    find_lex $P89, "@mro"
    set $N90, $P89
    iseq $I91, $N90, 1.0
    unless $I91, if_88_end
# .annotate "line", 42
    "die"("Call to 'super' on object with no parent classes")
  if_88_end:
# .annotate "line", 45
    find_lex $P92, "@mro"
    unless_null $P92, vivify_19
    new $P92, "ResizablePMCArray"
  vivify_19:
    set $P93, $P92[1]
    unless_null $P93, vivify_20
    new $P93, "Undef"
  vivify_20:
    store_lex "$parent", $P93
# .annotate "line", 46
    find_lex $P94, "$parent"
    find_lex $P95, "$method"
    $P96 = $P94."find_method"($P95)
    store_lex "&sub", $P96
# .annotate "line", 48
    find_lex $P98, "&sub"
    isnull $I99, $P98
    unless $I99, if_97_end
# .annotate "line", 49
    get_hll_global $P100, ["Exception"], "MethodNotFound"
    new $P101, 'String'
    set $P101, "Method '"
    find_lex $P102, "$method"
    concat $P103, $P101, $P102
    concat $P104, $P103, "' not found"
    $P105 = $P100."new"($P104 :named("message"))
    $P105."throw"()
  if_97_end:
# .annotate "line", 52
    get_hll_global $P106, ["Parrot"], "call_method_"
    find_lex $P107, "$self"
    find_lex $P108, "&sub"
    find_lex $P109, "@args"
    find_lex $P110, "%opts"
    $P111 = $P106($P107, $P108, $P109, $P110)
# .annotate "line", 36
    .return ($P111)
  control_72:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1266670810.03112")
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
.sub "_block13"  :subid("11_1266670810.03112") :outer("10_1266670810.03112")
# .annotate "line", 9
    .const 'Sub' $P309 = "46_1266670810.03112" 
    capture_lex $P309
    .const 'Sub' $P283 = "45_1266670810.03112" 
    capture_lex $P283
    .const 'Sub' $P257 = "44_1266670810.03112" 
    capture_lex $P257
    .const 'Sub' $P250 = "43_1266670810.03112" 
    capture_lex $P250
    .const 'Sub' $P244 = "42_1266670810.03112" 
    capture_lex $P244
    .const 'Sub' $P235 = "41_1266670810.03112" 
    capture_lex $P235
    .const 'Sub' $P224 = "40_1266670810.03112" 
    capture_lex $P224
    .const 'Sub' $P217 = "39_1266670810.03112" 
    capture_lex $P217
    .const 'Sub' $P210 = "38_1266670810.03112" 
    capture_lex $P210
    .const 'Sub' $P203 = "37_1266670810.03112" 
    capture_lex $P203
    .const 'Sub' $P196 = "36_1266670810.03112" 
    capture_lex $P196
    .const 'Sub' $P186 = "35_1266670810.03112" 
    capture_lex $P186
    .const 'Sub' $P177 = "34_1266670810.03112" 
    capture_lex $P177
    .const 'Sub' $P167 = "33_1266670810.03112" 
    capture_lex $P167
    .const 'Sub' $P160 = "32_1266670810.03112" 
    capture_lex $P160
    .const 'Sub' $P150 = "31_1266670810.03112" 
    capture_lex $P150
    .const 'Sub' $P143 = "30_1266670810.03112" 
    capture_lex $P143
    .const 'Sub' $P136 = "29_1266670810.03112" 
    capture_lex $P136
    .const 'Sub' $P129 = "28_1266670810.03112" 
    capture_lex $P129
    .const 'Sub' $P124 = "27_1266670810.03112" 
    capture_lex $P124
    .const 'Sub' $P116 = "26_1266670810.03112" 
    capture_lex $P116
    .const 'Sub' $P109 = "25_1266670810.03112" 
    capture_lex $P109
    .const 'Sub' $P102 = "24_1266670810.03112" 
    capture_lex $P102
    .const 'Sub' $P92 = "23_1266670810.03112" 
    capture_lex $P92
    .const 'Sub' $P85 = "22_1266670810.03112" 
    capture_lex $P85
    .const 'Sub' $P78 = "21_1266670810.03112" 
    capture_lex $P78
    .const 'Sub' $P71 = "20_1266670810.03112" 
    capture_lex $P71
    .const 'Sub' $P61 = "19_1266670810.03112" 
    capture_lex $P61
    .const 'Sub' $P55 = "18_1266670810.03112" 
    capture_lex $P55
    .const 'Sub' $P48 = "17_1266670810.03112" 
    capture_lex $P48
    .const 'Sub' $P41 = "16_1266670810.03112" 
    capture_lex $P41
    .const 'Sub' $P34 = "15_1266670810.03112" 
    capture_lex $P34
    .const 'Sub' $P24 = "14_1266670810.03112" 
    capture_lex $P24
    .const 'Sub' $P20 = "13_1266670810.03112" 
    capture_lex $P20
    .const 'Sub' $P15 = "12_1266670810.03112" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1266670810.03112" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 15
    .const 'Sub' $P20 = "13_1266670810.03112" 
    capture_lex $P20
    .lex "backtrace", $P20
# .annotate "line", 16
    .const 'Sub' $P24 = "14_1266670810.03112" 
    capture_lex $P24
    .lex "can", $P24
# .annotate "line", 17
    .const 'Sub' $P34 = "15_1266670810.03112" 
    capture_lex $P34
    .lex "class", $P34
# .annotate "line", 18
    .const 'Sub' $P41 = "16_1266670810.03112" 
    capture_lex $P41
    .lex "clone", $P41
# .annotate "line", 19
    .const 'Sub' $P48 = "17_1266670810.03112" 
    capture_lex $P48
    .lex "defined", $P48
# .annotate "line", 22
    .const 'Sub' $P55 = "18_1266670810.03112" 
    capture_lex $P55
    .lex "delete", $P55
# .annotate "line", 30
    .const 'Sub' $P61 = "19_1266670810.03112" 
    capture_lex $P61
    .lex "does", $P61
# .annotate "line", 31
    .const 'Sub' $P71 = "20_1266670810.03112" 
    capture_lex $P71
    .lex "elements", $P71
# .annotate "line", 32
    .const 'Sub' $P78 = "21_1266670810.03112" 
    capture_lex $P78
    .lex "exit", $P78
# .annotate "line", 33
    .const 'Sub' $P85 = "22_1266670810.03112" 
    capture_lex $P85
    .lex "get_addr", $P85
# .annotate "line", 34
    .const 'Sub' $P92 = "23_1266670810.03112" 
    capture_lex $P92
    .lex "getattribute", $P92
# .annotate "line", 35
    .const 'Sub' $P102 = "24_1266670810.03112" 
    capture_lex $P102
    .lex "get_class", $P102
# .annotate "line", 36
    .const 'Sub' $P109 = "25_1266670810.03112" 
    capture_lex $P109
    .lex "get_integer", $P109
# .annotate "line", 37
    .const 'Sub' $P116 = "26_1266670810.03112" 
    capture_lex $P116
    .lex "get_global", $P116
# .annotate "line", 38
    .const 'Sub' $P124 = "27_1266670810.03112" 
    capture_lex $P124
    .lex "getinterp", $P124
# .annotate "line", 39
    .const 'Sub' $P129 = "28_1266670810.03112" 
    capture_lex $P129
    .lex "get_namespace", $P129
# .annotate "line", 40
    .const 'Sub' $P136 = "29_1266670810.03112" 
    capture_lex $P136
    .lex "get_root_namespace", $P136
# .annotate "line", 41
    .const 'Sub' $P143 = "30_1266670810.03112" 
    capture_lex $P143
    .lex "inspect", $P143
# .annotate "line", 42
    .const 'Sub' $P150 = "31_1266670810.03112" 
    capture_lex $P150
    .lex "inspect_string", $P150
# .annotate "line", 43
    .const 'Sub' $P160 = "32_1266670810.03112" 
    capture_lex $P160
    .lex "isnull", $P160
# .annotate "line", 44
    .const 'Sub' $P167 = "33_1266670810.03112" 
    capture_lex $P167
    .lex "isa", $P167
# .annotate "line", 45
    .const 'Sub' $P177 = "34_1266670810.03112" 
    capture_lex $P177
    .lex "iseq", $P177
# .annotate "line", 46
    .const 'Sub' $P186 = "35_1266670810.03112" 
    capture_lex $P186
    .lex "join", $P186
# .annotate "line", 47
    .const 'Sub' $P196 = "36_1266670810.03112" 
    capture_lex $P196
    .lex "load_bytecode", $P196
# .annotate "line", 48
    .const 'Sub' $P203 = "37_1266670810.03112" 
    capture_lex $P203
    .lex "load_language", $P203
# .annotate "line", 49
    .const 'Sub' $P210 = "38_1266670810.03112" 
    capture_lex $P210
    .lex "new", $P210
# .annotate "line", 50
    .const 'Sub' $P217 = "39_1266670810.03112" 
    capture_lex $P217
    .lex "newclass", $P217
# .annotate "line", 51
    .const 'Sub' $P224 = "40_1266670810.03112" 
    capture_lex $P224
    .lex "setattribute", $P224
# .annotate "line", 53
    .const 'Sub' $P235 = "41_1266670810.03112" 
    capture_lex $P235
    .lex "set_integer", $P235
# .annotate "line", 54
    .const 'Sub' $P244 = "42_1266670810.03112" 
    capture_lex $P244
    .lex "throw", $P244
# .annotate "line", 55
    .const 'Sub' $P250 = "43_1266670810.03112" 
    capture_lex $P250
    .lex "typeof", $P250
# .annotate "line", 59
    .const 'Sub' $P257 = "44_1266670810.03112" 
    capture_lex $P257
    .lex "get_hll_global", $P257
# .annotate "line", 80
    .const 'Sub' $P283 = "45_1266670810.03112" 
    capture_lex $P283
    .lex "get_root_global", $P283
# .annotate "line", 101
    .const 'Sub' $P309 = "46_1266670810.03112" 
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
.sub "_pre_initload"  :subid("12_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "backtrace"  :subid("13_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "can"  :subid("14_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "class"  :subid("15_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "clone"  :subid("16_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "defined"  :subid("17_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "delete"  :subid("18_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "does"  :subid("19_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "elements"  :subid("20_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "exit"  :subid("21_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "get_addr"  :subid("22_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "getattribute"  :subid("23_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "get_class"  :subid("24_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "get_integer"  :subid("25_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "get_global"  :subid("26_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "getinterp"  :subid("27_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "get_namespace"  :subid("28_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "get_root_namespace"  :subid("29_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "inspect"  :subid("30_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "inspect_string"  :subid("31_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "isnull"  :subid("32_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "isa"  :subid("33_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "iseq"  :subid("34_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "join"  :subid("35_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "load_bytecode"  :subid("36_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "load_language"  :subid("37_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "new"  :subid("38_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "newclass"  :subid("39_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "setattribute"  :subid("40_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "set_integer"  :subid("41_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "throw"  :subid("42_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "typeof"  :subid("43_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "get_hll_global"  :subid("44_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "get_root_global"  :subid("45_1266670810.03112") :outer("11_1266670810.03112")
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
.sub "make_root_namespace"  :subid("46_1266670810.03112") :outer("11_1266670810.03112")
    .param pmc param_312
# .annotate "line", 101
    .const 'Sub' $P319 = "47_1266670810.03112" 
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
    .const 'Sub' $P319 = "47_1266670810.03112" 
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
.sub "_block318"  :anon :subid("47_1266670810.03112") :outer("46_1266670810.03112")
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
.sub "_block11"  :anon :subid("10_1266670806.63107")
# .annotate "line", 0
    get_hll_global $P14, ["Parrot"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Parrot"], "_block13" 
    capture_lex $P14
    $P355 = $P14()
# .annotate "line", 1
    .return ($P355)
.end


.namespace ["Parrot"]
.sub "_block13"  :subid("11_1266670806.63107") :outer("10_1266670806.63107")
# .annotate "line", 7
    .const 'Sub' $P318 = "31_1266670806.63107" 
    capture_lex $P318
    .const 'Sub' $P298 = "29_1266670806.63107" 
    capture_lex $P298
    .const 'Sub' $P288 = "28_1266670806.63107" 
    capture_lex $P288
    .const 'Sub' $P246 = "27_1266670806.63107" 
    capture_lex $P246
    .const 'Sub' $P233 = "26_1266670806.63107" 
    capture_lex $P233
    .const 'Sub' $P207 = "25_1266670806.63107" 
    capture_lex $P207
    .const 'Sub' $P178 = "24_1266670806.63107" 
    capture_lex $P178
    .const 'Sub' $P169 = "23_1266670806.63107" 
    capture_lex $P169
    .const 'Sub' $P148 = "22_1266670806.63107" 
    capture_lex $P148
    .const 'Sub' $P137 = "21_1266670806.63107" 
    capture_lex $P137
    .const 'Sub' $P130 = "20_1266670806.63107" 
    capture_lex $P130
    .const 'Sub' $P118 = "19_1266670806.63107" 
    capture_lex $P118
    .const 'Sub' $P96 = "18_1266670806.63107" 
    capture_lex $P96
    .const 'Sub' $P83 = "17_1266670806.63107" 
    capture_lex $P83
    .const 'Sub' $P61 = "16_1266670806.63107" 
    capture_lex $P61
    .const 'Sub' $P48 = "15_1266670806.63107" 
    capture_lex $P48
    .const 'Sub' $P35 = "14_1266670806.63107" 
    capture_lex $P35
    .const 'Sub' $P20 = "13_1266670806.63107" 
    capture_lex $P20
    .const 'Sub' $P15 = "12_1266670806.63107" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1266670806.63107" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 26
    .const 'Sub' $P20 = "13_1266670806.63107" 
    capture_lex $P20
    .lex "caller", $P20
# .annotate "line", 32
    .const 'Sub' $P35 = "14_1266670806.63107" 
    capture_lex $P35
    .lex "caller_namespace", $P35
# .annotate "line", 54
    .const 'Sub' $P48 = "15_1266670806.63107" 
    capture_lex $P48
    .lex "call_method", $P48
# .annotate "line", 58
    .const 'Sub' $P61 = "16_1266670806.63107" 
    capture_lex $P61
    .lex "call_method_", $P61
# .annotate "line", 83
    .const 'Sub' $P83 = "17_1266670806.63107" 
    capture_lex $P83
    .lex "call_tuple_method", $P83
# .annotate "line", 87
    .const 'Sub' $P96 = "18_1266670806.63107" 
    capture_lex $P96
    .lex "call_tuple_method_", $P96
# .annotate "line", 114
    .const 'Sub' $P118 = "19_1266670806.63107" 
    capture_lex $P118
    .lex "call_sub", $P118
# .annotate "line", 118
    .const 'Sub' $P130 = "20_1266670806.63107" 
    capture_lex $P130
    .lex "call_sub_", $P130
# .annotate "line", 139
    .const 'Sub' $P137 = "21_1266670806.63107" 
    capture_lex $P137
    .lex "call_tuple_sub", $P137
# .annotate "line", 143
    .const 'Sub' $P148 = "22_1266670806.63107" 
    capture_lex $P148
    .lex "call_tuple_sub_", $P148
# .annotate "line", 168
    .const 'Sub' $P169 = "23_1266670806.63107" 
    capture_lex $P169
    .lex "get_address_of", $P169
# .annotate "line", 175
    .const 'Sub' $P178 = "24_1266670806.63107" 
    capture_lex $P178
    .lex "get_hll_global", $P178
# .annotate "line", 196
    .const 'Sub' $P207 = "25_1266670806.63107" 
    capture_lex $P207
    .lex "get_hll_namespace", $P207
# .annotate "line", 214
    .const 'Sub' $P233 = "26_1266670806.63107" 
    capture_lex $P233
    .lex "get_self", $P233
# .annotate "line", 224
    .const 'Sub' $P246 = "27_1266670806.63107" 
    capture_lex $P246
    .lex "get_sub", $P246
# .annotate "line", 248
    .const 'Sub' $P288 = "28_1266670806.63107" 
    capture_lex $P288
    .lex "key", $P288
# .annotate "line", 253
    .const 'Sub' $P298 = "29_1266670806.63107" 
    capture_lex $P298
    .lex "key_", $P298
# .annotate "line", 310
    .const 'Sub' $P318 = "31_1266670806.63107" 
    capture_lex $P318
    .lex "namespace_name", $P318
# .annotate "line", 7
    find_lex $P336, "_pre_initload"
    find_lex $P337, "caller"
    find_lex $P338, "caller_namespace"
    find_lex $P339, "call_method"
    find_lex $P340, "call_method_"
    find_lex $P341, "call_tuple_method"
    find_lex $P342, "call_tuple_method_"
    find_lex $P343, "call_sub"
    find_lex $P344, "call_sub_"
    find_lex $P345, "call_tuple_sub"
    find_lex $P346, "call_tuple_sub_"
    find_lex $P347, "get_address_of"
    find_lex $P348, "get_hll_global"
    find_lex $P349, "get_hll_namespace"
    find_lex $P350, "get_self"
    find_lex $P351, "get_sub"
    find_lex $P352, "key"
    find_lex $P353, "key_"
    find_lex $P354, "namespace_name"
    .return ($P354)
.end


.namespace ["Parrot"]
.sub "_pre_initload"  :subid("12_1266670806.63107") :outer("11_1266670806.63107")
# .annotate "line", 7
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 8
    "export"("call_method", "call_method_", "call_sub", "call_sub_", "call_tuple_method", "call_tuple_method_", "call_tuple_sub", "call_tuple_sub_", "CALL" :named("tags"))
# .annotate "line", 16
    "export"("caller", "caller_namespace", "CALLER" :named("tags"))
# .annotate "line", 18
    $P18 = "export"("caller_namespace", "get_hll_namespace", "namespace_name", "NAMESPACE" :named("tags"))
# .annotate "line", 7
    .return ($P18)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P19, exception, "payload"
    .return ($P19)
.end


.namespace ["Parrot"]
.sub "caller"  :subid("13_1266670806.63107") :outer("11_1266670806.63107")
    .param pmc param_23 :optional
    .param int has_param_23 :opt_flag
# .annotate "line", 26
    new $P22, 'ExceptionHandler'
    set_addr $P22, control_21
    $P22."handle_types"(58)
    push_eh $P22
    if has_param_23, optparam_32
    new $P24, "Integer"
    assign $P24, 1
    set param_23, $P24
  optparam_32:
    .lex "$index", param_23
# .annotate "line", 27
    new $P25, "Undef"
    .lex "$key", $P25
# .annotate "line", 28
    new $P26, "Undef"
    .lex "$sub", $P26
# .annotate "line", 27
    get_hll_global $P27, "Key"
    find_lex $P28, "$index"
    add $P29, $P28, 1
    $P30 = $P27."new"("sub", $P29)
    store_lex "$key", $P30
# .annotate "line", 28
    find_lex $P31, "$key"
    getinterp $P32
    set $P33, $P32[$P31]
    unless_null $P33, vivify_33
    new $P33, "Undef"
  vivify_33:
    store_lex "$sub", $P33
# .annotate "line", 26
    .return ($P33)
  control_21:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P34, exception, "payload"
    .return ($P34)
.end


.namespace ["Parrot"]
.sub "caller_namespace"  :subid("14_1266670806.63107") :outer("11_1266670806.63107")
    .param pmc param_38 :optional
    .param int has_param_38 :opt_flag
# .annotate "line", 32
    new $P37, 'ExceptionHandler'
    set_addr $P37, control_36
    $P37."handle_types"(58)
    push_eh $P37
    if has_param_38, optparam_34
    new $P39, "Undef"
    set param_38, $P39
  optparam_34:
    .lex "$index", param_38
# .annotate "line", 37
    new $P40, "Undef"
    .lex "$nsp", $P40
# .annotate "line", 33
    find_lex $P42, "$index"
    if $P42, unless_41_end
# .annotate "line", 34
    new $P43, "Integer"
    assign $P43, 1
    store_lex "$index", $P43
  unless_41_end:
# .annotate "line", 37

		.local pmc key
		key = new 'Key'
		key = 'namespace'
		$P0 = find_lex '$index'
		$S0 = $P0
		$P1 = new 'Key'
		$P1 = $S0
		push key, $P1
		
		$P0 = getinterp
		$P44 = $P0[ key ]
	
    store_lex "$nsp", $P44
# .annotate "line", 51
    new $P45, "Exception"
    set $P45['type'], 58
    find_lex $P46, "$nsp"
    setattribute $P45, 'payload', $P46
    throw $P45
# .annotate "line", 32
    .return ()
  control_36:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P47, exception, "payload"
    .return ($P47)
.end


.namespace ["Parrot"]
.sub "call_method"  :subid("15_1266670806.63107") :outer("11_1266670806.63107")
    .param pmc param_51
    .param pmc param_52
    .param pmc param_53 :slurpy
    .param pmc param_54 :slurpy :named
# .annotate "line", 54
    new $P50, 'ExceptionHandler'
    set_addr $P50, control_49
    $P50."handle_types"(58)
    push_eh $P50
    .lex "$object", param_51
    .lex "$method_name", param_52
    .lex "@args", param_53
    .lex "%opts", param_54
# .annotate "line", 55
    find_lex $P55, "$object"
    find_lex $P56, "$method_name"
    find_lex $P57, "@args"
    find_lex $P58, "%opts"
    $P59 = "call_method_"($P55, $P56, $P57, $P58)
# .annotate "line", 54
    .return ($P59)
  control_49:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P60, exception, "payload"
    .return ($P60)
.end


.namespace ["Parrot"]
.sub "call_method_"  :subid("16_1266670806.63107") :outer("11_1266670806.63107")
    .param pmc param_64
    .param pmc param_65
    .param pmc param_66 :optional
    .param int has_param_66 :opt_flag
    .param pmc param_68 :optional
    .param int has_param_68 :opt_flag
# .annotate "line", 58
    new $P63, 'ExceptionHandler'
    set_addr $P63, control_62
    $P63."handle_types"(58)
    push_eh $P63
    .lex "$object", param_64
    .lex "$method_name", param_65
    if has_param_66, optparam_35
    new $P67, "ResizablePMCArray"
    set param_66, $P67
  optparam_35:
    .lex "@args", param_66
    if has_param_68, optparam_36
    new $P69, "Hash"
    set param_68, $P69
  optparam_36:
    .lex "%opts", param_68
# .annotate "line", 62
    get_hll_global $P71, ["Opcode"], "defined"
    find_lex $P72, "@args"
    $P73 = $P71($P72)
    if $P73, unless_70_end
    get_hll_global $P74, ["Array"], "empty"
    $P75 = $P74()
    store_lex "@args", $P75
  unless_70_end:
# .annotate "line", 63
    get_hll_global $P77, ["Opcode"], "defined"
    find_lex $P78, "%opts"
    $P79 = $P77($P78)
    if $P79, unless_76_end
    get_hll_global $P80, ["Hash"], "empty"
    $P81 = $P80()
    store_lex "%opts", $P81
  unless_76_end:
# .annotate "line", 65

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
	
# .annotate "line", 58
    .return ()
  control_62:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P82, exception, "payload"
    .return ($P82)
.end


.namespace ["Parrot"]
.sub "call_tuple_method"  :subid("17_1266670806.63107") :outer("11_1266670806.63107")
    .param pmc param_86
    .param pmc param_87
    .param pmc param_88 :slurpy
    .param pmc param_89 :slurpy :named
# .annotate "line", 83
    new $P85, 'ExceptionHandler'
    set_addr $P85, control_84
    $P85."handle_types"(58)
    push_eh $P85
    .lex "$object", param_86
    .lex "$method", param_87
    .lex "@args", param_88
    .lex "%opts", param_89
# .annotate "line", 84
    find_lex $P90, "$object"
    find_lex $P91, "$method"
    find_lex $P92, "@args"
    find_lex $P93, "%opts"
    $P94 = "call_tuple_method_"($P90, $P91, $P92, $P93)
# .annotate "line", 83
    .return ($P94)
  control_84:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P95, exception, "payload"
    .return ($P95)
.end


.namespace ["Parrot"]
.sub "call_tuple_method_"  :subid("18_1266670806.63107") :outer("11_1266670806.63107")
    .param pmc param_99
    .param pmc param_100
    .param pmc param_101 :optional
    .param int has_param_101 :opt_flag
    .param pmc param_103 :optional
    .param int has_param_103 :opt_flag
# .annotate "line", 87
    new $P98, 'ExceptionHandler'
    set_addr $P98, control_97
    $P98."handle_types"(58)
    push_eh $P98
    .lex "$object", param_99
    .lex "$method", param_100
    if has_param_101, optparam_37
    new $P102, "ResizablePMCArray"
    set param_101, $P102
  optparam_37:
    .lex "@args", param_101
    if has_param_103, optparam_38
    new $P104, "Hash"
    set param_103, $P104
  optparam_38:
    .lex "%opts", param_103
# .annotate "line", 91
    get_hll_global $P106, ["Opcode"], "defined"
    find_lex $P107, "@args"
    $P108 = $P106($P107)
    if $P108, unless_105_end
    get_hll_global $P109, ["Array"], "empty"
    $P110 = $P109()
    store_lex "@args", $P110
  unless_105_end:
# .annotate "line", 92
    get_hll_global $P112, ["Opcode"], "defined"
    find_lex $P113, "%opts"
    $P114 = $P112($P113)
    if $P114, unless_111_end
    get_hll_global $P115, ["Hash"], "empty"
    $P116 = $P115()
    store_lex "%opts", $P116
  unless_111_end:
# .annotate "line", 94

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
	
# .annotate "line", 87
    .return ()
  control_97:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, "payload"
    .return ($P117)
.end


.namespace ["Parrot"]
.sub "call_sub"  :subid("19_1266670806.63107") :outer("11_1266670806.63107")
    .param pmc param_121
    .param pmc param_122 :slurpy
    .param pmc param_123 :slurpy :named
# .annotate "line", 114
    new $P120, 'ExceptionHandler'
    set_addr $P120, control_119
    $P120."handle_types"(58)
    push_eh $P120
    .lex "$sub_name", param_121
    .lex "@args", param_122
    .lex "%opts", param_123
# .annotate "line", 115
    new $P124, "Exception"
    set $P124['type'], 58
    find_lex $P125, "$sub_name"
    find_lex $P126, "@args"
    find_lex $P127, "%opts"
    $P128 = "call_sub_"($P125, $P126, $P127)
    setattribute $P124, 'payload', $P128
    throw $P124
# .annotate "line", 114
    .return ()
  control_119:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P129, exception, "payload"
    .return ($P129)
.end


.namespace ["Parrot"]
.sub "call_sub_"  :subid("20_1266670806.63107") :outer("11_1266670806.63107")
    .param pmc param_133
    .param pmc param_134
    .param pmc param_135
# .annotate "line", 118
    new $P132, 'ExceptionHandler'
    set_addr $P132, control_131
    $P132."handle_types"(58)
    push_eh $P132
    .lex "$sub_name", param_133
    .lex "@args", param_134
    .lex "%opts", param_135
# .annotate "line", 122

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
	
# .annotate "line", 118
    .return ()
  control_131:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P136, exception, "payload"
    .return ($P136)
.end


.namespace ["Parrot"]
.sub "call_tuple_sub"  :subid("21_1266670806.63107") :outer("11_1266670806.63107")
    .param pmc param_140
    .param pmc param_141 :slurpy
    .param pmc param_142 :slurpy :named
# .annotate "line", 139
    new $P139, 'ExceptionHandler'
    set_addr $P139, control_138
    $P139."handle_types"(58)
    push_eh $P139
    .lex "$sub", param_140
    .lex "@args", param_141
    .lex "%opts", param_142
# .annotate "line", 140
    find_lex $P143, "$sub"
    find_lex $P144, "@args"
    find_lex $P145, "%opts"
    $P146 = "call_tuple_sub_"($P143, $P144, $P145)
# .annotate "line", 139
    .return ($P146)
  control_138:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P147, exception, "payload"
    .return ($P147)
.end


.namespace ["Parrot"]
.sub "call_tuple_sub_"  :subid("22_1266670806.63107") :outer("11_1266670806.63107")
    .param pmc param_151
    .param pmc param_152 :optional
    .param int has_param_152 :opt_flag
    .param pmc param_154 :optional
    .param int has_param_154 :opt_flag
# .annotate "line", 143
    new $P150, 'ExceptionHandler'
    set_addr $P150, control_149
    $P150."handle_types"(58)
    push_eh $P150
    .lex "$sub", param_151
    if has_param_152, optparam_39
    new $P153, "ResizablePMCArray"
    set param_152, $P153
  optparam_39:
    .lex "@args", param_152
    if has_param_154, optparam_40
    new $P155, "Hash"
    set param_154, $P155
  optparam_40:
    .lex "%opts", param_154
# .annotate "line", 147
    get_hll_global $P157, ["Opcode"], "defined"
    find_lex $P158, "@args"
    $P159 = $P157($P158)
    if $P159, unless_156_end
    get_hll_global $P160, ["Array"], "empty"
    $P161 = $P160()
    store_lex "@args", $P161
  unless_156_end:
# .annotate "line", 148
    get_hll_global $P163, ["Opcode"], "defined"
    find_lex $P164, "%opts"
    $P165 = $P163($P164)
    if $P165, unless_162_end
    get_hll_global $P166, ["Hash"], "empty"
    $P167 = $P166()
    store_lex "%opts", $P167
  unless_162_end:
# .annotate "line", 150

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
	
# .annotate "line", 143
    .return ()
  control_149:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P168, exception, "payload"
    .return ($P168)
.end


.namespace ["Parrot"]
.sub "get_address_of"  :subid("23_1266670806.63107") :outer("11_1266670806.63107")
    .param pmc param_172
# .annotate "line", 168
    new $P171, 'ExceptionHandler'
    set_addr $P171, control_170
    $P171."handle_types"(58)
    push_eh $P171
    .lex "$what", param_172
# .annotate "line", 169
    new $P173, "Exception"
    set $P173['type'], 58
    get_hll_global $P174, ["Opcode"], "get_addr"
    find_lex $P175, "$what"
    $P176 = $P174($P175)
    setattribute $P173, 'payload', $P176
    throw $P173
# .annotate "line", 168
    .return ()
  control_170:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P177, exception, "payload"
    .return ($P177)
.end


.namespace ["Parrot"]
.sub "get_hll_global"  :subid("24_1266670806.63107") :outer("11_1266670806.63107")
    .param pmc param_181
# .annotate "line", 175
    new $P180, 'ExceptionHandler'
    set_addr $P180, control_179
    $P180."handle_types"(58)
    push_eh $P180
    .lex "$path", param_181
# .annotate "line", 184
    new $P182, "Undef"
    .lex "$name", $P182
# .annotate "line", 185
    new $P183, "Undef"
    .lex "$key", $P183
# .annotate "line", 176
    find_lex $P185, "$path"
    $P186 = $P185."isa"("String")
    unless $P186, if_184_end
# .annotate "line", 177
    find_lex $P187, "$path"
    $P188 = $P187."split"("::")
    store_lex "$path", $P188
  if_184_end:
# .annotate "line", 180
    find_lex $P190, "$path"
    new $P191, "String"
    assign $P191, "array"
    set $S192, $P191
    does $I193, $P190, $S192
    if $I193, unless_189_end
# .annotate "line", 181
    find_lex $P194, "$path"
    concat $P195, $P194, " parameter must be a ::string or array of strings, not: "
    find_lex $P196, "$path"
    "die"($P195, $P196)
  unless_189_end:
# .annotate "line", 184
    find_lex $P197, "$path"
    $P198 = $P197."pop"()
    store_lex "$name", $P198
# .annotate "line", 185
    find_lex $P199, "$path"
    $P200 = "key_"($P199)
    store_lex "$key", $P200
# .annotate "line", 187
    find_lex $P201, "$path"
    $P202 = "key_"($P201)
    find_lex $P203, "$name"
    set $S204, $P203
    get_hll_global $P205, $P202, $S204
# .annotate "line", 175
    .return ($P205)
  control_179:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P206, exception, "payload"
    .return ($P206)
.end


.namespace ["Parrot"]
.sub "get_hll_namespace"  :subid("25_1266670806.63107") :outer("11_1266670806.63107")
    .param pmc param_210 :optional
    .param int has_param_210 :opt_flag
# .annotate "line", 196
    new $P209, 'ExceptionHandler'
    set_addr $P209, control_208
    $P209."handle_types"(58)
    push_eh $P209
    if has_param_210, optparam_41
    new $P211, "Undef"
    set param_210, $P211
  optparam_41:
    .lex "$path", param_210
# .annotate "line", 198
    new $P212, "Undef"
    .lex "$result", $P212
# .annotate "line", 196
    find_lex $P213, "$result"
# .annotate "line", 200
    find_lex $P215, "$path"
    defined $I216, $P215
    if $I216, if_214
# .annotate "line", 208
    get_hll_namespace $P230
    store_lex "$result", $P230
# .annotate "line", 207
    goto if_214_end
  if_214:
# .annotate "line", 201
    find_lex $P218, "$path"
    new $P219, "String"
    assign $P219, "String"
    set $S220, $P219
    isa $I221, $P218, $S220
    unless $I221, if_217_end
# .annotate "line", 202
    new $P222, "String"
    assign $P222, "::"
    set $S223, $P222
    find_lex $P224, "$path"
    set $S225, $P224
    split $P226, $S223, $S225
    $P227 = "key_"($P226)
    store_lex "$path", $P227
  if_217_end:
# .annotate "line", 205
    find_lex $P228, "$path"
    get_hll_namespace $P229, $P228
    store_lex "$result", $P229
  if_214_end:
# .annotate "line", 200
    find_lex $P231, "$result"
# .annotate "line", 196
    .return ($P231)
  control_208:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P232, exception, "payload"
    .return ($P232)
.end


.namespace ["Parrot"]
.sub "get_self"  :subid("26_1266670806.63107") :outer("11_1266670806.63107")
# .annotate "line", 214
    new $P235, 'ExceptionHandler'
    set_addr $P235, control_234
    $P235."handle_types"(58)
    push_eh $P235
# .annotate "line", 215
    new $P236, "Undef"
    .lex "$self", $P236
    new $P237, "String"
    assign $P237, "self"
    set $S238, $P237
    find_dynamic_lex $P239, $S238
    store_lex "$self", $P239
# .annotate "line", 217
    find_lex $P241, "$self"
    isnull $I242, $P241
    unless $I242, if_240_end
# .annotate "line", 218
    die "Fatal: No 'self' lexical in any caller scope"
  if_240_end:
# .annotate "line", 221
    new $P243, "Exception"
    set $P243['type'], 58
    find_lex $P244, "$self"
    setattribute $P243, 'payload', $P244
    throw $P243
# .annotate "line", 214
    .return ()
  control_234:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P245, exception, "payload"
    .return ($P245)
.end


.namespace ["Parrot"]
.sub "get_sub"  :subid("27_1266670806.63107") :outer("11_1266670806.63107")
    .param pmc param_249
    .param pmc param_250 :optional :named("caller_nsp")
    .param int has_param_250 :opt_flag
# .annotate "line", 224
    new $P248, 'ExceptionHandler'
    set_addr $P248, control_247
    $P248."handle_types"(58)
    push_eh $P248
    .lex "$path", param_249
    if has_param_250, optparam_42
    new $P251, "Undef"
    set param_250, $P251
  optparam_42:
    .lex "$caller_nsp", param_250
# .annotate "line", 225
    new $P252, "ResizablePMCArray"
    .lex "@parts", $P252
# .annotate "line", 226
    new $P253, "Undef"
    .lex "$name", $P253
# .annotate "line", 227
    new $P254, "Undef"
    .lex "&sub", $P254
# .annotate "line", 239
    new $P255, "Undef"
    .lex "$namespace", $P255
# .annotate "line", 225
    find_lex $P256, "$path"
    $P257 = $P256."split"("::")
    store_lex "@parts", $P257
# .annotate "line", 226
    find_lex $P258, "@parts"
    $P259 = $P258."pop"()
    store_lex "$name", $P259
    find_lex $P260, "&sub"
# .annotate "line", 229
    find_lex $P262, "@parts"
    set $N263, $P262
    iseq $I264, $N263, 0.0
    unless $I264, if_261_end
# .annotate "line", 230
    find_lex $P266, "$caller_nsp"
    if $P266, unless_265_end
    $P267 = "caller_namespace"(2)
    store_lex "$caller_nsp", $P267
  unless_265_end:
# .annotate "line", 232
    find_lex $P268, "$caller_nsp"
    find_lex $P269, "$name"
    $P270 = $P268."find_sub"($P269)
    store_lex "&sub", $P270
# .annotate "line", 234
    get_hll_global $P272, ["Opcode"], "defined"
    find_lex $P273, "&sub"
    $P274 = $P272($P273)
    unless $P274, if_271_end
# .annotate "line", 235
    new $P275, "Exception"
    set $P275['type'], 58
    find_lex $P276, "&sub"
    setattribute $P275, 'payload', $P276
    throw $P275
  if_271_end:
  if_261_end:
# .annotate "line", 239
    get_hll_global $P277, ["Opcode"], "get_hll_namespace"
    find_lex $P278, "@parts"
    $P279 = $P277($P278)
    store_lex "$namespace", $P279
# .annotate "line", 241
    find_lex $P281, "$namespace"
    unless $P281, if_280_end
# .annotate "line", 242
    find_lex $P282, "$namespace"
    find_lex $P283, "$name"
    $P284 = $P282."find_sub"($P283)
    store_lex "&sub", $P284
  if_280_end:
# .annotate "line", 245
    new $P285, "Exception"
    set $P285['type'], 58
    find_lex $P286, "&sub"
    setattribute $P285, 'payload', $P286
    throw $P285
# .annotate "line", 224
    .return ()
  control_247:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P287, exception, "payload"
    .return ($P287)
.end


.namespace ["Parrot"]
.sub "key"  :subid("28_1266670806.63107") :outer("11_1266670806.63107")
    .param pmc param_291
    .param pmc param_292 :slurpy
# .annotate "line", 248
    new $P290, 'ExceptionHandler'
    set_addr $P290, control_289
    $P290."handle_types"(58)
    push_eh $P290
    .lex "$first", param_291
    .lex "@parts", param_292
# .annotate "line", 249
    find_lex $P293, "@parts"
    find_lex $P294, "$first"
    $P293."unshift"($P294)
# .annotate "line", 250
    find_lex $P295, "@parts"
    $P296 = "key_"($P295)
# .annotate "line", 248
    .return ($P296)
  control_289:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P297, exception, "payload"
    .return ($P297)
.end


.namespace ["Parrot"]
.sub "key_"  :subid("29_1266670806.63107") :outer("11_1266670806.63107")
    .param pmc param_301
# .annotate "line", 253
    .const 'Sub' $P309 = "30_1266670806.63107" 
    capture_lex $P309
    new $P300, 'ExceptionHandler'
    set_addr $P300, control_299
    $P300."handle_types"(58)
    push_eh $P300
    .lex "@parts", param_301
# .annotate "line", 254
    new $P302, "Undef"
    .lex "$key", $P302
# .annotate "line", 253
    find_lex $P303, "$key"
# .annotate "line", 256
    find_lex $P305, "@parts"
    defined $I306, $P305
    unless $I306, for_undef_43
    iter $P304, $P305
    new $P314, 'ExceptionHandler'
    set_addr $P314, loop313_handler
    $P314."handle_types"(65, 67, 66)
    push_eh $P314
  loop313_test:
    unless $P304, loop313_done
    shift $P307, $P304
  loop313_redo:
    .const 'Sub' $P309 = "30_1266670806.63107" 
    capture_lex $P309
    $P309($P307)
  loop313_next:
    goto loop313_test
  loop313_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P315, exception, 'type'
    eq $P315, 65, loop313_next
    eq $P315, 67, loop313_redo
  loop313_done:
    pop_eh 
  for_undef_43:
    find_lex $P316, "$key"
# .annotate "line", 253
    .return ($P316)
  control_299:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P317, exception, "payload"
    .return ($P317)
.end


.namespace ["Parrot"]
.sub "_block308"  :anon :subid("30_1266670806.63107") :outer("29_1266670806.63107")
    .param pmc param_311
# .annotate "line", 257
    new $P310, "Undef"
    .lex "$element", $P310
    .lex "$_", param_311
    find_lex $P312, "$_"
    store_lex "$element", $P312
# .annotate "line", 258

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
		
# .annotate "line", 256
    .return ()
.end


.namespace ["Parrot"]
.sub "namespace_name"  :subid("31_1266670806.63107") :outer("11_1266670806.63107")
    .param pmc param_321
# .annotate "line", 310
    new $P320, 'ExceptionHandler'
    set_addr $P320, control_319
    $P320."handle_types"(58)
    push_eh $P320
    .lex "$nsp", param_321
# .annotate "line", 315
    new $P322, "ResizablePMCArray"
    .lex "@parts", $P322
# .annotate "line", 311
    get_hll_global $P324, ["Opcode"], "isa"
    find_lex $P325, "$nsp"
    $P326 = $P324($P325, "String")
    unless $P326, if_323_end
# .annotate "line", 312
    new $P327, "Exception"
    set $P327['type'], 58
    find_lex $P328, "$nsp"
    setattribute $P327, 'payload', $P328
    throw $P327
  if_323_end:
# .annotate "line", 315
    find_lex $P329, "$nsp"
    $P330 = $P329."get_name"()
    store_lex "@parts", $P330
# .annotate "line", 316
    find_lex $P331, "@parts"
    $P331."shift"()
# .annotate "line", 317
    new $P332, "Exception"
    set $P332['type'], 58
    find_lex $P333, "@parts"
    $P334 = $P333."join"("::")
    setattribute $P332, 'payload', $P334
    throw $P332
# .annotate "line", 310
    .return ()
  control_319:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P335, exception, "payload"
    .return ($P335)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1266670793.44087")
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
.sub "_block13"  :subid("11_1266670793.44087") :outer("10_1266670793.44087")
# .annotate "line", 7
    .const 'Sub' $P141 = "16_1266670793.44087" 
    capture_lex $P141
    .const 'Sub' $P35 = "14_1266670793.44087" 
    capture_lex $P35
    .const 'Sub' $P23 = "13_1266670793.44087" 
    capture_lex $P23
    .const 'Sub' $P15 = "12_1266670793.44087" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1266670793.44087" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 12
    .const 'Sub' $P23 = "13_1266670793.44087" 
    capture_lex $P23
    .lex "compile", $P23
# .annotate "line", 17
    .const 'Sub' $P35 = "14_1266670793.44087" 
    capture_lex $P35
    .lex "compile_sub", $P35
# .annotate "line", 59
    .const 'Sub' $P141 = "16_1266670793.44087" 
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
.sub "_pre_initload"  :subid("12_1266670793.44087") :outer("11_1266670793.44087")
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
.sub "compile"  :subid("13_1266670793.44087") :outer("11_1266670793.44087")
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
.sub "compile_sub"  :subid("14_1266670793.44087") :outer("11_1266670793.44087")
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
    .const 'Sub' $P120 = "15_1266670793.44087" 
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
    get_hll_global $P56, ["Array"], "empty"
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
    .const 'Sub' $P120 = "15_1266670793.44087" 
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
.sub "_block119"  :anon :subid("15_1266670793.44087") :outer("14_1266670793.44087")
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
.sub "pir_namespace"  :subid("16_1266670793.44087") :outer("11_1266670793.44087")
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
.sub "_block11"  :anon :subid("10_1266670835.0715")
# .annotate "line", 0
    get_hll_global $P14, ["Array"], "_block13" 
    capture_lex $P14
# .annotate "line", 42
    get_hll_global $P14, ["Array"], "_block13" 
    capture_lex $P14
    $P629 = $P14()
# .annotate "line", 1
    .return ($P629)
.end


.namespace ["Array"]
.sub "_block13"  :subid("11_1266670835.0715") :outer("10_1266670835.0715")
# .annotate "line", 42
    .const 'Sub' $P599 = "41_1266670835.0715" 
    capture_lex $P599
    .const 'Sub' $P526 = "40_1266670835.0715" 
    capture_lex $P526
    .const 'Sub' $P510 = "39_1266670835.0715" 
    capture_lex $P510
    .const 'Sub' $P473 = "38_1266670835.0715" 
    capture_lex $P473
    .const 'Sub' $P457 = "37_1266670835.0715" 
    capture_lex $P457
    .const 'Sub' $P449 = "36_1266670835.0715" 
    capture_lex $P449
    .const 'Sub' $P440 = "35_1266670835.0715" 
    capture_lex $P440
    .const 'Sub' $P418 = "33_1266670835.0715" 
    capture_lex $P418
    .const 'Sub' $P390 = "31_1266670835.0715" 
    capture_lex $P390
    .const 'Sub' $P271 = "30_1266670835.0715" 
    capture_lex $P271
    .const 'Sub' $P252 = "28_1266670835.0715" 
    capture_lex $P252
    .const 'Sub' $P205 = "25_1266670835.0715" 
    capture_lex $P205
    .const 'Sub' $P183 = "23_1266670835.0715" 
    capture_lex $P183
    .const 'Sub' $P176 = "22_1266670835.0715" 
    capture_lex $P176
    .const 'Sub' $P170 = "21_1266670835.0715" 
    capture_lex $P170
    .const 'Sub' $P153 = "20_1266670835.0715" 
    capture_lex $P153
    .const 'Sub' $P136 = "19_1266670835.0715" 
    capture_lex $P136
    .const 'Sub' $P126 = "18_1266670835.0715" 
    capture_lex $P126
    .const 'Sub' $P116 = "17_1266670835.0715" 
    capture_lex $P116
    .const 'Sub' $P90 = "15_1266670835.0715" 
    capture_lex $P90
    .const 'Sub' $P15 = "12_1266670835.0715" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1266670835.0715" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 213
    .const 'Sub' $P90 = "15_1266670835.0715" 
    capture_lex $P90
    .lex "clone", $P90
# .annotate "line", 225
    .const 'Sub' $P116 = "17_1266670835.0715" 
    capture_lex $P116
    .lex "cmp_numeric", $P116
# .annotate "line", 226
    .const 'Sub' $P126 = "18_1266670835.0715" 
    capture_lex $P126
    .lex "cmp_numeric_R", $P126
# .annotate "line", 227
    .const 'Sub' $P136 = "19_1266670835.0715" 
    capture_lex $P136
    .lex "cmp_string", $P136
# .annotate "line", 228
    .const 'Sub' $P153 = "20_1266670835.0715" 
    capture_lex $P153
    .lex "cmp_string_R", $P153
# .annotate "line", 269
    .const 'Sub' $P170 = "21_1266670835.0715" 
    capture_lex $P170
    .lex "empty", $P170
# .annotate "line", 294
    .const 'Sub' $P176 = "22_1266670835.0715" 
    capture_lex $P176
    .lex "new", $P176
# .annotate "line", 298
    .const 'Sub' $P183 = "23_1266670835.0715" 
    capture_lex $P183
    .lex "reverse", $P183
# .annotate "line", 344
    .const 'Sub' $P205 = "25_1266670835.0715" 
    capture_lex $P205
    .lex "unique", $P205
# .annotate "line", 42
    find_lex $P251, "_pre_initload"
# .annotate "line", 156
    find_lex $P385, "clone"
    find_lex $P386, "cmp_numeric"
    find_lex $P387, "cmp_numeric_R"
    find_lex $P388, "cmp_string"
    find_lex $P389, "cmp_string_R"
# .annotate "line", 261
    find_lex $P472, "empty"
# .annotate "line", 286
    find_lex $P524, "new"
    find_lex $P525, "reverse"
# .annotate "line", 336
    find_lex $P628, "unique"
# .annotate "line", 42
    .return ($P628)
.end


.namespace ["Array"]
.sub "_pre_initload"  :subid("12_1266670835.0715") :outer("11_1266670835.0715")
# .annotate "line", 42
    .const 'Sub' $P44 = "13_1266670835.0715" 
    capture_lex $P44
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 44
    get_global $P18, "%Bsearch_compare_func"
    unless_null $P18, vivify_42
    new $P18, "Hash"
    set_global "%Bsearch_compare_func", $P18
  vivify_42:
# .annotate "line", 51
    get_global $P19, "@Empty"
    unless_null $P19, vivify_43
    new $P19, "ResizablePMCArray"
    set_global "@Empty", $P19
  vivify_43:
# .annotate "line", 53
    new $P20, "Hash"
    .lex "%pmcs", $P20
# .annotate "line", 80
    new $P21, "Undef"
    .lex "$from_nsp", $P21
# .annotate "line", 42
    get_global $P22, "%Bsearch_compare_func"
# .annotate "line", 46
    get_hll_global $P23, ["Array"], "cmp_numeric"
    get_global $P24, "%Bsearch_compare_func"
    unless_null $P24, vivify_44
    new $P24, "Hash"
    set_global "%Bsearch_compare_func", $P24
  vivify_44:
    set $P24["<=>"], $P23
# .annotate "line", 47
    get_hll_global $P25, ["Array"], "cmp_numeric_R"
    get_global $P26, "%Bsearch_compare_func"
    unless_null $P26, vivify_45
    new $P26, "Hash"
    set_global "%Bsearch_compare_func", $P26
  vivify_45:
    set $P26["R<=>"], $P25
# .annotate "line", 48
    get_hll_global $P27, ["Array"], "cmp_string"
    get_global $P28, "%Bsearch_compare_func"
    unless_null $P28, vivify_46
    new $P28, "Hash"
    set_global "%Bsearch_compare_func", $P28
  vivify_46:
    set $P28["cmp"], $P27
# .annotate "line", 49
    get_hll_global $P29, ["Array"], "cmp_string_R"
    get_global $P30, "%Bsearch_compare_func"
    unless_null $P30, vivify_47
    new $P30, "Hash"
    set_global "%Bsearch_compare_func", $P30
  vivify_47:
    set $P30["Rcmp"], $P29
# .annotate "line", 51
    get_hll_global $P31, ["Array"], "empty"
    $P32 = $P31()
    set_global "@Empty", $P32
    find_lex $P33, "%pmcs"
# .annotate "line", 56
    new $P34, "ResizablePMCArray"
    push $P34, "bsearch"
    push $P34, "concat"
    push $P34, "contains"
    push $P34, "delete"
    push $P34, "elements"
    push $P34, "is_sorted"
    push $P34, "join"
    push $P34, "slice"
    push $P34, "splice"
    find_lex $P35, "%pmcs"
    unless_null $P35, vivify_48
    new $P35, "Hash"
    store_lex "%pmcs", $P35
  vivify_48:
    set $P35["ResizablePMCArray"], $P34
# .annotate "line", 67
    new $P36, "ResizablePMCArray"
    push $P36, "append"
    push $P36, "bsearch"
    push $P36, "concat"
    push $P36, "contains"
    push $P36, "delete"
    push $P36, "elements"
    push $P36, "is_sorted"
    push $P36, "join"
    push $P36, "slice"
    push $P36, "splice"
    find_lex $P37, "%pmcs"
    unless_null $P37, vivify_49
    new $P37, "Hash"
    store_lex "%pmcs", $P37
  vivify_49:
    set $P37["ResizableStringArray"], $P36
# .annotate "line", 80
    get_namespace $P38
    store_lex "$from_nsp", $P38
# .annotate "line", 82
    find_lex $P40, "%pmcs"
    defined $I41, $P40
    unless $I41, for_undef_50
    iter $P39, $P40
    new $P87, 'ExceptionHandler'
    set_addr $P87, loop86_handler
    $P87."handle_types"(65, 67, 66)
    push_eh $P87
  loop86_test:
    unless $P39, loop86_done
    shift $P42, $P39
  loop86_redo:
    .const 'Sub' $P44 = "13_1266670835.0715" 
    capture_lex $P44
    $P44($P42)
  loop86_next:
    goto loop86_test
  loop86_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P88, exception, 'type'
    eq $P88, 65, loop86_next
    eq $P88, 67, loop86_redo
  loop86_done:
    pop_eh 
  for_undef_50:
# .annotate "line", 42
    .return ($P39)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P89, exception, "payload"
    .return ($P89)
.end


.namespace ["Array"]
.sub "_block43"  :anon :subid("13_1266670835.0715") :outer("12_1266670835.0715")
    .param pmc param_48
# .annotate "line", 82
    .const 'Sub' $P63 = "14_1266670835.0715" 
    capture_lex $P63
# .annotate "line", 83
    new $P45, "Hash"
    .lex "%export_subs", $P45
# .annotate "line", 84
    new $P46, "Undef"
    .lex "$pmc_name", $P46
# .annotate "line", 85
    new $P47, "Undef"
    .lex "$to_nsp", $P47
    .lex "$_", param_48
# .annotate "line", 82
    find_lex $P49, "%export_subs"
# .annotate "line", 84
    find_lex $P50, "$_"
    set $S51, $P50
    new $P52, 'String'
    set $P52, $S51
    store_lex "$pmc_name", $P52
# .annotate "line", 85
    get_hll_global $P53, ["Parrot"], "get_hll_namespace"
    find_lex $P54, "$pmc_name"
    $P55 = $P53($P54)
    store_lex "$to_nsp", $P55
# .annotate "line", 87
    find_lex $P57, "$_"
    find_lex $P58, "%pmcs"
    unless_null $P58, vivify_51
    new $P58, "Hash"
  vivify_51:
    set $P59, $P58[$P57]
    unless_null $P59, vivify_52
    new $P59, "Undef"
  vivify_52:
    defined $I60, $P59
    unless $I60, for_undef_53
    iter $P56, $P59
    new $P80, 'ExceptionHandler'
    set_addr $P80, loop79_handler
    $P80."handle_types"(65, 67, 66)
    push_eh $P80
  loop79_test:
    unless $P56, loop79_done
    shift $P61, $P56
  loop79_redo:
    .const 'Sub' $P63 = "14_1266670835.0715" 
    capture_lex $P63
    $P63($P61)
  loop79_next:
    goto loop79_test
  loop79_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P81, exception, 'type'
    eq $P81, 65, loop79_next
    eq $P81, 67, loop79_redo
  loop79_done:
    pop_eh 
  for_undef_53:
# .annotate "line", 97
    find_lex $P82, "$from_nsp"
    find_lex $P83, "$to_nsp"
    find_lex $P84, "%export_subs"
    $P85 = $P82."export_to"($P83, $P84)
# .annotate "line", 82
    .return ($P85)
.end


.namespace ["Array"]
.sub "_block62"  :anon :subid("14_1266670835.0715") :outer("13_1266670835.0715")
    .param pmc param_64
# .annotate "line", 87
    .lex "$_", param_64
# .annotate "line", 88
    find_lex $P67, "$from_nsp"
    find_lex $P68, "$_"
    $P69 = $P67."contains"($P68)
    if $P69, if_66
# .annotate "line", 92
    new $P75, 'String'
    set $P75, "Request to export unknown Array method '"
    find_lex $P76, "$_"
    concat $P77, $P75, $P76
    concat $P78, $P77, "'"
    die $P78
# .annotate "line", 91
    goto if_66_end
  if_66:
# .annotate "line", 89
    find_lex $P70, "$_"
    find_lex $P71, "$from_nsp"
    unless_null $P71, vivify_54
    new $P71, "Hash"
  vivify_54:
    set $P72, $P71[$P70]
    unless_null $P72, vivify_55
    new $P72, "Undef"
  vivify_55:
    find_lex $P73, "$_"
    find_lex $P74, "%export_subs"
    unless_null $P74, vivify_56
    new $P74, "Hash"
    store_lex "%export_subs", $P74
  vivify_56:
    set $P74[$P73], $P72
# .annotate "line", 88
    set $P65, $P72
  if_66_end:
# .annotate "line", 87
    .return ($P65)
.end


.namespace ["Array"]
.sub "clone"  :subid("15_1266670835.0715") :outer("11_1266670835.0715")
    .param pmc param_93
# .annotate "line", 213
    .const 'Sub' $P105 = "16_1266670835.0715" 
    capture_lex $P105
    new $P92, 'ExceptionHandler'
    set_addr $P92, control_91
    $P92."handle_types"(58)
    push_eh $P92
    .lex "@original", param_93
# .annotate "line", 214
    new $P94, "ResizablePMCArray"
    .lex "@clone", $P94
    get_hll_global $P95, ["Array"], "empty"
    $P96 = $P95()
    store_lex "@clone", $P96
# .annotate "line", 216
    find_lex $P98, "@original"
    set $N99, $P98
    unless $N99, if_97_end
# .annotate "line", 217
    find_lex $P101, "@original"
    defined $I102, $P101
    unless $I102, for_undef_57
    iter $P100, $P101
    new $P111, 'ExceptionHandler'
    set_addr $P111, loop110_handler
    $P111."handle_types"(65, 67, 66)
    push_eh $P111
  loop110_test:
    unless $P100, loop110_done
    shift $P103, $P100
  loop110_redo:
    .const 'Sub' $P105 = "16_1266670835.0715" 
    capture_lex $P105
    $P105($P103)
  loop110_next:
    goto loop110_test
  loop110_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, 'type'
    eq $P112, 65, loop110_next
    eq $P112, 67, loop110_redo
  loop110_done:
    pop_eh 
  for_undef_57:
  if_97_end:
# .annotate "line", 222
    new $P113, "Exception"
    set $P113['type'], 58
    find_lex $P114, "@clone"
    setattribute $P113, 'payload', $P114
    throw $P113
# .annotate "line", 213
    .return ()
  control_91:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, "payload"
    .return ($P115)
.end


.namespace ["Array"]
.sub "_block104"  :anon :subid("16_1266670835.0715") :outer("15_1266670835.0715")
    .param pmc param_106
# .annotate "line", 217
    .lex "$_", param_106
# .annotate "line", 218
    find_lex $P107, "@clone"
    find_lex $P108, "$_"
    $P109 = $P107."push"($P108)
# .annotate "line", 217
    .return ($P109)
.end


.namespace ["Array"]
.sub "cmp_numeric"  :subid("17_1266670835.0715") :outer("11_1266670835.0715")
    .param pmc param_119
    .param pmc param_120
# .annotate "line", 225
    new $P118, 'ExceptionHandler'
    set_addr $P118, control_117
    $P118."handle_types"(58)
    push_eh $P118
    .lex "$a", param_119
    .lex "$b", param_120
    new $P121, "Exception"
    set $P121['type'], 58
    find_lex $P122, "$a"
    find_lex $P123, "$b"
    sub $P124, $P122, $P123
    setattribute $P121, 'payload', $P124
    throw $P121
    .return ()
  control_117:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P125, exception, "payload"
    .return ($P125)
.end


.namespace ["Array"]
.sub "cmp_numeric_R"  :subid("18_1266670835.0715") :outer("11_1266670835.0715")
    .param pmc param_129
    .param pmc param_130
# .annotate "line", 226
    new $P128, 'ExceptionHandler'
    set_addr $P128, control_127
    $P128."handle_types"(58)
    push_eh $P128
    .lex "$a", param_129
    .lex "$b", param_130
    new $P131, "Exception"
    set $P131['type'], 58
    find_lex $P132, "$b"
    find_lex $P133, "$a"
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
.sub "cmp_string"  :subid("19_1266670835.0715") :outer("11_1266670835.0715")
    .param pmc param_139
    .param pmc param_140
# .annotate "line", 227
    new $P138, 'ExceptionHandler'
    set_addr $P138, control_137
    $P138."handle_types"(58)
    push_eh $P138
    .lex "$a", param_139
    .lex "$b", param_140
    find_lex $P143, "$a"
    set $S144, $P143
    find_lex $P145, "$b"
    set $S146, $P145
    islt $I147, $S144, $S146
    if $I147, if_142
    new $P150, "Exception"
    set $P150['type'], 58
    new $P151, "Integer"
    assign $P151, 1
    setattribute $P150, 'payload', $P151
    throw $P150
    goto if_142_end
  if_142:
    new $P148, "Exception"
    set $P148['type'], 58
    new $P149, "Integer"
    assign $P149, -1
    setattribute $P148, 'payload', $P149
    throw $P148
  if_142_end:
    .return ($P141)
  control_137:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P152, exception, "payload"
    .return ($P152)
.end


.namespace ["Array"]
.sub "cmp_string_R"  :subid("20_1266670835.0715") :outer("11_1266670835.0715")
    .param pmc param_156
    .param pmc param_157
# .annotate "line", 228
    new $P155, 'ExceptionHandler'
    set_addr $P155, control_154
    $P155."handle_types"(58)
    push_eh $P155
    .lex "$a", param_156
    .lex "$b", param_157
    find_lex $P160, "$b"
    set $S161, $P160
    find_lex $P162, "$a"
    set $S163, $P162
    islt $I164, $S161, $S163
    if $I164, if_159
    new $P167, "Exception"
    set $P167['type'], 58
    new $P168, "Integer"
    assign $P168, 1
    setattribute $P167, 'payload', $P168
    throw $P167
    goto if_159_end
  if_159:
    new $P165, "Exception"
    set $P165['type'], 58
    new $P166, "Integer"
    assign $P166, -1
    setattribute $P165, 'payload', $P166
    throw $P165
  if_159_end:
    .return ($P158)
  control_154:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P169, exception, "payload"
    .return ($P169)
.end


.namespace ["Array"]
.sub "empty"  :subid("21_1266670835.0715") :outer("11_1266670835.0715")
# .annotate "line", 269
    new $P172, 'ExceptionHandler'
    set_addr $P172, control_171
    $P172."handle_types"(58)
    push_eh $P172
# .annotate "line", 270
    get_hll_global $P173, ["Opcode"], "new"
    $P174 = $P173("ResizablePMCArray")
# .annotate "line", 269
    .return ($P174)
  control_171:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P175, exception, "payload"
    .return ($P175)
.end


.namespace ["Array"]
.sub "new"  :subid("22_1266670835.0715") :outer("11_1266670835.0715")
    .param pmc param_179 :slurpy
# .annotate "line", 294
    new $P178, 'ExceptionHandler'
    set_addr $P178, control_177
    $P178."handle_types"(58)
    push_eh $P178
    .lex "@elements", param_179
# .annotate "line", 295
    new $P180, "Exception"
    set $P180['type'], 58
    find_lex $P181, "@elements"
    setattribute $P180, 'payload', $P181
    throw $P180
# .annotate "line", 294
    .return ()
  control_177:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P182, exception, "payload"
    .return ($P182)
.end


.namespace ["Array"]
.sub "reverse"  :subid("23_1266670835.0715") :outer("11_1266670835.0715")
    .param pmc param_186
# .annotate "line", 298
    .const 'Sub' $P194 = "24_1266670835.0715" 
    capture_lex $P194
    new $P185, 'ExceptionHandler'
    set_addr $P185, control_184
    $P185."handle_types"(58)
    push_eh $P185
    .lex "@original", param_186
# .annotate "line", 299
    new $P187, "ResizablePMCArray"
    .lex "@result", $P187
    $P188 = "empty"()
    store_lex "@result", $P188
# .annotate "line", 301
    find_lex $P190, "@original"
    defined $I191, $P190
    unless $I191, for_undef_58
    iter $P189, $P190
    new $P200, 'ExceptionHandler'
    set_addr $P200, loop199_handler
    $P200."handle_types"(65, 67, 66)
    push_eh $P200
  loop199_test:
    unless $P189, loop199_done
    shift $P192, $P189
  loop199_redo:
    .const 'Sub' $P194 = "24_1266670835.0715" 
    capture_lex $P194
    $P194($P192)
  loop199_next:
    goto loop199_test
  loop199_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P201, exception, 'type'
    eq $P201, 65, loop199_next
    eq $P201, 67, loop199_redo
  loop199_done:
    pop_eh 
  for_undef_58:
# .annotate "line", 305
    new $P202, "Exception"
    set $P202['type'], 58
    find_lex $P203, "@result"
    setattribute $P202, 'payload', $P203
    throw $P202
# .annotate "line", 298
    .return ()
  control_184:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P204, exception, "payload"
    .return ($P204)
.end


.namespace ["Array"]
.sub "_block193"  :anon :subid("24_1266670835.0715") :outer("23_1266670835.0715")
    .param pmc param_195
# .annotate "line", 301
    .lex "$_", param_195
# .annotate "line", 302
    find_lex $P196, "@result"
    find_lex $P197, "$_"
    $P198 = $P196."unshift"($P197)
# .annotate "line", 301
    .return ($P198)
.end


.namespace ["Array"]
.sub "unique"  :subid("25_1266670835.0715") :outer("11_1266670835.0715")
    .param pmc param_208
# .annotate "line", 344
    .const 'Sub' $P217 = "26_1266670835.0715" 
    capture_lex $P217
    new $P207, 'ExceptionHandler'
    set_addr $P207, control_206
    $P207."handle_types"(58)
    push_eh $P207
    .lex "@original", param_208
# .annotate "line", 345
    new $P209, "ResizablePMCArray"
    .lex "@result", $P209
    get_hll_global $P210, ["Array"], "empty"
    $P211 = $P210()
    store_lex "@result", $P211
# .annotate "line", 347
    find_lex $P213, "@original"
    defined $I214, $P213
    unless $I214, for_undef_59
    iter $P212, $P213
    new $P246, 'ExceptionHandler'
    set_addr $P246, loop245_handler
    $P246."handle_types"(65, 67, 66)
    push_eh $P246
  loop245_test:
    unless $P212, loop245_done
    shift $P215, $P212
  loop245_redo:
    .const 'Sub' $P217 = "26_1266670835.0715" 
    capture_lex $P217
    $P217($P215)
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
  for_undef_59:
# .annotate "line", 369
    new $P248, "Exception"
    set $P248['type'], 58
    find_lex $P249, "@result"
    setattribute $P248, 'payload', $P249
    throw $P248
# .annotate "line", 344
    .return ()
  control_206:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P250, exception, "payload"
    .return ($P250)
.end


.namespace ["Array"]
.sub "_block216"  :anon :subid("26_1266670835.0715") :outer("25_1266670835.0715")
    .param pmc param_220
# .annotate "line", 347
    .const 'Sub' $P228 = "27_1266670835.0715" 
    capture_lex $P228
# .annotate "line", 348
    new $P218, "Undef"
    .lex "$o", $P218
# .annotate "line", 349
    new $P219, "Undef"
    .lex "$found", $P219
    .lex "$_", param_220
# .annotate "line", 348
    find_lex $P221, "$_"
    store_lex "$o", $P221
# .annotate "line", 349
    new $P222, "Integer"
    assign $P222, 0
    store_lex "$found", $P222
# .annotate "line", 351
    find_lex $P224, "@result"
    defined $I225, $P224
    unless $I225, for_undef_60
    iter $P223, $P224
    new $P237, 'ExceptionHandler'
    set_addr $P237, loop236_handler
    $P237."handle_types"(65, 67, 66)
    push_eh $P237
  loop236_test:
    unless $P223, loop236_done
    shift $P226, $P223
  loop236_redo:
    .const 'Sub' $P228 = "27_1266670835.0715" 
    capture_lex $P228
    $P228($P226)
  loop236_next:
    goto loop236_test
  loop236_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P238, exception, 'type'
    eq $P238, 65, loop236_next
    eq $P238, 67, loop236_redo
  loop236_done:
    pop_eh 
  for_undef_60:
# .annotate "line", 364
    find_lex $P241, "$found"
    unless $P241, unless_240
    set $P239, $P241
    goto unless_240_end
  unless_240:
# .annotate "line", 365
    find_lex $P242, "@result"
    find_lex $P243, "$o"
    $P244 = $P242."push"($P243)
# .annotate "line", 364
    set $P239, $P244
  unless_240_end:
# .annotate "line", 347
    .return ($P239)
.end


.namespace ["Array"]
.sub "_block227"  :anon :subid("27_1266670835.0715") :outer("26_1266670835.0715")
    .param pmc param_230
# .annotate "line", 352
    new $P229, "Undef"
    .lex "$match", $P229
    .lex "$_", param_230

				
				$P0 = find_lex '$_'
				$P1 = find_lex '$o'
				$I0 = cmp $P0, $P1
				not $I0
				$P231 = box $I0
			
    store_lex "$match", $P231
# .annotate "line", 361
    find_lex $P234, "$found"
    unless $P234, unless_233
    set $P232, $P234
    goto unless_233_end
  unless_233:
    find_lex $P235, "$match"
    set $P232, $P235
  unless_233_end:
    store_lex "$found", $P232
# .annotate "line", 351
    .return ($P232)
.end


.namespace ["Array"]
.sub "append"  :subid("28_1266670835.0715") :method :outer("11_1266670835.0715")
    .param pmc param_255
# .annotate "line", 107
    .const 'Sub' $P261 = "29_1266670835.0715" 
    capture_lex $P261
    new $P254, 'ExceptionHandler'
    set_addr $P254, control_253
    $P254."handle_types"(58)
    push_eh $P254
    .lex "self", self
    .lex "@other", param_255
# .annotate "line", 108
    find_lex $P257, "@other"
    defined $I258, $P257
    unless $I258, for_undef_61
    iter $P256, $P257
    new $P268, 'ExceptionHandler'
    set_addr $P268, loop267_handler
    $P268."handle_types"(65, 67, 66)
    push_eh $P268
  loop267_test:
    unless $P256, loop267_done
    shift $P259, $P256
  loop267_redo:
    .const 'Sub' $P261 = "29_1266670835.0715" 
    capture_lex $P261
    $P261($P259)
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
  for_undef_61:
# .annotate "line", 107
    .return ($P256)
  control_253:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P270, exception, "payload"
    .return ($P270)
.end


.namespace ["Array"]
.sub "_block260"  :anon :subid("29_1266670835.0715") :outer("28_1266670835.0715")
    .param pmc param_262
# .annotate "line", 108
    .lex "$_", param_262
# .annotate "line", 109
    find_lex $P263, "self"
    find_lex $P264, "$_"
    set $S265, $P264
    $P266 = $P263."push"($S265)
# .annotate "line", 108
    .return ($P266)
.end


.namespace ["Array"]
.sub "bsearch"  :subid("30_1266670835.0715") :method :outer("11_1266670835.0715")
    .param pmc param_274
    .param pmc param_275 :slurpy :named
# .annotate "line", 156
    new $P273, 'ExceptionHandler'
    set_addr $P273, control_272
    $P273."handle_types"(58)
    push_eh $P273
    .lex "self", self
    .lex "$value", param_274
    .lex "%opts", param_275
# .annotate "line", 157
    get_global $P276, "%Bsearch_compare_func"
    unless_null $P276, vivify_62
    new $P276, "Hash"
    set_global "%Bsearch_compare_func", $P276
  vivify_62:
# .annotate "line", 159
    new $P277, "Undef"
    .lex "$cmp", $P277
# .annotate "line", 160
    new $P278, "Undef"
    .lex "$high", $P278
# .annotate "line", 161
    new $P279, "Undef"
    .lex "$low", $P279
# .annotate "line", 162
    new $P280, "Undef"
    .lex "$top", $P280
# .annotate "line", 164
    new $P281, "Undef"
    .lex "$elts", $P281
# .annotate "line", 169
    new $P282, "Undef"
    .lex "&comparator", $P282
# .annotate "line", 177
    new $P283, "Undef"
    .lex "$mid", $P283
# .annotate "line", 202
    new $P284, "Undef"
    .lex "$result", $P284
# .annotate "line", 156
    get_global $P285, "%Bsearch_compare_func"
# .annotate "line", 159
    find_lex $P288, "%opts"
    unless_null $P288, vivify_63
    new $P288, "Hash"
  vivify_63:
    set $P289, $P288["cmp"]
    unless_null $P289, vivify_64
    new $P289, "Undef"
  vivify_64:
    if $P289, if_287
    new $P292, "String"
    assign $P292, "<=>"
    set $P286, $P292
    goto if_287_end
  if_287:
    find_lex $P290, "%opts"
    unless_null $P290, vivify_65
    new $P290, "Hash"
  vivify_65:
    set $P291, $P290["cmp"]
    unless_null $P291, vivify_66
    new $P291, "Undef"
  vivify_66:
    set $P286, $P291
  if_287_end:
    store_lex "$cmp", $P286
# .annotate "line", 160
    find_lex $P295, "%opts"
    unless_null $P295, vivify_67
    new $P295, "Hash"
  vivify_67:
    set $P296, $P295["high"]
    unless_null $P296, vivify_68
    new $P296, "Undef"
  vivify_68:
    set $N297, $P296
    isgt $I298, $N297, 0.0
    if $I298, if_294
    find_lex $P301, "self"
    $P302 = $P301."elements"()
    set $P293, $P302
    goto if_294_end
  if_294:
    find_lex $P299, "%opts"
    unless_null $P299, vivify_69
    new $P299, "Hash"
  vivify_69:
    set $P300, $P299["high"]
    unless_null $P300, vivify_70
    new $P300, "Undef"
  vivify_70:
    set $P293, $P300
  if_294_end:
    store_lex "$high", $P293
# .annotate "line", 161
    new $P303, "Integer"
    assign $P303, 0
    find_lex $P304, "%opts"
    unless_null $P304, vivify_71
    new $P304, "Hash"
  vivify_71:
    set $P305, $P304["low"]
    unless_null $P305, vivify_72
    new $P305, "Undef"
  vivify_72:
    add $P306, $P303, $P305
    store_lex "$low", $P306
# .annotate "line", 162
    find_lex $P307, "$high"
    store_lex "$top", $P307
# .annotate "line", 164
    find_lex $P308, "self"
    $P309 = $P308."elements"()
    store_lex "$elts", $P309
# .annotate "line", 166
    find_lex $P311, "$high"
    set $N312, $P311
    find_lex $P313, "$elts"
    set $N314, $P313
    isgt $I315, $N312, $N314
    unless $I315, if_310_end
    find_lex $P316, "$elts"
    store_lex "$high", $P316
  if_310_end:
# .annotate "line", 167
    find_lex $P318, "$low"
    set $N319, $P318
    islt $I320, $N319, 0.0
    unless $I320, if_317_end
    find_lex $P321, "$low"
    find_lex $P322, "$elts"
    add $P323, $P321, $P322
    store_lex "$low", $P323
  if_317_end:
# .annotate "line", 169
    get_global $P326, "%Bsearch_compare_func"
    find_lex $P327, "$cmp"
    $P328 = $P326."contains"($P327)
    if $P328, if_325
    find_lex $P332, "$cmp"
    set $P324, $P332
    goto if_325_end
  if_325:
    find_lex $P329, "$cmp"
    get_global $P330, "%Bsearch_compare_func"
    unless_null $P330, vivify_73
    new $P330, "Hash"
  vivify_73:
    set $P331, $P330[$P329]
    unless_null $P331, vivify_74
    new $P331, "Undef"
  vivify_74:
    set $P324, $P331
  if_325_end:
# .annotate "line", 170
    store_lex "&comparator", $P324
# .annotate "line", 173
    find_lex $P336, "&comparator"
    $P337 = $P336."isa"("Sub")
    unless $P337, unless_335
    set $P334, $P337
    goto unless_335_end
  unless_335:
    find_lex $P338, "&comparator"
    $P339 = $P338."isa"("MultiSub")
    set $P334, $P339
  unless_335_end:
    if $P334, unless_333_end
# .annotate "line", 174
    get_hll_global $P340, ["Opcode"], "die"
    $P340("Bsearch :cmp function parameter was not a (Multi)Sub")
  unless_333_end:
# .annotate "line", 173
    find_lex $P341, "$mid"
# .annotate "line", 179
    new $P361, 'ExceptionHandler'
    set_addr $P361, loop360_handler
    $P361."handle_types"(65, 67, 66)
    push_eh $P361
  loop360_test:
    find_lex $P342, "$low"
    set $N343, $P342
    find_lex $P344, "$high"
    set $N345, $P344
    islt $I346, $N343, $N345
    unless $I346, loop360_done
  loop360_redo:
# .annotate "line", 182

			.local int high, low
			$P0 = find_lex '$high'
			high = $P0
			$P0 = find_lex '$low'
			low = $P0
			$I0 = high - low
			$I0 = $I0 / 2
			$I0 = $I0 + low
			$P347 = box $I0
		
    store_lex "$mid", $P347
# .annotate "line", 194
    find_lex $P349, "&comparator"
    find_lex $P350, "$mid"
    set $I351, $P350
    find_lex $P352, "self"
    unless_null $P352, vivify_75
    new $P352, "ResizablePMCArray"
  vivify_75:
    set $P353, $P352[$I351]
    unless_null $P353, vivify_76
    new $P353, "Undef"
  vivify_76:
    find_lex $P354, "$value"
    $N355 = $P349($P353, $P354)
    islt $I356, $N355, 0.0
    if $I356, if_348
# .annotate "line", 198
    find_lex $P359, "$mid"
    store_lex "$high", $P359
# .annotate "line", 197
    goto if_348_end
  if_348:
# .annotate "line", 195
    find_lex $P357, "$mid"
    add $P358, $P357, 1
    store_lex "$low", $P358
  if_348_end:
  loop360_next:
# .annotate "line", 179
    goto loop360_test
  loop360_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P362, exception, 'type'
    eq $P362, 65, loop360_next
    eq $P362, 67, loop360_redo
  loop360_done:
    pop_eh 
# .annotate "line", 202
    find_lex $P363, "$low"
    add $P364, $P363, 1
    neg $P365, $P364
    store_lex "$result", $P365
# .annotate "line", 204
    find_lex $P369, "$low"
    set $N370, $P369
    find_lex $P371, "$top"
    set $N372, $P371
    islt $I373, $N370, $N372
    if $I373, if_368
    new $P367, 'Integer'
    set $P367, $I373
    goto if_368_end
  if_368:
# .annotate "line", 205
    find_lex $P374, "&comparator"
    find_lex $P375, "$low"
    set $I376, $P375
    find_lex $P377, "self"
    unless_null $P377, vivify_77
    new $P377, "ResizablePMCArray"
  vivify_77:
    set $P378, $P377[$I376]
    unless_null $P378, vivify_78
    new $P378, "Undef"
  vivify_78:
    find_lex $P379, "$value"
    $N380 = $P374($P378, $P379)
    iseq $I381, $N380, 0.0
    new $P367, 'Integer'
    set $P367, $I381
  if_368_end:
    unless $P367, if_366_end
# .annotate "line", 206
    find_lex $P382, "$low"
    store_lex "$result", $P382
  if_366_end:
# .annotate "line", 204
    find_lex $P383, "$result"
# .annotate "line", 156
    .return ($P383)
  control_272:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P384, exception, "payload"
    .return ($P384)
.end


.namespace ["Array"]
.sub "concat"  :subid("31_1266670835.0715") :method :outer("11_1266670835.0715")
    .param pmc param_393 :slurpy
# .annotate "line", 233
    .const 'Sub' $P408 = "32_1266670835.0715" 
    capture_lex $P408
    new $P392, 'ExceptionHandler'
    set_addr $P392, control_391
    $P392."handle_types"(58)
    push_eh $P392
    .lex "self", self
    .lex "@sources", param_393
# .annotate "line", 234
    new $P394, "ResizablePMCArray"
    .lex "@result", $P394
    find_lex $P397, "self"
    $P398 = $P397."isa"("P6protoobject")
    if $P398, if_396
    find_lex $P401, "self"
    $P402 = $P401."clone"()
    set $P395, $P402
    goto if_396_end
  if_396:
    find_lex $P399, "self"
    $P400 = $P399."new"()
    set $P395, $P400
  if_396_end:
    store_lex "@result", $P395
# .annotate "line", 236
    find_lex $P404, "@sources"
    defined $I405, $P404
    unless $I405, for_undef_79
    iter $P403, $P404
    new $P414, 'ExceptionHandler'
    set_addr $P414, loop413_handler
    $P414."handle_types"(65, 67, 66)
    push_eh $P414
  loop413_test:
    unless $P403, loop413_done
    shift $P406, $P403
  loop413_redo:
    .const 'Sub' $P408 = "32_1266670835.0715" 
    capture_lex $P408
    $P408($P406)
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
  for_undef_79:
    find_lex $P416, "@result"
# .annotate "line", 233
    .return ($P416)
  control_391:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P417, exception, "payload"
    .return ($P417)
.end


.namespace ["Array"]
.sub "_block407"  :anon :subid("32_1266670835.0715") :outer("31_1266670835.0715")
    .param pmc param_409
# .annotate "line", 236
    .lex "$_", param_409
# .annotate "line", 237
    find_lex $P410, "@result"
    find_lex $P411, "$_"
    $P412 = $P410."append"($P411)
# .annotate "line", 236
    .return ($P412)
.end


.namespace ["Array"]
.sub "contains"  :subid("33_1266670835.0715") :method :outer("11_1266670835.0715")
    .param pmc param_421
# .annotate "line", 243
    .const 'Sub' $P427 = "34_1266670835.0715" 
    capture_lex $P427
    new $P420, 'ExceptionHandler'
    set_addr $P420, control_419
    $P420."handle_types"(58)
    push_eh $P420
    .lex "self", self
    .lex "$item", param_421
# .annotate "line", 244
    find_lex $P423, "self"
    defined $I424, $P423
    unless $I424, for_undef_80
    iter $P422, $P423
    new $P437, 'ExceptionHandler'
    set_addr $P437, loop436_handler
    $P437."handle_types"(65, 67, 66)
    push_eh $P437
  loop436_test:
    unless $P422, loop436_done
    shift $P425, $P422
  loop436_redo:
    .const 'Sub' $P427 = "34_1266670835.0715" 
    capture_lex $P427
    $P427($P425)
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
  for_undef_80:
# .annotate "line", 243
    .return (0)
  control_419:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P439, exception, "payload"
    .return ($P439)
.end


.namespace ["Array"]
.sub "_block426"  :anon :subid("34_1266670835.0715") :outer("33_1266670835.0715")
    .param pmc param_428
# .annotate "line", 244
    .lex "$_", param_428
# .annotate "line", 245
    find_lex $P431, "$item"
    find_lex $P432, "$_"
    iseq $I433, $P431, $P432
    if $I433, if_430
    new $P429, 'Integer'
    set $P429, $I433
    goto if_430_end
  if_430:
# .annotate "line", 246
    new $P434, "Exception"
    set $P434['type'], 58
    new $P435, "Integer"
    assign $P435, 1
    setattribute $P434, 'payload', $P435
    throw $P434
  if_430_end:
# .annotate "line", 244
    .return ($P429)
.end


.namespace ["Array"]
.sub "delete"  :subid("35_1266670835.0715") :method :outer("11_1266670835.0715")
    .param pmc param_443
# .annotate "line", 253
    new $P442, 'ExceptionHandler'
    set_addr $P442, control_441
    $P442."handle_types"(58)
    push_eh $P442
    .lex "self", self
    .lex "$key", param_443
# .annotate "line", 254
    get_hll_global $P444, ["Opcode"], "delete"
    find_lex $P445, "self"
    find_lex $P446, "$key"
    $P447 = $P444($P445, $P446)
# .annotate "line", 253
    .return ($P447)
  control_441:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P448, exception, "payload"
    .return ($P448)
.end


.namespace ["Array"]
.sub "elements"  :subid("36_1266670835.0715") :method :outer("11_1266670835.0715")
    .param pmc param_452 :slurpy
# .annotate "line", 257
    new $P451, 'ExceptionHandler'
    set_addr $P451, control_450
    $P451."handle_types"(58)
    push_eh $P451
    .lex "self", self
    .lex "@value", param_452
# .annotate "line", 258
    find_lex $P453, "self"
    find_lex $P454, "@value"
    $P455 = "elements_"($P453, $P454)
# .annotate "line", 257
    .return ($P455)
  control_450:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P456, exception, "payload"
    .return ($P456)
.end


.namespace ["Array"]
.sub "elements_"  :subid("37_1266670835.0715") :method :outer("11_1266670835.0715")
    .param pmc param_460
# .annotate "line", 261
    new $P459, 'ExceptionHandler'
    set_addr $P459, control_458
    $P459."handle_types"(58)
    push_eh $P459
    .lex "self", self
    .lex "@value", param_460
# .annotate "line", 262
    find_lex $P462, "@value"
    set $N463, $P462
    unless $N463, if_461_end
# .annotate "line", 263
    get_hll_global $P464, ["Opcode"], "set_integer"
    find_lex $P465, "self"
    find_lex $P466, "@value"
    $P467 = $P466."shift"()
    $P464($P465, $P467)
  if_461_end:
# .annotate "line", 266
    get_hll_global $P468, ["Opcode"], "elements"
    find_lex $P469, "self"
    $P470 = $P468($P469)
# .annotate "line", 261
    .return ($P470)
  control_458:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P471, exception, "payload"
    .return ($P471)
.end


.namespace ["Array"]
.sub "is_sorted"  :subid("38_1266670835.0715") :method :outer("11_1266670835.0715")
    .param pmc param_476 :optional :named("compare")
    .param int has_param_476 :opt_flag
# .annotate "line", 273
    new $P475, 'ExceptionHandler'
    set_addr $P475, control_474
    $P475."handle_types"(58)
    push_eh $P475
    .lex "self", self
    if has_param_476, optparam_81
    new $P477, "Undef"
    set param_476, $P477
  optparam_81:
    .lex "&compare", param_476
# .annotate "line", 274
    new $P478, "Undef"
    .lex "$index", $P478
# .annotate "line", 275
    new $P479, "Undef"
    .lex "$limit", $P479
# .annotate "line", 274
    new $P480, "Integer"
    assign $P480, 0
    store_lex "$index", $P480
# .annotate "line", 275
    find_lex $P481, "self"
    $P482 = $P481."elements"()
    sub $P483, $P482, 1
    store_lex "$limit", $P483
# .annotate "line", 277
    new $P505, 'ExceptionHandler'
    set_addr $P505, loop504_handler
    $P505."handle_types"(65, 67, 66)
    push_eh $P505
  loop504_test:
    find_lex $P484, "$index"
    set $N485, $P484
    find_lex $P486, "$limit"
    set $N487, $P486
    islt $I488, $N485, $N487
    unless $I488, loop504_done
  loop504_redo:
# .annotate "line", 278
    find_lex $P490, "&compare"
    find_lex $P491, "$index"
    set $I492, $P491
    find_lex $P493, "self"
    unless_null $P493, vivify_82
    new $P493, "ResizablePMCArray"
  vivify_82:
    set $P494, $P493[$I492]
    unless_null $P494, vivify_83
    new $P494, "Undef"
  vivify_83:
    find_lex $P495, "$index"
    add $P496, $P495, 1
    set $I497, $P496
    find_lex $P498, "self"
    unless_null $P498, vivify_84
    new $P498, "ResizablePMCArray"
  vivify_84:
    set $P499, $P498[$I497]
    unless_null $P499, vivify_85
    new $P499, "Undef"
  vivify_85:
    $N500 = $P490($P494, $P499)
    isgt $I501, $N500, 0.0
    unless $I501, if_489_end
# .annotate "line", 279
    new $P502, "Exception"
    set $P502['type'], 58
    new $P503, "Integer"
    assign $P503, 0
    setattribute $P502, 'payload', $P503
    throw $P502
  if_489_end:
  loop504_next:
# .annotate "line", 277
    goto loop504_test
  loop504_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P506, exception, 'type'
    eq $P506, 65, loop504_next
    eq $P506, 67, loop504_redo
  loop504_done:
    pop_eh 
# .annotate "line", 283
    new $P507, "Exception"
    set $P507['type'], 58
    new $P508, "Integer"
    assign $P508, 1
    setattribute $P507, 'payload', $P508
    throw $P507
# .annotate "line", 273
    .return ()
  control_474:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P509, exception, "payload"
    .return ($P509)
.end


.namespace ["Array"]
.sub "join"  :subid("39_1266670835.0715") :method :outer("11_1266670835.0715")
    .param pmc param_513 :optional
    .param int has_param_513 :opt_flag
# .annotate "line", 286
    new $P512, 'ExceptionHandler'
    set_addr $P512, control_511
    $P512."handle_types"(58)
    push_eh $P512
    .lex "self", self
    if has_param_513, optparam_86
    new $P514, "Undef"
    set param_513, $P514
  optparam_86:
    .lex "$delim", param_513
# .annotate "line", 287
    find_lex $P516, "$delim"
    $P517 = $P516."defined"()
    if $P517, unless_515_end
# .annotate "line", 288
    new $P518, "String"
    assign $P518, ""
    store_lex "$delim", $P518
  unless_515_end:
# .annotate "line", 291
    find_lex $P519, "$delim"
    set $S520, $P519
    find_lex $P521, "self"
    join $S522, $S520, $P521
# .annotate "line", 286
    .return ($S522)
  control_511:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P523, exception, "payload"
    .return ($P523)
.end


.namespace ["Array"]
.sub "slice"  :subid("40_1266670835.0715") :method :outer("11_1266670835.0715")
    .param pmc param_529 :optional :named("from")
    .param int has_param_529 :opt_flag
    .param pmc param_531 :optional :named("to")
    .param int has_param_531 :opt_flag
# .annotate "line", 308
    new $P528, 'ExceptionHandler'
    set_addr $P528, control_527
    $P528."handle_types"(58)
    push_eh $P528
    .lex "self", self
    if has_param_529, optparam_87
    new $P530, "Undef"
    set param_529, $P530
  optparam_87:
    .lex "$from", param_529
    if has_param_531, optparam_88
    new $P532, "Undef"
    set param_531, $P532
  optparam_88:
    .lex "$to", param_531
# .annotate "line", 309
    new $P533, "Undef"
    .lex "$elements", $P533
# .annotate "line", 324
    get_global $P534, "@Empty"
    unless_null $P534, vivify_89
    new $P534, "ResizablePMCArray"
    set_global "@Empty", $P534
  vivify_89:
# .annotate "line", 325
    new $P535, "ResizablePMCArray"
    .lex "@slice", $P535
# .annotate "line", 309
    find_lex $P536, "self"
    $P537 = $P536."elements"()
    store_lex "$elements", $P537
# .annotate "line", 310
    find_lex $P539, "$from"
    $P540 = $P539."defined"()
    if $P540, unless_538_end
    new $P541, "Integer"
    assign $P541, 0
    store_lex "$from", $P541
  unless_538_end:
# .annotate "line", 311
    find_lex $P543, "$to"
    $P544 = $P543."defined"()
    if $P544, unless_542_end
    find_lex $P545, "$elements"
    store_lex "$to", $P545
  unless_542_end:
# .annotate "line", 313
    find_lex $P547, "$from"
    set $N548, $P547
    islt $I549, $N548, 0.0
    unless $I549, if_546_end
    find_lex $P550, "$from"
    find_lex $P551, "$elements"
    add $P552, $P550, $P551
    store_lex "$from", $P552
  if_546_end:
# .annotate "line", 314
    find_lex $P554, "$to"
    set $N555, $P554
    islt $I556, $N555, 0.0
    unless $I556, if_553_end
    find_lex $P557, "$to"
    find_lex $P558, "$elements"
    add $P559, $P557, $P558
    store_lex "$to", $P559
  if_553_end:
# .annotate "line", 316
    find_lex $P561, "$from"
    set $N562, $P561
    find_lex $P563, "$elements"
    set $N564, $P563
    isge $I565, $N562, $N564
    unless $I565, if_560_end
# .annotate "line", 317
    get_hll_global $P566, ["Program"], "die"
    find_lex $P567, "$from"
    find_lex $P568, "$elements"
    $P566("$from parameter out of range: ", $P567, " exceeds # elements: ", $P568)
  if_560_end:
# .annotate "line", 320
    find_lex $P570, "$to"
    set $N571, $P570
    find_lex $P572, "$elements"
    set $N573, $P572
    isge $I574, $N571, $N573
    unless $I574, if_569_end
# .annotate "line", 321
    get_hll_global $P575, ["Program"], "die"
    find_lex $P576, "$from"
    find_lex $P577, "$elements"
    $P575("$to parameter out of range: ", $P576, " exceeds # elements: ", $P577)
  if_569_end:
# .annotate "line", 320
    get_global $P578, "@Empty"
# .annotate "line", 325
    find_lex $P579, "self"
    $P580 = $P579."clone"()
    store_lex "@slice", $P580
# .annotate "line", 326
    find_lex $P581, "@slice"
    get_global $P582, "@Empty"
    find_lex $P583, "$from"
    $P581."splice"($P582, 0 :named("from"), $P583 :named("replacing"))
# .annotate "line", 328
    find_lex $P584, "$to"
    find_lex $P585, "$from"
    sub $P586, $P584, $P585
    store_lex "$to", $P586
    find_lex $P587, "$to"
    clone $P588, $P587
    inc $P587
# .annotate "line", 330
    find_lex $P589, "@slice"
    get_global $P590, "@Empty"
    find_lex $P591, "$to"
    find_lex $P592, "@slice"
    $P593 = $P592."elements"()
    find_lex $P594, "$to"
    sub $P595, $P593, $P594
    $P589."splice"($P590, $P591 :named("from"), $P595 :named("replacing"))
# .annotate "line", 331
    new $P596, "Exception"
    set $P596['type'], 58
    find_lex $P597, "@slice"
    setattribute $P596, 'payload', $P597
    throw $P596
# .annotate "line", 308
    .return ()
  control_527:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P598, exception, "payload"
    .return ($P598)
.end


.namespace ["Array"]
.sub "splice"  :subid("41_1266670835.0715") :method :outer("11_1266670835.0715")
    .param pmc param_602
    .param pmc param_603 :slurpy :named
# .annotate "line", 336
    new $P601, 'ExceptionHandler'
    set_addr $P601, control_600
    $P601."handle_types"(58)
    push_eh $P601
    .lex "self", self
    .lex "@value", param_602
    .lex "%opts", param_603
# .annotate "line", 337
    new $P604, "Undef"
    .lex "$from", $P604
# .annotate "line", 338
    new $P605, "Undef"
    .lex "$replacing", $P605
# .annotate "line", 337
    find_lex $P608, "%opts"
    $P609 = $P608."contains"("from")
    if $P609, if_607
    new $P612, "Integer"
    assign $P612, 0
    set $P606, $P612
    goto if_607_end
  if_607:
    find_lex $P610, "%opts"
    unless_null $P610, vivify_90
    new $P610, "Hash"
  vivify_90:
    set $P611, $P610["from"]
    unless_null $P611, vivify_91
    new $P611, "Undef"
  vivify_91:
    set $P606, $P611
  if_607_end:
    store_lex "$from", $P606
# .annotate "line", 338
    find_lex $P615, "%opts"
    $P616 = $P615."contains"("replacing")
    if $P616, if_614
    new $P619, "Integer"
    assign $P619, 0
    set $P613, $P619
    goto if_614_end
  if_614:
    find_lex $P617, "%opts"
    unless_null $P617, vivify_92
    new $P617, "Hash"
  vivify_92:
    set $P618, $P617["replacing"]
    unless_null $P618, vivify_93
    new $P618, "Undef"
  vivify_93:
    set $P613, $P618
  if_614_end:
    store_lex "$replacing", $P613
# .annotate "line", 340
    find_lex $P620, "self"
    find_lex $P621, "@value"
    find_lex $P622, "$from"
    set $I623, $P622
    find_lex $P624, "$replacing"
    set $I625, $P624
    splice $P620, $P621, $I623, $I625
    find_lex $P626, "self"
# .annotate "line", 336
    .return ($P626)
  control_600:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P627, exception, "payload"
    .return ($P627)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1266670857.33184")
# .annotate "line", 0
    get_hll_global $P14, ["Kakapo";"Pmc";"COMMON"], "_block13" 
    capture_lex $P14
# .annotate "line", 47
    get_hll_global $P14, ["Kakapo";"Pmc";"COMMON"], "_block13" 
    capture_lex $P14
    $P253 = $P14()
# .annotate "line", 1
    .return ($P253)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block13"  :subid("11_1266670857.33184") :outer("10_1266670857.33184")
# .annotate "line", 47
    .const 'Sub' $P245 = "24_1266670857.33184" 
    capture_lex $P245
    .const 'Sub' $P235 = "23_1266670857.33184" 
    capture_lex $P235
    .const 'Sub' $P231 = "22_1266670857.33184" 
    capture_lex $P231
    .const 'Sub' $P224 = "21_1266670857.33184" 
    capture_lex $P224
    .const 'Sub' $P215 = "20_1266670857.33184" 
    capture_lex $P215
    .const 'Sub' $P148 = "18_1266670857.33184" 
    capture_lex $P148
    .const 'Sub' $P125 = "17_1266670857.33184" 
    capture_lex $P125
    .const 'Sub' $P15 = "12_1266670857.33184" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1266670857.33184" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 132
    .const 'Sub' $P125 = "17_1266670857.33184" 
    capture_lex $P125
    .lex "create_new_method", $P125
# .annotate "line", 173
    .const 'Sub' $P148 = "18_1266670857.33184" 
    capture_lex $P148
    .lex "install_methods", $P148
# .annotate "line", 47
    find_lex $P214, "_pre_initload"
# .annotate "line", 128
    find_lex $P230, "create_new_method"
# .annotate "line", 171
    find_lex $P244, "install_methods"
# .annotate "line", 211
    .const 'Sub' $P245 = "24_1266670857.33184" 
    capture_lex $P245
# .annotate "line", 47
    .return ($P245)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_pre_initload"  :subid("12_1266670857.33184") :outer("11_1266670857.33184")
# .annotate "line", 47
    .const 'Sub' $P97 = "15_1266670857.33184" 
    capture_lex $P97
    .const 'Sub' $P74 = "14_1266670857.33184" 
    capture_lex $P74
    .const 'Sub' $P51 = "13_1266670857.33184" 
    capture_lex $P51
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 49
    new $P18, "Hash"
    .lex "%methods_for", $P18
# .annotate "line", 62
    new $P19, "Undef"
    .lex "$from_nsp", $P19
# .annotate "line", 65
    new $P20, "ResizablePMCArray"
    .lex "@first_pmcs", $P20
# .annotate "line", 47
    find_lex $P21, "%methods_for"
# .annotate "line", 50
    new $P22, "ResizablePMCArray"
    push $P22, "can"
    push $P22, "clone"
    push $P22, "defined"
    push $P22, "does"
    push $P22, "isa"
    push $P22, "new"
    find_lex $P23, "%methods_for"
    unless_null $P23, vivify_25
    new $P23, "Hash"
    store_lex "%methods_for", $P23
  vivify_25:
    set $P23["Exception"], $P22
# .annotate "line", 51
    new $P24, "ResizablePMCArray"
    push $P24, "can"
    push $P24, "clone"
    push $P24, "defined"
    push $P24, "does"
    push $P24, "isa"
    find_lex $P25, "%methods_for"
    unless_null $P25, vivify_26
    new $P25, "Hash"
    store_lex "%methods_for", $P25
  vivify_26:
    set $P25["Float"], $P24
# .annotate "line", 52
    new $P26, "ResizablePMCArray"
    push $P26, "can"
    push $P26, "clone"
    push $P26, "defined"
    push $P26, "does"
    push $P26, "isa"
    find_lex $P27, "%methods_for"
    unless_null $P27, vivify_27
    new $P27, "Hash"
    store_lex "%methods_for", $P27
  vivify_27:
    set $P27["Hash"], $P26
# .annotate "line", 53
    new $P28, "ResizablePMCArray"
    push $P28, "can"
    push $P28, "clone"
    push $P28, "defined"
    push $P28, "does"
    push $P28, "isa"
    find_lex $P29, "%methods_for"
    unless_null $P29, vivify_28
    new $P29, "Hash"
    store_lex "%methods_for", $P29
  vivify_28:
    set $P29["Integer"], $P28
# .annotate "line", 54
    new $P30, "ResizablePMCArray"
    push $P30, "can"
    push $P30, "clone"
    push $P30, "defined"
    push $P30, "does"
    push $P30, "isa"
    find_lex $P31, "%methods_for"
    unless_null $P31, vivify_29
    new $P31, "Hash"
    store_lex "%methods_for", $P31
  vivify_29:
    set $P31["Key"], $P30
# .annotate "line", 55
    new $P32, "ResizablePMCArray"
    push $P32, "can"
    push $P32, "clone"
    push $P32, "defined"
    push $P32, "does"
    push $P32, "isa"
    find_lex $P33, "%methods_for"
    unless_null $P33, vivify_30
    new $P33, "Hash"
    store_lex "%methods_for", $P33
  vivify_30:
    set $P33["NameSpace"], $P32
# .annotate "line", 56
    new $P34, "ResizablePMCArray"
    push $P34, "can"
    push $P34, "clone"
    push $P34, "defined"
    push $P34, "does"
    push $P34, "isa"
    push $P34, "new"
    find_lex $P35, "%methods_for"
    unless_null $P35, vivify_31
    new $P35, "Hash"
    store_lex "%methods_for", $P35
  vivify_31:
    set $P35["ResizablePMCArray"], $P34
# .annotate "line", 57
    new $P36, "ResizablePMCArray"
    push $P36, "can"
    push $P36, "clone"
    push $P36, "defined"
    push $P36, "does"
    push $P36, "isa"
    push $P36, "new"
    find_lex $P37, "%methods_for"
    unless_null $P37, vivify_32
    new $P37, "Hash"
    store_lex "%methods_for", $P37
  vivify_32:
    set $P37["ResizableStringArray"], $P36
# .annotate "line", 58
    new $P38, "ResizablePMCArray"
    push $P38, "can"
    push $P38, "clone"
    push $P38, "defined"
    push $P38, "does"
    find_lex $P39, "%methods_for"
    unless_null $P39, vivify_33
    new $P39, "Hash"
    store_lex "%methods_for", $P39
  vivify_33:
    set $P39["String"], $P38
# .annotate "line", 59
    new $P40, "ResizablePMCArray"
    push $P40, "can"
    push $P40, "clone"
    push $P40, "defined"
    push $P40, "does"
    push $P40, "isa"
    find_lex $P41, "%methods_for"
    unless_null $P41, vivify_34
    new $P41, "Hash"
    store_lex "%methods_for", $P41
  vivify_34:
    set $P41["Sub"], $P40
# .annotate "line", 60
    new $P42, "ResizablePMCArray"
    push $P42, "can"
    push $P42, "clone"
    push $P42, "does"
    push $P42, "isa"
    push $P42, "new"
    find_lex $P43, "%methods_for"
    unless_null $P43, vivify_35
    new $P43, "Hash"
    store_lex "%methods_for", $P43
  vivify_35:
    set $P43["Undef"], $P42
# .annotate "line", 62
    get_namespace $P44
    store_lex "$from_nsp", $P44
# .annotate "line", 65
    new $P45, "ResizablePMCArray"
    push $P45, "Undef"
    push $P45, "String"
    push $P45, "Hash"
    push $P45, "ResizablePMCArray"
    push $P45, "ResizableStringArray"
    store_lex "@first_pmcs", $P45
# .annotate "line", 74
    find_lex $P47, "@first_pmcs"
    defined $I48, $P47
    unless $I48, for_undef_36
    iter $P46, $P47
    new $P67, 'ExceptionHandler'
    set_addr $P67, loop66_handler
    $P67."handle_types"(65, 67, 66)
    push_eh $P67
  loop66_test:
    unless $P46, loop66_done
    shift $P49, $P46
  loop66_redo:
    .const 'Sub' $P51 = "13_1266670857.33184" 
    capture_lex $P51
    $P51($P49)
  loop66_next:
    goto loop66_test
  loop66_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P68, exception, 'type'
    eq $P68, 65, loop66_next
    eq $P68, 67, loop66_redo
  loop66_done:
    pop_eh 
  for_undef_36:
# .annotate "line", 81
    find_lex $P70, "@first_pmcs"
    defined $I71, $P70
    unless $I71, for_undef_39
    iter $P69, $P70
    new $P90, 'ExceptionHandler'
    set_addr $P90, loop89_handler
    $P90."handle_types"(65, 67, 66)
    push_eh $P90
  loop89_test:
    unless $P69, loop89_done
    shift $P72, $P69
  loop89_redo:
    .const 'Sub' $P74 = "14_1266670857.33184" 
    capture_lex $P74
    $P74($P72)
  loop89_next:
    goto loop89_test
  loop89_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P91, exception, 'type'
    eq $P91, 65, loop89_next
    eq $P91, 67, loop89_redo
  loop89_done:
    pop_eh 
  for_undef_39:
# .annotate "line", 88
    find_lex $P93, "%methods_for"
    defined $I94, $P93
    unless $I94, for_undef_43
    iter $P92, $P93
    new $P122, 'ExceptionHandler'
    set_addr $P122, loop121_handler
    $P122."handle_types"(65, 67, 66)
    push_eh $P122
  loop121_test:
    unless $P92, loop121_done
    shift $P95, $P92
  loop121_redo:
    .const 'Sub' $P97 = "15_1266670857.33184" 
    capture_lex $P97
    $P97($P95)
  loop121_next:
    goto loop121_test
  loop121_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P123, exception, 'type'
    eq $P123, 65, loop121_next
    eq $P123, 67, loop121_redo
  loop121_done:
    pop_eh 
  for_undef_43:
# .annotate "line", 47
    .return ($P92)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P124, exception, "payload"
    .return ($P124)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block50"  :anon :subid("13_1266670857.33184") :outer("12_1266670857.33184")
    .param pmc param_53
# .annotate "line", 76
    new $P52, "Undef"
    .lex "$namespace", $P52
    .lex "$_", param_53
# .annotate "line", 75
    get_hll_global $P54, "P6metaclass"
    find_lex $P55, "$_"
    set $S56, $P55
    $P54."register"($S56)
# .annotate "line", 76
    get_hll_global $P57, ["Parrot"], "get_hll_namespace"
    find_lex $P58, "$_"
    set $S59, $P58
    $P60 = $P57($S59)
    store_lex "$namespace", $P60
# .annotate "line", 77
    find_lex $P61, "$namespace"
    find_lex $P62, "$_"
    find_lex $P63, "%methods_for"
    unless_null $P63, vivify_37
    new $P63, "Hash"
  vivify_37:
    set $P64, $P63[$P62]
    unless_null $P64, vivify_38
    new $P64, "Undef"
  vivify_38:
    $P65 = "install_methods"($P61, $P64, 1 :named("skip_new"))
# .annotate "line", 74
    .return ($P65)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block73"  :anon :subid("14_1266670857.33184") :outer("12_1266670857.33184")
    .param pmc param_77
# .annotate "line", 82
    new $P75, "Undef"
    .lex "$namespace", $P75
# .annotate "line", 84
    new $P76, "Undef"
    .lex "$undef", $P76
    .lex "$_", param_77
# .annotate "line", 82
    get_hll_global $P78, ["Parrot"], "get_hll_namespace"
    find_lex $P79, "$_"
    set $S80, $P79
    $P81 = $P78($S80)
    store_lex "$namespace", $P81
# .annotate "line", 83
    find_lex $P82, "$namespace"
    find_lex $P83, "$_"
    find_lex $P84, "%methods_for"
    unless_null $P84, vivify_40
    new $P84, "Hash"
  vivify_40:
    set $P85, $P84[$P83]
    unless_null $P85, vivify_41
    new $P85, "Undef"
  vivify_41:
    "install_methods"($P82, $P85)
# .annotate "line", 84
    find_lex $P86, "$undef"
    find_lex $P87, "$_"
    find_lex $P88, "%methods_for"
    unless_null $P88, vivify_42
    new $P88, "Hash"
    store_lex "%methods_for", $P88
  vivify_42:
    set $P88[$P87], $P86
# .annotate "line", 81
    .return ($P86)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block96"  :anon :subid("15_1266670857.33184") :outer("12_1266670857.33184")
    .param pmc param_98
# .annotate "line", 88
    .const 'Sub' $P106 = "16_1266670857.33184" 
    capture_lex $P106
    .lex "$_", param_98
# .annotate "line", 89
    find_lex $P101, "$_"
    set $S102, $P101
    find_lex $P103, "%methods_for"
    unless_null $P103, vivify_44
    new $P103, "Hash"
  vivify_44:
    set $P104, $P103[$S102]
    unless_null $P104, vivify_45
    new $P104, "Undef"
  vivify_45:
    if $P104, if_100
    set $P99, $P104
    goto if_100_end
  if_100:
    .const 'Sub' $P106 = "16_1266670857.33184" 
    capture_lex $P106
    $P120 = $P106()
    set $P99, $P120
  if_100_end:
# .annotate "line", 88
    .return ($P99)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block105"  :anon :subid("16_1266670857.33184") :outer("15_1266670857.33184")
# .annotate "line", 91
    new $P107, "Undef"
    .lex "$namespace", $P107
# .annotate "line", 90
    get_hll_global $P108, "P6metaclass"
    find_lex $P109, "$_"
    set $S110, $P109
    $P108."register"($S110)
# .annotate "line", 91
    get_hll_global $P111, ["Parrot"], "get_hll_namespace"
    find_lex $P112, "$_"
    set $S113, $P112
    $P114 = $P111($S113)
    store_lex "$namespace", $P114
# .annotate "line", 92
    find_lex $P115, "$namespace"
    find_lex $P116, "$_"
    find_lex $P117, "%methods_for"
    unless_null $P117, vivify_46
    new $P117, "Hash"
  vivify_46:
    set $P118, $P117[$P116]
    unless_null $P118, vivify_47
    new $P118, "Undef"
  vivify_47:
    $P119 = "install_methods"($P115, $P118)
# .annotate "line", 89
    .return ($P119)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "create_new_method"  :subid("17_1266670857.33184") :outer("11_1266670857.33184")
    .param pmc param_128
# .annotate "line", 132
    new $P127, 'ExceptionHandler'
    set_addr $P127, control_126
    $P127."handle_types"(58)
    push_eh $P127
    .lex "$namespace", param_128
# .annotate "line", 133
    new $P129, "Undef"
    .lex "$type", $P129
# .annotate "line", 134
    new $P130, "Undef"
    .lex "&new", $P130
# .annotate "line", 133
    find_lex $P131, "$namespace"
    set $S132, $P131
    new $P133, 'String'
    set $P133, $S132
    store_lex "$type", $P133
# .annotate "line", 134
    get_hll_global $P134, ["Pir"], "compile_sub"
    find_lex $P135, "$namespace"
# .annotate "line", 139
    new $P136, "String"
    assign $P136, "\t"
    concat $P137, $P136, "$P0 = "
    new $P138, 'String'
    set $P138, "new [ '"
    find_lex $P139, "$type"
    concat $P140, $P138, $P139
    concat $P141, $P140, "' ]"
    concat $P142, $P137, $P141
# .annotate "line", 140
    new $P143, "String"
    assign $P143, "\t"
    concat $P144, $P143, ".return ($P0)"
    new $P145, "ResizablePMCArray"
    push $P145, $P142
    push $P145, $P144
    $P146 = $P134("new" :named("name"), $P135 :named("namespace"), 1 :named("method"), $P145 :named("body"))
# .annotate "line", 134
    store_lex "&new", $P146
# .annotate "line", 132
    .return ($P146)
  control_126:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P147, exception, "payload"
    .return ($P147)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "install_methods"  :subid("18_1266670857.33184") :outer("11_1266670857.33184")
    .param pmc param_151
    .param pmc param_152
    .param pmc param_153 :optional :named("skip_new")
    .param int has_param_153 :opt_flag
# .annotate "line", 173
    .const 'Sub' $P168 = "19_1266670857.33184" 
    capture_lex $P168
    new $P150, 'ExceptionHandler'
    set_addr $P150, control_149
    $P150."handle_types"(58)
    push_eh $P150
    .lex "$namespace", param_151
    .lex "@methods", param_152
    if has_param_153, optparam_48
    new $P154, "Undef"
    set param_153, $P154
  optparam_48:
    .lex "$skip_new", param_153
# .annotate "line", 174
    new $P155, "Undef"
    .lex "$from_nsp", $P155
# .annotate "line", 176
    new $P156, "Hash"
    .lex "%export_subs", $P156
# .annotate "line", 177
    new $P157, "Undef"
    .lex "$pmc_name", $P157
# .annotate "line", 174
    get_namespace $P158
    store_lex "$from_nsp", $P158
    find_lex $P159, "%export_subs"
# .annotate "line", 177
    find_lex $P160, "$namespace"
    set $S161, $P160
    new $P162, 'String'
    set $P162, $S161
    store_lex "$pmc_name", $P162
# .annotate "line", 179
    find_lex $P164, "@methods"
    defined $I165, $P164
    unless $I165, for_undef_49
    iter $P163, $P164
    new $P204, 'ExceptionHandler'
    set_addr $P204, loop203_handler
    $P204."handle_types"(65, 67, 66)
    push_eh $P204
  loop203_test:
    unless $P163, loop203_done
    shift $P166, $P163
  loop203_redo:
    .const 'Sub' $P168 = "19_1266670857.33184" 
    capture_lex $P168
    $P168($P166)
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
  for_undef_49:
# .annotate "line", 195
    find_lex $P208, "%export_subs"
    if $P208, if_207
    set $P206, $P208
    goto if_207_end
  if_207:
# .annotate "line", 196
    find_lex $P209, "$from_nsp"
    find_lex $P210, "$namespace"
    find_lex $P211, "%export_subs"
    $P212 = $P209."export_to"($P210, $P211)
# .annotate "line", 195
    set $P206, $P212
  if_207_end:
# .annotate "line", 173
    .return ($P206)
  control_149:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P213, exception, "payload"
    .return ($P213)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block167"  :anon :subid("19_1266670857.33184") :outer("18_1266670857.33184")
    .param pmc param_169
# .annotate "line", 179
    .lex "$_", param_169
# .annotate "line", 180
    find_lex $P172, "$_"
    set $S173, $P172
    find_lex $P174, "$namespace"
    unless_null $P174, vivify_50
    new $P174, "Hash"
  vivify_50:
    set $P175, $P174[$S173]
    unless_null $P175, vivify_51
    new $P175, "Undef"
  vivify_51:
    unless $P175, unless_171
    set $P170, $P175
    goto unless_171_end
  unless_171:
# .annotate "line", 181
    find_lex $P178, "$_"
    set $S179, $P178
    find_lex $P180, "$from_nsp"
    unless_null $P180, vivify_52
    new $P180, "Hash"
  vivify_52:
    set $P181, $P180[$S179]
    unless_null $P181, vivify_53
    new $P181, "Undef"
  vivify_53:
    if $P181, if_177
# .annotate "line", 184
    find_lex $P190, "$_"
    set $S191, $P190
    iseq $I192, $S191, "new"
    if $I192, if_189
# .annotate "line", 190
    new $P199, 'String'
    set $P199, "Request to export unknown COMMON method '"
    find_lex $P200, "$_"
    concat $P201, $P199, $P200
    concat $P202, $P201, "'"
    die $P202
# .annotate "line", 189
    goto if_189_end
  if_189:
# .annotate "line", 185
    find_lex $P195, "$skip_new"
    unless $P195, unless_194
    set $P193, $P195
    goto unless_194_end
  unless_194:
# .annotate "line", 186
    find_lex $P196, "$_"
    set $S197, $P196
    $P198 = "create_new_method"($S197)
# .annotate "line", 185
    set $P193, $P198
  unless_194_end:
# .annotate "line", 184
    set $P188, $P193
  if_189_end:
    set $P176, $P188
# .annotate "line", 181
    goto if_177_end
  if_177:
# .annotate "line", 182
    find_lex $P182, "$_"
    set $S183, $P182
    find_lex $P184, "$from_nsp"
    unless_null $P184, vivify_54
    new $P184, "Hash"
  vivify_54:
    set $P185, $P184[$S183]
    unless_null $P185, vivify_55
    new $P185, "Undef"
  vivify_55:
    find_lex $P186, "$_"
    find_lex $P187, "%export_subs"
    unless_null $P187, vivify_56
    new $P187, "Hash"
    store_lex "%export_subs", $P187
  vivify_56:
    set $P187[$P186], $P185
# .annotate "line", 181
    set $P176, $P185
  if_177_end:
# .annotate "line", 180
    set $P170, $P176
  unless_171_end:
# .annotate "line", 179
    .return ($P170)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "can"  :subid("20_1266670857.33184") :method :outer("11_1266670857.33184")
    .param pmc param_218
# .annotate "line", 108
    new $P217, 'ExceptionHandler'
    set_addr $P217, control_216
    $P217."handle_types"(58)
    push_eh $P217
    .lex "self", self
    .lex "$method", param_218
# .annotate "line", 109
    find_lex $P219, "self"
    find_lex $P220, "$method"
    set $S221, $P220
    can $I222, $P219, $S221
# .annotate "line", 108
    .return ($I222)
  control_216:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P223, exception, "payload"
    .return ($P223)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "clone"  :subid("21_1266670857.33184") :method :outer("11_1266670857.33184")
# .annotate "line", 128
    new $P226, 'ExceptionHandler'
    set_addr $P226, control_225
    $P226."handle_types"(58)
    push_eh $P226
    .lex "self", self
# .annotate "line", 129
    find_lex $P227, "self"
    clone $P228, $P227
# .annotate "line", 128
    .return ($P228)
  control_225:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P229, exception, "payload"
    .return ($P229)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "defined"  :subid("22_1266670857.33184") :method :outer("11_1266670857.33184")
# .annotate "line", 156
    new $P233, 'ExceptionHandler'
    set_addr $P233, control_232
    $P233."handle_types"(58)
    push_eh $P233
    .lex "self", self
    .return (1)
  control_232:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P234, exception, "payload"
    .return ($P234)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "does"  :subid("23_1266670857.33184") :method :outer("11_1266670857.33184")
    .param pmc param_238
# .annotate "line", 171
    new $P237, 'ExceptionHandler'
    set_addr $P237, control_236
    $P237."handle_types"(58)
    push_eh $P237
    .lex "self", self
    .lex "$role", param_238
    find_lex $P239, "self"
    find_lex $P240, "$role"
    set $S241, $P240
    does $I242, $P239, $S241
    .return ($I242)
  control_236:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P243, exception, "payload"
    .return ($P243)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "isa"  :subid("24_1266670857.33184") :method :outer("11_1266670857.33184")
    .param pmc param_248
# .annotate "line", 211
    new $P247, 'ExceptionHandler'
    set_addr $P247, control_246
    $P247."handle_types"(58)
    push_eh $P247
    .lex "self", self
    .lex "$type", param_248
# .annotate "line", 212
    find_lex $P249, "self"
    find_lex $P250, "$type"
    isa $I251, $P249, $P250
# .annotate "line", 211
    .return ($I251)
  control_246:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P252, exception, "payload"
    .return ($P252)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1266670848.0917")
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
.sub "_block13"  :subid("11_1266670848.0917") :outer("10_1266670848.0917")
# .annotate "line", 7
    get_hll_global $P176, ["Exception";"Wrapper"], "_block175" 
    capture_lex $P176
    get_hll_global $P146, ["Exception";"Severity"], "_block145" 
    capture_lex $P146
    .const 'Sub' $P137 = "23_1266670848.0917" 
    capture_lex $P137
    .const 'Sub' $P132 = "22_1266670848.0917" 
    capture_lex $P132
    .const 'Sub' $P124 = "21_1266670848.0917" 
    capture_lex $P124
    .const 'Sub' $P119 = "20_1266670848.0917" 
    capture_lex $P119
    .const 'Sub' $P111 = "19_1266670848.0917" 
    capture_lex $P111
    .const 'Sub' $P103 = "18_1266670848.0917" 
    capture_lex $P103
    .const 'Sub' $P95 = "17_1266670848.0917" 
    capture_lex $P95
    .const 'Sub' $P87 = "16_1266670848.0917" 
    capture_lex $P87
    .const 'Sub' $P40 = "14_1266670848.0917" 
    capture_lex $P40
    .const 'Sub' $P20 = "13_1266670848.0917" 
    capture_lex $P20
    .const 'Sub' $P15 = "12_1266670848.0917" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1266670848.0917" 
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
.sub "" :load :init :subid("post45") :outer("11_1266670848.0917")
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
.sub "_pre_initload"  :subid("12_1266670848.0917") :outer("11_1266670848.0917")
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
.sub "_attr"  :subid("13_1266670848.0917") :method :outer("11_1266670848.0917")
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
.sub "backtrace_string"  :subid("14_1266670848.0917") :method :outer("11_1266670848.0917")
# .annotate "line", 23
    .const 'Sub' $P56 = "15_1266670848.0917" 
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
    get_hll_global $P46, ["Array"], "empty"
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
    .const 'Sub' $P56 = "15_1266670848.0917" 
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
.sub "_block55"  :anon :subid("15_1266670848.0917") :outer("14_1266670848.0917")
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
.sub "exit_code"  :subid("16_1266670848.0917") :method :outer("11_1266670848.0917")
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
.sub "handled"  :subid("17_1266670848.0917") :method :outer("11_1266670848.0917")
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
.sub "message"  :subid("18_1266670848.0917") :method :outer("11_1266670848.0917")
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
.sub "payload"  :subid("19_1266670848.0917") :method :outer("11_1266670848.0917")
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
.sub "rethrow"  :subid("20_1266670848.0917") :method :outer("11_1266670848.0917")
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
.sub "severity"  :subid("21_1266670848.0917") :method :outer("11_1266670848.0917")
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
.sub "throw"  :subid("22_1266670848.0917") :method :outer("11_1266670848.0917")
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
.sub "type"  :subid("23_1266670848.0917") :method :outer("11_1266670848.0917")
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
.sub "_block145"  :subid("24_1266670848.0917") :outer("11_1266670848.0917")
# .annotate "line", 51
    .const 'Sub' $P171 = "31_1266670848.0917" 
    capture_lex $P171
    .const 'Sub' $P167 = "30_1266670848.0917" 
    capture_lex $P167
    .const 'Sub' $P163 = "29_1266670848.0917" 
    capture_lex $P163
    .const 'Sub' $P159 = "28_1266670848.0917" 
    capture_lex $P159
    .const 'Sub' $P155 = "27_1266670848.0917" 
    capture_lex $P155
    .const 'Sub' $P151 = "26_1266670848.0917" 
    capture_lex $P151
    .const 'Sub' $P147 = "25_1266670848.0917" 
    capture_lex $P147
# .annotate "line", 58
    .const 'Sub' $P171 = "31_1266670848.0917" 
    capture_lex $P171
# .annotate "line", 51
    .return ($P171)
.end


.namespace ["Exception";"Severity"]
.sub "NORMAL"  :subid("25_1266670848.0917") :method :outer("24_1266670848.0917")
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
.sub "WARNING"  :subid("26_1266670848.0917") :method :outer("24_1266670848.0917")
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
.sub "ERROR"  :subid("27_1266670848.0917") :method :outer("24_1266670848.0917")
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
.sub "SEVERE"  :subid("28_1266670848.0917") :method :outer("24_1266670848.0917")
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
.sub "FATAL"  :subid("29_1266670848.0917") :method :outer("24_1266670848.0917")
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
.sub "DOOMED"  :subid("30_1266670848.0917") :method :outer("24_1266670848.0917")
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
.sub "EXIT"  :subid("31_1266670848.0917") :method :outer("24_1266670848.0917")
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
.sub "_block175"  :subid("32_1266670848.0917") :outer("11_1266670848.0917")
# .annotate "line", 66
    .const 'Sub' $P314 = "44_1266670848.0917" 
    capture_lex $P314
    .const 'Sub' $P307 = "43_1266670848.0917" 
    capture_lex $P307
    .const 'Sub' $P301 = "42_1266670848.0917" 
    capture_lex $P301
    .const 'Sub' $P294 = "41_1266670848.0917" 
    capture_lex $P294
    .const 'Sub' $P247 = "39_1266670848.0917" 
    capture_lex $P247
    .const 'Sub' $P238 = "38_1266670848.0917" 
    capture_lex $P238
    .const 'Sub' $P229 = "37_1266670848.0917" 
    capture_lex $P229
    .const 'Sub' $P220 = "36_1266670848.0917" 
    capture_lex $P220
    .const 'Sub' $P211 = "35_1266670848.0917" 
    capture_lex $P211
    .const 'Sub' $P193 = "34_1266670848.0917" 
    capture_lex $P193
    .const 'Sub' $P177 = "33_1266670848.0917" 
    capture_lex $P177
# .annotate "line", 118
    .const 'Sub' $P314 = "44_1266670848.0917" 
    capture_lex $P314
# .annotate "line", 66
    .return ($P314)
.end


.namespace ["Exception";"Wrapper"]
.sub "" :load :init :subid("post49") :outer("32_1266670848.0917")
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
.sub "create_exception"  :subid("33_1266670848.0917") :method :outer("32_1266670848.0917")
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
.sub "exception"  :subid("34_1266670848.0917") :method :outer("32_1266670848.0917")
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
.sub "exit_code"  :subid("35_1266670848.0917") :method :outer("32_1266670848.0917")
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
.sub "handled"  :subid("36_1266670848.0917") :method :outer("32_1266670848.0917")
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
.sub "message"  :subid("37_1266670848.0917") :method :outer("32_1266670848.0917")
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
.sub "payload"  :subid("38_1266670848.0917") :method :outer("32_1266670848.0917")
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
.sub "new"  :subid("39_1266670848.0917") :method :outer("32_1266670848.0917")
    .param pmc param_250 :slurpy
    .param pmc param_251 :slurpy :named
# .annotate "line", 94
    .const 'Sub' $P266 = "40_1266670848.0917" 
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
    .const 'Sub' $P266 = "40_1266670848.0917" 
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
.sub "_block265"  :anon :subid("40_1266670848.0917") :outer("39_1266670848.0917")
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
.sub "rethrow"  :subid("41_1266670848.0917") :method :outer("32_1266670848.0917")
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
.sub "severity"  :subid("42_1266670848.0917") :method :outer("32_1266670848.0917")
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
.sub "throw"  :subid("43_1266670848.0917") :method :outer("32_1266670848.0917")
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
.sub "type"  :subid("44_1266670848.0917") :method :outer("32_1266670848.0917")
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
.sub "_block11"  :anon :subid("10_1266670813.93118")
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
.sub "" :load :init :subid("post149") :outer("10_1266670813.93118")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1266670813.93118" 
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
.sub "_block13"  :subid("11_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 9
    .const 'Sub' $P15 = "12_1266670813.93118" 
    capture_lex $P15
# .annotate "line", 10
    .const 'Sub' $P15 = "12_1266670813.93118" 
    capture_lex $P15
# .annotate "line", 9
    .return ($P15)
.end


.namespace ["Exception";"BadBufferSize"]
.sub "type"  :subid("12_1266670813.93118") :method :outer("11_1266670813.93118")
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
.sub "_block19"  :subid("13_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 13
    .const 'Sub' $P21 = "14_1266670813.93118" 
    capture_lex $P21
# .annotate "line", 14
    .const 'Sub' $P21 = "14_1266670813.93118" 
    capture_lex $P21
# .annotate "line", 13
    .return ($P21)
.end


.namespace ["Exception";"MissingEncodingName"]
.sub "type"  :subid("14_1266670813.93118") :method :outer("13_1266670813.93118")
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
.sub "_block25"  :subid("15_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 17
    .const 'Sub' $P27 = "16_1266670813.93118" 
    capture_lex $P27
# .annotate "line", 18
    .const 'Sub' $P27 = "16_1266670813.93118" 
    capture_lex $P27
# .annotate "line", 17
    .return ($P27)
.end


.namespace ["Exception";"InvalidStringRepresentation"]
.sub "type"  :subid("16_1266670813.93118") :method :outer("15_1266670813.93118")
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
.sub "_block31"  :subid("17_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 21
    .const 'Sub' $P33 = "18_1266670813.93118" 
    capture_lex $P33
# .annotate "line", 22
    .const 'Sub' $P33 = "18_1266670813.93118" 
    capture_lex $P33
# .annotate "line", 21
    .return ($P33)
.end


.namespace ["Exception";"IcuError"]
.sub "type"  :subid("18_1266670813.93118") :method :outer("17_1266670813.93118")
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
.sub "_block37"  :subid("19_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 25
    .const 'Sub' $P39 = "20_1266670813.93118" 
    capture_lex $P39
# .annotate "line", 26
    .const 'Sub' $P39 = "20_1266670813.93118" 
    capture_lex $P39
# .annotate "line", 25
    .return ($P39)
.end


.namespace ["Exception";"Unimplemented"]
.sub "type"  :subid("20_1266670813.93118") :method :outer("19_1266670813.93118")
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
.sub "_block43"  :subid("21_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 29
    .const 'Sub' $P45 = "22_1266670813.93118" 
    capture_lex $P45
# .annotate "line", 30
    .const 'Sub' $P45 = "22_1266670813.93118" 
    capture_lex $P45
# .annotate "line", 29
    .return ($P45)
.end


.namespace ["Exception";"NullRegAccess"]
.sub "type"  :subid("22_1266670813.93118") :method :outer("21_1266670813.93118")
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
.sub "_block49"  :subid("23_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 33
    .const 'Sub' $P51 = "24_1266670813.93118" 
    capture_lex $P51
# .annotate "line", 34
    .const 'Sub' $P51 = "24_1266670813.93118" 
    capture_lex $P51
# .annotate "line", 33
    .return ($P51)
.end


.namespace ["Exception";"NoRegFrames"]
.sub "type"  :subid("24_1266670813.93118") :method :outer("23_1266670813.93118")
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
.sub "_block55"  :subid("25_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 37
    .const 'Sub' $P57 = "26_1266670813.93118" 
    capture_lex $P57
# .annotate "line", 38
    .const 'Sub' $P57 = "26_1266670813.93118" 
    capture_lex $P57
# .annotate "line", 37
    .return ($P57)
.end


.namespace ["Exception";"SubstrOutOfString"]
.sub "type"  :subid("26_1266670813.93118") :method :outer("25_1266670813.93118")
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
.sub "_block61"  :subid("27_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 41
    .const 'Sub' $P63 = "28_1266670813.93118" 
    capture_lex $P63
# .annotate "line", 42
    .const 'Sub' $P63 = "28_1266670813.93118" 
    capture_lex $P63
# .annotate "line", 41
    .return ($P63)
.end


.namespace ["Exception";"OrdOutOfString"]
.sub "type"  :subid("28_1266670813.93118") :method :outer("27_1266670813.93118")
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
.sub "_block67"  :subid("29_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 45
    .const 'Sub' $P69 = "30_1266670813.93118" 
    capture_lex $P69
# .annotate "line", 46
    .const 'Sub' $P69 = "30_1266670813.93118" 
    capture_lex $P69
# .annotate "line", 45
    .return ($P69)
.end


.namespace ["Exception";"MalformedUtf8"]
.sub "type"  :subid("30_1266670813.93118") :method :outer("29_1266670813.93118")
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
.sub "_block73"  :subid("31_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 49
    .const 'Sub' $P75 = "32_1266670813.93118" 
    capture_lex $P75
# .annotate "line", 50
    .const 'Sub' $P75 = "32_1266670813.93118" 
    capture_lex $P75
# .annotate "line", 49
    .return ($P75)
.end


.namespace ["Exception";"MalformedUtf16"]
.sub "type"  :subid("32_1266670813.93118") :method :outer("31_1266670813.93118")
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
.sub "_block79"  :subid("33_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 53
    .const 'Sub' $P81 = "34_1266670813.93118" 
    capture_lex $P81
# .annotate "line", 54
    .const 'Sub' $P81 = "34_1266670813.93118" 
    capture_lex $P81
# .annotate "line", 53
    .return ($P81)
.end


.namespace ["Exception";"MalformedUtf32"]
.sub "type"  :subid("34_1266670813.93118") :method :outer("33_1266670813.93118")
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
.sub "_block85"  :subid("35_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 57
    .const 'Sub' $P87 = "36_1266670813.93118" 
    capture_lex $P87
# .annotate "line", 58
    .const 'Sub' $P87 = "36_1266670813.93118" 
    capture_lex $P87
# .annotate "line", 57
    .return ($P87)
.end


.namespace ["Exception";"InvalidCharacter"]
.sub "type"  :subid("36_1266670813.93118") :method :outer("35_1266670813.93118")
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
.sub "_block91"  :subid("37_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 61
    .const 'Sub' $P93 = "38_1266670813.93118" 
    capture_lex $P93
# .annotate "line", 62
    .const 'Sub' $P93 = "38_1266670813.93118" 
    capture_lex $P93
# .annotate "line", 61
    .return ($P93)
.end


.namespace ["Exception";"InvalidChartype"]
.sub "type"  :subid("38_1266670813.93118") :method :outer("37_1266670813.93118")
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
.sub "_block97"  :subid("39_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 65
    .const 'Sub' $P99 = "40_1266670813.93118" 
    capture_lex $P99
# .annotate "line", 66
    .const 'Sub' $P99 = "40_1266670813.93118" 
    capture_lex $P99
# .annotate "line", 65
    .return ($P99)
.end


.namespace ["Exception";"InvalidEncoding"]
.sub "type"  :subid("40_1266670813.93118") :method :outer("39_1266670813.93118")
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
.sub "_block103"  :subid("41_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 69
    .const 'Sub' $P105 = "42_1266670813.93118" 
    capture_lex $P105
# .annotate "line", 70
    .const 'Sub' $P105 = "42_1266670813.93118" 
    capture_lex $P105
# .annotate "line", 69
    .return ($P105)
.end


.namespace ["Exception";"InvalidCharclass"]
.sub "type"  :subid("42_1266670813.93118") :method :outer("41_1266670813.93118")
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
.sub "_block109"  :subid("43_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 73
    .const 'Sub' $P111 = "44_1266670813.93118" 
    capture_lex $P111
# .annotate "line", 74
    .const 'Sub' $P111 = "44_1266670813.93118" 
    capture_lex $P111
# .annotate "line", 73
    .return ($P111)
.end


.namespace ["Exception";"NegRepeat"]
.sub "type"  :subid("44_1266670813.93118") :method :outer("43_1266670813.93118")
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
.sub "_block115"  :subid("45_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 77
    .const 'Sub' $P117 = "46_1266670813.93118" 
    capture_lex $P117
# .annotate "line", 78
    .const 'Sub' $P117 = "46_1266670813.93118" 
    capture_lex $P117
# .annotate "line", 77
    .return ($P117)
.end


.namespace ["Exception";"NegSubstr"]
.sub "type"  :subid("46_1266670813.93118") :method :outer("45_1266670813.93118")
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
.sub "_block121"  :subid("47_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 81
    .const 'Sub' $P123 = "48_1266670813.93118" 
    capture_lex $P123
# .annotate "line", 82
    .const 'Sub' $P123 = "48_1266670813.93118" 
    capture_lex $P123
# .annotate "line", 81
    .return ($P123)
.end


.namespace ["Exception";"NegSleep"]
.sub "type"  :subid("48_1266670813.93118") :method :outer("47_1266670813.93118")
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
.sub "_block127"  :subid("49_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 85
    .const 'Sub' $P129 = "50_1266670813.93118" 
    capture_lex $P129
# .annotate "line", 86
    .const 'Sub' $P129 = "50_1266670813.93118" 
    capture_lex $P129
# .annotate "line", 85
    .return ($P129)
.end


.namespace ["Exception";"NegChop"]
.sub "type"  :subid("50_1266670813.93118") :method :outer("49_1266670813.93118")
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
.sub "_block133"  :subid("51_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 89
    .const 'Sub' $P135 = "52_1266670813.93118" 
    capture_lex $P135
# .annotate "line", 90
    .const 'Sub' $P135 = "52_1266670813.93118" 
    capture_lex $P135
# .annotate "line", 89
    .return ($P135)
.end


.namespace ["Exception";"InvalidOperation"]
.sub "type"  :subid("52_1266670813.93118") :method :outer("51_1266670813.93118")
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
.sub "_block139"  :subid("53_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 93
    .const 'Sub' $P141 = "54_1266670813.93118" 
    capture_lex $P141
# .annotate "line", 94
    .const 'Sub' $P141 = "54_1266670813.93118" 
    capture_lex $P141
# .annotate "line", 93
    .return ($P141)
.end


.namespace ["Exception";"ArgOpNotHandled"]
.sub "type"  :subid("54_1266670813.93118") :method :outer("53_1266670813.93118")
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
.sub "_block145"  :subid("55_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 97
    .const 'Sub' $P147 = "56_1266670813.93118" 
    capture_lex $P147
# .annotate "line", 98
    .const 'Sub' $P147 = "56_1266670813.93118" 
    capture_lex $P147
# .annotate "line", 97
    .return ($P147)
.end


.namespace ["Exception";"KeyNotFound"]
.sub "type"  :subid("56_1266670813.93118") :method :outer("55_1266670813.93118")
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
.sub "_block151"  :subid("57_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 101
    .const 'Sub' $P153 = "58_1266670813.93118" 
    capture_lex $P153
# .annotate "line", 102
    .const 'Sub' $P153 = "58_1266670813.93118" 
    capture_lex $P153
# .annotate "line", 101
    .return ($P153)
.end


.namespace ["Exception";"JitUnavailable"]
.sub "type"  :subid("58_1266670813.93118") :method :outer("57_1266670813.93118")
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
.sub "_block157"  :subid("59_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 105
    .const 'Sub' $P159 = "60_1266670813.93118" 
    capture_lex $P159
# .annotate "line", 106
    .const 'Sub' $P159 = "60_1266670813.93118" 
    capture_lex $P159
# .annotate "line", 105
    .return ($P159)
.end


.namespace ["Exception";"ExecUnavailable"]
.sub "type"  :subid("60_1266670813.93118") :method :outer("59_1266670813.93118")
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
.sub "_block163"  :subid("61_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 109
    .const 'Sub' $P165 = "62_1266670813.93118" 
    capture_lex $P165
# .annotate "line", 110
    .const 'Sub' $P165 = "62_1266670813.93118" 
    capture_lex $P165
# .annotate "line", 109
    .return ($P165)
.end


.namespace ["Exception";"InterpError"]
.sub "type"  :subid("62_1266670813.93118") :method :outer("61_1266670813.93118")
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
.sub "_block169"  :subid("63_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 113
    .const 'Sub' $P171 = "64_1266670813.93118" 
    capture_lex $P171
# .annotate "line", 114
    .const 'Sub' $P171 = "64_1266670813.93118" 
    capture_lex $P171
# .annotate "line", 113
    .return ($P171)
.end


.namespace ["Exception";"PrederefLoadError"]
.sub "type"  :subid("64_1266670813.93118") :method :outer("63_1266670813.93118")
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
.sub "_block175"  :subid("65_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 117
    .const 'Sub' $P177 = "66_1266670813.93118" 
    capture_lex $P177
# .annotate "line", 118
    .const 'Sub' $P177 = "66_1266670813.93118" 
    capture_lex $P177
# .annotate "line", 117
    .return ($P177)
.end


.namespace ["Exception";"ParrotUsageError"]
.sub "type"  :subid("66_1266670813.93118") :method :outer("65_1266670813.93118")
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
.sub "_block181"  :subid("67_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 121
    .const 'Sub' $P183 = "68_1266670813.93118" 
    capture_lex $P183
# .annotate "line", 122
    .const 'Sub' $P183 = "68_1266670813.93118" 
    capture_lex $P183
# .annotate "line", 121
    .return ($P183)
.end


.namespace ["Exception";"PioError"]
.sub "type"  :subid("68_1266670813.93118") :method :outer("67_1266670813.93118")
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
.sub "_block187"  :subid("69_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 125
    .const 'Sub' $P189 = "70_1266670813.93118" 
    capture_lex $P189
# .annotate "line", 126
    .const 'Sub' $P189 = "70_1266670813.93118" 
    capture_lex $P189
# .annotate "line", 125
    .return ($P189)
.end


.namespace ["Exception";"ParrotPointerError"]
.sub "type"  :subid("70_1266670813.93118") :method :outer("69_1266670813.93118")
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
.sub "_block193"  :subid("71_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 129
    .const 'Sub' $P195 = "72_1266670813.93118" 
    capture_lex $P195
# .annotate "line", 130
    .const 'Sub' $P195 = "72_1266670813.93118" 
    capture_lex $P195
# .annotate "line", 129
    .return ($P195)
.end


.namespace ["Exception";"DivByZero"]
.sub "type"  :subid("72_1266670813.93118") :method :outer("71_1266670813.93118")
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
.sub "_block199"  :subid("73_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 133
    .const 'Sub' $P201 = "74_1266670813.93118" 
    capture_lex $P201
# .annotate "line", 134
    .const 'Sub' $P201 = "74_1266670813.93118" 
    capture_lex $P201
# .annotate "line", 133
    .return ($P201)
.end


.namespace ["Exception";"PioNotImplemented"]
.sub "type"  :subid("74_1266670813.93118") :method :outer("73_1266670813.93118")
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
.sub "_block205"  :subid("75_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 137
    .const 'Sub' $P207 = "76_1266670813.93118" 
    capture_lex $P207
# .annotate "line", 138
    .const 'Sub' $P207 = "76_1266670813.93118" 
    capture_lex $P207
# .annotate "line", 137
    .return ($P207)
.end


.namespace ["Exception";"AllocationError"]
.sub "type"  :subid("76_1266670813.93118") :method :outer("75_1266670813.93118")
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
.sub "_block211"  :subid("77_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 141
    .const 'Sub' $P213 = "78_1266670813.93118" 
    capture_lex $P213
# .annotate "line", 142
    .const 'Sub' $P213 = "78_1266670813.93118" 
    capture_lex $P213
# .annotate "line", 141
    .return ($P213)
.end


.namespace ["Exception";"InternalPanic"]
.sub "type"  :subid("78_1266670813.93118") :method :outer("77_1266670813.93118")
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
.sub "_block217"  :subid("79_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 145
    .const 'Sub' $P219 = "80_1266670813.93118" 
    capture_lex $P219
# .annotate "line", 146
    .const 'Sub' $P219 = "80_1266670813.93118" 
    capture_lex $P219
# .annotate "line", 145
    .return ($P219)
.end


.namespace ["Exception";"OutOfBounds"]
.sub "type"  :subid("80_1266670813.93118") :method :outer("79_1266670813.93118")
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
.sub "_block223"  :subid("81_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 149
    .const 'Sub' $P225 = "82_1266670813.93118" 
    capture_lex $P225
# .annotate "line", 150
    .const 'Sub' $P225 = "82_1266670813.93118" 
    capture_lex $P225
# .annotate "line", 149
    .return ($P225)
.end


.namespace ["Exception";"JitError"]
.sub "type"  :subid("82_1266670813.93118") :method :outer("81_1266670813.93118")
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
.sub "_block229"  :subid("83_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 153
    .const 'Sub' $P231 = "84_1266670813.93118" 
    capture_lex $P231
# .annotate "line", 154
    .const 'Sub' $P231 = "84_1266670813.93118" 
    capture_lex $P231
# .annotate "line", 153
    .return ($P231)
.end


.namespace ["Exception";"ExecError"]
.sub "type"  :subid("84_1266670813.93118") :method :outer("83_1266670813.93118")
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
.sub "_block235"  :subid("85_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 157
    .const 'Sub' $P237 = "86_1266670813.93118" 
    capture_lex $P237
# .annotate "line", 158
    .const 'Sub' $P237 = "86_1266670813.93118" 
    capture_lex $P237
# .annotate "line", 157
    .return ($P237)
.end


.namespace ["Exception";"IllInherit"]
.sub "type"  :subid("86_1266670813.93118") :method :outer("85_1266670813.93118")
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
.sub "_block241"  :subid("87_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 161
    .const 'Sub' $P243 = "88_1266670813.93118" 
    capture_lex $P243
# .annotate "line", 162
    .const 'Sub' $P243 = "88_1266670813.93118" 
    capture_lex $P243
# .annotate "line", 161
    .return ($P243)
.end


.namespace ["Exception";"NoPrevCs"]
.sub "type"  :subid("88_1266670813.93118") :method :outer("87_1266670813.93118")
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
.sub "_block247"  :subid("89_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 165
    .const 'Sub' $P249 = "90_1266670813.93118" 
    capture_lex $P249
# .annotate "line", 166
    .const 'Sub' $P249 = "90_1266670813.93118" 
    capture_lex $P249
# .annotate "line", 165
    .return ($P249)
.end


.namespace ["Exception";"NoClass"]
.sub "type"  :subid("90_1266670813.93118") :method :outer("89_1266670813.93118")
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
.sub "_block253"  :subid("91_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 169
    .const 'Sub' $P255 = "92_1266670813.93118" 
    capture_lex $P255
# .annotate "line", 170
    .const 'Sub' $P255 = "92_1266670813.93118" 
    capture_lex $P255
# .annotate "line", 169
    .return ($P255)
.end


.namespace ["Exception";"LexNotFound"]
.sub "type"  :subid("92_1266670813.93118") :method :outer("91_1266670813.93118")
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
.sub "_block259"  :subid("93_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 173
    .const 'Sub' $P261 = "94_1266670813.93118" 
    capture_lex $P261
# .annotate "line", 174
    .const 'Sub' $P261 = "94_1266670813.93118" 
    capture_lex $P261
# .annotate "line", 173
    .return ($P261)
.end


.namespace ["Exception";"PadNotFound"]
.sub "type"  :subid("94_1266670813.93118") :method :outer("93_1266670813.93118")
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
.sub "_block265"  :subid("95_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 177
    .const 'Sub' $P267 = "96_1266670813.93118" 
    capture_lex $P267
# .annotate "line", 178
    .const 'Sub' $P267 = "96_1266670813.93118" 
    capture_lex $P267
# .annotate "line", 177
    .return ($P267)
.end


.namespace ["Exception";"AttribNotFound"]
.sub "type"  :subid("96_1266670813.93118") :method :outer("95_1266670813.93118")
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
.sub "_block271"  :subid("97_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 181
    .const 'Sub' $P273 = "98_1266670813.93118" 
    capture_lex $P273
# .annotate "line", 182
    .const 'Sub' $P273 = "98_1266670813.93118" 
    capture_lex $P273
# .annotate "line", 181
    .return ($P273)
.end


.namespace ["Exception";"GlobalNotFound"]
.sub "type"  :subid("98_1266670813.93118") :method :outer("97_1266670813.93118")
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
.sub "_block277"  :subid("99_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 185
    .const 'Sub' $P279 = "100_1266670813.93118" 
    capture_lex $P279
# .annotate "line", 186
    .const 'Sub' $P279 = "100_1266670813.93118" 
    capture_lex $P279
# .annotate "line", 185
    .return ($P279)
.end


.namespace ["Exception";"ExternalError"]
.sub "type"  :subid("100_1266670813.93118") :method :outer("99_1266670813.93118")
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
.sub "_block283"  :subid("101_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 189
    .const 'Sub' $P285 = "102_1266670813.93118" 
    capture_lex $P285
# .annotate "line", 190
    .const 'Sub' $P285 = "102_1266670813.93118" 
    capture_lex $P285
# .annotate "line", 189
    .return ($P285)
.end


.namespace ["Exception";"MethodNotFound"]
.sub "type"  :subid("102_1266670813.93118") :method :outer("101_1266670813.93118")
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
.sub "_block289"  :subid("103_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 193
    .const 'Sub' $P291 = "104_1266670813.93118" 
    capture_lex $P291
# .annotate "line", 194
    .const 'Sub' $P291 = "104_1266670813.93118" 
    capture_lex $P291
# .annotate "line", 193
    .return ($P291)
.end


.namespace ["Exception";"VtableNotFound"]
.sub "type"  :subid("104_1266670813.93118") :method :outer("103_1266670813.93118")
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
.sub "_block295"  :subid("105_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 197
    .const 'Sub' $P297 = "106_1266670813.93118" 
    capture_lex $P297
# .annotate "line", 198
    .const 'Sub' $P297 = "106_1266670813.93118" 
    capture_lex $P297
# .annotate "line", 197
    .return ($P297)
.end


.namespace ["Exception";"WriteToConstclass"]
.sub "type"  :subid("106_1266670813.93118") :method :outer("105_1266670813.93118")
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
.sub "_block301"  :subid("107_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 201
    .const 'Sub' $P303 = "108_1266670813.93118" 
    capture_lex $P303
# .annotate "line", 202
    .const 'Sub' $P303 = "108_1266670813.93118" 
    capture_lex $P303
# .annotate "line", 201
    .return ($P303)
.end


.namespace ["Exception";"Nospawn"]
.sub "type"  :subid("108_1266670813.93118") :method :outer("107_1266670813.93118")
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
.sub "_block307"  :subid("109_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 205
    .const 'Sub' $P309 = "110_1266670813.93118" 
    capture_lex $P309
# .annotate "line", 206
    .const 'Sub' $P309 = "110_1266670813.93118" 
    capture_lex $P309
# .annotate "line", 205
    .return ($P309)
.end


.namespace ["Exception";"InternalNotImplemented"]
.sub "type"  :subid("110_1266670813.93118") :method :outer("109_1266670813.93118")
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
.sub "_block313"  :subid("111_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 209
    .const 'Sub' $P315 = "112_1266670813.93118" 
    capture_lex $P315
# .annotate "line", 210
    .const 'Sub' $P315 = "112_1266670813.93118" 
    capture_lex $P315
# .annotate "line", 209
    .return ($P315)
.end


.namespace ["Exception";"ErrOverflow"]
.sub "type"  :subid("112_1266670813.93118") :method :outer("111_1266670813.93118")
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
.sub "_block319"  :subid("113_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 213
    .const 'Sub' $P321 = "114_1266670813.93118" 
    capture_lex $P321
# .annotate "line", 214
    .const 'Sub' $P321 = "114_1266670813.93118" 
    capture_lex $P321
# .annotate "line", 213
    .return ($P321)
.end


.namespace ["Exception";"LossyConversion"]
.sub "type"  :subid("114_1266670813.93118") :method :outer("113_1266670813.93118")
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
.sub "_block325"  :subid("115_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 217
    .const 'Sub' $P327 = "116_1266670813.93118" 
    capture_lex $P327
# .annotate "line", 218
    .const 'Sub' $P327 = "116_1266670813.93118" 
    capture_lex $P327
# .annotate "line", 217
    .return ($P327)
.end


.namespace ["Exception";"RoleCompositionMethodConflict"]
.sub "type"  :subid("116_1266670813.93118") :method :outer("115_1266670813.93118")
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
.sub "_block331"  :subid("117_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 221
    .const 'Sub' $P333 = "118_1266670813.93118" 
    capture_lex $P333
# .annotate "line", 222
    .const 'Sub' $P333 = "118_1266670813.93118" 
    capture_lex $P333
# .annotate "line", 221
    .return ($P333)
.end


.namespace ["Exception";"UnexpectedNull"]
.sub "type"  :subid("118_1266670813.93118") :method :outer("117_1266670813.93118")
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
.sub "_block337"  :subid("119_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 225
    .const 'Sub' $P339 = "120_1266670813.93118" 
    capture_lex $P339
# .annotate "line", 226
    .const 'Sub' $P339 = "120_1266670813.93118" 
    capture_lex $P339
# .annotate "line", 225
    .return ($P339)
.end


.namespace ["Exception";"LibraryError"]
.sub "type"  :subid("120_1266670813.93118") :method :outer("119_1266670813.93118")
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
.sub "_block343"  :subid("121_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 229
    .const 'Sub' $P345 = "122_1266670813.93118" 
    capture_lex $P345
# .annotate "line", 230
    .const 'Sub' $P345 = "122_1266670813.93118" 
    capture_lex $P345
# .annotate "line", 229
    .return ($P345)
.end


.namespace ["Exception";"LibraryNotLoaded"]
.sub "type"  :subid("122_1266670813.93118") :method :outer("121_1266670813.93118")
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
.sub "_block349"  :subid("123_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 233
    .const 'Sub' $P351 = "124_1266670813.93118" 
    capture_lex $P351
# .annotate "line", 234
    .const 'Sub' $P351 = "124_1266670813.93118" 
    capture_lex $P351
# .annotate "line", 233
    .return ($P351)
.end


.namespace ["Exception";"SyntaxError"]
.sub "type"  :subid("124_1266670813.93118") :method :outer("123_1266670813.93118")
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
.sub "_block355"  :subid("125_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 237
    .const 'Sub' $P357 = "126_1266670813.93118" 
    capture_lex $P357
# .annotate "line", 238
    .const 'Sub' $P357 = "126_1266670813.93118" 
    capture_lex $P357
# .annotate "line", 237
    .return ($P357)
.end


.namespace ["Exception";"MalformedPackfile"]
.sub "type"  :subid("126_1266670813.93118") :method :outer("125_1266670813.93118")
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
.sub "_block361"  :subid("127_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 241
    .const 'Sub' $P363 = "128_1266670813.93118" 
    capture_lex $P363
# .annotate "line", 242
    .const 'Sub' $P363 = "128_1266670813.93118" 
    capture_lex $P363
# .annotate "line", 241
    .return ($P363)
.end


.namespace ["Control";"Return"]
.sub "type"  :subid("128_1266670813.93118") :method :outer("127_1266670813.93118")
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
.sub "_block367"  :subid("129_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 245
    .const 'Sub' $P369 = "130_1266670813.93118" 
    capture_lex $P369
# .annotate "line", 246
    .const 'Sub' $P369 = "130_1266670813.93118" 
    capture_lex $P369
# .annotate "line", 245
    .return ($P369)
.end


.namespace ["Control";"Ok"]
.sub "type"  :subid("130_1266670813.93118") :method :outer("129_1266670813.93118")
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
.sub "_block373"  :subid("131_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 249
    .const 'Sub' $P375 = "132_1266670813.93118" 
    capture_lex $P375
# .annotate "line", 250
    .const 'Sub' $P375 = "132_1266670813.93118" 
    capture_lex $P375
# .annotate "line", 249
    .return ($P375)
.end


.namespace ["Control";"Break"]
.sub "type"  :subid("132_1266670813.93118") :method :outer("131_1266670813.93118")
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
.sub "_block379"  :subid("133_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 253
    .const 'Sub' $P381 = "134_1266670813.93118" 
    capture_lex $P381
# .annotate "line", 254
    .const 'Sub' $P381 = "134_1266670813.93118" 
    capture_lex $P381
# .annotate "line", 253
    .return ($P381)
.end


.namespace ["Control";"Continue"]
.sub "type"  :subid("134_1266670813.93118") :method :outer("133_1266670813.93118")
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
.sub "_block385"  :subid("135_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 257
    .const 'Sub' $P387 = "136_1266670813.93118" 
    capture_lex $P387
# .annotate "line", 258
    .const 'Sub' $P387 = "136_1266670813.93118" 
    capture_lex $P387
# .annotate "line", 257
    .return ($P387)
.end


.namespace ["Control";"Error"]
.sub "type"  :subid("136_1266670813.93118") :method :outer("135_1266670813.93118")
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
.sub "_block391"  :subid("137_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 261
    .const 'Sub' $P393 = "138_1266670813.93118" 
    capture_lex $P393
# .annotate "line", 262
    .const 'Sub' $P393 = "138_1266670813.93118" 
    capture_lex $P393
# .annotate "line", 261
    .return ($P393)
.end


.namespace ["Control";"Take"]
.sub "type"  :subid("138_1266670813.93118") :method :outer("137_1266670813.93118")
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
.sub "_block397"  :subid("139_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 265
    .const 'Sub' $P399 = "140_1266670813.93118" 
    capture_lex $P399
# .annotate "line", 266
    .const 'Sub' $P399 = "140_1266670813.93118" 
    capture_lex $P399
# .annotate "line", 265
    .return ($P399)
.end


.namespace ["Control";"Leave"]
.sub "type"  :subid("140_1266670813.93118") :method :outer("139_1266670813.93118")
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
.sub "_block403"  :subid("141_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 269
    .const 'Sub' $P405 = "142_1266670813.93118" 
    capture_lex $P405
# .annotate "line", 270
    .const 'Sub' $P405 = "142_1266670813.93118" 
    capture_lex $P405
# .annotate "line", 269
    .return ($P405)
.end


.namespace ["Control";"LoopNext"]
.sub "type"  :subid("142_1266670813.93118") :method :outer("141_1266670813.93118")
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
.sub "_block409"  :subid("143_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 273
    .const 'Sub' $P411 = "144_1266670813.93118" 
    capture_lex $P411
# .annotate "line", 274
    .const 'Sub' $P411 = "144_1266670813.93118" 
    capture_lex $P411
# .annotate "line", 273
    .return ($P411)
.end


.namespace ["Control";"LoopLast"]
.sub "type"  :subid("144_1266670813.93118") :method :outer("143_1266670813.93118")
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
.sub "_block415"  :subid("145_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 277
    .const 'Sub' $P417 = "146_1266670813.93118" 
    capture_lex $P417
# .annotate "line", 278
    .const 'Sub' $P417 = "146_1266670813.93118" 
    capture_lex $P417
# .annotate "line", 277
    .return ($P417)
.end


.namespace ["Control";"LoopRedo"]
.sub "type"  :subid("146_1266670813.93118") :method :outer("145_1266670813.93118")
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
.sub "_block421"  :subid("147_1266670813.93118") :outer("10_1266670813.93118")
# .annotate "line", 285
    get_hll_global $P424, ["Exception";"InvalidArgument"], "_block423" 
    capture_lex $P424
    get_hll_global $P424, ["Exception";"InvalidArgument"], "_block423" 
    capture_lex $P424
    $P425 = $P424()
    .return ($P425)
.end


.namespace ["Exception";"AbstractMethodCalled"]
.sub "" :load :init :subid("post150") :outer("147_1266670813.93118")
# .annotate "line", 285
    get_hll_global $P422, ["Exception";"AbstractMethodCalled"], "_block421" 
    .local pmc block
    set block, $P422
    $P426 = get_root_global ["parrot"], "P6metaclass"
    $P426."new_class"("Exception::InvalidArgument", "Exception::Wrapper" :named("parent"))
.end


.namespace ["Exception";"InvalidArgument"]
.sub "_block423"  :subid("148_1266670813.93118") :outer("147_1266670813.93118")
# .annotate "line", 285
    .return ()
.end


.namespace []
.sub "_block11"  :anon :subid("10_1266670798.91095")
# .annotate "line", 0
    get_hll_global $P14, ["Key"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["Key"], "_block13" 
    capture_lex $P14
    $P93 = $P14()
# .annotate "line", 1
    .return ($P93)
.end


.namespace ["Key"]
.sub "_block13"  :subid("11_1266670798.91095") :outer("10_1266670798.91095")
# .annotate "line", 6
    .const 'Sub' $P85 = "16_1266670798.91095" 
    capture_lex $P85
    .const 'Sub' $P32 = "14_1266670798.91095" 
    capture_lex $P32
    .const 'Sub' $P24 = "13_1266670798.91095" 
    capture_lex $P24
    .const 'Sub' $P15 = "12_1266670798.91095" 
    capture_lex $P15
# .annotate "line", 41
    .const 'Sub' $P85 = "16_1266670798.91095" 
    capture_lex $P85
# .annotate "line", 6
    .return ($P85)
.end


.namespace ["Key"]
.sub "__dump"  :subid("12_1266670798.91095") :method :outer("11_1266670798.91095")
    .param pmc param_18
    .param pmc param_19
# .annotate "line", 6
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
    .lex "$dumper", param_18
    .lex "$label", param_19
# .annotate "line", 7
    find_lex $P20, "self"
    get_repr $S21, $P20
    $P22 = "print"($S21)
# .annotate "line", 6
    .return ($P22)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P23, exception, "payload"
    .return ($P23)
.end


.namespace ["Key"]
.sub "new"  :subid("13_1266670798.91095") :method :outer("11_1266670798.91095")
    .param pmc param_27 :slurpy
# .annotate "line", 10
    new $P26, 'ExceptionHandler'
    set_addr $P26, control_25
    $P26."handle_types"(58)
    push_eh $P26
    .lex "self", self
    .lex "@parts", param_27
# .annotate "line", 11
    find_lex $P28, "self"
    find_lex $P29, "@parts"
    $P30 = $P28."new_"($P29)
# .annotate "line", 10
    .return ($P30)
  control_25:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P31, exception, "payload"
    .return ($P31)
.end


.namespace ["Key"]
.sub "new_"  :subid("14_1266670798.91095") :method :outer("11_1266670798.91095")
    .param pmc param_35
    .param pmc param_36 :optional
    .param int has_param_36 :opt_flag
# .annotate "line", 14
    .const 'Sub' $P47 = "15_1266670798.91095" 
    capture_lex $P47
    new $P34, 'ExceptionHandler'
    set_addr $P34, control_33
    $P34."handle_types"(58)
    push_eh $P34
    .lex "self", self
    .lex "@parts", param_35
    if has_param_36, optparam_17
    new $P37, "Hash"
    set param_36, $P37
  optparam_17:
    .lex "%opts", param_36
# .annotate "line", 15
    new $P38, "Undef"
    .lex "$key", $P38
# .annotate "line", 16
    new $P39, "Undef"
    .lex "$segment", $P39
# .annotate "line", 14
    find_lex $P40, "$key"
    find_lex $P41, "$segment"
# .annotate "line", 18
    find_lex $P43, "@parts"
    defined $I44, $P43
    unless $I44, for_undef_18
    iter $P42, $P43
    new $P81, 'ExceptionHandler'
    set_addr $P81, loop80_handler
    $P81."handle_types"(65, 67, 66)
    push_eh $P81
  loop80_test:
    unless $P42, loop80_done
    shift $P45, $P42
  loop80_redo:
    .const 'Sub' $P47 = "15_1266670798.91095" 
    capture_lex $P47
    $P47($P45)
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
  for_undef_18:
    find_lex $P83, "$key"
# .annotate "line", 14
    .return ($P83)
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P84, exception, "payload"
    .return ($P84)
.end


.namespace ["Key"]
.sub "_block46"  :anon :subid("15_1266670798.91095") :outer("14_1266670798.91095")
    .param pmc param_48
# .annotate "line", 18
    .lex "$_", param_48
# .annotate "line", 19
    new $P49, "String"
    assign $P49, "Key"
    set $S50, $P49
    new $P51, $S50
    store_lex "$segment", $P51
# .annotate "line", 21
    find_lex $P53, "$_"
    isa $I54, $P53, "Integer"
    if $I54, if_52
# .annotate "line", 22
    find_lex $P59, "$_"
    $P60 = $P59."isa"("Float")
    if $P60, if_58
# .annotate "line", 23
    find_lex $P65, "$_"
    $P66 = $P65."isa"("String")
    if $P66, if_64
# .annotate "line", 25
    get_hll_global $P70, ["Exception"], "InvalidArgument"
    $P71 = $P70."new"("Arguments to Key.new must be Integer, String, or Float" :named("message"))
    $P71."throw"()
# .annotate "line", 24
    goto if_64_end
  if_64:
# .annotate "line", 23
    find_lex $P67, "$segment"
    find_lex $P68, "$_"
    set $S69, $P68
    assign $P67, $S69
  if_64_end:
    goto if_58_end
  if_58:
# .annotate "line", 22
    find_lex $P61, "$segment"
    find_lex $P62, "$_"
    set $N63, $P62
    assign $P61, $N63
  if_58_end:
    goto if_52_end
  if_52:
# .annotate "line", 21
    find_lex $P55, "$segment"
    find_lex $P56, "$_"
    set $I57, $P56
    assign $P55, $I57
  if_52_end:
# .annotate "line", 30
    find_lex $P74, "$key"
    $P75 = $P74."defined"()
    if $P75, if_73
# .annotate "line", 34
    find_lex $P79, "$segment"
    store_lex "$key", $P79
# .annotate "line", 33
    set $P72, $P79
# .annotate "line", 30
    goto if_73_end
  if_73:
# .annotate "line", 31
    find_lex $P76, "$key"
    find_lex $P77, "$segment"
    $P78 = $P76."push"($P77)
# .annotate "line", 30
    set $P72, $P78
  if_73_end:
# .annotate "line", 18
    .return ($P72)
.end


.namespace ["Key"]
.sub "push"  :subid("16_1266670798.91095") :method :outer("11_1266670798.91095")
    .param pmc param_88
# .annotate "line", 41
    new $P87, 'ExceptionHandler'
    set_addr $P87, control_86
    $P87."handle_types"(58)
    push_eh $P87
    .lex "self", self
    .lex "$obj", param_88
# .annotate "line", 42
    find_lex $P89, "self"
    find_lex $P90, "$obj"
    push $P89, $P90
    find_lex $P91, "self"
# .annotate "line", 41
    .return ($P91)
  control_86:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P92, exception, "payload"
    .return ($P92)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1266670842.03161")
# .annotate "line", 0
    get_hll_global $P14, ["Hash"], "_block13" 
    capture_lex $P14
# .annotate "line", 53
    get_hll_global $P14, ["Hash"], "_block13" 
    capture_lex $P14
    $P234 = $P14()
# .annotate "line", 1
    .return ($P234)
.end


.namespace ["Hash"]
.sub "_block13"  :subid("11_1266670842.03161") :outer("10_1266670842.03161")
# .annotate "line", 53
    .const 'Sub' $P205 = "23_1266670842.03161" 
    capture_lex $P205
    .const 'Sub' $P181 = "21_1266670842.03161" 
    capture_lex $P181
    .const 'Sub' $P175 = "20_1266670842.03161" 
    capture_lex $P175
    .const 'Sub' $P169 = "19_1266670842.03161" 
    capture_lex $P169
    .const 'Sub' $P163 = "18_1266670842.03161" 
    capture_lex $P163
    .const 'Sub' $P85 = "15_1266670842.03161" 
    capture_lex $P85
    .const 'Sub' $P15 = "12_1266670842.03161" 
    capture_lex $P15
# .annotate "line", 124
    .const 'Sub' $P15 = "12_1266670842.03161" 
    capture_lex $P15
    .lex "merge", $P15
# .annotate "line", 164
    .const 'Sub' $P85 = "15_1266670842.03161" 
    capture_lex $P85
    .lex "merge_keys", $P85
# .annotate "line", 107
    find_lex $P203, "merge"
    find_lex $P204, "merge_keys"
# .annotate "line", 211
    .const 'Sub' $P205 = "23_1266670842.03161" 
    capture_lex $P205
# .annotate "line", 53
    .return ($P205)
.end


.namespace ["Hash"]
.sub "merge"  :subid("12_1266670842.03161") :outer("11_1266670842.03161")
    .param pmc param_18
    .param pmc param_19 :slurpy
    .param pmc param_20 :optional :named("into")
    .param int has_param_20 :opt_flag
    .param pmc param_22 :optional :named("use_last")
    .param int has_param_22 :opt_flag
# .annotate "line", 124
    .const 'Sub' $P52 = "13_1266670842.03161" 
    capture_lex $P52
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "%first", param_18
    .lex "@hashes", param_19
    if has_param_20, optparam_25
    new $P21, "Hash"
    set param_20, $P21
  optparam_25:
    .lex "%into", param_20
    if has_param_22, optparam_26
    new $P23, "Undef"
    set param_22, $P23
  optparam_26:
    .lex "$use_last", param_22
# .annotate "line", 136
    new $P24, "Hash"
    .lex "%stored", $P24
# .annotate "line", 126
    find_lex $P25, "@hashes"
    find_lex $P26, "%first"
    $P25."unshift"($P26)
# .annotate "line", 128
    get_hll_global $P28, ["Opcode"], "defined"
    find_lex $P29, "%into"
    $P30 = $P28($P29)
    if $P30, unless_27_end
# .annotate "line", 129
    find_lex $P31, "@hashes"
    $P32 = $P31."shift"()
    store_lex "%into", $P32
# .annotate "line", 131
    get_hll_global $P34, ["Opcode"], "defined"
    find_lex $P35, "%into"
    $P36 = $P34($P35)
    if $P36, unless_33_end
# .annotate "line", 132
    get_hll_global $P37, "Hash"
    $P38 = $P37."new"()
    store_lex "%into", $P38
  unless_33_end:
  unless_27_end:
# .annotate "line", 136
    find_lex $P39, "%into"
    store_lex "%stored", $P39
# .annotate "line", 138
    find_lex $P41, "$use_last"
    unless $P41, if_40_end
# .annotate "line", 139
    get_hll_global $P42, ["Array"], "reverse"
    find_lex $P43, "@hashes"
    $P44 = $P42($P43)
    store_lex "@hashes", $P44
# .annotate "line", 140
    get_hll_global $P45, ["Hash"], "empty"
    $P46 = $P45()
    store_lex "%stored", $P46
  if_40_end:
# .annotate "line", 143
    find_lex $P48, "@hashes"
    defined $I49, $P48
    unless $I49, for_undef_27
    iter $P47, $P48
    new $P80, 'ExceptionHandler'
    set_addr $P80, loop79_handler
    $P80."handle_types"(65, 67, 66)
    push_eh $P80
  loop79_test:
    unless $P47, loop79_done
    shift $P50, $P47
  loop79_redo:
    .const 'Sub' $P52 = "13_1266670842.03161" 
    capture_lex $P52
    $P52($P50)
  loop79_next:
    goto loop79_test
  loop79_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P81, exception, 'type'
    eq $P81, 65, loop79_next
    eq $P81, 67, loop79_redo
  loop79_done:
    pop_eh 
  for_undef_27:
# .annotate "line", 154
    new $P82, "Exception"
    set $P82['type'], 58
    find_lex $P83, "%into"
    setattribute $P82, 'payload', $P83
    throw $P82
# .annotate "line", 124
    .return ()
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P84, exception, "payload"
    .return ($P84)
.end


.namespace ["Hash"]
.sub "_block51"  :anon :subid("13_1266670842.03161") :outer("12_1266670842.03161")
    .param pmc param_54
# .annotate "line", 143
    .const 'Sub' $P61 = "14_1266670842.03161" 
    capture_lex $P61
# .annotate "line", 144
    new $P53, "Undef"
    .lex "$hash", $P53
    .lex "$_", param_54
    find_lex $P55, "$_"
    store_lex "$hash", $P55
# .annotate "line", 145
    find_lex $P57, "$hash"
    defined $I58, $P57
    unless $I58, for_undef_28
    iter $P56, $P57
    new $P77, 'ExceptionHandler'
    set_addr $P77, loop76_handler
    $P77."handle_types"(65, 67, 66)
    push_eh $P77
  loop76_test:
    unless $P56, loop76_done
    shift $P59, $P56
  loop76_redo:
    .const 'Sub' $P61 = "14_1266670842.03161" 
    capture_lex $P61
    $P61($P59)
  loop76_next:
    goto loop76_test
  loop76_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P78, exception, 'type'
    eq $P78, 65, loop76_next
    eq $P78, 67, loop76_redo
  loop76_done:
    pop_eh 
  for_undef_28:
# .annotate "line", 143
    .return ($P56)
.end


.namespace ["Hash"]
.sub "_block60"  :anon :subid("14_1266670842.03161") :outer("13_1266670842.03161")
    .param pmc param_62
# .annotate "line", 145
    .lex "$_", param_62
# .annotate "line", 146
    get_hll_global $P65, ["Hash"], "exists"
    find_lex $P66, "%stored"
    find_lex $P67, "$_"
    $P68 = $P65($P66, $P67)
    unless $P68, unless_64
    set $P63, $P68
    goto unless_64_end
  unless_64:
# .annotate "line", 149
    find_lex $P69, "$_"
    find_lex $P70, "$hash"
    unless_null $P70, vivify_29
    new $P70, "Hash"
  vivify_29:
    set $P71, $P70[$P69]
    unless_null $P71, vivify_30
    new $P71, "Undef"
  vivify_30:
    find_lex $P72, "$_"
    find_lex $P73, "%stored"
    unless_null $P73, vivify_31
    new $P73, "Hash"
    store_lex "%stored", $P73
  vivify_31:
    set $P73[$P72], $P71
    find_lex $P74, "$_"
    find_lex $P75, "%into"
    unless_null $P75, vivify_32
    new $P75, "Hash"
    store_lex "%into", $P75
  vivify_32:
    set $P75[$P74], $P71
# .annotate "line", 146
    set $P63, $P71
  unless_64_end:
# .annotate "line", 145
    .return ($P63)
.end


.namespace ["Hash"]
.sub "merge_keys"  :subid("15_1266670842.03161") :outer("11_1266670842.03161")
    .param pmc param_88
    .param pmc param_89 :slurpy
    .param pmc param_90 :named("keys")
    .param pmc param_91 :optional :named("into")
    .param int has_param_91 :opt_flag
    .param pmc param_93 :optional :named("use_last")
    .param int has_param_93 :opt_flag
# .annotate "line", 164
    .const 'Sub' $P123 = "16_1266670842.03161" 
    capture_lex $P123
    new $P87, 'ExceptionHandler'
    set_addr $P87, control_86
    $P87."handle_types"(58)
    push_eh $P87
    .lex "%first", param_88
    .lex "@hashes", param_89
    .lex "@keys", param_90
    if has_param_91, optparam_33
    new $P92, "Hash"
    set param_91, $P92
  optparam_33:
    .lex "%into", param_91
    if has_param_93, optparam_34
    new $P94, "Undef"
    set param_93, $P94
  optparam_34:
    .lex "$use_last", param_93
# .annotate "line", 175
    new $P95, "Hash"
    .lex "%stored", $P95
# .annotate "line", 165
    find_lex $P96, "@hashes"
    find_lex $P97, "%first"
    $P96."unshift"($P97)
# .annotate "line", 167
    get_hll_global $P99, ["Opcode"], "defined"
    find_lex $P100, "%into"
    $P101 = $P99($P100)
    if $P101, unless_98_end
# .annotate "line", 168
    find_lex $P102, "@hashes"
    $P103 = $P102."shift"()
    store_lex "%into", $P103
# .annotate "line", 170
    get_hll_global $P105, ["Opcode"], "defined"
    find_lex $P106, "%into"
    $P107 = $P105($P106)
    if $P107, unless_104_end
# .annotate "line", 171
    get_hll_global $P108, "Hash"
    $P109 = $P108."new"()
    store_lex "%into", $P109
  unless_104_end:
  unless_98_end:
# .annotate "line", 175
    find_lex $P110, "%into"
    store_lex "%stored", $P110
# .annotate "line", 177
    find_lex $P112, "$use_last"
    unless $P112, if_111_end
# .annotate "line", 178
    get_hll_global $P113, ["Array"], "reverse"
    find_lex $P114, "@hashes"
    $P115 = $P113($P114)
    store_lex "@hashes", $P115
# .annotate "line", 179
    get_hll_global $P116, ["Hash"], "empty"
    $P117 = $P116()
    store_lex "%stored", $P117
  if_111_end:
# .annotate "line", 182
    find_lex $P119, "@hashes"
    defined $I120, $P119
    unless $I120, for_undef_35
    iter $P118, $P119
    new $P158, 'ExceptionHandler'
    set_addr $P158, loop157_handler
    $P158."handle_types"(65, 67, 66)
    push_eh $P158
  loop157_test:
    unless $P118, loop157_done
    shift $P121, $P118
  loop157_redo:
    .const 'Sub' $P123 = "16_1266670842.03161" 
    capture_lex $P123
    $P123($P121)
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
  for_undef_35:
# .annotate "line", 193
    new $P160, "Exception"
    set $P160['type'], 58
    find_lex $P161, "%into"
    setattribute $P160, 'payload', $P161
    throw $P160
# .annotate "line", 164
    .return ()
  control_86:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P162, exception, "payload"
    .return ($P162)
.end


.namespace ["Hash"]
.sub "_block122"  :anon :subid("16_1266670842.03161") :outer("15_1266670842.03161")
    .param pmc param_125
# .annotate "line", 182
    .const 'Sub' $P132 = "17_1266670842.03161" 
    capture_lex $P132
# .annotate "line", 183
    new $P124, "Undef"
    .lex "$hash", $P124
    .lex "$_", param_125
    find_lex $P126, "$_"
    store_lex "$hash", $P126
# .annotate "line", 185
    find_lex $P128, "@keys"
    defined $I129, $P128
    unless $I129, for_undef_36
    iter $P127, $P128
    new $P155, 'ExceptionHandler'
    set_addr $P155, loop154_handler
    $P155."handle_types"(65, 67, 66)
    push_eh $P155
  loop154_test:
    unless $P127, loop154_done
    shift $P130, $P127
  loop154_redo:
    .const 'Sub' $P132 = "17_1266670842.03161" 
    capture_lex $P132
    $P132($P130)
  loop154_next:
    goto loop154_test
  loop154_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P156, exception, 'type'
    eq $P156, 65, loop154_next
    eq $P156, 67, loop154_redo
  loop154_done:
    pop_eh 
  for_undef_36:
# .annotate "line", 182
    .return ($P127)
.end


.namespace ["Hash"]
.sub "_block131"  :anon :subid("17_1266670842.03161") :outer("16_1266670842.03161")
    .param pmc param_133
# .annotate "line", 185
    .lex "$_", param_133
# .annotate "line", 186
    get_hll_global $P138, ["Hash"], "exists"
    find_lex $P139, "%stored"
    find_lex $P140, "$_"
    $P141 = $P138($P139, $P140)
    isfalse $I142, $P141
    if $I142, if_137
    new $P136, 'Integer'
    set $P136, $I142
    goto if_137_end
  if_137:
    get_hll_global $P143, ["Hash"], "exists"
    find_lex $P144, "$hash"
    find_lex $P145, "$_"
    $P146 = $P143($P144, $P145)
    set $P136, $P146
  if_137_end:
    if $P136, if_135
    set $P134, $P136
    goto if_135_end
  if_135:
# .annotate "line", 188
    find_lex $P147, "$_"
    find_lex $P148, "$hash"
    unless_null $P148, vivify_37
    new $P148, "Hash"
  vivify_37:
    set $P149, $P148[$P147]
    unless_null $P149, vivify_38
    new $P149, "Undef"
  vivify_38:
    find_lex $P150, "$_"
    find_lex $P151, "%stored"
    unless_null $P151, vivify_39
    new $P151, "Hash"
    store_lex "%stored", $P151
  vivify_39:
    set $P151[$P150], $P149
    find_lex $P152, "$_"
    find_lex $P153, "%into"
    unless_null $P153, vivify_40
    new $P153, "Hash"
    store_lex "%into", $P153
  vivify_40:
    set $P153[$P152], $P149
# .annotate "line", 186
    set $P134, $P149
  if_135_end:
# .annotate "line", 185
    .return ($P134)
.end


.namespace ["Hash"]
.sub "contains"  :subid("18_1266670842.03161") :method :outer("11_1266670842.03161")
    .param pmc param_166
# .annotate "line", 53
    new $P165, 'ExceptionHandler'
    set_addr $P165, control_164
    $P165."handle_types"(58)
    push_eh $P165
    .lex "self", self
    .lex "$key", param_166
# .annotate "line", 54

		$P0 = find_lex 'self'
		$P1 = find_lex '$key'
		$I0 = exists $P0[$P1]
		$P167 = box $I0
	
# .annotate "line", 53
    .return ($P167)
  control_164:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P168, exception, "payload"
    .return ($P168)
.end


.namespace ["Hash"]
.sub "delete"  :subid("19_1266670842.03161") :method :outer("11_1266670842.03161")
    .param pmc param_172
# .annotate "line", 73
    new $P171, 'ExceptionHandler'
    set_addr $P171, control_170
    $P171."handle_types"(58)
    push_eh $P171
    .lex "self", self
    .lex "$key", param_172
# .annotate "line", 74

		$P173  = find_lex 'self'
		$P1 = find_lex '$key'
		delete $P173[$P1]
	
# .annotate "line", 73
    .return ($P173)
  control_170:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P174, exception, "payload"
    .return ($P174)
.end


.namespace ["Hash"]
.sub "elements"  :subid("20_1266670842.03161") :method :outer("11_1266670842.03161")
# .annotate "line", 91
    new $P177, 'ExceptionHandler'
    set_addr $P177, control_176
    $P177."handle_types"(58)
    push_eh $P177
    .lex "self", self
# .annotate "line", 92
    find_lex $P178, "self"
    elements $I179, $P178
# .annotate "line", 91
    .return ($I179)
  control_176:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P180, exception, "payload"
    .return ($P180)
.end


.namespace ["Hash"]
.sub "keys"  :subid("21_1266670842.03161") :method :outer("11_1266670842.03161")
# .annotate "line", 107
    .const 'Sub' $P192 = "22_1266670842.03161" 
    capture_lex $P192
    new $P183, 'ExceptionHandler'
    set_addr $P183, control_182
    $P183."handle_types"(58)
    push_eh $P183
    .lex "self", self
# .annotate "line", 108
    new $P184, "ResizablePMCArray"
    .lex "@keys", $P184
    get_hll_global $P185, ["Array"], "empty"
    $P186 = $P185()
    store_lex "@keys", $P186
# .annotate "line", 110
    find_lex $P188, "self"
    defined $I189, $P188
    unless $I189, for_undef_41
    iter $P187, $P188
    new $P199, 'ExceptionHandler'
    set_addr $P199, loop198_handler
    $P199."handle_types"(65, 67, 66)
    push_eh $P199
  loop198_test:
    unless $P187, loop198_done
    shift $P190, $P187
  loop198_redo:
    .const 'Sub' $P192 = "22_1266670842.03161" 
    capture_lex $P192
    $P192($P190)
  loop198_next:
    goto loop198_test
  loop198_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P200, exception, 'type'
    eq $P200, 65, loop198_next
    eq $P200, 67, loop198_redo
  loop198_done:
    pop_eh 
  for_undef_41:
    find_lex $P201, "@keys"
# .annotate "line", 107
    .return ($P201)
  control_182:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P202, exception, "payload"
    .return ($P202)
.end


.namespace ["Hash"]
.sub "_block191"  :anon :subid("22_1266670842.03161") :outer("21_1266670842.03161")
    .param pmc param_193
# .annotate "line", 110
    .lex "$_", param_193
# .annotate "line", 111
    find_lex $P194, "@keys"
    find_lex $P195, "$_"
    set $S196, $P195
    $P197 = $P194."push"($S196)
# .annotate "line", 110
    .return ($P197)
.end


.namespace ["Hash"]
.sub "new"  :subid("23_1266670842.03161") :method :outer("11_1266670842.03161")
    .param pmc param_208 :slurpy
    .param pmc param_209 :slurpy :named
# .annotate "line", 211
    .const 'Sub' $P214 = "24_1266670842.03161" 
    capture_lex $P214
    new $P207, 'ExceptionHandler'
    set_addr $P207, control_206
    $P207."handle_types"(58)
    push_eh $P207
    .lex "self", self
    .lex "@pos", param_208
    .lex "%pairs", param_209
# .annotate "line", 212
    find_lex $P211, "@pos"
    set $N212, $P211
    unless $N212, if_210_end
    .const 'Sub' $P214 = "24_1266670842.03161" 
    capture_lex $P214
    $P214()
  if_210_end:
    find_lex $P232, "%pairs"
# .annotate "line", 211
    .return ($P232)
  control_206:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P233, exception, "payload"
    .return ($P233)
.end


.namespace ["Hash"]
.sub "_block213"  :anon :subid("24_1266670842.03161") :outer("23_1266670842.03161")
# .annotate "line", 213
    new $P215, "Undef"
    .lex "$message", $P215
    new $P216, "String"
    assign $P216, "Invalid call to Hash.new with positional args."
    store_lex "$message", $P216
# .annotate "line", 215
    get_hll_global $P218, ["Opcode"], "isa"
    find_lex $P219, "@pos"
    unless_null $P219, vivify_42
    new $P219, "ResizablePMCArray"
  vivify_42:
    set $P220, $P219[0]
    unless_null $P220, vivify_43
    new $P220, "Undef"
  vivify_43:
    $P221 = $P218($P220, "NameSpace")
    unless $P221, if_217_end
# .annotate "line", 216
    find_lex $P222, "$message"
    concat $P223, $P222, " "
    concat $P224, $P223, "Likely a call to (Hash-based) "
# .annotate "line", 218
    find_lex $P225, "@pos"
    unless_null $P225, vivify_44
    new $P225, "ResizablePMCArray"
  vivify_44:
    set $P226, $P225[0]
    unless_null $P226, vivify_45
    new $P226, "Undef"
  vivify_45:
    $P227 = $P226."get_name"()
    $S228 = $P227."join"("::")
    concat $P229, $P224, $S228
    concat $P230, $P229, ".new() - before class was created"
# .annotate "line", 219
    store_lex "$message", $P230
  if_217_end:
# .annotate "line", 222
    find_lex $P231, "$message"
    die $P231
# .annotate "line", 212
    .return ()
.end


.namespace []
.sub "_block11"  :anon :subid("10_1266670845.72166")
# .annotate "line", 0
    get_hll_global $P14, ["NameSpace"], "_block13" 
    capture_lex $P14
# .annotate "line", 9
    get_hll_global $P14, ["NameSpace"], "_block13" 
    capture_lex $P14
    $P34 = $P14()
# .annotate "line", 1
    .return ($P34)
.end


.namespace ["NameSpace"]
.sub "_block13"  :subid("11_1266670845.72166") :outer("10_1266670845.72166")
# .annotate "line", 9
    .const 'Sub' $P15 = "12_1266670845.72166" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1266670845.72166" 
    capture_lex $P15
    .return ($P15)
.end


.namespace ["NameSpace"]
.sub "contains"  :subid("12_1266670845.72166") :method :outer("11_1266670845.72166")
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


.namespace []
.sub "_block11"  :anon :subid("10_1266670823.54133")
# .annotate "line", 0
    get_hll_global $P14, ["String"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["String"], "_block13" 
    capture_lex $P14
    $P499 = $P14()
# .annotate "line", 1
    .return ($P499)
.end


.namespace ["String"]
.sub "_block13"  :subid("11_1266670823.54133") :outer("10_1266670823.54133")
# .annotate "line", 7
    .const 'Sub' $P459 = "29_1266670823.54133" 
    capture_lex $P459
    .const 'Sub' $P408 = "28_1266670823.54133" 
    capture_lex $P408
    .const 'Sub' $P397 = "27_1266670823.54133" 
    capture_lex $P397
    .const 'Sub' $P388 = "26_1266670823.54133" 
    capture_lex $P388
    .const 'Sub' $P378 = "25_1266670823.54133" 
    capture_lex $P378
    .const 'Sub' $P353 = "24_1266670823.54133" 
    capture_lex $P353
    .const 'Sub' $P301 = "23_1266670823.54133" 
    capture_lex $P301
    .const 'Sub' $P259 = "22_1266670823.54133" 
    capture_lex $P259
    .const 'Sub' $P225 = "21_1266670823.54133" 
    capture_lex $P225
    .const 'Sub' $P201 = "20_1266670823.54133" 
    capture_lex $P201
    .const 'Sub' $P185 = "19_1266670823.54133" 
    capture_lex $P185
    .const 'Sub' $P151 = "18_1266670823.54133" 
    capture_lex $P151
    .const 'Sub' $P118 = "17_1266670823.54133" 
    capture_lex $P118
    .const 'Sub' $P109 = "16_1266670823.54133" 
    capture_lex $P109
    .const 'Sub' $P69 = "14_1266670823.54133" 
    capture_lex $P69
    .const 'Sub' $P22 = "13_1266670823.54133" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1266670823.54133" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1266670823.54133" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 30
    .const 'Sub' $P22 = "13_1266670823.54133" 
    capture_lex $P22
    .lex "character_offset_of", $P22
# .annotate "line", 52
    .const 'Sub' $P69 = "14_1266670823.54133" 
    capture_lex $P69
    .lex "display_width", $P69
# .annotate "line", 80
    .const 'Sub' $P109 = "16_1266670823.54133" 
    capture_lex $P109
    .lex "downcase", $P109
# .annotate "line", 91
    .const 'Sub' $P118 = "17_1266670823.54133" 
    capture_lex $P118
    .lex "find_cclass", $P118
# .annotate "line", 133
    .const 'Sub' $P151 = "18_1266670823.54133" 
    capture_lex $P151
    .lex "find_not_cclass", $P151
# .annotate "line", 172
    .const 'Sub' $P185 = "19_1266670823.54133" 
    capture_lex $P185
    .lex "index", $P185
# .annotate "line", 195
    .const 'Sub' $P201 = "20_1266670823.54133" 
    capture_lex $P201
    .lex "is_cclass", $P201
# .annotate "line", 239
    .const 'Sub' $P225 = "21_1266670823.54133" 
    capture_lex $P225
    .lex "_init_line_number_info", $P225
# .annotate "line", 274
    .const 'Sub' $P259 = "22_1266670823.54133" 
    capture_lex $P259
    .lex "line_number_of", $P259
# .annotate "line", 304
    .const 'Sub' $P301 = "23_1266670823.54133" 
    capture_lex $P301
    .lex "ltrim_indent", $P301
# .annotate "line", 7
    find_lex $P345, "_pre_initload"
    find_lex $P346, "character_offset_of"
    find_lex $P347, "display_width"
    find_lex $P348, "downcase"
    find_lex $P349, "find_cclass"
    find_lex $P350, "find_not_cclass"
    find_lex $P351, "index"
    find_lex $P352, "is_cclass"
# .annotate "line", 217
    find_lex $P377, "_init_line_number_info"
# .annotate "line", 270
    find_lex $P386, "line_number_of"
    find_lex $P387, "ltrim_indent"
# .annotate "line", 380
    .const 'Sub' $P459 = "29_1266670823.54133" 
    capture_lex $P459
# .annotate "line", 7
    .return ($P459)
.end


.namespace ["String"]
.sub "_pre_initload"  :subid("12_1266670823.54133") :outer("11_1266670823.54133")
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
.sub "character_offset_of"  :subid("13_1266670823.54133") :outer("11_1266670823.54133")
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
.sub "display_width"  :subid("14_1266670823.54133") :outer("11_1266670823.54133")
    .param pmc param_72
# .annotate "line", 52
    .const 'Sub' $P78 = "15_1266670823.54133" 
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
    .const 'Sub' $P78 = "15_1266670823.54133" 
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
.sub "_block77"  :anon :subid("15_1266670823.54133") :outer("14_1266670823.54133")
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
.sub "downcase"  :subid("16_1266670823.54133") :outer("11_1266670823.54133")
    .param pmc param_112
# .annotate "line", 80
    new $P111, 'ExceptionHandler'
    set_addr $P111, control_110
    $P111."handle_types"(58)
    push_eh $P111
    .lex "$str", param_112
# .annotate "line", 81
    new $P113, "Undef"
    .lex "$result", $P113

		$P0 = find_lex '$str'
		$S0 = $P0
		$S0 = downcase $S0
		$P114 = box $S0
	
    store_lex "$result", $P114
# .annotate "line", 88
    new $P115, "Exception"
    set $P115['type'], 58
    find_lex $P116, "$result"
    setattribute $P115, 'payload', $P116
    throw $P115
# .annotate "line", 80
    .return ()
  control_110:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, "payload"
    .return ($P117)
.end


.namespace ["String"]
.sub "find_cclass"  :subid("17_1266670823.54133") :outer("11_1266670823.54133")
    .param pmc param_121
    .param pmc param_122
    .param pmc param_123 :slurpy :named
# .annotate "line", 91
    new $P120, 'ExceptionHandler'
    set_addr $P120, control_119
    $P120."handle_types"(58)
    push_eh $P120
    .lex "$class_name", param_121
    .lex "$str", param_122
    .lex "%opts", param_123
# .annotate "line", 99
    new $P124, "Undef"
    .lex "$offset", $P124
# .annotate "line", 100
    new $P125, "Undef"
    .lex "$count", $P125
# .annotate "line", 106
    get_global $P126, "%Cclass_id"
    unless_null $P126, vivify_43
    new $P126, "Hash"
    set_global "%Cclass_id", $P126
  vivify_43:
# .annotate "line", 107
    new $P127, "Undef"
    .lex "$cclass", $P127
# .annotate "line", 111
    new $P128, "Undef"
    .lex "$result", $P128
# .annotate "line", 99
    new $P129, "Integer"
    assign $P129, 0
    find_lex $P130, "%opts"
    unless_null $P130, vivify_44
    new $P130, "Hash"
  vivify_44:
    set $P131, $P130["offset"]
    unless_null $P131, vivify_45
    new $P131, "Undef"
  vivify_45:
    add $P132, $P129, $P131
    store_lex "$offset", $P132
# .annotate "line", 100
    find_lex $P133, "%opts"
    unless_null $P133, vivify_46
    new $P133, "Hash"
  vivify_46:
    set $P134, $P133["count"]
    unless_null $P134, vivify_47
    new $P134, "Undef"
  vivify_47:
    store_lex "$count", $P134
# .annotate "line", 102
    find_lex $P136, "$count"
    if $P136, unless_135_end
# .annotate "line", 103
    find_lex $P137, "$str"
    $P138 = "length"($P137)
    find_lex $P139, "$offset"
    sub $P140, $P138, $P139
    store_lex "$count", $P140
  unless_135_end:
# .annotate "line", 102
    get_global $P141, "%Cclass_id"
# .annotate "line", 107
    new $P142, "Integer"
    assign $P142, 0
    find_lex $P143, "$class_name"
    get_global $P144, "%Cclass_id"
    unless_null $P144, vivify_48
    new $P144, "Hash"
  vivify_48:
    set $P145, $P144[$P143]
    unless_null $P145, vivify_49
    new $P145, "Undef"
  vivify_49:
    add $P146, $P142, $P145
    store_lex "$cclass", $P146
# .annotate "line", 111

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
		$P147 = box $I0
		
	
    store_lex "$result", $P147
# .annotate "line", 130
    new $P148, "Exception"
    set $P148['type'], 58
    find_lex $P149, "$result"
    setattribute $P148, 'payload', $P149
    throw $P148
# .annotate "line", 91
    .return ()
  control_119:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P150, exception, "payload"
    .return ($P150)
.end


.namespace ["String"]
.sub "find_not_cclass"  :subid("18_1266670823.54133") :outer("11_1266670823.54133")
    .param pmc param_154
    .param pmc param_155
    .param pmc param_156 :slurpy :named
# .annotate "line", 133
    new $P153, 'ExceptionHandler'
    set_addr $P153, control_152
    $P153."handle_types"(58)
    push_eh $P153
    .lex "$class_name", param_154
    .lex "$str", param_155
    .lex "%opts", param_156
# .annotate "line", 138
    new $P157, "Undef"
    .lex "$offset", $P157
# .annotate "line", 144
    new $P158, "Undef"
    .lex "$count", $P158
# .annotate "line", 150
    get_global $P159, "%Cclass_id"
    unless_null $P159, vivify_50
    new $P159, "Hash"
    set_global "%Cclass_id", $P159
  vivify_50:
# .annotate "line", 151
    new $P160, "Undef"
    .lex "$class", $P160
# .annotate "line", 155
    new $P161, "Undef"
    .lex "$result", $P161
# .annotate "line", 138
    find_lex $P162, "%opts"
    unless_null $P162, vivify_51
    new $P162, "Hash"
  vivify_51:
    set $P163, $P162["offset"]
    unless_null $P163, vivify_52
    new $P163, "Undef"
  vivify_52:
    store_lex "$offset", $P163
# .annotate "line", 140
    find_lex $P165, "$offset"
    if $P165, unless_164_end
# .annotate "line", 141
    new $P166, "Integer"
    assign $P166, 0
    store_lex "$offset", $P166
  unless_164_end:
# .annotate "line", 144
    find_lex $P167, "%opts"
    unless_null $P167, vivify_53
    new $P167, "Hash"
  vivify_53:
    set $P168, $P167["count"]
    unless_null $P168, vivify_54
    new $P168, "Undef"
  vivify_54:
    store_lex "$count", $P168
# .annotate "line", 146
    find_lex $P170, "$count"
    if $P170, unless_169_end
# .annotate "line", 147
    find_lex $P171, "$str"
    $P172 = "length"($P171)
    find_lex $P173, "$offset"
    sub $P174, $P172, $P173
    store_lex "$count", $P174
  unless_169_end:
# .annotate "line", 146
    get_global $P175, "%Cclass_id"
# .annotate "line", 151
    new $P176, "Integer"
    assign $P176, 0
    find_lex $P177, "$class_name"
    get_global $P178, "%Cclass_id"
    unless_null $P178, vivify_55
    new $P178, "Hash"
  vivify_55:
    set $P179, $P178[$P177]
    unless_null $P179, vivify_56
    new $P179, "Undef"
  vivify_56:
    add $P180, $P176, $P179
    store_lex "$class", $P180
# .annotate "line", 155

		$P0 = find_lex '$class'
		$I1 = $P0
		$P0 = find_lex '$str'
		$S2 = $P0
		$P0 = find_lex '$offset'
		$I3 = $P0
		$P0 = find_lex '$count'
		$I4 = $P0
		$I0 = find_not_cclass $I1, $S2, $I3, $I4
		$P181 = box $I0
	
    store_lex "$result", $P181
# .annotate "line", 169
    new $P182, "Exception"
    set $P182['type'], 58
    find_lex $P183, "$result"
    setattribute $P182, 'payload', $P183
    throw $P182
# .annotate "line", 133
    .return ()
  control_152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P184, exception, "payload"
    .return ($P184)
.end


.namespace ["String"]
.sub "index"  :subid("19_1266670823.54133") :outer("11_1266670823.54133")
    .param pmc param_188
    .param pmc param_189
    .param pmc param_190 :slurpy :named
# .annotate "line", 172
    new $P187, 'ExceptionHandler'
    set_addr $P187, control_186
    $P187."handle_types"(58)
    push_eh $P187
    .lex "$haystack", param_188
    .lex "$needle", param_189
    .lex "%opts", param_190
# .annotate "line", 173
    new $P191, "Undef"
    .lex "$offset", $P191
# .annotate "line", 175
    new $P192, "Undef"
    .lex "$result", $P192
# .annotate "line", 173
    new $P193, "Integer"
    assign $P193, 0
    find_lex $P194, "%opts"
    unless_null $P194, vivify_57
    new $P194, "Hash"
  vivify_57:
    set $P195, $P194["offset"]
    unless_null $P195, vivify_58
    new $P195, "Undef"
  vivify_58:
    add $P196, $P193, $P195
    store_lex "$offset", $P196
# .annotate "line", 175

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
		$P197 = box $I0
	
    store_lex "$result", $P197
# .annotate "line", 192
    new $P198, "Exception"
    set $P198['type'], 58
    find_lex $P199, "$result"
    setattribute $P198, 'payload', $P199
    throw $P198
# .annotate "line", 172
    .return ()
  control_186:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P200, exception, "payload"
    .return ($P200)
.end


.namespace ["String"]
.sub "is_cclass"  :subid("20_1266670823.54133") :outer("11_1266670823.54133")
    .param pmc param_204
    .param pmc param_205
    .param pmc param_206 :slurpy :named
# .annotate "line", 195
    new $P203, 'ExceptionHandler'
    set_addr $P203, control_202
    $P203."handle_types"(58)
    push_eh $P203
    .lex "$class_name", param_204
    .lex "$str", param_205
    .lex "%opts", param_206
# .annotate "line", 196
    get_global $P207, "%Cclass_id"
    unless_null $P207, vivify_59
    new $P207, "Hash"
    set_global "%Cclass_id", $P207
  vivify_59:
# .annotate "line", 197
    new $P208, "Undef"
    .lex "$offset", $P208
# .annotate "line", 198
    new $P209, "Undef"
    .lex "$class", $P209
# .annotate "line", 202
    new $P210, "Undef"
    .lex "$result", $P210
# .annotate "line", 195
    get_global $P211, "%Cclass_id"
# .annotate "line", 197
    new $P212, "Integer"
    assign $P212, 0
    find_lex $P213, "%opts"
    unless_null $P213, vivify_60
    new $P213, "Hash"
  vivify_60:
    set $P214, $P213["offset"]
    unless_null $P214, vivify_61
    new $P214, "Undef"
  vivify_61:
    add $P215, $P212, $P214
    store_lex "$offset", $P215
# .annotate "line", 198
    new $P216, "Integer"
    assign $P216, 0
    find_lex $P217, "$class_name"
    get_global $P218, "%Cclass_id"
    unless_null $P218, vivify_62
    new $P218, "Hash"
  vivify_62:
    set $P219, $P218[$P217]
    unless_null $P219, vivify_63
    new $P219, "Undef"
  vivify_63:
    add $P220, $P216, $P219
    store_lex "$class", $P220
# .annotate "line", 202

		$P0 = find_lex '$class'
		$I1 = $P0
		$P0 = find_lex '$str'
		$S2 = $P0
		$P0 = find_lex '$offset'
		$I3 = $P0
		$I0 = is_cclass $I1, $S2, $I3
		$P221 = box $I0
	
    store_lex "$result", $P221
# .annotate "line", 214
    new $P222, "Exception"
    set $P222['type'], 58
    find_lex $P223, "$result"
    setattribute $P222, 'payload', $P223
    throw $P222
# .annotate "line", 195
    .return ()
  control_202:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P224, exception, "payload"
    .return ($P224)
.end


.namespace ["String"]
.sub "_init_line_number_info"  :subid("21_1266670823.54133") :outer("11_1266670823.54133")
    .param pmc param_228
# .annotate "line", 239
    new $P227, 'ExceptionHandler'
    set_addr $P227, control_226
    $P227."handle_types"(58)
    push_eh $P227
    .lex "$string", param_228
# .annotate "line", 243
    new $P229, "ResizablePMCArray"
    .lex "@lines", $P229
# .annotate "line", 244
    new $P230, "Undef"
    .lex "$len", $P230
# .annotate "line", 245
    new $P231, "Undef"
    .lex "$i", $P231
# .annotate "line", 252
    get_global $P232, "%Line_number_info"
    unless_null $P232, vivify_64
    new $P232, "Hash"
    set_global "%Line_number_info", $P232
  vivify_64:
# .annotate "line", 243
    get_hll_global $P233, ["Array"], "new"
    $P234 = $P233(-1)
    store_lex "@lines", $P234
# .annotate "line", 244
    get_hll_global $P235, ["String"], "length"
    find_lex $P236, "$string"
    $P237 = $P235($P236)
    store_lex "$len", $P237
# .annotate "line", 245
    new $P238, "Integer"
    assign $P238, -1
    store_lex "$i", $P238
# .annotate "line", 247
    new $P252, 'ExceptionHandler'
    set_addr $P252, loop251_handler
    $P252."handle_types"(65, 67, 66)
    push_eh $P252
  loop251_test:
    find_lex $P239, "$i"
    set $N240, $P239
    find_lex $P241, "$len"
    set $N242, $P241
    islt $I243, $N240, $N242
    unless $I243, loop251_done
  loop251_redo:
# .annotate "line", 248
    get_hll_global $P244, ["String"], "find_cclass"
    find_lex $P245, "$string"
    find_lex $P246, "$i"
    add $P247, $P246, 1
    $P248 = $P244("NEWLINE", $P245, $P247 :named("offset"))
    store_lex "$i", $P248
# .annotate "line", 249
    find_lex $P249, "@lines"
    find_lex $P250, "$i"
    $P249."push"($P250)
  loop251_next:
# .annotate "line", 247
    goto loop251_test
  loop251_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P253, exception, 'type'
    eq $P253, 65, loop251_next
    eq $P253, 67, loop251_redo
  loop251_done:
    pop_eh 
    get_global $P254, "%Line_number_info"
# .annotate "line", 254
    find_lex $P255, "@lines"
    find_lex $P256, "$string"
    get_global $P257, "%Line_number_info"
    unless_null $P257, vivify_65
    new $P257, "Hash"
    set_global "%Line_number_info", $P257
  vivify_65:
    set $P257[$P256], $P255
# .annotate "line", 239
    .return ($P255)
  control_226:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P258, exception, "payload"
    .return ($P258)
.end


.namespace ["String"]
.sub "line_number_of"  :subid("22_1266670823.54133") :outer("11_1266670823.54133")
    .param pmc param_262
    .param pmc param_263 :slurpy :named
# .annotate "line", 274
    new $P261, 'ExceptionHandler'
    set_addr $P261, control_260
    $P261."handle_types"(58)
    push_eh $P261
    .lex "$string", param_262
    .lex "%opts", param_263
# .annotate "line", 282
    get_global $P264, "%Line_number_info"
    unless_null $P264, vivify_66
    new $P264, "Hash"
    set_global "%Line_number_info", $P264
  vivify_66:
# .annotate "line", 288
    new $P265, "Undef"
    .lex "$offset", $P265
# .annotate "line", 292
    new $P266, "Undef"
    .lex "$line", $P266
# .annotate "line", 275
    find_lex $P267, "$string"
    find_lex $P268, "%opts"
    "DUMP"($P267 :named("string"), $P268 :named("options"))
# .annotate "line", 277
    find_lex $P270, "$string"
    if $P270, unless_269_end
# .annotate "line", 278
    "NOTE"("String is empty or undef. Returning 1")
# .annotate "line", 279
    new $P271, "Exception"
    set $P271['type'], 58
    new $P272, "Integer"
    assign $P272, 1
    setattribute $P271, 'payload', $P272
    throw $P271
  unless_269_end:
# .annotate "line", 277
    get_global $P273, "%Line_number_info"
# .annotate "line", 284
    find_lex $P275, "$string"
    get_global $P276, "%Line_number_info"
    unless_null $P276, vivify_67
    new $P276, "Hash"
  vivify_67:
    set $P277, $P276[$P275]
    unless_null $P277, vivify_68
    new $P277, "Undef"
  vivify_68:
    if $P277, unless_274_end
# .annotate "line", 285
    find_lex $P278, "$string"
    "_init_line_number_info"($P278)
  unless_274_end:
# .annotate "line", 288
    new $P279, "Integer"
    assign $P279, 0
    find_lex $P280, "%opts"
    unless_null $P280, vivify_69
    new $P280, "Hash"
  vivify_69:
    set $P281, $P280["offset"]
    unless_null $P281, vivify_70
    new $P281, "Undef"
  vivify_70:
    add $P282, $P279, $P281
    store_lex "$offset", $P282
# .annotate "line", 290
    find_lex $P283, "$offset"
    "NOTE"("Bsearching for line number of ", $P283, " in string")
# .annotate "line", 292
    get_hll_global $P284, ["Array"], "bsearch"
    find_lex $P285, "$string"
    get_global $P286, "%Line_number_info"
    unless_null $P286, vivify_71
    new $P286, "Hash"
  vivify_71:
    set $P287, $P286[$P285]
    unless_null $P287, vivify_72
    new $P287, "Undef"
  vivify_72:
    find_lex $P288, "$offset"
    $P289 = $P284($P287, $P288, "<=>" :named("cmp"))
    store_lex "$line", $P289
# .annotate "line", 294
    find_lex $P291, "$line"
    set $N292, $P291
    islt $I293, $N292, 0.0
    unless $I293, if_290_end
# .annotate "line", 296
    find_lex $P294, "$line"
    neg $P295, $P294
    sub $P296, $P295, 1
    store_lex "$line", $P296
  if_290_end:
# .annotate "line", 300
    find_lex $P297, "$line"
    "NOTE"("Returning line number (1-based): ", $P297)
# .annotate "line", 301
    new $P298, "Exception"
    set $P298['type'], 58
    find_lex $P299, "$line"
    setattribute $P298, 'payload', $P299
    throw $P298
# .annotate "line", 274
    .return ()
  control_260:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P300, exception, "payload"
    .return ($P300)
.end


.namespace ["String"]
.sub "ltrim_indent"  :subid("23_1266670823.54133") :outer("11_1266670823.54133")
    .param pmc param_304
    .param pmc param_305
# .annotate "line", 304
    new $P303, 'ExceptionHandler'
    set_addr $P303, control_302
    $P303."handle_types"(58)
    push_eh $P303
    .lex "$str", param_304
    .lex "$indent", param_305
# .annotate "line", 305
    new $P306, "Undef"
    .lex "$limit", $P306
# .annotate "line", 307
    new $P307, "Undef"
    .lex "$i", $P307
# .annotate "line", 308
    new $P308, "Undef"
    .lex "$prefix", $P308
# .annotate "line", 305
    find_lex $P309, "$str"
    $P310 = "find_not_cclass"("WHITESPACE", $P309)
    store_lex "$limit", $P310
# .annotate "line", 307
    new $P311, "Integer"
    assign $P311, 0
    store_lex "$i", $P311
# .annotate "line", 308
    new $P312, "Integer"
    assign $P312, 0
    store_lex "$prefix", $P312
# .annotate "line", 310
    new $P338, 'ExceptionHandler'
    set_addr $P338, loop337_handler
    $P338."handle_types"(65, 67, 66)
    push_eh $P338
  loop337_test:
    find_lex $P315, "$i"
    set $N316, $P315
    find_lex $P317, "$limit"
    set $N318, $P317
    islt $I319, $N316, $N318
    if $I319, if_314
    new $P313, 'Integer'
    set $P313, $I319
    goto if_314_end
  if_314:
    find_lex $P320, "$prefix"
    set $N321, $P320
    find_lex $P322, "$indent"
    set $N323, $P322
    islt $I324, $N321, $N323
    new $P313, 'Integer'
    set $P313, $I324
  if_314_end:
    unless $P313, loop337_done
  loop337_redo:
# .annotate "line", 311
    find_lex $P326, "$str"
    find_lex $P327, "$i"
    $S328 = "char_at"($P326, $P327)
    iseq $I329, $S328, "\t"
    if $I329, if_325
# .annotate "line", 314
    find_lex $P335, "$prefix"
    clone $P336, $P335
    inc $P335
    goto if_325_end
  if_325:
# .annotate "line", 312
    find_lex $P330, "$prefix"
    add $P331, $P330, 8
    find_lex $P332, "$prefix"
    mod $P333, $P332, 8
    sub $P334, $P331, $P333
    store_lex "$prefix", $P334
  if_325_end:
  loop337_next:
# .annotate "line", 310
    goto loop337_test
  loop337_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P339, exception, 'type'
    eq $P339, 65, loop337_next
    eq $P339, 67, loop337_redo
  loop337_done:
    pop_eh 
# .annotate "line", 319
    new $P340, "Exception"
    set $P340['type'], 58
    find_lex $P341, "$str"
    find_lex $P342, "$i"
    $P343 = "substr"($P341, $P342)
    setattribute $P340, 'payload', $P343
    throw $P340
# .annotate "line", 304
    .return ()
  control_302:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P344, exception, "payload"
    .return ($P344)
.end


.namespace ["String"]
.sub "length"  :subid("24_1266670823.54133") :method :outer("11_1266670823.54133")
    .param pmc param_356 :slurpy :named
# .annotate "line", 217
    new $P355, 'ExceptionHandler'
    set_addr $P355, control_354
    $P355."handle_types"(58)
    push_eh $P355
    .lex "self", self
    .lex "%opts", param_356
# .annotate "line", 218
    new $P357, "Undef"
    .lex "$offset", $P357
# .annotate "line", 222
    new $P358, "Undef"
    .lex "$result", $P358
# .annotate "line", 218
    new $P359, "Integer"
    assign $P359, 0
    find_lex $P360, "%opts"
    unless_null $P360, vivify_73
    new $P360, "Hash"
  vivify_73:
    set $P361, $P360["offset"]
    unless_null $P361, vivify_74
    new $P361, "Undef"
  vivify_74:
    add $P362, $P359, $P361
    store_lex "$offset", $P362
# .annotate "line", 222

		$P0 = find_lex 'self'
		$S0 = $P0
		$I0 = length $S0
		$P363 = box $I0
	
    store_lex "$result", $P363
# .annotate "line", 229
    find_lex $P365, "$offset"
    set $N366, $P365
    find_lex $P367, "$result"
    set $N368, $P367
    isgt $I369, $N366, $N368
    unless $I369, if_364_end
# .annotate "line", 230
    find_lex $P370, "$result"
    store_lex "$offset", $P370
  if_364_end:
# .annotate "line", 233
    find_lex $P371, "$result"
    find_lex $P372, "$offset"
    sub $P373, $P371, $P372
    store_lex "$result", $P373
# .annotate "line", 236
    new $P374, "Exception"
    set $P374['type'], 58
    find_lex $P375, "$result"
    setattribute $P374, 'payload', $P375
    throw $P374
# .annotate "line", 217
    .return ()
  control_354:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P376, exception, "payload"
    .return ($P376)
.end


.namespace ["String"]
.sub "isa"  :subid("25_1266670823.54133") :method :outer("11_1266670823.54133")
    .param pmc param_381
# .annotate "line", 270
    new $P380, 'ExceptionHandler'
    set_addr $P380, control_379
    $P380."handle_types"(58)
    push_eh $P380
    .lex "self", self
    .lex "$type", param_381
# .annotate "line", 271
    find_lex $P382, "self"
    find_lex $P383, "$type"
    isa $I384, $P382, $P383
# .annotate "line", 270
    .return ($I384)
  control_379:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P385, exception, "payload"
    .return ($P385)
.end


.namespace ["String"]
.sub "repeat"  :subid("26_1266670823.54133") :method :outer("11_1266670823.54133")
    .param pmc param_391
# .annotate "line", 322
    new $P390, 'ExceptionHandler'
    set_addr $P390, control_389
    $P390."handle_types"(58)
    push_eh $P390
    .lex "self", self
    .lex "$times", param_391
# .annotate "line", 323
    new $P392, "Undef"
    .lex "$result", $P392

		$P0 = find_lex 'self'
		$S0 = $P0
		$P0 = find_lex '$times'
		$I0 = $P0
		$S1 = repeat $S0, $I0
		$P393 = box $S1
	
    store_lex "$result", $P393
# .annotate "line", 332
    new $P394, "Exception"
    set $P394['type'], 58
    find_lex $P395, "$result"
    setattribute $P394, 'payload', $P395
    throw $P394
# .annotate "line", 322
    .return ()
  control_389:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P396, exception, "payload"
    .return ($P396)
.end


.namespace ["String"]
.sub "split"  :subid("27_1266670823.54133") :method :outer("11_1266670823.54133")
    .param pmc param_400 :optional
    .param int has_param_400 :opt_flag
# .annotate "line", 335
    new $P399, 'ExceptionHandler'
    set_addr $P399, control_398
    $P399."handle_types"(58)
    push_eh $P399
    .lex "self", self
    if has_param_400, optparam_75
    new $P401, "Undef"
    set param_400, $P401
  optparam_75:
    .lex "$delim", param_400
# .annotate "line", 336
    find_lex $P402, "$delim"
    set $S403, $P402
    find_lex $P404, "self"
    set $S405, $P404
    split $P406, $S403, $S405
# .annotate "line", 335
    .return ($P406)
  control_398:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P407, exception, "payload"
    .return ($P407)
.end


.namespace ["String"]
.sub "substr"  :subid("28_1266670823.54133") :method :outer("11_1266670823.54133")
    .param pmc param_411
    .param pmc param_412 :slurpy
# .annotate "line", 339
    new $P410, 'ExceptionHandler'
    set_addr $P410, control_409
    $P410."handle_types"(58)
    push_eh $P410
    .lex "self", self
    .lex "$start", param_411
    .lex "@rest", param_412
# .annotate "line", 340
    new $P413, "Undef"
    .lex "$len", $P413
# .annotate "line", 352
    new $P414, "Undef"
    .lex "$limit", $P414
# .annotate "line", 366
    new $P415, "Undef"
    .lex "$result", $P415
# .annotate "line", 340
    find_lex $P416, "self"
    $P417 = "length"($P416)
    store_lex "$len", $P417
# .annotate "line", 342
    find_lex $P419, "$start"
    set $N420, $P419
    islt $I421, $N420, 0.0
    unless $I421, if_418_end
# .annotate "line", 343
    find_lex $P422, "$start"
    find_lex $P423, "$len"
    add $P424, $P422, $P423
    store_lex "$start", $P424
  if_418_end:
# .annotate "line", 346
    find_lex $P426, "$start"
    set $N427, $P426
    find_lex $P428, "$len"
    set $N429, $P428
    isgt $I430, $N427, $N429
    unless $I430, if_425_end
# .annotate "line", 347
    find_lex $P431, "$len"
    store_lex "$start", $P431
  if_425_end:
# .annotate "line", 350
    find_lex $P432, "$len"
    find_lex $P433, "$start"
    sub $P434, $P432, $P433
    store_lex "$len", $P434
# .annotate "line", 352
    find_lex $P435, "$len"
    store_lex "$limit", $P435
# .annotate "line", 354
    find_lex $P437, "@rest"
    set $N438, $P437
    unless $N438, if_436_end
# .annotate "line", 355
    find_lex $P439, "@rest"
    $P440 = $P439."shift"()
    store_lex "$limit", $P440
# .annotate "line", 357
    find_lex $P442, "$limit"
    set $N443, $P442
    islt $I444, $N443, 0.0
    unless $I444, if_441_end
# .annotate "line", 358
    find_lex $P445, "$limit"
    find_lex $P446, "$len"
    add $P447, $P445, $P446
    store_lex "$limit", $P447
  if_441_end:
# .annotate "line", 361
    find_lex $P449, "$limit"
    set $N450, $P449
    find_lex $P451, "$len"
    set $N452, $P451
    isgt $I453, $N450, $N452
    unless $I453, if_448_end
# .annotate "line", 362
    find_lex $P454, "$len"
    store_lex "$limit", $P454
  if_448_end:
  if_436_end:
# .annotate "line", 366

		$P0 = find_lex 'self'
		$S0 = $P0
		$P0 = find_lex '$start'
		$I0 = $P0
		$P0 = find_lex '$limit'
		$I1 = $P0
		$S1 = substr $S0, $I0, $I1
		$P455 = box $S1
	
    store_lex "$result", $P455
# .annotate "line", 377
    new $P456, "Exception"
    set $P456['type'], 58
    find_lex $P457, "$result"
    setattribute $P456, 'payload', $P457
    throw $P456
# .annotate "line", 339
    .return ()
  control_409:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P458, exception, "payload"
    .return ($P458)
.end


.namespace ["String"]
.sub "trim"  :subid("29_1266670823.54133") :method :outer("11_1266670823.54133")
# .annotate "line", 380
    .const 'Sub' $P477 = "30_1266670823.54133" 
    capture_lex $P477
    new $P461, 'ExceptionHandler'
    set_addr $P461, control_460
    $P461."handle_types"(58)
    push_eh $P461
    .lex "self", self
# .annotate "line", 381
    new $P462, "Undef"
    .lex "$result", $P462
# .annotate "line", 382
    new $P463, "Undef"
    .lex "$left", $P463
# .annotate "line", 385
    new $P464, "Undef"
    .lex "$len", $P464
# .annotate "line", 381
    new $P465, "String"
    assign $P465, ""
    store_lex "$result", $P465
# .annotate "line", 382
    find_lex $P466, "self"
    $P467 = "find_not_cclass"("WHITESPACE", $P466)
    store_lex "$left", $P467
# .annotate "line", 385
    find_lex $P468, "self"
    $P469 = "length"($P468)
    store_lex "$len", $P469
# .annotate "line", 388
    find_lex $P471, "$left"
    set $N472, $P471
    find_lex $P473, "$len"
    set $N474, $P473
    islt $I475, $N472, $N474
    unless $I475, if_470_end
    .const 'Sub' $P477 = "30_1266670823.54133" 
    capture_lex $P477
    $P477()
  if_470_end:
# .annotate "line", 402
    new $P496, "Exception"
    set $P496['type'], 58
    find_lex $P497, "$result"
    setattribute $P496, 'payload', $P497
    throw $P496
# .annotate "line", 380
    .return ()
  control_460:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P498, exception, "payload"
    .return ($P498)
.end


.namespace ["String"]
.sub "_block476"  :anon :subid("30_1266670823.54133") :outer("29_1266670823.54133")
# .annotate "line", 389
    new $P478, "Undef"
    .lex "$right", $P478
    find_lex $P479, "$len"
    sub $P480, $P479, 1
    store_lex "$right", $P480
# .annotate "line", 391
    new $P487, 'ExceptionHandler'
    set_addr $P487, loop486_handler
    $P487."handle_types"(65, 67, 66)
    push_eh $P487
  loop486_test:
    find_lex $P481, "self"
    find_lex $P482, "$right"
    $P483 = "is_cclass"("WHITESPACE", $P481, $P482 :named("offset"))
    unless $P483, loop486_done
  loop486_redo:
    find_lex $P484, "$right"
    clone $P485, $P484
    dec $P484
  loop486_next:
    goto loop486_test
  loop486_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P488, exception, 'type'
    eq $P488, 65, loop486_next
    eq $P488, 67, loop486_redo
  loop486_done:
    pop_eh 
# .annotate "line", 398
    find_lex $P489, "self"
    find_lex $P490, "$left"
    find_lex $P491, "$right"
    find_lex $P492, "$left"
    sub $P493, $P491, $P492
    add $P494, $P493, 1
    $P495 = "substr"($P489, $P490, $P494)
    store_lex "$result", $P495
# .annotate "line", 388
    .return ($P495)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1266670800.43098")
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
.sub "_block13"  :subid("11_1266670800.43098") :outer("10_1266670800.43098")
# .annotate "line", 6
    .const 'Sub' $P37 = "14_1266670800.43098" 
    capture_lex $P37
    .const 'Sub' $P22 = "13_1266670800.43098" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1266670800.43098" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1266670800.43098" 
    capture_lex $P15
    .lex "set_dump_detail", $P15
# .annotate "line", 10
    .const 'Sub' $P22 = "13_1266670800.43098" 
    capture_lex $P22
    .lex "get_dump_detail", $P22
# .annotate "line", 6
    find_lex $P35, "set_dump_detail"
    find_lex $P36, "get_dump_detail"
# .annotate "line", 20
    .const 'Sub' $P37 = "14_1266670800.43098" 
    capture_lex $P37
# .annotate "line", 6
    .return ($P37)
.end


.namespace ["Sub"]
.sub "set_dump_detail"  :subid("12_1266670800.43098") :outer("11_1266670800.43098")
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
.sub "get_dump_detail"  :subid("13_1266670800.43098") :outer("11_1266670800.43098")
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
.sub "__dump"  :subid("14_1266670800.43098") :method :outer("11_1266670800.43098")
    .param pmc param_40
    .param pmc param_41
# .annotate "line", 20
    .const 'Sub' $P62 = "15_1266670800.43098" 
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
    .const 'Sub' $P62 = "15_1266670800.43098" 
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
.sub "_block61"  :anon :subid("15_1266670800.43098") :outer("14_1266670800.43098")
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
.sub "_block11"  :anon :subid("10_1266670807.94109")
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
.sub "_block13"  :subid("11_1266670807.94109") :outer("10_1266670807.94109")
# .annotate "line", 7
    .const 'Sub' $P15 = "12_1266670807.94109" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1266670807.94109" 
    capture_lex $P15
    .return ($P15)
.end


.namespace ["Undef"]
.sub "defined"  :subid("12_1266670807.94109") :method :outer("11_1266670807.94109")
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
	$P0()
.end
