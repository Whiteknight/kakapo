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
.sub "_block11"  :anon :subid("10_1267109960.2542")
# .annotate "line", 0
    get_hll_global $P14, ["Kakapo"], "_block13" 
    capture_lex $P14
# .annotate "line", 8
    get_hll_global $P14, ["Kakapo"], "_block13" 
    capture_lex $P14
    $P85 = $P14()
# .annotate "line", 1
    .return ($P85)
.end


.namespace ["Kakapo"]
.sub "_block13"  :subid("11_1267109960.2542") :outer("10_1267109960.2542")
# .annotate "line", 8
    .const 'Sub' $P43 = "16_1267109960.2542" 
    capture_lex $P43
    .const 'Sub' $P38 = "15_1267109960.2542" 
    capture_lex $P38
    .const 'Sub' $P33 = "14_1267109960.2542" 
    capture_lex $P33
    .const 'Sub' $P20 = "13_1267109960.2542" 
    capture_lex $P20
    .const 'Sub' $P15 = "12_1267109960.2542" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1267109960.2542" 
    capture_lex $P15
    .lex "get_preinit_subs", $P15
# .annotate "line", 29
    .const 'Sub' $P20 = "13_1267109960.2542" 
    capture_lex $P20
    .lex "program_instance", $P20
# .annotate "line", 35
    .const 'Sub' $P33 = "14_1267109960.2542" 
    capture_lex $P33
    .lex "library_init_done", $P33
# .annotate "line", 39
    .const 'Sub' $P38 = "15_1267109960.2542" 
    capture_lex $P38
    .lex "library_load_done", $P38
# .annotate "line", 43
    .const 'Sub' $P43 = "16_1267109960.2542" 
    capture_lex $P43
    .lex "library_initload_done", $P43
# .annotate "line", 8
    find_lex $P80, "get_preinit_subs"
    find_lex $P81, "program_instance"
    find_lex $P82, "library_init_done"
    find_lex $P83, "library_load_done"
    find_lex $P84, "library_initload_done"
    .return ($P84)
.end


.namespace ["Kakapo"]
.sub "get_preinit_subs"  :subid("12_1267109960.2542") :outer("11_1267109960.2542")
# .annotate "line", 8
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 12
    new $P18, "ResizablePMCArray"
    push $P18, "Global"
    push $P18, "Opcode"
    push $P18, "Parrot"
    push $P18, "Pir"
    push $P18, "Key"
    push $P18, "Array"
    push $P18, "Kakapo::Pmc::COMMON"
    push $P18, "String"
    push $P18, "Exception"
    push $P18, "Syntax"
    push $P18, "P6metaclass"
    push $P18, "P6object"
    push $P18, "DependencyQueue"
    push $P18, "Program"
# .annotate "line", 8
    .return ($P18)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P19, exception, "payload"
    .return ($P19)
.end


.namespace ["Kakapo"]
.sub "program_instance"  :subid("13_1267109960.2542") :outer("11_1267109960.2542")
    .param pmc param_23 :optional
    .param int has_param_23 :opt_flag
# .annotate "line", 29
    new $P22, 'ExceptionHandler'
    set_addr $P22, control_21
    $P22."handle_types"(58)
    push_eh $P22
    if has_param_23, optparam_17
    new $P24, "Undef"
    set param_23, $P24
  optparam_17:
    .lex "$value", param_23
# .annotate "line", 31
    get_global $P25, "$_Program_instance"
    unless_null $P25, vivify_18
    new $P25, "Undef"
    set_global "$_Program_instance", $P25
  vivify_18:
# .annotate "line", 30
    find_lex $P28, "$value"
    $P29 = $P28."defined"()
    if $P29, if_27
    get_global $P31, "$_Program_instance"
    set $P26, $P31
    goto if_27_end
  if_27:
# .annotate "line", 31
    find_lex $P30, "$value"
    set_global "$_Program_instance", $P30
    set $P26, $P30
  if_27_end:
# .annotate "line", 29
    .return ($P26)
  control_21:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P32, exception, "payload"
    .return ($P32)
.end


.namespace ["Kakapo"]
.sub "library_init_done"  :subid("14_1267109960.2542") :outer("11_1267109960.2542")
# .annotate "line", 35
    new $P35, 'ExceptionHandler'
    set_addr $P35, control_34
    $P35."handle_types"(58)
    push_eh $P35
# .annotate "line", 36
    $P36 = "library_initload_done"()
# .annotate "line", 35
    .return ($P36)
  control_34:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P37, exception, "payload"
    .return ($P37)
.end


.namespace ["Kakapo"]
.sub "library_load_done"  :subid("15_1267109960.2542") :outer("11_1267109960.2542")
# .annotate "line", 39
    new $P40, 'ExceptionHandler'
    set_addr $P40, control_39
    $P40."handle_types"(58)
    push_eh $P40
# .annotate "line", 40
    $P41 = "library_initload_done"()
# .annotate "line", 39
    .return ($P41)
  control_39:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P42, exception, "payload"
    .return ($P42)
.end


.namespace ["Kakapo"]
.sub "library_initload_done"  :subid("16_1267109960.2542") :outer("11_1267109960.2542")
# .annotate "line", 43
    new $P45, 'ExceptionHandler'
    set_addr $P45, control_44
    $P45."handle_types"(58)
    push_eh $P45
# .annotate "line", 44
    new $P46, "Undef"
    .lex "$interp", $P46
# .annotate "line", 46
    new $P47, "Undef"
    .lex "&getpid", $P47
# .annotate "line", 47
    new $P48, "Undef"
    .lex "&getuid", $P48
# .annotate "line", 44
    getinterp $P49
    store_lex "$interp", $P49
# .annotate "line", 46
    null $P50
    new $P51, "String"
    assign $P51, "getpid"
    set $S52, $P51
    new $P53, "String"
    assign $P53, "i"
    set $S54, $P53
    dlfunc $P55, $P50, $S52, $S54
    store_lex "&getpid", $P55
# .annotate "line", 47
    null $P56
    new $P57, "String"
    assign $P57, "getuid"
    set $S58, $P57
    new $P59, "String"
    assign $P59, "i"
    set $S60, $P59
    dlfunc $P61, $P56, $S58, $S60
    store_lex "&getuid", $P61
# .annotate "line", 50
    get_hll_global $P62, "Program"
    find_lex $P63, "$interp"
    unless_null $P63, vivify_19
    new $P63, "ResizablePMCArray"
  vivify_19:
    set $P64, $P63[2]
    unless_null $P64, vivify_20
    new $P64, "Undef"
  vivify_20:
# .annotate "line", 52
    new $P65, "String"
    assign $P65, "Env"
    set $S66, $P65
    new $P67, $S66
    find_lex $P68, "$interp"
    unless_null $P68, vivify_21
    new $P68, "ResizablePMCArray"
  vivify_21:
    set $P69, $P68[9]
    unless_null $P69, vivify_22
    new $P69, "Undef"
  vivify_22:
# .annotate "line", 54
    find_lex $P70, "&getpid"
    $P71 = $P70()
# .annotate "line", 55
    find_lex $P72, "&getuid"
    $P73 = $P72()
# .annotate "line", 56
    getstdin $P74
# .annotate "line", 57
    getstderr $P75
# .annotate "line", 58
    getstdout $P76
    $P77 = $P62."new"($P64 :named("args"), $P67 :named("env"), $P69 :named("executable"), $P71 :named("process_id"), $P73 :named("uid"), $P74 :named("stdin"), $P75 :named("stderr"), $P76 :named("stdout"))
# .annotate "line", 50
    $P78 = "program_instance"($P77)
# .annotate "line", 43
    .return ($P78)
  control_44:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P79, exception, "payload"
    .return ($P79)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109893.9132")
# .annotate "line", 0
    get_hll_global $P14, ["Global"], "_block13" 
    capture_lex $P14
# .annotate "line", 32
    get_hll_global $P14, ["Global"], "_block13" 
    capture_lex $P14
    $P332 = $P14()
# .annotate "line", 1
    .return ($P332)
.end


.namespace ["Global"]
.sub "_block13"  :subid("11_1267109893.9132") :outer("10_1267109893.9132")
# .annotate "line", 32
    .const 'Sub' $P200 = "19_1267109893.9132" 
    capture_lex $P200
    .const 'Sub' $P172 = "18_1267109893.9132" 
    capture_lex $P172
    .const 'Sub' $P133 = "17_1267109893.9132" 
    capture_lex $P133
    .const 'Sub' $P117 = "16_1267109893.9132" 
    capture_lex $P117
    .const 'Sub' $P22 = "13_1267109893.9132" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1267109893.9132" 
    capture_lex $P15
# .annotate "line", 155
    .const 'Sub' $P200 = "19_1267109893.9132" 
    capture_lex $P200
# .annotate "line", 32
    .return ($P200)
.end


.namespace ["Global"]
.sub "_pre_initload"  :subid("12_1267109893.9132") :outer("11_1267109893.9132")
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
.sub "export"  :subid("13_1267109893.9132") :outer("11_1267109893.9132")
    .param pmc param_25
    .param pmc param_26 :slurpy
    .param pmc param_27 :optional :named("as")
    .param int has_param_27 :opt_flag
    .param pmc param_29 :optional :named("namespace")
    .param int has_param_29 :opt_flag
    .param pmc param_31 :optional :named("tags")
    .param int has_param_31 :opt_flag
# .annotate "line", 68
    .const 'Sub' $P81 = "14_1267109893.9132" 
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
# .annotate "line", 79
    new $P33, "Undef"
    .lex "$source_nsp", $P33
# .annotate "line", 87
    new $P34, "Undef"
    .lex "$export_nsp", $P34
# .annotate "line", 69
    find_lex $P36, "$symbol"
    new $P37, "String"
    assign $P37, "String"
    set $S38, $P37
    isa $I39, $P36, $S38
    if $I39, if_35
# .annotate "line", 73
    find_lex $P42, "$symbol"
    store_lex "@symbols", $P42
# .annotate "line", 72
    goto if_35_end
  if_35:
# .annotate "line", 70
    find_lex $P40, "@symbols"
    find_lex $P41, "$symbol"
    $P40."unshift"($P41)
  if_35_end:
# .annotate "line", 76
    find_lex $P44, "@tags"
    new $P45, "String"
    assign $P45, "ResizablePMCArray"
    set $S46, $P45
    isa $I47, $P44, $S46
    new $P48, 'Integer'
    set $P48, $I47
    isfalse $I49, $P48
    if $I49, if_43
# .annotate "line", 77
    find_lex $P54, "@tags"
    set $N55, $P54
    iseq $I56, $N55, 0.0
    unless $I56, if_53_end
    find_lex $P57, "@tags"
    $P57."push"("DEFAULT")
  if_53_end:
    goto if_43_end
  if_43:
# .annotate "line", 76
    get_hll_global $P50, ["Array"], "new"
    find_lex $P51, "@tags"
    $P52 = $P50($P51)
    store_lex "@tags", $P52
  if_43_end:
# .annotate "line", 79
    get_hll_global $P60, ["Opcode"], "defined"
    find_lex $P61, "$namespace"
    $P62 = $P60($P61)
    if $P62, if_59
# .annotate "line", 81
    get_hll_global $P64, ["Parrot"], "caller_namespace"
    $P65 = $P64(2)
    set $P58, $P65
# .annotate "line", 79
    goto if_59_end
  if_59:
    find_lex $P63, "$namespace"
    set $P58, $P63
  if_59_end:
# .annotate "line", 80
    store_lex "$source_nsp", $P58
# .annotate "line", 83
    get_hll_global $P67, ["Opcode"], "isa"
    find_lex $P68, "$source_nsp"
    $P69 = $P67($P68, "String")
    unless $P69, if_66_end
# .annotate "line", 84
    get_hll_global $P70, ["Opcode"], "get_namespace"
    find_lex $P71, "$source_nsp"
    $P72 = $P70($P71)
    store_lex "$source_nsp", $P72
  if_66_end:
# .annotate "line", 87
    find_lex $P73, "$source_nsp"
    $P74 = $P73."make_namespace"("EXPORT")
    store_lex "$export_nsp", $P74
# .annotate "line", 89
    find_lex $P75, "@tags"
    $P75."push"("ALL")
# .annotate "line", 91
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
    .const 'Sub' $P81 = "14_1267109893.9132" 
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
# .annotate "line", 68
    .return ($P76)
  control_23:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["Global"]
.sub "_block80"  :anon :subid("14_1267109893.9132") :outer("13_1267109893.9132")
    .param pmc param_83
# .annotate "line", 91
    .const 'Sub' $P94 = "15_1267109893.9132" 
    capture_lex $P94
# .annotate "line", 92
    new $P82, "Undef"
    .lex "$tag_nsp", $P82
    .lex "$_", param_83
    find_lex $P84, "$export_nsp"
    find_lex $P85, "$_"
    set $S86, $P85
    $P87 = $P84."make_namespace"($S86)
    store_lex "$tag_nsp", $P87
# .annotate "line", 94
    get_hll_global $P90, ["Opcode"], "defined"
    find_lex $P91, "$as"
    $P92 = $P90($P91)
    if $P92, if_89
# .annotate "line", 103
    find_lex $P109, "$source_nsp"
    find_lex $P110, "$tag_nsp"
    find_lex $P111, "@symbols"
    $P112 = $P109."export_to"($P110, $P111)
# .annotate "line", 102
    set $P88, $P112
# .annotate "line", 94
    goto if_89_end
  if_89:
    .const 'Sub' $P94 = "15_1267109893.9132" 
    capture_lex $P94
    $P108 = $P94()
    set $P88, $P108
  if_89_end:
# .annotate "line", 91
    .return ($P88)
.end


.namespace ["Global"]
.sub "_block93"  :anon :subid("15_1267109893.9132") :outer("14_1267109893.9132")
# .annotate "line", 95
    new $P95, "Undef"
    .lex "$export_sym", $P95
    find_lex $P96, "$symbol"
    store_lex "$export_sym", $P96
# .annotate "line", 96
    get_hll_global $P98, ["Opcode"], "isa"
    find_lex $P99, "$export_sym"
    $P100 = $P98($P99, "String")
    unless $P100, if_97_end
# .annotate "line", 97
    find_lex $P101, "$source_nsp"
    find_lex $P102, "$export_sym"
    $P103 = $P101."get_sym"($P102)
    store_lex "$export_sym", $P103
  if_97_end:
# .annotate "line", 100
    find_lex $P104, "$export_sym"
    find_lex $P105, "$as"
    find_lex $P106, "$tag_nsp"
    $P107 = "inject_symbol"($P104, $P105 :named("as"), $P106 :named("namespace"))
# .annotate "line", 94
    .return ($P107)
.end


.namespace ["Global"]
.sub "inject_root_symbol"  :subid("16_1267109893.9132") :outer("11_1267109893.9132")
    .param pmc param_120
    .param pmc param_121 :optional :named("as")
    .param int has_param_121 :opt_flag
    .param pmc param_123 :optional :named("force")
    .param int has_param_123 :opt_flag
# .annotate "line", 108
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
# .annotate "line", 109
    new $P125, "Undef"
    .lex "$hll_namespace", $P125
    get_hll_namespace $P126
    store_lex "$hll_namespace", $P126
# .annotate "line", 110
    find_lex $P127, "$pmc"
    find_lex $P128, "$as"
    find_lex $P129, "$hll_namespace"
    find_lex $P130, "$force"
    $P131 = "inject_symbol"($P127, $P128 :named("as"), $P129 :named("namespace"), $P130 :named("force"))
# .annotate "line", 108
    .return ($P131)
  control_118:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P132, exception, "payload"
    .return ($P132)
.end


.namespace ["Global"]
.sub "inject_symbol"  :subid("17_1267109893.9132") :outer("11_1267109893.9132")
    .param pmc param_136
    .param pmc param_137 :optional :named("namespace")
    .param int has_param_137 :opt_flag
    .param pmc param_139 :optional :named("as")
    .param int has_param_139 :opt_flag
    .param pmc param_141 :optional :named("force")
    .param int has_param_141 :opt_flag
# .annotate "line", 114
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
# .annotate "line", 121
    find_lex $P144, "$as"
    set $P143, $P144
    defined $I146, $P143
    if $I146, default_145
    find_lex $P147, "$object"
    set $S148, $P147
    set $P143, $S148
  default_145:
    store_lex "$as", $P143
# .annotate "line", 123
    find_lex $P150, "$namespace"
    isa $I151, $P150, "NameSpace"
    if $I151, unless_149_end
# .annotate "line", 124
    get_hll_global $P152, ["Opcode"], "get_hll_namespace"
    find_lex $P153, "$namespace"
    $P154 = $P152($P153)
    store_lex "$namespace", $P154
  unless_149_end:
# .annotate "line", 129
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
# .annotate "line", 130
    new $P165, "Exception"
    set $P165['type'], 58
    new $P166, "Integer"
    assign $P166, 0
    setattribute $P165, 'payload', $P166
    throw $P165
  if_155_end:
# .annotate "line", 133
    find_lex $P167, "$namespace"
    find_lex $P168, "$as"
    find_lex $P169, "$object"
    $P170 = $P167."add_var"($P168, $P169)
# .annotate "line", 114
    .return ($P170)
  control_134:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P171, exception, "payload"
    .return ($P171)
.end


.namespace ["Global"]
.sub "register_global"  :subid("18_1267109893.9132") :outer("11_1267109893.9132")
    .param pmc param_175
    .param pmc param_176
    .param pmc param_177 :optional :named("namespace")
    .param int has_param_177 :opt_flag
# .annotate "line", 136
    new $P174, 'ExceptionHandler'
    set_addr $P174, control_173
    $P174."handle_types"(58)
    push_eh $P174
    .lex "$name", param_175
    .lex "$object", param_176
    if has_param_177, optparam_32
    new $P178, "Undef"
    set param_177, $P178
  optparam_32:
    .lex "$namespace", param_177
# .annotate "line", 148
    new $P179, "Undef"
    .lex "$nsp", $P179
# .annotate "line", 143
    find_lex $P181, "$namespace"
    if $P181, unless_180_end
    new $P182, "String"
    assign $P182, "Global"
    store_lex "$namespace", $P182
  unless_180_end:
# .annotate "line", 144
    get_hll_global $P184, ["Opcode"], "isa"
    find_lex $P185, "$namespace"
    $P186 = $P184($P185, "String")
    unless $P186, if_183_end
# .annotate "line", 145
    find_lex $P187, "$namespace"
    $P188 = $P187."split"("::")
    store_lex "$namespace", $P188
  if_183_end:
# .annotate "line", 148
    get_hll_namespace $P189
    store_lex "$nsp", $P189
# .annotate "line", 149
    find_lex $P190, "$nsp"
    find_lex $P191, "$namespace"
    $P192 = $P190."make_namespace"($P191)
    store_lex "$nsp", $P192
# .annotate "line", 151
    find_lex $P193, "$object"
    find_lex $P194, "$name"
    find_lex $P195, "$nsp"
    unless_null $P195, vivify_33
    new $P195, "Hash"
    store_lex "$nsp", $P195
  vivify_33:
    set $P195[$P194], $P193
# .annotate "line", 152
    find_lex $P196, "$name"
    find_lex $P197, "$nsp"
    $P198 = "export"($P196, $P197 :named("namespace"))
# .annotate "line", 136
    .return ($P198)
  control_173:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P199, exception, "payload"
    .return ($P199)
.end


.namespace ["Global"]
.sub "use"  :subid("19_1267109893.9132") :outer("11_1267109893.9132")
    .param pmc param_203 :optional
    .param int has_param_203 :opt_flag
    .param pmc param_205 :optional :named("except")
    .param int has_param_205 :opt_flag
    .param pmc param_207 :optional :named("tags")
    .param int has_param_207 :opt_flag
    .param pmc param_209 :optional :named("symbols")
    .param int has_param_209 :opt_flag
# .annotate "line", 155
    .const 'Sub' $P282 = "21_1267109893.9132" 
    capture_lex $P282
    .const 'Sub' $P269 = "20_1267109893.9132" 
    capture_lex $P269
    new $P202, 'ExceptionHandler'
    set_addr $P202, control_201
    $P202."handle_types"(58)
    push_eh $P202
    if has_param_203, optparam_34
    new $P204, "Undef"
    set param_203, $P204
  optparam_34:
    .lex "$module", param_203
    if has_param_205, optparam_35
    new $P206, "ResizablePMCArray"
    set param_205, $P206
  optparam_35:
    .lex "@except", param_205
    if has_param_207, optparam_36
    new $P208, "ResizablePMCArray"
    set param_207, $P208
  optparam_36:
    .lex "@tags", param_207
    if has_param_209, optparam_37
    new $P210, "ResizablePMCArray"
    set param_209, $P210
  optparam_37:
    .lex "@symbols", param_209
# .annotate "line", 187
    new $P211, "Undef"
    .lex "$export_nsp", $P211
# .annotate "line", 188
    new $P212, "Undef"
    .lex "$target_nsp", $P212
# .annotate "line", 190
    new $P213, "Hash"
    .lex "%except", $P213
# .annotate "line", 176
    get_hll_global $P215, ["Opcode"], "defined"
    find_lex $P216, "$module"
    $P217 = $P215($P216)
    isfalse $I218, $P217
    unless $I218, if_214_end
    get_hll_global $P219, ["Parrot"], "caller_namespace"
    $P220 = $P219(1)
    store_lex "$module", $P220
  if_214_end:
# .annotate "line", 177
    get_hll_global $P222, ["Opcode"], "isa"
    find_lex $P223, "@tags"
    $P224 = $P222($P223, "String")
    unless $P224, if_221_end
    get_hll_global $P225, ["Array"], "new"
    find_lex $P226, "@tags"
    $P227 = $P225($P226)
    store_lex "@tags", $P227
  if_221_end:
# .annotate "line", 178
    get_hll_global $P229, ["Opcode"], "isa"
    find_lex $P230, "@symbols"
    $P231 = $P229($P230, "String")
    unless $P231, if_228_end
    get_hll_global $P232, ["Array"], "new"
    find_lex $P233, "@symbols"
    $P234 = $P232($P233)
    store_lex "@symbols", $P234
  if_228_end:
# .annotate "line", 180
    get_hll_global $P236, ["Opcode"], "isa"
    find_lex $P237, "$module"
    $P238 = $P236($P237, "P6object")
    unless $P238, if_235_end
    get_hll_global $P239, ["Opcode"], "typeof"
    find_lex $P240, "$module"
    $P241 = $P239($P240)
    store_lex "$module", $P241
  if_235_end:
# .annotate "line", 181
    get_hll_global $P243, ["Opcode"], "isa"
    find_lex $P244, "$module"
    $P245 = $P243($P244, "String")
    unless $P245, if_242_end
    get_hll_global $P246, ["Parrot"], "get_hll_namespace"
    find_lex $P247, "$module"
    $P248 = $P246($P247)
    store_lex "$module", $P248
  if_242_end:
# .annotate "line", 183
    find_lex $P252, "@tags"
    set $N253, $P252
    iseq $I254, $N253, 0.0
    if $I254, if_251
    new $P250, 'Integer'
    set $P250, $I254
    goto if_251_end
  if_251:
    find_lex $P255, "@symbols"
    set $N256, $P255
    iseq $I257, $N256, 0.0
    new $P250, 'Integer'
    set $P250, $I257
  if_251_end:
    unless $P250, if_249_end
# .annotate "line", 184
    find_lex $P258, "@tags"
    $P258."push"("DEFAULT")
  if_249_end:
# .annotate "line", 187
    find_lex $P259, "$module"
    $P260 = $P259."make_namespace"("EXPORT")
    store_lex "$export_nsp", $P260
# .annotate "line", 188
    get_hll_global $P261, ["Parrot"], "caller_namespace"
    $P262 = $P261(2)
    store_lex "$target_nsp", $P262
    find_lex $P263, "%except"
# .annotate "line", 192
    find_lex $P265, "@except"
    defined $I266, $P265
    unless $I266, for_undef_38
    iter $P264, $P265
    new $P275, 'ExceptionHandler'
    set_addr $P275, loop274_handler
    $P275."handle_types"(65, 67, 66)
    push_eh $P275
  loop274_test:
    unless $P264, loop274_done
    shift $P267, $P264
  loop274_redo:
    .const 'Sub' $P269 = "20_1267109893.9132" 
    capture_lex $P269
    $P269($P267)
  loop274_next:
    goto loop274_test
  loop274_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P276, exception, 'type'
    eq $P276, 65, loop274_next
    eq $P276, 67, loop274_redo
  loop274_done:
    pop_eh 
  for_undef_38:
# .annotate "line", 196
    find_lex $P278, "@tags"
    defined $I279, $P278
    unless $I279, for_undef_40
    iter $P277, $P278
    new $P320, 'ExceptionHandler'
    set_addr $P320, loop319_handler
    $P320."handle_types"(65, 67, 66)
    push_eh $P320
  loop319_test:
    unless $P277, loop319_done
    shift $P280, $P277
  loop319_redo:
    .const 'Sub' $P282 = "21_1267109893.9132" 
    capture_lex $P282
    $P282($P280)
  loop319_next:
    goto loop319_test
  loop319_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P321, exception, 'type'
    eq $P321, 65, loop319_next
    eq $P321, 67, loop319_redo
  loop319_done:
    pop_eh 
  for_undef_40:
# .annotate "line", 211
    find_lex $P324, "@symbols"
    set $N325, $P324
    if $N325, if_323
    new $P322, 'Float'
    set $P322, $N325
    goto if_323_end
  if_323:
# .annotate "line", 212
    find_lex $P326, "$export_nsp"
    unless_null $P326, vivify_44
    new $P326, "Hash"
  vivify_44:
    set $P327, $P326["ALL"]
    unless_null $P327, vivify_45
    new $P327, "Undef"
  vivify_45:
    find_lex $P328, "$target_nsp"
    find_lex $P329, "@symbols"
    $P330 = $P327."export_to"($P328, $P329)
# .annotate "line", 211
    set $P322, $P330
  if_323_end:
# .annotate "line", 155
    .return ($P322)
  control_201:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P331, exception, "payload"
    .return ($P331)
.end


.namespace ["Global"]
.sub "_block268"  :anon :subid("20_1267109893.9132") :outer("19_1267109893.9132")
    .param pmc param_270
# .annotate "line", 192
    .lex "$_", param_270
# .annotate "line", 193
    new $P271, "Integer"
    assign $P271, 1
    find_lex $P272, "$_"
    find_lex $P273, "%except"
    unless_null $P273, vivify_39
    new $P273, "Hash"
    store_lex "%except", $P273
  vivify_39:
    set $P273[$P272], $P271
# .annotate "line", 192
    .return ($P271)
.end


.namespace ["Global"]
.sub "_block281"  :anon :subid("21_1267109893.9132") :outer("19_1267109893.9132")
    .param pmc param_285
# .annotate "line", 196
    .const 'Sub' $P297 = "22_1267109893.9132" 
    capture_lex $P297
# .annotate "line", 197
    new $P283, "Undef"
    .lex "$source_nsp", $P283
# .annotate "line", 198
    new $P284, "ResizablePMCArray"
    .lex "@tag_symbols", $P284
    .lex "$_", param_285
# .annotate "line", 197
    find_lex $P286, "$export_nsp"
    find_lex $P287, "$_"
    set $S288, $P287
    $P289 = $P286."make_namespace"($S288)
    store_lex "$source_nsp", $P289
    find_lex $P290, "@tag_symbols"
# .annotate "line", 200
    find_lex $P292, "$source_nsp"
    $P293 = $P292."keys"()
    defined $I294, $P293
    unless $I294, for_undef_41
    iter $P291, $P293
    new $P309, 'ExceptionHandler'
    set_addr $P309, loop308_handler
    $P309."handle_types"(65, 67, 66)
    push_eh $P309
  loop308_test:
    unless $P291, loop308_done
    shift $P295, $P291
  loop308_redo:
    .const 'Sub' $P297 = "22_1267109893.9132" 
    capture_lex $P297
    $P297($P295)
  loop308_next:
    goto loop308_test
  loop308_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P310, exception, 'type'
    eq $P310, 65, loop308_next
    eq $P310, 67, loop308_redo
  loop308_done:
    pop_eh 
  for_undef_41:
# .annotate "line", 206
    find_lex $P313, "@tag_symbols"
    set $N314, $P313
    if $N314, if_312
    new $P311, 'Float'
    set $P311, $N314
    goto if_312_end
  if_312:
# .annotate "line", 207
    find_lex $P315, "$source_nsp"
    find_lex $P316, "$target_nsp"
    find_lex $P317, "@tag_symbols"
    $P318 = $P315."export_to"($P316, $P317)
# .annotate "line", 206
    set $P311, $P318
  if_312_end:
# .annotate "line", 196
    .return ($P311)
.end


.namespace ["Global"]
.sub "_block296"  :anon :subid("22_1267109893.9132") :outer("21_1267109893.9132")
    .param pmc param_298
# .annotate "line", 200
    .lex "$_", param_298
# .annotate "line", 201
    find_lex $P301, "$_"
    find_lex $P302, "%except"
    unless_null $P302, vivify_42
    new $P302, "Hash"
  vivify_42:
    set $P303, $P302[$P301]
    unless_null $P303, vivify_43
    new $P303, "Undef"
  vivify_43:
    unless $P303, unless_300
    set $P299, $P303
    goto unless_300_end
  unless_300:
# .annotate "line", 202
    find_lex $P304, "@tag_symbols"
    find_lex $P305, "$_"
    set $S306, $P305
    $P307 = $P304."push"($S306)
# .annotate "line", 201
    set $P299, $P307
  unless_300_end:
# .annotate "line", 200
    .return ($P299)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109943.05394")
# .annotate "line", 0
    get_hll_global $P14, ["Syntax"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Syntax"], "_block13" 
    capture_lex $P14
    $P94 = $P14()
# .annotate "line", 1
    .return ($P94)
.end


.namespace ["Syntax"]
.sub "_block13"  :subid("11_1267109943.05394") :outer("10_1267109943.05394")
# .annotate "line", 7
    .const 'Sub' $P71 = "18_1267109943.05394" 
    capture_lex $P71
    .const 'Sub' $P60 = "17_1267109943.05394" 
    capture_lex $P60
    .const 'Sub' $P53 = "16_1267109943.05394" 
    capture_lex $P53
    .const 'Sub' $P46 = "15_1267109943.05394" 
    capture_lex $P46
    .const 'Sub' $P39 = "14_1267109943.05394" 
    capture_lex $P39
    .const 'Sub' $P32 = "13_1267109943.05394" 
    capture_lex $P32
    .const 'Sub' $P15 = "12_1267109943.05394" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1267109943.05394" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 16
    .const 'Sub' $P32 = "13_1267109943.05394" 
    capture_lex $P32
    .lex "die", $P32
# .annotate "line", 20
    .const 'Sub' $P39 = "14_1267109943.05394" 
    capture_lex $P39
    .lex "last", $P39
# .annotate "line", 24
    .const 'Sub' $P46 = "15_1267109943.05394" 
    capture_lex $P46
    .lex "next", $P46
# .annotate "line", 28
    .const 'Sub' $P53 = "16_1267109943.05394" 
    capture_lex $P53
    .lex "redo", $P53
# .annotate "line", 32
    .const 'Sub' $P60 = "17_1267109943.05394" 
    capture_lex $P60
    .lex "super", $P60
# .annotate "line", 36
    .const 'Sub' $P71 = "18_1267109943.05394" 
    capture_lex $P71
    .lex "super_", $P71
# .annotate "line", 7
    find_lex $P87, "_pre_initload"
    find_lex $P88, "die"
    find_lex $P89, "last"
    find_lex $P90, "next"
    find_lex $P91, "redo"
    find_lex $P92, "super"
    find_lex $P93, "super_"
    .return ($P93)
.end


.namespace ["Syntax"]
.sub "_pre_initload"  :subid("12_1267109943.05394") :outer("11_1267109943.05394")
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
.sub "die"  :subid("13_1267109943.05394") :outer("11_1267109943.05394")
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
.sub "last"  :subid("14_1267109943.05394") :outer("11_1267109943.05394")
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
.sub "next"  :subid("15_1267109943.05394") :outer("11_1267109943.05394")
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
.sub "redo"  :subid("16_1267109943.05394") :outer("11_1267109943.05394")
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
.sub "super"  :subid("17_1267109943.05394") :outer("11_1267109943.05394")
    .param pmc param_63
    .param pmc param_64 :slurpy
    .param pmc param_65 :slurpy :named
# .annotate "line", 32
    new $P62, 'ExceptionHandler'
    set_addr $P62, control_61
    $P62."handle_types"(58)
    push_eh $P62
    .lex "$method", param_63
    .lex "@pos", param_64
    .lex "%named", param_65
# .annotate "line", 33
    find_lex $P66, "$method"
    find_lex $P67, "@pos"
    find_lex $P68, "%named"
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
.sub "super_"  :subid("18_1267109943.05394") :outer("11_1267109943.05394")
    .param pmc param_74
    .param pmc param_75
    .param pmc param_76
# .annotate "line", 36
    new $P73, 'ExceptionHandler'
    set_addr $P73, control_72
    $P73."handle_types"(58)
    push_eh $P73
    .lex "$method", param_74
    .lex "@pos", param_75
    .lex "%named", param_76
# .annotate "line", 37
    new $P77, "Undef"
    .lex "$self", $P77
    get_hll_global $P78, ["Parrot"], "get_self"
    $P79 = $P78()
    store_lex "$self", $P79
# .annotate "line", 38
    get_hll_global $P80, ["P6object"], "SUPER_"
    find_lex $P81, "$self"
    find_lex $P82, "$method"
    find_lex $P83, "@pos"
    find_lex $P84, "%named"
    $P85 = $P80($P81, $P82, $P83, $P84)
# .annotate "line", 36
    .return ($P85)
  control_72:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P86, exception, "payload"
    .return ($P86)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109964.86427")
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
.sub "_block13"  :subid("11_1267109964.86427") :outer("10_1267109964.86427")
# .annotate "line", 7
    .const 'Sub' $P54 = "15_1267109964.86427" 
    capture_lex $P54
    .const 'Sub' $P50 = "14_1267109964.86427" 
    capture_lex $P50
    .const 'Sub' $P15 = "12_1267109964.86427" 
    capture_lex $P15
# .annotate "line", 19
    .const 'Sub' $P15 = "12_1267109964.86427" 
    capture_lex $P15
    .lex "call_preinit_subs", $P15
# .annotate "line", 37
    .const 'Sub' $P50 = "14_1267109964.86427" 
    capture_lex $P50
    .lex "is_loaded", $P50
# .annotate "line", 41
    .const 'Sub' $P54 = "15_1267109964.86427" 
    capture_lex $P54
    .lex "_pre_initload", $P54
# .annotate "line", 7
    find_lex $P76, "call_preinit_subs"
    find_lex $P77, "is_loaded"
    find_lex $P78, "_pre_initload"
    .return ($P78)
.end


.namespace ["Kakapo"]
.sub "" :load :init :subid("post16") :outer("11_1267109964.86427")
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
.sub "call_preinit_subs"  :subid("12_1267109964.86427") :outer("11_1267109964.86427")
    .param pmc param_18
# .annotate "line", 19
    .const 'Sub' $P28 = "13_1267109964.86427" 
    capture_lex $P28
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "@list", param_18
# .annotate "line", 21
    new $P19, "Undef"
    .lex "$nsp", $P19
# .annotate "line", 22
    new $P20, "Undef"
    .lex "&sub", $P20
# .annotate "line", 19
    find_lex $P21, "$nsp"
    find_lex $P22, "&sub"
# .annotate "line", 24
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
    .const 'Sub' $P28 = "13_1267109964.86427" 
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
# .annotate "line", 19
    .return ($P23)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P49, exception, "payload"
    .return ($P49)
.end


.namespace ["Kakapo"]
.sub "_block27"  :anon :subid("13_1267109964.86427") :outer("12_1267109964.86427")
    .param pmc param_29
# .annotate "line", 24
    .lex "$_", param_29
# .annotate "line", 25
    find_lex $P30, "$_"
    set $S31, $P30
    split $P32, "::", $S31
    get_hll_namespace $P33, $P32
    store_lex "$nsp", $P33
# .annotate "line", 26
    find_lex $P34, "$nsp"
    $P35 = $P34."find_sub"("_pre_initload")
    store_lex "&sub", $P35
# .annotate "line", 28
    find_lex $P38, "&sub"
    isnull $I39, $P38
    if $I39, if_37
# .annotate "line", 32
    find_lex $P44, "&sub"
    $P45 = $P44()
# .annotate "line", 31
    set $P36, $P45
# .annotate "line", 28
    goto if_37_end
  if_37:
# .annotate "line", 29
    new $P40, 'String'
    set $P40, "*** WARNING: No _pre_initload sub found for namespace "
    find_lex $P41, "$_"
    concat $P42, $P40, $P41
    $P43 = "say"($P42)
# .annotate "line", 28
    set $P36, $P43
  if_37_end:
# .annotate "line", 24
    .return ($P36)
.end


.namespace ["Kakapo"]
.sub "is_loaded"  :subid("14_1267109964.86427") :outer("11_1267109964.86427")
# .annotate "line", 37
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
.sub "_pre_initload"  :subid("15_1267109964.86427") :outer("11_1267109964.86427")
# .annotate "line", 41
    new $P56, 'ExceptionHandler'
    set_addr $P56, control_55
    $P56."handle_types"(58)
    push_eh $P56
# .annotate "line", 43
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
# .annotate "line", 44
    new $P62, "Integer"
    assign $P62, 1
    set_global "$_Pre_initload_done", $P62
# .annotate "line", 46
    get_hll_global $P64, ["Opcode"], "defined"
    get_hll_global $P65, "say"
    $P66 = $P64($P65)
    if $P66, unless_63_end
# .annotate "line", 47
    get_hll_global $P67, ["Opcode"], "load_language"
    $P67("nqp")
  unless_63_end:
# .annotate "line", 50
    get_hll_global $P69, ["Opcode"], "defined"
    get_hll_global $P70, ["P6object"], "HOW"
    $P71 = $P69($P70)
    if $P71, unless_68_end
# .annotate "line", 51
    get_hll_global $P72, ["Opcode"], "load_bytecode"
    $P72("P6object.pbc")
  unless_68_end:
# .annotate "line", 54
    $P73 = "get_preinit_subs"()
    $P74 = "call_preinit_subs"($P73)
# .annotate "line", 41
    .return ($P74)
  control_55:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P75, exception, "payload"
    .return ($P75)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109922.02362")
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
.sub "_block13"  :subid("11_1267109922.02362") :outer("10_1267109922.02362")
# .annotate "line", 9
    .const 'Sub' $P309 = "46_1267109922.02362" 
    capture_lex $P309
    .const 'Sub' $P283 = "45_1267109922.02362" 
    capture_lex $P283
    .const 'Sub' $P257 = "44_1267109922.02362" 
    capture_lex $P257
    .const 'Sub' $P250 = "43_1267109922.02362" 
    capture_lex $P250
    .const 'Sub' $P244 = "42_1267109922.02362" 
    capture_lex $P244
    .const 'Sub' $P235 = "41_1267109922.02362" 
    capture_lex $P235
    .const 'Sub' $P224 = "40_1267109922.02362" 
    capture_lex $P224
    .const 'Sub' $P217 = "39_1267109922.02362" 
    capture_lex $P217
    .const 'Sub' $P210 = "38_1267109922.02362" 
    capture_lex $P210
    .const 'Sub' $P203 = "37_1267109922.02362" 
    capture_lex $P203
    .const 'Sub' $P196 = "36_1267109922.02362" 
    capture_lex $P196
    .const 'Sub' $P186 = "35_1267109922.02362" 
    capture_lex $P186
    .const 'Sub' $P177 = "34_1267109922.02362" 
    capture_lex $P177
    .const 'Sub' $P167 = "33_1267109922.02362" 
    capture_lex $P167
    .const 'Sub' $P160 = "32_1267109922.02362" 
    capture_lex $P160
    .const 'Sub' $P150 = "31_1267109922.02362" 
    capture_lex $P150
    .const 'Sub' $P143 = "30_1267109922.02362" 
    capture_lex $P143
    .const 'Sub' $P136 = "29_1267109922.02362" 
    capture_lex $P136
    .const 'Sub' $P129 = "28_1267109922.02362" 
    capture_lex $P129
    .const 'Sub' $P124 = "27_1267109922.02362" 
    capture_lex $P124
    .const 'Sub' $P116 = "26_1267109922.02362" 
    capture_lex $P116
    .const 'Sub' $P109 = "25_1267109922.02362" 
    capture_lex $P109
    .const 'Sub' $P102 = "24_1267109922.02362" 
    capture_lex $P102
    .const 'Sub' $P92 = "23_1267109922.02362" 
    capture_lex $P92
    .const 'Sub' $P85 = "22_1267109922.02362" 
    capture_lex $P85
    .const 'Sub' $P78 = "21_1267109922.02362" 
    capture_lex $P78
    .const 'Sub' $P71 = "20_1267109922.02362" 
    capture_lex $P71
    .const 'Sub' $P61 = "19_1267109922.02362" 
    capture_lex $P61
    .const 'Sub' $P55 = "18_1267109922.02362" 
    capture_lex $P55
    .const 'Sub' $P48 = "17_1267109922.02362" 
    capture_lex $P48
    .const 'Sub' $P41 = "16_1267109922.02362" 
    capture_lex $P41
    .const 'Sub' $P34 = "15_1267109922.02362" 
    capture_lex $P34
    .const 'Sub' $P24 = "14_1267109922.02362" 
    capture_lex $P24
    .const 'Sub' $P20 = "13_1267109922.02362" 
    capture_lex $P20
    .const 'Sub' $P15 = "12_1267109922.02362" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1267109922.02362" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 15
    .const 'Sub' $P20 = "13_1267109922.02362" 
    capture_lex $P20
    .lex "backtrace", $P20
# .annotate "line", 16
    .const 'Sub' $P24 = "14_1267109922.02362" 
    capture_lex $P24
    .lex "can", $P24
# .annotate "line", 17
    .const 'Sub' $P34 = "15_1267109922.02362" 
    capture_lex $P34
    .lex "class", $P34
# .annotate "line", 18
    .const 'Sub' $P41 = "16_1267109922.02362" 
    capture_lex $P41
    .lex "clone", $P41
# .annotate "line", 19
    .const 'Sub' $P48 = "17_1267109922.02362" 
    capture_lex $P48
    .lex "defined", $P48
# .annotate "line", 22
    .const 'Sub' $P55 = "18_1267109922.02362" 
    capture_lex $P55
    .lex "delete", $P55
# .annotate "line", 30
    .const 'Sub' $P61 = "19_1267109922.02362" 
    capture_lex $P61
    .lex "does", $P61
# .annotate "line", 31
    .const 'Sub' $P71 = "20_1267109922.02362" 
    capture_lex $P71
    .lex "elements", $P71
# .annotate "line", 32
    .const 'Sub' $P78 = "21_1267109922.02362" 
    capture_lex $P78
    .lex "exit", $P78
# .annotate "line", 33
    .const 'Sub' $P85 = "22_1267109922.02362" 
    capture_lex $P85
    .lex "get_addr", $P85
# .annotate "line", 34
    .const 'Sub' $P92 = "23_1267109922.02362" 
    capture_lex $P92
    .lex "getattribute", $P92
# .annotate "line", 35
    .const 'Sub' $P102 = "24_1267109922.02362" 
    capture_lex $P102
    .lex "get_class", $P102
# .annotate "line", 36
    .const 'Sub' $P109 = "25_1267109922.02362" 
    capture_lex $P109
    .lex "get_integer", $P109
# .annotate "line", 37
    .const 'Sub' $P116 = "26_1267109922.02362" 
    capture_lex $P116
    .lex "get_global", $P116
# .annotate "line", 38
    .const 'Sub' $P124 = "27_1267109922.02362" 
    capture_lex $P124
    .lex "getinterp", $P124
# .annotate "line", 39
    .const 'Sub' $P129 = "28_1267109922.02362" 
    capture_lex $P129
    .lex "get_namespace", $P129
# .annotate "line", 40
    .const 'Sub' $P136 = "29_1267109922.02362" 
    capture_lex $P136
    .lex "get_root_namespace", $P136
# .annotate "line", 41
    .const 'Sub' $P143 = "30_1267109922.02362" 
    capture_lex $P143
    .lex "inspect", $P143
# .annotate "line", 42
    .const 'Sub' $P150 = "31_1267109922.02362" 
    capture_lex $P150
    .lex "inspect_string", $P150
# .annotate "line", 43
    .const 'Sub' $P160 = "32_1267109922.02362" 
    capture_lex $P160
    .lex "isnull", $P160
# .annotate "line", 44
    .const 'Sub' $P167 = "33_1267109922.02362" 
    capture_lex $P167
    .lex "isa", $P167
# .annotate "line", 45
    .const 'Sub' $P177 = "34_1267109922.02362" 
    capture_lex $P177
    .lex "iseq", $P177
# .annotate "line", 46
    .const 'Sub' $P186 = "35_1267109922.02362" 
    capture_lex $P186
    .lex "join", $P186
# .annotate "line", 47
    .const 'Sub' $P196 = "36_1267109922.02362" 
    capture_lex $P196
    .lex "load_bytecode", $P196
# .annotate "line", 48
    .const 'Sub' $P203 = "37_1267109922.02362" 
    capture_lex $P203
    .lex "load_language", $P203
# .annotate "line", 49
    .const 'Sub' $P210 = "38_1267109922.02362" 
    capture_lex $P210
    .lex "new", $P210
# .annotate "line", 50
    .const 'Sub' $P217 = "39_1267109922.02362" 
    capture_lex $P217
    .lex "newclass", $P217
# .annotate "line", 51
    .const 'Sub' $P224 = "40_1267109922.02362" 
    capture_lex $P224
    .lex "setattribute", $P224
# .annotate "line", 53
    .const 'Sub' $P235 = "41_1267109922.02362" 
    capture_lex $P235
    .lex "set_integer", $P235
# .annotate "line", 54
    .const 'Sub' $P244 = "42_1267109922.02362" 
    capture_lex $P244
    .lex "throw", $P244
# .annotate "line", 55
    .const 'Sub' $P250 = "43_1267109922.02362" 
    capture_lex $P250
    .lex "typeof", $P250
# .annotate "line", 59
    .const 'Sub' $P257 = "44_1267109922.02362" 
    capture_lex $P257
    .lex "get_hll_global", $P257
# .annotate "line", 80
    .const 'Sub' $P283 = "45_1267109922.02362" 
    capture_lex $P283
    .lex "get_root_global", $P283
# .annotate "line", 101
    .const 'Sub' $P309 = "46_1267109922.02362" 
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
.sub "_pre_initload"  :subid("12_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "backtrace"  :subid("13_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "can"  :subid("14_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "class"  :subid("15_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "clone"  :subid("16_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "defined"  :subid("17_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "delete"  :subid("18_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "does"  :subid("19_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "elements"  :subid("20_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "exit"  :subid("21_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "get_addr"  :subid("22_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "getattribute"  :subid("23_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "get_class"  :subid("24_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "get_integer"  :subid("25_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "get_global"  :subid("26_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "getinterp"  :subid("27_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "get_namespace"  :subid("28_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "get_root_namespace"  :subid("29_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "inspect"  :subid("30_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "inspect_string"  :subid("31_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "isnull"  :subid("32_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "isa"  :subid("33_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "iseq"  :subid("34_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "join"  :subid("35_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "load_bytecode"  :subid("36_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "load_language"  :subid("37_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "new"  :subid("38_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "newclass"  :subid("39_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "setattribute"  :subid("40_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "set_integer"  :subid("41_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "throw"  :subid("42_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "typeof"  :subid("43_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "get_hll_global"  :subid("44_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "get_root_global"  :subid("45_1267109922.02362") :outer("11_1267109922.02362")
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
.sub "make_root_namespace"  :subid("46_1267109922.02362") :outer("11_1267109922.02362")
    .param pmc param_312
# .annotate "line", 101
    .const 'Sub' $P319 = "47_1267109922.02362" 
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
    .const 'Sub' $P319 = "47_1267109922.02362" 
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
.sub "_block318"  :anon :subid("47_1267109922.02362") :outer("46_1267109922.02362")
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
.sub "_block11"  :anon :subid("10_1267109918.00356")
# .annotate "line", 0
    get_hll_global $P14, ["Parrot"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Parrot"], "_block13" 
    capture_lex $P14
    $P374 = $P14()
# .annotate "line", 1
    .return ($P374)
.end


.namespace []
.sub "" :load :init :subid("post33") :outer("10_1267109918.00356")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1267109918.00356" 
    .local pmc block
    set block, $P12
    $P375 = get_root_global ["parrot"], "P6metaclass"
    $P375."new_class"("Parrot")
.end


.namespace ["Parrot"]
.sub "_block13"  :subid("11_1267109918.00356") :outer("10_1267109918.00356")
# .annotate "line", 7
    .const 'Sub' $P352 = "32_1267109918.00356" 
    capture_lex $P352
    .const 'Sub' $P321 = "31_1267109918.00356" 
    capture_lex $P321
    .const 'Sub' $P301 = "29_1267109918.00356" 
    capture_lex $P301
    .const 'Sub' $P291 = "28_1267109918.00356" 
    capture_lex $P291
    .const 'Sub' $P249 = "27_1267109918.00356" 
    capture_lex $P249
    .const 'Sub' $P236 = "26_1267109918.00356" 
    capture_lex $P236
    .const 'Sub' $P210 = "25_1267109918.00356" 
    capture_lex $P210
    .const 'Sub' $P181 = "24_1267109918.00356" 
    capture_lex $P181
    .const 'Sub' $P172 = "23_1267109918.00356" 
    capture_lex $P172
    .const 'Sub' $P151 = "22_1267109918.00356" 
    capture_lex $P151
    .const 'Sub' $P140 = "21_1267109918.00356" 
    capture_lex $P140
    .const 'Sub' $P133 = "20_1267109918.00356" 
    capture_lex $P133
    .const 'Sub' $P121 = "19_1267109918.00356" 
    capture_lex $P121
    .const 'Sub' $P99 = "18_1267109918.00356" 
    capture_lex $P99
    .const 'Sub' $P86 = "17_1267109918.00356" 
    capture_lex $P86
    .const 'Sub' $P64 = "16_1267109918.00356" 
    capture_lex $P64
    .const 'Sub' $P51 = "15_1267109918.00356" 
    capture_lex $P51
    .const 'Sub' $P38 = "14_1267109918.00356" 
    capture_lex $P38
    .const 'Sub' $P23 = "13_1267109918.00356" 
    capture_lex $P23
    .const 'Sub' $P15 = "12_1267109918.00356" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1267109918.00356" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 27
    .const 'Sub' $P23 = "13_1267109918.00356" 
    capture_lex $P23
    .lex "caller", $P23
# .annotate "line", 33
    .const 'Sub' $P38 = "14_1267109918.00356" 
    capture_lex $P38
    .lex "caller_namespace", $P38
# .annotate "line", 55
    .const 'Sub' $P51 = "15_1267109918.00356" 
    capture_lex $P51
    .lex "call_method", $P51
# .annotate "line", 59
    .const 'Sub' $P64 = "16_1267109918.00356" 
    capture_lex $P64
    .lex "call_method_", $P64
# .annotate "line", 84
    .const 'Sub' $P86 = "17_1267109918.00356" 
    capture_lex $P86
    .lex "call_tuple_method", $P86
# .annotate "line", 88
    .const 'Sub' $P99 = "18_1267109918.00356" 
    capture_lex $P99
    .lex "call_tuple_method_", $P99
# .annotate "line", 115
    .const 'Sub' $P121 = "19_1267109918.00356" 
    capture_lex $P121
    .lex "call_sub", $P121
# .annotate "line", 119
    .const 'Sub' $P133 = "20_1267109918.00356" 
    capture_lex $P133
    .lex "call_sub_", $P133
# .annotate "line", 140
    .const 'Sub' $P140 = "21_1267109918.00356" 
    capture_lex $P140
    .lex "call_tuple_sub", $P140
# .annotate "line", 144
    .const 'Sub' $P151 = "22_1267109918.00356" 
    capture_lex $P151
    .lex "call_tuple_sub_", $P151
# .annotate "line", 169
    .const 'Sub' $P172 = "23_1267109918.00356" 
    capture_lex $P172
    .lex "get_address_of", $P172
# .annotate "line", 174
    .const 'Sub' $P181 = "24_1267109918.00356" 
    capture_lex $P181
    .lex "get_hll_global", $P181
# .annotate "line", 195
    .const 'Sub' $P210 = "25_1267109918.00356" 
    capture_lex $P210
    .lex "get_hll_namespace", $P210
# .annotate "line", 213
    .const 'Sub' $P236 = "26_1267109918.00356" 
    capture_lex $P236
    .lex "get_self", $P236
# .annotate "line", 223
    .const 'Sub' $P249 = "27_1267109918.00356" 
    capture_lex $P249
    .lex "get_sub", $P249
# .annotate "line", 247
    .const 'Sub' $P291 = "28_1267109918.00356" 
    capture_lex $P291
    .lex "key", $P291
# .annotate "line", 252
    .const 'Sub' $P301 = "29_1267109918.00356" 
    capture_lex $P301
    .lex "key_", $P301
# .annotate "line", 309
    .const 'Sub' $P321 = "31_1267109918.00356" 
    capture_lex $P321
    .lex "namespace_name", $P321
# .annotate "line", 7
    find_lex $P333, "_pre_initload"
    find_lex $P334, "caller"
    find_lex $P335, "caller_namespace"
    find_lex $P336, "call_method"
    find_lex $P337, "call_method_"
    find_lex $P338, "call_tuple_method"
    find_lex $P339, "call_tuple_method_"
    find_lex $P340, "call_sub"
    find_lex $P341, "call_sub_"
    find_lex $P342, "call_tuple_sub"
    find_lex $P343, "call_tuple_sub_"
    find_lex $P344, "get_address_of"
    find_lex $P345, "get_hll_global"
    find_lex $P346, "get_hll_namespace"
    find_lex $P347, "get_self"
    find_lex $P348, "get_sub"
    find_lex $P349, "key"
    find_lex $P350, "key_"
    find_lex $P351, "namespace_name"
# .annotate "line", 315
    .const 'Sub' $P352 = "32_1267109918.00356" 
    capture_lex $P352
# .annotate "line", 7
    .return ($P352)
.end


.namespace ["Parrot"]
.sub "_pre_initload"  :subid("12_1267109918.00356") :outer("11_1267109918.00356")
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
    $P21 = "export"($P20, "NAMESPACE" :named("tags"))
# .annotate "line", 7
    .return ($P21)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P22, exception, "payload"
    .return ($P22)
.end


.namespace ["Parrot"]
.sub "caller"  :subid("13_1267109918.00356") :outer("11_1267109918.00356")
    .param pmc param_26 :optional
    .param int has_param_26 :opt_flag
# .annotate "line", 27
    new $P25, 'ExceptionHandler'
    set_addr $P25, control_24
    $P25."handle_types"(58)
    push_eh $P25
    if has_param_26, optparam_34
    new $P27, "Integer"
    assign $P27, 1
    set param_26, $P27
  optparam_34:
    .lex "$index", param_26
# .annotate "line", 28
    new $P28, "Undef"
    .lex "$key", $P28
# .annotate "line", 29
    new $P29, "Undef"
    .lex "$sub", $P29
# .annotate "line", 28
    get_hll_global $P30, "Key"
    find_lex $P31, "$index"
    add $P32, $P31, 1
    $P33 = $P30."new"("sub", $P32)
    store_lex "$key", $P33
# .annotate "line", 29
    find_lex $P34, "$key"
    getinterp $P35
    set $P36, $P35[$P34]
    unless_null $P36, vivify_35
    new $P36, "Undef"
  vivify_35:
    store_lex "$sub", $P36
# .annotate "line", 27
    .return ($P36)
  control_24:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P37, exception, "payload"
    .return ($P37)
.end


.namespace ["Parrot"]
.sub "caller_namespace"  :subid("14_1267109918.00356") :outer("11_1267109918.00356")
    .param pmc param_41 :optional
    .param int has_param_41 :opt_flag
# .annotate "line", 33
    new $P40, 'ExceptionHandler'
    set_addr $P40, control_39
    $P40."handle_types"(58)
    push_eh $P40
    if has_param_41, optparam_36
    new $P42, "Undef"
    set param_41, $P42
  optparam_36:
    .lex "$index", param_41
# .annotate "line", 38
    new $P43, "Undef"
    .lex "$nsp", $P43
# .annotate "line", 34
    find_lex $P45, "$index"
    if $P45, unless_44_end
# .annotate "line", 35
    new $P46, "Integer"
    assign $P46, 1
    store_lex "$index", $P46
  unless_44_end:
# .annotate "line", 38

		.local pmc key
		key = new 'Key'
		key = 'namespace'
		$P0 = find_lex '$index'
		$S0 = $P0
		$P1 = new 'Key'
		$P1 = $S0
		push key, $P1
		
		$P0 = getinterp
		$P47 = $P0[ key ]
	
    store_lex "$nsp", $P47
# .annotate "line", 52
    new $P48, "Exception"
    set $P48['type'], 58
    find_lex $P49, "$nsp"
    setattribute $P48, 'payload', $P49
    throw $P48
# .annotate "line", 33
    .return ()
  control_39:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P50, exception, "payload"
    .return ($P50)
.end


.namespace ["Parrot"]
.sub "call_method"  :subid("15_1267109918.00356") :outer("11_1267109918.00356")
    .param pmc param_54
    .param pmc param_55
    .param pmc param_56 :slurpy
    .param pmc param_57 :slurpy :named
# .annotate "line", 55
    new $P53, 'ExceptionHandler'
    set_addr $P53, control_52
    $P53."handle_types"(58)
    push_eh $P53
    .lex "$object", param_54
    .lex "$method_name", param_55
    .lex "@args", param_56
    .lex "%opts", param_57
# .annotate "line", 56
    find_lex $P58, "$object"
    find_lex $P59, "$method_name"
    find_lex $P60, "@args"
    find_lex $P61, "%opts"
    $P62 = "call_method_"($P58, $P59, $P60, $P61)
# .annotate "line", 55
    .return ($P62)
  control_52:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P63, exception, "payload"
    .return ($P63)
.end


.namespace ["Parrot"]
.sub "call_method_"  :subid("16_1267109918.00356") :outer("11_1267109918.00356")
    .param pmc param_67
    .param pmc param_68
    .param pmc param_69 :optional
    .param int has_param_69 :opt_flag
    .param pmc param_71 :optional
    .param int has_param_71 :opt_flag
# .annotate "line", 59
    new $P66, 'ExceptionHandler'
    set_addr $P66, control_65
    $P66."handle_types"(58)
    push_eh $P66
    .lex "$object", param_67
    .lex "$method_name", param_68
    if has_param_69, optparam_37
    new $P70, "ResizablePMCArray"
    set param_69, $P70
  optparam_37:
    .lex "@args", param_69
    if has_param_71, optparam_38
    new $P72, "Hash"
    set param_71, $P72
  optparam_38:
    .lex "%opts", param_71
# .annotate "line", 63
    get_hll_global $P74, ["Opcode"], "defined"
    find_lex $P75, "@args"
    $P76 = $P74($P75)
    if $P76, unless_73_end
    get_hll_global $P77, ["Array"], "new"
    $P78 = $P77()
    store_lex "@args", $P78
  unless_73_end:
# .annotate "line", 64
    get_hll_global $P80, ["Opcode"], "defined"
    find_lex $P81, "%opts"
    $P82 = $P80($P81)
    if $P82, unless_79_end
    get_hll_global $P83, ["Hash"], "empty"
    $P84 = $P83()
    store_lex "%opts", $P84
  unless_79_end:
# .annotate "line", 66

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
	
# .annotate "line", 59
    .return ()
  control_65:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P85, exception, "payload"
    .return ($P85)
.end


.namespace ["Parrot"]
.sub "call_tuple_method"  :subid("17_1267109918.00356") :outer("11_1267109918.00356")
    .param pmc param_89
    .param pmc param_90
    .param pmc param_91 :slurpy
    .param pmc param_92 :slurpy :named
# .annotate "line", 84
    new $P88, 'ExceptionHandler'
    set_addr $P88, control_87
    $P88."handle_types"(58)
    push_eh $P88
    .lex "$object", param_89
    .lex "$method", param_90
    .lex "@args", param_91
    .lex "%opts", param_92
# .annotate "line", 85
    find_lex $P93, "$object"
    find_lex $P94, "$method"
    find_lex $P95, "@args"
    find_lex $P96, "%opts"
    $P97 = "call_tuple_method_"($P93, $P94, $P95, $P96)
# .annotate "line", 84
    .return ($P97)
  control_87:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P98, exception, "payload"
    .return ($P98)
.end


.namespace ["Parrot"]
.sub "call_tuple_method_"  :subid("18_1267109918.00356") :outer("11_1267109918.00356")
    .param pmc param_102
    .param pmc param_103
    .param pmc param_104 :optional
    .param int has_param_104 :opt_flag
    .param pmc param_106 :optional
    .param int has_param_106 :opt_flag
# .annotate "line", 88
    new $P101, 'ExceptionHandler'
    set_addr $P101, control_100
    $P101."handle_types"(58)
    push_eh $P101
    .lex "$object", param_102
    .lex "$method", param_103
    if has_param_104, optparam_39
    new $P105, "ResizablePMCArray"
    set param_104, $P105
  optparam_39:
    .lex "@args", param_104
    if has_param_106, optparam_40
    new $P107, "Hash"
    set param_106, $P107
  optparam_40:
    .lex "%opts", param_106
# .annotate "line", 92
    get_hll_global $P109, ["Opcode"], "defined"
    find_lex $P110, "@args"
    $P111 = $P109($P110)
    if $P111, unless_108_end
    get_hll_global $P112, ["Array"], "new"
    $P113 = $P112()
    store_lex "@args", $P113
  unless_108_end:
# .annotate "line", 93
    get_hll_global $P115, ["Opcode"], "defined"
    find_lex $P116, "%opts"
    $P117 = $P115($P116)
    if $P117, unless_114_end
    get_hll_global $P118, ["Hash"], "empty"
    $P119 = $P118()
    store_lex "%opts", $P119
  unless_114_end:
# .annotate "line", 95

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
	
# .annotate "line", 88
    .return ()
  control_100:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P120, exception, "payload"
    .return ($P120)
.end


.namespace ["Parrot"]
.sub "call_sub"  :subid("19_1267109918.00356") :outer("11_1267109918.00356")
    .param pmc param_124
    .param pmc param_125 :slurpy
    .param pmc param_126 :slurpy :named
# .annotate "line", 115
    new $P123, 'ExceptionHandler'
    set_addr $P123, control_122
    $P123."handle_types"(58)
    push_eh $P123
    .lex "$sub_name", param_124
    .lex "@args", param_125
    .lex "%opts", param_126
# .annotate "line", 116
    new $P127, "Exception"
    set $P127['type'], 58
    find_lex $P128, "$sub_name"
    find_lex $P129, "@args"
    find_lex $P130, "%opts"
    $P131 = "call_sub_"($P128, $P129, $P130)
    setattribute $P127, 'payload', $P131
    throw $P127
# .annotate "line", 115
    .return ()
  control_122:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P132, exception, "payload"
    .return ($P132)
.end


.namespace ["Parrot"]
.sub "call_sub_"  :subid("20_1267109918.00356") :outer("11_1267109918.00356")
    .param pmc param_136
    .param pmc param_137
    .param pmc param_138
# .annotate "line", 119
    new $P135, 'ExceptionHandler'
    set_addr $P135, control_134
    $P135."handle_types"(58)
    push_eh $P135
    .lex "$sub_name", param_136
    .lex "@args", param_137
    .lex "%opts", param_138
# .annotate "line", 123

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
	
# .annotate "line", 119
    .return ()
  control_134:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P139, exception, "payload"
    .return ($P139)
.end


.namespace ["Parrot"]
.sub "call_tuple_sub"  :subid("21_1267109918.00356") :outer("11_1267109918.00356")
    .param pmc param_143
    .param pmc param_144 :slurpy
    .param pmc param_145 :slurpy :named
# .annotate "line", 140
    new $P142, 'ExceptionHandler'
    set_addr $P142, control_141
    $P142."handle_types"(58)
    push_eh $P142
    .lex "$sub", param_143
    .lex "@args", param_144
    .lex "%opts", param_145
# .annotate "line", 141
    find_lex $P146, "$sub"
    find_lex $P147, "@args"
    find_lex $P148, "%opts"
    $P149 = "call_tuple_sub_"($P146, $P147, $P148)
# .annotate "line", 140
    .return ($P149)
  control_141:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P150, exception, "payload"
    .return ($P150)
.end


.namespace ["Parrot"]
.sub "call_tuple_sub_"  :subid("22_1267109918.00356") :outer("11_1267109918.00356")
    .param pmc param_154
    .param pmc param_155 :optional
    .param int has_param_155 :opt_flag
    .param pmc param_157 :optional
    .param int has_param_157 :opt_flag
# .annotate "line", 144
    new $P153, 'ExceptionHandler'
    set_addr $P153, control_152
    $P153."handle_types"(58)
    push_eh $P153
    .lex "$sub", param_154
    if has_param_155, optparam_41
    new $P156, "ResizablePMCArray"
    set param_155, $P156
  optparam_41:
    .lex "@args", param_155
    if has_param_157, optparam_42
    new $P158, "Hash"
    set param_157, $P158
  optparam_42:
    .lex "%opts", param_157
# .annotate "line", 148
    get_hll_global $P160, ["Opcode"], "defined"
    find_lex $P161, "@args"
    $P162 = $P160($P161)
    if $P162, unless_159_end
    get_hll_global $P163, ["Array"], "new"
    $P164 = $P163()
    store_lex "@args", $P164
  unless_159_end:
# .annotate "line", 149
    get_hll_global $P166, ["Opcode"], "defined"
    find_lex $P167, "%opts"
    $P168 = $P166($P167)
    if $P168, unless_165_end
    get_hll_global $P169, ["Hash"], "empty"
    $P170 = $P169()
    store_lex "%opts", $P170
  unless_165_end:
# .annotate "line", 151

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
	
# .annotate "line", 144
    .return ()
  control_152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P171, exception, "payload"
    .return ($P171)
.end


.namespace ["Parrot"]
.sub "get_address_of"  :subid("23_1267109918.00356") :outer("11_1267109918.00356")
    .param pmc param_175
# .annotate "line", 169
    new $P174, 'ExceptionHandler'
    set_addr $P174, control_173
    $P174."handle_types"(58)
    push_eh $P174
    .lex "$what", param_175
# .annotate "line", 170
    new $P176, "Exception"
    set $P176['type'], 58
    get_hll_global $P177, ["Opcode"], "get_addr"
    find_lex $P178, "$what"
    $P179 = $P177($P178)
    setattribute $P176, 'payload', $P179
    throw $P176
# .annotate "line", 169
    .return ()
  control_173:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P180, exception, "payload"
    .return ($P180)
.end


.namespace ["Parrot"]
.sub "get_hll_global"  :subid("24_1267109918.00356") :outer("11_1267109918.00356")
    .param pmc param_184
# .annotate "line", 174
    new $P183, 'ExceptionHandler'
    set_addr $P183, control_182
    $P183."handle_types"(58)
    push_eh $P183
    .lex "$path", param_184
# .annotate "line", 183
    new $P185, "Undef"
    .lex "$name", $P185
# .annotate "line", 184
    new $P186, "Undef"
    .lex "$key", $P186
# .annotate "line", 175
    find_lex $P188, "$path"
    $P189 = $P188."isa"("String")
    unless $P189, if_187_end
# .annotate "line", 176
    find_lex $P190, "$path"
    $P191 = $P190."split"("::")
    store_lex "$path", $P191
  if_187_end:
# .annotate "line", 179
    find_lex $P193, "$path"
    new $P194, "String"
    assign $P194, "array"
    set $S195, $P194
    does $I196, $P193, $S195
    if $I196, unless_192_end
# .annotate "line", 180
    find_lex $P197, "$path"
    concat $P198, $P197, " parameter must be a ::string or array of strings, not: "
    find_lex $P199, "$path"
    "die"($P198, $P199)
  unless_192_end:
# .annotate "line", 183
    find_lex $P200, "$path"
    $P201 = $P200."pop"()
    store_lex "$name", $P201
# .annotate "line", 184
    find_lex $P202, "$path"
    $P203 = "key_"($P202)
    store_lex "$key", $P203
# .annotate "line", 186
    find_lex $P204, "$path"
    $P205 = "key_"($P204)
    find_lex $P206, "$name"
    set $S207, $P206
    get_hll_global $P208, $P205, $S207
# .annotate "line", 174
    .return ($P208)
  control_182:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P209, exception, "payload"
    .return ($P209)
.end


.namespace ["Parrot"]
.sub "get_hll_namespace"  :subid("25_1267109918.00356") :outer("11_1267109918.00356")
    .param pmc param_213 :optional
    .param int has_param_213 :opt_flag
# .annotate "line", 195
    new $P212, 'ExceptionHandler'
    set_addr $P212, control_211
    $P212."handle_types"(58)
    push_eh $P212
    if has_param_213, optparam_43
    new $P214, "Undef"
    set param_213, $P214
  optparam_43:
    .lex "$path", param_213
# .annotate "line", 197
    new $P215, "Undef"
    .lex "$result", $P215
# .annotate "line", 195
    find_lex $P216, "$result"
# .annotate "line", 199
    find_lex $P218, "$path"
    defined $I219, $P218
    if $I219, if_217
# .annotate "line", 207
    get_hll_namespace $P233
    store_lex "$result", $P233
# .annotate "line", 206
    goto if_217_end
  if_217:
# .annotate "line", 200
    find_lex $P221, "$path"
    new $P222, "String"
    assign $P222, "String"
    set $S223, $P222
    isa $I224, $P221, $S223
    unless $I224, if_220_end
# .annotate "line", 201
    new $P225, "String"
    assign $P225, "::"
    set $S226, $P225
    find_lex $P227, "$path"
    set $S228, $P227
    split $P229, $S226, $S228
    $P230 = "key_"($P229)
    store_lex "$path", $P230
  if_220_end:
# .annotate "line", 204
    find_lex $P231, "$path"
    get_hll_namespace $P232, $P231
    store_lex "$result", $P232
  if_217_end:
# .annotate "line", 199
    find_lex $P234, "$result"
# .annotate "line", 195
    .return ($P234)
  control_211:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P235, exception, "payload"
    .return ($P235)
.end


.namespace ["Parrot"]
.sub "get_self"  :subid("26_1267109918.00356") :outer("11_1267109918.00356")
# .annotate "line", 213
    new $P238, 'ExceptionHandler'
    set_addr $P238, control_237
    $P238."handle_types"(58)
    push_eh $P238
# .annotate "line", 214
    new $P239, "Undef"
    .lex "$self", $P239
    new $P240, "String"
    assign $P240, "self"
    set $S241, $P240
    find_dynamic_lex $P242, $S241
    store_lex "$self", $P242
# .annotate "line", 216
    find_lex $P244, "$self"
    isnull $I245, $P244
    unless $I245, if_243_end
# .annotate "line", 217
    die "Fatal: No 'self' lexical in any caller scope"
  if_243_end:
# .annotate "line", 220
    new $P246, "Exception"
    set $P246['type'], 58
    find_lex $P247, "$self"
    setattribute $P246, 'payload', $P247
    throw $P246
# .annotate "line", 213
    .return ()
  control_237:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P248, exception, "payload"
    .return ($P248)
.end


.namespace ["Parrot"]
.sub "get_sub"  :subid("27_1267109918.00356") :outer("11_1267109918.00356")
    .param pmc param_252
    .param pmc param_253 :optional :named("caller_nsp")
    .param int has_param_253 :opt_flag
# .annotate "line", 223
    new $P251, 'ExceptionHandler'
    set_addr $P251, control_250
    $P251."handle_types"(58)
    push_eh $P251
    .lex "$path", param_252
    if has_param_253, optparam_44
    new $P254, "Undef"
    set param_253, $P254
  optparam_44:
    .lex "$caller_nsp", param_253
# .annotate "line", 224
    new $P255, "ResizablePMCArray"
    .lex "@parts", $P255
# .annotate "line", 225
    new $P256, "Undef"
    .lex "$name", $P256
# .annotate "line", 226
    new $P257, "Undef"
    .lex "&sub", $P257
# .annotate "line", 238
    new $P258, "Undef"
    .lex "$namespace", $P258
# .annotate "line", 224
    find_lex $P259, "$path"
    $P260 = $P259."split"("::")
    store_lex "@parts", $P260
# .annotate "line", 225
    find_lex $P261, "@parts"
    $P262 = $P261."pop"()
    store_lex "$name", $P262
    find_lex $P263, "&sub"
# .annotate "line", 228
    find_lex $P265, "@parts"
    set $N266, $P265
    iseq $I267, $N266, 0.0
    unless $I267, if_264_end
# .annotate "line", 229
    find_lex $P269, "$caller_nsp"
    if $P269, unless_268_end
    $P270 = "caller_namespace"(2)
    store_lex "$caller_nsp", $P270
  unless_268_end:
# .annotate "line", 231
    find_lex $P271, "$caller_nsp"
    find_lex $P272, "$name"
    $P273 = $P271."find_sub"($P272)
    store_lex "&sub", $P273
# .annotate "line", 233
    get_hll_global $P275, ["Opcode"], "defined"
    find_lex $P276, "&sub"
    $P277 = $P275($P276)
    unless $P277, if_274_end
# .annotate "line", 234
    new $P278, "Exception"
    set $P278['type'], 58
    find_lex $P279, "&sub"
    setattribute $P278, 'payload', $P279
    throw $P278
  if_274_end:
  if_264_end:
# .annotate "line", 238
    get_hll_global $P280, ["Opcode"], "get_hll_namespace"
    find_lex $P281, "@parts"
    $P282 = $P280($P281)
    store_lex "$namespace", $P282
# .annotate "line", 240
    find_lex $P284, "$namespace"
    unless $P284, if_283_end
# .annotate "line", 241
    find_lex $P285, "$namespace"
    find_lex $P286, "$name"
    $P287 = $P285."find_sub"($P286)
    store_lex "&sub", $P287
  if_283_end:
# .annotate "line", 244
    new $P288, "Exception"
    set $P288['type'], 58
    find_lex $P289, "&sub"
    setattribute $P288, 'payload', $P289
    throw $P288
# .annotate "line", 223
    .return ()
  control_250:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P290, exception, "payload"
    .return ($P290)
.end


.namespace ["Parrot"]
.sub "key"  :subid("28_1267109918.00356") :outer("11_1267109918.00356")
    .param pmc param_294
    .param pmc param_295 :slurpy
# .annotate "line", 247
    new $P293, 'ExceptionHandler'
    set_addr $P293, control_292
    $P293."handle_types"(58)
    push_eh $P293
    .lex "$first", param_294
    .lex "@parts", param_295
# .annotate "line", 248
    find_lex $P296, "@parts"
    find_lex $P297, "$first"
    $P296."unshift"($P297)
# .annotate "line", 249
    find_lex $P298, "@parts"
    $P299 = "key_"($P298)
# .annotate "line", 247
    .return ($P299)
  control_292:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P300, exception, "payload"
    .return ($P300)
.end


.namespace ["Parrot"]
.sub "key_"  :subid("29_1267109918.00356") :outer("11_1267109918.00356")
    .param pmc param_304
# .annotate "line", 252
    .const 'Sub' $P312 = "30_1267109918.00356" 
    capture_lex $P312
    new $P303, 'ExceptionHandler'
    set_addr $P303, control_302
    $P303."handle_types"(58)
    push_eh $P303
    .lex "@parts", param_304
# .annotate "line", 253
    new $P305, "Undef"
    .lex "$key", $P305
# .annotate "line", 252
    find_lex $P306, "$key"
# .annotate "line", 255
    find_lex $P308, "@parts"
    defined $I309, $P308
    unless $I309, for_undef_45
    iter $P307, $P308
    new $P317, 'ExceptionHandler'
    set_addr $P317, loop316_handler
    $P317."handle_types"(65, 67, 66)
    push_eh $P317
  loop316_test:
    unless $P307, loop316_done
    shift $P310, $P307
  loop316_redo:
    .const 'Sub' $P312 = "30_1267109918.00356" 
    capture_lex $P312
    $P312($P310)
  loop316_next:
    goto loop316_test
  loop316_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P318, exception, 'type'
    eq $P318, 65, loop316_next
    eq $P318, 67, loop316_redo
  loop316_done:
    pop_eh 
  for_undef_45:
    find_lex $P319, "$key"
# .annotate "line", 252
    .return ($P319)
  control_302:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P320, exception, "payload"
    .return ($P320)
.end


.namespace ["Parrot"]
.sub "_block311"  :anon :subid("30_1267109918.00356") :outer("29_1267109918.00356")
    .param pmc param_314
# .annotate "line", 256
    new $P313, "Undef"
    .lex "$element", $P313
    .lex "$_", param_314
    find_lex $P315, "$_"
    store_lex "$element", $P315
# .annotate "line", 257

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
		
# .annotate "line", 255
    .return ()
.end


.namespace ["Parrot"]
.sub "namespace_name"  :subid("31_1267109918.00356") :outer("11_1267109918.00356")
    .param pmc param_324
# .annotate "line", 309
    new $P323, 'ExceptionHandler'
    set_addr $P323, control_322
    $P323."handle_types"(58)
    push_eh $P323
    .lex "$nsp", param_324
# .annotate "line", 310
    find_lex $P327, "$nsp"
    isa $I328, $P327, "String"
    if $I328, if_326
# .annotate "line", 312
    find_lex $P330, "$nsp"
    $P331 = $P330."string_name"()
    set $P325, $P331
# .annotate "line", 310
    goto if_326_end
  if_326:
    find_lex $P329, "$nsp"
    set $P325, $P329
  if_326_end:
# .annotate "line", 309
    .return ($P325)
  control_322:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P332, exception, "payload"
    .return ($P332)
.end


.namespace ["Parrot"]
.sub "new"  :subid("32_1267109918.00356") :method :outer("11_1267109918.00356")
    .param pmc param_355
    .param pmc param_356 :optional
    .param int has_param_356 :opt_flag
# .annotate "line", 315
    new $P354, 'ExceptionHandler'
    set_addr $P354, control_353
    $P354."handle_types"(58)
    push_eh $P354
    .lex "self", self
    .lex "$pmc", param_355
    if has_param_356, optparam_46
    new $P357, "Hash"
    set param_356, $P357
  optparam_46:
    .lex "%args", param_356
# .annotate "line", 316
    new $P358, "Undef"
    .lex "$key", $P358
    get_hll_global $P359, "Key"
    find_lex $P360, "$pmc"
    $P361 = $P360."split"("::")
    $P362 = $P359."new_"($P361)
    store_lex "$key", $P362
# .annotate "line", 318
    find_lex $P365, "%args"
    $N366 = $P365."elems"()
    iseq $I367, $N366, 0.0
    if $I367, if_364
# .annotate "line", 320
    find_lex $P370, "$key"
    find_lex $P371, "%args"
    new $P372, $P370, $P371
    set $P363, $P372
# .annotate "line", 318
    goto if_364_end
  if_364:
# .annotate "line", 319
    find_lex $P368, "$key"
    new $P369, $P368
    set $P363, $P369
  if_364_end:
# .annotate "line", 315
    .return ($P363)
  control_353:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P373, exception, "payload"
    .return ($P373)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109897.44325")
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
.sub "_block13"  :subid("11_1267109897.44325") :outer("10_1267109897.44325")
# .annotate "line", 7
    .const 'Sub' $P141 = "16_1267109897.44325" 
    capture_lex $P141
    .const 'Sub' $P35 = "14_1267109897.44325" 
    capture_lex $P35
    .const 'Sub' $P23 = "13_1267109897.44325" 
    capture_lex $P23
    .const 'Sub' $P15 = "12_1267109897.44325" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1267109897.44325" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 12
    .const 'Sub' $P23 = "13_1267109897.44325" 
    capture_lex $P23
    .lex "compile", $P23
# .annotate "line", 17
    .const 'Sub' $P35 = "14_1267109897.44325" 
    capture_lex $P35
    .lex "compile_sub", $P35
# .annotate "line", 59
    .const 'Sub' $P141 = "16_1267109897.44325" 
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
.sub "_pre_initload"  :subid("12_1267109897.44325") :outer("11_1267109897.44325")
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
.sub "compile"  :subid("13_1267109897.44325") :outer("11_1267109897.44325")
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
.sub "compile_sub"  :subid("14_1267109897.44325") :outer("11_1267109897.44325")
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
    .const 'Sub' $P120 = "15_1267109897.44325" 
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
    .const 'Sub' $P120 = "15_1267109897.44325" 
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
.sub "_block119"  :anon :subid("15_1267109897.44325") :outer("14_1267109897.44325")
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
.sub "pir_namespace"  :subid("16_1267109897.44325") :outer("11_1267109897.44325")
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
.sub "_block11"  :anon :subid("10_1267109955.63413")
# .annotate "line", 0
    get_hll_global $P14, ["Array"], "_block13" 
    capture_lex $P14
# .annotate "line", 9
    get_hll_global $P14, ["Array"], "_block13" 
    capture_lex $P14
    $P963 = $P14()
# .annotate "line", 1
    .return ($P963)
.end


.namespace ["Array"]
.sub "_block13"  :subid("11_1267109955.63413") :outer("10_1267109955.63413")
# .annotate "line", 9
    .const 'Sub' $P896 = "56_1267109955.63413" 
    capture_lex $P896
    .const 'Sub' $P880 = "55_1267109955.63413" 
    capture_lex $P880
    .const 'Sub' $P819 = "54_1267109955.63413" 
    capture_lex $P819
    .const 'Sub' $P810 = "53_1267109955.63413" 
    capture_lex $P810
    .const 'Sub' $P757 = "52_1267109955.63413" 
    capture_lex $P757
    .const 'Sub' $P724 = "50_1267109955.63413" 
    capture_lex $P724
    .const 'Sub' $P699 = "48_1267109955.63413" 
    capture_lex $P699
    .const 'Sub' $P688 = "47_1267109955.63413" 
    capture_lex $P688
    .const 'Sub' $P663 = "45_1267109955.63413" 
    capture_lex $P663
    .const 'Sub' $P634 = "44_1267109955.63413" 
    capture_lex $P634
    .const 'Sub' $P597 = "43_1267109955.63413" 
    capture_lex $P597
    .const 'Sub' $P571 = "41_1267109955.63413" 
    capture_lex $P571
    .const 'Sub' $P564 = "40_1267109955.63413" 
    capture_lex $P564
    .const 'Sub' $P559 = "39_1267109955.63413" 
    capture_lex $P559
    .const 'Sub' $P507 = "38_1267109955.63413" 
    capture_lex $P507
    .const 'Sub' $P498 = "37_1267109955.63413" 
    capture_lex $P498
    .const 'Sub' $P476 = "35_1267109955.63413" 
    capture_lex $P476
    .const 'Sub' $P357 = "34_1267109955.63413" 
    capture_lex $P357
    .const 'Sub' $P339 = "32_1267109955.63413" 
    capture_lex $P339
    .const 'Sub' $P275 = "29_1267109955.63413" 
    capture_lex $P275
    .const 'Sub' $P234 = "27_1267109955.63413" 
    capture_lex $P234
    .const 'Sub' $P225 = "26_1267109955.63413" 
    capture_lex $P225
    .const 'Sub' $P219 = "25_1267109955.63413" 
    capture_lex $P219
    .const 'Sub' $P210 = "24_1267109955.63413" 
    capture_lex $P210
    .const 'Sub' $P201 = "23_1267109955.63413" 
    capture_lex $P201
    .const 'Sub' $P180 = "21_1267109955.63413" 
    capture_lex $P180
    .const 'Sub' $P163 = "20_1267109955.63413" 
    capture_lex $P163
    .const 'Sub' $P146 = "19_1267109955.63413" 
    capture_lex $P146
    .const 'Sub' $P136 = "18_1267109955.63413" 
    capture_lex $P136
    .const 'Sub' $P126 = "17_1267109955.63413" 
    capture_lex $P126
    .const 'Sub' $P15 = "12_1267109955.63413" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1267109955.63413" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 185
    .const 'Sub' $P126 = "17_1267109955.63413" 
    capture_lex $P126
    .lex "cmp_numeric", $P126
# .annotate "line", 186
    .const 'Sub' $P136 = "18_1267109955.63413" 
    capture_lex $P136
    .lex "cmp_numeric_R", $P136
# .annotate "line", 187
    .const 'Sub' $P146 = "19_1267109955.63413" 
    capture_lex $P146
    .lex "cmp_string", $P146
# .annotate "line", 188
    .const 'Sub' $P163 = "20_1267109955.63413" 
    capture_lex $P163
    .lex "cmp_string_R", $P163
# .annotate "line", 193
    .const 'Sub' $P180 = "21_1267109955.63413" 
    capture_lex $P180
    .lex "cat", $P180
# .annotate "line", 245
    .const 'Sub' $P201 = "23_1267109955.63413" 
    capture_lex $P201
    .lex "grep_args", $P201
# .annotate "line", 307
    .const 'Sub' $P210 = "24_1267109955.63413" 
    capture_lex $P210
    .lex "map_args", $P210
# .annotate "line", 321
    .const 'Sub' $P219 = "25_1267109955.63413" 
    capture_lex $P219
    .lex "new", $P219
# .annotate "line", 325
    .const 'Sub' $P225 = "26_1267109955.63413" 
    capture_lex $P225
    .lex "reduce_args", $P225
# .annotate "line", 368
    .const 'Sub' $P234 = "27_1267109955.63413" 
    capture_lex $P234
    .lex "roundrobin", $P234
# .annotate "line", 444
    .const 'Sub' $P275 = "29_1267109955.63413" 
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
    find_lex $P809, "roundrobin"
# .annotate "line", 419
    find_lex $P962, "zip"
# .annotate "line", 9
    .return ($P962)
.end


.namespace ["Array"]
.sub "_pre_initload"  :subid("12_1267109955.63413") :outer("11_1267109955.63413")
# .annotate "line", 9
    .const 'Sub' $P111 = "16_1267109955.63413" 
    capture_lex $P111
    .const 'Sub' $P96 = "15_1267109955.63413" 
    capture_lex $P96
    .const 'Sub' $P46 = "13_1267109955.63413" 
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
    .const 'Sub' $P46 = "13_1267109955.63413" 
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
    .const 'Sub' $P96 = "15_1267109955.63413" 
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
    .const 'Sub' $P111 = "16_1267109955.63413" 
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
.sub "_block45"  :anon :subid("13_1267109955.63413") :outer("12_1267109955.63413")
    .param pmc param_50
# .annotate "line", 46
    .const 'Sub' $P65 = "14_1267109955.63413" 
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
    .const 'Sub' $P65 = "14_1267109955.63413" 
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
.sub "_block64"  :anon :subid("14_1267109955.63413") :outer("13_1267109955.63413")
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
.sub "_block95"  :anon :subid("15_1267109955.63413") :outer("12_1267109955.63413")
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
.sub "_block110"  :anon :subid("16_1267109955.63413") :outer("12_1267109955.63413")
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
.sub "cmp_numeric"  :subid("17_1267109955.63413") :outer("11_1267109955.63413")
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
.sub "cmp_numeric_R"  :subid("18_1267109955.63413") :outer("11_1267109955.63413")
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
.sub "cmp_string"  :subid("19_1267109955.63413") :outer("11_1267109955.63413")
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
.sub "cmp_string_R"  :subid("20_1267109955.63413") :outer("11_1267109955.63413")
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
.sub "cat"  :subid("21_1267109955.63413") :outer("11_1267109955.63413")
    .param pmc param_183 :slurpy
# .annotate "line", 193
    .const 'Sub' $P191 = "22_1267109955.63413" 
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
    .const 'Sub' $P191 = "22_1267109955.63413" 
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
.sub "_block190"  :anon :subid("22_1267109955.63413") :outer("21_1267109955.63413")
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
.sub "grep_args"  :subid("23_1267109955.63413") :outer("11_1267109955.63413")
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
.sub "map_args"  :subid("24_1267109955.63413") :outer("11_1267109955.63413")
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
.sub "new"  :subid("25_1267109955.63413") :outer("11_1267109955.63413")
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
.sub "reduce_args"  :subid("26_1267109955.63413") :outer("11_1267109955.63413")
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
.sub "roundrobin"  :subid("27_1267109955.63413") :outer("11_1267109955.63413")
    .param pmc param_237 :slurpy
# .annotate "line", 368
    .const 'Sub' $P251 = "28_1267109955.63413" 
    capture_lex $P251
    new $P236, 'ExceptionHandler'
    set_addr $P236, control_235
    $P236."handle_types"(58)
    push_eh $P236
    .lex "@sources", param_237
# .annotate "line", 369
    new $P238, "ResizablePMCArray"
    .lex "@result", $P238
# .annotate "line", 370
    new $P239, "Undef"
    .lex "$i", $P239
# .annotate "line", 371
    new $P240, "Undef"
    .lex "$done", $P240
# .annotate "line", 368
    find_lex $P241, "@result"
# .annotate "line", 370
    new $P242, "Integer"
    assign $P242, 0
    store_lex "$i", $P242
    find_lex $P243, "$done"
# .annotate "line", 373
    new $P271, 'ExceptionHandler'
    set_addr $P271, loop270_handler
    $P271."handle_types"(65, 67, 66)
    push_eh $P271
  loop270_test:
    find_lex $P244, "$done"
    if $P244, loop270_done
  loop270_redo:
# .annotate "line", 374
    new $P245, "Integer"
    assign $P245, 1
    store_lex "$done", $P245
# .annotate "line", 376
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
    .const 'Sub' $P251 = "28_1267109955.63413" 
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
# .annotate "line", 373
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
# .annotate "line", 368
    .return ($P273)
  control_235:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P274, exception, "payload"
    .return ($P274)
.end


.namespace ["Array"]
.sub "_block250"  :anon :subid("28_1267109955.63413") :outer("27_1267109955.63413")
    .param pmc param_252
# .annotate "line", 376
    .lex "@a", param_252
# .annotate "line", 377
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
# .annotate "line", 378
    new $P260, "Integer"
    assign $P260, 0
    store_lex "$done", $P260
# .annotate "line", 379
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
# .annotate "line", 377
    set $P253, $P266
  if_254_end:
# .annotate "line", 376
    .return ($P253)
.end


.namespace ["Array"]
.sub "zip"  :subid("29_1267109955.63413") :outer("11_1267109955.63413")
    .param pmc param_278 :slurpy
# .annotate "line", 444
    .const 'Sub' $P320 = "31_1267109955.63413" 
    capture_lex $P320
    .const 'Sub' $P295 = "30_1267109955.63413" 
    capture_lex $P295
    new $P277, 'ExceptionHandler'
    set_addr $P277, control_276
    $P277."handle_types"(58)
    push_eh $P277
    .lex "@sources", param_278
# .annotate "line", 445
    new $P279, "ResizablePMCArray"
    .lex "@result", $P279
# .annotate "line", 446
    new $P280, "Undef"
    .lex "$limit", $P280
# .annotate "line", 457
    new $P281, "Undef"
    .lex "$i", $P281
# .annotate "line", 444
    find_lex $P282, "@result"
# .annotate "line", 446
    new $P283, "Integer"
    assign $P283, 0
    store_lex "$limit", $P283
# .annotate "line", 448
    find_lex $P285, "@sources"
    $P286 = $P285."elems"()
    unless $P286, if_284_end
# .annotate "line", 449
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
# .annotate "line", 452
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
    .const 'Sub' $P295 = "30_1267109955.63413" 
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
# .annotate "line", 457
    new $P309, "Integer"
    assign $P309, 0
    store_lex "$i", $P309
# .annotate "line", 459
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
# .annotate "line", 460
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
    .const 'Sub' $P320 = "31_1267109955.63413" 
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
# .annotate "line", 459
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
# .annotate "line", 444
    .return ($P336)
  control_276:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P337, exception, "payload"
    .return ($P337)
.end


.namespace ["Array"]
.sub "_block294"  :anon :subid("30_1267109955.63413") :outer("29_1267109955.63413")
    .param pmc param_296
# .annotate "line", 452
    .lex "@a", param_296
# .annotate "line", 454
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
# .annotate "line", 453
    find_lex $P304, "@a"
    $P305 = $P304."elems"()
    store_lex "$limit", $P305
    set $P297, $P305
  if_298_end:
# .annotate "line", 452
    .return ($P297)
.end


.namespace ["Array"]
.sub "_block319"  :anon :subid("31_1267109955.63413") :outer("29_1267109955.63413")
    .param pmc param_321
# .annotate "line", 460
    .lex "@a", param_321
# .annotate "line", 461
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
# .annotate "line", 460
    .return ($P327)
.end


.namespace ["Array"]
.sub "append"  :subid("32_1267109955.63413") :method :outer("11_1267109955.63413")
    .param pmc param_342
# .annotate "line", 80
    .const 'Sub' $P348 = "33_1267109955.63413" 
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
    .const 'Sub' $P348 = "33_1267109955.63413" 
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
.sub "_block347"  :anon :subid("33_1267109955.63413") :outer("32_1267109955.63413")
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
.sub "bsearch"  :subid("34_1267109955.63413") :method :outer("11_1267109955.63413")
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
.sub "contains"  :subid("35_1267109955.63413") :method :outer("11_1267109955.63413")
    .param pmc param_479
# .annotate "line", 203
    .const 'Sub' $P485 = "36_1267109955.63413" 
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
    .const 'Sub' $P485 = "36_1267109955.63413" 
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
.sub "_block484"  :anon :subid("36_1267109955.63413") :outer("35_1267109955.63413")
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
.sub "delete"  :subid("37_1267109955.63413") :method :outer("11_1267109955.63413")
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
.sub "distinct"  :subid("38_1267109955.63413") :method :outer("11_1267109955.63413")
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
.sub "elements"  :subid("39_1267109955.63413") :method :outer("11_1267109955.63413")
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
.sub "elems"  :subid("40_1267109955.63413") :method :outer("11_1267109955.63413")
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
.sub "grep"  :subid("41_1267109955.63413") :method :outer("11_1267109955.63413")
    .param pmc param_574
# .annotate "line", 249
    .const 'Sub' $P582 = "42_1267109955.63413" 
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
    .const 'Sub' $P582 = "42_1267109955.63413" 
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
.sub "_block581"  :anon :subid("42_1267109955.63413") :outer("41_1267109955.63413")
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
.sub "is_sorted"  :subid("43_1267109955.63413") :method :outer("11_1267109955.63413")
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
.sub "keys"  :subid("44_1267109955.63413") :method :outer("11_1267109955.63413")
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
.sub "kv"  :subid("45_1267109955.63413") :method :outer("11_1267109955.63413")
# .annotate "line", 290
    .const 'Sub' $P675 = "46_1267109955.63413" 
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
    .const 'Sub' $P675 = "46_1267109955.63413" 
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
.sub "_block674"  :anon :subid("46_1267109955.63413") :outer("45_1267109955.63413")
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
.sub "join"  :subid("47_1267109955.63413") :method :outer("11_1267109955.63413")
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
.sub "map"  :subid("48_1267109955.63413") :method :outer("11_1267109955.63413")
    .param pmc param_702
# .annotate "line", 311
    .const 'Sub' $P710 = "49_1267109955.63413" 
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
    .const 'Sub' $P710 = "49_1267109955.63413" 
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
.sub "_block709"  :anon :subid("49_1267109955.63413") :outer("48_1267109955.63413")
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
.sub "reduce"  :subid("50_1267109955.63413") :method :outer("11_1267109955.63413")
    .param pmc param_727
# .annotate "line", 329
    .const 'Sub' $P740 = "51_1267109955.63413" 
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
    .const 'Sub' $P740 = "51_1267109955.63413" 
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
.sub "_block739"  :anon :subid("51_1267109955.63413") :outer("50_1267109955.63413")
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
.sub "reverse"  :subid("52_1267109955.63413") :method :outer("11_1267109955.63413")
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
    store_lex "$to", $P769
  unless_765_end:
    find_lex $P770, "$temp"
# .annotate "line", 351
    find_lex $P772, "$from"
    set $N773, $P772
    find_lex $P774, "$to"
    set $N775, $P774
    isgt $I776, $N773, $N775
    unless $I776, if_771_end
# .annotate "line", 352
    find_lex $P777, "$from"
    store_lex "$temp", $P777
# .annotate "line", 353
    find_lex $P778, "$to"
    store_lex "$from", $P778
# .annotate "line", 354
    find_lex $P779, "$temp"
    store_lex "$to", $P779
  if_771_end:
# .annotate "line", 357
    new $P805, 'ExceptionHandler'
    set_addr $P805, loop804_handler
    $P805."handle_types"(65, 67, 66)
    push_eh $P805
  loop804_test:
    find_lex $P780, "$from"
    set $N781, $P780
    find_lex $P782, "$to"
    set $N783, $P782
    islt $I784, $N781, $N783
    unless $I784, loop804_done
  loop804_redo:
# .annotate "line", 358
    find_lex $P785, "$from"
    set $I786, $P785
    find_lex $P787, "self"
    unless_null $P787, vivify_124
    new $P787, "ResizablePMCArray"
  vivify_124:
    set $P788, $P787[$I786]
    unless_null $P788, vivify_125
    new $P788, "Undef"
  vivify_125:
    store_lex "$temp", $P788
# .annotate "line", 359
    find_lex $P789, "$to"
    set $I790, $P789
    find_lex $P791, "self"
    unless_null $P791, vivify_126
    new $P791, "ResizablePMCArray"
  vivify_126:
    set $P792, $P791[$I790]
    unless_null $P792, vivify_127
    new $P792, "Undef"
  vivify_127:
    find_lex $P793, "$from"
    set $I794, $P793
    find_lex $P795, "self"
    unless_null $P795, vivify_128
    new $P795, "ResizablePMCArray"
    store_lex "self", $P795
  vivify_128:
    set $P795[$I794], $P792
# .annotate "line", 360
    find_lex $P796, "$temp"
    find_lex $P797, "$to"
    set $I798, $P797
    find_lex $P799, "self"
    unless_null $P799, vivify_129
    new $P799, "ResizablePMCArray"
    store_lex "self", $P799
  vivify_129:
    set $P799[$I798], $P796
    find_lex $P800, "$from"
    clone $P801, $P800
    inc $P800
    find_lex $P802, "$to"
    clone $P803, $P802
    dec $P802
  loop804_next:
# .annotate "line", 357
    goto loop804_test
  loop804_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P806, exception, 'type'
    eq $P806, 65, loop804_next
    eq $P806, 67, loop804_redo
  loop804_done:
    pop_eh 
    find_lex $P807, "self"
# .annotate "line", 348
    .return ($P807)
  control_758:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P808, exception, "payload"
    .return ($P808)
.end


.namespace ["Array"]
.sub "set_size"  :subid("53_1267109955.63413") :method :outer("11_1267109955.63413")
    .param pmc param_813
# .annotate "line", 387
    new $P812, 'ExceptionHandler'
    set_addr $P812, control_811
    $P812."handle_types"(58)
    push_eh $P812
    .lex "self", self
    .lex "$size", param_813
# .annotate "line", 388
    find_lex $P814, "self"
    find_lex $P815, "$size"
    set $I816, $P815
    assign $P814, $I816
    find_lex $P817, "self"
# .annotate "line", 387
    .return ($P817)
  control_811:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P818, exception, "payload"
    .return ($P818)
.end


.namespace ["Array"]
.sub "slice"  :subid("54_1267109955.63413") :method :outer("11_1267109955.63413")
    .param pmc param_822 :optional :named("from")
    .param int has_param_822 :opt_flag
    .param pmc param_824 :optional :named("to")
    .param int has_param_824 :opt_flag
# .annotate "line", 392
    new $P821, 'ExceptionHandler'
    set_addr $P821, control_820
    $P821."handle_types"(58)
    push_eh $P821
    .lex "self", self
    if has_param_822, optparam_130
    new $P823, "Integer"
    assign $P823, 0
    set param_822, $P823
  optparam_130:
    .lex "$from", param_822
    if has_param_824, optparam_131
    new $P825, "Undef"
    set param_824, $P825
  optparam_131:
    .lex "$to", param_824
# .annotate "line", 393
    new $P826, "Undef"
    .lex "$elems", $P826
# .annotate "line", 407
    get_global $P827, "@Empty"
    unless_null $P827, vivify_132
    new $P827, "ResizablePMCArray"
    set_global "@Empty", $P827
  vivify_132:
# .annotate "line", 408
    new $P828, "ResizablePMCArray"
    .lex "@slice", $P828
# .annotate "line", 393
    find_lex $P829, "self"
    $P830 = $P829."elems"()
    store_lex "$elems", $P830
# .annotate "line", 394
    find_lex $P832, "$to"
    $P833 = $P832."defined"()
    if $P833, unless_831_end
    find_lex $P834, "$elems"
    store_lex "$to", $P834
  unless_831_end:
# .annotate "line", 396
    find_lex $P836, "$from"
    set $N837, $P836
    islt $I838, $N837, 0.0
    unless $I838, if_835_end
    find_lex $P839, "$from"
    find_lex $P840, "$elems"
    add $P841, $P839, $P840
    store_lex "$from", $P841
  if_835_end:
# .annotate "line", 397
    find_lex $P843, "$to"
    set $N844, $P843
    islt $I845, $N844, 0.0
    unless $I845, if_842_end
    find_lex $P846, "$to"
    find_lex $P847, "$elems"
    add $P848, $P846, $P847
    store_lex "$to", $P848
  if_842_end:
# .annotate "line", 399
    find_lex $P850, "$from"
    set $N851, $P850
    find_lex $P852, "$elems"
    set $N853, $P852
    isge $I854, $N851, $N853
    unless $I854, if_849_end
# .annotate "line", 400
    find_lex $P855, "$from"
    find_lex $P856, "$elems"
    "die"("$from parameter out of range: ", $P855, " exceeds # elements: ", $P856)
  if_849_end:
# .annotate "line", 403
    find_lex $P858, "$to"
    set $N859, $P858
    find_lex $P860, "$elems"
    set $N861, $P860
    isgt $I862, $N859, $N861
    unless $I862, if_857_end
# .annotate "line", 404
    find_lex $P863, "$from"
    find_lex $P864, "$elems"
    "die"("$to parameter out of range: ", $P863, " exceeds # elements: ", $P864)
  if_857_end:
# .annotate "line", 403
    get_global $P865, "@Empty"
# .annotate "line", 408
    find_lex $P866, "self"
    $P867 = $P866."clone"()
    store_lex "@slice", $P867
# .annotate "line", 409
    find_lex $P868, "@slice"
    get_global $P869, "@Empty"
    find_lex $P870, "$to"
    add $P871, $P870, 1
    find_lex $P872, "$elems"
    find_lex $P873, "$to"
    sub $P874, $P872, $P873
    $P868."splice"($P869, $P871 :named("from"), $P874 :named("replacing"))
# .annotate "line", 410
    find_lex $P875, "@slice"
    get_global $P876, "@Empty"
    find_lex $P877, "$from"
    $P875."splice"($P876, 0 :named("from"), $P877 :named("replacing"))
    find_lex $P878, "@slice"
# .annotate "line", 392
    .return ($P878)
  control_820:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P879, exception, "payload"
    .return ($P879)
.end


.namespace ["Array"]
.sub "splice"  :subid("55_1267109955.63413") :method :outer("11_1267109955.63413")
    .param pmc param_883
    .param pmc param_884 :optional :named("from")
    .param int has_param_884 :opt_flag
    .param pmc param_886 :optional :named("replacing")
    .param int has_param_886 :opt_flag
# .annotate "line", 414
    new $P882, 'ExceptionHandler'
    set_addr $P882, control_881
    $P882."handle_types"(58)
    push_eh $P882
    .lex "self", self
    .lex "@value", param_883
    if has_param_884, optparam_133
    new $P885, "Integer"
    assign $P885, 0
    set param_884, $P885
  optparam_133:
    .lex "$from", param_884
    if has_param_886, optparam_134
    new $P887, "Integer"
    assign $P887, 0
    set param_886, $P887
  optparam_134:
    .lex "$replacing", param_886
# .annotate "line", 415
    find_lex $P888, "self"
    find_lex $P889, "@value"
    find_lex $P890, "$from"
    set $I891, $P890
    find_lex $P892, "$replacing"
    set $I893, $P892
    splice $P888, $P889, $I891, $I893
    find_lex $P894, "self"
# .annotate "line", 414
    .return ($P894)
  control_881:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P895, exception, "payload"
    .return ($P895)
.end


.namespace ["Array"]
.sub "unsort"  :subid("56_1267109955.63413") :method :outer("11_1267109955.63413")
# .annotate "line", 419
    .const 'Sub' $P910 = "57_1267109955.63413" 
    capture_lex $P910
    new $P898, 'ExceptionHandler'
    set_addr $P898, control_897
    $P898."handle_types"(58)
    push_eh $P898
    .lex "self", self
# .annotate "line", 420
    get_global $P899, "&Parrot_range_rand"
    unless_null $P899, vivify_135
    new $P899, "Undef"
    set_global "&Parrot_range_rand", $P899
  vivify_135:
# .annotate "line", 428
    new $P900, "Undef"
    .lex "$bound", $P900
# .annotate "line", 429
    new $P901, "Undef"
    .lex "$swap", $P901
# .annotate "line", 430
    new $P902, "Undef"
    .lex "$temp", $P902
# .annotate "line", 419
    get_global $P903, "&Parrot_range_rand"
# .annotate "line", 422
    get_global $P905, "&Parrot_range_rand"
    defined $I906, $P905
    new $P907, 'Integer'
    set $P907, $I906
    isfalse $I908, $P907
    unless $I908, if_904_end
    .const 'Sub' $P910 = "57_1267109955.63413" 
    capture_lex $P910
    $P910()
  if_904_end:
# .annotate "line", 428
    find_lex $P920, "self"
    $P921 = $P920."elems"()
    sub $P922, $P921, 1
    store_lex "$bound", $P922
    find_lex $P923, "$swap"
    find_lex $P924, "$temp"
# .annotate "line", 432
    new $P958, 'ExceptionHandler'
    set_addr $P958, loop957_handler
    $P958."handle_types"(65, 67, 66)
    push_eh $P958
  loop957_test:
    find_lex $P925, "$bound"
    set $N926, $P925
    isgt $I927, $N926, 0.0
    unless $I927, loop957_done
  loop957_redo:
# .annotate "line", 433
    get_global $P928, "&Parrot_range_rand"
    find_lex $P929, "$bound"
    add $P930, $P929, 1
    $P931 = $P928(0, $P930, 0)
    store_lex "$swap", $P931
# .annotate "line", 434
    find_lex $P933, "$swap"
    set $N934, $P933
    find_lex $P935, "$bound"
    set $N936, $P935
    isgt $I937, $N934, $N936
    unless $I937, if_932_end
    find_lex $P938, "$swap"
    clone $P939, $P938
    dec $P938
  if_932_end:
# .annotate "line", 435
    find_lex $P940, "$bound"
    set $I941, $P940
    find_lex $P942, "self"
    unless_null $P942, vivify_136
    new $P942, "ResizablePMCArray"
  vivify_136:
    set $P943, $P942[$I941]
    unless_null $P943, vivify_137
    new $P943, "Undef"
  vivify_137:
    store_lex "$temp", $P943
# .annotate "line", 436
    find_lex $P944, "$swap"
    set $I945, $P944
    find_lex $P946, "self"
    unless_null $P946, vivify_138
    new $P946, "ResizablePMCArray"
  vivify_138:
    set $P947, $P946[$I945]
    unless_null $P947, vivify_139
    new $P947, "Undef"
  vivify_139:
    find_lex $P948, "$bound"
    set $I949, $P948
    find_lex $P950, "self"
    unless_null $P950, vivify_140
    new $P950, "ResizablePMCArray"
    store_lex "self", $P950
  vivify_140:
    set $P950[$I949], $P947
# .annotate "line", 437
    find_lex $P951, "$temp"
    find_lex $P952, "$swap"
    set $I953, $P952
    find_lex $P954, "self"
    unless_null $P954, vivify_141
    new $P954, "ResizablePMCArray"
    store_lex "self", $P954
  vivify_141:
    set $P954[$I953], $P951
    find_lex $P955, "$bound"
    clone $P956, $P955
    dec $P955
  loop957_next:
# .annotate "line", 432
    goto loop957_test
  loop957_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P959, exception, 'type'
    eq $P959, 65, loop957_next
    eq $P959, 67, loop957_redo
  loop957_done:
    pop_eh 
    find_lex $P960, "self"
# .annotate "line", 419
    .return ($P960)
  control_897:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P961, exception, "payload"
    .return ($P961)
.end


.namespace ["Array"]
.sub "_block909"  :anon :subid("57_1267109955.63413") :outer("56_1267109955.63413")
# .annotate "line", 424
    new $P911, "Undef"
    .lex "$lib", $P911
    null $S912
    loadlib $P913, $S912
    store_lex "$lib", $P913
# .annotate "line", 425
    find_lex $P914, "$lib"
    new $P915, "String"
    assign $P915, "Parrot_range_rand"
    set $S916, $P915
    new $P917, "String"
    assign $P917, "iiii"
    set $S918, $P917
    dlfunc $P919, $P914, $S916, $S918
    set_global "&Parrot_range_rand", $P919
# .annotate "line", 422
    .return ($P919)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109890.11314")
# .annotate "line", 0
    get_hll_global $P14, ["Kakapo";"Pmc";"COMMON"], "_block13" 
    capture_lex $P14
# .annotate "line", 18
    get_hll_global $P14, ["Kakapo";"Pmc";"COMMON"], "_block13" 
    capture_lex $P14
    $P253 = $P14()
# .annotate "line", 1
    .return ($P253)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block13"  :subid("11_1267109890.11314") :outer("10_1267109890.11314")
# .annotate "line", 18
    .const 'Sub' $P245 = "24_1267109890.11314" 
    capture_lex $P245
    .const 'Sub' $P235 = "23_1267109890.11314" 
    capture_lex $P235
    .const 'Sub' $P231 = "22_1267109890.11314" 
    capture_lex $P231
    .const 'Sub' $P224 = "21_1267109890.11314" 
    capture_lex $P224
    .const 'Sub' $P215 = "20_1267109890.11314" 
    capture_lex $P215
    .const 'Sub' $P148 = "18_1267109890.11314" 
    capture_lex $P148
    .const 'Sub' $P125 = "17_1267109890.11314" 
    capture_lex $P125
    .const 'Sub' $P15 = "12_1267109890.11314" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1267109890.11314" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 105
    .const 'Sub' $P125 = "17_1267109890.11314" 
    capture_lex $P125
    .lex "create_new_method", $P125
# .annotate "line", 146
    .const 'Sub' $P148 = "18_1267109890.11314" 
    capture_lex $P148
    .lex "install_methods", $P148
# .annotate "line", 18
    find_lex $P214, "_pre_initload"
# .annotate "line", 101
    find_lex $P230, "create_new_method"
# .annotate "line", 144
    find_lex $P244, "install_methods"
# .annotate "line", 184
    .const 'Sub' $P245 = "24_1267109890.11314" 
    capture_lex $P245
# .annotate "line", 18
    .return ($P245)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_pre_initload"  :subid("12_1267109890.11314") :outer("11_1267109890.11314")
# .annotate "line", 18
    .const 'Sub' $P97 = "15_1267109890.11314" 
    capture_lex $P97
    .const 'Sub' $P74 = "14_1267109890.11314" 
    capture_lex $P74
    .const 'Sub' $P51 = "13_1267109890.11314" 
    capture_lex $P51
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 20
    new $P18, "Hash"
    .lex "%methods_for", $P18
# .annotate "line", 35
    new $P19, "Undef"
    .lex "$from_nsp", $P19
# .annotate "line", 38
    new $P20, "ResizablePMCArray"
    .lex "@first_pmcs", $P20
# .annotate "line", 18
    find_lex $P21, "%methods_for"
# .annotate "line", 21
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
# .annotate "line", 23
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
# .annotate "line", 24
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
# .annotate "line", 25
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
# .annotate "line", 26
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
# .annotate "line", 27
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
# .annotate "line", 28
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
# .annotate "line", 29
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
# .annotate "line", 30
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
# .annotate "line", 32
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
# .annotate "line", 33
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
# .annotate "line", 35
    get_namespace $P44
    store_lex "$from_nsp", $P44
# .annotate "line", 38
    new $P45, "ResizablePMCArray"
    push $P45, "Undef"
    push $P45, "String"
    push $P45, "Hash"
    push $P45, "ResizablePMCArray"
    push $P45, "ResizableStringArray"
    store_lex "@first_pmcs", $P45
# .annotate "line", 47
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
    .const 'Sub' $P51 = "13_1267109890.11314" 
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
# .annotate "line", 54
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
    .const 'Sub' $P74 = "14_1267109890.11314" 
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
# .annotate "line", 61
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
    .const 'Sub' $P97 = "15_1267109890.11314" 
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
# .annotate "line", 18
    .return ($P92)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P124, exception, "payload"
    .return ($P124)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block50"  :anon :subid("13_1267109890.11314") :outer("12_1267109890.11314")
    .param pmc param_53
# .annotate "line", 49
    new $P52, "Undef"
    .lex "$namespace", $P52
    .lex "$_", param_53
# .annotate "line", 48
    get_hll_global $P54, "P6metaclass"
    find_lex $P55, "$_"
    set $S56, $P55
    $P54."register"($S56)
# .annotate "line", 49
    get_hll_global $P57, ["Parrot"], "get_hll_namespace"
    find_lex $P58, "$_"
    set $S59, $P58
    $P60 = $P57($S59)
    store_lex "$namespace", $P60
# .annotate "line", 50
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
# .annotate "line", 47
    .return ($P65)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block73"  :anon :subid("14_1267109890.11314") :outer("12_1267109890.11314")
    .param pmc param_77
# .annotate "line", 55
    new $P75, "Undef"
    .lex "$namespace", $P75
# .annotate "line", 57
    new $P76, "Undef"
    .lex "$undef", $P76
    .lex "$_", param_77
# .annotate "line", 55
    get_hll_global $P78, ["Parrot"], "get_hll_namespace"
    find_lex $P79, "$_"
    set $S80, $P79
    $P81 = $P78($S80)
    store_lex "$namespace", $P81
# .annotate "line", 56
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
# .annotate "line", 57
    find_lex $P86, "$undef"
    find_lex $P87, "$_"
    find_lex $P88, "%methods_for"
    unless_null $P88, vivify_42
    new $P88, "Hash"
    store_lex "%methods_for", $P88
  vivify_42:
    set $P88[$P87], $P86
# .annotate "line", 54
    .return ($P86)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block96"  :anon :subid("15_1267109890.11314") :outer("12_1267109890.11314")
    .param pmc param_98
# .annotate "line", 61
    .const 'Sub' $P106 = "16_1267109890.11314" 
    capture_lex $P106
    .lex "$_", param_98
# .annotate "line", 62
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
    .const 'Sub' $P106 = "16_1267109890.11314" 
    capture_lex $P106
    $P120 = $P106()
    set $P99, $P120
  if_100_end:
# .annotate "line", 61
    .return ($P99)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block105"  :anon :subid("16_1267109890.11314") :outer("15_1267109890.11314")
# .annotate "line", 64
    new $P107, "Undef"
    .lex "$namespace", $P107
# .annotate "line", 63
    get_hll_global $P108, "P6metaclass"
    find_lex $P109, "$_"
    set $S110, $P109
    $P108."register"($S110)
# .annotate "line", 64
    get_hll_global $P111, ["Parrot"], "get_hll_namespace"
    find_lex $P112, "$_"
    set $S113, $P112
    $P114 = $P111($S113)
    store_lex "$namespace", $P114
# .annotate "line", 65
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
# .annotate "line", 62
    .return ($P119)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "create_new_method"  :subid("17_1267109890.11314") :outer("11_1267109890.11314")
    .param pmc param_128
# .annotate "line", 105
    new $P127, 'ExceptionHandler'
    set_addr $P127, control_126
    $P127."handle_types"(58)
    push_eh $P127
    .lex "$namespace", param_128
# .annotate "line", 106
    new $P129, "Undef"
    .lex "$type", $P129
# .annotate "line", 107
    new $P130, "Undef"
    .lex "&new", $P130
# .annotate "line", 106
    find_lex $P131, "$namespace"
    set $S132, $P131
    new $P133, 'String'
    set $P133, $S132
    store_lex "$type", $P133
# .annotate "line", 107
    get_hll_global $P134, ["Pir"], "compile_sub"
    find_lex $P135, "$namespace"
# .annotate "line", 112
    new $P136, "String"
    assign $P136, "\t"
    concat $P137, $P136, "$P0 = "
    new $P138, 'String'
    set $P138, "new [ '"
    find_lex $P139, "$type"
    concat $P140, $P138, $P139
    concat $P141, $P140, "' ]"
    concat $P142, $P137, $P141
# .annotate "line", 113
    new $P143, "String"
    assign $P143, "\t"
    concat $P144, $P143, ".return ($P0)"
    new $P145, "ResizablePMCArray"
    push $P145, $P142
    push $P145, $P144
    $P146 = $P134("new" :named("name"), $P135 :named("namespace"), 1 :named("method"), $P145 :named("body"))
# .annotate "line", 107
    store_lex "&new", $P146
# .annotate "line", 105
    .return ($P146)
  control_126:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P147, exception, "payload"
    .return ($P147)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "install_methods"  :subid("18_1267109890.11314") :outer("11_1267109890.11314")
    .param pmc param_151
    .param pmc param_152
    .param pmc param_153 :optional :named("skip_new")
    .param int has_param_153 :opt_flag
# .annotate "line", 146
    .const 'Sub' $P168 = "19_1267109890.11314" 
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
# .annotate "line", 147
    new $P155, "Undef"
    .lex "$from_nsp", $P155
# .annotate "line", 149
    new $P156, "Hash"
    .lex "%export_subs", $P156
# .annotate "line", 150
    new $P157, "Undef"
    .lex "$pmc_name", $P157
# .annotate "line", 147
    get_namespace $P158
    store_lex "$from_nsp", $P158
    find_lex $P159, "%export_subs"
# .annotate "line", 150
    find_lex $P160, "$namespace"
    set $S161, $P160
    new $P162, 'String'
    set $P162, $S161
    store_lex "$pmc_name", $P162
# .annotate "line", 152
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
    .const 'Sub' $P168 = "19_1267109890.11314" 
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
# .annotate "line", 168
    find_lex $P208, "%export_subs"
    if $P208, if_207
    set $P206, $P208
    goto if_207_end
  if_207:
# .annotate "line", 169
    find_lex $P209, "$from_nsp"
    find_lex $P210, "$namespace"
    find_lex $P211, "%export_subs"
    $P212 = $P209."export_to"($P210, $P211)
# .annotate "line", 168
    set $P206, $P212
  if_207_end:
# .annotate "line", 146
    .return ($P206)
  control_149:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P213, exception, "payload"
    .return ($P213)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "_block167"  :anon :subid("19_1267109890.11314") :outer("18_1267109890.11314")
    .param pmc param_169
# .annotate "line", 152
    .lex "$_", param_169
# .annotate "line", 153
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
# .annotate "line", 154
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
# .annotate "line", 157
    find_lex $P190, "$_"
    set $S191, $P190
    iseq $I192, $S191, "new"
    if $I192, if_189
# .annotate "line", 163
    new $P199, 'String'
    set $P199, "Request to export unknown COMMON method '"
    find_lex $P200, "$_"
    concat $P201, $P199, $P200
    concat $P202, $P201, "'"
    die $P202
# .annotate "line", 162
    goto if_189_end
  if_189:
# .annotate "line", 158
    find_lex $P195, "$skip_new"
    unless $P195, unless_194
    set $P193, $P195
    goto unless_194_end
  unless_194:
# .annotate "line", 159
    find_lex $P196, "$_"
    set $S197, $P196
    $P198 = "create_new_method"($S197)
# .annotate "line", 158
    set $P193, $P198
  unless_194_end:
# .annotate "line", 157
    set $P188, $P193
  if_189_end:
    set $P176, $P188
# .annotate "line", 154
    goto if_177_end
  if_177:
# .annotate "line", 155
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
# .annotate "line", 154
    set $P176, $P185
  if_177_end:
# .annotate "line", 153
    set $P170, $P176
  unless_171_end:
# .annotate "line", 152
    .return ($P170)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "can"  :subid("20_1267109890.11314") :method :outer("11_1267109890.11314")
    .param pmc param_218
# .annotate "line", 81
    new $P217, 'ExceptionHandler'
    set_addr $P217, control_216
    $P217."handle_types"(58)
    push_eh $P217
    .lex "self", self
    .lex "$method", param_218
# .annotate "line", 82
    find_lex $P219, "self"
    find_lex $P220, "$method"
    set $S221, $P220
    can $I222, $P219, $S221
# .annotate "line", 81
    .return ($I222)
  control_216:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P223, exception, "payload"
    .return ($P223)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "clone"  :subid("21_1267109890.11314") :method :outer("11_1267109890.11314")
# .annotate "line", 101
    new $P226, 'ExceptionHandler'
    set_addr $P226, control_225
    $P226."handle_types"(58)
    push_eh $P226
    .lex "self", self
# .annotate "line", 102
    find_lex $P227, "self"
    clone $P228, $P227
# .annotate "line", 101
    .return ($P228)
  control_225:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P229, exception, "payload"
    .return ($P229)
.end


.namespace ["Kakapo";"Pmc";"COMMON"]
.sub "defined"  :subid("22_1267109890.11314") :method :outer("11_1267109890.11314")
# .annotate "line", 129
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
.sub "does"  :subid("23_1267109890.11314") :method :outer("11_1267109890.11314")
    .param pmc param_238
# .annotate "line", 144
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
.sub "isa"  :subid("24_1267109890.11314") :method :outer("11_1267109890.11314")
    .param pmc param_248
# .annotate "line", 184
    new $P247, 'ExceptionHandler'
    set_addr $P247, control_246
    $P247."handle_types"(58)
    push_eh $P247
    .lex "self", self
    .lex "$type", param_248
# .annotate "line", 185
    find_lex $P249, "self"
    find_lex $P250, "$type"
    isa $I251, $P249, $P250
# .annotate "line", 184
    .return ($I251)
  control_246:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P252, exception, "payload"
    .return ($P252)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109881.18301")
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
.sub "_block13"  :subid("11_1267109881.18301") :outer("10_1267109881.18301")
# .annotate "line", 7
    get_hll_global $P176, ["Exception";"Wrapper"], "_block175" 
    capture_lex $P176
    get_hll_global $P146, ["Exception";"Severity"], "_block145" 
    capture_lex $P146
    .const 'Sub' $P137 = "23_1267109881.18301" 
    capture_lex $P137
    .const 'Sub' $P132 = "22_1267109881.18301" 
    capture_lex $P132
    .const 'Sub' $P124 = "21_1267109881.18301" 
    capture_lex $P124
    .const 'Sub' $P119 = "20_1267109881.18301" 
    capture_lex $P119
    .const 'Sub' $P111 = "19_1267109881.18301" 
    capture_lex $P111
    .const 'Sub' $P103 = "18_1267109881.18301" 
    capture_lex $P103
    .const 'Sub' $P95 = "17_1267109881.18301" 
    capture_lex $P95
    .const 'Sub' $P87 = "16_1267109881.18301" 
    capture_lex $P87
    .const 'Sub' $P40 = "14_1267109881.18301" 
    capture_lex $P40
    .const 'Sub' $P20 = "13_1267109881.18301" 
    capture_lex $P20
    .const 'Sub' $P15 = "12_1267109881.18301" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1267109881.18301" 
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
.sub "" :load :init :subid("post45") :outer("11_1267109881.18301")
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
.sub "_pre_initload"  :subid("12_1267109881.18301") :outer("11_1267109881.18301")
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
.sub "_attr"  :subid("13_1267109881.18301") :method :outer("11_1267109881.18301")
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
.sub "backtrace_string"  :subid("14_1267109881.18301") :method :outer("11_1267109881.18301")
# .annotate "line", 23
    .const 'Sub' $P56 = "15_1267109881.18301" 
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
    .const 'Sub' $P56 = "15_1267109881.18301" 
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
.sub "_block55"  :anon :subid("15_1267109881.18301") :outer("14_1267109881.18301")
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
.sub "exit_code"  :subid("16_1267109881.18301") :method :outer("11_1267109881.18301")
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
.sub "handled"  :subid("17_1267109881.18301") :method :outer("11_1267109881.18301")
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
.sub "message"  :subid("18_1267109881.18301") :method :outer("11_1267109881.18301")
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
.sub "payload"  :subid("19_1267109881.18301") :method :outer("11_1267109881.18301")
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
.sub "rethrow"  :subid("20_1267109881.18301") :method :outer("11_1267109881.18301")
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
.sub "severity"  :subid("21_1267109881.18301") :method :outer("11_1267109881.18301")
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
.sub "throw"  :subid("22_1267109881.18301") :method :outer("11_1267109881.18301")
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
.sub "type"  :subid("23_1267109881.18301") :method :outer("11_1267109881.18301")
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
.sub "_block145"  :subid("24_1267109881.18301") :outer("11_1267109881.18301")
# .annotate "line", 51
    .const 'Sub' $P171 = "31_1267109881.18301" 
    capture_lex $P171
    .const 'Sub' $P167 = "30_1267109881.18301" 
    capture_lex $P167
    .const 'Sub' $P163 = "29_1267109881.18301" 
    capture_lex $P163
    .const 'Sub' $P159 = "28_1267109881.18301" 
    capture_lex $P159
    .const 'Sub' $P155 = "27_1267109881.18301" 
    capture_lex $P155
    .const 'Sub' $P151 = "26_1267109881.18301" 
    capture_lex $P151
    .const 'Sub' $P147 = "25_1267109881.18301" 
    capture_lex $P147
# .annotate "line", 58
    .const 'Sub' $P171 = "31_1267109881.18301" 
    capture_lex $P171
# .annotate "line", 51
    .return ($P171)
.end


.namespace ["Exception";"Severity"]
.sub "NORMAL"  :subid("25_1267109881.18301") :method :outer("24_1267109881.18301")
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
.sub "WARNING"  :subid("26_1267109881.18301") :method :outer("24_1267109881.18301")
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
.sub "ERROR"  :subid("27_1267109881.18301") :method :outer("24_1267109881.18301")
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
.sub "SEVERE"  :subid("28_1267109881.18301") :method :outer("24_1267109881.18301")
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
.sub "FATAL"  :subid("29_1267109881.18301") :method :outer("24_1267109881.18301")
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
.sub "DOOMED"  :subid("30_1267109881.18301") :method :outer("24_1267109881.18301")
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
.sub "EXIT"  :subid("31_1267109881.18301") :method :outer("24_1267109881.18301")
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
.sub "_block175"  :subid("32_1267109881.18301") :outer("11_1267109881.18301")
# .annotate "line", 66
    .const 'Sub' $P314 = "44_1267109881.18301" 
    capture_lex $P314
    .const 'Sub' $P307 = "43_1267109881.18301" 
    capture_lex $P307
    .const 'Sub' $P301 = "42_1267109881.18301" 
    capture_lex $P301
    .const 'Sub' $P294 = "41_1267109881.18301" 
    capture_lex $P294
    .const 'Sub' $P247 = "39_1267109881.18301" 
    capture_lex $P247
    .const 'Sub' $P238 = "38_1267109881.18301" 
    capture_lex $P238
    .const 'Sub' $P229 = "37_1267109881.18301" 
    capture_lex $P229
    .const 'Sub' $P220 = "36_1267109881.18301" 
    capture_lex $P220
    .const 'Sub' $P211 = "35_1267109881.18301" 
    capture_lex $P211
    .const 'Sub' $P193 = "34_1267109881.18301" 
    capture_lex $P193
    .const 'Sub' $P177 = "33_1267109881.18301" 
    capture_lex $P177
# .annotate "line", 118
    .const 'Sub' $P314 = "44_1267109881.18301" 
    capture_lex $P314
# .annotate "line", 66
    .return ($P314)
.end


.namespace ["Exception";"Wrapper"]
.sub "" :load :init :subid("post49") :outer("32_1267109881.18301")
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
.sub "create_exception"  :subid("33_1267109881.18301") :method :outer("32_1267109881.18301")
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
.sub "exception"  :subid("34_1267109881.18301") :method :outer("32_1267109881.18301")
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
.sub "exit_code"  :subid("35_1267109881.18301") :method :outer("32_1267109881.18301")
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
.sub "handled"  :subid("36_1267109881.18301") :method :outer("32_1267109881.18301")
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
.sub "message"  :subid("37_1267109881.18301") :method :outer("32_1267109881.18301")
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
.sub "payload"  :subid("38_1267109881.18301") :method :outer("32_1267109881.18301")
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
.sub "new"  :subid("39_1267109881.18301") :method :outer("32_1267109881.18301")
    .param pmc param_250 :slurpy
    .param pmc param_251 :slurpy :named
# .annotate "line", 94
    .const 'Sub' $P266 = "40_1267109881.18301" 
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
    .const 'Sub' $P266 = "40_1267109881.18301" 
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
.sub "_block265"  :anon :subid("40_1267109881.18301") :outer("39_1267109881.18301")
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
.sub "rethrow"  :subid("41_1267109881.18301") :method :outer("32_1267109881.18301")
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
.sub "severity"  :subid("42_1267109881.18301") :method :outer("32_1267109881.18301")
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
.sub "throw"  :subid("43_1267109881.18301") :method :outer("32_1267109881.18301")
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
.sub "type"  :subid("44_1267109881.18301") :method :outer("32_1267109881.18301")
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
.sub "_block11"  :anon :subid("10_1267109928.02371")
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
.sub "" :load :init :subid("post149") :outer("10_1267109928.02371")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1267109928.02371" 
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
.sub "_block13"  :subid("11_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 9
    .const 'Sub' $P15 = "12_1267109928.02371" 
    capture_lex $P15
# .annotate "line", 10
    .const 'Sub' $P15 = "12_1267109928.02371" 
    capture_lex $P15
# .annotate "line", 9
    .return ($P15)
.end


.namespace ["Exception";"BadBufferSize"]
.sub "type"  :subid("12_1267109928.02371") :method :outer("11_1267109928.02371")
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
.sub "_block19"  :subid("13_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 13
    .const 'Sub' $P21 = "14_1267109928.02371" 
    capture_lex $P21
# .annotate "line", 14
    .const 'Sub' $P21 = "14_1267109928.02371" 
    capture_lex $P21
# .annotate "line", 13
    .return ($P21)
.end


.namespace ["Exception";"MissingEncodingName"]
.sub "type"  :subid("14_1267109928.02371") :method :outer("13_1267109928.02371")
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
.sub "_block25"  :subid("15_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 17
    .const 'Sub' $P27 = "16_1267109928.02371" 
    capture_lex $P27
# .annotate "line", 18
    .const 'Sub' $P27 = "16_1267109928.02371" 
    capture_lex $P27
# .annotate "line", 17
    .return ($P27)
.end


.namespace ["Exception";"InvalidStringRepresentation"]
.sub "type"  :subid("16_1267109928.02371") :method :outer("15_1267109928.02371")
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
.sub "_block31"  :subid("17_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 21
    .const 'Sub' $P33 = "18_1267109928.02371" 
    capture_lex $P33
# .annotate "line", 22
    .const 'Sub' $P33 = "18_1267109928.02371" 
    capture_lex $P33
# .annotate "line", 21
    .return ($P33)
.end


.namespace ["Exception";"IcuError"]
.sub "type"  :subid("18_1267109928.02371") :method :outer("17_1267109928.02371")
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
.sub "_block37"  :subid("19_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 25
    .const 'Sub' $P39 = "20_1267109928.02371" 
    capture_lex $P39
# .annotate "line", 26
    .const 'Sub' $P39 = "20_1267109928.02371" 
    capture_lex $P39
# .annotate "line", 25
    .return ($P39)
.end


.namespace ["Exception";"Unimplemented"]
.sub "type"  :subid("20_1267109928.02371") :method :outer("19_1267109928.02371")
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
.sub "_block43"  :subid("21_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 29
    .const 'Sub' $P45 = "22_1267109928.02371" 
    capture_lex $P45
# .annotate "line", 30
    .const 'Sub' $P45 = "22_1267109928.02371" 
    capture_lex $P45
# .annotate "line", 29
    .return ($P45)
.end


.namespace ["Exception";"NullRegAccess"]
.sub "type"  :subid("22_1267109928.02371") :method :outer("21_1267109928.02371")
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
.sub "_block49"  :subid("23_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 33
    .const 'Sub' $P51 = "24_1267109928.02371" 
    capture_lex $P51
# .annotate "line", 34
    .const 'Sub' $P51 = "24_1267109928.02371" 
    capture_lex $P51
# .annotate "line", 33
    .return ($P51)
.end


.namespace ["Exception";"NoRegFrames"]
.sub "type"  :subid("24_1267109928.02371") :method :outer("23_1267109928.02371")
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
.sub "_block55"  :subid("25_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 37
    .const 'Sub' $P57 = "26_1267109928.02371" 
    capture_lex $P57
# .annotate "line", 38
    .const 'Sub' $P57 = "26_1267109928.02371" 
    capture_lex $P57
# .annotate "line", 37
    .return ($P57)
.end


.namespace ["Exception";"SubstrOutOfString"]
.sub "type"  :subid("26_1267109928.02371") :method :outer("25_1267109928.02371")
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
.sub "_block61"  :subid("27_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 41
    .const 'Sub' $P63 = "28_1267109928.02371" 
    capture_lex $P63
# .annotate "line", 42
    .const 'Sub' $P63 = "28_1267109928.02371" 
    capture_lex $P63
# .annotate "line", 41
    .return ($P63)
.end


.namespace ["Exception";"OrdOutOfString"]
.sub "type"  :subid("28_1267109928.02371") :method :outer("27_1267109928.02371")
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
.sub "_block67"  :subid("29_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 45
    .const 'Sub' $P69 = "30_1267109928.02371" 
    capture_lex $P69
# .annotate "line", 46
    .const 'Sub' $P69 = "30_1267109928.02371" 
    capture_lex $P69
# .annotate "line", 45
    .return ($P69)
.end


.namespace ["Exception";"MalformedUtf8"]
.sub "type"  :subid("30_1267109928.02371") :method :outer("29_1267109928.02371")
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
.sub "_block73"  :subid("31_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 49
    .const 'Sub' $P75 = "32_1267109928.02371" 
    capture_lex $P75
# .annotate "line", 50
    .const 'Sub' $P75 = "32_1267109928.02371" 
    capture_lex $P75
# .annotate "line", 49
    .return ($P75)
.end


.namespace ["Exception";"MalformedUtf16"]
.sub "type"  :subid("32_1267109928.02371") :method :outer("31_1267109928.02371")
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
.sub "_block79"  :subid("33_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 53
    .const 'Sub' $P81 = "34_1267109928.02371" 
    capture_lex $P81
# .annotate "line", 54
    .const 'Sub' $P81 = "34_1267109928.02371" 
    capture_lex $P81
# .annotate "line", 53
    .return ($P81)
.end


.namespace ["Exception";"MalformedUtf32"]
.sub "type"  :subid("34_1267109928.02371") :method :outer("33_1267109928.02371")
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
.sub "_block85"  :subid("35_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 57
    .const 'Sub' $P87 = "36_1267109928.02371" 
    capture_lex $P87
# .annotate "line", 58
    .const 'Sub' $P87 = "36_1267109928.02371" 
    capture_lex $P87
# .annotate "line", 57
    .return ($P87)
.end


.namespace ["Exception";"InvalidCharacter"]
.sub "type"  :subid("36_1267109928.02371") :method :outer("35_1267109928.02371")
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
.sub "_block91"  :subid("37_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 61
    .const 'Sub' $P93 = "38_1267109928.02371" 
    capture_lex $P93
# .annotate "line", 62
    .const 'Sub' $P93 = "38_1267109928.02371" 
    capture_lex $P93
# .annotate "line", 61
    .return ($P93)
.end


.namespace ["Exception";"InvalidChartype"]
.sub "type"  :subid("38_1267109928.02371") :method :outer("37_1267109928.02371")
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
.sub "_block97"  :subid("39_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 65
    .const 'Sub' $P99 = "40_1267109928.02371" 
    capture_lex $P99
# .annotate "line", 66
    .const 'Sub' $P99 = "40_1267109928.02371" 
    capture_lex $P99
# .annotate "line", 65
    .return ($P99)
.end


.namespace ["Exception";"InvalidEncoding"]
.sub "type"  :subid("40_1267109928.02371") :method :outer("39_1267109928.02371")
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
.sub "_block103"  :subid("41_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 69
    .const 'Sub' $P105 = "42_1267109928.02371" 
    capture_lex $P105
# .annotate "line", 70
    .const 'Sub' $P105 = "42_1267109928.02371" 
    capture_lex $P105
# .annotate "line", 69
    .return ($P105)
.end


.namespace ["Exception";"InvalidCharclass"]
.sub "type"  :subid("42_1267109928.02371") :method :outer("41_1267109928.02371")
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
.sub "_block109"  :subid("43_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 73
    .const 'Sub' $P111 = "44_1267109928.02371" 
    capture_lex $P111
# .annotate "line", 74
    .const 'Sub' $P111 = "44_1267109928.02371" 
    capture_lex $P111
# .annotate "line", 73
    .return ($P111)
.end


.namespace ["Exception";"NegRepeat"]
.sub "type"  :subid("44_1267109928.02371") :method :outer("43_1267109928.02371")
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
.sub "_block115"  :subid("45_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 77
    .const 'Sub' $P117 = "46_1267109928.02371" 
    capture_lex $P117
# .annotate "line", 78
    .const 'Sub' $P117 = "46_1267109928.02371" 
    capture_lex $P117
# .annotate "line", 77
    .return ($P117)
.end


.namespace ["Exception";"NegSubstr"]
.sub "type"  :subid("46_1267109928.02371") :method :outer("45_1267109928.02371")
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
.sub "_block121"  :subid("47_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 81
    .const 'Sub' $P123 = "48_1267109928.02371" 
    capture_lex $P123
# .annotate "line", 82
    .const 'Sub' $P123 = "48_1267109928.02371" 
    capture_lex $P123
# .annotate "line", 81
    .return ($P123)
.end


.namespace ["Exception";"NegSleep"]
.sub "type"  :subid("48_1267109928.02371") :method :outer("47_1267109928.02371")
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
.sub "_block127"  :subid("49_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 85
    .const 'Sub' $P129 = "50_1267109928.02371" 
    capture_lex $P129
# .annotate "line", 86
    .const 'Sub' $P129 = "50_1267109928.02371" 
    capture_lex $P129
# .annotate "line", 85
    .return ($P129)
.end


.namespace ["Exception";"NegChop"]
.sub "type"  :subid("50_1267109928.02371") :method :outer("49_1267109928.02371")
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
.sub "_block133"  :subid("51_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 89
    .const 'Sub' $P135 = "52_1267109928.02371" 
    capture_lex $P135
# .annotate "line", 90
    .const 'Sub' $P135 = "52_1267109928.02371" 
    capture_lex $P135
# .annotate "line", 89
    .return ($P135)
.end


.namespace ["Exception";"InvalidOperation"]
.sub "type"  :subid("52_1267109928.02371") :method :outer("51_1267109928.02371")
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
.sub "_block139"  :subid("53_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 93
    .const 'Sub' $P141 = "54_1267109928.02371" 
    capture_lex $P141
# .annotate "line", 94
    .const 'Sub' $P141 = "54_1267109928.02371" 
    capture_lex $P141
# .annotate "line", 93
    .return ($P141)
.end


.namespace ["Exception";"ArgOpNotHandled"]
.sub "type"  :subid("54_1267109928.02371") :method :outer("53_1267109928.02371")
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
.sub "_block145"  :subid("55_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 97
    .const 'Sub' $P147 = "56_1267109928.02371" 
    capture_lex $P147
# .annotate "line", 98
    .const 'Sub' $P147 = "56_1267109928.02371" 
    capture_lex $P147
# .annotate "line", 97
    .return ($P147)
.end


.namespace ["Exception";"KeyNotFound"]
.sub "type"  :subid("56_1267109928.02371") :method :outer("55_1267109928.02371")
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
.sub "_block151"  :subid("57_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 101
    .const 'Sub' $P153 = "58_1267109928.02371" 
    capture_lex $P153
# .annotate "line", 102
    .const 'Sub' $P153 = "58_1267109928.02371" 
    capture_lex $P153
# .annotate "line", 101
    .return ($P153)
.end


.namespace ["Exception";"JitUnavailable"]
.sub "type"  :subid("58_1267109928.02371") :method :outer("57_1267109928.02371")
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
.sub "_block157"  :subid("59_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 105
    .const 'Sub' $P159 = "60_1267109928.02371" 
    capture_lex $P159
# .annotate "line", 106
    .const 'Sub' $P159 = "60_1267109928.02371" 
    capture_lex $P159
# .annotate "line", 105
    .return ($P159)
.end


.namespace ["Exception";"ExecUnavailable"]
.sub "type"  :subid("60_1267109928.02371") :method :outer("59_1267109928.02371")
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
.sub "_block163"  :subid("61_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 109
    .const 'Sub' $P165 = "62_1267109928.02371" 
    capture_lex $P165
# .annotate "line", 110
    .const 'Sub' $P165 = "62_1267109928.02371" 
    capture_lex $P165
# .annotate "line", 109
    .return ($P165)
.end


.namespace ["Exception";"InterpError"]
.sub "type"  :subid("62_1267109928.02371") :method :outer("61_1267109928.02371")
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
.sub "_block169"  :subid("63_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 113
    .const 'Sub' $P171 = "64_1267109928.02371" 
    capture_lex $P171
# .annotate "line", 114
    .const 'Sub' $P171 = "64_1267109928.02371" 
    capture_lex $P171
# .annotate "line", 113
    .return ($P171)
.end


.namespace ["Exception";"PrederefLoadError"]
.sub "type"  :subid("64_1267109928.02371") :method :outer("63_1267109928.02371")
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
.sub "_block175"  :subid("65_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 117
    .const 'Sub' $P177 = "66_1267109928.02371" 
    capture_lex $P177
# .annotate "line", 118
    .const 'Sub' $P177 = "66_1267109928.02371" 
    capture_lex $P177
# .annotate "line", 117
    .return ($P177)
.end


.namespace ["Exception";"ParrotUsageError"]
.sub "type"  :subid("66_1267109928.02371") :method :outer("65_1267109928.02371")
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
.sub "_block181"  :subid("67_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 121
    .const 'Sub' $P183 = "68_1267109928.02371" 
    capture_lex $P183
# .annotate "line", 122
    .const 'Sub' $P183 = "68_1267109928.02371" 
    capture_lex $P183
# .annotate "line", 121
    .return ($P183)
.end


.namespace ["Exception";"PioError"]
.sub "type"  :subid("68_1267109928.02371") :method :outer("67_1267109928.02371")
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
.sub "_block187"  :subid("69_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 125
    .const 'Sub' $P189 = "70_1267109928.02371" 
    capture_lex $P189
# .annotate "line", 126
    .const 'Sub' $P189 = "70_1267109928.02371" 
    capture_lex $P189
# .annotate "line", 125
    .return ($P189)
.end


.namespace ["Exception";"ParrotPointerError"]
.sub "type"  :subid("70_1267109928.02371") :method :outer("69_1267109928.02371")
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
.sub "_block193"  :subid("71_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 129
    .const 'Sub' $P195 = "72_1267109928.02371" 
    capture_lex $P195
# .annotate "line", 130
    .const 'Sub' $P195 = "72_1267109928.02371" 
    capture_lex $P195
# .annotate "line", 129
    .return ($P195)
.end


.namespace ["Exception";"DivByZero"]
.sub "type"  :subid("72_1267109928.02371") :method :outer("71_1267109928.02371")
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
.sub "_block199"  :subid("73_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 133
    .const 'Sub' $P201 = "74_1267109928.02371" 
    capture_lex $P201
# .annotate "line", 134
    .const 'Sub' $P201 = "74_1267109928.02371" 
    capture_lex $P201
# .annotate "line", 133
    .return ($P201)
.end


.namespace ["Exception";"PioNotImplemented"]
.sub "type"  :subid("74_1267109928.02371") :method :outer("73_1267109928.02371")
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
.sub "_block205"  :subid("75_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 137
    .const 'Sub' $P207 = "76_1267109928.02371" 
    capture_lex $P207
# .annotate "line", 138
    .const 'Sub' $P207 = "76_1267109928.02371" 
    capture_lex $P207
# .annotate "line", 137
    .return ($P207)
.end


.namespace ["Exception";"AllocationError"]
.sub "type"  :subid("76_1267109928.02371") :method :outer("75_1267109928.02371")
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
.sub "_block211"  :subid("77_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 141
    .const 'Sub' $P213 = "78_1267109928.02371" 
    capture_lex $P213
# .annotate "line", 142
    .const 'Sub' $P213 = "78_1267109928.02371" 
    capture_lex $P213
# .annotate "line", 141
    .return ($P213)
.end


.namespace ["Exception";"InternalPanic"]
.sub "type"  :subid("78_1267109928.02371") :method :outer("77_1267109928.02371")
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
.sub "_block217"  :subid("79_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 145
    .const 'Sub' $P219 = "80_1267109928.02371" 
    capture_lex $P219
# .annotate "line", 146
    .const 'Sub' $P219 = "80_1267109928.02371" 
    capture_lex $P219
# .annotate "line", 145
    .return ($P219)
.end


.namespace ["Exception";"OutOfBounds"]
.sub "type"  :subid("80_1267109928.02371") :method :outer("79_1267109928.02371")
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
.sub "_block223"  :subid("81_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 149
    .const 'Sub' $P225 = "82_1267109928.02371" 
    capture_lex $P225
# .annotate "line", 150
    .const 'Sub' $P225 = "82_1267109928.02371" 
    capture_lex $P225
# .annotate "line", 149
    .return ($P225)
.end


.namespace ["Exception";"JitError"]
.sub "type"  :subid("82_1267109928.02371") :method :outer("81_1267109928.02371")
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
.sub "_block229"  :subid("83_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 153
    .const 'Sub' $P231 = "84_1267109928.02371" 
    capture_lex $P231
# .annotate "line", 154
    .const 'Sub' $P231 = "84_1267109928.02371" 
    capture_lex $P231
# .annotate "line", 153
    .return ($P231)
.end


.namespace ["Exception";"ExecError"]
.sub "type"  :subid("84_1267109928.02371") :method :outer("83_1267109928.02371")
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
.sub "_block235"  :subid("85_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 157
    .const 'Sub' $P237 = "86_1267109928.02371" 
    capture_lex $P237
# .annotate "line", 158
    .const 'Sub' $P237 = "86_1267109928.02371" 
    capture_lex $P237
# .annotate "line", 157
    .return ($P237)
.end


.namespace ["Exception";"IllInherit"]
.sub "type"  :subid("86_1267109928.02371") :method :outer("85_1267109928.02371")
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
.sub "_block241"  :subid("87_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 161
    .const 'Sub' $P243 = "88_1267109928.02371" 
    capture_lex $P243
# .annotate "line", 162
    .const 'Sub' $P243 = "88_1267109928.02371" 
    capture_lex $P243
# .annotate "line", 161
    .return ($P243)
.end


.namespace ["Exception";"NoPrevCs"]
.sub "type"  :subid("88_1267109928.02371") :method :outer("87_1267109928.02371")
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
.sub "_block247"  :subid("89_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 165
    .const 'Sub' $P249 = "90_1267109928.02371" 
    capture_lex $P249
# .annotate "line", 166
    .const 'Sub' $P249 = "90_1267109928.02371" 
    capture_lex $P249
# .annotate "line", 165
    .return ($P249)
.end


.namespace ["Exception";"NoClass"]
.sub "type"  :subid("90_1267109928.02371") :method :outer("89_1267109928.02371")
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
.sub "_block253"  :subid("91_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 169
    .const 'Sub' $P255 = "92_1267109928.02371" 
    capture_lex $P255
# .annotate "line", 170
    .const 'Sub' $P255 = "92_1267109928.02371" 
    capture_lex $P255
# .annotate "line", 169
    .return ($P255)
.end


.namespace ["Exception";"LexNotFound"]
.sub "type"  :subid("92_1267109928.02371") :method :outer("91_1267109928.02371")
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
.sub "_block259"  :subid("93_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 173
    .const 'Sub' $P261 = "94_1267109928.02371" 
    capture_lex $P261
# .annotate "line", 174
    .const 'Sub' $P261 = "94_1267109928.02371" 
    capture_lex $P261
# .annotate "line", 173
    .return ($P261)
.end


.namespace ["Exception";"PadNotFound"]
.sub "type"  :subid("94_1267109928.02371") :method :outer("93_1267109928.02371")
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
.sub "_block265"  :subid("95_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 177
    .const 'Sub' $P267 = "96_1267109928.02371" 
    capture_lex $P267
# .annotate "line", 178
    .const 'Sub' $P267 = "96_1267109928.02371" 
    capture_lex $P267
# .annotate "line", 177
    .return ($P267)
.end


.namespace ["Exception";"AttribNotFound"]
.sub "type"  :subid("96_1267109928.02371") :method :outer("95_1267109928.02371")
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
.sub "_block271"  :subid("97_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 181
    .const 'Sub' $P273 = "98_1267109928.02371" 
    capture_lex $P273
# .annotate "line", 182
    .const 'Sub' $P273 = "98_1267109928.02371" 
    capture_lex $P273
# .annotate "line", 181
    .return ($P273)
.end


.namespace ["Exception";"GlobalNotFound"]
.sub "type"  :subid("98_1267109928.02371") :method :outer("97_1267109928.02371")
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
.sub "_block277"  :subid("99_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 185
    .const 'Sub' $P279 = "100_1267109928.02371" 
    capture_lex $P279
# .annotate "line", 186
    .const 'Sub' $P279 = "100_1267109928.02371" 
    capture_lex $P279
# .annotate "line", 185
    .return ($P279)
.end


.namespace ["Exception";"ExternalError"]
.sub "type"  :subid("100_1267109928.02371") :method :outer("99_1267109928.02371")
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
.sub "_block283"  :subid("101_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 189
    .const 'Sub' $P285 = "102_1267109928.02371" 
    capture_lex $P285
# .annotate "line", 190
    .const 'Sub' $P285 = "102_1267109928.02371" 
    capture_lex $P285
# .annotate "line", 189
    .return ($P285)
.end


.namespace ["Exception";"MethodNotFound"]
.sub "type"  :subid("102_1267109928.02371") :method :outer("101_1267109928.02371")
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
.sub "_block289"  :subid("103_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 193
    .const 'Sub' $P291 = "104_1267109928.02371" 
    capture_lex $P291
# .annotate "line", 194
    .const 'Sub' $P291 = "104_1267109928.02371" 
    capture_lex $P291
# .annotate "line", 193
    .return ($P291)
.end


.namespace ["Exception";"VtableNotFound"]
.sub "type"  :subid("104_1267109928.02371") :method :outer("103_1267109928.02371")
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
.sub "_block295"  :subid("105_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 197
    .const 'Sub' $P297 = "106_1267109928.02371" 
    capture_lex $P297
# .annotate "line", 198
    .const 'Sub' $P297 = "106_1267109928.02371" 
    capture_lex $P297
# .annotate "line", 197
    .return ($P297)
.end


.namespace ["Exception";"WriteToConstclass"]
.sub "type"  :subid("106_1267109928.02371") :method :outer("105_1267109928.02371")
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
.sub "_block301"  :subid("107_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 201
    .const 'Sub' $P303 = "108_1267109928.02371" 
    capture_lex $P303
# .annotate "line", 202
    .const 'Sub' $P303 = "108_1267109928.02371" 
    capture_lex $P303
# .annotate "line", 201
    .return ($P303)
.end


.namespace ["Exception";"Nospawn"]
.sub "type"  :subid("108_1267109928.02371") :method :outer("107_1267109928.02371")
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
.sub "_block307"  :subid("109_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 205
    .const 'Sub' $P309 = "110_1267109928.02371" 
    capture_lex $P309
# .annotate "line", 206
    .const 'Sub' $P309 = "110_1267109928.02371" 
    capture_lex $P309
# .annotate "line", 205
    .return ($P309)
.end


.namespace ["Exception";"InternalNotImplemented"]
.sub "type"  :subid("110_1267109928.02371") :method :outer("109_1267109928.02371")
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
.sub "_block313"  :subid("111_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 209
    .const 'Sub' $P315 = "112_1267109928.02371" 
    capture_lex $P315
# .annotate "line", 210
    .const 'Sub' $P315 = "112_1267109928.02371" 
    capture_lex $P315
# .annotate "line", 209
    .return ($P315)
.end


.namespace ["Exception";"ErrOverflow"]
.sub "type"  :subid("112_1267109928.02371") :method :outer("111_1267109928.02371")
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
.sub "_block319"  :subid("113_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 213
    .const 'Sub' $P321 = "114_1267109928.02371" 
    capture_lex $P321
# .annotate "line", 214
    .const 'Sub' $P321 = "114_1267109928.02371" 
    capture_lex $P321
# .annotate "line", 213
    .return ($P321)
.end


.namespace ["Exception";"LossyConversion"]
.sub "type"  :subid("114_1267109928.02371") :method :outer("113_1267109928.02371")
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
.sub "_block325"  :subid("115_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 217
    .const 'Sub' $P327 = "116_1267109928.02371" 
    capture_lex $P327
# .annotate "line", 218
    .const 'Sub' $P327 = "116_1267109928.02371" 
    capture_lex $P327
# .annotate "line", 217
    .return ($P327)
.end


.namespace ["Exception";"RoleCompositionMethodConflict"]
.sub "type"  :subid("116_1267109928.02371") :method :outer("115_1267109928.02371")
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
.sub "_block331"  :subid("117_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 221
    .const 'Sub' $P333 = "118_1267109928.02371" 
    capture_lex $P333
# .annotate "line", 222
    .const 'Sub' $P333 = "118_1267109928.02371" 
    capture_lex $P333
# .annotate "line", 221
    .return ($P333)
.end


.namespace ["Exception";"UnexpectedNull"]
.sub "type"  :subid("118_1267109928.02371") :method :outer("117_1267109928.02371")
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
.sub "_block337"  :subid("119_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 225
    .const 'Sub' $P339 = "120_1267109928.02371" 
    capture_lex $P339
# .annotate "line", 226
    .const 'Sub' $P339 = "120_1267109928.02371" 
    capture_lex $P339
# .annotate "line", 225
    .return ($P339)
.end


.namespace ["Exception";"LibraryError"]
.sub "type"  :subid("120_1267109928.02371") :method :outer("119_1267109928.02371")
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
.sub "_block343"  :subid("121_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 229
    .const 'Sub' $P345 = "122_1267109928.02371" 
    capture_lex $P345
# .annotate "line", 230
    .const 'Sub' $P345 = "122_1267109928.02371" 
    capture_lex $P345
# .annotate "line", 229
    .return ($P345)
.end


.namespace ["Exception";"LibraryNotLoaded"]
.sub "type"  :subid("122_1267109928.02371") :method :outer("121_1267109928.02371")
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
.sub "_block349"  :subid("123_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 233
    .const 'Sub' $P351 = "124_1267109928.02371" 
    capture_lex $P351
# .annotate "line", 234
    .const 'Sub' $P351 = "124_1267109928.02371" 
    capture_lex $P351
# .annotate "line", 233
    .return ($P351)
.end


.namespace ["Exception";"SyntaxError"]
.sub "type"  :subid("124_1267109928.02371") :method :outer("123_1267109928.02371")
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
.sub "_block355"  :subid("125_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 237
    .const 'Sub' $P357 = "126_1267109928.02371" 
    capture_lex $P357
# .annotate "line", 238
    .const 'Sub' $P357 = "126_1267109928.02371" 
    capture_lex $P357
# .annotate "line", 237
    .return ($P357)
.end


.namespace ["Exception";"MalformedPackfile"]
.sub "type"  :subid("126_1267109928.02371") :method :outer("125_1267109928.02371")
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
.sub "_block361"  :subid("127_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 241
    .const 'Sub' $P363 = "128_1267109928.02371" 
    capture_lex $P363
# .annotate "line", 242
    .const 'Sub' $P363 = "128_1267109928.02371" 
    capture_lex $P363
# .annotate "line", 241
    .return ($P363)
.end


.namespace ["Control";"Return"]
.sub "type"  :subid("128_1267109928.02371") :method :outer("127_1267109928.02371")
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
.sub "_block367"  :subid("129_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 245
    .const 'Sub' $P369 = "130_1267109928.02371" 
    capture_lex $P369
# .annotate "line", 246
    .const 'Sub' $P369 = "130_1267109928.02371" 
    capture_lex $P369
# .annotate "line", 245
    .return ($P369)
.end


.namespace ["Control";"Ok"]
.sub "type"  :subid("130_1267109928.02371") :method :outer("129_1267109928.02371")
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
.sub "_block373"  :subid("131_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 249
    .const 'Sub' $P375 = "132_1267109928.02371" 
    capture_lex $P375
# .annotate "line", 250
    .const 'Sub' $P375 = "132_1267109928.02371" 
    capture_lex $P375
# .annotate "line", 249
    .return ($P375)
.end


.namespace ["Control";"Break"]
.sub "type"  :subid("132_1267109928.02371") :method :outer("131_1267109928.02371")
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
.sub "_block379"  :subid("133_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 253
    .const 'Sub' $P381 = "134_1267109928.02371" 
    capture_lex $P381
# .annotate "line", 254
    .const 'Sub' $P381 = "134_1267109928.02371" 
    capture_lex $P381
# .annotate "line", 253
    .return ($P381)
.end


.namespace ["Control";"Continue"]
.sub "type"  :subid("134_1267109928.02371") :method :outer("133_1267109928.02371")
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
.sub "_block385"  :subid("135_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 257
    .const 'Sub' $P387 = "136_1267109928.02371" 
    capture_lex $P387
# .annotate "line", 258
    .const 'Sub' $P387 = "136_1267109928.02371" 
    capture_lex $P387
# .annotate "line", 257
    .return ($P387)
.end


.namespace ["Control";"Error"]
.sub "type"  :subid("136_1267109928.02371") :method :outer("135_1267109928.02371")
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
.sub "_block391"  :subid("137_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 261
    .const 'Sub' $P393 = "138_1267109928.02371" 
    capture_lex $P393
# .annotate "line", 262
    .const 'Sub' $P393 = "138_1267109928.02371" 
    capture_lex $P393
# .annotate "line", 261
    .return ($P393)
.end


.namespace ["Control";"Take"]
.sub "type"  :subid("138_1267109928.02371") :method :outer("137_1267109928.02371")
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
.sub "_block397"  :subid("139_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 265
    .const 'Sub' $P399 = "140_1267109928.02371" 
    capture_lex $P399
# .annotate "line", 266
    .const 'Sub' $P399 = "140_1267109928.02371" 
    capture_lex $P399
# .annotate "line", 265
    .return ($P399)
.end


.namespace ["Control";"Leave"]
.sub "type"  :subid("140_1267109928.02371") :method :outer("139_1267109928.02371")
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
.sub "_block403"  :subid("141_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 269
    .const 'Sub' $P405 = "142_1267109928.02371" 
    capture_lex $P405
# .annotate "line", 270
    .const 'Sub' $P405 = "142_1267109928.02371" 
    capture_lex $P405
# .annotate "line", 269
    .return ($P405)
.end


.namespace ["Control";"LoopNext"]
.sub "type"  :subid("142_1267109928.02371") :method :outer("141_1267109928.02371")
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
.sub "_block409"  :subid("143_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 273
    .const 'Sub' $P411 = "144_1267109928.02371" 
    capture_lex $P411
# .annotate "line", 274
    .const 'Sub' $P411 = "144_1267109928.02371" 
    capture_lex $P411
# .annotate "line", 273
    .return ($P411)
.end


.namespace ["Control";"LoopLast"]
.sub "type"  :subid("144_1267109928.02371") :method :outer("143_1267109928.02371")
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
.sub "_block415"  :subid("145_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 277
    .const 'Sub' $P417 = "146_1267109928.02371" 
    capture_lex $P417
# .annotate "line", 278
    .const 'Sub' $P417 = "146_1267109928.02371" 
    capture_lex $P417
# .annotate "line", 277
    .return ($P417)
.end


.namespace ["Control";"LoopRedo"]
.sub "type"  :subid("146_1267109928.02371") :method :outer("145_1267109928.02371")
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
.sub "_block421"  :subid("147_1267109928.02371") :outer("10_1267109928.02371")
# .annotate "line", 285
    get_hll_global $P424, ["Exception";"InvalidArgument"], "_block423" 
    capture_lex $P424
    get_hll_global $P424, ["Exception";"InvalidArgument"], "_block423" 
    capture_lex $P424
    $P425 = $P424()
    .return ($P425)
.end


.namespace ["Exception";"AbstractMethodCalled"]
.sub "" :load :init :subid("post150") :outer("147_1267109928.02371")
# .annotate "line", 285
    get_hll_global $P422, ["Exception";"AbstractMethodCalled"], "_block421" 
    .local pmc block
    set block, $P422
    $P426 = get_root_global ["parrot"], "P6metaclass"
    $P426."new_class"("Exception::InvalidArgument", "Exception::Wrapper" :named("parent"))
.end


.namespace ["Exception";"InvalidArgument"]
.sub "_block423"  :subid("148_1267109928.02371") :outer("147_1267109928.02371")
# .annotate "line", 285
    .return ()
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109901.36331")
# .annotate "line", 0
    get_hll_global $P14, ["Key"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["Key"], "_block13" 
    capture_lex $P14
    $P103 = $P14()
# .annotate "line", 1
    .return ($P103)
.end


.namespace ["Key"]
.sub "_block13"  :subid("11_1267109901.36331") :outer("10_1267109901.36331")
# .annotate "line", 6
    .const 'Sub' $P95 = "17_1267109901.36331" 
    capture_lex $P95
    .const 'Sub' $P39 = "15_1267109901.36331" 
    capture_lex $P39
    .const 'Sub' $P31 = "14_1267109901.36331" 
    capture_lex $P31
    .const 'Sub' $P22 = "13_1267109901.36331" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1267109901.36331" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1267109901.36331" 
    capture_lex $P15
    .lex "_pre_initload", $P15
    find_lex $P21, "_pre_initload"
# .annotate "line", 50
    .const 'Sub' $P95 = "17_1267109901.36331" 
    capture_lex $P95
# .annotate "line", 6
    .return ($P95)
.end


.namespace ["Key"]
.sub "_pre_initload"  :subid("12_1267109901.36331") :outer("11_1267109901.36331")
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
.sub "__dump"  :subid("13_1267109901.36331") :method :outer("11_1267109901.36331")
    .param pmc param_25
    .param pmc param_26
# .annotate "line", 10
    new $P24, 'ExceptionHandler'
    set_addr $P24, control_23
    $P24."handle_types"(58)
    push_eh $P24
    .lex "self", self
    .lex "$dumper", param_25
    .lex "$label", param_26
# .annotate "line", 11
    find_lex $P27, "self"
    get_repr $S28, $P27
    $P29 = "print"($S28)
# .annotate "line", 10
    .return ($P29)
  control_23:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P30, exception, "payload"
    .return ($P30)
.end


.namespace ["Key"]
.sub "new"  :subid("14_1267109901.36331") :method :outer("11_1267109901.36331")
    .param pmc param_34 :slurpy
# .annotate "line", 14
    new $P33, 'ExceptionHandler'
    set_addr $P33, control_32
    $P33."handle_types"(58)
    push_eh $P33
    .lex "self", self
    .lex "@parts", param_34
# .annotate "line", 15
    find_lex $P35, "self"
    find_lex $P36, "@parts"
    $P37 = $P35."new_"($P36)
# .annotate "line", 14
    .return ($P37)
  control_32:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P38, exception, "payload"
    .return ($P38)
.end


.namespace ["Key"]
.sub "new_"  :subid("15_1267109901.36331") :method :outer("11_1267109901.36331")
    .param pmc param_42
    .param pmc param_43 :optional
    .param int has_param_43 :opt_flag
# .annotate "line", 18
    .const 'Sub' $P54 = "16_1267109901.36331" 
    capture_lex $P54
    new $P41, 'ExceptionHandler'
    set_addr $P41, control_40
    $P41."handle_types"(58)
    push_eh $P41
    .lex "self", self
    .lex "@parts", param_42
    if has_param_43, optparam_18
    new $P44, "Hash"
    set param_43, $P44
  optparam_18:
    .lex "%opts", param_43
# .annotate "line", 19
    new $P45, "Undef"
    .lex "$key", $P45
# .annotate "line", 20
    new $P46, "Undef"
    .lex "$segment", $P46
# .annotate "line", 18
    find_lex $P47, "$key"
    find_lex $P48, "$segment"
# .annotate "line", 22
    find_lex $P50, "@parts"
    defined $I51, $P50
    unless $I51, for_undef_19
    iter $P49, $P50
    new $P91, 'ExceptionHandler'
    set_addr $P91, loop90_handler
    $P91."handle_types"(65, 67, 66)
    push_eh $P91
  loop90_test:
    unless $P49, loop90_done
    shift $P52, $P49
  loop90_redo:
    .const 'Sub' $P54 = "16_1267109901.36331" 
    capture_lex $P54
    $P54($P52)
  loop90_next:
    goto loop90_test
  loop90_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P92, exception, 'type'
    eq $P92, 65, loop90_next
    eq $P92, 67, loop90_redo
  loop90_done:
    pop_eh 
  for_undef_19:
    find_lex $P93, "$key"
# .annotate "line", 18
    .return ($P93)
  control_40:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P94, exception, "payload"
    .return ($P94)
.end


.namespace ["Key"]
.sub "_block53"  :anon :subid("16_1267109901.36331") :outer("15_1267109901.36331")
    .param pmc param_55
# .annotate "line", 22
    .lex "$_", param_55
# .annotate "line", 23
    new $P56, "String"
    assign $P56, "Key"
    set $S57, $P56
    new $P58, $S57
    store_lex "$segment", $P58
# .annotate "line", 25
    find_lex $P60, "$_"
    isa $I61, $P60, "Integer"
    if $I61, if_59
# .annotate "line", 26
    find_lex $P66, "$_"
    $P67 = $P66."isa"("Float")
    if $P67, if_65
# .annotate "line", 27
    find_lex $P72, "$_"
    $P73 = $P72."isa"("String")
    if $P73, if_71
# .annotate "line", 29
    get_hll_global $P78, ["Exception"], "InvalidArgument"
    isa $I79, $P78, "P6protoobject"
    if $I79, if_77
# .annotate "line", 35
    die "Arguments to Key.new must be Integer, String, or Float"
# .annotate "line", 34
    goto if_77_end
  if_77:
# .annotate "line", 30
    get_hll_global $P80, ["Exception"], "InvalidArgument"
    $P81 = $P80."new"("Arguments to Key.new must be Integer, String, or Float" :named("message"))
    $P81."throw"()
  if_77_end:
# .annotate "line", 28
    goto if_71_end
  if_71:
# .annotate "line", 27
    find_lex $P74, "$segment"
    find_lex $P75, "$_"
    set $S76, $P75
    assign $P74, $S76
  if_71_end:
    goto if_65_end
  if_65:
# .annotate "line", 26
    find_lex $P68, "$segment"
    find_lex $P69, "$_"
    set $N70, $P69
    assign $P68, $N70
  if_65_end:
    goto if_59_end
  if_59:
# .annotate "line", 25
    find_lex $P62, "$segment"
    find_lex $P63, "$_"
    set $I64, $P63
    assign $P62, $I64
  if_59_end:
# .annotate "line", 39
    find_lex $P84, "$key"
    $P85 = $P84."defined"()
    if $P85, if_83
# .annotate "line", 43
    find_lex $P89, "$segment"
    store_lex "$key", $P89
# .annotate "line", 42
    set $P82, $P89
# .annotate "line", 39
    goto if_83_end
  if_83:
# .annotate "line", 40
    find_lex $P86, "$key"
    find_lex $P87, "$segment"
    $P88 = $P86."push"($P87)
# .annotate "line", 39
    set $P82, $P88
  if_83_end:
# .annotate "line", 22
    .return ($P82)
.end


.namespace ["Key"]
.sub "push"  :subid("17_1267109901.36331") :method :outer("11_1267109901.36331")
    .param pmc param_98
# .annotate "line", 50
    new $P97, 'ExceptionHandler'
    set_addr $P97, control_96
    $P97."handle_types"(58)
    push_eh $P97
    .lex "self", self
    .lex "$obj", param_98
# .annotate "line", 51
    find_lex $P99, "self"
    find_lex $P100, "$obj"
    push $P99, $P100
    find_lex $P101, "self"
# .annotate "line", 50
    .return ($P101)
  control_96:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109962.89424")
# .annotate "line", 0
    get_hll_global $P14, ["Hash"], "_block13" 
    capture_lex $P14
# .annotate "line", 53
    get_hll_global $P14, ["Hash"], "_block13" 
    capture_lex $P14
    $P288 = $P14()
# .annotate "line", 1
    .return ($P288)
.end


.namespace ["Hash"]
.sub "_block13"  :subid("11_1267109962.89424") :outer("10_1267109962.89424")
# .annotate "line", 53
    .const 'Sub' $P267 = "28_1267109962.89424" 
    capture_lex $P267
    .const 'Sub' $P236 = "26_1267109962.89424" 
    capture_lex $P236
    .const 'Sub' $P210 = "24_1267109962.89424" 
    capture_lex $P210
    .const 'Sub' $P189 = "22_1267109962.89424" 
    capture_lex $P189
    .const 'Sub' $P181 = "21_1267109962.89424" 
    capture_lex $P181
    .const 'Sub' $P175 = "20_1267109962.89424" 
    capture_lex $P175
    .const 'Sub' $P169 = "19_1267109962.89424" 
    capture_lex $P169
    .const 'Sub' $P163 = "18_1267109962.89424" 
    capture_lex $P163
    .const 'Sub' $P85 = "15_1267109962.89424" 
    capture_lex $P85
    .const 'Sub' $P15 = "12_1267109962.89424" 
    capture_lex $P15
# .annotate "line", 117
    .const 'Sub' $P15 = "12_1267109962.89424" 
    capture_lex $P15
    .lex "merge", $P15
# .annotate "line", 157
    .const 'Sub' $P85 = "15_1267109962.89424" 
    capture_lex $P85
    .lex "merge_keys", $P85
# .annotate "line", 99
    find_lex $P234, "merge"
    find_lex $P235, "merge_keys"
# .annotate "line", 222
    .const 'Sub' $P267 = "28_1267109962.89424" 
    capture_lex $P267
# .annotate "line", 53
    .return ($P267)
.end


.namespace ["Hash"]
.sub "merge"  :subid("12_1267109962.89424") :outer("11_1267109962.89424")
    .param pmc param_18
    .param pmc param_19 :slurpy
    .param pmc param_20 :optional :named("into")
    .param int has_param_20 :opt_flag
    .param pmc param_22 :optional :named("use_last")
    .param int has_param_22 :opt_flag
# .annotate "line", 117
    .const 'Sub' $P52 = "13_1267109962.89424" 
    capture_lex $P52
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "%first", param_18
    .lex "@hashes", param_19
    if has_param_20, optparam_30
    new $P21, "Hash"
    set param_20, $P21
  optparam_30:
    .lex "%into", param_20
    if has_param_22, optparam_31
    new $P23, "Undef"
    set param_22, $P23
  optparam_31:
    .lex "$use_last", param_22
# .annotate "line", 129
    new $P24, "Hash"
    .lex "%stored", $P24
# .annotate "line", 119
    find_lex $P25, "@hashes"
    find_lex $P26, "%first"
    $P25."unshift"($P26)
# .annotate "line", 121
    get_hll_global $P28, ["Opcode"], "defined"
    find_lex $P29, "%into"
    $P30 = $P28($P29)
    if $P30, unless_27_end
# .annotate "line", 122
    find_lex $P31, "@hashes"
    $P32 = $P31."shift"()
    store_lex "%into", $P32
# .annotate "line", 124
    get_hll_global $P34, ["Opcode"], "defined"
    find_lex $P35, "%into"
    $P36 = $P34($P35)
    if $P36, unless_33_end
# .annotate "line", 125
    get_hll_global $P37, "Hash"
    $P38 = $P37."new"()
    store_lex "%into", $P38
  unless_33_end:
  unless_27_end:
# .annotate "line", 129
    find_lex $P39, "%into"
    store_lex "%stored", $P39
# .annotate "line", 131
    find_lex $P41, "$use_last"
    unless $P41, if_40_end
# .annotate "line", 132
    get_hll_global $P42, ["Array"], "reverse"
    find_lex $P43, "@hashes"
    $P44 = $P42($P43)
    store_lex "@hashes", $P44
# .annotate "line", 133
    get_hll_global $P45, ["Hash"], "empty"
    $P46 = $P45()
    store_lex "%stored", $P46
  if_40_end:
# .annotate "line", 136
    find_lex $P48, "@hashes"
    defined $I49, $P48
    unless $I49, for_undef_32
    iter $P47, $P48
    new $P80, 'ExceptionHandler'
    set_addr $P80, loop79_handler
    $P80."handle_types"(65, 67, 66)
    push_eh $P80
  loop79_test:
    unless $P47, loop79_done
    shift $P50, $P47
  loop79_redo:
    .const 'Sub' $P52 = "13_1267109962.89424" 
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
  for_undef_32:
# .annotate "line", 147
    new $P82, "Exception"
    set $P82['type'], 58
    find_lex $P83, "%into"
    setattribute $P82, 'payload', $P83
    throw $P82
# .annotate "line", 117
    .return ()
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P84, exception, "payload"
    .return ($P84)
.end


.namespace ["Hash"]
.sub "_block51"  :anon :subid("13_1267109962.89424") :outer("12_1267109962.89424")
    .param pmc param_54
# .annotate "line", 136
    .const 'Sub' $P61 = "14_1267109962.89424" 
    capture_lex $P61
# .annotate "line", 137
    new $P53, "Undef"
    .lex "$hash", $P53
    .lex "$_", param_54
    find_lex $P55, "$_"
    store_lex "$hash", $P55
# .annotate "line", 138
    find_lex $P57, "$hash"
    defined $I58, $P57
    unless $I58, for_undef_33
    iter $P56, $P57
    new $P77, 'ExceptionHandler'
    set_addr $P77, loop76_handler
    $P77."handle_types"(65, 67, 66)
    push_eh $P77
  loop76_test:
    unless $P56, loop76_done
    shift $P59, $P56
  loop76_redo:
    .const 'Sub' $P61 = "14_1267109962.89424" 
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
  for_undef_33:
# .annotate "line", 136
    .return ($P56)
.end


.namespace ["Hash"]
.sub "_block60"  :anon :subid("14_1267109962.89424") :outer("13_1267109962.89424")
    .param pmc param_62
# .annotate "line", 138
    .lex "$_", param_62
# .annotate "line", 139
    get_hll_global $P65, ["Hash"], "exists"
    find_lex $P66, "%stored"
    find_lex $P67, "$_"
    $P68 = $P65($P66, $P67)
    unless $P68, unless_64
    set $P63, $P68
    goto unless_64_end
  unless_64:
# .annotate "line", 142
    find_lex $P69, "$_"
    find_lex $P70, "$hash"
    unless_null $P70, vivify_34
    new $P70, "Hash"
  vivify_34:
    set $P71, $P70[$P69]
    unless_null $P71, vivify_35
    new $P71, "Undef"
  vivify_35:
    find_lex $P72, "$_"
    find_lex $P73, "%stored"
    unless_null $P73, vivify_36
    new $P73, "Hash"
    store_lex "%stored", $P73
  vivify_36:
    set $P73[$P72], $P71
    find_lex $P74, "$_"
    find_lex $P75, "%into"
    unless_null $P75, vivify_37
    new $P75, "Hash"
    store_lex "%into", $P75
  vivify_37:
    set $P75[$P74], $P71
# .annotate "line", 139
    set $P63, $P71
  unless_64_end:
# .annotate "line", 138
    .return ($P63)
.end


.namespace ["Hash"]
.sub "merge_keys"  :subid("15_1267109962.89424") :outer("11_1267109962.89424")
    .param pmc param_88
    .param pmc param_89 :slurpy
    .param pmc param_90 :named("keys")
    .param pmc param_91 :optional :named("into")
    .param int has_param_91 :opt_flag
    .param pmc param_93 :optional :named("use_last")
    .param int has_param_93 :opt_flag
# .annotate "line", 157
    .const 'Sub' $P123 = "16_1267109962.89424" 
    capture_lex $P123
    new $P87, 'ExceptionHandler'
    set_addr $P87, control_86
    $P87."handle_types"(58)
    push_eh $P87
    .lex "%first", param_88
    .lex "@hashes", param_89
    .lex "@keys", param_90
    if has_param_91, optparam_38
    new $P92, "Hash"
    set param_91, $P92
  optparam_38:
    .lex "%into", param_91
    if has_param_93, optparam_39
    new $P94, "Undef"
    set param_93, $P94
  optparam_39:
    .lex "$use_last", param_93
# .annotate "line", 168
    new $P95, "Hash"
    .lex "%stored", $P95
# .annotate "line", 158
    find_lex $P96, "@hashes"
    find_lex $P97, "%first"
    $P96."unshift"($P97)
# .annotate "line", 160
    get_hll_global $P99, ["Opcode"], "defined"
    find_lex $P100, "%into"
    $P101 = $P99($P100)
    if $P101, unless_98_end
# .annotate "line", 161
    find_lex $P102, "@hashes"
    $P103 = $P102."shift"()
    store_lex "%into", $P103
# .annotate "line", 163
    get_hll_global $P105, ["Opcode"], "defined"
    find_lex $P106, "%into"
    $P107 = $P105($P106)
    if $P107, unless_104_end
# .annotate "line", 164
    get_hll_global $P108, "Hash"
    $P109 = $P108."new"()
    store_lex "%into", $P109
  unless_104_end:
  unless_98_end:
# .annotate "line", 168
    find_lex $P110, "%into"
    store_lex "%stored", $P110
# .annotate "line", 170
    find_lex $P112, "$use_last"
    unless $P112, if_111_end
# .annotate "line", 171
    get_hll_global $P113, ["Array"], "reverse"
    find_lex $P114, "@hashes"
    $P115 = $P113($P114)
    store_lex "@hashes", $P115
# .annotate "line", 172
    get_hll_global $P116, ["Hash"], "empty"
    $P117 = $P116()
    store_lex "%stored", $P117
  if_111_end:
# .annotate "line", 175
    find_lex $P119, "@hashes"
    defined $I120, $P119
    unless $I120, for_undef_40
    iter $P118, $P119
    new $P158, 'ExceptionHandler'
    set_addr $P158, loop157_handler
    $P158."handle_types"(65, 67, 66)
    push_eh $P158
  loop157_test:
    unless $P118, loop157_done
    shift $P121, $P118
  loop157_redo:
    .const 'Sub' $P123 = "16_1267109962.89424" 
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
  for_undef_40:
# .annotate "line", 186
    new $P160, "Exception"
    set $P160['type'], 58
    find_lex $P161, "%into"
    setattribute $P160, 'payload', $P161
    throw $P160
# .annotate "line", 157
    .return ()
  control_86:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P162, exception, "payload"
    .return ($P162)
.end


.namespace ["Hash"]
.sub "_block122"  :anon :subid("16_1267109962.89424") :outer("15_1267109962.89424")
    .param pmc param_125
# .annotate "line", 175
    .const 'Sub' $P132 = "17_1267109962.89424" 
    capture_lex $P132
# .annotate "line", 176
    new $P124, "Undef"
    .lex "$hash", $P124
    .lex "$_", param_125
    find_lex $P126, "$_"
    store_lex "$hash", $P126
# .annotate "line", 178
    find_lex $P128, "@keys"
    defined $I129, $P128
    unless $I129, for_undef_41
    iter $P127, $P128
    new $P155, 'ExceptionHandler'
    set_addr $P155, loop154_handler
    $P155."handle_types"(65, 67, 66)
    push_eh $P155
  loop154_test:
    unless $P127, loop154_done
    shift $P130, $P127
  loop154_redo:
    .const 'Sub' $P132 = "17_1267109962.89424" 
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
  for_undef_41:
# .annotate "line", 175
    .return ($P127)
.end


.namespace ["Hash"]
.sub "_block131"  :anon :subid("17_1267109962.89424") :outer("16_1267109962.89424")
    .param pmc param_133
# .annotate "line", 178
    .lex "$_", param_133
# .annotate "line", 179
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
# .annotate "line", 181
    find_lex $P147, "$_"
    find_lex $P148, "$hash"
    unless_null $P148, vivify_42
    new $P148, "Hash"
  vivify_42:
    set $P149, $P148[$P147]
    unless_null $P149, vivify_43
    new $P149, "Undef"
  vivify_43:
    find_lex $P150, "$_"
    find_lex $P151, "%stored"
    unless_null $P151, vivify_44
    new $P151, "Hash"
    store_lex "%stored", $P151
  vivify_44:
    set $P151[$P150], $P149
    find_lex $P152, "$_"
    find_lex $P153, "%into"
    unless_null $P153, vivify_45
    new $P153, "Hash"
    store_lex "%into", $P153
  vivify_45:
    set $P153[$P152], $P149
# .annotate "line", 179
    set $P134, $P149
  if_135_end:
# .annotate "line", 178
    .return ($P134)
.end


.namespace ["Hash"]
.sub "contains"  :subid("18_1267109962.89424") :method :outer("11_1267109962.89424")
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
.sub "delete"  :subid("19_1267109962.89424") :method :outer("11_1267109962.89424")
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
.sub "elems"  :subid("20_1267109962.89424") :method :outer("11_1267109962.89424")
# .annotate "line", 81
    new $P177, 'ExceptionHandler'
    set_addr $P177, control_176
    $P177."handle_types"(58)
    push_eh $P177
    .lex "self", self
# .annotate "line", 82
    find_lex $P178, "self"
    elements $I179, $P178
# .annotate "line", 81
    .return ($I179)
  control_176:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P180, exception, "payload"
    .return ($P180)
.end


.namespace ["Hash"]
.sub "exists"  :subid("21_1267109962.89424") :method :outer("11_1267109962.89424")
    .param pmc param_184
# .annotate "line", 85
    new $P183, 'ExceptionHandler'
    set_addr $P183, control_182
    $P183."handle_types"(58)
    push_eh $P183
    .lex "self", self
    .lex "$key", param_184
# .annotate "line", 86
    find_lex $P185, "self"
    find_lex $P186, "$key"
    $P187 = $P185."contains"($P186)
# .annotate "line", 85
    .return ($P187)
  control_182:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P188, exception, "payload"
    .return ($P188)
.end


.namespace ["Hash"]
.sub "keys"  :subid("22_1267109962.89424") :method :outer("11_1267109962.89424")
# .annotate "line", 89
    .const 'Sub' $P199 = "23_1267109962.89424" 
    capture_lex $P199
    new $P191, 'ExceptionHandler'
    set_addr $P191, control_190
    $P191."handle_types"(58)
    push_eh $P191
    .lex "self", self
# .annotate "line", 90
    new $P192, "ResizablePMCArray"
    .lex "@keys", $P192
# .annotate "line", 89
    find_lex $P193, "@keys"
# .annotate "line", 92
    find_lex $P195, "self"
    defined $I196, $P195
    unless $I196, for_undef_46
    iter $P194, $P195
    new $P206, 'ExceptionHandler'
    set_addr $P206, loop205_handler
    $P206."handle_types"(65, 67, 66)
    push_eh $P206
  loop205_test:
    unless $P194, loop205_done
    shift $P197, $P194
  loop205_redo:
    .const 'Sub' $P199 = "23_1267109962.89424" 
    capture_lex $P199
    $P199($P197)
  loop205_next:
    goto loop205_test
  loop205_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P207, exception, 'type'
    eq $P207, 65, loop205_next
    eq $P207, 67, loop205_redo
  loop205_done:
    pop_eh 
  for_undef_46:
    find_lex $P208, "@keys"
# .annotate "line", 89
    .return ($P208)
  control_190:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P209, exception, "payload"
    .return ($P209)
.end


.namespace ["Hash"]
.sub "_block198"  :anon :subid("23_1267109962.89424") :outer("22_1267109962.89424")
    .param pmc param_200
# .annotate "line", 92
    .lex "$_", param_200
# .annotate "line", 93
    find_lex $P201, "@keys"
    find_lex $P202, "$_"
    $P203 = $P202."key"()
    $P204 = $P201."push"($P203)
# .annotate "line", 92
    .return ($P204)
.end


.namespace ["Hash"]
.sub "kv"  :subid("24_1267109962.89424") :method :outer("11_1267109962.89424")
# .annotate "line", 99
    .const 'Sub' $P220 = "25_1267109962.89424" 
    capture_lex $P220
    new $P212, 'ExceptionHandler'
    set_addr $P212, control_211
    $P212."handle_types"(58)
    push_eh $P212
    .lex "self", self
# .annotate "line", 100
    new $P213, "ResizablePMCArray"
    .lex "@kv", $P213
# .annotate "line", 99
    find_lex $P214, "@kv"
# .annotate "line", 102
    find_lex $P216, "self"
    defined $I217, $P216
    unless $I217, for_undef_47
    iter $P215, $P216
    new $P230, 'ExceptionHandler'
    set_addr $P230, loop229_handler
    $P230."handle_types"(65, 67, 66)
    push_eh $P230
  loop229_test:
    unless $P215, loop229_done
    shift $P218, $P215
  loop229_redo:
    .const 'Sub' $P220 = "25_1267109962.89424" 
    capture_lex $P220
    $P220($P218)
  loop229_next:
    goto loop229_test
  loop229_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P231, exception, 'type'
    eq $P231, 65, loop229_next
    eq $P231, 67, loop229_redo
  loop229_done:
    pop_eh 
  for_undef_47:
    find_lex $P232, "@kv"
# .annotate "line", 99
    .return ($P232)
  control_211:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P233, exception, "payload"
    .return ($P233)
.end


.namespace ["Hash"]
.sub "_block219"  :anon :subid("25_1267109962.89424") :outer("24_1267109962.89424")
    .param pmc param_221
# .annotate "line", 102
    .lex "$_", param_221
# .annotate "line", 103
    find_lex $P222, "@kv"
    find_lex $P223, "$_"
    $P224 = $P223."key"()
    $P222."push"($P224)
# .annotate "line", 104
    find_lex $P225, "@kv"
    find_lex $P226, "$_"
    $P227 = $P226."value"()
    $P228 = $P225."push"($P227)
# .annotate "line", 102
    .return ($P228)
.end


.namespace ["Hash"]
.sub "new"  :subid("26_1267109962.89424") :method :outer("11_1267109962.89424")
    .param pmc param_239 :slurpy
    .param pmc param_240 :slurpy :named
# .annotate "line", 204
    .const 'Sub' $P245 = "27_1267109962.89424" 
    capture_lex $P245
    new $P238, 'ExceptionHandler'
    set_addr $P238, control_237
    $P238."handle_types"(58)
    push_eh $P238
    .lex "self", self
    .lex "@pos", param_239
    .lex "%pairs", param_240
# .annotate "line", 205
    find_lex $P242, "@pos"
    set $N243, $P242
    unless $N243, if_241_end
    .const 'Sub' $P245 = "27_1267109962.89424" 
    capture_lex $P245
    $P245()
  if_241_end:
    find_lex $P265, "%pairs"
# .annotate "line", 204
    .return ($P265)
  control_237:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P266, exception, "payload"
    .return ($P266)
.end


.namespace ["Hash"]
.sub "_block244"  :anon :subid("27_1267109962.89424") :outer("26_1267109962.89424")
# .annotate "line", 206
    new $P246, "Undef"
    .lex "$message", $P246
    new $P247, "String"
    assign $P247, "Invalid call to Hash.new with positional args."
    store_lex "$message", $P247
# .annotate "line", 208
    get_hll_global $P249, ["Opcode"], "isa"
    find_lex $P250, "@pos"
    unless_null $P250, vivify_48
    new $P250, "ResizablePMCArray"
  vivify_48:
    set $P251, $P250[0]
    unless_null $P251, vivify_49
    new $P251, "Undef"
  vivify_49:
    $P252 = $P249($P251, "NameSpace")
    unless $P252, if_248_end
# .annotate "line", 209
    find_lex $P253, "$message"
    concat $P254, $P253, " "
    concat $P255, $P254, "Likely a call to (Hash-based) "
# .annotate "line", 211
    find_lex $P256, "@pos"
    unless_null $P256, vivify_50
    new $P256, "ResizablePMCArray"
  vivify_50:
    set $P257, $P256[0]
    unless_null $P257, vivify_51
    new $P257, "Undef"
  vivify_51:
    $P258 = $P257."get_name"()
    $S259 = $P258."join"("::")
    concat $P260, $P255, $S259
    concat $P261, $P260, ".new() - before class was created"
# .annotate "line", 212
    store_lex "$message", $P261
  if_248_end:
# .annotate "line", 215
    find_lex $P262, "@pos"
    find_lex $P263, "%pairs"
    "_dumper"($P262, $P263)
# .annotate "line", 216
    find_lex $P264, "$message"
    die $P264
# .annotate "line", 205
    .return ()
.end


.namespace ["Hash"]
.sub "values"  :subid("28_1267109962.89424") :method :outer("11_1267109962.89424")
# .annotate "line", 222
    .const 'Sub' $P277 = "29_1267109962.89424" 
    capture_lex $P277
    new $P269, 'ExceptionHandler'
    set_addr $P269, control_268
    $P269."handle_types"(58)
    push_eh $P269
    .lex "self", self
# .annotate "line", 223
    new $P270, "ResizablePMCArray"
    .lex "@values", $P270
# .annotate "line", 222
    find_lex $P271, "@values"
# .annotate "line", 225
    find_lex $P273, "self"
    defined $I274, $P273
    unless $I274, for_undef_52
    iter $P272, $P273
    new $P284, 'ExceptionHandler'
    set_addr $P284, loop283_handler
    $P284."handle_types"(65, 67, 66)
    push_eh $P284
  loop283_test:
    unless $P272, loop283_done
    shift $P275, $P272
  loop283_redo:
    .const 'Sub' $P277 = "29_1267109962.89424" 
    capture_lex $P277
    $P277($P275)
  loop283_next:
    goto loop283_test
  loop283_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P285, exception, 'type'
    eq $P285, 65, loop283_next
    eq $P285, 67, loop283_redo
  loop283_done:
    pop_eh 
  for_undef_52:
    find_lex $P286, "@values"
# .annotate "line", 222
    .return ($P286)
  control_268:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P287, exception, "payload"
    .return ($P287)
.end


.namespace ["Hash"]
.sub "_block276"  :anon :subid("29_1267109962.89424") :outer("28_1267109962.89424")
    .param pmc param_278
# .annotate "line", 225
    .lex "$_", param_278
# .annotate "line", 226
    find_lex $P279, "@values"
    find_lex $P280, "$_"
    $P281 = $P280."value"()
    $P282 = $P279."push"($P281)
# .annotate "line", 225
    .return ($P282)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109878.66297")
# .annotate "line", 0
    get_hll_global $P14, ["NameSpace"], "_block13" 
    capture_lex $P14
# .annotate "line", 9
    get_hll_global $P14, ["NameSpace"], "_block13" 
    capture_lex $P14
    $P74 = $P14()
# .annotate "line", 1
    .return ($P74)
.end


.namespace ["NameSpace"]
.sub "_block13"  :subid("11_1267109878.66297") :outer("10_1267109878.66297")
# .annotate "line", 9
    .const 'Sub' $P34 = "13_1267109878.66297" 
    capture_lex $P34
    .const 'Sub' $P15 = "12_1267109878.66297" 
    capture_lex $P15
# .annotate "line", 14
    .const 'Sub' $P34 = "13_1267109878.66297" 
    capture_lex $P34
# .annotate "line", 9
    .return ($P34)
.end


.namespace ["NameSpace"]
.sub "contains"  :subid("12_1267109878.66297") :method :outer("11_1267109878.66297")
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
.sub "string_name"  :subid("13_1267109878.66297") :method :outer("11_1267109878.66297")
    .param pmc param_37 :optional :named("format")
    .param int has_param_37 :opt_flag
    .param pmc param_39 :optional :named("with_hll")
    .param int has_param_39 :opt_flag
# .annotate "line", 14
    new $P36, 'ExceptionHandler'
    set_addr $P36, control_35
    $P36."handle_types"(58)
    push_eh $P36
    .lex "self", self
    if has_param_37, optparam_14
    new $P38, "Undef"
    set param_37, $P38
  optparam_14:
    .lex "$format", param_37
    if has_param_39, optparam_15
    new $P40, "Undef"
    set param_39, $P40
  optparam_15:
    .lex "$with_hll", param_39
# .annotate "line", 17
    new $P41, "ResizablePMCArray"
    .lex "@parts", $P41
# .annotate "line", 18
    new $P42, "Undef"
    .lex "$delim", $P42
# .annotate "line", 15
    find_lex $P44, "$format"
    set $P43, $P44
    defined $I46, $P43
    if $I46, default_45
    new $P47, "String"
    assign $P47, "perl6"
    set $P43, $P47
  default_45:
    store_lex "$format", $P43
# .annotate "line", 17
    find_lex $P48, "self"
    $P49 = $P48."get_name"()
    store_lex "@parts", $P49
# .annotate "line", 18
    find_lex $P52, "$format"
    set $S53, $P52
    iseq $I54, $S53, "pir"
    if $I54, if_51
    new $P56, "String"
    assign $P56, "::"
    set $P50, $P56
    goto if_51_end
  if_51:
    new $P55, "String"
    assign $P55, "'; '"
    set $P50, $P55
  if_51_end:
    store_lex "$delim", $P50
# .annotate "line", 20
    find_lex $P58, "$with_hll"
    if $P58, unless_57_end
    find_lex $P59, "@parts"
    $P59."shift"()
  unless_57_end:
# .annotate "line", 22
    find_lex $P62, "$format"
    set $S63, $P62
    iseq $I64, $S63, "pir"
    if $I64, if_61
# .annotate "line", 24
    find_lex $P71, "@parts"
    $P72 = $P71."join"("::")
    set $P60, $P72
# .annotate "line", 22
    goto if_61_end
  if_61:
# .annotate "line", 23
    new $P65, "String"
    assign $P65, "['"
    find_lex $P66, "@parts"
    find_lex $P67, "$delim"
    $S68 = $P66."join"($P67)
    concat $P69, $P65, $S68
    concat $P70, $P69, "']"
    set $P60, $P70
  if_61_end:
# .annotate "line", 14
    .return ($P60)
  control_35:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P73, exception, "payload"
    .return ($P73)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109940.5039")
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
.sub "_block13"  :subid("11_1267109940.5039") :outer("10_1267109940.5039")
# .annotate "line", 7
    .const 'Sub' $P458 = "29_1267109940.5039" 
    capture_lex $P458
    .const 'Sub' $P407 = "28_1267109940.5039" 
    capture_lex $P407
    .const 'Sub' $P396 = "27_1267109940.5039" 
    capture_lex $P396
    .const 'Sub' $P387 = "26_1267109940.5039" 
    capture_lex $P387
    .const 'Sub' $P377 = "25_1267109940.5039" 
    capture_lex $P377
    .const 'Sub' $P352 = "24_1267109940.5039" 
    capture_lex $P352
    .const 'Sub' $P300 = "23_1267109940.5039" 
    capture_lex $P300
    .const 'Sub' $P258 = "22_1267109940.5039" 
    capture_lex $P258
    .const 'Sub' $P224 = "21_1267109940.5039" 
    capture_lex $P224
    .const 'Sub' $P200 = "20_1267109940.5039" 
    capture_lex $P200
    .const 'Sub' $P184 = "19_1267109940.5039" 
    capture_lex $P184
    .const 'Sub' $P150 = "18_1267109940.5039" 
    capture_lex $P150
    .const 'Sub' $P117 = "17_1267109940.5039" 
    capture_lex $P117
    .const 'Sub' $P109 = "16_1267109940.5039" 
    capture_lex $P109
    .const 'Sub' $P69 = "14_1267109940.5039" 
    capture_lex $P69
    .const 'Sub' $P22 = "13_1267109940.5039" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1267109940.5039" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1267109940.5039" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 30
    .const 'Sub' $P22 = "13_1267109940.5039" 
    capture_lex $P22
    .lex "character_offset_of", $P22
# .annotate "line", 52
    .const 'Sub' $P69 = "14_1267109940.5039" 
    capture_lex $P69
    .lex "display_width", $P69
# .annotate "line", 80
    .const 'Sub' $P109 = "16_1267109940.5039" 
    capture_lex $P109
    .lex "downcase", $P109
# .annotate "line", 84
    .const 'Sub' $P117 = "17_1267109940.5039" 
    capture_lex $P117
    .lex "find_cclass", $P117
# .annotate "line", 126
    .const 'Sub' $P150 = "18_1267109940.5039" 
    capture_lex $P150
    .lex "find_not_cclass", $P150
# .annotate "line", 165
    .const 'Sub' $P184 = "19_1267109940.5039" 
    capture_lex $P184
    .lex "index", $P184
# .annotate "line", 188
    .const 'Sub' $P200 = "20_1267109940.5039" 
    capture_lex $P200
    .lex "is_cclass", $P200
# .annotate "line", 232
    .const 'Sub' $P224 = "21_1267109940.5039" 
    capture_lex $P224
    .lex "_init_line_number_info", $P224
# .annotate "line", 267
    .const 'Sub' $P258 = "22_1267109940.5039" 
    capture_lex $P258
    .lex "line_number_of", $P258
# .annotate "line", 297
    .const 'Sub' $P300 = "23_1267109940.5039" 
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
    .const 'Sub' $P458 = "29_1267109940.5039" 
    capture_lex $P458
# .annotate "line", 7
    .return ($P458)
.end


.namespace ["String"]
.sub "_pre_initload"  :subid("12_1267109940.5039") :outer("11_1267109940.5039")
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
.sub "character_offset_of"  :subid("13_1267109940.5039") :outer("11_1267109940.5039")
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
.sub "display_width"  :subid("14_1267109940.5039") :outer("11_1267109940.5039")
    .param pmc param_72
# .annotate "line", 52
    .const 'Sub' $P78 = "15_1267109940.5039" 
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
    .const 'Sub' $P78 = "15_1267109940.5039" 
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
.sub "_block77"  :anon :subid("15_1267109940.5039") :outer("14_1267109940.5039")
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
.sub "downcase"  :subid("16_1267109940.5039") :outer("11_1267109940.5039")
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
.sub "find_cclass"  :subid("17_1267109940.5039") :outer("11_1267109940.5039")
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
.sub "find_not_cclass"  :subid("18_1267109940.5039") :outer("11_1267109940.5039")
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
.sub "index"  :subid("19_1267109940.5039") :outer("11_1267109940.5039")
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
.sub "is_cclass"  :subid("20_1267109940.5039") :outer("11_1267109940.5039")
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
.sub "_init_line_number_info"  :subid("21_1267109940.5039") :outer("11_1267109940.5039")
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
.sub "line_number_of"  :subid("22_1267109940.5039") :outer("11_1267109940.5039")
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
.sub "ltrim_indent"  :subid("23_1267109940.5039") :outer("11_1267109940.5039")
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
.sub "length"  :subid("24_1267109940.5039") :method :outer("11_1267109940.5039")
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
.sub "isa"  :subid("25_1267109940.5039") :method :outer("11_1267109940.5039")
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
.sub "repeat"  :subid("26_1267109940.5039") :method :outer("11_1267109940.5039")
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
.sub "split"  :subid("27_1267109940.5039") :method :outer("11_1267109940.5039")
    .param pmc param_399 :optional
    .param int has_param_399 :opt_flag
# .annotate "line", 328
    new $P398, 'ExceptionHandler'
    set_addr $P398, control_397
    $P398."handle_types"(58)
    push_eh $P398
    .lex "self", self
    if has_param_399, optparam_75
    new $P400, "Undef"
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
.sub "substr"  :subid("28_1267109940.5039") :method :outer("11_1267109940.5039")
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
.sub "trim"  :subid("29_1267109940.5039") :method :outer("11_1267109940.5039")
# .annotate "line", 373
    .const 'Sub' $P476 = "30_1267109940.5039" 
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
    .const 'Sub' $P476 = "30_1267109940.5039" 
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
.sub "_block475"  :anon :subid("30_1267109940.5039") :outer("29_1267109940.5039")
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
.sub "_block11"  :anon :subid("10_1267109908.09341")
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
.sub "_block13"  :subid("11_1267109908.09341") :outer("10_1267109908.09341")
# .annotate "line", 6
    .const 'Sub' $P37 = "14_1267109908.09341" 
    capture_lex $P37
    .const 'Sub' $P22 = "13_1267109908.09341" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1267109908.09341" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1267109908.09341" 
    capture_lex $P15
    .lex "set_dump_detail", $P15
# .annotate "line", 10
    .const 'Sub' $P22 = "13_1267109908.09341" 
    capture_lex $P22
    .lex "get_dump_detail", $P22
# .annotate "line", 6
    find_lex $P35, "set_dump_detail"
    find_lex $P36, "get_dump_detail"
# .annotate "line", 20
    .const 'Sub' $P37 = "14_1267109908.09341" 
    capture_lex $P37
# .annotate "line", 6
    .return ($P37)
.end


.namespace ["Sub"]
.sub "set_dump_detail"  :subid("12_1267109908.09341") :outer("11_1267109908.09341")
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
.sub "get_dump_detail"  :subid("13_1267109908.09341") :outer("11_1267109908.09341")
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
.sub "__dump"  :subid("14_1267109908.09341") :method :outer("11_1267109908.09341")
    .param pmc param_40
    .param pmc param_41
# .annotate "line", 20
    .const 'Sub' $P62 = "15_1267109908.09341" 
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
    .const 'Sub' $P62 = "15_1267109908.09341" 
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
.sub "_block61"  :anon :subid("15_1267109908.09341") :outer("14_1267109908.09341")
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
.sub "_block11"  :anon :subid("10_1267109923.40364")
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
.sub "_block13"  :subid("11_1267109923.40364") :outer("10_1267109923.40364")
# .annotate "line", 7
    .const 'Sub' $P15 = "12_1267109923.40364" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1267109923.40364" 
    capture_lex $P15
    .return ($P15)
.end


.namespace ["Undef"]
.sub "defined"  :subid("12_1267109923.40364") :method :outer("11_1267109923.40364")
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


.namespace []
.sub "_block11"  :anon :subid("10_1267109911.91347")
# .annotate "line", 0
    get_hll_global $P14, ["P6object"], "_block13" 
    capture_lex $P14
# .annotate "line", 8
    get_hll_global $P14, ["P6object"], "_block13" 
    capture_lex $P14
    $P378 = $P14()
# .annotate "line", 1
    .return ($P378)
.end


.namespace ["P6object"]
.sub "_block13"  :subid("11_1267109911.91347") :outer("10_1267109911.91347")
# .annotate "line", 8
    .const 'Sub' $P360 = "38_1267109911.91347" 
    capture_lex $P360
    .const 'Sub' $P350 = "37_1267109911.91347" 
    capture_lex $P350
    .const 'Sub' $P339 = "36_1267109911.91347" 
    capture_lex $P339
    .const 'Sub' $P328 = "35_1267109911.91347" 
    capture_lex $P328
    .const 'Sub' $P292 = "33_1267109911.91347" 
    capture_lex $P292
    .const 'Sub' $P281 = "32_1267109911.91347" 
    capture_lex $P281
    .const 'Sub' $P271 = "31_1267109911.91347" 
    capture_lex $P271
    .const 'Sub' $P260 = "30_1267109911.91347" 
    capture_lex $P260
    .const 'Sub' $P256 = "29_1267109911.91347" 
    capture_lex $P256
    .const 'Sub' $P131 = "24_1267109911.91347" 
    capture_lex $P131
    .const 'Sub' $P125 = "23_1267109911.91347" 
    capture_lex $P125
    .const 'Sub' $P119 = "22_1267109911.91347" 
    capture_lex $P119
    .const 'Sub' $P80 = "21_1267109911.91347" 
    capture_lex $P80
    .const 'Sub' $P68 = "20_1267109911.91347" 
    capture_lex $P68
    .const 'Sub' $P64 = "19_1267109911.91347" 
    capture_lex $P64
    .const 'Sub' $P60 = "18_1267109911.91347" 
    capture_lex $P60
    .const 'Sub' $P56 = "17_1267109911.91347" 
    capture_lex $P56
    .const 'Sub' $P52 = "16_1267109911.91347" 
    capture_lex $P52
    .const 'Sub' $P48 = "15_1267109911.91347" 
    capture_lex $P48
    .const 'Sub' $P41 = "14_1267109911.91347" 
    capture_lex $P41
    .const 'Sub' $P25 = "13_1267109911.91347" 
    capture_lex $P25
    .const 'Sub' $P15 = "12_1267109911.91347" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1267109911.91347" 
    capture_lex $P15
    .lex "_pre_initload", $P15
    find_lex $P24, "_pre_initload"
# .annotate "line", 241
    .const 'Sub' $P360 = "38_1267109911.91347" 
    capture_lex $P360
# .annotate "line", 8
    .return ($P360)
.end


.namespace ["P6object"]
.sub "_pre_initload"  :subid("12_1267109911.91347") :outer("11_1267109911.91347")
# .annotate "line", 8
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 10
    get_hll_global $P18, ["Pir"], "compile_sub"
# .annotate "line", 14
    new $P19, "ResizablePMCArray"
    push $P19, "$I0= self.\"get_bool\"()"
    push $P19, ".return ($I0)"
    $P18("__get_bool" :named("name"), "get_bool" :named("vtable"), "P6object" :named("namespace"), $P19 :named("body"))
# .annotate "line", 18
    get_hll_global $P20, ["Pir"], "compile_sub"
# .annotate "line", 22
    new $P21, "ResizablePMCArray"
    push $P21, "$S0 = self.\"get_string\"()"
    push $P21, ".return ($S0)"
    $P22 = $P20("__get_string" :named("name"), "get_string" :named("vtable"), "P6object" :named("namespace"), $P21 :named("body"))
# .annotate "line", 8
    .return ($P22)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P23, exception, "payload"
    .return ($P23)
.end


.namespace ["P6object"]
.sub "__ABSTRACT__"  :subid("13_1267109911.91347") :method :outer("11_1267109911.91347")
# .annotate "line", 43
    new $P27, 'ExceptionHandler'
    set_addr $P27, control_26
    $P27."handle_types"(58)
    push_eh $P27
    .lex "self", self
# .annotate "line", 44
    new $P28, "Undef"
    .lex "$name", $P28
    get_hll_global $P29, ["Parrot"], "caller"
    $P30 = $P29()
    set $S31, $P30
    new $P32, 'String'
    set $P32, $S31
    store_lex "$name", $P32
# .annotate "line", 45
    get_hll_global $P33, ["Exception"], "AbstractMethodCalled"
    new $P34, 'String'
    set $P34, "Invalid call to abstract method '"
    find_lex $P35, "$name"
    concat $P36, $P34, $P35
    concat $P37, $P36, "'"
    $P38 = $P33."new"($P37 :named("message"))
    $P39 = $P38."throw"()
# .annotate "line", 43
    .return ($P39)
  control_26:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P40, exception, "payload"
    .return ($P40)
.end


.namespace ["P6object"]
.sub "IDONTKNOW"  :subid("14_1267109911.91347") :method :outer("11_1267109911.91347")
# .annotate "line", 89
    new $P43, 'ExceptionHandler'
    set_addr $P43, control_42
    $P43."handle_types"(58)
    push_eh $P43
    .lex "self", self
# .annotate "line", 90
    new $P44, "Exception"
    set $P44['type'], 58
    get_hll_global $P45, "Undef"
    $P46 = $P45."new"()
    setattribute $P44, 'payload', $P46
    throw $P44
# .annotate "line", 89
    .return ()
  control_42:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P47, exception, "payload"
    .return ($P47)
.end


.namespace ["P6object"]
.sub "WHY"  :subid("15_1267109911.91347") :method :outer("11_1267109911.91347")
# .annotate "line", 93
    new $P50, 'ExceptionHandler'
    set_addr $P50, control_49
    $P50."handle_types"(58)
    push_eh $P50
    .lex "self", self
    .return ()
  control_49:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P51, exception, "payload"
    .return ($P51)
.end


.namespace ["P6object"]
.sub "BECAUSE"  :subid("16_1267109911.91347") :method :outer("11_1267109911.91347")
# .annotate "line", 96
    new $P54, 'ExceptionHandler'
    set_addr $P54, control_53
    $P54."handle_types"(58)
    push_eh $P54
    .lex "self", self
    .return ()
  control_53:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P55, exception, "payload"
    .return ($P55)
.end


.namespace ["P6object"]
.sub "TODAY"  :subid("17_1267109911.91347") :method :outer("11_1267109911.91347")
# .annotate "line", 99
    new $P58, 'ExceptionHandler'
    set_addr $P58, control_57
    $P58."handle_types"(58)
    push_eh $P58
    .lex "self", self
    .return ()
  control_57:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P59, exception, "payload"
    .return ($P59)
.end


.namespace ["P6object"]
.sub "TOMORROW"  :subid("18_1267109911.91347") :method :outer("11_1267109911.91347")
# .annotate "line", 102
    new $P62, 'ExceptionHandler'
    set_addr $P62, control_61
    $P62."handle_types"(58)
    push_eh $P62
    .lex "self", self
    .return ()
  control_61:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P63, exception, "payload"
    .return ($P63)
.end


.namespace ["P6object"]
.sub "IDONTGIVEADARN"  :subid("19_1267109911.91347") :method :outer("11_1267109911.91347")
# .annotate "line", 105
    new $P66, 'ExceptionHandler'
    set_addr $P66, control_65
    $P66."handle_types"(58)
    push_eh $P66
    .lex "self", self
    .return ()
  control_65:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P67, exception, "payload"
    .return ($P67)
.end


.namespace ["P6object"]
.sub "SUPER"  :subid("20_1267109911.91347") :method :outer("11_1267109911.91347")
    .param pmc param_71
    .param pmc param_72 :slurpy
    .param pmc param_73 :slurpy :named
# .annotate "line", 108
    new $P70, 'ExceptionHandler'
    set_addr $P70, control_69
    $P70."handle_types"(58)
    push_eh $P70
    .lex "self", self
    .lex "$method", param_71
    .lex "@pos", param_72
    .lex "%named", param_73
# .annotate "line", 109
    find_lex $P74, "self"
    find_lex $P75, "$method"
    find_lex $P76, "@pos"
    find_lex $P77, "%named"
    $P78 = $P74."SUPER_"($P75, $P76, $P77)
# .annotate "line", 108
    .return ($P78)
  control_69:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P79, exception, "payload"
    .return ($P79)
.end


.namespace ["P6object"]
.sub "SUPER_"  :subid("21_1267109911.91347") :method :outer("11_1267109911.91347")
    .param pmc param_83
    .param pmc param_84
    .param pmc param_85
# .annotate "line", 112
    new $P82, 'ExceptionHandler'
    set_addr $P82, control_81
    $P82."handle_types"(58)
    push_eh $P82
    .lex "self", self
    .lex "$method", param_83
    .lex "@pos", param_84
    .lex "%named", param_85
# .annotate "line", 114
    new $P86, "Undef"
    .lex "$class", $P86
# .annotate "line", 115
    new $P87, "ResizablePMCArray"
    .lex "@mro", $P87
# .annotate "line", 121
    new $P88, "Undef"
    .lex "$parent", $P88
# .annotate "line", 122
    new $P89, "Undef"
    .lex "&sub", $P89
# .annotate "line", 114
    find_lex $P90, "self"
    class $P91, $P90
    store_lex "$class", $P91
# .annotate "line", 115
    find_lex $P92, "$class"
    $P93 = $P92."inspect"("all_parents")
    store_lex "@mro", $P93
# .annotate "line", 117
    find_lex $P95, "@mro"
    set $N96, $P95
    iseq $I97, $N96, 1.0
    unless $I97, if_94_end
# .annotate "line", 118
    "die"("Call to 'super' on object with no parent classes")
  if_94_end:
# .annotate "line", 121
    find_lex $P98, "@mro"
    unless_null $P98, vivify_39
    new $P98, "ResizablePMCArray"
  vivify_39:
    set $P99, $P98[1]
    unless_null $P99, vivify_40
    new $P99, "Undef"
  vivify_40:
    store_lex "$parent", $P99
# .annotate "line", 122
    find_lex $P100, "$parent"
    find_lex $P101, "$method"
    $P102 = $P100."find_method"($P101)
    store_lex "&sub", $P102
# .annotate "line", 124
    find_lex $P104, "&sub"
    isnull $I105, $P104
    unless $I105, if_103_end
# .annotate "line", 125
    get_hll_global $P106, ["Exception"], "MethodNotFound"
    new $P107, 'String'
    set $P107, "Method '"
    find_lex $P108, "$method"
    concat $P109, $P107, $P108
    concat $P110, $P109, "' not found"
    $P111 = $P106."new"($P110 :named("message"))
    $P111."throw"()
  if_103_end:
# .annotate "line", 128
    get_hll_global $P112, ["Parrot"], "call_method_"
    find_lex $P113, "self"
    find_lex $P114, "&sub"
    find_lex $P115, "@pos"
    find_lex $P116, "%named"
    $P117 = $P112($P113, $P114, $P115, $P116)
# .annotate "line", 112
    .return ($P117)
  control_81:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, "payload"
    .return ($P118)
.end


.namespace ["P6object"]
.sub "clone"  :subid("22_1267109911.91347") :method :outer("11_1267109911.91347")
# .annotate "line", 132
    new $P121, 'ExceptionHandler'
    set_addr $P121, control_120
    $P121."handle_types"(58)
    push_eh $P121
    .lex "self", self
# .annotate "line", 133
    find_lex $P122, "self"
    clone $P123, $P122
# .annotate "line", 132
    .return ($P123)
  control_120:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P124, exception, "payload"
    .return ($P124)
.end


.namespace ["P6object"]
.sub "defined"  :subid("23_1267109911.91347") :method :outer("11_1267109911.91347")
# .annotate "line", 136
    new $P127, 'ExceptionHandler'
    set_addr $P127, control_126
    $P127."handle_types"(58)
    push_eh $P127
    .lex "self", self
# .annotate "line", 138
    new $P128, "Exception"
    set $P128['type'], 58
    new $P129, "Integer"
    assign $P129, 1
    setattribute $P128, 'payload', $P129
    throw $P128
# .annotate "line", 136
    .return ()
  control_126:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P130, exception, "payload"
    .return ($P130)
.end


.namespace ["P6object"]
.sub "__dump"  :subid("24_1267109911.91347") :method :outer("11_1267109911.91347")
    .param pmc param_134
    .param pmc param_135
# .annotate "line", 141
    .const 'Sub' $P168 = "25_1267109911.91347" 
    capture_lex $P168
    new $P133, 'ExceptionHandler'
    set_addr $P133, control_132
    $P133."handle_types"(58)
    push_eh $P133
    .lex "self", self
    .lex "$dumper", param_134
    .lex "$label", param_135
# .annotate "line", 142
    new $P136, "ResizablePMCArray"
    .lex "@results", $P136
# .annotate "line", 143
    new $P137, "Undef"
    .lex "$subindent", $P137
# .annotate "line", 144
    new $P138, "Undef"
    .lex "$indent", $P138
# .annotate "line", 145
    new $P139, "Undef"
    .lex "$brace", $P139
# .annotate "line", 146
    new $P140, "Undef"
    .lex "$empty", $P140
# .annotate "line", 148
    new $P141, "Undef"
    .lex "$class", $P141
# .annotate "line", 149
    new $P142, "ResizablePMCArray"
    .lex "@mro", $P142
# .annotate "line", 150
    new $P143, "Undef"
    .lex "$attributes_set", $P143
# .annotate "line", 142
    get_hll_global $P144, ["Parrot"], "call_tuple_method"
    find_lex $P145, "$dumper"
    $P146 = $P144($P145, "newIndent")
    store_lex "@results", $P146
# .annotate "line", 143
    new $P147, "String"
    assign $P147, "\n"
    find_lex $P148, "@results"
    $S149 = $P148."shift"()
    concat $P150, $P147, $S149
    store_lex "$subindent", $P150
# .annotate "line", 144
    new $P151, "String"
    assign $P151, "\n"
    find_lex $P152, "@results"
    $S153 = $P152."shift"()
    concat $P154, $P151, $S153
    store_lex "$indent", $P154
# .annotate "line", 145
    new $P155, "String"
    assign $P155, "{"
    store_lex "$brace", $P155
# .annotate "line", 146
    new $P156, "String"
    assign $P156, ""
    store_lex "$empty", $P156
# .annotate "line", 148
    get_hll_global $P157, ["Opcode"], "class"
    find_lex $P158, "self"
    $P159 = $P157($P158)
    store_lex "$class", $P159
# .annotate "line", 149
    find_lex $P160, "$class"
    $P161 = $P160."inspect"("all_parents")
    store_lex "@mro", $P161
# .annotate "line", 150
    new $P162, "Integer"
    assign $P162, 0
    store_lex "$attributes_set", $P162
# .annotate "line", 152
    find_lex $P164, "@mro"
    defined $I165, $P164
    unless $I165, for_undef_41
    iter $P163, $P164
    new $P248, 'ExceptionHandler'
    set_addr $P248, loop247_handler
    $P248."handle_types"(65, 67, 66)
    push_eh $P248
  loop247_test:
    unless $P163, loop247_done
    shift $P166, $P163
  loop247_redo:
    .const 'Sub' $P168 = "25_1267109911.91347" 
    capture_lex $P168
    $P168($P166)
  loop247_next:
    goto loop247_test
  loop247_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P249, exception, 'type'
    eq $P249, 65, loop247_next
    eq $P249, 67, loop247_redo
  loop247_done:
    pop_eh 
  for_undef_41:
# .annotate "line", 182
    find_lex $P251, "$attributes_set"
    if $P251, if_250
# .annotate "line", 186
    "print"("(no attributes set)")
# .annotate "line", 185
    goto if_250_end
  if_250:
# .annotate "line", 183
    find_lex $P252, "$indent"
    "print"($P252, "}")
  if_250_end:
# .annotate "line", 189
    find_lex $P253, "$dumper"
    $P254 = $P253."deleteIndent"()
# .annotate "line", 141
    .return ($P254)
  control_132:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P255, exception, "payload"
    .return ($P255)
.end


.namespace ["P6object"]
.sub "_block167"  :anon :subid("25_1267109911.91347") :outer("24_1267109911.91347")
    .param pmc param_171
# .annotate "line", 152
    .const 'Sub' $P181 = "26_1267109911.91347" 
    capture_lex $P181
# .annotate "line", 153
    new $P169, "Undef"
    .lex "$parent", $P169
# .annotate "line", 154
    new $P170, "ResizablePMCArray"
    .lex "@attributes", $P170
    .lex "$_", param_171
# .annotate "line", 153
    find_lex $P172, "$_"
    store_lex "$parent", $P172
# .annotate "line", 154
    find_lex $P173, "$parent"
    $P174 = $P173."attributes"()
    $P175 = $P174."keys"()
    store_lex "@attributes", $P175
# .annotate "line", 156
    find_lex $P178, "@attributes"
    set $N179, $P178
    if $N179, if_177
    new $P176, 'Float'
    set $P176, $N179
    goto if_177_end
  if_177:
    .const 'Sub' $P181 = "26_1267109911.91347" 
    capture_lex $P181
    $P246 = $P181()
    set $P176, $P246
  if_177_end:
# .annotate "line", 152
    .return ($P176)
.end


.namespace ["P6object"]
.sub "_block180"  :anon :subid("26_1267109911.91347") :outer("25_1267109911.91347")
# .annotate "line", 156
    .const 'Sub' $P205 = "27_1267109911.91347" 
    capture_lex $P205
# .annotate "line", 160
    new $P182, "Undef"
    .lex "$class_name", $P182
# .annotate "line", 157
    find_lex $P183, "$brace"
    "print"($P183)
# .annotate "line", 158
    find_lex $P184, "$empty"
    store_lex "$brace", $P184
# .annotate "line", 160
    find_lex $P185, "$parent"
    $P186 = $P185."get_namespace"()
    $P187 = $P186."get_name"()
    $P188 = $P187."join"("::")
    store_lex "$class_name", $P188
# .annotate "line", 161
    find_lex $P190, "$_"
    find_lex $P191, "$class"
    issame $I192, $P190, $P191
    if $I192, unless_189_end
# .annotate "line", 162
    find_lex $P193, "$subindent"
    find_lex $P194, "$class_name"
    "print"($P193, "# -- from ", $P194)
  unless_189_end:
# .annotate "line", 165
    find_lex $P195, "$attributes_set"
    find_lex $P196, "@attributes"
    set $N197, $P196
    add $P198, $P195, $N197
    store_lex "$attributes_set", $P198
# .annotate "line", 166
    find_lex $P199, "@attributes"
    $P199."sort"()
# .annotate "line", 168
    find_lex $P201, "@attributes"
    defined $I202, $P201
    unless $I202, for_undef_42
    iter $P200, $P201
    new $P244, 'ExceptionHandler'
    set_addr $P244, loop243_handler
    $P244."handle_types"(65, 67, 66)
    push_eh $P244
  loop243_test:
    unless $P200, loop243_done
    shift $P203, $P200
  loop243_redo:
    .const 'Sub' $P205 = "27_1267109911.91347" 
    capture_lex $P205
    $P205($P203)
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
  for_undef_42:
# .annotate "line", 156
    .return ($P200)
.end


.namespace ["P6object"]
.sub "_block204"  :anon :subid("27_1267109911.91347") :outer("26_1267109911.91347")
    .param pmc param_208
# .annotate "line", 168
    .const 'Sub' $P228 = "28_1267109911.91347" 
    capture_lex $P228
    new $P224, 'ExceptionHandler'
    set_addr $P224, control_223
    $P224."handle_types_except"(58, 59, 60, 61, 63, 64, 65, 66, 67)
    push_eh $P224
# .annotate "line", 169
    new $P206, "Undef"
    .lex "$attr", $P206
# .annotate "line", 170
    new $P207, "Undef"
    .lex "$value", $P207
    .lex "$_", param_208
# .annotate "line", 169
    find_lex $P209, "$_"
    set $S210, $P209
    new $P211, 'String'
    set $P211, $S210
    store_lex "$attr", $P211
# .annotate "line", 170
    find_lex $P212, "self"
    find_lex $P213, "$parent"
    find_lex $P214, "$attr"
    set $S215, $P214
    getattribute $P216, $P212, $P213, $S215
    store_lex "$value", $P216
# .annotate "line", 171
    find_lex $P217, "$subindent"
    find_lex $P218, "$attr"
    "print"($P217, $P218, " => ")
# .annotate "line", 172
    find_lex $P219, "$dumper"
    find_lex $P220, "$label"
    find_lex $P221, "$value"
    $P219."dump"($P220, $P221)
# .annotate "line", 173
    "print"(",")
# .annotate "line", 168
    pop_eh 
    goto skip_handler_222
  control_223:
# .annotate "line", 175
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P228 = "28_1267109911.91347" 
    capture_lex $P228
    $P228(exception)
    new $P241, 'Integer'
    set $P241, 1
    set exception["handled"], $P241
    set $I242, exception["handled"]
    ne $I242, 1, nothandled_226
  handled_225:
    .return (exception)
  nothandled_226:
    rethrow exception
  skip_handler_222:
# .annotate "line", 168
    .return ()
.end


.namespace ["P6object"]
.sub "_block227"  :anon :subid("28_1267109911.91347") :outer("27_1267109911.91347")
    .param pmc param_229
# .annotate "line", 175
    .lex "$_", param_229
    find_lex $P230, "$_"
    .lex "$!", $P230
# .annotate "line", 176
    new $P231, 'String'
    set $P231, "\n*** Bad attribute: "
    find_lex $P232, "$attr"
    concat $P233, $P231, $P232
    concat $P234, $P233, " (from "
    find_lex $P235, "$class_name"
    concat $P236, $P234, $P235
    concat $P237, $P236, "): "
    find_lex $P238, "$!"
    concat $P239, $P237, $P238
    $P240 = "say"($P239)
# .annotate "line", 175
    .return ($P240)
.end


.namespace ["P6object"]
.sub "get_bool"  :subid("29_1267109911.91347") :method :outer("11_1267109911.91347")
# .annotate "line", 192
    new $P258, 'ExceptionHandler'
    set_addr $P258, control_257
    $P258."handle_types"(58)
    push_eh $P258
    .lex "self", self
    .return (1)
  control_257:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P259, exception, "payload"
    .return ($P259)
.end


.namespace ["P6object"]
.sub "get_string"  :subid("30_1267109911.91347") :method :outer("11_1267109911.91347")
# .annotate "line", 196
    new $P262, 'ExceptionHandler'
    set_addr $P262, control_261
    $P262."handle_types"(58)
    push_eh $P262
    .lex "self", self
# .annotate "line", 198
    get_hll_global $P263, ["Class"], "name_of"
    find_lex $P264, "self"
    $P265 = $P263($P264)
    concat $P266, $P265, " @"
    find_lex $P267, "self"
    $S268 = $P267."WHERE"()
    concat $P269, $P266, $S268
# .annotate "line", 196
    .return ($P269)
  control_261:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P270, exception, "payload"
    .return ($P270)
.end


.namespace ["P6object"]
.sub "_init_"  :subid("31_1267109911.91347") :method :outer("11_1267109911.91347")
    .param pmc param_274
    .param pmc param_275
# .annotate "line", 201
    new $P273, 'ExceptionHandler'
    set_addr $P273, control_272
    $P273."handle_types"(58)
    push_eh $P273
    .lex "self", self
    .lex "@pos", param_274
    .lex "%named", param_275
# .annotate "line", 206
    find_lex $P276, "self"
    find_lex $P277, "@pos"
    find_lex $P278, "%named"
    $P279 = $P276."_init_args_"($P277, $P278)
# .annotate "line", 201
    .return ($P279)
  control_272:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P280, exception, "payload"
    .return ($P280)
.end


.namespace ["P6object"]
.sub "_init_args_"  :subid("32_1267109911.91347") :method :outer("11_1267109911.91347")
    .param pmc param_284
    .param pmc param_285
# .annotate "line", 209
    new $P283, 'ExceptionHandler'
    set_addr $P283, control_282
    $P283."handle_types"(58)
    push_eh $P283
    .lex "self", self
    .lex "@pos", param_284
    .lex "%named", param_285
# .annotate "line", 210
    find_lex $P286, "self"
    find_lex $P287, "%named"
    $P286."_init_named_"($P287)
# .annotate "line", 211
    find_lex $P288, "self"
    find_lex $P289, "@pos"
    $P290 = $P288."_init_positional_"($P289)
# .annotate "line", 209
    .return ($P290)
  control_282:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P291, exception, "payload"
    .return ($P291)
.end


.namespace ["P6object"]
.sub "_init_named_"  :subid("33_1267109911.91347") :method :outer("11_1267109911.91347")
    .param pmc param_295
# .annotate "line", 214
    .const 'Sub' $P301 = "34_1267109911.91347" 
    capture_lex $P301
    new $P294, 'ExceptionHandler'
    set_addr $P294, control_293
    $P294."handle_types"(58)
    push_eh $P294
    .lex "self", self
    .lex "%named", param_295
# .annotate "line", 215
    find_lex $P297, "%named"
    defined $I298, $P297
    unless $I298, for_undef_43
    iter $P296, $P297
    new $P325, 'ExceptionHandler'
    set_addr $P325, loop324_handler
    $P325."handle_types"(65, 67, 66)
    push_eh $P325
  loop324_test:
    unless $P296, loop324_done
    shift $P299, $P296
  loop324_redo:
    .const 'Sub' $P301 = "34_1267109911.91347" 
    capture_lex $P301
    $P301($P299)
  loop324_next:
    goto loop324_test
  loop324_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P326, exception, 'type'
    eq $P326, 65, loop324_next
    eq $P326, 67, loop324_redo
  loop324_done:
    pop_eh 
  for_undef_43:
# .annotate "line", 214
    .return ($P296)
  control_293:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P327, exception, "payload"
    .return ($P327)
.end


.namespace ["P6object"]
.sub "_block300"  :anon :subid("34_1267109911.91347") :outer("33_1267109911.91347")
    .param pmc param_303
# .annotate "line", 216
    new $P302, "Undef"
    .lex "$name", $P302
    .lex "$_", param_303
    find_lex $P304, "$_"
    set $S305, $P304
    new $P306, 'String'
    set $P306, $S305
    store_lex "$name", $P306
# .annotate "line", 218
    get_hll_global $P309, ["Opcode"], "can"
    find_lex $P310, "self"
    find_lex $P311, "$name"
    $P312 = $P309($P310, $P311)
    if $P312, if_308
# .annotate "line", 222
    new $P320, 'String'
    set $P320, "Accessor not found for attribute '"
    find_lex $P321, "$name"
    concat $P322, $P320, $P321
    concat $P323, $P322, "'."
    die $P323
# .annotate "line", 221
    goto if_308_end
  if_308:
# .annotate "line", 219
    get_hll_global $P313, ["Parrot"], "call_method"
    find_lex $P314, "self"
    find_lex $P315, "$name"
    find_lex $P316, "$name"
    find_lex $P317, "%named"
    unless_null $P317, vivify_44
    new $P317, "Hash"
  vivify_44:
    set $P318, $P317[$P316]
    unless_null $P318, vivify_45
    new $P318, "Undef"
  vivify_45:
    $P319 = $P313($P314, $P315, $P318)
# .annotate "line", 218
    set $P307, $P319
  if_308_end:
# .annotate "line", 215
    .return ($P307)
.end


.namespace ["P6object"]
.sub "_init_positional_"  :subid("35_1267109911.91347") :method :outer("11_1267109911.91347")
    .param pmc param_331
# .annotate "line", 227
    new $P330, 'ExceptionHandler'
    set_addr $P330, control_329
    $P330."handle_types"(58)
    push_eh $P330
    .lex "self", self
    .lex "@pos", param_331
# .annotate "line", 228
    find_lex $P334, "@pos"
    set $N335, $P334
    if $N335, if_333
    new $P332, 'Float'
    set $P332, $N335
    goto if_333_end
  if_333:
# .annotate "line", 229
    get_hll_global $P336, ["Program"], "die"
    $P337 = $P336("Don't know what to do with positional parameters. Define your own 'init_' method to handle them.")
# .annotate "line", 228
    set $P332, $P337
  if_333_end:
# .annotate "line", 227
    .return ($P332)
  control_329:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P338, exception, "payload"
    .return ($P338)
.end


.namespace ["P6object"]
.sub "isa"  :subid("36_1267109911.91347") :method :outer("11_1267109911.91347")
    .param pmc param_342
# .annotate "line", 233
    new $P341, 'ExceptionHandler'
    set_addr $P341, control_340
    $P341."handle_types"(58)
    push_eh $P341
    .lex "self", self
    .lex "$type", param_342
# .annotate "line", 234
    new $P343, "Exception"
    set $P343['type'], 58
    find_lex $P344, "self"
    $P345 = $P344."HOW"()
    find_lex $P346, "self"
    find_lex $P347, "$type"
    $P348 = $P345."isa"($P346, $P347)
    setattribute $P343, 'payload', $P348
    throw $P343
# .annotate "line", 233
    .return ()
  control_340:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P349, exception, "payload"
    .return ($P349)
.end


.namespace ["P6object"]
.sub "new"  :subid("37_1267109911.91347") :method :outer("11_1267109911.91347")
    .param pmc param_353 :slurpy
    .param pmc param_354 :slurpy :named
# .annotate "line", 237
    new $P352, 'ExceptionHandler'
    set_addr $P352, control_351
    $P352."handle_types"(58)
    push_eh $P352
    .lex "self", self
    .lex "@pos", param_353
    .lex "%named", param_354
# .annotate "line", 238
    find_lex $P355, "self"
    find_lex $P356, "@pos"
    find_lex $P357, "%named"
    $P358 = $P355."new_"($P356, $P357)
# .annotate "line", 237
    .return ($P358)
  control_351:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P359, exception, "payload"
    .return ($P359)
.end


.namespace ["P6object"]
.sub "new_"  :subid("38_1267109911.91347") :method :outer("11_1267109911.91347")
    .param pmc param_363
    .param pmc param_364
# .annotate "line", 241
    new $P362, 'ExceptionHandler'
    set_addr $P362, control_361
    $P362."handle_types"(58)
    push_eh $P362
    .lex "self", self
    .lex "@pos", param_363
    .lex "%named", param_364
# .annotate "line", 242
    new $P365, "Undef"
    .lex "$class", $P365
# .annotate "line", 243
    new $P366, "Undef"
    .lex "$new_object", $P366
# .annotate "line", 242
    get_hll_global $P367, ["Opcode"], "getattribute"
    find_lex $P368, "self"
    $P369 = $P368."HOW"()
    $P370 = $P367($P369, "parrotclass")
    store_lex "$class", $P370
# .annotate "line", 243
    find_lex $P371, "$class"
    new $P372, $P371
    store_lex "$new_object", $P372
# .annotate "line", 245
    find_lex $P373, "$new_object"
    find_lex $P374, "@pos"
    find_lex $P375, "%named"
    $P373."_init_"($P374, $P375)
    find_lex $P376, "$new_object"
# .annotate "line", 241
    .return ($P376)
  control_361:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P377, exception, "payload"
    .return ($P377)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109885.86308")
# .annotate "line", 0
    get_hll_global $P14, ["P6metaclass"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["P6metaclass"], "_block13" 
    capture_lex $P14
    $P566 = $P14()
# .annotate "line", 1
    .return ($P566)
.end


.namespace ["P6metaclass"]
.sub "_block13"  :subid("11_1267109885.86308") :outer("10_1267109885.86308")
# .annotate "line", 7
    .const 'Sub' $P456 = "29_1267109885.86308" 
    capture_lex $P456
    .const 'Sub' $P413 = "28_1267109885.86308" 
    capture_lex $P413
    .const 'Sub' $P374 = "26_1267109885.86308" 
    capture_lex $P374
    .const 'Sub' $P343 = "24_1267109885.86308" 
    capture_lex $P343
    .const 'Sub' $P334 = "23_1267109885.86308" 
    capture_lex $P334
    .const 'Sub' $P304 = "22_1267109885.86308" 
    capture_lex $P304
    .const 'Sub' $P189 = "19_1267109885.86308" 
    capture_lex $P189
    .const 'Sub' $P140 = "16_1267109885.86308" 
    capture_lex $P140
    .const 'Sub' $P106 = "15_1267109885.86308" 
    capture_lex $P106
    .const 'Sub' $P95 = "14_1267109885.86308" 
    capture_lex $P95
    .const 'Sub' $P53 = "13_1267109885.86308" 
    capture_lex $P53
    .const 'Sub' $P15 = "12_1267109885.86308" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1267109885.86308" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 66
    .const 'Sub' $P53 = "13_1267109885.86308" 
    capture_lex $P53
    .lex "declare", $P53
# .annotate "line", 107
    .const 'Sub' $P95 = "14_1267109885.86308" 
    capture_lex $P95
    .lex "dump_class", $P95
# .annotate "line", 112
    .const 'Sub' $P106 = "15_1267109885.86308" 
    capture_lex $P106
    .lex "extends", $P106
# .annotate "line", 124
    .const 'Sub' $P140 = "16_1267109885.86308" 
    capture_lex $P140
    .lex "_flatten_name_list", $P140
# .annotate "line", 144
    .const 'Sub' $P189 = "19_1267109885.86308" 
    capture_lex $P189
    .lex "has", $P189
# .annotate "line", 198
    .const 'Sub' $P304 = "22_1267109885.86308" 
    capture_lex $P304
    .lex "has_vtable", $P304
# .annotate "line", 252
    .const 'Sub' $P334 = "23_1267109885.86308" 
    capture_lex $P334
    .lex "register_pmc_type", $P334
# .annotate "line", 7
    find_lex $P342, "_pre_initload"
# .annotate "line", 45
    find_lex $P412, "declare"
# .annotate "line", 85
    find_lex $P451, "dump_class"
    find_lex $P452, "extends"
    find_lex $P453, "_flatten_name_list"
    find_lex $P454, "has"
    find_lex $P455, "has_vtable"
# .annotate "line", 210
    find_lex $P565, "register_pmc_type"
# .annotate "line", 7
    .return ($P565)
.end


.namespace ["P6metaclass"]
.sub "_pre_initload"  :subid("12_1267109885.86308") :outer("11_1267109885.86308")
# .annotate "line", 7
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 11
    get_global $P18, "%default_type"
    unless_null $P18, vivify_30
    new $P18, "Hash"
    set_global "%default_type", $P18
  vivify_30:
# .annotate "line", 12
    get_global $P19, "%is_sigil"
    unless_null $P19, vivify_31
    new $P19, "Hash"
    set_global "%is_sigil", $P19
  vivify_31:
# .annotate "line", 13
    get_global $P20, "%is_twigil"
    unless_null $P20, vivify_32
    new $P20, "Hash"
    set_global "%is_twigil", $P20
  vivify_32:
# .annotate "line", 9
    get_hll_global $P21, "Parrot"
    "use"($P21, "NAMESPACE" :named("tags"))
    get_global $P22, "%default_type"
    get_global $P23, "%is_sigil"
    get_global $P24, "%is_twigil"
# .annotate "line", 15
    new $P25, "String"
    assign $P25, "ResizablePMCArray"
    get_global $P26, "%default_type"
    unless_null $P26, vivify_33
    new $P26, "Hash"
    set_global "%default_type", $P26
  vivify_33:
    set $P26["@"], $P25
# .annotate "line", 16
    new $P27, "String"
    assign $P27, "Undef"
    get_global $P28, "%default_type"
    unless_null $P28, vivify_34
    new $P28, "Hash"
    set_global "%default_type", $P28
  vivify_34:
    set $P28["$"], $P27
# .annotate "line", 17
    new $P29, "String"
    assign $P29, "Hash"
    get_global $P30, "%default_type"
    unless_null $P30, vivify_35
    new $P30, "Hash"
    set_global "%default_type", $P30
  vivify_35:
    set $P30["%"], $P29
# .annotate "line", 18
    new $P31, "String"
    assign $P31, "Undef"
    get_global $P32, "%default_type"
    unless_null $P32, vivify_36
    new $P32, "Hash"
    set_global "%default_type", $P32
  vivify_36:
    set $P32["&"], $P31
# .annotate "line", 20
    new $P33, "Integer"
    assign $P33, 1
    get_global $P34, "%is_sigil"
    unless_null $P34, vivify_37
    new $P34, "Hash"
    set_global "%is_sigil", $P34
  vivify_37:
    set $P34["@"], $P33
# .annotate "line", 21
    new $P35, "Integer"
    assign $P35, 1
    get_global $P36, "%is_sigil"
    unless_null $P36, vivify_38
    new $P36, "Hash"
    set_global "%is_sigil", $P36
  vivify_38:
    set $P36["$"], $P35
# .annotate "line", 22
    new $P37, "Integer"
    assign $P37, 1
    get_global $P38, "%is_sigil"
    unless_null $P38, vivify_39
    new $P38, "Hash"
    set_global "%is_sigil", $P38
  vivify_39:
    set $P38["%"], $P37
# .annotate "line", 23
    new $P39, "Integer"
    assign $P39, 1
    get_global $P40, "%is_sigil"
    unless_null $P40, vivify_40
    new $P40, "Hash"
    set_global "%is_sigil", $P40
  vivify_40:
    set $P40["&"], $P39
# .annotate "line", 25
    new $P41, "Integer"
    assign $P41, 1
    get_global $P42, "%is_twigil"
    unless_null $P42, vivify_41
    new $P42, "Hash"
    set_global "%is_twigil", $P42
  vivify_41:
    set $P42["!"], $P41
# .annotate "line", 26
    new $P43, "Integer"
    assign $P43, 1
    get_global $P44, "%is_twigil"
    unless_null $P44, vivify_42
    new $P44, "Hash"
    set_global "%is_twigil", $P44
  vivify_42:
    set $P44["."], $P43
# .annotate "line", 29
    get_hll_global $P45, ["Global"], "inject_root_symbol"
    get_hll_global $P46, ["P6metaclass"], "extends"
    $P45($P46)
# .annotate "line", 30
    get_hll_global $P47, ["Global"], "inject_root_symbol"
    get_hll_global $P48, ["P6metaclass"], "has"
    $P47($P48)
# .annotate "line", 31
    get_hll_global $P49, ["Global"], "inject_root_symbol"
    get_hll_global $P50, ["P6metaclass"], "has_vtable"
    $P51 = $P49($P50)
# .annotate "line", 7
    .return ($P51)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P52, exception, "payload"
    .return ($P52)
.end


.namespace ["P6metaclass"]
.sub "declare"  :subid("13_1267109885.86308") :outer("11_1267109885.86308")
    .param pmc param_56 :optional
    .param int has_param_56 :opt_flag
    .param pmc param_58 :optional :named("has")
    .param int has_param_58 :opt_flag
    .param pmc param_60 :optional :named("is")
    .param int has_param_60 :opt_flag
# .annotate "line", 66
    new $P55, 'ExceptionHandler'
    set_addr $P55, control_54
    $P55."handle_types"(58)
    push_eh $P55
    if has_param_56, optparam_43
    new $P57, "Undef"
    set param_56, $P57
  optparam_43:
    .lex "$class", param_56
    if has_param_58, optparam_44
    new $P59, "ResizablePMCArray"
    set param_58, $P59
  optparam_44:
    .lex "@has", param_58
    if has_param_60, optparam_45
    new $P61, "ResizablePMCArray"
    set param_60, $P61
  optparam_45:
    .lex "@is", param_60
# .annotate "line", 73
    new $P62, "Undef"
    .lex "$parent", $P62
# .annotate "line", 79
    new $P63, "Undef"
    .lex "$parrotclass", $P63
# .annotate "line", 67
    get_hll_global $P65, ["Opcode"], "does"
    find_lex $P66, "@is"
    $P67 = $P65($P66, "array")
    isfalse $I68, $P67
    unless $I68, if_64_end
    get_hll_global $P69, ["Array"], "new"
    find_lex $P70, "@is"
    $P71 = $P69($P70)
    store_lex "@is", $P71
  if_64_end:
# .annotate "line", 69
    get_hll_global $P73, ["Opcode"], "defined"
    find_lex $P74, "$class"
    $P75 = $P73($P74)
    if $P75, unless_72_end
# .annotate "line", 70
    $P76 = "caller_namespace"(2)
    store_lex "$class", $P76
  unless_72_end:
# .annotate "line", 69
    find_lex $P77, "$parent"
# .annotate "line", 75
    find_lex $P79, "@is"
    set $N80, $P79
    unless $N80, if_78_end
# .annotate "line", 76
    find_lex $P81, "@is"
    $P82 = $P81."shift"()
    store_lex "$parent", $P82
  if_78_end:
# .annotate "line", 79
    get_hll_global $P83, "P6metaclass"
    find_lex $P84, "$class"
    find_lex $P85, "$parent"
    $P86 = $P83."declare_class"($P84, $P85)
    store_lex "$parrotclass", $P86
# .annotate "line", 81
    get_hll_global $P87, "P6metaclass"
    find_lex $P88, "$parrotclass"
    find_lex $P89, "@is"
    $P87."_add_parents"($P88, $P89)
# .annotate "line", 82
    get_hll_global $P90, "P6metaclass"
    find_lex $P91, "$parrotclass"
    find_lex $P92, "@has"
    $P93 = $P90."_add_attributes"($P91, $P92)
# .annotate "line", 66
    .return ($P93)
  control_54:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P94, exception, "payload"
    .return ($P94)
.end


.namespace ["P6metaclass"]
.sub "dump_class"  :subid("14_1267109885.86308") :outer("11_1267109885.86308")
    .param pmc param_98
# .annotate "line", 107
    new $P97, 'ExceptionHandler'
    set_addr $P97, control_96
    $P97."handle_types"(58)
    push_eh $P97
    .lex "$class", param_98
# .annotate "line", 108
    get_hll_global $P99, "P6metaclass"
    find_lex $P100, "$class"
    $P101 = $P99."get_parrotclass"($P100)
    find_lex $P102, "$class"
    set $S103, $P102
    $P104 = "_dumper"($P101, $S103)
# .annotate "line", 107
    .return ($P104)
  control_96:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["P6metaclass"]
.sub "extends"  :subid("15_1267109885.86308") :outer("11_1267109885.86308")
    .param pmc param_109
    .param pmc param_110 :slurpy
    .param pmc param_111 :optional :named("class")
    .param int has_param_111 :opt_flag
# .annotate "line", 112
    new $P108, 'ExceptionHandler'
    set_addr $P108, control_107
    $P108."handle_types"(58)
    push_eh $P108
    .lex "$first", param_109
    .lex "@args", param_110
    if has_param_111, optparam_46
    new $P112, "Undef"
    set param_111, $P112
  optparam_46:
    .lex "$class", param_111
# .annotate "line", 113
    find_lex $P114, "@args"
    $P115 = $P114."defined"()
    isfalse $I116, $P115
    if $I116, if_113
# .annotate "line", 114
    get_hll_global $P121, ["Opcode"], "does"
    find_lex $P122, "@args"
    $P123 = $P121($P122, "array")
    isfalse $I124, $P123
    if $I124, if_120
# .annotate "line", 115
    find_lex $P129, "@args"
    find_lex $P130, "$first"
    $P129."unshift"($P130)
    goto if_120_end
  if_120:
# .annotate "line", 114
    get_hll_global $P125, ["Array"], "new"
    find_lex $P126, "$first"
    find_lex $P127, "@args"
    $P128 = $P125($P126, $P127)
    store_lex "@args", $P128
  if_120_end:
    goto if_113_end
  if_113:
# .annotate "line", 113
    get_hll_global $P117, ["Array"], "new"
    find_lex $P118, "$first"
    $P119 = $P117($P118)
    store_lex "@args", $P119
  if_113_end:
# .annotate "line", 117
    find_lex $P132, "$class"
    $P133 = $P132."defined"()
    if $P133, unless_131_end
# .annotate "line", 118
    $P134 = "caller_namespace"(2)
    store_lex "$class", $P134
  unless_131_end:
# .annotate "line", 121
    get_hll_global $P135, "P6metaclass"
    find_lex $P136, "$class"
    find_lex $P137, "@args"
    $P138 = $P135."_add_parents"($P136, $P137)
# .annotate "line", 112
    .return ($P138)
  control_107:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P139, exception, "payload"
    .return ($P139)
.end


.namespace ["P6metaclass"]
.sub "_flatten_name_list"  :subid("16_1267109885.86308") :outer("11_1267109885.86308")
    .param pmc param_143
# .annotate "line", 124
    .const 'Sub' $P152 = "17_1267109885.86308" 
    capture_lex $P152
    new $P142, 'ExceptionHandler'
    set_addr $P142, control_141
    $P142."handle_types"(58)
    push_eh $P142
    .lex "@list", param_143
# .annotate "line", 125
    new $P144, "ResizablePMCArray"
    .lex "@merged", $P144
    get_hll_global $P145, ["Array"], "new"
    $P146 = $P145()
    store_lex "@merged", $P146
# .annotate "line", 127
    find_lex $P148, "@list"
    defined $I149, $P148
    unless $I149, for_undef_47
    iter $P147, $P148
    new $P184, 'ExceptionHandler'
    set_addr $P184, loop183_handler
    $P184."handle_types"(65, 67, 66)
    push_eh $P184
  loop183_test:
    unless $P147, loop183_done
    shift $P150, $P147
  loop183_redo:
    .const 'Sub' $P152 = "17_1267109885.86308" 
    capture_lex $P152
    $P152($P150)
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
  for_undef_47:
# .annotate "line", 141
    new $P186, "Exception"
    set $P186['type'], 58
    find_lex $P187, "@merged"
    setattribute $P186, 'payload', $P187
    throw $P186
# .annotate "line", 124
    .return ()
  control_141:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P188, exception, "payload"
    .return ($P188)
.end


.namespace ["P6metaclass"]
.sub "_block151"  :anon :subid("17_1267109885.86308") :outer("16_1267109885.86308")
    .param pmc param_153
# .annotate "line", 127
    .const 'Sub' $P172 = "18_1267109885.86308" 
    capture_lex $P172
    .lex "$_", param_153
# .annotate "line", 128
    get_hll_global $P156, ["Opcode"], "does"
    find_lex $P157, "$_"
    $P158 = $P156($P157, "array")
    if $P158, if_155
# .annotate "line", 131
    find_lex $P164, "$_"
    $P165 = $P164."isa"("String")
    if $P165, if_163
# .annotate "line", 137
    find_lex $P180, "@merged"
    find_lex $P181, "$_"
    $P182 = $P180."push"($P181)
# .annotate "line", 136
    set $P162, $P182
# .annotate "line", 131
    goto if_163_end
  if_163:
# .annotate "line", 132
    find_lex $P167, "$_"
    $P168 = $P167."split"(" ")
    defined $I169, $P168
    unless $I169, for_undef_48
    iter $P166, $P168
    new $P178, 'ExceptionHandler'
    set_addr $P178, loop177_handler
    $P178."handle_types"(65, 67, 66)
    push_eh $P178
  loop177_test:
    unless $P166, loop177_done
    shift $P170, $P166
  loop177_redo:
    .const 'Sub' $P172 = "18_1267109885.86308" 
    capture_lex $P172
    $P172($P170)
  loop177_next:
    goto loop177_test
  loop177_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P179, exception, 'type'
    eq $P179, 65, loop177_next
    eq $P179, 67, loop177_redo
  loop177_done:
    pop_eh 
  for_undef_48:
# .annotate "line", 131
    set $P162, $P166
  if_163_end:
    set $P154, $P162
# .annotate "line", 128
    goto if_155_end
  if_155:
# .annotate "line", 129
    find_lex $P159, "@merged"
    find_lex $P160, "$_"
    $P161 = $P159."append"($P160)
# .annotate "line", 128
    set $P154, $P161
  if_155_end:
# .annotate "line", 127
    .return ($P154)
.end


.namespace ["P6metaclass"]
.sub "_block171"  :anon :subid("18_1267109885.86308") :outer("17_1267109885.86308")
    .param pmc param_173
# .annotate "line", 132
    .lex "$_", param_173
# .annotate "line", 133
    find_lex $P174, "@merged"
    find_lex $P175, "$_"
    $P176 = $P174."push"($P175)
# .annotate "line", 132
    .return ($P176)
.end


.namespace ["P6metaclass"]
.sub "has"  :subid("19_1267109885.86308") :outer("11_1267109885.86308")
    .param pmc param_192 :slurpy
    .param pmc param_193 :optional :named("class")
    .param int has_param_193 :opt_flag
    .param pmc param_195 :slurpy :named
# .annotate "line", 144
    .const 'Sub' $P225 = "20_1267109885.86308" 
    capture_lex $P225
    new $P191, 'ExceptionHandler'
    set_addr $P191, control_190
    $P191."handle_types"(58)
    push_eh $P191
    .lex "@args", param_192
    if has_param_193, optparam_49
    new $P194, "Undef"
    set param_193, $P194
  optparam_49:
    .lex "$class", param_193
    .lex "%opts", param_195
# .annotate "line", 147
    get_global $P196, "%default_type"
    unless_null $P196, vivify_50
    new $P196, "Hash"
    set_global "%default_type", $P196
  vivify_50:
# .annotate "line", 148
    get_global $P197, "%is_sigil"
    unless_null $P197, vivify_51
    new $P197, "Hash"
    set_global "%is_sigil", $P197
  vivify_51:
# .annotate "line", 149
    get_global $P198, "%is_twigil"
    unless_null $P198, vivify_52
    new $P198, "Hash"
    set_global "%is_twigil", $P198
  vivify_52:
# .annotate "line", 144
    get_global $P199, "%default_type"
    get_global $P200, "%is_sigil"
    get_global $P201, "%is_twigil"
# .annotate "line", 151
    find_lex $P203, "%opts"
    $P204 = $P203."defined"()
    if $P204, unless_202_end
    get_hll_global $P205, ["Hash"], "empty"
    $P206 = $P205()
    store_lex "%opts", $P206
  unless_202_end:
# .annotate "line", 152
    find_lex $P208, "$class"
    $P209 = $P208."defined"()
    if $P209, unless_207_end
    $P210 = "caller_namespace"(2)
    store_lex "$class", $P210
  unless_207_end:
# .annotate "line", 155
    find_lex $P214, "@args"
    set $N215, $P214
    iseq $I216, $N215, 1.0
    if $I216, if_213
    new $P212, 'Integer'
    set $P212, $I216
    goto if_213_end
  if_213:
    find_lex $P217, "@args"
    unless_null $P217, vivify_53
    new $P217, "ResizablePMCArray"
  vivify_53:
    set $P218, $P217[0]
    unless_null $P218, vivify_54
    new $P218, "Undef"
  vivify_54:
    $P219 = $P218."isa"("String")
    isfalse $I220, $P219
    new $P212, 'Integer'
    set $P212, $I220
  if_213_end:
    unless $P212, if_211_end
# .annotate "line", 156
    find_lex $P221, "@args"
    unless_null $P221, vivify_55
    new $P221, "ResizablePMCArray"
  vivify_55:
    set $P222, $P221[0]
    unless_null $P222, vivify_56
    new $P222, "Undef"
  vivify_56:
    store_lex "@args", $P222
  if_211_end:
# .annotate "line", 159
    new $P297, 'ExceptionHandler'
    set_addr $P297, loop296_handler
    $P297."handle_types"(65, 67, 66)
    push_eh $P297
  loop296_test:
    find_lex $P223, "@args"
    unless $P223, loop296_done
  loop296_redo:
    .const 'Sub' $P225 = "20_1267109885.86308" 
    capture_lex $P225
    $P225()
  loop296_next:
    goto loop296_test
  loop296_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P298, exception, 'type'
    eq $P298, 65, loop296_next
    eq $P298, 67, loop296_redo
  loop296_done:
    pop_eh 
# .annotate "line", 195
    get_hll_global $P299, "P6metaclass"
    find_lex $P300, "$class"
    find_lex $P301, "%opts"
    $P302 = $P299."_add_attributes"($P300, $P301)
# .annotate "line", 144
    .return ($P302)
  control_190:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P303, exception, "payload"
    .return ($P303)
.end


.namespace ["P6metaclass"]
.sub "_block224"  :anon :subid("20_1267109885.86308") :outer("19_1267109885.86308")
# .annotate "line", 159
    .const 'Sub' $P237 = "21_1267109885.86308" 
    capture_lex $P237
# .annotate "line", 160
    new $P226, "Undef"
    .lex "$next", $P226
# .annotate "line", 161
    new $P227, "ResizablePMCArray"
    .lex "@words", $P227
# .annotate "line", 160
    find_lex $P228, "@args"
    $P229 = $P228."shift"()
    store_lex "$next", $P229
# .annotate "line", 161
    find_lex $P230, "$next"
    $P231 = $P230."split"(" ")
    store_lex "@words", $P231
# .annotate "line", 163
    find_lex $P233, "@words"
    defined $I234, $P233
    unless $I234, for_undef_57
    iter $P232, $P233
    new $P294, 'ExceptionHandler'
    set_addr $P294, loop293_handler
    $P294."handle_types"(65, 67, 66)
    push_eh $P294
  loop293_test:
    unless $P232, loop293_done
    shift $P235, $P232
  loop293_redo:
    .const 'Sub' $P237 = "21_1267109885.86308" 
    capture_lex $P237
    $P237($P235)
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
  for_undef_57:
# .annotate "line", 159
    .return ($P232)
.end


.namespace ["P6metaclass"]
.sub "_block236"  :anon :subid("21_1267109885.86308") :outer("20_1267109885.86308")
    .param pmc param_242
# .annotate "line", 165
    new $P238, "Undef"
    .lex "$attr", $P238
# .annotate "line", 166
    new $P239, "Undef"
    .lex "$twigil", $P239
# .annotate "line", 167
    new $P240, "Undef"
    .lex "$sigil", $P240
# .annotate "line", 180
    new $P241, "Undef"
    .lex "$base_name", $P241
    .lex "$_", param_242
# .annotate "line", 165
    find_lex $P243, "$_"
    set $S244, $P243
    new $P245, 'String'
    set $P245, $S244
    store_lex "$attr", $P245
# .annotate "line", 166
    new $P246, "String"
    assign $P246, "!"
    store_lex "$twigil", $P246
# .annotate "line", 167
    find_lex $P247, "$attr"
    unless_null $P247, vivify_58
    new $P247, "ResizablePMCArray"
  vivify_58:
    set $P248, $P247[0]
    unless_null $P248, vivify_59
    new $P248, "Undef"
  vivify_59:
    store_lex "$sigil", $P248
# .annotate "line", 169
    find_lex $P250, "$sigil"
    get_global $P251, "%is_sigil"
    unless_null $P251, vivify_60
    new $P251, "Hash"
  vivify_60:
    set $P252, $P251[$P250]
    unless_null $P252, vivify_61
    new $P252, "Undef"
  vivify_61:
    if $P252, if_249
# .annotate "line", 173
    new $P255, "String"
    assign $P255, "$"
    store_lex "$sigil", $P255
# .annotate "line", 172
    goto if_249_end
  if_249:
# .annotate "line", 170
    find_lex $P253, "$attr"
    $P254 = $P253."substr"(1)
    store_lex "$attr", $P254
  if_249_end:
# .annotate "line", 176
    find_lex $P257, "$attr"
    unless_null $P257, vivify_62
    new $P257, "ResizablePMCArray"
  vivify_62:
    set $P258, $P257[0]
    unless_null $P258, vivify_63
    new $P258, "Undef"
  vivify_63:
    get_global $P259, "%is_twigil"
    unless_null $P259, vivify_64
    new $P259, "Hash"
  vivify_64:
    set $P260, $P259[$P258]
    unless_null $P260, vivify_65
    new $P260, "Undef"
  vivify_65:
    if $P260, unless_256_end
# .annotate "line", 177
    new $P261, "String"
    assign $P261, "!"
    find_lex $P262, "$attr"
    concat $P263, $P261, $P262
    store_lex "$attr", $P263
  unless_256_end:
# .annotate "line", 180
    find_lex $P264, "$attr"
    $P265 = $P264."substr"(1)
    store_lex "$base_name", $P265
# .annotate "line", 182
    find_lex $P267, "%opts"
    find_lex $P268, "$base_name"
    $P269 = $P267."contains"($P268)
    unless $P269, if_266_end
# .annotate "line", 183
    new $P270, 'String'
    set $P270, "Re-declaration of attribute '"
    find_lex $P271, "$base_name"
    concat $P272, $P270, $P271
    concat $P273, $P272, "'"
    "die"($P273)
  if_266_end:
# .annotate "line", 186
    get_hll_global $P274, "Hash"
    find_lex $P275, "$base_name"
    find_lex $P276, "$sigil"
    get_global $P277, "%default_type"
    unless_null $P277, vivify_66
    new $P277, "Hash"
  vivify_66:
    set $P278, $P277[$P276]
    unless_null $P278, vivify_67
    new $P278, "Undef"
  vivify_67:
# .annotate "line", 189
    find_lex $P281, "$attr"
    unless_null $P281, vivify_68
    new $P281, "ResizablePMCArray"
  vivify_68:
    set $P282, $P281[0]
    unless_null $P282, vivify_69
    new $P282, "Undef"
  vivify_69:
    set $S283, $P282
    iseq $I284, $S283, "!"
    if $I284, if_280
    new $P286, "Integer"
    assign $P286, 0
    set $P279, $P286
    goto if_280_end
  if_280:
    new $P285, "Integer"
    assign $P285, 1
    set $P279, $P285
  if_280_end:
# .annotate "line", 190
    find_lex $P287, "$sigil"
    find_lex $P288, "$attr"
    concat $P289, $P287, $P288
    $P290 = $P274."new"($P275 :named("accessor"), $P278 :named("default_type"), $P279 :named("is_private"), $P289 :named("name"))
# .annotate "line", 186
    find_lex $P291, "$base_name"
    find_lex $P292, "%opts"
    unless_null $P292, vivify_70
    new $P292, "Hash"
    store_lex "%opts", $P292
  vivify_70:
    set $P292[$P291], $P290
# .annotate "line", 163
    .return ($P290)
.end


.namespace ["P6metaclass"]
.sub "has_vtable"  :subid("22_1267109885.86308") :outer("11_1267109885.86308")
    .param pmc param_307
    .param pmc param_308
    .param pmc param_309 :optional :named("class")
    .param int has_param_309 :opt_flag
# .annotate "line", 198
    new $P306, 'ExceptionHandler'
    set_addr $P306, control_305
    $P306."handle_types"(58)
    push_eh $P306
    .lex "$name", param_307
    .lex "&code", param_308
    if has_param_309, optparam_71
    new $P310, "Undef"
    set param_309, $P310
  optparam_71:
    .lex "$class", param_309
# .annotate "line", 199
    new $P311, "Undef"
    .lex "$parrot_class", $P311
    get_hll_global $P312, "P6metaclass"
    find_lex $P315, "$class"
    $P316 = $P315."defined"()
    if $P316, if_314
    $P318 = "caller_namespace"(2)
    set $P313, $P318
    goto if_314_end
  if_314:
    find_lex $P317, "$class"
    set $P313, $P317
  if_314_end:
    $P319 = $P312."get_parrotclass"($P313)
    store_lex "$parrot_class", $P319
# .annotate "line", 201
    find_lex $P321, "$parrot_class"
    $P322 = $P321."defined"()
    if $P322, unless_320_end
# .annotate "line", 202
    find_lex $P323, "$class"
    "die"("Undefined class '", $P323, "'")
  unless_320_end:
# .annotate "line", 205
    find_lex $P324, "$parrot_class"
    find_lex $P325, "$name"
    find_lex $P326, "&code"
    $P324."add_vtable_override"($P325, $P326)
# .annotate "line", 206
    find_lex $P327, "$name"
    find_lex $P328, "$parrot_class"
    "say"("Adding vtable: ", $P327, " to ", $P328)
# .annotate "line", 207
    get_hll_global $P329, ["Opcode"], "inspect_string"
    find_lex $P330, "$parrot_class"
    $P331 = $P329($P330, "vtable_overrides")
    $P332 = "_dumper"($P331)
# .annotate "line", 198
    .return ($P332)
  control_305:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P333, exception, "payload"
    .return ($P333)
.end


.namespace ["P6metaclass"]
.sub "register_pmc_type"  :subid("23_1267109885.86308") :outer("11_1267109885.86308")
    .param pmc param_337
# .annotate "line", 252
    new $P336, 'ExceptionHandler'
    set_addr $P336, control_335
    $P336."handle_types"(58)
    push_eh $P336
    .lex "$type", param_337
# .annotate "line", 253
    get_hll_global $P338, "P6metaclass"
    find_lex $P339, "$type"
    $P340 = $P338."register"($P339)
# .annotate "line", 252
    .return ($P340)
  control_335:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P341, exception, "payload"
    .return ($P341)
.end


.namespace ["P6metaclass"]
.sub "_add_attributes"  :subid("24_1267109885.86308") :method :outer("11_1267109885.86308")
    .param pmc param_346
    .param pmc param_347
# .annotate "line", 34
    .const 'Sub' $P357 = "25_1267109885.86308" 
    capture_lex $P357
    new $P345, 'ExceptionHandler'
    set_addr $P345, control_344
    $P345."handle_types"(58)
    push_eh $P345
    .lex "self", self
    .lex "$class", param_346
    .lex "%attrs", param_347
# .annotate "line", 35
    new $P348, "Undef"
    .lex "$parrotclass", $P348
    find_lex $P349, "self"
    find_lex $P350, "$class"
    $P351 = $P349."declare_class"($P350)
    store_lex "$parrotclass", $P351
# .annotate "line", 37
    find_lex $P353, "%attrs"
    defined $I354, $P353
    unless $I354, for_undef_72
    iter $P352, $P353
    new $P371, 'ExceptionHandler'
    set_addr $P371, loop370_handler
    $P371."handle_types"(65, 67, 66)
    push_eh $P371
  loop370_test:
    unless $P352, loop370_done
    shift $P355, $P352
  loop370_redo:
    .const 'Sub' $P357 = "25_1267109885.86308" 
    capture_lex $P357
    $P357($P355)
  loop370_next:
    goto loop370_test
  loop370_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P372, exception, 'type'
    eq $P372, 65, loop370_next
    eq $P372, 67, loop370_redo
  loop370_done:
    pop_eh 
  for_undef_72:
# .annotate "line", 34
    .return ($P352)
  control_344:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P373, exception, "payload"
    .return ($P373)
.end


.namespace ["P6metaclass"]
.sub "_block356"  :anon :subid("25_1267109885.86308") :outer("24_1267109885.86308")
    .param pmc param_359
# .annotate "line", 38
    new $P358, "Hash"
    .lex "%attr_info", $P358
    .lex "$_", param_359
    find_lex $P360, "$_"
    find_lex $P361, "%attrs"
    unless_null $P361, vivify_73
    new $P361, "Hash"
  vivify_73:
    set $P362, $P361[$P360]
    unless_null $P362, vivify_74
    new $P362, "Undef"
  vivify_74:
    store_lex "%attr_info", $P362
# .annotate "line", 40
    find_lex $P363, "$parrotclass"
    find_lex $P364, "%attr_info"
    unless_null $P364, vivify_75
    new $P364, "Hash"
  vivify_75:
    set $P365, $P364["name"]
    unless_null $P365, vivify_76
    new $P365, "Undef"
  vivify_76:
    $P363."add_attribute"($P365)
# .annotate "line", 41
    find_lex $P366, "self"
    find_lex $P367, "$parrotclass"
    find_lex $P368, "%attr_info"
    $P369 = $P366."_make_accessor"($P367, $P368)
# .annotate "line", 37
    .return ($P369)
.end


.namespace ["P6metaclass"]
.sub "_add_parents"  :subid("26_1267109885.86308") :method :outer("11_1267109885.86308")
    .param pmc param_377
    .param pmc param_378
# .annotate "line", 45
    .const 'Sub' $P402 = "27_1267109885.86308" 
    capture_lex $P402
    new $P376, 'ExceptionHandler'
    set_addr $P376, control_375
    $P376."handle_types"(58)
    push_eh $P376
    .lex "self", self
    .lex "$class", param_377
    .lex "@parents", param_378
# .annotate "line", 58
    new $P379, "Undef"
    .lex "$first", $P379
# .annotate "line", 59
    new $P380, "Undef"
    .lex "$parrotclass", $P380
# .annotate "line", 48
    find_lex $P381, "@parents"
    $P382 = "_flatten_name_list"($P381)
    store_lex "@parents", $P382
# .annotate "line", 50
    find_lex $P384, "@parents"
    set $N385, $P384
    if $N385, unless_383_end
# .annotate "line", 51
    new $P386, "Exception"
    set $P386['type'], 58
    new $P387, "Integer"
    assign $P387, 0
    setattribute $P386, 'payload', $P387
    throw $P386
  unless_383_end:
# .annotate "line", 54
    find_lex $P389, "$class"
    $P390 = $P389."defined"()
    if $P390, unless_388_end
# .annotate "line", 55
    "die"("Cannot add parents to undefined class.")
  unless_388_end:
# .annotate "line", 58
    find_lex $P391, "@parents"
    $P392 = $P391."shift"()
    store_lex "$first", $P392
# .annotate "line", 59
    find_lex $P393, "self"
    find_lex $P394, "$class"
    find_lex $P395, "$first"
    $P396 = $P393."declare_class"($P394, $P395 :named("parent"))
    store_lex "$parrotclass", $P396
# .annotate "line", 61
    find_lex $P398, "@parents"
    defined $I399, $P398
    unless $I399, for_undef_77
    iter $P397, $P398
    new $P409, 'ExceptionHandler'
    set_addr $P409, loop408_handler
    $P409."handle_types"(65, 67, 66)
    push_eh $P409
  loop408_test:
    unless $P397, loop408_done
    shift $P400, $P397
  loop408_redo:
    .const 'Sub' $P402 = "27_1267109885.86308" 
    capture_lex $P402
    $P402($P400)
  loop408_next:
    goto loop408_test
  loop408_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P410, exception, 'type'
    eq $P410, 65, loop408_next
    eq $P410, 67, loop408_redo
  loop408_done:
    pop_eh 
  for_undef_77:
# .annotate "line", 45
    .return ($P397)
  control_375:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P411, exception, "payload"
    .return ($P411)
.end


.namespace ["P6metaclass"]
.sub "_block401"  :anon :subid("27_1267109885.86308") :outer("26_1267109885.86308")
    .param pmc param_403
# .annotate "line", 61
    .lex "$_", param_403
# .annotate "line", 62
    find_lex $P404, "self"
    find_lex $P405, "$parrotclass"
    find_lex $P406, "$_"
    $P407 = $P404."add_parent"($P405, $P406)
# .annotate "line", 61
    .return ($P407)
.end


.namespace ["P6metaclass"]
.sub "declare_class"  :subid("28_1267109885.86308") :method :outer("11_1267109885.86308")
    .param pmc param_416
    .param pmc param_417 :optional :named("parent")
    .param int has_param_417 :opt_flag
# .annotate "line", 85
    new $P415, 'ExceptionHandler'
    set_addr $P415, control_414
    $P415."handle_types"(58)
    push_eh $P415
    .lex "self", self
    .lex "$class", param_416
    if has_param_417, optparam_78
    new $P418, "Undef"
    set param_417, $P418
  optparam_78:
    .lex "$parent", param_417
# .annotate "line", 90
    new $P419, "Undef"
    .lex "$parrotclass", $P419
# .annotate "line", 86
    get_hll_global $P421, ["Opcode"], "defined"
    find_lex $P422, "$class"
    $P423 = $P421($P422)
    if $P423, unless_420_end
# .annotate "line", 87
    "die"("Cannot declare undefined class - give me a string name or a namespace")
  unless_420_end:
# .annotate "line", 90
    find_lex $P424, "self"
    find_lex $P425, "$class"
    $P426 = $P424."get_parrotclass"($P425)
    store_lex "$parrotclass", $P426
# .annotate "line", 93
    get_hll_global $P430, ["Opcode"], "isnull"
    find_lex $P431, "$parrotclass"
    $P432 = $P430($P431)
    isfalse $I433, $P432
    if $I433, if_429
    new $P428, 'Integer'
    set $P428, $I433
    goto if_429_end
  if_429:
    get_hll_global $P434, ["Opcode"], "isa"
    find_lex $P435, "$parrotclass"
    $P436 = $P434($P435, "P6object")
    set $P428, $P436
  if_429_end:
    if $P428, unless_427_end
# .annotate "line", 94
    get_hll_global $P438, ["Opcode"], "defined"
    find_lex $P439, "$parent"
    $P440 = $P438($P439)
    if $P440, if_437
# .annotate "line", 98
    find_lex $P444, "self"
    find_lex $P445, "$class"
    $P444."new_class"($P445)
# .annotate "line", 97
    goto if_437_end
  if_437:
# .annotate "line", 95
    find_lex $P441, "self"
    find_lex $P442, "$class"
    find_lex $P443, "$parent"
    $P441."new_class"($P442, $P443 :named("parent"))
  if_437_end:
# .annotate "line", 101
    find_lex $P446, "self"
    find_lex $P447, "$class"
    $P448 = $P446."get_parrotclass"($P447)
    store_lex "$parrotclass", $P448
  unless_427_end:
# .annotate "line", 93
    find_lex $P449, "$parrotclass"
# .annotate "line", 85
    .return ($P449)
  control_414:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P450, exception, "payload"
    .return ($P450)
.end


.namespace ["P6metaclass"]
.sub "_make_accessor"  :subid("29_1267109885.86308") :method :outer("11_1267109885.86308")
    .param pmc param_459
    .param pmc param_460
# .annotate "line", 210
    new $P458, 'ExceptionHandler'
    set_addr $P458, control_457
    $P458."handle_types"(58)
    push_eh $P458
    .lex "self", self
    .lex "$parrot_class", param_459
    .lex "%info", param_460
# .annotate "line", 211
    new $P461, "Undef"
    .lex "$namespace", $P461
# .annotate "line", 213
    new $P462, "Hash"
    .lex "%accessor_details", $P462
# .annotate "line", 224
    new $P463, "Undef"
    .lex "$attr", $P463
# .annotate "line", 225
    new $P464, "Undef"
    .lex "$debug", $P464
# .annotate "line", 211
    find_lex $P465, "$parrot_class"
    $P466 = $P465."get_namespace"()
    store_lex "$namespace", $P466
# .annotate "line", 213
    get_hll_global $P467, "Hash"
    find_lex $P468, "%info"
    unless_null $P468, vivify_79
    new $P468, "Hash"
  vivify_79:
    set $P469, $P468["accessor"]
    unless_null $P469, vivify_80
    new $P469, "Undef"
  vivify_80:
# .annotate "line", 215
    find_lex $P470, "$parrot_class"
    $P471 = $P470."get_namespace"()
    $P472 = $P467."new"($P469 :named("name"), $P471 :named("namespace"), 1 :named("method"))
# .annotate "line", 213
    store_lex "%accessor_details", $P472
# .annotate "line", 221
    new $P473, "ResizablePMCArray"
    push $P473, ".param pmc value :optional"
    push $P473, ".param int has_value :opt_flag"
    find_lex $P474, "%accessor_details"
    unless_null $P474, vivify_81
    new $P474, "Hash"
    store_lex "%accessor_details", $P474
  vivify_81:
    set $P474["params"], $P473
# .annotate "line", 224
    find_lex $P475, "%info"
    unless_null $P475, vivify_82
    new $P475, "Hash"
  vivify_82:
    set $P476, $P475["name"]
    unless_null $P476, vivify_83
    new $P476, "Undef"
  vivify_83:
    store_lex "$attr", $P476
# .annotate "line", 225
    find_lex $P479, "%info"
    unless_null $P479, vivify_84
    new $P479, "Hash"
  vivify_84:
    set $P480, $P479["debug"]
    unless_null $P480, vivify_85
    new $P480, "Undef"
  vivify_85:
    if $P480, if_478
    new $P482, "String"
    assign $P482, "# "
    set $P477, $P482
    goto if_478_end
  if_478:
    new $P481, "String"
    assign $P481, ""
    set $P477, $P481
  if_478_end:
    store_lex "$debug", $P477
# .annotate "line", 227
    get_hll_global $P483, ["Array"], "new"
# .annotate "line", 228
    new $P484, "String"
    assign $P484, "\t"
    concat $P485, $P484, "if has_value goto set_value"
# .annotate "line", 229
    new $P486, "String"
    assign $P486, "\t"
    find_lex $P487, "$debug"
    concat $P488, $P486, $P487
    new $P489, 'String'
    set $P489, "say \"Fetching attribute '"
    find_lex $P490, "$attr"
    concat $P491, $P489, $P490
    concat $P492, $P491, "'\""
    concat $P493, $P488, $P492
# .annotate "line", 230
    new $P494, "String"
    assign $P494, "\t"
    new $P495, 'String'
    set $P495, "value = getattribute self, '"
    find_lex $P496, "$attr"
    concat $P497, $P495, $P496
    concat $P498, $P497, "'"
    concat $P499, $P494, $P498
# .annotate "line", 231
    new $P500, "String"
    assign $P500, "\t"
    concat $P501, $P500, "unless null value goto have_value"
# .annotate "line", 232
    new $P502, "String"
    assign $P502, "\t"
    find_lex $P503, "$debug"
    concat $P504, $P502, $P503
    concat $P505, $P504, "say \"Creating new PMC type: "
    find_lex $P506, "%info"
    unless_null $P506, vivify_86
    new $P506, "Hash"
  vivify_86:
    set $P507, $P506["default_type"]
    unless_null $P507, vivify_87
    new $P507, "Undef"
  vivify_87:
    concat $P508, $P505, $P507
    concat $P509, $P508, "\""
# .annotate "line", 233
    new $P510, "String"
    assign $P510, "\t"
    concat $P511, $P510, "value = new [ '"
    find_lex $P512, "%info"
    unless_null $P512, vivify_88
    new $P512, "Hash"
  vivify_88:
    set $P513, $P512["default_type"]
    unless_null $P513, vivify_89
    new $P513, "Undef"
  vivify_89:
    concat $P514, $P511, $P513
    concat $P515, $P514, "' ]"
# .annotate "line", 234
    new $P516, "String"
    assign $P516, "\t"
    new $P517, 'String'
    set $P517, "setattribute self, '"
    find_lex $P518, "$attr"
    concat $P519, $P517, $P518
    concat $P520, $P519, "', value"
    concat $P521, $P516, $P520
# .annotate "line", 237
    new $P522, "String"
    assign $P522, "\t"
    find_lex $P523, "$debug"
    concat $P524, $P522, $P523
    concat $P525, $P524, "$P0 = get_hll_global [ \"Dumper\" ], \"DUMP_\""
# .annotate "line", 238
    new $P526, "String"
    assign $P526, "\t"
    find_lex $P527, "$debug"
    concat $P528, $P526, $P527
    concat $P529, $P528, "$P0(value)"
# .annotate "line", 239
    new $P530, "String"
    assign $P530, "\t"
    concat $P531, $P530, ".return (value)"
# .annotate "line", 242
    new $P532, "String"
    assign $P532, "\t"
    find_lex $P533, "$debug"
    concat $P534, $P532, $P533
    new $P535, 'String'
    set $P535, "say \"Setting attribute '"
    find_lex $P536, "$attr"
    concat $P537, $P535, $P536
    concat $P538, $P537, "'\""
    concat $P539, $P534, $P538
# .annotate "line", 243
    new $P540, "String"
    assign $P540, "\t"
    find_lex $P541, "$debug"
    concat $P542, $P540, $P541
    concat $P543, $P542, "$P0 = get_hll_global [ \"Dumper\" ], \"DUMP_\""
# .annotate "line", 244
    new $P544, "String"
    assign $P544, "\t"
    find_lex $P545, "$debug"
    concat $P546, $P544, $P545
    concat $P547, $P546, "$P0(value)"
# .annotate "line", 245
    new $P548, "String"
    assign $P548, "\t"
    new $P549, 'String'
    set $P549, "setattribute self, '"
    find_lex $P550, "$attr"
    concat $P551, $P549, $P550
    concat $P552, $P551, "', value"
    concat $P553, $P548, $P552
# .annotate "line", 246
    new $P554, "String"
    assign $P554, "\t"
    concat $P555, $P554, ".return (self)"
    $P556 = $P483($P485, $P493, $P499, $P501, $P509, $P515, $P521, "have_value:", $P525, $P529, $P531, "set_value:", $P539, $P543, $P547, $P553, $P555)
# .annotate "line", 227
    find_lex $P557, "%accessor_details"
    unless_null $P557, vivify_90
    new $P557, "Hash"
    store_lex "%accessor_details", $P557
  vivify_90:
    set $P557["body"], $P556
# .annotate "line", 249
    get_hll_global $P558, ["Parrot"], "call_sub_"
    get_hll_global $P559, ["Pir"], "compile_sub"
    get_hll_global $P560, ["Array"], "new"
    $P561 = $P560()
    find_lex $P562, "%accessor_details"
    $P563 = $P558($P559, $P561, $P562)
# .annotate "line", 210
    .return ($P563)
  control_457:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P564, exception, "payload"
    .return ($P564)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109933.6438")
# .annotate "line", 0
    get_hll_global $P14, ["Exception";"DependencyQueue";"AlreadyDone"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Exception";"DependencyQueue";"AlreadyDone"], "_block13" 
    capture_lex $P14
    $P259 = $P14()
# .annotate "line", 1
    .return ($P259)
.end


.namespace []
.sub "" :load :init :subid("post28") :outer("10_1267109933.6438")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1267109933.6438" 
    .local pmc block
    set block, $P12
    $P260 = get_root_global ["parrot"], "P6metaclass"
    $P260."new_class"("Exception::DependencyQueue::AlreadyDone", "Exception::Wrapper" :named("parent"))
.end


.namespace ["Exception";"DependencyQueue";"AlreadyDone"]
.sub "_block13"  :subid("11_1267109933.6438") :outer("10_1267109933.6438")
# .annotate "line", 7
    get_hll_global $P16, ["DependencyQueue"], "_block15" 
    capture_lex $P16
# .annotate "line", 10
    get_hll_global $P16, ["DependencyQueue"], "_block15" 
    capture_lex $P16
    $P258 = $P16()
# .annotate "line", 7
    .return ($P258)
.end


.namespace ["DependencyQueue"]
.sub "_block15"  :subid("12_1267109933.6438") :outer("11_1267109933.6438")
# .annotate "line", 10
    .const 'Sub' $P175 = "24_1267109933.6438" 
    capture_lex $P175
    .const 'Sub' $P156 = "23_1267109933.6438" 
    capture_lex $P156
    .const 'Sub' $P147 = "22_1267109933.6438" 
    capture_lex $P147
    .const 'Sub' $P120 = "20_1267109933.6438" 
    capture_lex $P120
    .const 'Sub' $P111 = "19_1267109933.6438" 
    capture_lex $P111
    .const 'Sub' $P94 = "18_1267109933.6438" 
    capture_lex $P94
    .const 'Sub' $P74 = "16_1267109933.6438" 
    capture_lex $P74
    .const 'Sub' $P58 = "15_1267109933.6438" 
    capture_lex $P58
    .const 'Sub' $P23 = "14_1267109933.6438" 
    capture_lex $P23
    .const 'Sub' $P17 = "13_1267109933.6438" 
    capture_lex $P17
    .const 'Sub' $P17 = "13_1267109933.6438" 
    capture_lex $P17
    .lex "_pre_initload", $P17
    find_lex $P22, "_pre_initload"
# .annotate "line", 85
    .const 'Sub' $P175 = "24_1267109933.6438" 
    capture_lex $P175
# .annotate "line", 10
    .return ($P175)
.end


.namespace ["DependencyQueue"]
.sub "_pre_initload"  :subid("13_1267109933.6438") :outer("12_1267109933.6438")
# .annotate "line", 10
    new $P19, 'ExceptionHandler'
    set_addr $P19, control_18
    $P19."handle_types"(58)
    push_eh $P19
# .annotate "line", 12
    $P20 = "has"("%!added", "%!already_done", "%!cycle", "@!cycle_keys", "$!locked", "%!pending", "@!queue")
# .annotate "line", 10
    .return ($P20)
  control_18:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P21, exception, "payload"
    .return ($P21)
.end


.namespace ["DependencyQueue"]
.sub "add_entry"  :subid("14_1267109933.6438") :method :outer("12_1267109933.6438")
    .param pmc param_26
    .param pmc param_27
    .param pmc param_28 :optional :named("requires")
    .param int has_param_28 :opt_flag
# .annotate "line", 22
    new $P25, 'ExceptionHandler'
    set_addr $P25, control_24
    $P25."handle_types"(58)
    push_eh $P25
    .lex "self", self
    .lex "$name", param_26
    .lex "$value", param_27
    if has_param_28, optparam_29
    new $P29, "ResizablePMCArray"
    set param_28, $P29
  optparam_29:
    .lex "@requires", param_28
# .annotate "line", 30
    new $P30, "ResizablePMCArray"
    .lex "@entry", $P30
# .annotate "line", 23
    find_lex $P32, "self"
    $P33 = $P32."already_done"()
    find_lex $P34, "$name"
    $P35 = $P33."contains"($P34)
    unless $P35, if_31_end
# .annotate "line", 24
    get_hll_global $P36, ["Exception";"DependencyQueue"], "AlreadyDone"
    new $P37, 'String'
    set $P37, "Added already-done "
    find_lex $P38, "$name"
    concat $P39, $P37, $P38
    concat $P40, $P39, " to DependencyQueue"
    $P41 = $P36."new"($P40 :named("message"))
    $P41."throw"()
  if_31_end:
# .annotate "line", 29
    find_lex $P43, "@requires"
    $P44 = $P43."isa"("String")
    unless $P44, if_42_end
    get_hll_global $P45, ["Array"], "new"
    find_lex $P46, "@requires"
    $P47 = $P45($P46)
    store_lex "@requires", $P47
  if_42_end:
# .annotate "line", 30
    get_hll_global $P48, ["Array"], "new"
    find_lex $P49, "$name"
    find_lex $P50, "$value"
    find_lex $P51, "@requires"
    $P52 = $P48($P49, $P50, $P51)
    store_lex "@entry", $P52
# .annotate "line", 31
    find_lex $P53, "@entry"
    find_lex $P54, "$name"
    find_lex $P55, "self"
    $P56 = $P55."pending"()
    set $P56[$P54], $P53
# .annotate "line", 22
    .return ($P53)
  control_24:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P57, exception, "payload"
    .return ($P57)
.end


.namespace ["DependencyQueue"]
.sub "already_added"  :subid("15_1267109933.6438") :method :outer("12_1267109933.6438")
    .param pmc param_61
# .annotate "line", 34
    new $P60, 'ExceptionHandler'
    set_addr $P60, control_59
    $P60."handle_types"(58)
    push_eh $P60
    .lex "self", self
    .lex "$name", param_61
# .annotate "line", 35
    new $P62, "Exception"
    set $P62['type'], 58
    find_lex $P65, "self"
    $P66 = $P65."already_done"()
    find_lex $P67, "$name"
    $P68 = $P66."contains"($P67)
    unless $P68, unless_64
    set $P63, $P68
    goto unless_64_end
  unless_64:
# .annotate "line", 36
    find_lex $P69, "self"
    $P70 = $P69."added"()
    find_lex $P71, "$name"
    $P72 = $P70."contains"($P71)
    set $P63, $P72
  unless_64_end:
    setattribute $P62, 'payload', $P63
    throw $P62
# .annotate "line", 34
    .return ()
  control_59:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P73, exception, "payload"
    .return ($P73)
.end


.namespace ["DependencyQueue"]
.sub "_init_positional_"  :subid("16_1267109933.6438") :method :outer("12_1267109933.6438")
    .param pmc param_77
# .annotate "line", 39
    .const 'Sub' $P84 = "17_1267109933.6438" 
    capture_lex $P84
    new $P76, 'ExceptionHandler'
    set_addr $P76, control_75
    $P76."handle_types"(58)
    push_eh $P76
    .lex "self", self
    .lex "@pos", param_77
# .annotate "line", 40
    find_lex $P78, "self"
    $P78."locked"(0)
# .annotate "line", 42
    find_lex $P80, "@pos"
    defined $I81, $P80
    unless $I81, for_undef_30
    iter $P79, $P80
    new $P91, 'ExceptionHandler'
    set_addr $P91, loop90_handler
    $P91."handle_types"(65, 67, 66)
    push_eh $P91
  loop90_test:
    unless $P79, loop90_done
    shift $P82, $P79
  loop90_redo:
    .const 'Sub' $P84 = "17_1267109933.6438" 
    capture_lex $P84
    $P84($P82)
  loop90_next:
    goto loop90_test
  loop90_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P92, exception, 'type'
    eq $P92, 65, loop90_next
    eq $P92, 67, loop90_redo
  loop90_done:
    pop_eh 
  for_undef_30:
# .annotate "line", 39
    .return ($P79)
  control_75:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P93, exception, "payload"
    .return ($P93)
.end


.namespace ["DependencyQueue"]
.sub "_block83"  :anon :subid("17_1267109933.6438") :outer("16_1267109933.6438")
    .param pmc param_85
# .annotate "line", 42
    .lex "$_", param_85
# .annotate "line", 43
    find_lex $P86, "self"
    find_lex $P87, "$_"
    set $S88, $P87
    $P89 = $P86."mark_as_done"($S88)
# .annotate "line", 42
    .return ($P89)
.end


.namespace ["DependencyQueue"]
.sub "is_empty"  :subid("18_1267109933.6438") :method :outer("12_1267109933.6438")
# .annotate "line", 47
    new $P96, 'ExceptionHandler'
    set_addr $P96, control_95
    $P96."handle_types"(58)
    push_eh $P96
    .lex "self", self
# .annotate "line", 48
    new $P97, "Exception"
    set $P97['type'], 58
    find_lex $P100, "self"
    $P101 = $P100."locked"()
    if $P101, if_99
# .annotate "line", 50
    find_lex $P106, "self"
    $P107 = $P106."pending"()
    $N108 = $P107."elems"()
    iseq $I109, $N108, 0.0
    new $P98, 'Integer'
    set $P98, $I109
# .annotate "line", 48
    goto if_99_end
  if_99:
# .annotate "line", 49
    find_lex $P102, "self"
    $P103 = $P102."queue"()
    $N104 = $P103."elems"()
    iseq $I105, $N104, 0.0
    new $P98, 'Integer'
    set $P98, $I105
  if_99_end:
    setattribute $P97, 'payload', $P98
    throw $P97
# .annotate "line", 47
    .return ()
  control_95:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["DependencyQueue"]
.sub "mark_as_done"  :subid("19_1267109933.6438") :method :outer("12_1267109933.6438")
    .param pmc param_114
# .annotate "line", 53
    new $P113, 'ExceptionHandler'
    set_addr $P113, control_112
    $P113."handle_types"(58)
    push_eh $P113
    .lex "self", self
    .lex "$label", param_114
# .annotate "line", 54
    new $P115, "Integer"
    assign $P115, 1
    find_lex $P116, "$label"
    find_lex $P117, "self"
    $P118 = $P117."already_done"()
    set $P118[$P116], $P115
# .annotate "line", 53
    .return ($P115)
  control_112:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P119, exception, "payload"
    .return ($P119)
.end


.namespace ["DependencyQueue"]
.sub "next_entry"  :subid("20_1267109933.6438") :method :outer("12_1267109933.6438")
# .annotate "line", 57
    .const 'Sub' $P133 = "21_1267109933.6438" 
    capture_lex $P133
    new $P122, 'ExceptionHandler'
    set_addr $P122, control_121
    $P122."handle_types"(58)
    push_eh $P122
    .lex "self", self
# .annotate "line", 58
    find_lex $P124, "self"
    $P125 = $P124."locked"()
    if $P125, unless_123_end
# .annotate "line", 59
    find_lex $P126, "self"
    $P126."tsort_queue"()
  unless_123_end:
# .annotate "line", 62
    find_lex $P129, "self"
    $P130 = $P129."queue"()
    $P131 = $P130."elems"()
    if $P131, if_128
# .annotate "line", 68
    get_hll_global $P144, "Undef"
    $P145 = $P144."new"()
# .annotate "line", 67
    set $P127, $P145
# .annotate "line", 62
    goto if_128_end
  if_128:
    .const 'Sub' $P133 = "21_1267109933.6438" 
    capture_lex $P133
    $P143 = $P133()
    set $P127, $P143
  if_128_end:
# .annotate "line", 57
    .return ($P127)
  control_121:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P146, exception, "payload"
    .return ($P146)
.end


.namespace ["DependencyQueue"]
.sub "_block132"  :anon :subid("21_1267109933.6438") :outer("20_1267109933.6438")
# .annotate "line", 63
    new $P134, "Undef"
    .lex "$node", $P134
    find_lex $P135, "self"
    $P136 = $P135."queue"()
    $P137 = $P136."shift"()
    store_lex "$node", $P137
# .annotate "line", 64
    find_lex $P138, "self"
    find_lex $P139, "$node"
    unless_null $P139, vivify_31
    new $P139, "ResizablePMCArray"
  vivify_31:
    set $P140, $P139[0]
    unless_null $P140, vivify_32
    new $P140, "Undef"
  vivify_32:
    $P138."mark_as_done"($P140)
    find_lex $P141, "$node"
    unless_null $P141, vivify_33
    new $P141, "ResizablePMCArray"
  vivify_33:
    set $P142, $P141[1]
    unless_null $P142, vivify_34
    new $P142, "Undef"
  vivify_34:
# .annotate "line", 62
    .return ($P142)
.end


.namespace ["DependencyQueue"]
.sub "reset"  :subid("22_1267109933.6438") :method :outer("12_1267109933.6438")
# .annotate "line", 72
    new $P149, 'ExceptionHandler'
    set_addr $P149, control_148
    $P149."handle_types"(58)
    push_eh $P149
    .lex "self", self
# .annotate "line", 73
    find_lex $P150, "self"
    $P150."locked"(0)
# .annotate "line", 74
    find_lex $P151, "self"
    get_hll_global $P152, "Hash"
    $P153 = $P152."new"()
    $P154 = $P151."pending"($P153)
# .annotate "line", 72
    .return ($P154)
  control_148:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P155, exception, "payload"
    .return ($P155)
.end


.namespace ["DependencyQueue"]
.sub "tsort_queue"  :subid("23_1267109933.6438") :method :outer("12_1267109933.6438")
# .annotate "line", 77
    new $P158, 'ExceptionHandler'
    set_addr $P158, control_157
    $P158."handle_types"(58)
    push_eh $P158
    .lex "self", self
# .annotate "line", 78
    find_lex $P159, "self"
    $P159."locked"(1)
# .annotate "line", 79
    find_lex $P160, "self"
    get_hll_global $P161, ["Array"], "new"
    $P162 = $P161()
    $P160."cycle_keys"($P162)
# .annotate "line", 80
    find_lex $P163, "self"
    get_hll_global $P164, "Hash"
    $P165 = $P164."new"()
    $P163."cycle"($P165)
# .annotate "line", 81
    find_lex $P166, "self"
    get_hll_global $P167, "Hash"
    $P168 = $P167."new"()
    $P166."added"($P168)
# .annotate "line", 82
    find_lex $P169, "self"
    find_lex $P170, "self"
    $P171 = $P170."pending"()
    $P172 = $P171."keys"()
    $P173 = $P169."tsort_add_pending_entries"($P172)
# .annotate "line", 77
    .return ($P173)
  control_157:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P174, exception, "payload"
    .return ($P174)
.end


.namespace ["DependencyQueue"]
.sub "tsort_add_pending_entries"  :subid("24_1267109933.6438") :method :outer("12_1267109933.6438")
    .param pmc param_178
# .annotate "line", 85
    .const 'Sub' $P184 = "25_1267109933.6438" 
    capture_lex $P184
    new $P177, 'ExceptionHandler'
    set_addr $P177, control_176
    $P177."handle_types"(58)
    push_eh $P177
    .lex "self", self
    .lex "@list", param_178
# .annotate "line", 88
    find_lex $P180, "@list"
    defined $I181, $P180
    unless $I181, for_undef_35
    iter $P179, $P180
    new $P255, 'ExceptionHandler'
    set_addr $P255, loop254_handler
    $P255."handle_types"(65, 67, 66)
    push_eh $P255
  loop254_test:
    unless $P179, loop254_done
    shift $P182, $P179
  loop254_redo:
    .const 'Sub' $P184 = "25_1267109933.6438" 
    capture_lex $P184
    $P184($P182)
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
  for_undef_35:
# .annotate "line", 85
    .return ($P179)
  control_176:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P257, exception, "payload"
    .return ($P257)
.end


.namespace ["DependencyQueue"]
.sub "_block183"  :anon :subid("25_1267109933.6438") :outer("24_1267109933.6438")
    .param pmc param_187
# .annotate "line", 88
    .const 'Sub' $P228 = "27_1267109933.6438" 
    capture_lex $P228
    .const 'Sub' $P205 = "26_1267109933.6438" 
    capture_lex $P205
# .annotate "line", 89
    new $P185, "Undef"
    .lex "$key", $P185
# .annotate "line", 97
    new $P186, "Undef"
    .lex "$next_index", $P186
    .lex "$_", param_187
# .annotate "line", 89
    find_lex $P188, "$_"
    store_lex "$key", $P188
# .annotate "line", 91
    find_lex $P190, "self"
    find_lex $P191, "$key"
    $P192 = $P190."already_added"($P191)
    unless $P192, if_189_end
# .annotate "line", 92
    "next"()
  if_189_end:
# .annotate "line", 97
    find_lex $P193, "self"
    $P194 = $P193."cycle_keys"()
    $P195 = $P194."elems"()
    store_lex "$next_index", $P195
# .annotate "line", 98
    find_lex $P196, "self"
    $P197 = $P196."cycle_keys"()
    find_lex $P198, "$key"
    $P197."push"($P198)
# .annotate "line", 100
    find_lex $P200, "self"
    $P201 = $P200."cycle"()
    find_lex $P202, "$key"
    $P203 = $P201."contains"($P202)
    unless $P203, if_199_end
    .const 'Sub' $P205 = "26_1267109933.6438" 
    capture_lex $P205
    $P205()
  if_199_end:
# .annotate "line", 106
    find_lex $P217, "$next_index"
    find_lex $P218, "$key"
    find_lex $P219, "self"
    $P220 = $P219."cycle"()
    set $P220[$P218], $P217
# .annotate "line", 110
    find_lex $P223, "self"
    $P224 = $P223."pending"()
    find_lex $P225, "$key"
    $P226 = $P224."contains"($P225)
    if $P226, if_222
# .annotate "line", 123
    find_lex $P251, "$key"
    concat $P252, $P251, " is a requirement, but is not marked done, and not in the pending queue."
    $P253 = "die"($P252)
# .annotate "line", 122
    set $P221, $P253
# .annotate "line", 110
    goto if_222_end
  if_222:
    .const 'Sub' $P228 = "27_1267109933.6438" 
    capture_lex $P228
    $P250 = $P228()
    set $P221, $P250
  if_222_end:
# .annotate "line", 88
    .return ($P221)
.end


.namespace ["DependencyQueue"]
.sub "_block204"  :anon :subid("26_1267109933.6438") :outer("25_1267109933.6438")
# .annotate "line", 101
    new $P206, "ResizablePMCArray"
    .lex "@slice", $P206
    find_lex $P207, "self"
    $P208 = $P207."cycle_keys"()
    find_lex $P209, "$key"
    find_lex $P210, "self"
    $P211 = $P210."cycle"()
    set $P212, $P211[$P209]
    unless_null $P212, vivify_36
    new $P212, "Undef"
  vivify_36:
    $P213 = $P208."slice"($P212 :named("from"))
    store_lex "@slice", $P213
# .annotate "line", 103
    find_lex $P214, "@slice"
    $P215 = $P214."join"(", ")
    $P216 = "die"("Cycle detected in dependencies: ", $P215)
# .annotate "line", 100
    .return ($P216)
.end


.namespace ["DependencyQueue"]
.sub "_block227"  :anon :subid("27_1267109933.6438") :outer("25_1267109933.6438")
# .annotate "line", 111
    new $P229, "Undef"
    .lex "$node", $P229
# .annotate "line", 112
    new $P230, "ResizablePMCArray"
    .lex "@prerequisites", $P230
# .annotate "line", 111
    find_lex $P231, "$key"
    find_lex $P232, "self"
    $P233 = $P232."pending"()
    set $P234, $P233[$P231]
    unless_null $P234, vivify_37
    new $P234, "Undef"
  vivify_37:
    store_lex "$node", $P234
# .annotate "line", 112
    find_lex $P235, "$node"
    unless_null $P235, vivify_38
    new $P235, "ResizablePMCArray"
  vivify_38:
    set $P236, $P235[2]
    unless_null $P236, vivify_39
    new $P236, "Undef"
  vivify_39:
    store_lex "@prerequisites", $P236
# .annotate "line", 114
    find_lex $P238, "@prerequisites"
    set $N239, $P238
    unless $N239, if_237_end
# .annotate "line", 115
    find_lex $P240, "self"
    find_lex $P241, "@prerequisites"
    $P240."tsort_add_pending_entries"($P241)
  if_237_end:
# .annotate "line", 119
    new $P242, "Integer"
    assign $P242, 1
    find_lex $P243, "$key"
    find_lex $P244, "self"
    $P245 = $P244."added"()
    set $P245[$P243], $P242
# .annotate "line", 120
    find_lex $P246, "self"
    $P247 = $P246."queue"()
    find_lex $P248, "$node"
    $P249 = $P247."push"($P248)
# .annotate "line", 110
    .return ($P249)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109895.63322")
# .annotate "line", 0
    get_hll_global $P14, ["Mimus"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Mimus"], "_block13" 
    capture_lex $P14
    $P55 = $P14()
# .annotate "line", 1
    .return ($P55)
.end


.namespace ["Mimus"]
.sub "_block13"  :subid("11_1267109895.63322") :outer("10_1267109895.63322")
# .annotate "line", 7
    get_hll_global $P51, ["Mimus";"SuiGeneris"], "_block50" 
    capture_lex $P51
    .const 'Sub' $P39 = "13_1267109895.63322" 
    capture_lex $P39
    .const 'Sub' $P15 = "12_1267109895.63322" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1267109895.63322" 
    capture_lex $P15
    .lex "log_call", $P15
# .annotate "line", 18
    .const 'Sub' $P39 = "13_1267109895.63322" 
    capture_lex $P39
    .lex "get_log", $P39
# .annotate "line", 7
    find_lex $P48, "log_call"
    find_lex $P49, "get_log"
# .annotate "line", 24
    get_hll_global $P51, ["Mimus";"SuiGeneris"], "_block50" 
    capture_lex $P51
    $P52 = $P51()
# .annotate "line", 7
    .return ($P52)
.end


.namespace ["Mimus"]
.sub "" :load :init :subid("post15") :outer("11_1267109895.63322")
# .annotate "line", 7
    get_hll_global $P14, ["Mimus"], "_block13" 
    .local pmc block
    set block, $P14
    $P53 = get_root_global ["parrot"], "P6metaclass"
    new $P54, "ResizablePMCArray"
    push $P54, "@!MIMUS_CALLS"
    $P53."new_class"("Mimus::SuiGeneris", $P54 :named("attr"))
.end


.namespace ["Mimus"]
.sub "log_call"  :subid("12_1267109895.63322") :outer("11_1267109895.63322")
    .param pmc param_18
    .param pmc param_19 :slurpy
# .annotate "line", 7
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "$self", param_18
    .lex "@tuple", param_19
# .annotate "line", 8
    new $P20, "ResizablePMCArray"
    .lex "@log", $P20
    find_lex $P21, "$self"
    new $P22, "String"
    assign $P22, "@!MIMUS_CALLS"
    set $S23, $P22
    getattribute $P24, $P21, $S23
    store_lex "@log", $P24
# .annotate "line", 10
    find_lex $P26, "@log"
    isnull $I27, $P26
    unless $I27, if_25_end
# .annotate "line", 11
    new $P28, "String"
    assign $P28, "ResizablePMCArray"
    set $S29, $P28
    new $P30, $S29
    store_lex "@log", $P30
# .annotate "line", 12
    find_lex $P31, "$self"
    new $P32, "String"
    assign $P32, "@!MIMUS_CALLS"
    set $S33, $P32
    find_lex $P34, "@log"
    setattribute $P31, $S33, $P34
  if_25_end:
# .annotate "line", 15
    find_lex $P35, "@log"
    find_lex $P36, "@tuple"
    $P37 = $P35."push"($P36)
# .annotate "line", 7
    .return ($P37)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P38, exception, "payload"
    .return ($P38)
.end


.namespace ["Mimus"]
.sub "get_log"  :subid("13_1267109895.63322") :outer("11_1267109895.63322")
    .param pmc param_42
# .annotate "line", 18
    new $P41, 'ExceptionHandler'
    set_addr $P41, control_40
    $P41."handle_types"(58)
    push_eh $P41
    .lex "$mock", param_42
# .annotate "line", 19
    find_lex $P43, "$mock"
    new $P44, "String"
    assign $P44, "@!MIMUS_CALLS"
    set $S45, $P44
    getattribute $P46, $P43, $S45
# .annotate "line", 18
    .return ($P46)
  control_40:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P47, exception, "payload"
    .return ($P47)
.end


.namespace ["Mimus";"SuiGeneris"]
.sub "_block50"  :subid("14_1267109895.63322") :outer("11_1267109895.63322")
# .annotate "line", 24
    .return ()
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109899.69328")
# .annotate "line", 0
    get_hll_global $P14, ["Mimus";"Maker"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["Mimus";"Maker"], "_block13" 
    capture_lex $P14
    $P218 = $P14()
# .annotate "line", 1
    .return ($P218)
.end


.namespace []
.sub "" :load :init :subid("post19") :outer("10_1267109899.69328")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1267109899.69328" 
    .local pmc block
    set block, $P12
    $P219 = get_root_global ["parrot"], "P6metaclass"
    $P219."new_class"("Mimus::Maker")
.end


.namespace ["Mimus";"Maker"]
.sub "_block13"  :subid("11_1267109899.69328") :outer("10_1267109899.69328")
# .annotate "line", 6
    .const 'Sub' $P187 = "18_1267109899.69328" 
    capture_lex $P187
    .const 'Sub' $P105 = "16_1267109899.69328" 
    capture_lex $P105
    .const 'Sub' $P25 = "13_1267109899.69328" 
    capture_lex $P25
    .const 'Sub' $P15 = "12_1267109899.69328" 
    capture_lex $P15
# .annotate "line", 87
    .const 'Sub' $P187 = "18_1267109899.69328" 
    capture_lex $P187
# .annotate "line", 6
    .return ($P187)
.end


.namespace ["Mimus";"Maker"]
.sub "next_id"  :subid("12_1267109899.69328") :method :outer("11_1267109899.69328")
# .annotate "line", 6
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
# .annotate "line", 7
    get_global $P18, "$_Next_id"
    unless_null $P18, vivify_20
    new $P18, "Undef"
    set_global "$_Next_id", $P18
  vivify_20:
    get_global $P20, "$_Next_id"
    if $P20, unless_19_end
    new $P21, "Integer"
    assign $P21, 0
    set_global "$_Next_id", $P21
  unless_19_end:
    get_global $P22, "$_Next_id"
    clone $P23, $P22
    inc $P22
# .annotate "line", 6
    .return ($P23)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P24, exception, "payload"
    .return ($P24)
.end


.namespace ["Mimus";"Maker"]
.sub "mock"  :subid("13_1267109899.69328") :method :outer("11_1267109899.69328")
    .param pmc param_28 :optional
    .param int has_param_28 :opt_flag
    .param pmc param_30 :optional :named("of")
    .param int has_param_30 :opt_flag
# .annotate "line", 12
    .const 'Sub' $P94 = "15_1267109899.69328" 
    capture_lex $P94
    .const 'Sub' $P45 = "14_1267109899.69328" 
    capture_lex $P45
    new $P27, 'ExceptionHandler'
    set_addr $P27, control_26
    $P27."handle_types"(58)
    push_eh $P27
    .lex "self", self
    if has_param_28, optparam_21
    new $P29, "Undef"
    set param_28, $P29
  optparam_21:
    .lex "$name", param_28
    if has_param_30, optparam_22
    new $P31, "Undef"
    set param_30, $P31
  optparam_22:
    .lex "$of", param_30
# .annotate "line", 16
    new $P32, "Undef"
    .lex "$parent_class", $P32
# .annotate "line", 32
    new $P33, "Undef"
    .lex "$mock", $P33
# .annotate "line", 35
    new $P34, "Undef"
    .lex "$parrotclass", $P34
# .annotate "line", 37
    new $P35, "ResizablePMCArray"
    .lex "@methods", $P35
# .annotate "line", 14
    find_lex $P37, "$of"
    isnull $I38, $P37
    unless $I38, if_36_end
# .annotate "line", 13
    "die"("Error: :of(null) - Attempting to create mock of uninitialized class?")
  if_36_end:
# .annotate "line", 16
    new $P39, "String"
    assign $P39, "P6object"
    store_lex "$parent_class", $P39
# .annotate "line", 18
    new $P41, "ResizablePMCArray"
    push $P41, "Class"
    push $P41, "NameSpace"
    push $P41, "PMCProxy"
    push $P41, "String"
    defined $I42, $P41
    unless $I42, for_undef_23
    iter $P40, $P41
    new $P56, 'ExceptionHandler'
    set_addr $P56, loop55_handler
    $P56."handle_types"(65, 67, 66)
    push_eh $P56
  loop55_test:
    unless $P40, loop55_done
    shift $P43, $P40
  loop55_redo:
    .const 'Sub' $P45 = "14_1267109899.69328" 
    capture_lex $P45
    $P45($P43)
  loop55_next:
    goto loop55_test
  loop55_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P57, exception, 'type'
    eq $P57, 65, loop55_next
    eq $P57, 67, loop55_redo
  loop55_done:
    pop_eh 
  for_undef_23:
# .annotate "line", 25
    get_hll_global $P58, "P6metaclass"
    find_lex $P59, "$of"
    $P60 = $P58."get_parrotclass"($P59)
    store_lex "$parent_class", $P60
# .annotate "line", 27
    find_lex $P62, "$name"
    if $P62, unless_61_end
# .annotate "line", 28
    new $P63, "String"
    assign $P63, "Mock::"
    find_lex $P64, "self"
    $S65 = $P64."next_id"()
    concat $P66, $P63, $S65
    concat $P67, $P66, "::"
# .annotate "line", 29
    find_lex $P70, "$parent_class"
    isnull $I71, $P70
    if $I71, if_69
    find_lex $P72, "$parent_class"
    set $S73, $P72
    set $S68, $S73
    goto if_69_end
  if_69:
    set $S68, "<anonymous>"
  if_69_end:
    concat $P74, $P67, $S68
    store_lex "$name", $P74
  unless_61_end:
# .annotate "line", 32
    get_hll_global $P75, "P6metaclass"
    find_lex $P76, "$name"
    $P77 = $P75."new_class"($P76, "Mimus::SuiGeneris" :named("parent"))
    store_lex "$mock", $P77
# .annotate "line", 33
    get_hll_global $P78, "P6metaclass"
    find_lex $P79, "$mock"
    find_lex $P80, "$parent_class"
    $P78."add_parent"($P79, $P80)
# .annotate "line", 35
    get_hll_global $P81, "P6metaclass"
    find_lex $P82, "$mock"
    $P83 = $P81."get_parrotclass"($P82)
    store_lex "$parrotclass", $P83
# .annotate "line", 37
    find_lex $P84, "self"
    find_lex $P85, "$parent_class"
    $P86 = $P84."find_methods_of"($P85)
    store_lex "@methods", $P86
# .annotate "line", 39
    find_lex $P88, "self"
    find_lex $P89, "$parent_class"
    $P90 = $P88."find_methods_of"($P89)
    defined $I91, $P90
    unless $I91, for_undef_24
    iter $P87, $P90
    new $P101, 'ExceptionHandler'
    set_addr $P101, loop100_handler
    $P101."handle_types"(65, 67, 66)
    push_eh $P101
  loop100_test:
    unless $P87, loop100_done
    shift $P92, $P87
  loop100_redo:
    .const 'Sub' $P94 = "15_1267109899.69328" 
    capture_lex $P94
    $P94($P92)
  loop100_next:
    goto loop100_test
  loop100_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, 'type'
    eq $P102, 65, loop100_next
    eq $P102, 67, loop100_redo
  loop100_done:
    pop_eh 
  for_undef_24:
    find_lex $P103, "$mock"
# .annotate "line", 12
    .return ($P103)
  control_26:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["Mimus";"Maker"]
.sub "_block44"  :anon :subid("14_1267109899.69328") :outer("13_1267109899.69328")
    .param pmc param_46
# .annotate "line", 18
    .lex "$_", param_46
# .annotate "line", 19
    find_lex $P49, "$of"
    find_lex $P50, "$_"
    set $S51, $P50
    $P52 = $P49."isa"($S51)
    if $P52, if_48
    set $P47, $P52
    goto if_48_end
  if_48:
# .annotate "line", 20
    find_lex $P53, "$of"
    store_lex "$parent_class", $P53
# .annotate "line", 21
    $P54 = "last"()
# .annotate "line", 19
    set $P47, $P54
  if_48_end:
# .annotate "line", 18
    .return ($P47)
.end


.namespace ["Mimus";"Maker"]
.sub "_block93"  :anon :subid("15_1267109899.69328") :outer("13_1267109899.69328")
    .param pmc param_95
# .annotate "line", 39
    .lex "$method", param_95
# .annotate "line", 40
    find_lex $P96, "self"
    find_lex $P97, "$parrotclass"
    find_lex $P98, "$method"
    $P99 = $P96."mock_method"($P97, $P98)
# .annotate "line", 39
    .return ($P99)
.end


.namespace ["Mimus";"Maker"]
.sub "find_methods_of"  :subid("16_1267109899.69328") :method :outer("11_1267109899.69328")
    .param pmc param_108
    .param pmc param_109 :optional :named("root")
    .param int has_param_109 :opt_flag
# .annotate "line", 46
    .const 'Sub' $P155 = "17_1267109899.69328" 
    capture_lex $P155
    new $P107, 'ExceptionHandler'
    set_addr $P107, control_106
    $P107."handle_types"(58)
    push_eh $P107
    .lex "self", self
    .lex "$class", param_108
    if has_param_109, optparam_25
    new $P110, "String"
    assign $P110, "P6object"
    set param_109, $P110
  optparam_25:
    .lex "$root", param_109
# .annotate "line", 58
    new $P111, "Hash"
    .lex "%root_methods", $P111
# .annotate "line", 59
    new $P112, "Hash"
    .lex "%mock_methods", $P112
# .annotate "line", 61
    new $P113, "ResizablePMCArray"
    .lex "@mro", $P113
# .annotate "line", 63
    new $P114, "Hash"
    .lex "%parent_methods", $P114
# .annotate "line", 64
    new $P115, "Undef"
    .lex "$parent", $P115
# .annotate "line", 49
    find_lex $P117, "$class"
    $P118 = $P117."isa"("Class")
    if $P118, unless_116_end
# .annotate "line", 48
    "die"("$class parameter must be a Class")
  unless_116_end:
# .annotate "line", 51
    find_lex $P120, "$root"
    $P121 = $P120."isa"("String")
    unless $P121, if_119_end
# .annotate "line", 52
    get_hll_global $P122, "P6metaclass"
    find_lex $P123, "$root"
    $P124 = $P122."get_parrotclass"($P123)
    store_lex "$root", $P124
  if_119_end:
# .annotate "line", 56
    find_lex $P128, "$root"
    isnull $I129, $P128
    new $P130, 'Integer'
    set $P130, $I129
    isfalse $I131, $P130
    if $I131, if_127
    new $P126, 'Integer'
    set $P126, $I131
    goto if_127_end
  if_127:
    find_lex $P132, "$root"
    $P133 = $P132."isa"("Class")
    set $P126, $P133
  if_127_end:
    if $P126, unless_125_end
# .annotate "line", 55
    "die"("$root parameter must be a classname or a class object")
  unless_125_end:
# .annotate "line", 58
    find_lex $P134, "$root"
    $P135 = $P134."methods"()
    store_lex "%root_methods", $P135
    find_lex $P136, "%mock_methods"
# .annotate "line", 61
    find_lex $P137, "$class"
    $P138 = $P137."inspect"("all_parents")
    store_lex "@mro", $P138
    find_lex $P139, "%parent_methods"
    find_lex $P140, "$parent"
# .annotate "line", 66
    new $P182, 'ExceptionHandler'
    set_addr $P182, loop181_handler
    $P182."handle_types"(65, 67, 66)
    push_eh $P182
  loop181_test:
    find_lex $P141, "@mro"
    unless $P141, loop181_done
  loop181_redo:
# .annotate "line", 67
    find_lex $P142, "@mro"
    $P143 = $P142."shift"()
    store_lex "$parent", $P143
# .annotate "line", 69
    find_lex $P145, "$parent"
    find_lex $P146, "$root"
    issame $I147, $P145, $P146
    unless $I147, if_144_end
    "last"()
  if_144_end:
# .annotate "line", 70
    find_lex $P148, "$parent"
    $P149 = $P148."methods"()
    store_lex "%parent_methods", $P149
# .annotate "line", 72
    find_lex $P151, "%parent_methods"
    defined $I152, $P151
    unless $I152, for_undef_26
    iter $P150, $P151
    new $P179, 'ExceptionHandler'
    set_addr $P179, loop178_handler
    $P179."handle_types"(65, 67, 66)
    push_eh $P179
  loop178_test:
    unless $P150, loop178_done
    shift $P153, $P150
  loop178_redo:
    .const 'Sub' $P155 = "17_1267109899.69328" 
    capture_lex $P155
    $P155($P153)
  loop178_next:
    goto loop178_test
  loop178_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P180, exception, 'type'
    eq $P180, 65, loop178_next
    eq $P180, 67, loop178_redo
  loop178_done:
    pop_eh 
  for_undef_26:
  loop181_next:
# .annotate "line", 66
    goto loop181_test
  loop181_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P183, exception, 'type'
    eq $P183, 65, loop181_next
    eq $P183, 67, loop181_redo
  loop181_done:
    pop_eh 
# .annotate "line", 84
    find_lex $P184, "%mock_methods"
    $P185 = $P184."keys"()
# .annotate "line", 46
    .return ($P185)
  control_106:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P186, exception, "payload"
    .return ($P186)
.end


.namespace ["Mimus";"Maker"]
.sub "_block154"  :anon :subid("17_1267109899.69328") :outer("16_1267109899.69328")
    .param pmc param_156
# .annotate "line", 72
    .lex "$_", param_156
# .annotate "line", 73
    find_lex $P160, "%mock_methods"
    find_lex $P161, "$_"
    set $S162, $P161
    $P163 = $P160."contains"($S162)
    unless $P163, unless_159
    set $P158, $P163
    goto unless_159_end
  unless_159:
# .annotate "line", 74
    find_lex $P164, "$_"
    find_lex $P165, "%parent_methods"
    unless_null $P165, vivify_27
    new $P165, "Hash"
  vivify_27:
    set $P166, $P165[$P164]
    unless_null $P166, vivify_28
    new $P166, "Undef"
  vivify_28:
    find_lex $P167, "$_"
    find_lex $P168, "%root_methods"
    unless_null $P168, vivify_29
    new $P168, "Hash"
  vivify_29:
    set $P169, $P168[$P167]
    unless_null $P169, vivify_30
    new $P169, "Undef"
  vivify_30:
    issame $I170, $P166, $P169
    new $P158, 'Integer'
    set $P158, $I170
  unless_159_end:
    unless $P158, if_157_end
# .annotate "line", 76
    "next"()
  if_157_end:
# .annotate "line", 79
    find_lex $P171, "$_"
    set $S172, $P171
    find_lex $P173, "%parent_methods"
    unless_null $P173, vivify_31
    new $P173, "Hash"
  vivify_31:
    set $P174, $P173[$S172]
    unless_null $P174, vivify_32
    new $P174, "Undef"
  vivify_32:
    find_lex $P175, "$_"
    set $S176, $P175
    find_lex $P177, "%mock_methods"
    unless_null $P177, vivify_33
    new $P177, "Hash"
    store_lex "%mock_methods", $P177
  vivify_33:
    set $P177[$S176], $P174
# .annotate "line", 72
    .return ($P174)
.end


.namespace ["Mimus";"Maker"]
.sub "mock_method"  :subid("18_1267109899.69328") :method :outer("11_1267109899.69328")
    .param pmc param_190
    .param pmc param_191
# .annotate "line", 87
    new $P189, 'ExceptionHandler'
    set_addr $P189, control_188
    $P189."handle_types"(58)
    push_eh $P189
    .lex "self", self
    .lex "$parrotclass", param_190
    .lex "$method", param_191
# .annotate "line", 88
    new $P192, "ResizablePMCArray"
    .lex "@body", $P192
# .annotate "line", 94
    new $P193, "Undef"
    .lex "&sub", $P193
# .annotate "line", 89
    new $P194, "String"
    assign $P194, "\t"
    concat $P195, $P194, "$P0 = get_hll_global ['Mimus'], 'log_call'"
# .annotate "line", 90
    new $P196, "String"
    assign $P196, "\t"
    concat $P197, $P196, "$P0(self, '"
    find_lex $P198, "$method"
    concat $P199, $P197, $P198
    concat $P200, $P199, "', pos, named)"
# .annotate "line", 91
    new $P201, "String"
    assign $P201, "\t"
    concat $P202, $P201, ".return (self)"
    new $P203, "ResizablePMCArray"
    push $P203, $P195
    push $P203, $P200
    push $P203, $P202
    store_lex "@body", $P203
# .annotate "line", 94
    get_hll_global $P204, ["Pir"], "compile_sub"
    find_lex $P205, "$method"
# .annotate "line", 96
    find_lex $P206, "$parrotclass"
    $P207 = $P206."get_namespace"()
# .annotate "line", 99
    new $P208, "ResizablePMCArray"
    push $P208, ".param pmc pos :slurpy"
    push $P208, ".param pmc named :slurpy :named"
    find_lex $P209, "@body"
    $P210 = $P204(1 :named("method"), $P205 :named("name"), $P207 :named("namespace"), $P208 :named("params"), $P209 :named("body"))
# .annotate "line", 94
    store_lex "&sub", $P210
# .annotate "line", 106
    find_lex $P211, "$parrotclass"
    find_lex $P212, "$method"
    $P211."remove_method"($P212)
# .annotate "line", 107
    find_lex $P213, "$parrotclass"
    find_lex $P214, "$method"
    find_lex $P215, "&sub"
    $P216 = $P213."add_method"($P214, $P215)
# .annotate "line", 87
    .return ($P216)
  control_188:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P217, exception, "payload"
    .return ($P217)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109905.03337")
# .annotate "line", 0
    get_hll_global $P16, ["Program"], "_block15" 
    capture_lex $P16
    get_hll_global $P14, ["Exception";"ProgramExit"], "_block13" 
    capture_lex $P14
# .annotate "line", 5
    get_hll_global $P14, ["Exception";"ProgramExit"], "_block13" 
    capture_lex $P14
    $P14()
# .annotate "line", 11
    get_hll_global $P16, ["Program"], "_block15" 
    capture_lex $P16
    $P510 = $P16()
# .annotate "line", 1
    .return ($P510)
.end


.namespace []
.sub "" :load :init :subid("post34") :outer("10_1267109905.03337")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1267109905.03337" 
    .local pmc block
    set block, $P12
    $P511 = get_root_global ["parrot"], "P6metaclass"
    $P511."new_class"("Exception::ProgramExit", "Exception::Wrapper" :named("parent"))
.end


.namespace ["Exception";"ProgramExit"]
.sub "_block13"  :subid("11_1267109905.03337") :outer("10_1267109905.03337")
# .annotate "line", 5
    .return ()
.end


.namespace ["Program"]
.sub "_block15"  :subid("12_1267109905.03337") :outer("10_1267109905.03337")
# .annotate "line", 11
    .const 'Sub' $P350 = "30_1267109905.03337" 
    capture_lex $P350
    .const 'Sub' $P317 = "29_1267109905.03337" 
    capture_lex $P317
    .const 'Sub' $P302 = "28_1267109905.03337" 
    capture_lex $P302
    .const 'Sub' $P283 = "27_1267109905.03337" 
    capture_lex $P283
    .const 'Sub' $P242 = "26_1267109905.03337" 
    capture_lex $P242
    .const 'Sub' $P233 = "25_1267109905.03337" 
    capture_lex $P233
    .const 'Sub' $P225 = "24_1267109905.03337" 
    capture_lex $P225
    .const 'Sub' $P213 = "23_1267109905.03337" 
    capture_lex $P213
    .const 'Sub' $P201 = "22_1267109905.03337" 
    capture_lex $P201
    .const 'Sub' $P189 = "21_1267109905.03337" 
    capture_lex $P189
    .const 'Sub' $P177 = "20_1267109905.03337" 
    capture_lex $P177
    .const 'Sub' $P132 = "19_1267109905.03337" 
    capture_lex $P132
    .const 'Sub' $P81 = "17_1267109905.03337" 
    capture_lex $P81
    .const 'Sub' $P40 = "15_1267109905.03337" 
    capture_lex $P40
    .const 'Sub' $P26 = "14_1267109905.03337" 
    capture_lex $P26
    .const 'Sub' $P17 = "13_1267109905.03337" 
    capture_lex $P17
    .const 'Sub' $P17 = "13_1267109905.03337" 
    capture_lex $P17
    .lex "_pre_initload", $P17
# .annotate "line", 83
    .const 'Sub' $P26 = "14_1267109905.03337" 
    capture_lex $P26
    .lex "exit", $P26
# .annotate "line", 234
    .const 'Sub' $P40 = "15_1267109905.03337" 
    capture_lex $P40
    .lex "call", $P40
# .annotate "line", 259
    .const 'Sub' $P81 = "17_1267109905.03337" 
    capture_lex $P81
    .lex "determine_call", $P81
# .annotate "line", 11
    find_lex $P131, "_pre_initload"
# .annotate "line", 79
    find_lex $P241, "exit"
# .annotate "line", 142
    find_lex $P508, "call"
    find_lex $P509, "determine_call"
# .annotate "line", 11
    .return ($P509)
.end


.namespace ["Program"]
.sub "_pre_initload"  :subid("13_1267109905.03337") :outer("12_1267109905.03337")
    .param pmc param_20 :slurpy
# .annotate "line", 11
    new $P19, 'ExceptionHandler'
    set_addr $P19, control_18
    $P19."handle_types"(58)
    push_eh $P19
    .lex "@modules_done", param_20
# .annotate "line", 13
    new $P21, "ResizablePMCArray"
    push $P21, "@!args"
    push $P21, "$!at_exit_queue"
    push $P21, "$!at_init_queue"
    push $P21, "$!at_load_queue"
    push $P21, "%!env"
    push $P21, "$!executable"
    push $P21, "$!exit_value"
    push $P21, "$!process_id"
    push $P21, "$!stdin"
    push $P21, "$!stderr"
    push $P21, "$!stdout"
    push $P21, "$!uid"
    "has"($P21)
# .annotate "line", 27
    get_hll_global $P22, ["Global"], "inject_root_symbol"
    get_hll_global $P23, ["Program"], "exit"
    $P24 = $P22($P23)
# .annotate "line", 11
    .return ($P24)
  control_18:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P25, exception, "payload"
    .return ($P25)
.end


.namespace ["Program"]
.sub "exit"  :subid("14_1267109905.03337") :outer("12_1267109905.03337")
    .param pmc param_29
# .annotate "line", 83
    new $P28, 'ExceptionHandler'
    set_addr $P28, control_27
    $P28."handle_types"(58)
    push_eh $P28
    .lex "$status", param_29
# .annotate "line", 84
    get_hll_global $P30, ["Exception"], "ProgramExit"
    find_lex $P31, "$status"
    new $P32, 'String'
    set $P32, "exit("
    find_lex $P33, "$status"
    concat $P34, $P32, $P33
    concat $P35, $P34, ")"
    find_lex $P36, "$status"
    $P37 = $P30."new"($P31 :named("exit_code"), $P35 :named("message"), $P36 :named("payload"))
    $P38 = $P37."throw"()
# .annotate "line", 83
    .return ($P38)
  control_27:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P39, exception, "payload"
    .return ($P39)
.end


.namespace ["Program"]
.sub "call"  :subid("15_1267109905.03337") :outer("12_1267109905.03337")
    .param pmc param_43
# .annotate "line", 234
    .const 'Sub' $P49 = "16_1267109905.03337" 
    capture_lex $P49
    new $P42, 'ExceptionHandler'
    set_addr $P42, control_41
    $P42."handle_types"(58)
    push_eh $P42
    .lex "$call", param_43
# .annotate "line", 250
    new $P44, "Undef"
    .lex "$status", $P44
# .annotate "line", 238
    find_lex $P46, "$call"
    $P47 = $P46."isa"("String")
    unless $P47, if_45_end
    .const 'Sub' $P49 = "16_1267109905.03337" 
    capture_lex $P49
    $P49()
  if_45_end:
# .annotate "line", 250
    new $P66, "Integer"
    assign $P66, 0
    store_lex "$status", $P66
# .annotate "line", 252
    get_hll_global $P70, ["Opcode"], "isnull"
    find_lex $P71, "$call"
    $P72 = $P70($P71)
    isfalse $I73, $P72
    if $I73, if_69
    new $P68, 'Integer'
    set $P68, $I73
    goto if_69_end
  if_69:
    find_lex $P74, "$call"
    $P75 = $P74."defined"()
    set $P68, $P75
  if_69_end:
    unless $P68, if_67_end
# .annotate "line", 253
    find_lex $P76, "$call"
    $P77 = $P76()
    store_lex "$status", $P77
  if_67_end:
# .annotate "line", 256
    new $P78, "Exception"
    set $P78['type'], 58
    find_lex $P79, "$status"
    setattribute $P78, 'payload', $P79
    throw $P78
# .annotate "line", 234
    .return ()
  control_41:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P80, exception, "payload"
    .return ($P80)
.end


.namespace ["Program"]
.sub "_block48"  :anon :subid("16_1267109905.03337") :outer("15_1267109905.03337")
# .annotate "line", 239
    new $P50, "ResizablePMCArray"
    .lex "@nsp", $P50
# .annotate "line", 240
    new $P51, "Undef"
    .lex "$name", $P51
# .annotate "line", 239
    find_lex $P52, "$call"
    $P53 = $P52."split"("::")
    store_lex "@nsp", $P53
# .annotate "line", 240
    find_lex $P54, "@nsp"
    $P55 = $P54."pop"()
    store_lex "$name", $P55
# .annotate "line", 243
    find_lex $P57, "@nsp"
    unless_null $P57, vivify_35
    new $P57, "ResizablePMCArray"
  vivify_35:
    set $P58, $P57[0]
    unless_null $P58, vivify_36
    new $P58, "Undef"
  vivify_36:
    set $S59, $P58
    iseq $I60, $S59, ""
    unless $I60, if_56_end
# .annotate "line", 244
    find_lex $P61, "@nsp"
    $P61."shift"()
  if_56_end:
# .annotate "line", 247
    get_hll_global $P62, ["Opcode"], "get_hll_global"
    find_lex $P63, "@nsp"
    find_lex $P64, "$name"
    $P65 = $P62($P63, $P64)
    store_lex "$call", $P65
# .annotate "line", 238
    .return ($P65)
.end


.namespace ["Program"]
.sub "determine_call"  :subid("17_1267109905.03337") :outer("12_1267109905.03337")
    .param pmc param_84
    .param pmc param_85
    .param pmc param_86
# .annotate "line", 259
    .const 'Sub' $P113 = "18_1267109905.03337" 
    capture_lex $P113
    new $P83, 'ExceptionHandler'
    set_addr $P83, control_82
    $P83."handle_types"(58)
    push_eh $P83
    .lex "$call", param_84
    .lex "$caller_nsp", param_85
    .lex "@sub_names", param_86
# .annotate "line", 265
    new $P87, "Undef"
    .lex "$nsp_name", $P87
    get_hll_global $P88, ["Parrot"], "namespace_name"
    find_lex $P89, "$caller_nsp"
    $P90 = $P88($P89)
    store_lex "$nsp_name", $P90
# .annotate "line", 267
    find_lex $P92, "$call"
    $P93 = "defined"($P92)
    unless $P93, if_91_end
# .annotate "line", 268
    find_lex $P95, "$call"
    $P96 = "isa"($P95, "String")
    unless $P96, if_94_end
# .annotate "line", 269
    find_lex $P98, "$call"
    $P99 = $P98."split"("::")
    set $N100, $P99
    iseq $I101, $N100, 1.0
    unless $I101, if_97_end
# .annotate "line", 270
    find_lex $P102, "$nsp_name"
    concat $P103, $P102, "::"
    find_lex $P104, "$call"
    concat $P105, $P103, $P104
    store_lex "$call", $P105
  if_97_end:
  if_94_end:
# .annotate "line", 274
    new $P106, "Exception"
    set $P106['type'], 58
    find_lex $P107, "$call"
    setattribute $P106, 'payload', $P107
    throw $P106
  if_91_end:
# .annotate "line", 277
    find_lex $P109, "@sub_names"
    defined $I110, $P109
    unless $I110, for_undef_37
    iter $P108, $P109
    new $P124, 'ExceptionHandler'
    set_addr $P124, loop123_handler
    $P124."handle_types"(65, 67, 66)
    push_eh $P124
  loop123_test:
    unless $P108, loop123_done
    shift $P111, $P108
  loop123_redo:
    .const 'Sub' $P113 = "18_1267109905.03337" 
    capture_lex $P113
    $P113($P111)
  loop123_next:
    goto loop123_test
  loop123_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P125, exception, 'type'
    eq $P125, 65, loop123_next
    eq $P125, 67, loop123_redo
  loop123_done:
    pop_eh 
  for_undef_37:
# .annotate "line", 283
    find_lex $P126, "@sub_names"
    $P127 = $P126."join"(", ")
    find_lex $P128, "$nsp_name"
    $P129 = "die"("Cannot find any viable call (", $P127, ") in ", $P128)
# .annotate "line", 259
    .return ($P129)
  control_82:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P130, exception, "payload"
    .return ($P130)
.end


.namespace ["Program"]
.sub "_block112"  :anon :subid("18_1267109905.03337") :outer("17_1267109905.03337")
    .param pmc param_114
# .annotate "line", 277
    .lex "$_", param_114
# .annotate "line", 278
    find_lex $P117, "$_"
    set $S118, $P117
    find_lex $P119, "$caller_nsp"
    unless_null $P119, vivify_38
    new $P119, "Hash"
  vivify_38:
    set $P120, $P119[$S118]
    unless_null $P120, vivify_39
    new $P120, "Undef"
  vivify_39:
    store_lex "$call", $P120
    if $P120, if_116
    set $P115, $P120
    goto if_116_end
  if_116:
# .annotate "line", 279
    new $P121, "Exception"
    set $P121['type'], 58
    find_lex $P122, "$call"
    setattribute $P121, 'payload', $P122
    throw $P121
  if_116_end:
# .annotate "line", 277
    .return ($P115)
.end


.namespace ["Program"]
.sub "add_call_"  :subid("19_1267109905.03337") :method :outer("12_1267109905.03337")
    .param pmc param_135
    .param pmc param_136
    .param pmc param_137
# .annotate "line", 30
    new $P134, 'ExceptionHandler'
    set_addr $P134, control_133
    $P134."handle_types"(58)
    push_eh $P134
    .lex "self", self
    .lex "$queue", param_135
    .lex "@pos", param_136
    .lex "%named", param_137
# .annotate "line", 35
    new $P138, "Undef"
    .lex "$name", $P138
# .annotate "line", 36
    new $P139, "Undef"
    .lex "$sub", $P139
# .annotate "line", 31
    find_lex $P141, "%named"
    $P142 = $P141."contains"("namespace")
    if $P142, unless_140_end
# .annotate "line", 32
    get_hll_global $P143, ["Parrot"], "caller_namespace"
    $P144 = $P143(3)
    find_lex $P145, "%named"
    unless_null $P145, vivify_40
    new $P145, "Hash"
    store_lex "%named", $P145
  vivify_40:
    set $P145["namespace"], $P144
  unless_140_end:
# .annotate "line", 31
    find_lex $P146, "$name"
# .annotate "line", 36
    find_lex $P147, "@pos"
    $P148 = $P147."shift"()
    store_lex "$sub", $P148
# .annotate "line", 38
    find_lex $P150, "@pos"
    $P151 = $P150."elems"()
    if $P151, if_149
# .annotate "line", 41
    find_lex $P155, "$sub"
    $P156 = $P155."isa"("String")
    if $P156, if_154
# .annotate "line", 44
    find_lex $P159, "$sub"
    $P160 = $P159."isa"("Sub")
    if $P160, if_158
# .annotate "line", 48
    get_hll_global $P168, ["Exception"], "InvalidArgument"
    $P169 = $P168."new"("Invalid $call argument. Must be Sub or String" :named("message"))
    $P169."throw"()
# .annotate "line", 47
    goto if_158_end
  if_158:
# .annotate "line", 45
    find_lex $P161, "$sub"
    $P162 = $P161."get_namespace"()
    $P163 = $P162."get_name"()
    $P164 = $P163."join"("::")
    concat $P165, $P164, "::"
    find_lex $P166, "$sub"
    concat $P167, $P165, $P166
    store_lex "$name", $P167
  if_158_end:
# .annotate "line", 44
    goto if_154_end
  if_154:
# .annotate "line", 42
    find_lex $P157, "$sub"
    store_lex "$name", $P157
  if_154_end:
# .annotate "line", 41
    goto if_149_end
  if_149:
# .annotate "line", 39
    find_lex $P152, "@pos"
    $P153 = $P152."shift"()
    store_lex "$name", $P153
  if_149_end:
# .annotate "line", 53
    find_lex $P170, "$queue"
    find_lex $P171, "$name"
    find_lex $P172, "$sub"
    find_lex $P173, "%named"
    unless_null $P173, vivify_41
    new $P173, "Hash"
  vivify_41:
    set $P174, $P173["requires"]
    unless_null $P174, vivify_42
    new $P174, "Undef"
  vivify_42:
    $P175 = $P170."add_entry"($P171, $P172, $P174)
# .annotate "line", 30
    .return ($P175)
  control_133:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P176, exception, "payload"
    .return ($P176)
.end


.namespace ["Program"]
.sub "at_exit"  :subid("20_1267109905.03337") :method :outer("12_1267109905.03337")
    .param pmc param_180 :slurpy
    .param pmc param_181 :slurpy :named
# .annotate "line", 56
    new $P179, 'ExceptionHandler'
    set_addr $P179, control_178
    $P179."handle_types"(58)
    push_eh $P179
    .lex "self", self
    .lex "@pos", param_180
    .lex "%named", param_181
# .annotate "line", 57
    find_lex $P182, "self"
    find_lex $P183, "self"
    getattribute $P184, $P183, "$!at_exit_queue"
    unless_null $P184, vivify_43
    new $P184, "Undef"
  vivify_43:
    find_lex $P185, "@pos"
    find_lex $P186, "%named"
    $P187 = $P182."add_call_"($P184, $P185, $P186)
# .annotate "line", 56
    .return ($P187)
  control_178:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P188, exception, "payload"
    .return ($P188)
.end


.namespace ["Program"]
.sub "at_init"  :subid("21_1267109905.03337") :method :outer("12_1267109905.03337")
    .param pmc param_192 :slurpy
    .param pmc param_193 :slurpy :named
# .annotate "line", 60
    new $P191, 'ExceptionHandler'
    set_addr $P191, control_190
    $P191."handle_types"(58)
    push_eh $P191
    .lex "self", self
    .lex "@pos", param_192
    .lex "%named", param_193
# .annotate "line", 61
    find_lex $P194, "self"
    find_lex $P195, "self"
    getattribute $P196, $P195, "$!at_init_queue"
    unless_null $P196, vivify_44
    new $P196, "Undef"
  vivify_44:
    find_lex $P197, "@pos"
    find_lex $P198, "%named"
    $P199 = $P194."add_call_"($P196, $P197, $P198)
# .annotate "line", 60
    .return ($P199)
  control_190:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P200, exception, "payload"
    .return ($P200)
.end


.namespace ["Program"]
.sub "at_load"  :subid("22_1267109905.03337") :method :outer("12_1267109905.03337")
    .param pmc param_204 :slurpy
    .param pmc param_205 :slurpy :named
# .annotate "line", 64
    new $P203, 'ExceptionHandler'
    set_addr $P203, control_202
    $P203."handle_types"(58)
    push_eh $P203
    .lex "self", self
    .lex "@pos", param_204
    .lex "%named", param_205
# .annotate "line", 65
    find_lex $P206, "self"
    find_lex $P207, "self"
    getattribute $P208, $P207, "$!at_load_queue"
    unless_null $P208, vivify_45
    new $P208, "Undef"
  vivify_45:
    find_lex $P209, "@pos"
    find_lex $P210, "%named"
    $P211 = $P206."add_call_"($P208, $P209, $P210)
# .annotate "line", 64
    .return ($P211)
  control_202:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P212, exception, "payload"
    .return ($P212)
.end


.namespace ["Program"]
.sub "do_exit"  :subid("23_1267109905.03337") :method :outer("12_1267109905.03337")
# .annotate "line", 68
    new $P215, 'ExceptionHandler'
    set_addr $P215, control_214
    $P215."handle_types"(58)
    push_eh $P215
    .lex "self", self
# .annotate "line", 71
    new $P216, "Undef"
    .lex "$code", $P216
# .annotate "line", 69
    find_lex $P217, "self"
    find_lex $P218, "self"
    getattribute $P219, $P218, "$!at_exit_queue"
    unless_null $P219, vivify_46
    new $P219, "Undef"
  vivify_46:
    $P217."process_queue"($P219, "exit" :named("name"))
# .annotate "line", 71
    find_lex $P220, "self"
    getattribute $P221, $P220, "$!exit_value"
    unless_null $P221, vivify_47
    new $P221, "Undef"
  vivify_47:
    store_lex "$code", $P221
# .annotate "line", 72
    find_lex $P222, "$code"
    set $I223, $P222
    exit $I223
# .annotate "line", 68
    .return ()
  control_214:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P224, exception, "payload"
    .return ($P224)
.end


.namespace ["Program"]
.sub "do_init"  :subid("24_1267109905.03337") :method :outer("12_1267109905.03337")
# .annotate "line", 75
    new $P227, 'ExceptionHandler'
    set_addr $P227, control_226
    $P227."handle_types"(58)
    push_eh $P227
    .lex "self", self
# .annotate "line", 76
    find_lex $P228, "self"
    find_lex $P229, "self"
    getattribute $P230, $P229, "$!at_init_queue"
    unless_null $P230, vivify_48
    new $P230, "Undef"
  vivify_48:
    $P231 = $P228."process_queue"($P230, "init" :named("name"))
# .annotate "line", 75
    .return ($P231)
  control_226:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P232, exception, "payload"
    .return ($P232)
.end


.namespace ["Program"]
.sub "do_load"  :subid("25_1267109905.03337") :method :outer("12_1267109905.03337")
# .annotate "line", 79
    new $P235, 'ExceptionHandler'
    set_addr $P235, control_234
    $P235."handle_types"(58)
    push_eh $P235
    .lex "self", self
# .annotate "line", 80
    find_lex $P236, "self"
    find_lex $P237, "self"
    getattribute $P238, $P237, "$!at_load_queue"
    unless_null $P238, vivify_49
    new $P238, "Undef"
  vivify_49:
    $P239 = $P236."process_queue"($P238, "load" :named("name"))
# .annotate "line", 79
    .return ($P239)
  control_234:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P240, exception, "payload"
    .return ($P240)
.end


.namespace ["Program"]
.sub "incorporate"  :subid("26_1267109905.03337") :method :outer("12_1267109905.03337")
    .param pmc param_245
# .annotate "line", 92
    new $P244, 'ExceptionHandler'
    set_addr $P244, control_243
    $P244."handle_types"(58)
    push_eh $P244
    .lex "self", self
    .lex "$other", param_245
# .annotate "line", 93
    find_lex $P246, "$other"
    $P247 = $P246."args"()
    find_lex $P248, "self"
    setattribute $P248, "@!args", $P247
# .annotate "line", 94
    find_lex $P249, "$other"
    $P250 = $P249."at_exit_queue"()
    find_lex $P251, "self"
    setattribute $P251, "$!at_exit_queue", $P250
# .annotate "line", 95
    find_lex $P252, "$other"
    $P253 = $P252."at_init_queue"()
    find_lex $P254, "self"
    setattribute $P254, "$!at_init_queue", $P253
# .annotate "line", 96
    find_lex $P255, "$other"
    $P256 = $P255."at_load_queue"()
    find_lex $P257, "self"
    setattribute $P257, "$!at_load_queue", $P256
# .annotate "line", 97
    find_lex $P258, "$other"
    $P259 = $P258."env"()
    find_lex $P260, "self"
    setattribute $P260, "%!env", $P259
# .annotate "line", 98
    find_lex $P261, "$other"
    $P262 = $P261."executable"()
    find_lex $P263, "self"
    setattribute $P263, "$!executable", $P262
# .annotate "line", 99
    find_lex $P264, "$other"
    $P265 = $P264."exit_value"()
    find_lex $P266, "self"
    setattribute $P266, "$!exit_value", $P265
# .annotate "line", 100
    find_lex $P267, "$other"
    $P268 = $P267."process_id"()
    find_lex $P269, "self"
    setattribute $P269, "$!process_id", $P268
# .annotate "line", 101
    find_lex $P270, "$other"
    $P271 = $P270."stderr"()
    find_lex $P272, "self"
    setattribute $P272, "$!stderr", $P271
# .annotate "line", 102
    find_lex $P273, "$other"
    $P274 = $P273."stdin"()
    find_lex $P275, "self"
    setattribute $P275, "$!stdin", $P274
# .annotate "line", 103
    find_lex $P276, "$other"
    $P277 = $P276."stdout"()
    find_lex $P278, "self"
    setattribute $P278, "$!stdout", $P277
# .annotate "line", 104
    find_lex $P279, "$other"
    $P280 = $P279."uid"()
    find_lex $P281, "self"
    setattribute $P281, "$!uid", $P280
# .annotate "line", 92
    .return ($P280)
  control_243:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P282, exception, "payload"
    .return ($P282)
.end


.namespace ["Program"]
.sub "_init_"  :subid("27_1267109905.03337") :method :outer("12_1267109905.03337")
    .param pmc param_286
    .param pmc param_287
# .annotate "line", 107
    new $P285, 'ExceptionHandler'
    set_addr $P285, control_284
    $P285."handle_types"(58)
    push_eh $P285
    .lex "self", self
    .lex "@pos", param_286
    .lex "%named", param_287
# .annotate "line", 108
    get_hll_global $P288, "DependencyQueue"
    $P289 = $P288."new"()
    find_lex $P290, "self"
    setattribute $P290, "$!at_exit_queue", $P289
# .annotate "line", 109
    get_hll_global $P291, "DependencyQueue"
    $P292 = $P291."new"()
    find_lex $P293, "self"
    setattribute $P293, "$!at_init_queue", $P292
# .annotate "line", 110
    get_hll_global $P294, "DependencyQueue"
    $P295 = $P294."new"()
    find_lex $P296, "self"
    setattribute $P296, "$!at_load_queue", $P295
# .annotate "line", 112
    find_lex $P297, "self"
    find_lex $P298, "@pos"
    find_lex $P299, "%named"
    $P300 = $P297."_init_args_"($P298, $P299)
# .annotate "line", 107
    .return ($P300)
  control_284:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P301, exception, "payload"
    .return ($P301)
.end


.namespace ["Program"]
.sub "main"  :subid("28_1267109905.03337") :method :outer("12_1267109905.03337")
    .param pmc param_305
# .annotate "line", 115
    new $P304, 'ExceptionHandler'
    set_addr $P304, control_303
    $P304."handle_types"(58)
    push_eh $P304
    .lex "self", self
    .lex "@args", param_305
# .annotate "line", 116
    new $P306, "Undef"
    .lex "&main", $P306
    new $P307, "String"
    assign $P307, "main"
    set $S308, $P307
    get_hll_global $P309, $S308
    store_lex "&main", $P309
# .annotate "line", 118
    find_lex $P311, "&main"
    isnull $I312, $P311
    unless $I312, if_310_end
# .annotate "line", 119
    "die"("You must override the '.main' method of your program class.")
  if_310_end:
# .annotate "line", 122
    find_lex $P313, "&main"
    find_lex $P314, "@args"
    $P315 = $P313($P314)
# .annotate "line", 115
    .return ($P315)
  control_303:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P316, exception, "payload"
    .return ($P316)
.end


.namespace ["Program"]
.sub "process_queue"  :subid("29_1267109905.03337") :method :outer("12_1267109905.03337")
    .param pmc param_320
    .param pmc param_321 :named("name")
# .annotate "line", 125
    new $P319, 'ExceptionHandler'
    set_addr $P319, control_318
    $P319."handle_types"(58)
    push_eh $P319
    .lex "self", self
    .lex "$queue", param_320
    .lex "$name", param_321
# .annotate "line", 126
    new $P322, "Undef"
    .lex "$callee", $P322
# .annotate "line", 125
    find_lex $P323, "$callee"
# .annotate "line", 128
    new $P345, 'ExceptionHandler'
    set_addr $P345, loop344_handler
    $P345."handle_types"(65, 67, 66)
    push_eh $P345
  loop344_test:
    find_lex $P324, "$queue"
    $P325 = $P324."is_empty"()
    isfalse $I326, $P325
    unless $I326, loop344_done
  loop344_redo:
# .annotate "line", 129
    find_lex $P327, "$queue"
    $P328 = $P327."next_entry"()
    store_lex "$callee", $P328
# .annotate "line", 131
    find_lex $P330, "$callee"
    $P331 = $P330."isa"("String")
    unless $P331, if_329_end
# .annotate "line", 130
    get_hll_global $P332, ["Parrot"], "get_hll_global"
    find_lex $P333, "$callee"
    $P334 = $P332($P333)
    store_lex "$callee", $P334
  if_329_end:
# .annotate "line", 134
    find_lex $P336, "$callee"
    isnull $I337, $P336
    unless $I337, if_335_end
# .annotate "line", 133
    new $P338, 'String'
    set $P338, "Got null callee while processing "
    find_lex $P339, "$name"
    concat $P340, $P338, $P339
    concat $P341, $P340, " queue"
    "die"($P341)
  if_335_end:
# .annotate "line", 136
    find_lex $P342, "$callee"
    find_lex $P343, "self"
    $P342($P343)
  loop344_next:
# .annotate "line", 128
    goto loop344_test
  loop344_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P346, exception, 'type'
    eq $P346, 65, loop344_next
    eq $P346, 67, loop344_redo
  loop344_done:
    pop_eh 
# .annotate "line", 139
    find_lex $P347, "$queue"
    $P348 = $P347."reset"()
# .annotate "line", 125
    .return ($P348)
  control_318:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P349, exception, "payload"
    .return ($P349)
.end


.namespace ["Program"]
.sub "run"  :subid("30_1267109905.03337") :method :outer("12_1267109905.03337")
    .param pmc param_353 :slurpy
# .annotate "line", 142
    .const 'Sub' $P463 = "32_1267109905.03337" 
    capture_lex $P463
    .const 'Sub' $P419 = "31_1267109905.03337" 
    capture_lex $P419
    new $P352, 'ExceptionHandler'
    set_addr $P352, control_351
    $P352."handle_types"(58)
    push_eh $P352
    .lex "self", self
    .lex "@args", param_353
# .annotate "line", 158
    new $P354, "Undef"
    .lex "$*PROGRAM_NAME", $P354
# .annotate "line", 161
    new $P355, "ResizablePMCArray"
    .lex "@*ARGS", $P355
# .annotate "line", 163
    new $P356, "Hash"
    .lex "%*ENV", $P356
# .annotate "line", 164
    new $P357, "Undef"
    .lex "$*EXECUTABLE_NAME", $P357
# .annotate "line", 165
    new $P358, "Undef"
    .lex "$*PID", $P358
# .annotate "line", 167
    new $P359, "Undef"
    .lex "$?PERL", $P359
# .annotate "line", 168
    new $P360, "Undef"
    .lex "$?VM", $P360
# .annotate "line", 172
    new $P361, "Undef"
    .lex "$i", $P361
# .annotate "line", 173
    new $P362, "Hash"
    .lex "%*VM", $P362
# .annotate "line", 174
    new $P363, "Undef"
    .lex "$interp", $P363
# .annotate "line", 189
    new $P364, "Undef"
    .lex "$fh", $P364
# .annotate "line", 190
    new $P365, "Hash"
    .lex "%save_fh", $P365
# .annotate "line", 192
    new $P366, "Undef"
    .lex "$*ERR", $P366
# .annotate "line", 198
    new $P367, "Undef"
    .lex "$*IN", $P367
# .annotate "line", 204
    new $P368, "Undef"
    .lex "$*OUT", $P368
# .annotate "line", 210
    new $P369, "Undef"
    .lex "$exception", $P369
# .annotate "line", 143
    find_lex $P375, "@args"
    $N376 = $P375."elems"()
    iseq $I377, $N376, 1.0
    if $I377, if_374
    new $P373, 'Integer'
    set $P373, $I377
    goto if_374_end
  if_374:
# .annotate "line", 144
    find_lex $P378, "@args"
    unless_null $P378, vivify_50
    new $P378, "ResizablePMCArray"
  vivify_50:
    set $P379, $P378[0]
    unless_null $P379, vivify_51
    new $P379, "Undef"
  vivify_51:
    $P380 = $P379."isa"("String")
    isfalse $I381, $P380
    new $P373, 'Integer'
    set $P373, $I381
  if_374_end:
    if $P373, if_372
    set $P371, $P373
    goto if_372_end
  if_372:
# .annotate "line", 145
    find_lex $P382, "@args"
    unless_null $P382, vivify_52
    new $P382, "ResizablePMCArray"
  vivify_52:
    set $P383, $P382[0]
    unless_null $P383, vivify_53
    new $P383, "Undef"
  vivify_53:
    $P384 = $P383."does"("array")
    set $P371, $P384
  if_372_end:
    unless $P371, if_370_end
# .annotate "line", 146
    find_lex $P385, "@args"
    $P386 = $P385."shift"()
    store_lex "@args", $P386
  if_370_end:
# .annotate "line", 149
    find_lex $P388, "@args"
    if $P388, if_387
# .annotate "line", 153
    find_lex $P391, "self"
    getattribute $P392, $P391, "@!args"
    unless_null $P392, vivify_54
    new $P392, "ResizablePMCArray"
  vivify_54:
    store_lex "@args", $P392
# .annotate "line", 152
    goto if_387_end
  if_387:
# .annotate "line", 150
    find_lex $P389, "@args"
    find_lex $P390, "self"
    setattribute $P390, "@!args", $P389
  if_387_end:
# .annotate "line", 156
    find_lex $P393, "@args"
    $P394 = $P393."clone"()
    store_lex "@args", $P394
# .annotate "line", 158
    find_lex $P397, "@args"
    $P398 = $P397."elems"()
    if $P398, if_396
    new $P401, "String"
    assign $P401, "<anonymous>"
    set $P395, $P401
    goto if_396_end
  if_396:
# .annotate "line", 159
    find_lex $P399, "@args"
    $P400 = $P399."shift"()
    set $P395, $P400
  if_396_end:
    store_lex "$*PROGRAM_NAME", $P395
# .annotate "line", 161
    find_lex $P402, "@args"
    store_lex "@*ARGS", $P402
# .annotate "line", 163
    find_lex $P403, "self"
    getattribute $P404, $P403, "%!env"
    unless_null $P404, vivify_55
    new $P404, "Hash"
  vivify_55:
    store_lex "%*ENV", $P404
# .annotate "line", 164
    find_lex $P405, "self"
    getattribute $P406, $P405, "$!executable"
    unless_null $P406, vivify_56
    new $P406, "Undef"
  vivify_56:
    store_lex "$*EXECUTABLE_NAME", $P406
# .annotate "line", 165
    find_lex $P407, "self"
    getattribute $P408, $P407, "$!process_id"
    unless_null $P408, vivify_57
    new $P408, "Undef"
  vivify_57:
    store_lex "$*PID", $P408
# .annotate "line", 167
    new $P409, "String"
    assign $P409, "nqp-rx"
    store_lex "$?PERL", $P409
# .annotate "line", 168
    new $P410, "String"
    assign $P410, "parrot"
    store_lex "$?VM", $P410
# .annotate "line", 172
    new $P411, "Integer"
    assign $P411, 0
    store_lex "$i", $P411
    find_lex $P412, "%*VM"
    unless_null $P412, vivify_58
    get_hll_global $P412, "%VM"
    unless_null $P412, vivify_59
    die "Contextual %*VM not found"
  vivify_59:
  vivify_58:
# .annotate "line", 174
    getinterp $P413
    store_lex "$interp", $P413
# .annotate "line", 176
    new $P415, "ResizablePMCArray"
    push $P415, "classname"
    push $P415, "compreg"
    push $P415, "argv"
    push $P415, "nci_funcs"
    push $P415, "interpreter"
    push $P415, "dyn_libs"
    push $P415, "config"
    push $P415, "lib_paths"
    push $P415, "pbc_libs"
    push $P415, "executable"
    defined $I416, $P415
    unless $I416, for_undef_60
    iter $P414, $P415
    new $P430, 'ExceptionHandler'
    set_addr $P430, loop429_handler
    $P430."handle_types"(65, 67, 66)
    push_eh $P430
  loop429_test:
    unless $P414, loop429_done
    shift $P417, $P414
  loop429_redo:
# .annotate "line", 185
    .const 'Sub' $P419 = "31_1267109905.03337" 
    capture_lex $P419
    $P419($P417)
  loop429_next:
    goto loop429_test
  loop429_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P431, exception, 'type'
    eq $P431, 65, loop429_next
    eq $P431, 67, loop429_redo
  loop429_done:
    pop_eh 
  for_undef_60:
# .annotate "line", 176
    find_lex $P432, "$fh"
    find_lex $P433, "%save_fh"
# .annotate "line", 192
    getstderr $P434
    store_lex "$*ERR", $P434
# .annotate "line", 193
    find_lex $P436, "self"
    getattribute $P437, $P436, "$!stderr"
    unless_null $P437, vivify_65
    new $P437, "Undef"
  vivify_65:
    defined $I438, $P437
    unless $I438, if_435_end
# .annotate "line", 194
    find_lex $P439, "$*ERR"
    unless_null $P439, vivify_66
    get_hll_global $P439, "$ERR"
    unless_null $P439, vivify_67
    die "Contextual $*ERR not found"
  vivify_67:
  vivify_66:
    find_lex $P440, "%save_fh"
    unless_null $P440, vivify_68
    new $P440, "Hash"
    store_lex "%save_fh", $P440
  vivify_68:
    set $P440["stderr"], $P439
# .annotate "line", 195
    find_lex $P441, "self"
    getattribute $P442, $P441, "$!stderr"
    unless_null $P442, vivify_69
    new $P442, "Undef"
  vivify_69:
    store_lex "$*ERR", $P442
    setstderr $P442
  if_435_end:
# .annotate "line", 198
    getstdin $P443
    store_lex "$*IN", $P443
# .annotate "line", 199
    find_lex $P445, "self"
    getattribute $P446, $P445, "$!stdin"
    unless_null $P446, vivify_70
    new $P446, "Undef"
  vivify_70:
    defined $I447, $P446
    unless $I447, if_444_end
# .annotate "line", 200
    find_lex $P448, "$*IN"
    unless_null $P448, vivify_71
    get_hll_global $P448, "$IN"
    unless_null $P448, vivify_72
    die "Contextual $*IN not found"
  vivify_72:
  vivify_71:
    find_lex $P449, "%save_fh"
    unless_null $P449, vivify_73
    new $P449, "Hash"
    store_lex "%save_fh", $P449
  vivify_73:
    set $P449["stdin"], $P448
# .annotate "line", 201
    find_lex $P450, "self"
    getattribute $P451, $P450, "$!stdin"
    unless_null $P451, vivify_74
    new $P451, "Undef"
  vivify_74:
    store_lex "$*IN", $P451
    setstdin $P451
  if_444_end:
# .annotate "line", 204
    getstdout $P452
    store_lex "$*OUT", $P452
# .annotate "line", 205
    find_lex $P454, "self"
    getattribute $P455, $P454, "$!stdout"
    unless_null $P455, vivify_75
    new $P455, "Undef"
  vivify_75:
    defined $I456, $P455
    unless $I456, if_453_end
# .annotate "line", 206
    find_lex $P457, "$*OUT"
    unless_null $P457, vivify_76
    get_hll_global $P457, "$OUT"
    unless_null $P457, vivify_77
    die "Contextual $*OUT not found"
  vivify_77:
  vivify_76:
    find_lex $P458, "%save_fh"
    unless_null $P458, vivify_78
    new $P458, "Hash"
    store_lex "%save_fh", $P458
  vivify_78:
    set $P458["stdout"], $P457
# .annotate "line", 207
    find_lex $P459, "self"
    getattribute $P460, $P459, "$!stdout"
    unless_null $P460, vivify_79
    new $P460, "Undef"
  vivify_79:
    store_lex "$*OUT", $P460
    setstdout $P460
  if_453_end:
# .annotate "line", 205
    find_lex $P461, "$exception"
# .annotate "line", 212
    .const 'Sub' $P463 = "32_1267109905.03337" 
    capture_lex $P463
    $P463()
# .annotate "line", 225
    find_lex $P490, "%save_fh"
    $P491 = $P490."contains"("stderr")
    unless $P491, if_489_end
    find_lex $P492, "%save_fh"
    unless_null $P492, vivify_80
    new $P492, "Hash"
  vivify_80:
    set $P493, $P492["stderr"]
    unless_null $P493, vivify_81
    new $P493, "Undef"
  vivify_81:
    setstderr $P493
  if_489_end:
# .annotate "line", 226
    find_lex $P495, "%save_fh"
    $P496 = $P495."contains"("stdin")
    unless $P496, if_494_end
    find_lex $P497, "%save_fh"
    unless_null $P497, vivify_82
    new $P497, "Hash"
  vivify_82:
    set $P498, $P497["stdin"]
    unless_null $P498, vivify_83
    new $P498, "Undef"
  vivify_83:
    setstdin $P498
  if_494_end:
# .annotate "line", 227
    find_lex $P500, "%save_fh"
    $P501 = $P500."contains"("stdout")
    unless $P501, if_499_end
    find_lex $P502, "%save_fh"
    unless_null $P502, vivify_84
    new $P502, "Hash"
  vivify_84:
    set $P503, $P502["stdout"]
    unless_null $P503, vivify_85
    new $P503, "Undef"
  vivify_85:
    setstdout $P503
  if_499_end:
# .annotate "line", 229
    find_lex $P504, "self"
    $P505 = $P504."do_exit"()
    find_lex $P506, "self"
    setattribute $P506, "$!exit_value", $P505
# .annotate "line", 142
    .return ($P505)
  control_351:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P507, exception, "payload"
    .return ($P507)
.end


.namespace ["Program"]
.sub "_block418"  :anon :subid("31_1267109905.03337") :outer("30_1267109905.03337")
    .param pmc param_420
# .annotate "line", 185
    .lex "$_", param_420
# .annotate "line", 186
    find_lex $P421, "$i"
    clone $P422, $P421
    inc $P421
    set $I423, $P422
    find_lex $P424, "$interp"
    unless_null $P424, vivify_61
    new $P424, "ResizablePMCArray"
  vivify_61:
    set $P425, $P424[$I423]
    unless_null $P425, vivify_62
    new $P425, "Undef"
  vivify_62:
    find_lex $P426, "$_"
    set $S427, $P426
    find_dynamic_lex $P428, "%*VM"
    unless_null $P428, vivify_63
    get_hll_global $P428, "%VM"
    unless_null $P428, vivify_64
    die "Contextual %*VM not found"
  vivify_64:
    store_dynamic_lex "%*VM", $P428
  vivify_63:
    set $P428[$S427], $P425
# .annotate "line", 185
    .return ($P425)
.end


.namespace ["Program"]
.sub "_block462"  :anon :subid("32_1267109905.03337") :outer("30_1267109905.03337")
# .annotate "line", 212
    .const 'Sub' $P472 = "33_1267109905.03337" 
    capture_lex $P472
    new $P468, 'ExceptionHandler'
    set_addr $P468, control_467
    $P468."handle_types_except"(58, 59, 60, 61, 63, 64, 65, 66, 67)
    push_eh $P468
# .annotate "line", 213
    find_lex $P464, "self"
    find_lex $P465, "@args"
    $P464."main"($P465)
# .annotate "line", 212
    pop_eh 
    goto skip_handler_466
  control_467:
# .annotate "line", 215
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P472 = "33_1267109905.03337" 
    capture_lex $P472
    $P472(exception)
    new $P487, 'Integer'
    set $P487, 1
    set exception["handled"], $P487
    set $I488, exception["handled"]
    ne $I488, 1, nothandled_470
  handled_469:
    .return (exception)
  nothandled_470:
    rethrow exception
  skip_handler_466:
# .annotate "line", 212
    .return ()
.end


.namespace ["Program"]
.sub "_block471"  :anon :subid("33_1267109905.03337") :outer("32_1267109905.03337")
    .param pmc param_473
# .annotate "line", 215
    .lex "$_", param_473
    find_lex $P474, "$_"
    .lex "$!", $P474
# .annotate "line", 216
    find_lex $P477, "$!"
    $N478 = $P477."type"()
    get_hll_global $P479, ["Exception"], "ProgramExit"
    $N480 = $P479."type"()
    iseq $I481, $N478, $N480
    if $I481, if_476
# .annotate "line", 220
    find_lex $P485, "$!"
    $P486 = $P485."rethrow"()
# .annotate "line", 219
    set $P475, $P486
# .annotate "line", 216
    goto if_476_end
  if_476:
# .annotate "line", 217
    find_lex $P482, "$!"
    $P483 = $P482."payload"()
    find_lex $P484, "self"
    setattribute $P484, "$!exit_value", $P483
# .annotate "line", 216
    set $P475, $P483
  if_476_end:
# .annotate "line", 215
    .return ($P475)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109944.46396")
# .annotate "line", 0
    get_hll_global $P36, ["UnitTest";"Listener";"TAP"], "_block35" 
    capture_lex $P36
    get_hll_global $P14, ["UnitTest";"Listener"], "_block13" 
    capture_lex $P14
# .annotate "line", 4
    get_hll_global $P14, ["UnitTest";"Listener"], "_block13" 
    capture_lex $P14
    $P14()
# .annotate "line", 12
    get_hll_global $P36, ["UnitTest";"Listener";"TAP"], "_block35" 
    capture_lex $P36
    $P122 = $P36()
# .annotate "line", 1
    .return ($P122)
.end


.namespace []
.sub "" :load :init :subid("post24") :outer("10_1267109944.46396")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1267109944.46396" 
    .local pmc block
    set block, $P12
    $P123 = get_root_global ["parrot"], "P6metaclass"
    $P123."new_class"("UnitTest::Listener")
    $P124 = get_root_global ["parrot"], "P6metaclass"
    $P124."new_class"("UnitTest::Listener::TAP", "UnitTest::Listener" :named("parent"))
.end


.namespace ["UnitTest";"Listener"]
.sub "_block13"  :subid("11_1267109944.46396") :outer("10_1267109944.46396")
# .annotate "line", 4
    .const 'Sub' $P30 = "15_1267109944.46396" 
    capture_lex $P30
    .const 'Sub' $P25 = "14_1267109944.46396" 
    capture_lex $P25
    .const 'Sub' $P20 = "13_1267109944.46396" 
    capture_lex $P20
    .const 'Sub' $P15 = "12_1267109944.46396" 
    capture_lex $P15
# .annotate "line", 8
    .const 'Sub' $P30 = "15_1267109944.46396" 
    capture_lex $P30
# .annotate "line", 4
    .return ($P30)
.end


.namespace ["UnitTest";"Listener"]
.sub "add_error"  :subid("12_1267109944.46396") :method :outer("11_1267109944.46396")
    .param pmc param_18
# .annotate "line", 5
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
    .lex "$failure", param_18
    .return ()
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P19, exception, "payload"
    .return ($P19)
.end


.namespace ["UnitTest";"Listener"]
.sub "add_failure"  :subid("13_1267109944.46396") :method :outer("11_1267109944.46396")
    .param pmc param_23
# .annotate "line", 6
    new $P22, 'ExceptionHandler'
    set_addr $P22, control_21
    $P22."handle_types"(58)
    push_eh $P22
    .lex "self", self
    .lex "$failure", param_23
    .return ()
  control_21:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P24, exception, "payload"
    .return ($P24)
.end


.namespace ["UnitTest";"Listener"]
.sub "end_test"  :subid("14_1267109944.46396") :method :outer("11_1267109944.46396")
    .param pmc param_28
# .annotate "line", 7
    new $P27, 'ExceptionHandler'
    set_addr $P27, control_26
    $P27."handle_types"(58)
    push_eh $P27
    .lex "self", self
    .lex "$test", param_28
    .return ()
  control_26:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P29, exception, "payload"
    .return ($P29)
.end


.namespace ["UnitTest";"Listener"]
.sub "start_test"  :subid("15_1267109944.46396") :method :outer("11_1267109944.46396")
    .param pmc param_33
# .annotate "line", 8
    new $P32, 'ExceptionHandler'
    set_addr $P32, control_31
    $P32."handle_types"(58)
    push_eh $P32
    .lex "self", self
    .lex "$test", param_33
    .return ()
  control_31:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P34, exception, "payload"
    .return ($P34)
.end


.namespace ["UnitTest";"Listener";"TAP"]
.sub "_block35"  :subid("16_1267109944.46396") :outer("10_1267109944.46396")
# .annotate "line", 12
    .const 'Sub' $P113 = "23_1267109944.46396" 
    capture_lex $P113
    .const 'Sub' $P91 = "21_1267109944.46396" 
    capture_lex $P91
    .const 'Sub' $P73 = "20_1267109944.46396" 
    capture_lex $P73
    .const 'Sub' $P62 = "19_1267109944.46396" 
    capture_lex $P62
    .const 'Sub' $P45 = "18_1267109944.46396" 
    capture_lex $P45
    .const 'Sub' $P37 = "17_1267109944.46396" 
    capture_lex $P37
# .annotate "line", 56
    .const 'Sub' $P113 = "23_1267109944.46396" 
    capture_lex $P113
# .annotate "line", 12
    .return ($P113)
.end


.namespace ["UnitTest";"Listener";"TAP"]
.sub "" :load :init :subid("post25") :outer("16_1267109944.46396")
# .annotate "line", 12
    get_hll_global $P36, ["UnitTest";"Listener";"TAP"], "_block35" 
    .local pmc block
    set block, $P36
# .annotate "line", 13
    load_bytecode "Test/Builder.pbc"
# .annotate "line", 15
    "use"("P6metaclass")
# .annotate "line", 17
    "has"("$!test_builder")
.end


.namespace ["UnitTest";"Listener";"TAP"]
.sub "add_error"  :subid("17_1267109944.46396") :method :outer("16_1267109944.46396")
    .param pmc param_40
# .annotate "line", 20
    new $P39, 'ExceptionHandler'
    set_addr $P39, control_38
    $P39."handle_types"(58)
    push_eh $P39
    .lex "self", self
    .lex "$failure", param_40
# .annotate "line", 21
    find_lex $P41, "self"
    find_lex $P42, "$failure"
    $P43 = $P41."add_failure"($P42)
# .annotate "line", 20
    .return ($P43)
  control_38:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P44, exception, "payload"
    .return ($P44)
.end


.namespace ["UnitTest";"Listener";"TAP"]
.sub "add_failure"  :subid("18_1267109944.46396") :method :outer("16_1267109944.46396")
    .param pmc param_48
# .annotate "line", 24
    new $P47, 'ExceptionHandler'
    set_addr $P47, control_46
    $P47."handle_types"(58)
    push_eh $P47
    .lex "self", self
    .lex "$failure", param_48
# .annotate "line", 25
    find_lex $P49, "self"
    $P50 = $P49."test_builder"()
    find_lex $P51, "self"
    find_lex $P52, "$failure"
    $P53 = $P52."test_case"()
    $P54 = $P51."get_test_label"($P53)
    $P50."ok"(0, $P54)
# .annotate "line", 26
    find_lex $P55, "self"
    $P56 = $P55."test_builder"()
    find_lex $P57, "$failure"
    $P58 = $P57."fault"()
    $P59 = $P58."message"()
    $P56."diag"($P59)
    find_lex $P60, "self"
# .annotate "line", 24
    .return ($P60)
  control_46:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P61, exception, "payload"
    .return ($P61)
.end


.namespace ["UnitTest";"Listener";"TAP"]
.sub "end_test"  :subid("19_1267109944.46396") :method :outer("16_1267109944.46396")
    .param pmc param_65
# .annotate "line", 30
    new $P64, 'ExceptionHandler'
    set_addr $P64, control_63
    $P64."handle_types"(58)
    push_eh $P64
    .lex "self", self
    .lex "$test", param_65
# .annotate "line", 31
    find_lex $P66, "self"
    $P67 = $P66."test_builder"()
    find_lex $P68, "self"
    find_lex $P69, "$test"
    $P70 = $P68."get_test_label"($P69)
    $P67."ok"(1, $P70)
    find_lex $P71, "self"
# .annotate "line", 30
    .return ($P71)
  control_63:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P72, exception, "payload"
    .return ($P72)
.end


.namespace ["UnitTest";"Listener";"TAP"]
.sub "get_test_label"  :subid("20_1267109944.46396") :method :outer("16_1267109944.46396")
    .param pmc param_76
# .annotate "line", 35
    new $P75, 'ExceptionHandler'
    set_addr $P75, control_74
    $P75."handle_types"(58)
    push_eh $P75
    .lex "self", self
    .lex "$test", param_76
# .annotate "line", 36
    find_lex $P79, "$test"
    $P80 = $P79."verify"()
    if $P80, if_78
# .annotate "line", 39
    find_lex $P85, "$test"
    $P86 = $P85."name"()
    if $P86, if_84
# .annotate "line", 42
    new $P89, "String"
    assign $P89, ""
    set $P83, $P89
# .annotate "line", 39
    goto if_84_end
  if_84:
# .annotate "line", 40
    find_lex $P87, "$test"
    $P88 = $P87."name"()
# .annotate "line", 39
    set $P83, $P88
  if_84_end:
    set $P77, $P83
# .annotate "line", 36
    goto if_78_end
  if_78:
# .annotate "line", 37
    find_lex $P81, "$test"
    $P82 = $P81."verify"()
# .annotate "line", 36
    set $P77, $P82
  if_78_end:
# .annotate "line", 35
    .return ($P77)
  control_74:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P90, exception, "payload"
    .return ($P90)
.end


.namespace ["UnitTest";"Listener";"TAP"]
.sub "_init_"  :subid("21_1267109944.46396") :method :outer("16_1267109944.46396")
    .param pmc param_94
    .param pmc param_95
# .annotate "line", 47
    .const 'Sub' $P105 = "22_1267109944.46396" 
    capture_lex $P105
    new $P93, 'ExceptionHandler'
    set_addr $P93, control_92
    $P93."handle_types"(58)
    push_eh $P93
    .lex "self", self
    .lex "@pos", param_94
    .lex "%named", param_95
# .annotate "line", 48
    find_lex $P96, "self"
    find_lex $P97, "@pos"
    find_lex $P98, "%named"
    $P96."_init_args_"($P97, $P98)
# .annotate "line", 50
    find_lex $P101, "self"
    $P102 = $P101."test_builder"()
    defined $I103, $P102
    unless $I103, unless_100
    new $P99, 'Integer'
    set $P99, $I103
    goto unless_100_end
  unless_100:
    .const 'Sub' $P105 = "22_1267109944.46396" 
    capture_lex $P105
    $P111 = $P105()
    set $P99, $P111
  unless_100_end:
# .annotate "line", 47
    .return ($P99)
  control_92:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["UnitTest";"Listener";"TAP"]
.sub "_block104"  :anon :subid("22_1267109944.46396") :outer("21_1267109944.46396")
# .annotate "line", 51
    new $P106, "Undef"
    .lex "$tb", $P106
 $P107 = new [ 'Test'; 'Builder' ] 
    store_lex "$tb", $P107
# .annotate "line", 52
    find_lex $P108, "self"
    find_lex $P109, "$tb"
    $P110 = $P108."test_builder"($P109)
# .annotate "line", 50
    .return ($P110)
.end


.namespace ["UnitTest";"Listener";"TAP"]
.sub "plan_tests"  :subid("23_1267109944.46396") :method :outer("16_1267109944.46396")
    .param pmc param_116
# .annotate "line", 56
    new $P115, 'ExceptionHandler'
    set_addr $P115, control_114
    $P115."handle_types"(58)
    push_eh $P115
    .lex "self", self
    .lex "$num_tests", param_116
# .annotate "line", 57
    find_lex $P117, "self"
    $P118 = $P117."test_builder"()
    find_lex $P119, "$num_tests"
    $P120 = $P118."plan"($P119)
# .annotate "line", 56
    .return ($P120)
  control_114:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, "payload"
    .return ($P121)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109935.69383")
# .annotate "line", 0
    get_hll_global $P14, ["UnitTest";"Loader"], "_block13" 
    capture_lex $P14
# .annotate "line", 5
    get_hll_global $P14, ["UnitTest";"Loader"], "_block13" 
    capture_lex $P14
    $P174 = $P14()
# .annotate "line", 1
    .return ($P174)
.end


.namespace ["UnitTest";"Loader"]
.sub "_block13"  :subid("11_1267109935.69383") :outer("10_1267109935.69383")
# .annotate "line", 5
    .const 'Sub' $P152 = "19_1267109935.69383" 
    capture_lex $P152
    .const 'Sub' $P117 = "18_1267109935.69383" 
    capture_lex $P117
    .const 'Sub' $P58 = "15_1267109935.69383" 
    capture_lex $P58
    .const 'Sub' $P51 = "14_1267109935.69383" 
    capture_lex $P51
    .const 'Sub' $P15 = "12_1267109935.69383" 
    capture_lex $P15
# .annotate "line", 71
    .const 'Sub' $P152 = "19_1267109935.69383" 
    capture_lex $P152
# .annotate "line", 5
    .return ($P152)
.end


.namespace ["UnitTest";"Loader"]
.sub "" :load :init :subid("post20") :outer("11_1267109935.69383")
# .annotate "line", 5
    get_hll_global $P14, ["UnitTest";"Loader"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 6
    "use"("P6metaclass")
# .annotate "line", 8
    "has"("%!seen_methods")
.end


.namespace ["UnitTest";"Loader"]
.sub "configure_suite"  :subid("12_1267109935.69383") :method :outer("11_1267109935.69383")
    .param pmc param_18
    .param pmc param_19
    .param pmc param_20 :optional :named("suite")
    .param int has_param_20 :opt_flag
# .annotate "line", 11
    .const 'Sub' $P38 = "13_1267109935.69383" 
    capture_lex $P38
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
    .lex "$class", param_18
    .lex "@tests", param_19
    if has_param_20, optparam_21
    new $P21, "Undef"
    set param_20, $P21
  optparam_21:
    .lex "$suite", param_20
# .annotate "line", 16
    new $P22, "Undef"
    .lex "$proto", $P22
# .annotate "line", 12
    find_lex $P24, "$suite"
    $P25 = $P24."defined"()
    if $P25, unless_23_end
# .annotate "line", 13
    find_lex $P26, "self"
    $P27 = $P26."default_suite"()
    store_lex "$suite", $P27
  unless_23_end:
# .annotate "line", 16
    new $P28, "String"
    assign $P28, "metaclass"
    set $S29, $P28
    find_lex $P30, "$class"
    getprop $P31, $S29, $P30
    $P32 = $P31."WHAT"()
    store_lex "$proto", $P32
# .annotate "line", 18
    find_lex $P34, "@tests"
    defined $I35, $P34
    unless $I35, for_undef_22
    iter $P33, $P34
    new $P47, 'ExceptionHandler'
    set_addr $P47, loop46_handler
    $P47."handle_types"(65, 67, 66)
    push_eh $P47
  loop46_test:
    unless $P33, loop46_done
    shift $P36, $P33
  loop46_redo:
    .const 'Sub' $P38 = "13_1267109935.69383" 
    capture_lex $P38
    $P38($P36)
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
  for_undef_22:
    find_lex $P49, "$suite"
# .annotate "line", 11
    .return ($P49)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P50, exception, "payload"
    .return ($P50)
.end


.namespace ["UnitTest";"Loader"]
.sub "_block37"  :anon :subid("13_1267109935.69383") :outer("12_1267109935.69383")
    .param pmc param_39
# .annotate "line", 18
    .lex "$_", param_39
# .annotate "line", 19
    find_lex $P40, "$suite"
    find_lex $P41, "$proto"
    find_lex $P42, "$_"
    set $S43, $P42
    $P44 = $P41."new"($S43 :named("name"))
    $P45 = $P40."add_test"($P44)
# .annotate "line", 18
    .return ($P45)
.end


.namespace ["UnitTest";"Loader"]
.sub "default_suite"  :subid("14_1267109935.69383") :method :outer("11_1267109935.69383")
# .annotate "line", 25
    new $P53, 'ExceptionHandler'
    set_addr $P53, control_52
    $P53."handle_types"(58)
    push_eh $P53
    .lex "self", self
# .annotate "line", 26
    new $P54, "Exception"
    set $P54['type'], 58
    get_hll_global $P55, ["UnitTest"], "Suite"
    $P56 = $P55."new"()
    setattribute $P54, 'payload', $P56
    throw $P54
# .annotate "line", 25
    .return ()
  control_52:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P57, exception, "payload"
    .return ($P57)
.end


.namespace ["UnitTest";"Loader"]
.sub "get_test_methods"  :subid("15_1267109935.69383") :method :outer("11_1267109935.69383")
    .param pmc param_61
# .annotate "line", 29
    .const 'Sub' $P73 = "16_1267109935.69383" 
    capture_lex $P73
    new $P60, 'ExceptionHandler'
    set_addr $P60, control_59
    $P60."handle_types"(58)
    push_eh $P60
    .lex "self", self
    .lex "$class", param_61
# .annotate "line", 30
    new $P62, "ResizablePMCArray"
    .lex "@mro", $P62
# .annotate "line", 31
    new $P63, "ResizablePMCArray"
    .lex "@test_methods", $P63
# .annotate "line", 30
    find_lex $P64, "$class"
    $P65 = $P64."inspect"("all_parents")
    store_lex "@mro", $P65
# .annotate "line", 31
    get_hll_global $P66, ["Array"], "new"
    $P67 = $P66()
    store_lex "@test_methods", $P67
# .annotate "line", 33
    find_lex $P69, "@mro"
    defined $I70, $P69
    unless $I70, for_undef_23
    iter $P68, $P69
    new $P112, 'ExceptionHandler'
    set_addr $P112, loop111_handler
    $P112."handle_types"(65, 67, 66)
    push_eh $P112
  loop111_test:
    unless $P68, loop111_done
    shift $P71, $P68
  loop111_redo:
    .const 'Sub' $P73 = "16_1267109935.69383" 
    capture_lex $P73
    $P73($P71)
  loop111_next:
    goto loop111_test
  loop111_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, 'type'
    eq $P113, 65, loop111_next
    eq $P113, 67, loop111_redo
  loop111_done:
    pop_eh 
  for_undef_23:
# .annotate "line", 47
    new $P114, "Exception"
    set $P114['type'], 58
    find_lex $P115, "@test_methods"
    setattribute $P114, 'payload', $P115
    throw $P114
# .annotate "line", 29
    .return ()
  control_59:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["UnitTest";"Loader"]
.sub "_block72"  :anon :subid("16_1267109935.69383") :outer("15_1267109935.69383")
    .param pmc param_75
# .annotate "line", 33
    .const 'Sub' $P83 = "17_1267109935.69383" 
    capture_lex $P83
# .annotate "line", 34
    new $P74, "Hash"
    .lex "%methods", $P74
    .lex "$_", param_75
    find_lex $P76, "$_"
    $P77 = $P76."inspect"("methods")
    store_lex "%methods", $P77
# .annotate "line", 36
    find_lex $P79, "%methods"
    defined $I80, $P79
    unless $I80, for_undef_24
    iter $P78, $P79
    new $P109, 'ExceptionHandler'
    set_addr $P109, loop108_handler
    $P109."handle_types"(65, 67, 66)
    push_eh $P109
  loop108_test:
    unless $P78, loop108_done
    shift $P81, $P78
  loop108_redo:
    .const 'Sub' $P83 = "17_1267109935.69383" 
    capture_lex $P83
    $P83($P81)
  loop108_next:
    goto loop108_test
  loop108_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, 'type'
    eq $P110, 65, loop108_next
    eq $P110, 67, loop108_redo
  loop108_done:
    pop_eh 
  for_undef_24:
# .annotate "line", 33
    .return ($P78)
.end


.namespace ["UnitTest";"Loader"]
.sub "_block82"  :anon :subid("17_1267109935.69383") :outer("16_1267109935.69383")
    .param pmc param_85
# .annotate "line", 37
    new $P84, "Undef"
    .lex "$name", $P84
    .lex "$_", param_85
    find_lex $P86, "$_"
    set $S87, $P86
    new $P88, 'String'
    set $P88, $S87
    store_lex "$name", $P88
# .annotate "line", 39
    find_lex $P93, "self"
    find_lex $P94, "$name"
    $P95 = $P93."is_test_method"($P94)
    if $P95, if_92
    set $P91, $P95
    goto if_92_end
  if_92:
# .annotate "line", 40
    find_lex $P96, "self"
    $P97 = $P96."seen_methods"()
    find_lex $P98, "$name"
    $P99 = $P97."contains"($P98)
    isfalse $I100, $P99
    new $P91, 'Integer'
    set $P91, $I100
  if_92_end:
    if $P91, if_90
    set $P89, $P91
    goto if_90_end
  if_90:
# .annotate "line", 41
    new $P101, "Integer"
    assign $P101, 1
    find_lex $P102, "$name"
    find_lex $P103, "self"
    $P104 = $P103."seen_methods"()
    set $P104[$P102], $P101
# .annotate "line", 42
    find_lex $P105, "@test_methods"
    find_lex $P106, "$name"
    $P107 = $P105."push"($P106)
# .annotate "line", 40
    set $P89, $P107
  if_90_end:
# .annotate "line", 36
    .return ($P89)
.end


.namespace ["UnitTest";"Loader"]
.sub "is_test_method"  :subid("18_1267109935.69383") :method :outer("11_1267109935.69383")
    .param pmc param_120
# .annotate "line", 51
    new $P119, 'ExceptionHandler'
    set_addr $P119, control_118
    $P119."handle_types"(58)
    push_eh $P119
    .lex "self", self
    .lex "$name", param_120
# .annotate "line", 52
    find_lex $P124, "$name"
    $N125 = $P124."length"()
    isgt $I126, $N125, 4.0
    if $I126, if_123
    new $P122, 'Integer'
    set $P122, $I126
    goto if_123_end
  if_123:
# .annotate "line", 53
    find_lex $P127, "$name"
    $S128 = $P127."substr"(0, 4)
    iseq $I129, $S128, "test"
    new $P122, 'Integer'
    set $P122, $I129
  if_123_end:
    unless $P122, if_121_end
# .annotate "line", 55
    find_lex $P131, "$name"
    unless_null $P131, vivify_25
    new $P131, "ResizablePMCArray"
  vivify_25:
    set $P132, $P131[4]
    unless_null $P132, vivify_26
    new $P132, "Undef"
  vivify_26:
    set $S133, $P132
    iseq $I134, $S133, "_"
    unless $I134, if_130_end
# .annotate "line", 56
    new $P135, "Exception"
    set $P135['type'], 58
    new $P136, "Integer"
    assign $P136, 1
    setattribute $P135, 'payload', $P136
    throw $P135
  if_130_end:
# .annotate "line", 59
    get_hll_global $P138, ["String"], "is_cclass"
    find_lex $P139, "$name"
    $P140 = $P138("UPPERCASE", $P139, 4 :named("offset"))
    unless $P140, if_137_end
# .annotate "line", 60
    new $P141, "Exception"
    set $P141['type'], 58
    new $P142, "Integer"
    assign $P142, 1
    setattribute $P141, 'payload', $P142
    throw $P141
  if_137_end:
# .annotate "line", 63
    get_hll_global $P144, ["String"], "is_cclass"
    find_lex $P145, "$name"
    $P146 = $P144("NUMERIC", $P145, 4 :named("offset"))
    unless $P146, if_143_end
# .annotate "line", 64
    new $P147, "Exception"
    set $P147['type'], 58
    new $P148, "Integer"
    assign $P148, 1
    setattribute $P147, 'payload', $P148
    throw $P147
  if_143_end:
  if_121_end:
# .annotate "line", 68
    new $P149, "Exception"
    set $P149['type'], 58
    new $P150, "Integer"
    assign $P150, 0
    setattribute $P149, 'payload', $P150
    throw $P149
# .annotate "line", 51
    .return ()
  control_118:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P151, exception, "payload"
    .return ($P151)
.end


.namespace ["UnitTest";"Loader"]
.sub "load_tests_from_testcase"  :subid("19_1267109935.69383") :method :outer("11_1267109935.69383")
    .param pmc param_155
    .param pmc param_156 :optional :named("sort")
    .param int has_param_156 :opt_flag
    .param pmc param_158 :optional :named("suite")
    .param int has_param_158 :opt_flag
# .annotate "line", 71
    new $P154, 'ExceptionHandler'
    set_addr $P154, control_153
    $P154."handle_types"(58)
    push_eh $P154
    .lex "self", self
    .lex "$testcase", param_155
    if has_param_156, optparam_27
    new $P157, "Undef"
    set param_156, $P157
  optparam_27:
    .lex "$sort", param_156
    if has_param_158, optparam_28
    new $P159, "Undef"
    set param_158, $P159
  optparam_28:
    .lex "$suite", param_158
# .annotate "line", 72
    new $P160, "Undef"
    .lex "$class", $P160
# .annotate "line", 73
    new $P161, "ResizablePMCArray"
    .lex "@tests", $P161
# .annotate "line", 72
    get_hll_global $P162, "P6metaclass"
    find_lex $P163, "$testcase"
    $P164 = $P162."get_parrotclass"($P163)
    store_lex "$class", $P164
# .annotate "line", 73
    find_lex $P165, "self"
    find_lex $P166, "$class"
    $P167 = $P165."get_test_methods"($P166)
    store_lex "@tests", $P167
# .annotate "line", 75
    find_lex $P168, "self"
    find_lex $P169, "$class"
    find_lex $P170, "@tests"
    find_lex $P171, "$suite"
    $P172 = $P168."configure_suite"($P169, $P170, $P171 :named("suite"))
# .annotate "line", 71
    .return ($P172)
  control_153:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P173, exception, "payload"
    .return ($P173)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109949.11403")
# .annotate "line", 0
    get_hll_global $P16, ["UnitTest";"Result"], "_block15" 
    capture_lex $P16
    get_hll_global $P14, ["UnitTest";"Failure"], "_block13" 
    capture_lex $P14
# .annotate "line", 4
    get_hll_global $P14, ["UnitTest";"Failure"], "_block13" 
    capture_lex $P14
    $P14()
# .annotate "line", 16
    get_hll_global $P16, ["UnitTest";"Result"], "_block15" 
    capture_lex $P16
    $P194 = $P16()
# .annotate "line", 1
    .return ($P194)
.end


.namespace []
.sub "" :load :init :subid("post28") :outer("10_1267109949.11403")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1267109949.11403" 
    .local pmc block
    set block, $P12
    $P195 = get_root_global ["parrot"], "P6metaclass"
    $P195."new_class"("UnitTest::Result")
.end


.namespace ["UnitTest";"Failure"]
.sub "_block13"  :subid("11_1267109949.11403") :outer("10_1267109949.11403")
# .annotate "line", 4
    .return ()
.end


.namespace ["UnitTest";"Failure"]
.sub "" :load :init :subid("post29") :outer("11_1267109949.11403")
# .annotate "line", 4
    get_hll_global $P14, ["UnitTest";"Failure"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 6
    "use"("P6metaclass")
# .annotate "line", 8
    "has"("$.fault", "$.test_case")
.end


.namespace ["UnitTest";"Result"]
.sub "_block15"  :subid("12_1267109949.11403") :outer("10_1267109949.11403")
# .annotate "line", 16
    .const 'Sub' $P182 = "27_1267109949.11403" 
    capture_lex $P182
    .const 'Sub' $P176 = "26_1267109949.11403" 
    capture_lex $P176
    .const 'Sub' $P162 = "25_1267109949.11403" 
    capture_lex $P162
    .const 'Sub' $P156 = "24_1267109949.11403" 
    capture_lex $P156
    .const 'Sub' $P126 = "23_1267109949.11403" 
    capture_lex $P126
    .const 'Sub' $P118 = "22_1267109949.11403" 
    capture_lex $P118
    .const 'Sub' $P93 = "20_1267109949.11403" 
    capture_lex $P93
    .const 'Sub' $P86 = "19_1267109949.11403" 
    capture_lex $P86
    .const 'Sub' $P79 = "18_1267109949.11403" 
    capture_lex $P79
    .const 'Sub' $P71 = "17_1267109949.11403" 
    capture_lex $P71
    .const 'Sub' $P62 = "16_1267109949.11403" 
    capture_lex $P62
    .const 'Sub' $P41 = "15_1267109949.11403" 
    capture_lex $P41
    .const 'Sub' $P29 = "14_1267109949.11403" 
    capture_lex $P29
    .const 'Sub' $P17 = "13_1267109949.11403" 
    capture_lex $P17
# .annotate "line", 103
    .const 'Sub' $P182 = "27_1267109949.11403" 
    capture_lex $P182
# .annotate "line", 16
    .return ($P182)
.end


.namespace ["UnitTest";"Result"]
.sub "" :load :init :subid("post30") :outer("12_1267109949.11403")
# .annotate "line", 16
    get_hll_global $P16, ["UnitTest";"Result"], "_block15" 
    .local pmc block
    set block, $P16
# .annotate "line", 17
    "use"("P6metaclass")
# .annotate "line", 19
    "has"("@!errors", "@!failures", "@!listeners", "$.should_stop", "$.num_tests")
.end


.namespace ["UnitTest";"Result"]
.sub "add_error"  :subid("13_1267109949.11403") :method :outer("12_1267109949.11403")
    .param pmc param_20
    .param pmc param_21
# .annotate "line", 27
    new $P19, 'ExceptionHandler'
    set_addr $P19, control_18
    $P19."handle_types"(58)
    push_eh $P19
    .lex "self", self
    .lex "$test", param_20
    .lex "$error", param_21
# .annotate "line", 28
    find_lex $P22, "self"
    find_lex $P23, "$test"
    find_lex $P24, "$error"
    find_lex $P25, "self"
    $P26 = $P25."errors"()
    $P27 = $P22."add_fault"($P23, $P24, "add_error" :named("notify"), $P26 :named("queue"))
# .annotate "line", 27
    .return ($P27)
  control_18:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P28, exception, "payload"
    .return ($P28)
.end


.namespace ["UnitTest";"Result"]
.sub "add_failure"  :subid("14_1267109949.11403") :method :outer("12_1267109949.11403")
    .param pmc param_32
    .param pmc param_33
# .annotate "line", 31
    new $P31, 'ExceptionHandler'
    set_addr $P31, control_30
    $P31."handle_types"(58)
    push_eh $P31
    .lex "self", self
    .lex "$test", param_32
    .lex "$failure", param_33
# .annotate "line", 32
    find_lex $P34, "self"
    find_lex $P35, "$test"
    find_lex $P36, "$failure"
    find_lex $P37, "self"
    $P38 = $P37."failures"()
    $P39 = $P34."add_fault"($P35, $P36, "add_failure" :named("notify"), $P38 :named("queue"))
# .annotate "line", 31
    .return ($P39)
  control_30:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P40, exception, "payload"
    .return ($P40)
.end


.namespace ["UnitTest";"Result"]
.sub "add_fault"  :subid("15_1267109949.11403") :method :outer("12_1267109949.11403")
    .param pmc param_44
    .param pmc param_45
    .param pmc param_46 :optional :named("notify")
    .param int has_param_46 :opt_flag
    .param pmc param_48 :optional :named("queue")
    .param int has_param_48 :opt_flag
# .annotate "line", 35
    new $P43, 'ExceptionHandler'
    set_addr $P43, control_42
    $P43."handle_types"(58)
    push_eh $P43
    .lex "self", self
    .lex "$test", param_44
    .lex "$exception", param_45
    if has_param_46, optparam_31
    new $P47, "Undef"
    set param_46, $P47
  optparam_31:
    .lex "$notify", param_46
    if has_param_48, optparam_32
    new $P49, "Undef"
    set param_48, $P49
  optparam_32:
    .lex "$queue", param_48
# .annotate "line", 36
    new $P50, "Undef"
    .lex "$failure", $P50
    get_hll_global $P51, ["UnitTest"], "Failure"
    find_lex $P52, "$exception"
    find_lex $P53, "$test"
    $P54 = $P51."new"($P52 :named("fault"), $P53 :named("test_case"))
    store_lex "$failure", $P54
# .annotate "line", 41
    find_lex $P55, "$queue"
    find_lex $P56, "$failure"
    $P55."push"($P56)
# .annotate "line", 42
    find_lex $P57, "self"
    find_lex $P58, "$notify"
    find_lex $P59, "$failure"
    $P60 = $P57."notify_listeners"($P58, $P59)
# .annotate "line", 35
    .return ($P60)
  control_42:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P61, exception, "payload"
    .return ($P61)
.end


.namespace ["UnitTest";"Result"]
.sub "add_listener"  :subid("16_1267109949.11403") :method :outer("12_1267109949.11403")
    .param pmc param_65
# .annotate "line", 45
    new $P64, 'ExceptionHandler'
    set_addr $P64, control_63
    $P64."handle_types"(58)
    push_eh $P64
    .lex "self", self
    .lex "$listener", param_65
# .annotate "line", 46
    find_lex $P66, "self"
    $P67 = $P66."listeners"()
    find_lex $P68, "$listener"
    $P67."push"($P68)
    find_lex $P69, "self"
# .annotate "line", 45
    .return ($P69)
  control_63:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P70, exception, "payload"
    .return ($P70)
.end


.namespace ["UnitTest";"Result"]
.sub "end_test"  :subid("17_1267109949.11403") :method :outer("12_1267109949.11403")
    .param pmc param_74
# .annotate "line", 50
    new $P73, 'ExceptionHandler'
    set_addr $P73, control_72
    $P73."handle_types"(58)
    push_eh $P73
    .lex "self", self
    .lex "$test", param_74
# .annotate "line", 51
    find_lex $P75, "self"
    find_lex $P76, "$test"
    $P77 = $P75."notify_listeners"("end_test", $P76)
# .annotate "line", 50
    .return ($P77)
  control_72:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P78, exception, "payload"
    .return ($P78)
.end


.namespace ["UnitTest";"Result"]
.sub "error_count"  :subid("18_1267109949.11403") :method :outer("12_1267109949.11403")
# .annotate "line", 54
    new $P81, 'ExceptionHandler'
    set_addr $P81, control_80
    $P81."handle_types"(58)
    push_eh $P81
    .lex "self", self
# .annotate "line", 55
    find_lex $P82, "self"
    $P83 = $P82."errors"()
    $P84 = $P83."elems"()
# .annotate "line", 54
    .return ($P84)
  control_80:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P85, exception, "payload"
    .return ($P85)
.end


.namespace ["UnitTest";"Result"]
.sub "failure_count"  :subid("19_1267109949.11403") :method :outer("12_1267109949.11403")
# .annotate "line", 58
    new $P88, 'ExceptionHandler'
    set_addr $P88, control_87
    $P88."handle_types"(58)
    push_eh $P88
    .lex "self", self
# .annotate "line", 59
    find_lex $P89, "self"
    $P90 = $P89."failures"()
    $P91 = $P90."elems"()
# .annotate "line", 58
    .return ($P91)
  control_87:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P92, exception, "payload"
    .return ($P92)
.end


.namespace ["UnitTest";"Result"]
.sub "notify_listeners"  :subid("20_1267109949.11403") :method :outer("12_1267109949.11403")
    .param pmc param_96
    .param pmc param_97 :slurpy
    .param pmc param_98 :slurpy :named
# .annotate "line", 62
    .const 'Sub' $P105 = "21_1267109949.11403" 
    capture_lex $P105
    new $P95, 'ExceptionHandler'
    set_addr $P95, control_94
    $P95."handle_types"(58)
    push_eh $P95
    .lex "self", self
    .lex "$method", param_96
    .lex "@pos", param_97
    .lex "%named", param_98
# .annotate "line", 63
    find_lex $P100, "self"
    $P101 = $P100."listeners"()
    defined $I102, $P101
    unless $I102, for_undef_33
    iter $P99, $P101
    new $P114, 'ExceptionHandler'
    set_addr $P114, loop113_handler
    $P114."handle_types"(65, 67, 66)
    push_eh $P114
  loop113_test:
    unless $P99, loop113_done
    shift $P103, $P99
  loop113_redo:
    .const 'Sub' $P105 = "21_1267109949.11403" 
    capture_lex $P105
    $P105($P103)
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
  for_undef_33:
    find_lex $P116, "self"
# .annotate "line", 62
    .return ($P116)
  control_94:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, "payload"
    .return ($P117)
.end


.namespace ["UnitTest";"Result"]
.sub "_block104"  :anon :subid("21_1267109949.11403") :outer("20_1267109949.11403")
    .param pmc param_106
# .annotate "line", 63
    .lex "$_", param_106
# .annotate "line", 64
    get_hll_global $P107, ["Parrot"], "call_method_"
    find_lex $P108, "$_"
    find_lex $P109, "$method"
    find_lex $P110, "@pos"
    find_lex $P111, "%named"
    $P112 = $P107($P108, $P109, $P110, $P111)
# .annotate "line", 63
    .return ($P112)
.end


.namespace ["UnitTest";"Result"]
.sub "plan_tests"  :subid("22_1267109949.11403") :method :outer("12_1267109949.11403")
    .param pmc param_121
# .annotate "line", 70
    new $P120, 'ExceptionHandler'
    set_addr $P120, control_119
    $P120."handle_types"(58)
    push_eh $P120
    .lex "self", self
    .lex "$num_tests", param_121
# .annotate "line", 71
    find_lex $P122, "self"
    find_lex $P123, "$num_tests"
    $P124 = $P122."notify_listeners"("plan_tests", $P123)
# .annotate "line", 70
    .return ($P124)
  control_119:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P125, exception, "payload"
    .return ($P125)
.end


.namespace ["UnitTest";"Result"]
.sub "remove_listener"  :subid("23_1267109949.11403") :method :outer("12_1267109949.11403")
    .param pmc param_129
# .annotate "line", 74
    new $P128, 'ExceptionHandler'
    set_addr $P128, control_127
    $P128."handle_types"(58)
    push_eh $P128
    .lex "self", self
    .lex "$listener", param_129
# .annotate "line", 75
    new $P130, "Undef"
    .lex "$index", $P130
    new $P131, "Integer"
    assign $P131, 0
    store_lex "$index", $P131
# .annotate "line", 77
    new $P152, 'ExceptionHandler'
    set_addr $P152, loop151_handler
    $P152."handle_types"(65, 67, 66)
    push_eh $P152
  loop151_test:
    find_lex $P132, "$index"
    set $N133, $P132
    find_lex $P134, "self"
    $P135 = $P134."listeners"()
    $N136 = $P135."elems"()
    islt $I137, $N133, $N136
    unless $I137, loop151_done
  loop151_redo:
# .annotate "line", 78
    find_lex $P139, "$index"
    set $I140, $P139
    find_lex $P141, "self"
    $P142 = $P141."listeners"()
    set $P143, $P142[$I140]
    unless_null $P143, vivify_34
    new $P143, "Undef"
  vivify_34:
    find_lex $P144, "$listener"
    issame $I145, $P143, $P144
    if $I145, if_138
# .annotate "line", 81
    find_lex $P149, "$index"
    clone $P150, $P149
    inc $P149
    goto if_138_end
  if_138:
# .annotate "line", 79
    find_lex $P146, "self"
    $P147 = $P146."listeners"()
    find_lex $P148, "$index"
    $P147."delete"($P148)
  if_138_end:
  loop151_next:
# .annotate "line", 77
    goto loop151_test
  loop151_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P153, exception, 'type'
    eq $P153, 65, loop151_next
    eq $P153, 67, loop151_redo
  loop151_done:
    pop_eh 
    find_lex $P154, "self"
# .annotate "line", 74
    .return ($P154)
  control_127:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P155, exception, "payload"
    .return ($P155)
.end


.namespace ["UnitTest";"Result"]
.sub "run_count"  :subid("24_1267109949.11403") :method :outer("12_1267109949.11403")
# .annotate "line", 89
    new $P158, 'ExceptionHandler'
    set_addr $P158, control_157
    $P158."handle_types"(58)
    push_eh $P158
    .lex "self", self
# .annotate "line", 90
    find_lex $P159, "self"
    $P160 = $P159."num_tests"()
# .annotate "line", 89
    .return ($P160)
  control_157:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P161, exception, "payload"
    .return ($P161)
.end


.namespace ["UnitTest";"Result"]
.sub "start_test"  :subid("25_1267109949.11403") :method :outer("12_1267109949.11403")
    .param pmc param_165
# .annotate "line", 93
    new $P164, 'ExceptionHandler'
    set_addr $P164, control_163
    $P164."handle_types"(58)
    push_eh $P164
    .lex "self", self
    .lex "$test", param_165
# .annotate "line", 94
    find_lex $P166, "self"
    find_lex $P167, "self"
    $P168 = $P167."num_tests"()
    find_lex $P169, "$test"
    $N170 = $P169."num_tests"()
    add $P171, $P168, $N170
    $P166."num_tests"($P171)
# .annotate "line", 95
    find_lex $P172, "self"
    find_lex $P173, "$test"
    $P174 = $P172."notify_listeners"("start_test", $P173)
# .annotate "line", 93
    .return ($P174)
  control_163:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P175, exception, "payload"
    .return ($P175)
.end


.namespace ["UnitTest";"Result"]
.sub "stop"  :subid("26_1267109949.11403") :method :outer("12_1267109949.11403")
# .annotate "line", 98
    new $P178, 'ExceptionHandler'
    set_addr $P178, control_177
    $P178."handle_types"(58)
    push_eh $P178
    .lex "self", self
# .annotate "line", 99
    find_lex $P179, "self"
    $P179."should_stop"(1)
    find_lex $P180, "self"
# .annotate "line", 98
    .return ($P180)
  control_177:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P181, exception, "payload"
    .return ($P181)
.end


.namespace ["UnitTest";"Result"]
.sub "was_successful"  :subid("27_1267109949.11403") :method :outer("12_1267109949.11403")
# .annotate "line", 103
    new $P184, 'ExceptionHandler'
    set_addr $P184, control_183
    $P184."handle_types"(58)
    push_eh $P184
    .lex "self", self
# .annotate "line", 104
    find_lex $P187, "self"
    $N188 = $P187."error_count"()
    iseq $I189, $N188, 0.0
    if $I189, if_186
    new $P185, 'Integer'
    set $P185, $I189
    goto if_186_end
  if_186:
    find_lex $P190, "self"
    $N191 = $P190."failure_count"()
    iseq $I192, $N191, 0.0
    new $P185, 'Integer'
    set $P185, $I192
  if_186_end:
# .annotate "line", 103
    .return ($P185)
  control_183:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P193, exception, "payload"
    .return ($P193)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109876.63294")
# .annotate "line", 0
    get_hll_global $P14, ["UnitTest";"Suite"], "_block13" 
    capture_lex $P14
# .annotate "line", 5
    get_hll_global $P14, ["UnitTest";"Suite"], "_block13" 
    capture_lex $P14
    $P134 = $P14()
# .annotate "line", 1
    .return ($P134)
.end


.namespace ["UnitTest";"Suite"]
.sub "_block13"  :subid("11_1267109876.63294") :outer("10_1267109876.63294")
# .annotate "line", 5
    .const 'Sub' $P129 = "21_1267109876.63294" 
    capture_lex $P129
    .const 'Sub' $P121 = "20_1267109876.63294" 
    capture_lex $P121
    .const 'Sub' $P87 = "18_1267109876.63294" 
    capture_lex $P87
    .const 'Sub' $P75 = "17_1267109876.63294" 
    capture_lex $P75
    .const 'Sub' $P55 = "15_1267109876.63294" 
    capture_lex $P55
    .const 'Sub' $P46 = "14_1267109876.63294" 
    capture_lex $P46
    .const 'Sub' $P30 = "13_1267109876.63294" 
    capture_lex $P30
    .const 'Sub' $P15 = "12_1267109876.63294" 
    capture_lex $P15
# .annotate "line", 52
    .const 'Sub' $P15 = "12_1267109876.63294" 
    capture_lex $P15
    .lex "sort_cmp", $P15
# .annotate "line", 36
    find_lex $P120, "sort_cmp"
# .annotate "line", 61
    .const 'Sub' $P129 = "21_1267109876.63294" 
    capture_lex $P129
# .annotate "line", 5
    .return ($P129)
.end


.namespace ["UnitTest";"Suite"]
.sub "" :load :init :subid("post22") :outer("11_1267109876.63294")
# .annotate "line", 5
    get_hll_global $P14, ["UnitTest";"Suite"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 6
    "has"("@!members", "$.name", "$.num_tests")
.end


.namespace ["UnitTest";"Suite"]
.sub "sort_cmp"  :subid("12_1267109876.63294") :outer("11_1267109876.63294")
    .param pmc param_18
    .param pmc param_19
# .annotate "line", 52
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "$a", param_18
    .lex "$b", param_19
# .annotate "line", 53
    find_lex $P22, "$a"
    $S23 = $P22."name"()
    find_lex $P24, "$b"
    $S25 = $P24."name"()
    islt $I26, $S23, $S25
    if $I26, if_21
    new $P28, "Integer"
    assign $P28, 1
    set $P20, $P28
    goto if_21_end
  if_21:
    new $P27, "Integer"
    assign $P27, -1
    set $P20, $P27
  if_21_end:
# .annotate "line", 52
    .return ($P20)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P29, exception, "payload"
    .return ($P29)
.end


.namespace ["UnitTest";"Suite"]
.sub "add_test"  :subid("13_1267109876.63294") :method :outer("11_1267109876.63294")
    .param pmc param_33
# .annotate "line", 12
    new $P32, 'ExceptionHandler'
    set_addr $P32, control_31
    $P32."handle_types"(58)
    push_eh $P32
    .lex "self", self
    .lex "$test", param_33
# .annotate "line", 13
    find_lex $P34, "self"
    $P35 = $P34."members"()
    find_lex $P36, "$test"
    $P35."push"($P36)
# .annotate "line", 14
    find_lex $P37, "self"
    find_lex $P38, "self"
    $P39 = $P38."num_tests"()
    find_lex $P40, "$test"
    $N41 = $P40."num_tests"()
    add $P42, $P39, $N41
    $P37."num_tests"($P42)
# .annotate "line", 15
    new $P43, "Exception"
    set $P43['type'], 58
    find_lex $P44, "self"
    setattribute $P43, 'payload', $P44
    throw $P43
# .annotate "line", 12
    .return ()
  control_31:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P45, exception, "payload"
    .return ($P45)
.end


.namespace ["UnitTest";"Suite"]
.sub "add_tests"  :subid("14_1267109876.63294") :method :outer("11_1267109876.63294")
    .param pmc param_49 :slurpy
# .annotate "line", 18
    new $P48, 'ExceptionHandler'
    set_addr $P48, control_47
    $P48."handle_types"(58)
    push_eh $P48
    .lex "self", self
    .lex "@tests", param_49
# .annotate "line", 19
    find_lex $P50, "self"
    find_lex $P51, "@tests"
    $P50."add_tests_"($P51)
# .annotate "line", 20
    new $P52, "Exception"
    set $P52['type'], 58
    find_lex $P53, "self"
    setattribute $P52, 'payload', $P53
    throw $P52
# .annotate "line", 18
    .return ()
  control_47:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P54, exception, "payload"
    .return ($P54)
.end


.namespace ["UnitTest";"Suite"]
.sub "add_tests_"  :subid("15_1267109876.63294") :method :outer("11_1267109876.63294")
    .param pmc param_58
# .annotate "line", 23
    .const 'Sub' $P64 = "16_1267109876.63294" 
    capture_lex $P64
    new $P57, 'ExceptionHandler'
    set_addr $P57, control_56
    $P57."handle_types"(58)
    push_eh $P57
    .lex "self", self
    .lex "@tests", param_58
# .annotate "line", 24
    find_lex $P60, "@tests"
    defined $I61, $P60
    unless $I61, for_undef_23
    iter $P59, $P60
    new $P70, 'ExceptionHandler'
    set_addr $P70, loop69_handler
    $P70."handle_types"(65, 67, 66)
    push_eh $P70
  loop69_test:
    unless $P59, loop69_done
    shift $P62, $P59
  loop69_redo:
    .const 'Sub' $P64 = "16_1267109876.63294" 
    capture_lex $P64
    $P64($P62)
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
  for_undef_23:
# .annotate "line", 27
    new $P72, "Exception"
    set $P72['type'], 58
    find_lex $P73, "self"
    setattribute $P72, 'payload', $P73
    throw $P72
# .annotate "line", 23
    .return ()
  control_56:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P74, exception, "payload"
    .return ($P74)
.end


.namespace ["UnitTest";"Suite"]
.sub "_block63"  :anon :subid("16_1267109876.63294") :outer("15_1267109876.63294")
    .param pmc param_65
# .annotate "line", 24
    .lex "$_", param_65
# .annotate "line", 25
    find_lex $P66, "self"
    find_lex $P67, "$_"
    $P68 = $P66."add_test"($P67)
# .annotate "line", 24
    .return ($P68)
.end


.namespace ["UnitTest";"Suite"]
.sub "default_result"  :subid("17_1267109876.63294") :method :outer("11_1267109876.63294")
# .annotate "line", 30
    new $P77, 'ExceptionHandler'
    set_addr $P77, control_76
    $P77."handle_types"(58)
    push_eh $P77
    .lex "self", self
# .annotate "line", 31
    new $P78, "Undef"
    .lex "$result", $P78
    get_hll_global $P79, ["UnitTest"], "Result"
    $P80 = $P79."new"()
    store_lex "$result", $P80
# .annotate "line", 32
    find_lex $P81, "$result"
    get_hll_global $P82, ["UnitTest";"Listener"], "TAP"
    $P83 = $P82."new"()
    $P81."add_listener"($P83)
# .annotate "line", 33
    new $P84, "Exception"
    set $P84['type'], 58
    find_lex $P85, "$result"
    setattribute $P84, 'payload', $P85
    throw $P84
# .annotate "line", 30
    .return ()
  control_76:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P86, exception, "payload"
    .return ($P86)
.end


.namespace ["UnitTest";"Suite"]
.sub "run"  :subid("18_1267109876.63294") :method :outer("11_1267109876.63294")
    .param pmc param_90 :optional
    .param int has_param_90 :opt_flag
# .annotate "line", 36
    .const 'Sub' $P106 = "19_1267109876.63294" 
    capture_lex $P106
    new $P89, 'ExceptionHandler'
    set_addr $P89, control_88
    $P89."handle_types"(58)
    push_eh $P89
    .lex "self", self
    if has_param_90, optparam_24
    new $P91, "Undef"
    set param_90, $P91
  optparam_24:
    .lex "$result", param_90
# .annotate "line", 37
    find_lex $P93, "$result"
    $P94 = $P93."defined"()
    if $P94, unless_92_end
# .annotate "line", 38
    find_lex $P95, "self"
    $P96 = $P95."default_result"()
    store_lex "$result", $P96
  unless_92_end:
# .annotate "line", 41
    find_lex $P97, "$result"
    find_lex $P98, "self"
    $P99 = $P98."num_tests"()
    $P97."plan_tests"($P99)
# .annotate "line", 43
    find_lex $P101, "self"
    $P102 = $P101."members"()
    defined $I103, $P102
    unless $I103, for_undef_25
    iter $P100, $P102
    new $P116, 'ExceptionHandler'
    set_addr $P116, loop115_handler
    $P116."handle_types"(65, 67, 66)
    push_eh $P116
  loop115_test:
    unless $P100, loop115_done
    shift $P104, $P100
  loop115_redo:
    .const 'Sub' $P106 = "19_1267109876.63294" 
    capture_lex $P106
    $P106($P104)
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
  for_undef_25:
    find_lex $P118, "$result"
# .annotate "line", 36
    .return ($P118)
  control_88:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P119, exception, "payload"
    .return ($P119)
.end


.namespace ["UnitTest";"Suite"]
.sub "_block105"  :anon :subid("19_1267109876.63294") :outer("18_1267109876.63294")
    .param pmc param_107
# .annotate "line", 43
    .lex "$_", param_107
# .annotate "line", 44
    find_lex $P110, "$result"
    $P111 = $P110."should_stop"()
    unless $P111, unless_109
    set $P108, $P111
    goto unless_109_end
  unless_109:
# .annotate "line", 45
    find_lex $P112, "$_"
    find_lex $P113, "$result"
    $P114 = $P112."run"($P113)
# .annotate "line", 44
    set $P108, $P114
  unless_109_end:
# .annotate "line", 43
    .return ($P108)
.end


.namespace ["UnitTest";"Suite"]
.sub "sort"  :subid("20_1267109876.63294") :method :outer("11_1267109876.63294")
# .annotate "line", 56
    new $P123, 'ExceptionHandler'
    set_addr $P123, control_122
    $P123."handle_types"(58)
    push_eh $P123
    .lex "self", self
# .annotate "line", 57
    find_lex $P124, "self"
    $P125 = $P124."members"()
    get_hll_global $P126, ["UnitTest";"Suite"], "sort_cmp"
    $P125."sort"($P126)
    find_lex $P127, "self"
# .annotate "line", 56
    .return ($P127)
  control_122:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P128, exception, "payload"
    .return ($P128)
.end


.namespace ["UnitTest";"Suite"]
.sub "suite"  :subid("21_1267109876.63294") :method :outer("11_1267109876.63294")
# .annotate "line", 61
    new $P131, 'ExceptionHandler'
    set_addr $P131, control_130
    $P131."handle_types"(58)
    push_eh $P131
    .lex "self", self
    find_lex $P132, "self"
    .return ($P132)
  control_130:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P133, exception, "payload"
    .return ($P133)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1267109946.804")
# .annotate "line", 0
    get_hll_global $P22, ["UnitTest";"Testcase"], "_block21" 
    capture_lex $P22
    get_hll_global $P14, ["Exception";"UnitTestFailure"], "_block13" 
    capture_lex $P14
# .annotate "line", 4
    get_hll_global $P14, ["Exception";"UnitTestFailure"], "_block13" 
    capture_lex $P14
    $P14()
# .annotate "line", 10
    get_hll_global $P22, ["UnitTest";"Testcase"], "_block21" 
    capture_lex $P22
    $P237 = $P22()
# .annotate "line", 1
    .return ($P237)
.end


.namespace []
.sub "" :load :init :subid("post34") :outer("10_1267109946.804")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1267109946.804" 
    .local pmc block
    set block, $P12
    $P238 = get_root_global ["parrot"], "P6metaclass"
    $P238."new_class"("Exception::UnitTestFailure", "Exception::Wrapper" :named("parent"))
.end


.namespace ["Exception";"UnitTestFailure"]
.sub "_block13"  :subid("11_1267109946.804") :outer("10_1267109946.804")
# .annotate "line", 4
    .const 'Sub' $P15 = "12_1267109946.804" 
    capture_lex $P15
# .annotate "line", 5
    .const 'Sub' $P15 = "12_1267109946.804" 
    capture_lex $P15
# .annotate "line", 4
    .return ($P15)
.end


.namespace ["Exception";"UnitTestFailure"]
.sub "severity"  :subid("12_1267109946.804") :method :outer("11_1267109946.804")
# .annotate "line", 5
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
    get_hll_global $P18, ["Exception"], "Severity"
    $P19 = $P18."ERROR"()
    .return ($P19)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P20, exception, "payload"
    .return ($P20)
.end


.namespace ["UnitTest";"Testcase"]
.sub "_block21"  :subid("13_1267109946.804") :outer("10_1267109946.804")
# .annotate "line", 10
    .const 'Sub' $P232 = "33_1267109946.804" 
    capture_lex $P232
    .const 'Sub' $P224 = "32_1267109946.804" 
    capture_lex $P224
    .const 'Sub' $P220 = "31_1267109946.804" 
    capture_lex $P220
    .const 'Sub' $P211 = "30_1267109946.804" 
    capture_lex $P211
    .const 'Sub' $P140 = "25_1267109946.804" 
    capture_lex $P140
    .const 'Sub' $P134 = "24_1267109946.804" 
    capture_lex $P134
    .const 'Sub' $P122 = "23_1267109946.804" 
    capture_lex $P122
    .const 'Sub' $P110 = "22_1267109946.804" 
    capture_lex $P110
    .const 'Sub' $P104 = "21_1267109946.804" 
    capture_lex $P104
    .const 'Sub' $P79 = "19_1267109946.804" 
    capture_lex $P79
    .const 'Sub' $P69 = "18_1267109946.804" 
    capture_lex $P69
    .const 'Sub' $P56 = "17_1267109946.804" 
    capture_lex $P56
    .const 'Sub' $P43 = "16_1267109946.804" 
    capture_lex $P43
    .const 'Sub' $P34 = "15_1267109946.804" 
    capture_lex $P34
    .const 'Sub' $P23 = "14_1267109946.804" 
    capture_lex $P23
# .annotate "line", 32
    .const 'Sub' $P23 = "14_1267109946.804" 
    capture_lex $P23
    .lex "assert_that", $P23
# .annotate "line", 50
    .const 'Sub' $P34 = "15_1267109946.804" 
    capture_lex $P34
    .lex "fail", $P34
# .annotate "line", 54
    .const 'Sub' $P43 = "16_1267109946.804" 
    capture_lex $P43
    .lex "fail_if", $P43
# .annotate "line", 60
    .const 'Sub' $P56 = "17_1267109946.804" 
    capture_lex $P56
    .lex "fail_unless", $P56
# .annotate "line", 128
    .const 'Sub' $P69 = "18_1267109946.804" 
    capture_lex $P69
    .lex "verify_that", $P69
# .annotate "line", 24
    find_lex $P103, "assert_that"
# .annotate "line", 46
    find_lex $P131, "fail"
    find_lex $P132, "fail_if"
    find_lex $P133, "fail_unless"
# .annotate "line", 126
    find_lex $P236, "verify_that"
# .annotate "line", 10
    .return ($P236)
.end


.namespace ["UnitTest";"Testcase"]
.sub "" :load :init :subid("post35") :outer("13_1267109946.804")
# .annotate "line", 10
    get_hll_global $P22, ["UnitTest";"Testcase"], "_block21" 
    .local pmc block
    set block, $P22
# .annotate "line", 11
    "has"("$.name", "$!verify")
# .annotate "line", 15
    "export"("assert_match", "assert_that", "fail", "fail_if", "fail_unless", "verify_that")
.end


.namespace ["UnitTest";"Testcase"]
.sub "assert_that"  :subid("14_1267109946.804") :outer("13_1267109946.804")
    .param pmc param_26
    .param pmc param_27
# .annotate "line", 32
    new $P25, 'ExceptionHandler'
    set_addr $P25, control_24
    $P25."handle_types"(58)
    push_eh $P25
    .lex "$target", param_26
    .lex "$matcher", param_27
# .annotate "line", 33
    get_hll_global $P28, ["Parrot"], "get_self"
    $P29 = $P28()
    find_lex $P30, "$target"
    find_lex $P31, "$matcher"
    $P32 = $P29."assert_match"($P30, $P31)
# .annotate "line", 32
    .return ($P32)
  control_24:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P33, exception, "payload"
    .return ($P33)
.end


.namespace ["UnitTest";"Testcase"]
.sub "fail"  :subid("15_1267109946.804") :outer("13_1267109946.804")
    .param pmc param_37
# .annotate "line", 50
    new $P36, 'ExceptionHandler'
    set_addr $P36, control_35
    $P36."handle_types"(58)
    push_eh $P36
    .lex "$why", param_37
# .annotate "line", 51
    get_hll_global $P38, ["Parrot"], "get_self"
    $P39 = $P38()
    find_lex $P40, "$why"
    $P41 = $P39."_fail"($P40)
# .annotate "line", 50
    .return ($P41)
  control_35:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P42, exception, "payload"
    .return ($P42)
.end


.namespace ["UnitTest";"Testcase"]
.sub "fail_if"  :subid("16_1267109946.804") :outer("13_1267109946.804")
    .param pmc param_46
    .param pmc param_47
# .annotate "line", 54
    new $P45, 'ExceptionHandler'
    set_addr $P45, control_44
    $P45."handle_types"(58)
    push_eh $P45
    .lex "$condition", param_46
    .lex "$why", param_47
# .annotate "line", 55
    find_lex $P50, "$condition"
    if $P50, if_49
    set $P48, $P50
    goto if_49_end
  if_49:
# .annotate "line", 56
    get_hll_global $P51, ["Parrot"], "get_self"
    $P52 = $P51()
    find_lex $P53, "$why"
    $P54 = $P52."_fail"($P53)
# .annotate "line", 55
    set $P48, $P54
  if_49_end:
# .annotate "line", 54
    .return ($P48)
  control_44:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P55, exception, "payload"
    .return ($P55)
.end


.namespace ["UnitTest";"Testcase"]
.sub "fail_unless"  :subid("17_1267109946.804") :outer("13_1267109946.804")
    .param pmc param_59
    .param pmc param_60
# .annotate "line", 60
    new $P58, 'ExceptionHandler'
    set_addr $P58, control_57
    $P58."handle_types"(58)
    push_eh $P58
    .lex "$condition", param_59
    .lex "$why", param_60
# .annotate "line", 61
    find_lex $P63, "$condition"
    unless $P63, unless_62
    set $P61, $P63
    goto unless_62_end
  unless_62:
# .annotate "line", 62
    get_hll_global $P64, ["Parrot"], "get_self"
    $P65 = $P64()
    find_lex $P66, "$why"
    $P67 = $P65."_fail"($P66)
# .annotate "line", 61
    set $P61, $P67
  unless_62_end:
# .annotate "line", 60
    .return ($P61)
  control_57:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P68, exception, "payload"
    .return ($P68)
.end


.namespace ["UnitTest";"Testcase"]
.sub "verify_that"  :subid("18_1267109946.804") :outer("13_1267109946.804")
    .param pmc param_72 :slurpy
# .annotate "line", 128
    new $P71, 'ExceptionHandler'
    set_addr $P71, control_70
    $P71."handle_types"(58)
    push_eh $P71
    .lex "@text", param_72
# .annotate "line", 129
    get_hll_global $P73, ["Parrot"], "get_self"
    $P74 = $P73()
    find_lex $P75, "@text"
    $P76 = $P75."join"()
    $P77 = $P74."verify"($P76)
# .annotate "line", 128
    .return ($P77)
  control_70:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P78, exception, "payload"
    .return ($P78)
.end


.namespace ["UnitTest";"Testcase"]
.sub "assert_match"  :subid("19_1267109946.804") :method :outer("13_1267109946.804")
    .param pmc param_82
    .param pmc param_83
# .annotate "line", 24
    .const 'Sub' $P90 = "20_1267109946.804" 
    capture_lex $P90
    new $P81, 'ExceptionHandler'
    set_addr $P81, control_80
    $P81."handle_types"(58)
    push_eh $P81
    .lex "self", self
    .lex "$target", param_82
    .lex "$matcher", param_83
# .annotate "line", 25
    find_lex $P86, "$matcher"
    find_lex $P87, "$target"
    $P88 = $P86."matches"($P87)
    unless $P88, unless_85
    set $P84, $P88
    goto unless_85_end
  unless_85:
    .const 'Sub' $P90 = "20_1267109946.804" 
    capture_lex $P90
    $P101 = $P90()
    set $P84, $P101
  unless_85_end:
# .annotate "line", 24
    .return ($P84)
  control_80:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["UnitTest";"Testcase"]
.sub "_block89"  :anon :subid("20_1267109946.804") :outer("19_1267109946.804")
# .annotate "line", 26
    new $P91, "Undef"
    .lex "$explain", $P91
    find_lex $P92, "$matcher"
    $P93 = $P92."describe_self"("Expected: ")
# .annotate "line", 27
    find_lex $P94, "$matcher"
    find_lex $P95, "$target"
    $S96 = $P94."describe_failure"($P95, "\n     but: ")
    concat $P97, $P93, $S96
    store_lex "$explain", $P97
# .annotate "line", 28
    find_lex $P98, "self"
    find_lex $P99, "$explain"
    $P100 = $P98."_fail"($P99)
# .annotate "line", 25
    .return ($P100)
.end


.namespace ["UnitTest";"Testcase"]
.sub "default_loader"  :subid("21_1267109946.804") :method :outer("13_1267109946.804")
# .annotate "line", 36
    new $P106, 'ExceptionHandler'
    set_addr $P106, control_105
    $P106."handle_types"(58)
    push_eh $P106
    .lex "self", self
# .annotate "line", 37
    get_hll_global $P107, ["UnitTest"], "Loader"
    $P108 = $P107."new"()
# .annotate "line", 36
    .return ($P108)
  control_105:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["UnitTest";"Testcase"]
.sub "default_result"  :subid("22_1267109946.804") :method :outer("13_1267109946.804")
# .annotate "line", 40
    new $P112, 'ExceptionHandler'
    set_addr $P112, control_111
    $P112."handle_types"(58)
    push_eh $P112
    .lex "self", self
# .annotate "line", 41
    new $P113, "Undef"
    .lex "$result", $P113
    get_hll_global $P114, ["UnitTest"], "Result"
    $P115 = $P114."new"()
    store_lex "$result", $P115
# .annotate "line", 42
    find_lex $P116, "$result"
    get_hll_global $P117, ["UnitTest";"Listener"], "TAP"
    $P118 = $P117."new"()
    $P116."add_listener"($P118)
# .annotate "line", 43
    new $P119, "Exception"
    set $P119['type'], 58
    find_lex $P120, "$result"
    setattribute $P119, 'payload', $P120
    throw $P119
# .annotate "line", 40
    .return ()
  control_111:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, "payload"
    .return ($P121)
.end


.namespace ["UnitTest";"Testcase"]
.sub "_fail"  :subid("23_1267109946.804") :method :outer("13_1267109946.804")
    .param pmc param_125
# .annotate "line", 46
    new $P124, 'ExceptionHandler'
    set_addr $P124, control_123
    $P124."handle_types"(58)
    push_eh $P124
    .lex "self", self
    .lex "$why", param_125
# .annotate "line", 47
    get_hll_global $P126, ["Exception"], "UnitTestFailure"
    find_lex $P127, "$why"
    $P128 = $P126."new"($P127 :named("message"))
    $P129 = $P128."throw"()
# .annotate "line", 46
    .return ($P129)
  control_123:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P130, exception, "payload"
    .return ($P130)
.end


.namespace ["UnitTest";"Testcase"]
.sub "num_tests"  :subid("24_1267109946.804") :method :outer("13_1267109946.804")
# .annotate "line", 66
    new $P136, 'ExceptionHandler'
    set_addr $P136, control_135
    $P136."handle_types"(58)
    push_eh $P136
    .lex "self", self
# .annotate "line", 67
    new $P137, "Exception"
    set $P137['type'], 58
    new $P138, "Integer"
    assign $P138, 1
    setattribute $P137, 'payload', $P138
    throw $P137
# .annotate "line", 66
    .return ()
  control_135:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P139, exception, "payload"
    .return ($P139)
.end


.namespace ["UnitTest";"Testcase"]
.sub "run"  :subid("25_1267109946.804") :method :outer("13_1267109946.804")
    .param pmc param_143 :optional
    .param int has_param_143 :opt_flag
# .annotate "line", 71
    .const 'Sub' $P173 = "28_1267109946.804" 
    capture_lex $P173
    .const 'Sub' $P155 = "26_1267109946.804" 
    capture_lex $P155
    new $P142, 'ExceptionHandler'
    set_addr $P142, control_141
    $P142."handle_types"(58)
    push_eh $P142
    .lex "self", self
    if has_param_143, optparam_36
    new $P144, "Undef"
    set param_143, $P144
  optparam_36:
    .lex "$result", param_143
# .annotate "line", 77
    new $P145, "Undef"
    .lex "$exception", $P145
# .annotate "line", 72
    find_lex $P147, "$result"
    $P148 = $P147."defined"()
    if $P148, unless_146_end
# .annotate "line", 73
    find_lex $P149, "self"
    $P150 = $P149."default_result"()
    store_lex "$result", $P150
  unless_146_end:
# .annotate "line", 76
    find_lex $P151, "$result"
    find_lex $P152, "self"
    $P151."start_test"($P152)
    find_lex $P153, "$exception"
# .annotate "line", 79
    .const 'Sub' $P155 = "26_1267109946.804" 
    capture_lex $P155
    $P155()
# .annotate "line", 89
    .const 'Sub' $P173 = "28_1267109946.804" 
    capture_lex $P173
    $P173()
# .annotate "line", 101
    find_lex $P193, "$exception"
    $P194 = $P193."defined"()
    if $P194, if_192
# .annotate "line", 110
    find_lex $P207, "$result"
    find_lex $P208, "self"
    $P207."end_test"($P208)
# .annotate "line", 109
    goto if_192_end
  if_192:
# .annotate "line", 102
    find_lex $P196, "$exception"
    $N197 = $P196."type"()
    get_hll_global $P198, ["Exception"], "UnitTestFailure"
    $N199 = $P198."type"()
    iseq $I200, $N197, $N199
    if $I200, if_195
# .annotate "line", 106
    find_lex $P204, "$result"
    find_lex $P205, "self"
    find_lex $P206, "$exception"
    $P204."add_error"($P205, $P206)
# .annotate "line", 105
    goto if_195_end
  if_195:
# .annotate "line", 103
    find_lex $P201, "$result"
    find_lex $P202, "self"
    find_lex $P203, "$exception"
    $P201."add_failure"($P202, $P203)
  if_195_end:
  if_192_end:
# .annotate "line", 101
    find_lex $P209, "$result"
# .annotate "line", 71
    .return ($P209)
  control_141:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P210, exception, "payload"
    .return ($P210)
.end


.namespace ["UnitTest";"Testcase"]
.sub "_block154"  :anon :subid("26_1267109946.804") :outer("25_1267109946.804")
# .annotate "line", 79
    .const 'Sub' $P164 = "27_1267109946.804" 
    capture_lex $P164
    new $P160, 'ExceptionHandler'
    set_addr $P160, control_159
    $P160."handle_types_except"(58, 59, 60, 61, 63, 64, 65, 66, 67)
    push_eh $P160
# .annotate "line", 80
    find_lex $P156, "self"
    $P156."set_up"()
# .annotate "line", 81
    find_lex $P157, "self"
    $P157."run_test"()
# .annotate "line", 79
    pop_eh 
    goto skip_handler_158
  control_159:
# .annotate "line", 83
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P164 = "27_1267109946.804" 
    capture_lex $P164
    $P164(exception)
    new $P170, 'Integer'
    set $P170, 1
    set exception["handled"], $P170
    set $I171, exception["handled"]
    ne $I171, 1, nothandled_162
  handled_161:
    .return (exception)
  nothandled_162:
    rethrow exception
  skip_handler_158:
# .annotate "line", 79
    .return ()
.end


.namespace ["UnitTest";"Testcase"]
.sub "_block163"  :anon :subid("27_1267109946.804") :outer("26_1267109946.804")
    .param pmc param_165
# .annotate "line", 83
    .lex "$_", param_165
    find_lex $P166, "$_"
    .lex "$!", $P166
# .annotate "line", 84
    find_lex $P167, "$!"
    store_lex "$exception", $P167
# .annotate "line", 85
    find_lex $P168, "$!"
    $P169 = $P168."handled"(1)
# .annotate "line", 83
    .return ($P169)
.end


.namespace ["UnitTest";"Testcase"]
.sub "_block172"  :anon :subid("28_1267109946.804") :outer("25_1267109946.804")
# .annotate "line", 89
    .const 'Sub' $P181 = "29_1267109946.804" 
    capture_lex $P181
    new $P177, 'ExceptionHandler'
    set_addr $P177, control_176
    $P177."handle_types_except"(58, 59, 60, 61, 63, 64, 65, 66, 67)
    push_eh $P177
# .annotate "line", 90
    find_lex $P174, "self"
    $P174."tear_down"()
# .annotate "line", 89
    pop_eh 
    goto skip_handler_175
  control_176:
# .annotate "line", 92
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P181 = "29_1267109946.804" 
    capture_lex $P181
    $P181(exception)
    new $P190, 'Integer'
    set $P190, 1
    set exception["handled"], $P190
    set $I191, exception["handled"]
    ne $I191, 1, nothandled_179
  handled_178:
    .return (exception)
  nothandled_179:
    rethrow exception
  skip_handler_175:
# .annotate "line", 89
    .return ()
.end


.namespace ["UnitTest";"Testcase"]
.sub "_block180"  :anon :subid("29_1267109946.804") :outer("28_1267109946.804")
    .param pmc param_182
# .annotate "line", 92
    .lex "$_", param_182
    find_lex $P183, "$_"
    .lex "$!", $P183
# .annotate "line", 93
    find_lex $P184, "$!"
    $P184."handled"(1)
# .annotate "line", 95
    find_lex $P187, "$exception"
    $P188 = $P187."defined"()
    unless $P188, unless_186
    set $P185, $P188
    goto unless_186_end
  unless_186:
# .annotate "line", 96
    find_lex $P189, "$!"
    store_lex "$exception", $P189
# .annotate "line", 95
    set $P185, $P189
  unless_186_end:
# .annotate "line", 92
    .return ($P185)
.end


.namespace ["UnitTest";"Testcase"]
.sub "run_test"  :subid("30_1267109946.804") :method :outer("13_1267109946.804")
# .annotate "line", 116
    new $P213, 'ExceptionHandler'
    set_addr $P213, control_212
    $P213."handle_types"(58)
    push_eh $P213
    .lex "self", self
# .annotate "line", 117
    get_hll_global $P214, ["Parrot"], "call_method"
    find_lex $P215, "self"
    find_lex $P216, "self"
    $P217 = $P216."name"()
    $P218 = $P214($P215, $P217)
# .annotate "line", 116
    .return ($P218)
  control_212:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P219, exception, "payload"
    .return ($P219)
.end


.namespace ["UnitTest";"Testcase"]
.sub "set_up"  :subid("31_1267109946.804") :method :outer("13_1267109946.804")
# .annotate "line", 120
    new $P222, 'ExceptionHandler'
    set_addr $P222, control_221
    $P222."handle_types"(58)
    push_eh $P222
    .lex "self", self
    .return ()
  control_221:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P223, exception, "payload"
    .return ($P223)
.end


.namespace ["UnitTest";"Testcase"]
.sub "suite"  :subid("32_1267109946.804") :method :outer("13_1267109946.804")
# .annotate "line", 122
    new $P226, 'ExceptionHandler'
    set_addr $P226, control_225
    $P226."handle_types"(58)
    push_eh $P226
    .lex "self", self
# .annotate "line", 123
    find_lex $P227, "self"
    $P228 = $P227."default_loader"()
    find_lex $P229, "self"
    $P230 = $P228."load_tests_from_testcase"($P229)
# .annotate "line", 122
    .return ($P230)
  control_225:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P231, exception, "payload"
    .return ($P231)
.end


.namespace ["UnitTest";"Testcase"]
.sub "tear_down"  :subid("33_1267109946.804") :method :outer("13_1267109946.804")
# .annotate "line", 126
    new $P234, 'ExceptionHandler'
    set_addr $P234, control_233
    $P234."handle_types"(58)
    push_eh $P234
    .lex "self", self
    .return ()
  control_233:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P235, exception, "payload"
    .return ($P235)
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
