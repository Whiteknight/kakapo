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
.sub "_block11"  :anon :subid("10_1268929816.48385")
# .annotate "line", 0
    get_hll_global $P14, ["Kakapo"], "_block13" 
    capture_lex $P14
# .annotate "line", 8
    get_hll_global $P14, ["Kakapo"], "_block13" 
    capture_lex $P14
    $P136 = $P14()
# .annotate "line", 1
    .return ($P136)
.end


.namespace ["Kakapo"]
.sub "_block13"  :subid("11_1268929816.48385") :outer("10_1268929816.48385")
# .annotate "line", 8
    get_hll_global $P99, ["Kakapo";"Full"], "_block98" 
    capture_lex $P99
    .const 'Sub' $P86 = "16_1268929816.48385" 
    capture_lex $P86
    .const 'Sub' $P79 = "15_1268929816.48385" 
    capture_lex $P79
    .const 'Sub' $P62 = "14_1268929816.48385" 
    capture_lex $P62
    .const 'Sub' $P57 = "13_1268929816.48385" 
    capture_lex $P57
    .const 'Sub' $P15 = "12_1268929816.48385" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929816.48385" 
    capture_lex $P15
    .lex "depends_on", $P15
# .annotate "line", 27
    .const 'Sub' $P57 = "13_1268929816.48385" 
    capture_lex $P57
    .lex "get_preinit_subs", $P57
# .annotate "line", 50
    .const 'Sub' $P62 = "14_1268929816.48385" 
    capture_lex $P62
    .lex "initload_done", $P62
# .annotate "line", 55
    .const 'Sub' $P79 = "15_1268929816.48385" 
    capture_lex $P79
    .lex "library_init_done", $P79
# .annotate "line", 59
    .const 'Sub' $P86 = "16_1268929816.48385" 
    capture_lex $P86
    .lex "library_load_done", $P86
# .annotate "line", 8
    find_lex $P93, "depends_on"
    find_lex $P94, "get_preinit_subs"
    find_lex $P95, "initload_done"
    find_lex $P96, "library_init_done"
    find_lex $P97, "library_load_done"
# .annotate "line", 65
    get_hll_global $P99, ["Kakapo";"Full"], "_block98" 
    capture_lex $P99
    $P135 = $P99()
# .annotate "line", 8
    .return ($P135)
.end


.namespace ["Kakapo"]
.sub "depends_on"  :subid("12_1268929816.48385") :outer("11_1268929816.48385")
    .param pmc param_18 :slurpy
    .param pmc param_19 :optional :named("method")
    .param int has_param_19 :opt_flag
# .annotate "line", 8
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "@list", param_18
    if has_param_19, optparam_21
    new $P20, "Undef"
    set param_19, $P20
  optparam_21:
    .lex "$method", param_19
# .annotate "line", 13
    new $P21, "Undef"
    .lex "$namespace", $P21
# .annotate "line", 14
    new $P22, "Undef"
    .lex "$name", $P22
# .annotate "line", 9
    find_lex $P26, "@list"
    $N27 = $P26."elems"()
    iseq $I28, $N27, 1.0
    if $I28, if_25
    new $P24, 'Integer'
    set $P24, $I28
    goto if_25_end
  if_25:
    find_lex $P29, "@list"
    unless_null $P29, vivify_22
    $P29 = root_new ['parrot';'ResizablePMCArray']
  vivify_22:
    set $P30, $P29[0]
    unless_null $P30, vivify_23
    new $P30, "Undef"
  vivify_23:
    $P31 = $P30."does"("array")
    set $P24, $P31
  if_25_end:
    unless $P24, if_23_end
# .annotate "line", 10
    find_lex $P32, "@list"
    $P33 = $P32."shift"()
    store_lex "@list", $P33
  if_23_end:
# .annotate "line", 13
    get_hll_global $P34, ["Parrot"], "caller_namespace"
    $P35 = $P34()
    store_lex "$namespace", $P35
# .annotate "line", 14
    find_lex $P36, "$namespace"
    $P37 = $P36."string_name"()
    store_lex "$name", $P37
# .annotate "line", 16
    find_lex $P39, "$method"
    $P40 = $P39."defined"()
    if $P40, unless_38_end
# .annotate "line", 17
    get_hll_global $P42, ["Parrot"], "caller_namespace"
    $P43 = $P42()
    $P44 = $P43."contains"("_initload")
    if $P44, unless_41_end
# .annotate "line", 18
    new $P45, 'String'
    set $P45, "Could not locate (default) '_initload' method in namespace "
    find_lex $P46, "$name"
    concat $P47, $P45, $P46
    "die"($P47)
  unless_41_end:
# .annotate "line", 21
    find_lex $P48, "$namespace"
    unless_null $P48, vivify_24
    $P48 = root_new ['parrot';'Hash']
  vivify_24:
    set $P49, $P48["_initload"]
    unless_null $P49, vivify_25
    new $P49, "Undef"
  vivify_25:
    store_lex "$method", $P49
  unless_38_end:
# .annotate "line", 24
    get_hll_global $P50, ["Kakapo";"Full"], "library_instance"
    $P51 = $P50()
    find_lex $P52, "$method"
    find_lex $P53, "$name"
    find_lex $P54, "@list"
    $P55 = $P51."at_initload"($P52, $P53, $P54 :named("requires"))
# .annotate "line", 8
    .return ($P55)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P56, exception, "payload"
    .return ($P56)
.end


.namespace ["Kakapo"]
.sub "get_preinit_subs"  :subid("13_1268929816.48385") :outer("11_1268929816.48385")
# .annotate "line", 27
    new $P59, 'ExceptionHandler'
    set_addr $P59, control_58
    $P59."handle_types"(58)
    push_eh $P59
# .annotate "line", 31
    new $P60, "ResizablePMCArray"
    push $P60, "Global"
    push $P60, "Opcode"
    push $P60, "Parrot"
    push $P60, "Pir"
    push $P60, "Key"
    push $P60, "Array"
    push $P60, "Kakapo::Pmc::COMMON"
    push $P60, "String"
    push $P60, "Exception"
    push $P60, "Syntax"
    push $P60, "P6metaclass"
    push $P60, "P6object"
    push $P60, "DependencyQueue"
    push $P60, "ComponentMarshaller"
    push $P60, "Library"
    push $P60, "Kakapo::Full"
# .annotate "line", 27
    .return ($P60)
  control_58:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P61, exception, "payload"
    .return ($P61)
.end


.namespace ["Kakapo"]
.sub "initload_done"  :subid("14_1268929816.48385") :outer("11_1268929816.48385")
    .param pmc param_65 :optional
    .param int has_param_65 :opt_flag
# .annotate "line", 50
    new $P64, 'ExceptionHandler'
    set_addr $P64, control_63
    $P64."handle_types"(58)
    push_eh $P64
    if has_param_65, optparam_26
    new $P66, "Undef"
    set param_65, $P66
  optparam_26:
    .lex "$name", param_65
# .annotate "line", 51
    find_lex $P68, "$name"
    set $P67, $P68
    defined $I70, $P67
    if $I70, default_69
    get_hll_global $P71, ["Parrot"], "caller_namespace"
    $P72 = $P71()
    $P73 = $P72."string_name"()
    set $P67, $P73
  default_69:
    store_lex "$name", $P67
# .annotate "line", 52
    get_hll_global $P74, ["Kakapo";"Full"], "library_instance"
    $P75 = $P74()
    find_lex $P76, "$name"
    $P77 = $P75."module_initload_done"($P76)
# .annotate "line", 50
    .return ($P77)
  control_63:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P78, exception, "payload"
    .return ($P78)
.end


.namespace ["Kakapo"]
.sub "library_init_done"  :subid("15_1268929816.48385") :outer("11_1268929816.48385")
# .annotate "line", 55
    new $P81, 'ExceptionHandler'
    set_addr $P81, control_80
    $P81."handle_types"(58)
    push_eh $P81
# .annotate "line", 56
    get_hll_global $P82, ["Kakapo";"Full"], "library_instance"
    $P83 = $P82()
    $P84 = $P83."do_init"()
# .annotate "line", 55
    .return ($P84)
  control_80:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P85, exception, "payload"
    .return ($P85)
.end


.namespace ["Kakapo"]
.sub "library_load_done"  :subid("16_1268929816.48385") :outer("11_1268929816.48385")
# .annotate "line", 59
    new $P88, 'ExceptionHandler'
    set_addr $P88, control_87
    $P88."handle_types"(58)
    push_eh $P88
# .annotate "line", 60
    get_hll_global $P89, ["Kakapo";"Full"], "library_instance"
    $P90 = $P89()
    $P91 = $P90."do_load"()
# .annotate "line", 59
    .return ($P91)
  control_87:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P92, exception, "payload"
    .return ($P92)
.end


.namespace ["Kakapo";"Full"]
.sub "_block98"  :subid("17_1268929816.48385") :outer("11_1268929816.48385")
# .annotate "line", 65
    .const 'Sub' $P120 = "20_1268929816.48385" 
    capture_lex $P120
    .const 'Sub' $P100 = "18_1268929816.48385" 
    capture_lex $P100
    .const 'Sub' $P100 = "18_1268929816.48385" 
    capture_lex $P100
    .lex "_pre_initload", $P100
# .annotate "line", 73
    .const 'Sub' $P120 = "20_1268929816.48385" 
    capture_lex $P120
    .lex "library_instance", $P120
# .annotate "line", 65
    find_lex $P133, "_pre_initload"
    find_lex $P134, "library_instance"
    .return ($P134)
.end


.namespace ["Kakapo";"Full"]
.sub "_pre_initload"  :subid("18_1268929816.48385") :outer("17_1268929816.48385")
# .annotate "line", 65
    .const 'Sub' $P111 = "19_1268929816.48385" 
    capture_lex $P111
    new $P102, 'ExceptionHandler'
    set_addr $P102, control_101
    $P102."handle_types"(58)
    push_eh $P102
# .annotate "line", 66
    get_hll_global $P103, "Library"
    $P104 = $P103."new"()
    "library_instance"($P104)
# .annotate "line", 68
    get_hll_global $P106, ["Kakapo"], "get_preinit_subs"
    $P107 = $P106()
    defined $I108, $P107
    unless $I108, for_undef_27
    iter $P105, $P107
    new $P117, 'ExceptionHandler'
    set_addr $P117, loop116_handler
    $P117."handle_types"(65, 67, 66)
    push_eh $P117
  loop116_test:
    unless $P105, loop116_done
    shift $P109, $P105
  loop116_redo:
    .const 'Sub' $P111 = "19_1268929816.48385" 
    capture_lex $P111
    $P111($P109)
  loop116_next:
    goto loop116_test
  loop116_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, 'type'
    eq $P118, 65, loop116_next
    eq $P118, 67, loop116_redo
  loop116_done:
    pop_eh 
  for_undef_27:
# .annotate "line", 65
    .return ($P105)
  control_101:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P119, exception, "payload"
    .return ($P119)
.end


.namespace ["Kakapo";"Full"]
.sub "_block110"  :anon :subid("19_1268929816.48385") :outer("18_1268929816.48385")
    .param pmc param_112
# .annotate "line", 68
    .lex "$module_name", param_112
# .annotate "line", 69
    get_hll_global $P113, ["Kakapo"], "initload_done"
    find_lex $P114, "$module_name"
    $P115 = $P113($P114)
# .annotate "line", 68
    .return ($P115)
.end


.namespace ["Kakapo";"Full"]
.sub "library_instance"  :subid("20_1268929816.48385") :outer("17_1268929816.48385")
    .param pmc param_123 :optional
    .param int has_param_123 :opt_flag
# .annotate "line", 73
    new $P122, 'ExceptionHandler'
    set_addr $P122, control_121
    $P122."handle_types"(58)
    push_eh $P122
    if has_param_123, optparam_28
    new $P124, "Undef"
    set param_123, $P124
  optparam_28:
    .lex "$value", param_123
# .annotate "line", 75
    get_global $P125, "$_library_instance"
    unless_null $P125, vivify_29
    new $P125, "Undef"
    set_global "$_library_instance", $P125
  vivify_29:
# .annotate "line", 74
    find_lex $P128, "$value"
    $P129 = $P128."defined"()
    if $P129, if_127
    get_global $P131, "$_library_instance"
    set $P126, $P131
    goto if_127_end
  if_127:
# .annotate "line", 75
    find_lex $P130, "$value"
    set_global "$_library_instance", $P130
    set $P126, $P130
  if_127_end:
# .annotate "line", 73
    .return ($P126)
  control_121:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P132, exception, "payload"
    .return ($P132)
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


.namespace []
.sub "_block11"  :anon :subid("10_1268929831.96408")
# .annotate "line", 0
    get_hll_global $P14, ["CallSignature"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["CallSignature"], "_block13" 
    capture_lex $P14
    $P92 = $P14()
# .annotate "line", 1
    .return ($P92)
.end


.namespace []
.sub "" :load :init :subid("post17") :outer("10_1268929831.96408")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268929831.96408" 
    .local pmc block
    set block, $P12
    $P93 = get_root_global ["parrot"], "P6metaclass"
    new $P94, "ResizablePMCArray"
    push $P94, "$!object"
    push $P94, "$!method"
    push $P94, "@!positional"
    push $P94, "%!named"
    $P93."new_class"("CallSignature", $P94 :named("attr"))
.end


.namespace ["CallSignature"]
.sub "_block13"  :subid("11_1268929831.96408") :outer("10_1268929831.96408")
# .annotate "line", 6
    .const 'Sub' $P78 = "16_1268929831.96408" 
    capture_lex $P78
    .const 'Sub' $P64 = "15_1268929831.96408" 
    capture_lex $P64
    .const 'Sub' $P50 = "14_1268929831.96408" 
    capture_lex $P50
    .const 'Sub' $P37 = "13_1268929831.96408" 
    capture_lex $P37
    .const 'Sub' $P15 = "12_1268929831.96408" 
    capture_lex $P15
# .annotate "line", 22
    .const 'Sub' $P78 = "16_1268929831.96408" 
    capture_lex $P78
# .annotate "line", 6
    .return ($P78)
.end


.namespace ["CallSignature"]
.sub "_init_obj"  :subid("12_1268929831.96408") :method :outer("11_1268929831.96408")
    .param pmc param_18 :slurpy
    .param pmc param_19 :slurpy :named
# .annotate "line", 11
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
    .lex "@pos", param_18
    .lex "%named", param_19
# .annotate "line", 12
    get_hll_global $P20, ["Matcher";"CallSig"], "ANY"
    $P21 = $P20()
    find_lex $P22, "self"
    setattribute $P22, "$!method", $P21
# .annotate "line", 13
    find_lex $P23, "self"
    getattribute $P24, $P23, "%!named"
    unless_null $P24, vivify_18
    $P24 = root_new ['parrot';'Hash']
  vivify_18:
    find_lex $P25, "self"
    setattribute $P25, "%!named", $P24
# .annotate "line", 14
    get_hll_global $P26, ["Matcher";"CallSig"], "ANY"
    $P27 = $P26()
    find_lex $P28, "self"
    setattribute $P28, "$!object", $P27
# .annotate "line", 15
    find_lex $P29, "self"
    getattribute $P30, $P29, "@!positional"
    unless_null $P30, vivify_19
    $P30 = root_new ['parrot';'ResizablePMCArray']
  vivify_19:
    find_lex $P31, "self"
    setattribute $P31, "@!positional", $P30
# .annotate "line", 16
    find_lex $P32, "self"
    find_lex $P33, "@pos"
    find_lex $P34, "%named"
    $P35 = $P32."_init_args"($P33 :flat, $P34 :flat)
# .annotate "line", 11
    .return ($P35)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P36, exception, "payload"
    .return ($P36)
.end


.namespace ["CallSignature"]
.sub "object"  :subid("13_1268929831.96408") :method :outer("11_1268929831.96408")
    .param pmc param_40 :slurpy
# .annotate "line", 19
    new $P39, 'ExceptionHandler'
    set_addr $P39, control_38
    $P39."handle_types"(58)
    push_eh $P39
    .lex "self", self
    .lex "@value", param_40
    find_lex $P43, "@value"
    if $P43, if_42
    find_lex $P47, "self"
    getattribute $P48, $P47, "$!object"
    unless_null $P48, vivify_20
    new $P48, "Undef"
  vivify_20:
    set $P41, $P48
    goto if_42_end
  if_42:
    find_lex $P44, "@value"
    $P45 = $P44."shift"()
    find_lex $P46, "self"
    setattribute $P46, "$!object", $P45
    set $P41, $P45
  if_42_end:
    .return ($P41)
  control_38:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P49, exception, "payload"
    .return ($P49)
.end


.namespace ["CallSignature"]
.sub "method"  :subid("14_1268929831.96408") :method :outer("11_1268929831.96408")
    .param pmc param_53 :optional
    .param int has_param_53 :opt_flag
# .annotate "line", 20
    new $P52, 'ExceptionHandler'
    set_addr $P52, control_51
    $P52."handle_types"(58)
    push_eh $P52
    .lex "self", self
    if has_param_53, optparam_21
    new $P54, "Undef"
    set param_53, $P54
  optparam_21:
    .lex "$value", param_53
    find_lex $P57, "$value"
    defined $I58, $P57
    if $I58, if_56
    find_lex $P61, "self"
    getattribute $P62, $P61, "$!method"
    unless_null $P62, vivify_22
    new $P62, "Undef"
  vivify_22:
    set $P55, $P62
    goto if_56_end
  if_56:
    find_lex $P59, "$value"
    find_lex $P60, "self"
    setattribute $P60, "$!method", $P59
    set $P55, $P59
  if_56_end:
    .return ($P55)
  control_51:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P63, exception, "payload"
    .return ($P63)
.end


.namespace ["CallSignature"]
.sub "positional"  :subid("15_1268929831.96408") :method :outer("11_1268929831.96408")
    .param pmc param_67 :optional
    .param int has_param_67 :opt_flag
# .annotate "line", 21
    new $P66, 'ExceptionHandler'
    set_addr $P66, control_65
    $P66."handle_types"(58)
    push_eh $P66
    .lex "self", self
    if has_param_67, optparam_23
    new $P68, "Undef"
    set param_67, $P68
  optparam_23:
    .lex "$value", param_67
    find_lex $P71, "$value"
    defined $I72, $P71
    if $I72, if_70
    find_lex $P75, "self"
    getattribute $P76, $P75, "@!positional"
    unless_null $P76, vivify_24
    $P76 = root_new ['parrot';'ResizablePMCArray']
  vivify_24:
    set $P69, $P76
    goto if_70_end
  if_70:
    find_lex $P73, "$value"
    find_lex $P74, "self"
    setattribute $P74, "@!positional", $P73
    set $P69, $P73
  if_70_end:
    .return ($P69)
  control_65:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P77, exception, "payload"
    .return ($P77)
.end


.namespace ["CallSignature"]
.sub "named"  :subid("16_1268929831.96408") :method :outer("11_1268929831.96408")
    .param pmc param_81 :optional
    .param int has_param_81 :opt_flag
# .annotate "line", 22
    new $P80, 'ExceptionHandler'
    set_addr $P80, control_79
    $P80."handle_types"(58)
    push_eh $P80
    .lex "self", self
    if has_param_81, optparam_25
    new $P82, "Undef"
    set param_81, $P82
  optparam_25:
    .lex "$value", param_81
    find_lex $P85, "$value"
    defined $I86, $P85
    if $I86, if_84
    find_lex $P89, "self"
    getattribute $P90, $P89, "%!named"
    unless_null $P90, vivify_26
    $P90 = root_new ['parrot';'Hash']
  vivify_26:
    set $P83, $P90
    goto if_84_end
  if_84:
    find_lex $P87, "$value"
    find_lex $P88, "self"
    setattribute $P88, "%!named", $P87
    set $P83, $P87
  if_84_end:
    .return ($P83)
  control_79:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P91, exception, "payload"
    .return ($P91)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929922.77545")
# .annotate "line", 0
    get_hll_global $P14, ["P6object"], "_block13" 
    capture_lex $P14
# .annotate "line", 8
    get_hll_global $P14, ["P6object"], "_block13" 
    capture_lex $P14
    $P301 = $P14()
# .annotate "line", 1
    .return ($P301)
.end


.namespace ["P6object"]
.sub "_block13"  :subid("11_1268929922.77545") :outer("10_1268929922.77545")
# .annotate "line", 8
    .const 'Sub' $P282 = "33_1268929922.77545" 
    capture_lex $P282
    .const 'Sub' $P271 = "32_1268929922.77545" 
    capture_lex $P271
    .const 'Sub' $P227 = "30_1268929922.77545" 
    capture_lex $P227
    .const 'Sub' $P217 = "29_1268929922.77545" 
    capture_lex $P217
    .const 'Sub' $P206 = "28_1268929922.77545" 
    capture_lex $P206
    .const 'Sub' $P202 = "27_1268929922.77545" 
    capture_lex $P202
    .const 'Sub' $P77 = "22_1268929922.77545" 
    capture_lex $P77
    .const 'Sub' $P71 = "21_1268929922.77545" 
    capture_lex $P71
    .const 'Sub' $P65 = "20_1268929922.77545" 
    capture_lex $P65
    .const 'Sub' $P61 = "19_1268929922.77545" 
    capture_lex $P61
    .const 'Sub' $P57 = "18_1268929922.77545" 
    capture_lex $P57
    .const 'Sub' $P53 = "17_1268929922.77545" 
    capture_lex $P53
    .const 'Sub' $P49 = "16_1268929922.77545" 
    capture_lex $P49
    .const 'Sub' $P45 = "15_1268929922.77545" 
    capture_lex $P45
    .const 'Sub' $P41 = "14_1268929922.77545" 
    capture_lex $P41
    .const 'Sub' $P25 = "13_1268929922.77545" 
    capture_lex $P25
    .const 'Sub' $P15 = "12_1268929922.77545" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929922.77545" 
    capture_lex $P15
    .lex "_pre_initload", $P15
    find_lex $P24, "_pre_initload"
# .annotate "line", 192
    .const 'Sub' $P282 = "33_1268929922.77545" 
    capture_lex $P282
# .annotate "line", 8
    .return ($P282)
.end


.namespace ["P6object"]
.sub "_pre_initload"  :subid("12_1268929922.77545") :outer("11_1268929922.77545")
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
.sub "__ABSTRACT__"  :subid("13_1268929922.77545") :method :outer("11_1268929922.77545")
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
.sub "BECAUSE"  :subid("14_1268929922.77545") :method :outer("11_1268929922.77545")
# .annotate "line", 89
    new $P43, 'ExceptionHandler'
    set_addr $P43, control_42
    $P43."handle_types"(58)
    push_eh $P43
    .lex "self", self
    .return ("center field")
  control_42:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P44, exception, "payload"
    .return ($P44)
.end


.namespace ["P6object"]
.sub "IDONTGIVEADARN"  :subid("15_1268929922.77545") :method :outer("11_1268929922.77545")
# .annotate "line", 90
    new $P47, 'ExceptionHandler'
    set_addr $P47, control_46
    $P47."handle_types"(58)
    push_eh $P47
    .lex "self", self
    .return ("shortstop")
  control_46:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P48, exception, "payload"
    .return ($P48)
.end


.namespace ["P6object"]
.sub "IDONTKNOW"  :subid("16_1268929922.77545") :method :outer("11_1268929922.77545")
# .annotate "line", 91
    new $P51, 'ExceptionHandler'
    set_addr $P51, control_50
    $P51."handle_types"(58)
    push_eh $P51
    .lex "self", self
    .return ("third base")
  control_50:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P52, exception, "payload"
    .return ($P52)
.end


.namespace ["P6object"]
.sub "TODAY"  :subid("17_1268929922.77545") :method :outer("11_1268929922.77545")
# .annotate "line", 92
    new $P55, 'ExceptionHandler'
    set_addr $P55, control_54
    $P55."handle_types"(58)
    push_eh $P55
    .lex "self", self
    .return ("catcher")
  control_54:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P56, exception, "payload"
    .return ($P56)
.end


.namespace ["P6object"]
.sub "TOMORROW"  :subid("18_1268929922.77545") :method :outer("11_1268929922.77545")
# .annotate "line", 93
    new $P59, 'ExceptionHandler'
    set_addr $P59, control_58
    $P59."handle_types"(58)
    push_eh $P59
    .lex "self", self
    .return ("pitcher")
  control_58:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P60, exception, "payload"
    .return ($P60)
.end


.namespace ["P6object"]
.sub "WHY"  :subid("19_1268929922.77545") :method :outer("11_1268929922.77545")
# .annotate "line", 94
    new $P63, 'ExceptionHandler'
    set_addr $P63, control_62
    $P63."handle_types"(58)
    push_eh $P63
    .lex "self", self
    .return ("left field")
  control_62:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P64, exception, "payload"
    .return ($P64)
.end


.namespace ["P6object"]
.sub "clone"  :subid("20_1268929922.77545") :method :outer("11_1268929922.77545")
# .annotate "line", 96
    new $P67, 'ExceptionHandler'
    set_addr $P67, control_66
    $P67."handle_types"(58)
    push_eh $P67
    .lex "self", self
# .annotate "line", 97
    find_lex $P68, "self"
    clone $P69, $P68
# .annotate "line", 96
    .return ($P69)
  control_66:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P70, exception, "payload"
    .return ($P70)
.end


.namespace ["P6object"]
.sub "defined"  :subid("21_1268929922.77545") :method :outer("11_1268929922.77545")
# .annotate "line", 100
    new $P73, 'ExceptionHandler'
    set_addr $P73, control_72
    $P73."handle_types"(58)
    push_eh $P73
    .lex "self", self
# .annotate "line", 102
    new $P74, "Exception"
    set $P74['type'], 58
    new $P75, "Integer"
    assign $P75, 1
    setattribute $P74, 'payload', $P75
    throw $P74
# .annotate "line", 100
    .return ()
  control_72:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P76, exception, "payload"
    .return ($P76)
.end


.namespace ["P6object"]
.sub "__dump"  :subid("22_1268929922.77545") :method :outer("11_1268929922.77545")
    .param pmc param_80
    .param pmc param_81
# .annotate "line", 105
    .const 'Sub' $P114 = "23_1268929922.77545" 
    capture_lex $P114
    new $P79, 'ExceptionHandler'
    set_addr $P79, control_78
    $P79."handle_types"(58)
    push_eh $P79
    .lex "self", self
    .lex "$dumper", param_80
    .lex "$label", param_81
# .annotate "line", 106
    $P82 = root_new ['parrot';'ResizablePMCArray']
    .lex "@results", $P82
# .annotate "line", 107
    new $P83, "Undef"
    .lex "$subindent", $P83
# .annotate "line", 108
    new $P84, "Undef"
    .lex "$indent", $P84
# .annotate "line", 109
    new $P85, "Undef"
    .lex "$brace", $P85
# .annotate "line", 110
    new $P86, "Undef"
    .lex "$empty", $P86
# .annotate "line", 112
    new $P87, "Undef"
    .lex "$class", $P87
# .annotate "line", 113
    $P88 = root_new ['parrot';'ResizablePMCArray']
    .lex "@mro", $P88
# .annotate "line", 114
    new $P89, "Undef"
    .lex "$attributes_set", $P89
# .annotate "line", 106
    get_hll_global $P90, ["Parrot"], "call_tuple_method"
    find_lex $P91, "$dumper"
    $P92 = $P90($P91, "newIndent")
    store_lex "@results", $P92
# .annotate "line", 107
    new $P93, "String"
    assign $P93, "\n"
    find_lex $P94, "@results"
    $S95 = $P94."shift"()
    concat $P96, $P93, $S95
    store_lex "$subindent", $P96
# .annotate "line", 108
    new $P97, "String"
    assign $P97, "\n"
    find_lex $P98, "@results"
    $S99 = $P98."shift"()
    concat $P100, $P97, $S99
    store_lex "$indent", $P100
# .annotate "line", 109
    new $P101, "String"
    assign $P101, "{"
    store_lex "$brace", $P101
# .annotate "line", 110
    new $P102, "String"
    assign $P102, ""
    store_lex "$empty", $P102
# .annotate "line", 112
    get_hll_global $P103, ["Opcode"], "class"
    find_lex $P104, "self"
    $P105 = $P103($P104)
    store_lex "$class", $P105
# .annotate "line", 113
    find_lex $P106, "$class"
    $P107 = $P106."inspect"("all_parents")
    store_lex "@mro", $P107
# .annotate "line", 114
    new $P108, "Integer"
    assign $P108, 0
    store_lex "$attributes_set", $P108
# .annotate "line", 116
    find_lex $P110, "@mro"
    defined $I111, $P110
    unless $I111, for_undef_34
    iter $P109, $P110
    new $P194, 'ExceptionHandler'
    set_addr $P194, loop193_handler
    $P194."handle_types"(65, 67, 66)
    push_eh $P194
  loop193_test:
    unless $P109, loop193_done
    shift $P112, $P109
  loop193_redo:
    .const 'Sub' $P114 = "23_1268929922.77545" 
    capture_lex $P114
    $P114($P112)
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
  for_undef_34:
# .annotate "line", 146
    find_lex $P197, "$attributes_set"
    if $P197, if_196
# .annotate "line", 150
    "print"("(no attributes set)")
# .annotate "line", 149
    goto if_196_end
  if_196:
# .annotate "line", 147
    find_lex $P198, "$indent"
    "print"($P198, "}")
  if_196_end:
# .annotate "line", 153
    find_lex $P199, "$dumper"
    $P200 = $P199."deleteIndent"()
# .annotate "line", 105
    .return ($P200)
  control_78:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P201, exception, "payload"
    .return ($P201)
.end


.namespace ["P6object"]
.sub "_block113"  :anon :subid("23_1268929922.77545") :outer("22_1268929922.77545")
    .param pmc param_117
# .annotate "line", 116
    .const 'Sub' $P127 = "24_1268929922.77545" 
    capture_lex $P127
# .annotate "line", 117
    new $P115, "Undef"
    .lex "$parent", $P115
# .annotate "line", 118
    $P116 = root_new ['parrot';'ResizablePMCArray']
    .lex "@attributes", $P116
    .lex "$_", param_117
# .annotate "line", 117
    find_lex $P118, "$_"
    store_lex "$parent", $P118
# .annotate "line", 118
    find_lex $P119, "$parent"
    $P120 = $P119."attributes"()
    $P121 = $P120."keys"()
    store_lex "@attributes", $P121
# .annotate "line", 120
    find_lex $P124, "@attributes"
    set $N125, $P124
    if $N125, if_123
    new $P122, 'Float'
    set $P122, $N125
    goto if_123_end
  if_123:
    .const 'Sub' $P127 = "24_1268929922.77545" 
    capture_lex $P127
    $P192 = $P127()
    set $P122, $P192
  if_123_end:
# .annotate "line", 116
    .return ($P122)
.end


.namespace ["P6object"]
.sub "_block126"  :anon :subid("24_1268929922.77545") :outer("23_1268929922.77545")
# .annotate "line", 120
    .const 'Sub' $P151 = "25_1268929922.77545" 
    capture_lex $P151
# .annotate "line", 124
    new $P128, "Undef"
    .lex "$class_name", $P128
# .annotate "line", 121
    find_lex $P129, "$brace"
    "print"($P129)
# .annotate "line", 122
    find_lex $P130, "$empty"
    store_lex "$brace", $P130
# .annotate "line", 124
    find_lex $P131, "$parent"
    $P132 = $P131."get_namespace"()
    $P133 = $P132."get_name"()
    $P134 = $P133."join"("::")
    store_lex "$class_name", $P134
# .annotate "line", 125
    find_lex $P136, "$_"
    find_lex $P137, "$class"
    issame $I138, $P136, $P137
    if $I138, unless_135_end
# .annotate "line", 126
    find_lex $P139, "$subindent"
    find_lex $P140, "$class_name"
    "print"($P139, "# -- from ", $P140)
  unless_135_end:
# .annotate "line", 129
    find_lex $P141, "$attributes_set"
    find_lex $P142, "@attributes"
    set $N143, $P142
    add $P144, $P141, $N143
    store_lex "$attributes_set", $P144
# .annotate "line", 130
    find_lex $P145, "@attributes"
    $P145."sort"()
# .annotate "line", 132
    find_lex $P147, "@attributes"
    defined $I148, $P147
    unless $I148, for_undef_35
    iter $P146, $P147
    new $P190, 'ExceptionHandler'
    set_addr $P190, loop189_handler
    $P190."handle_types"(65, 67, 66)
    push_eh $P190
  loop189_test:
    unless $P146, loop189_done
    shift $P149, $P146
  loop189_redo:
    .const 'Sub' $P151 = "25_1268929922.77545" 
    capture_lex $P151
    $P151($P149)
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
  for_undef_35:
# .annotate "line", 120
    .return ($P146)
.end


.namespace ["P6object"]
.sub "_block150"  :anon :subid("25_1268929922.77545") :outer("24_1268929922.77545")
    .param pmc param_154
# .annotate "line", 132
    .const 'Sub' $P174 = "26_1268929922.77545" 
    capture_lex $P174
    new $P170, 'ExceptionHandler'
    set_addr $P170, control_169
    $P170."handle_types_except"(58, 59, 60, 61, 63, 64, 65, 66, 67)
    push_eh $P170
# .annotate "line", 133
    new $P152, "Undef"
    .lex "$attr", $P152
# .annotate "line", 134
    new $P153, "Undef"
    .lex "$value", $P153
    .lex "$_", param_154
# .annotate "line", 133
    find_lex $P155, "$_"
    set $S156, $P155
    new $P157, 'String'
    set $P157, $S156
    store_lex "$attr", $P157
# .annotate "line", 134
    find_lex $P158, "self"
    find_lex $P159, "$parent"
    find_lex $P160, "$attr"
    set $S161, $P160
    getattribute $P162, $P158, $P159, $S161
    store_lex "$value", $P162
# .annotate "line", 135
    find_lex $P163, "$subindent"
    find_lex $P164, "$attr"
    "print"($P163, $P164, " => ")
# .annotate "line", 136
    find_lex $P165, "$dumper"
    find_lex $P166, "$label"
    find_lex $P167, "$value"
    $P165."dump"($P166, $P167)
# .annotate "line", 137
    "print"(",")
# .annotate "line", 132
    pop_eh 
    goto skip_handler_168
  control_169:
# .annotate "line", 139
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P174 = "26_1268929922.77545" 
    capture_lex $P174
    $P174(exception)
    new $P187, 'Integer'
    set $P187, 1
    set exception["handled"], $P187
    set $I188, exception["handled"]
    ne $I188, 1, nothandled_172
  handled_171:
    .return (exception)
  nothandled_172:
    rethrow exception
  skip_handler_168:
# .annotate "line", 132
    .return ()
.end


.namespace ["P6object"]
.sub "_block173"  :anon :subid("26_1268929922.77545") :outer("25_1268929922.77545")
    .param pmc param_175
# .annotate "line", 139
    .lex "$_", param_175
    find_lex $P176, "$_"
    .lex "$!", $P176
# .annotate "line", 140
    new $P177, 'String'
    set $P177, "\n*** Bad attribute: "
    find_lex $P178, "$attr"
    concat $P179, $P177, $P178
    concat $P180, $P179, " (from "
    find_lex $P181, "$class_name"
    concat $P182, $P180, $P181
    concat $P183, $P182, "): "
    find_lex $P184, "$!"
    concat $P185, $P183, $P184
    $P186 = "say"($P185)
# .annotate "line", 139
    .return ($P186)
.end


.namespace ["P6object"]
.sub "get_bool"  :subid("27_1268929922.77545") :method :outer("11_1268929922.77545")
# .annotate "line", 156
    new $P204, 'ExceptionHandler'
    set_addr $P204, control_203
    $P204."handle_types"(58)
    push_eh $P204
    .lex "self", self
    .return (1)
  control_203:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P205, exception, "payload"
    .return ($P205)
.end


.namespace ["P6object"]
.sub "get_string"  :subid("28_1268929922.77545") :method :outer("11_1268929922.77545")
# .annotate "line", 160
    new $P208, 'ExceptionHandler'
    set_addr $P208, control_207
    $P208."handle_types"(58)
    push_eh $P208
    .lex "self", self
# .annotate "line", 162
    get_hll_global $P209, ["Opcode"], "typeof"
    find_lex $P210, "self"
    $P211 = $P209($P210)
    concat $P212, $P211, " @"
    find_lex $P213, "self"
    $S214 = $P213."WHERE"()
    concat $P215, $P212, $S214
# .annotate "line", 160
    .return ($P215)
  control_207:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P216, exception, "payload"
    .return ($P216)
.end


.namespace ["P6object"]
.sub "_init_obj"  :subid("29_1268929922.77545") :method :outer("11_1268929922.77545")
    .param pmc param_220 :slurpy
    .param pmc param_221 :slurpy :named
# .annotate "line", 165
    new $P219, 'ExceptionHandler'
    set_addr $P219, control_218
    $P219."handle_types"(58)
    push_eh $P219
    .lex "self", self
    .lex "@pos", param_220
    .lex "%named", param_221
# .annotate "line", 166
    find_lex $P222, "self"
    find_lex $P223, "@pos"
    find_lex $P224, "%named"
    $P225 = $P222."_init_args"($P223 :flat, $P224 :flat)
# .annotate "line", 165
    .return ($P225)
  control_218:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P226, exception, "payload"
    .return ($P226)
.end


.namespace ["P6object"]
.sub "_init_args"  :subid("30_1268929922.77545") :method :outer("11_1268929922.77545")
    .param pmc param_230 :slurpy
    .param pmc param_231 :slurpy :named
# .annotate "line", 169
    .const 'Sub' $P240 = "31_1268929922.77545" 
    capture_lex $P240
    new $P229, 'ExceptionHandler'
    set_addr $P229, control_228
    $P229."handle_types"(58)
    push_eh $P229
    .lex "self", self
    .lex "@pos", param_230
    .lex "%named", param_231
# .annotate "line", 171
    find_lex $P233, "@pos"
    $P234 = $P233."elems"()
    unless $P234, if_232_end
# .annotate "line", 170
    "die"("Default _init_obj cannot handle positional parameters.")
  if_232_end:
# .annotate "line", 173
    find_lex $P236, "%named"
    defined $I237, $P236
    unless $I237, for_undef_36
    iter $P235, $P236
    new $P267, 'ExceptionHandler'
    set_addr $P267, loop266_handler
    $P267."handle_types"(65, 67, 66)
    push_eh $P267
  loop266_test:
    unless $P235, loop266_done
    shift $P238, $P235
  loop266_redo:
    .const 'Sub' $P240 = "31_1268929922.77545" 
    capture_lex $P240
    $P240($P238)
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
  for_undef_36:
    find_lex $P269, "self"
# .annotate "line", 169
    .return ($P269)
  control_228:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P270, exception, "payload"
    .return ($P270)
.end


.namespace ["P6object"]
.sub "_block239"  :anon :subid("31_1268929922.77545") :outer("30_1268929922.77545")
    .param pmc param_241
# .annotate "line", 173
    .lex "$_", param_241
# .annotate "line", 174
    find_lex $P244, "self"
    find_lex $P245, "$_"
    $S246 = $P245."key"()
    can $I247, $P244, $S246
    if $I247, if_243
# .annotate "line", 178
    new $P255, "String"
    assign $P255, "No accessor method '"
    find_lex $P256, "$_"
    $S257 = $P256."key"()
    concat $P258, $P255, $S257
    concat $P259, $P258, "' for class "
# .annotate "line", 179
    find_lex $P260, "self"
    class $P261, $P260
    $P262 = $P261."get_namespace"()
    $S263 = $P262."string_name"()
    concat $P264, $P259, $S263
    $P265 = "die"($P264)
# .annotate "line", 177
    set $P242, $P265
# .annotate "line", 174
    goto if_243_end
  if_243:
# .annotate "line", 175
    get_hll_global $P248, ["Parrot"], "call_method"
    find_lex $P249, "self"
    find_lex $P250, "$_"
    $P251 = $P250."key"()
    find_lex $P252, "$_"
    $P253 = $P252."value"()
    $P254 = $P248($P249, $P251, $P253)
# .annotate "line", 174
    set $P242, $P254
  if_243_end:
# .annotate "line", 173
    .return ($P242)
.end


.namespace ["P6object"]
.sub "isa"  :subid("32_1268929922.77545") :method :outer("11_1268929922.77545")
    .param pmc param_274
# .annotate "line", 188
    new $P273, 'ExceptionHandler'
    set_addr $P273, control_272
    $P273."handle_types"(58)
    push_eh $P273
    .lex "self", self
    .lex "$type", param_274
# .annotate "line", 189
    new $P275, "Exception"
    set $P275['type'], 58
    find_lex $P276, "self"
    $P277 = $P276."HOW"()
    find_lex $P278, "self"
    find_lex $P279, "$type"
    $P280 = $P277."isa"($P278, $P279)
    setattribute $P275, 'payload', $P280
    throw $P275
# .annotate "line", 188
    .return ()
  control_272:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P281, exception, "payload"
    .return ($P281)
.end


.namespace ["P6object"]
.sub "new"  :subid("33_1268929922.77545") :method :outer("11_1268929922.77545")
    .param pmc param_285 :slurpy
    .param pmc param_286 :slurpy :named
# .annotate "line", 192
    new $P284, 'ExceptionHandler'
    set_addr $P284, control_283
    $P284."handle_types"(58)
    push_eh $P284
    .lex "self", self
    .lex "@pos", param_285
    .lex "%named", param_286
# .annotate "line", 193
    new $P287, "Undef"
    .lex "$class", $P287
# .annotate "line", 194
    new $P288, "Undef"
    .lex "$new_object", $P288
# .annotate "line", 193
    find_lex $P289, "self"
    $P290 = $P289."HOW"()
    new $P291, "String"
    assign $P291, "parrotclass"
    set $S292, $P291
    getattribute $P293, $P290, $S292
    store_lex "$class", $P293
# .annotate "line", 194
    find_lex $P294, "$class"
    new $P295, $P294
    store_lex "$new_object", $P295
# .annotate "line", 196
    find_lex $P296, "$new_object"
    find_lex $P297, "@pos"
    find_lex $P298, "%named"
    $P299 = $P296."_init_obj"($P297 :flat, $P298 :flat)
# .annotate "line", 192
    .return ($P299)
  control_283:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P300, exception, "payload"
    .return ($P300)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929846.6043")
# .annotate "line", 0
    get_hll_global $P14, ["P6metaclass"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["P6metaclass"], "_block13" 
    capture_lex $P14
    $P628 = $P14()
# .annotate "line", 1
    .return ($P628)
.end


.namespace ["P6metaclass"]
.sub "_block13"  :subid("11_1268929846.6043") :outer("10_1268929846.6043")
# .annotate "line", 7
    .const 'Sub' $P518 = "32_1268929846.6043" 
    capture_lex $P518
    .const 'Sub' $P470 = "31_1268929846.6043" 
    capture_lex $P470
    .const 'Sub' $P431 = "28_1268929846.6043" 
    capture_lex $P431
    .const 'Sub' $P400 = "26_1268929846.6043" 
    capture_lex $P400
    .const 'Sub' $P391 = "25_1268929846.6043" 
    capture_lex $P391
    .const 'Sub' $P370 = "24_1268929846.6043" 
    capture_lex $P370
    .const 'Sub' $P260 = "21_1268929846.6043" 
    capture_lex $P260
    .const 'Sub' $P235 = "20_1268929846.6043" 
    capture_lex $P235
    .const 'Sub' $P224 = "19_1268929846.6043" 
    capture_lex $P224
    .const 'Sub' $P182 = "18_1268929846.6043" 
    capture_lex $P182
    .const 'Sub' $P55 = "13_1268929846.6043" 
    capture_lex $P55
    .const 'Sub' $P15 = "12_1268929846.6043" 
    capture_lex $P15
    .const 'Sub' $P15 = "12_1268929846.6043" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 70
    .const 'Sub' $P55 = "13_1268929846.6043" 
    capture_lex $P55
    .lex "auto_accessors", $P55
# .annotate "line", 122
    .const 'Sub' $P182 = "18_1268929846.6043" 
    capture_lex $P182
    .lex "declare", $P182
# .annotate "line", 161
    .const 'Sub' $P224 = "19_1268929846.6043" 
    capture_lex $P224
    .lex "dump_class", $P224
# .annotate "line", 166
    .const 'Sub' $P235 = "20_1268929846.6043" 
    capture_lex $P235
    .lex "extends", $P235
# .annotate "line", 179
    .const 'Sub' $P260 = "21_1268929846.6043" 
    capture_lex $P260
    .lex "has", $P260
# .annotate "line", 231
    .const 'Sub' $P370 = "24_1268929846.6043" 
    capture_lex $P370
    .lex "has_vtable", $P370
# .annotate "line", 283
    .const 'Sub' $P391 = "25_1268929846.6043" 
    capture_lex $P391
    .lex "register_pmc_type", $P391
# .annotate "line", 7
    find_lex $P399, "_pre_initload"
# .annotate "line", 47
    find_lex $P468, "auto_accessors"
    find_lex $P469, "declare"
# .annotate "line", 142
    find_lex $P514, "dump_class"
    find_lex $P515, "extends"
    find_lex $P516, "has"
    find_lex $P517, "has_vtable"
# .annotate "line", 241
    find_lex $P627, "register_pmc_type"
# .annotate "line", 7
    .return ($P627)
.end


.namespace ["P6metaclass"]
.sub "_pre_initload"  :subid("12_1268929846.6043") :outer("11_1268929846.6043")
# .annotate "line", 7
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 11
    get_global $P18, "%default_type"
    unless_null $P18, vivify_33
    $P18 = root_new ['parrot';'Hash']
    set_global "%default_type", $P18
  vivify_33:
# .annotate "line", 12
    get_global $P19, "%is_sigil"
    unless_null $P19, vivify_34
    $P19 = root_new ['parrot';'Hash']
    set_global "%is_sigil", $P19
  vivify_34:
# .annotate "line", 13
    get_global $P20, "%is_twigil"
    unless_null $P20, vivify_35
    $P20 = root_new ['parrot';'Hash']
    set_global "%is_twigil", $P20
  vivify_35:
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
    unless_null $P26, vivify_36
    $P26 = root_new ['parrot';'Hash']
    set_global "%default_type", $P26
  vivify_36:
    set $P26["@"], $P25
# .annotate "line", 16
    new $P27, "String"
    assign $P27, "Undef"
    get_global $P28, "%default_type"
    unless_null $P28, vivify_37
    $P28 = root_new ['parrot';'Hash']
    set_global "%default_type", $P28
  vivify_37:
    set $P28["$"], $P27
# .annotate "line", 17
    new $P29, "String"
    assign $P29, "Hash"
    get_global $P30, "%default_type"
    unless_null $P30, vivify_38
    $P30 = root_new ['parrot';'Hash']
    set_global "%default_type", $P30
  vivify_38:
    set $P30["%"], $P29
# .annotate "line", 18
    new $P31, "String"
    assign $P31, "Undef"
    get_global $P32, "%default_type"
    unless_null $P32, vivify_39
    $P32 = root_new ['parrot';'Hash']
    set_global "%default_type", $P32
  vivify_39:
    set $P32["&"], $P31
# .annotate "line", 20
    new $P33, "Integer"
    assign $P33, 1
    get_global $P34, "%is_sigil"
    unless_null $P34, vivify_40
    $P34 = root_new ['parrot';'Hash']
    set_global "%is_sigil", $P34
  vivify_40:
    set $P34["@"], $P33
# .annotate "line", 21
    new $P35, "Integer"
    assign $P35, 1
    get_global $P36, "%is_sigil"
    unless_null $P36, vivify_41
    $P36 = root_new ['parrot';'Hash']
    set_global "%is_sigil", $P36
  vivify_41:
    set $P36["$"], $P35
# .annotate "line", 22
    new $P37, "Integer"
    assign $P37, 1
    get_global $P38, "%is_sigil"
    unless_null $P38, vivify_42
    $P38 = root_new ['parrot';'Hash']
    set_global "%is_sigil", $P38
  vivify_42:
    set $P38["%"], $P37
# .annotate "line", 23
    new $P39, "Integer"
    assign $P39, 1
    get_global $P40, "%is_sigil"
    unless_null $P40, vivify_43
    $P40 = root_new ['parrot';'Hash']
    set_global "%is_sigil", $P40
  vivify_43:
    set $P40["&"], $P39
# .annotate "line", 25
    new $P41, "Integer"
    assign $P41, 1
    get_global $P42, "%is_twigil"
    unless_null $P42, vivify_44
    $P42 = root_new ['parrot';'Hash']
    set_global "%is_twigil", $P42
  vivify_44:
    set $P42["!"], $P41
# .annotate "line", 26
    new $P43, "Integer"
    assign $P43, 1
    get_global $P44, "%is_twigil"
    unless_null $P44, vivify_45
    $P44 = root_new ['parrot';'Hash']
    set_global "%is_twigil", $P44
  vivify_45:
    set $P44["."], $P43
# .annotate "line", 29
    get_hll_global $P45, ["Global"], "inject_root_symbol"
    get_hll_global $P46, ["P6metaclass"], "auto_accessors"
    $P45($P46)
# .annotate "line", 30
    get_hll_global $P47, ["Global"], "inject_root_symbol"
    get_hll_global $P48, ["P6metaclass"], "extends"
    $P47($P48)
# .annotate "line", 31
    get_hll_global $P49, ["Global"], "inject_root_symbol"
    get_hll_global $P50, ["P6metaclass"], "has"
    $P49($P50)
# .annotate "line", 32
    get_hll_global $P51, ["Global"], "inject_root_symbol"
    get_hll_global $P52, ["P6metaclass"], "has_vtable"
    $P53 = $P51($P52)
# .annotate "line", 7
    .return ($P53)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P54, exception, "payload"
    .return ($P54)
.end


.namespace ["P6metaclass"]
.sub "auto_accessors"  :subid("13_1268929846.6043") :outer("11_1268929846.6043")
    .param pmc param_58 :slurpy
    .param pmc param_59 :optional :named("class")
    .param int has_param_59 :opt_flag
    .param pmc param_61 :optional :named("private")
    .param int has_param_61 :opt_flag
    .param pmc param_63 :optional :named("public")
    .param int has_param_63 :opt_flag
# .annotate "line", 70
    .const 'Sub' $P115 = "16_1268929846.6043" 
    capture_lex $P115
    .const 'Sub' $P87 = "15_1268929846.6043" 
    capture_lex $P87
    .const 'Sub' $P79 = "14_1268929846.6043" 
    capture_lex $P79
    new $P57, 'ExceptionHandler'
    set_addr $P57, control_56
    $P57."handle_types"(58)
    push_eh $P57
    .lex "@attrs", param_58
    if has_param_59, optparam_46
    $P60 = "caller_namespace"()
    set param_59, $P60
  optparam_46:
    .lex "$class", param_59
    if has_param_61, optparam_47
    new $P62, "Integer"
    assign $P62, 0
    set param_61, $P62
  optparam_47:
    .lex "$private", param_61
    if has_param_63, optparam_48
    new $P64, "Integer"
    assign $P64, 1
    set param_63, $P64
  optparam_48:
    .lex "$public", param_63
# .annotate "line", 71
    new $P65, "Undef"
    .lex "$parrotclass", $P65
# .annotate "line", 72
    $P66 = root_new ['parrot';'Hash']
    .lex "%all_attrs", $P66
# .annotate "line", 86
    $P67 = root_new ['parrot';'Hash']
    .lex "%make_accessor", $P67
# .annotate "line", 90
    get_global $P68, "%is_sigil"
    unless_null $P68, vivify_49
    $P68 = root_new ['parrot';'Hash']
    set_global "%is_sigil", $P68
  vivify_49:
# .annotate "line", 91
    get_global $P69, "%is_twigil"
    unless_null $P69, vivify_50
    $P69 = root_new ['parrot';'Hash']
    set_global "%is_twigil", $P69
  vivify_50:
# .annotate "line", 92
    get_global $P70, "%default_type"
    unless_null $P70, vivify_51
    $P70 = root_new ['parrot';'Hash']
    set_global "%default_type", $P70
  vivify_51:
# .annotate "line", 93
    get_global $P71, "%methods"
    unless_null $P71, vivify_52
    $P71 = root_new ['parrot';'Hash']
    set_global "%methods", $P71
  vivify_52:
# .annotate "line", 71
    get_hll_global $P72, "P6metaclass"
    find_lex $P73, "$class"
    $P74 = $P72."declare_class"($P73)
    store_lex "$parrotclass", $P74
# .annotate "line", 72
    find_lex $P75, "$parrotclass"
    $P76 = $P75."inspect"("attributes")
    store_lex "%all_attrs", $P76
# .annotate "line", 74
    find_lex $P77, "@attrs"
    .const 'Sub' $P79 = "14_1268929846.6043" 
    capture_lex $P79
    $P85 = $P77."grep"($P79)
    .const 'Sub' $P87 = "15_1268929846.6043" 
    capture_lex $P87
    $P85."map"($P87)
# .annotate "line", 79
    find_lex $P93, "@attrs"
    $P94 = $P93."elems"()
    if $P94, if_92
# .annotate "line", 83
    find_lex $P96, "%all_attrs"
    $P97 = $P96."keys"()
    store_lex "@attrs", $P97
# .annotate "line", 82
    goto if_92_end
  if_92:
# .annotate "line", 80
    new $P95, "Integer"
    assign $P95, 1
    store_lex "$private", $P95
    store_lex "$public", $P95
  if_92_end:
# .annotate "line", 79
    find_lex $P98, "%make_accessor"
# .annotate "line", 87
    find_lex $P99, "$public"
    find_lex $P100, "%make_accessor"
    unless_null $P100, vivify_53
    $P100 = root_new ['parrot';'Hash']
    store_lex "%make_accessor", $P100
  vivify_53:
    set $P100["."], $P99
# .annotate "line", 88
    find_lex $P101, "$public"
    find_lex $P102, "%make_accessor"
    unless_null $P102, vivify_54
    $P102 = root_new ['parrot';'Hash']
    store_lex "%make_accessor", $P102
  vivify_54:
    set $P102[""], $P101
# .annotate "line", 89
    find_lex $P103, "$private"
    find_lex $P104, "%make_accessor"
    unless_null $P104, vivify_55
    $P104 = root_new ['parrot';'Hash']
    store_lex "%make_accessor", $P104
  vivify_55:
    set $P104["!"], $P103
    get_global $P105, "%is_sigil"
    get_global $P106, "%is_twigil"
    get_global $P107, "%default_type"
# .annotate "line", 93
    find_lex $P108, "$parrotclass"
    $P109 = $P108."inspect"("methods")
    set_global "%methods", $P109
# .annotate "line", 95
    find_lex $P111, "@attrs"
    defined $I112, $P111
    unless $I112, for_undef_56
    iter $P110, $P111
    new $P179, 'ExceptionHandler'
    set_addr $P179, loop178_handler
    $P179."handle_types"(65, 67, 66)
    push_eh $P179
  loop178_test:
    unless $P110, loop178_done
    shift $P113, $P110
  loop178_redo:
    .const 'Sub' $P115 = "16_1268929846.6043" 
    capture_lex $P115
    $P115($P113)
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
  for_undef_56:
# .annotate "line", 70
    .return ($P110)
  control_56:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P181, exception, "payload"
    .return ($P181)
.end


.namespace ["P6metaclass"]
.sub "_block78"  :anon :subid("14_1268929846.6043") :outer("13_1268929846.6043")
    .param pmc param_80
# .annotate "line", 74
    .lex "$attr", param_80
    find_lex $P81, "%all_attrs"
    find_lex $P82, "$attr"
    $P83 = $P81."contains"($P82)
    isfalse $I84, $P83
    .return ($I84)
.end


.namespace ["P6metaclass"]
.sub "_block86"  :anon :subid("15_1268929846.6043") :outer("13_1268929846.6043")
    .param pmc param_88
# .annotate "line", 74
    .lex "$attr", param_88
# .annotate "line", 75
    find_lex $P89, "$parrotclass"
    find_lex $P90, "$attr"
    $P91 = $P89."add_attribute"($P90)
# .annotate "line", 74
    .return ($P91)
.end


.namespace ["P6metaclass"]
.sub "_block114"  :anon :subid("16_1268929846.6043") :outer("13_1268929846.6043")
    .param pmc param_116
# .annotate "line", 95
    .const 'Sub' $P161 = "17_1268929846.6043" 
    capture_lex $P161
    .lex "$attr", param_116
# .annotate "line", 96
    new $P117, "Undef"
    .lex "$sigil", $P117
# .annotate "line", 101
    new $P118, "Undef"
    .lex "$twigil", $P118
# .annotate "line", 105
    new $P119, "Undef"
    .lex "$name_start", $P119
# .annotate "line", 106
    new $P120, "Undef"
    .lex "$method_name", $P120
# .annotate "line", 96
    find_lex $P121, "$attr"
    unless_null $P121, vivify_57
    $P121 = root_new ['parrot';'ResizablePMCArray']
  vivify_57:
    set $P122, $P121[0]
    unless_null $P122, vivify_58
    new $P122, "Undef"
  vivify_58:
    store_lex "$sigil", $P122
# .annotate "line", 98
    find_lex $P124, "$sigil"
    get_global $P125, "%is_sigil"
    unless_null $P125, vivify_59
    $P125 = root_new ['parrot';'Hash']
  vivify_59:
    set $P126, $P125[$P124]
    unless_null $P126, vivify_60
    new $P126, "Undef"
  vivify_60:
    if $P126, unless_123_end
    new $P127, 'String'
    set $P127, "Invalid attribute name: "
    find_lex $P128, "$attr"
    concat $P129, $P127, $P128
    concat $P130, $P129, " - must have sigil("
    set $S131, "$@%&"
    concat $P132, $P130, $S131
    concat $P133, $P132, ")"
    "die"($P133)
  unless_123_end:
# .annotate "line", 101
    find_lex $P134, "$attr"
    unless_null $P134, vivify_61
    $P134 = root_new ['parrot';'ResizablePMCArray']
  vivify_61:
    set $P135, $P134[1]
    unless_null $P135, vivify_62
    new $P135, "Undef"
  vivify_62:
    store_lex "$twigil", $P135
# .annotate "line", 102
    find_lex $P137, "$twigil"
    get_global $P138, "%is_twigil"
    unless_null $P138, vivify_63
    $P138 = root_new ['parrot';'Hash']
  vivify_63:
    set $P139, $P138[$P137]
    unless_null $P139, vivify_64
    new $P139, "Undef"
  vivify_64:
    if $P139, unless_136_end
    new $P140, "String"
    assign $P140, ""
    store_lex "$twigil", $P140
  unless_136_end:
# .annotate "line", 105
    find_lex $P141, "$sigil"
    $P142 = $P141."length"()
    find_lex $P143, "$twigil"
    $N144 = $P143."length"()
    add $P145, $P142, $N144
    store_lex "$name_start", $P145
# .annotate "line", 106
    find_lex $P146, "$attr"
    find_lex $P147, "$name_start"
    $P148 = $P146."substr"($P147)
    store_lex "$method_name", $P148
# .annotate "line", 108
    find_lex $P153, "$twigil"
    find_lex $P154, "%make_accessor"
    unless_null $P154, vivify_65
    $P154 = root_new ['parrot';'Hash']
  vivify_65:
    set $P155, $P154[$P153]
    unless_null $P155, vivify_66
    new $P155, "Undef"
  vivify_66:
    if $P155, if_152
    set $P151, $P155
    goto if_152_end
  if_152:
    get_global $P156, "%methods"
    find_lex $P157, "$method_name"
    $P158 = $P156."contains"($P157)
    isfalse $I159, $P158
    new $P151, 'Integer'
    set $P151, $I159
  if_152_end:
    if $P151, if_150
    set $P149, $P151
    goto if_150_end
  if_150:
    .const 'Sub' $P161 = "17_1268929846.6043" 
    capture_lex $P161
    $P177 = $P161()
    set $P149, $P177
  if_150_end:
# .annotate "line", 95
    .return ($P149)
.end


.namespace ["P6metaclass"]
.sub "_block160"  :anon :subid("17_1268929846.6043") :outer("16_1268929846.6043")
# .annotate "line", 110
    $P162 = root_new ['parrot';'Hash']
    .lex "%attr_info", $P162
    get_hll_global $P163, "Hash"
    find_lex $P164, "$method_name"
    find_lex $P165, "$sigil"
    get_global $P166, "%default_type"
    unless_null $P166, vivify_67
    $P166 = root_new ['parrot';'Hash']
  vivify_67:
    set $P167, $P166[$P165]
    unless_null $P167, vivify_68
    new $P167, "Undef"
  vivify_68:
    find_lex $P168, "$attr"
    $P169 = $P163."new"($P164 :named("accessor"), $P167 :named("default_type"), $P168 :named("name"))
    store_lex "%attr_info", $P169
# .annotate "line", 116
    find_lex $P170, "%attr_info"
    find_lex $P171, "$method_name"
    get_global $P172, "%methods"
    unless_null $P172, vivify_69
    $P172 = root_new ['parrot';'Hash']
    set_global "%methods", $P172
  vivify_69:
    set $P172[$P171], $P170
# .annotate "line", 117
    get_hll_global $P173, "P6metaclass"
    find_lex $P174, "$parrotclass"
    find_lex $P175, "%attr_info"
    $P176 = $P173."_make_accessor"($P174, $P175)
# .annotate "line", 108
    .return ($P176)
.end


.namespace ["P6metaclass"]
.sub "declare"  :subid("18_1268929846.6043") :outer("11_1268929846.6043")
    .param pmc param_185 :optional
    .param int has_param_185 :opt_flag
    .param pmc param_187 :optional :named("has")
    .param int has_param_187 :opt_flag
    .param pmc param_189 :optional :named("is")
    .param int has_param_189 :opt_flag
# .annotate "line", 122
    new $P184, 'ExceptionHandler'
    set_addr $P184, control_183
    $P184."handle_types"(58)
    push_eh $P184
    if has_param_185, optparam_70
    new $P186, "Undef"
    set param_185, $P186
  optparam_70:
    .lex "$class", param_185
    if has_param_187, optparam_71
    $P188 = root_new ['parrot';'ResizablePMCArray']
    set param_187, $P188
  optparam_71:
    .lex "@has", param_187
    if has_param_189, optparam_72
    $P190 = root_new ['parrot';'ResizablePMCArray']
    set param_189, $P190
  optparam_72:
    .lex "@is", param_189
# .annotate "line", 129
    new $P191, "Undef"
    .lex "$parent", $P191
# .annotate "line", 135
    new $P192, "Undef"
    .lex "$parrotclass", $P192
# .annotate "line", 123
    get_hll_global $P194, ["Opcode"], "does"
    find_lex $P195, "@is"
    $P196 = $P194($P195, "array")
    isfalse $I197, $P196
    unless $I197, if_193_end
    get_hll_global $P198, ["Array"], "new"
    find_lex $P199, "@is"
    $P200 = $P198($P199)
    store_lex "@is", $P200
  if_193_end:
# .annotate "line", 125
    get_hll_global $P202, ["Opcode"], "defined"
    find_lex $P203, "$class"
    $P204 = $P202($P203)
    if $P204, unless_201_end
# .annotate "line", 126
    $P205 = "caller_namespace"()
    store_lex "$class", $P205
  unless_201_end:
# .annotate "line", 125
    find_lex $P206, "$parent"
# .annotate "line", 131
    find_lex $P208, "@is"
    set $N209, $P208
    unless $N209, if_207_end
# .annotate "line", 132
    find_lex $P210, "@is"
    $P211 = $P210."shift"()
    store_lex "$parent", $P211
  if_207_end:
# .annotate "line", 135
    get_hll_global $P212, "P6metaclass"
    find_lex $P213, "$class"
    find_lex $P214, "$parent"
    $P215 = $P212."declare_class"($P213, $P214)
    store_lex "$parrotclass", $P215
# .annotate "line", 137
    get_hll_global $P216, "P6metaclass"
    find_lex $P217, "$parrotclass"
    find_lex $P218, "@is"
    $P216."_add_parents"($P217, $P218)
# .annotate "line", 138
    get_hll_global $P219, "P6metaclass"
    find_lex $P220, "$parrotclass"
    find_lex $P221, "@has"
    $P222 = $P219."_add_attributes"($P220, $P221)
# .annotate "line", 122
    .return ($P222)
  control_183:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P223, exception, "payload"
    .return ($P223)
.end


.namespace ["P6metaclass"]
.sub "dump_class"  :subid("19_1268929846.6043") :outer("11_1268929846.6043")
    .param pmc param_227
# .annotate "line", 161
    new $P226, 'ExceptionHandler'
    set_addr $P226, control_225
    $P226."handle_types"(58)
    push_eh $P226
    .lex "$class", param_227
# .annotate "line", 162
    get_hll_global $P228, "P6metaclass"
    find_lex $P229, "$class"
    $P230 = $P228."get_parrotclass"($P229)
    find_lex $P231, "$class"
    set $S232, $P231
    $P233 = "_dumper"($P230, $S232)
# .annotate "line", 161
    .return ($P233)
  control_225:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P234, exception, "payload"
    .return ($P234)
.end


.namespace ["P6metaclass"]
.sub "extends"  :subid("20_1268929846.6043") :outer("11_1268929846.6043")
    .param pmc param_238
    .param pmc param_239 :slurpy
    .param pmc param_240 :optional :named("class")
    .param int has_param_240 :opt_flag
# .annotate "line", 166
    new $P237, 'ExceptionHandler'
    set_addr $P237, control_236
    $P237."handle_types"(58)
    push_eh $P237
    .lex "$first", param_238
    .lex "@parents", param_239
    if has_param_240, optparam_73
    new $P241, "Undef"
    set param_240, $P241
  optparam_73:
    .lex "$class", param_240
# .annotate "line", 167
    get_hll_global $P243, ["Opcode"], "does"
    find_lex $P244, "$first"
    $P245 = $P243($P244, "array")
    if $P245, if_242
# .annotate "line", 171
    find_lex $P247, "@parents"
    find_lex $P248, "$first"
    $P247."unshift"($P248)
# .annotate "line", 170
    goto if_242_end
  if_242:
# .annotate "line", 168
    find_lex $P246, "$first"
    store_lex "@parents", $P246
  if_242_end:
# .annotate "line", 174
    find_lex $P250, "$class"
    set $P249, $P250
    defined $I252, $P249
    if $I252, default_251
    $P253 = "caller_namespace"()
    $P254 = $P253."string_name"()
    set $P249, $P254
  default_251:
    store_lex "$class", $P249
# .annotate "line", 175
    get_hll_global $P255, "P6metaclass"
    find_lex $P256, "$class"
    find_lex $P257, "@parents"
    $P258 = $P255."_add_parents"($P256, $P257)
# .annotate "line", 166
    .return ($P258)
  control_236:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P259, exception, "payload"
    .return ($P259)
.end


.namespace ["P6metaclass"]
.sub "has"  :subid("21_1268929846.6043") :outer("11_1268929846.6043")
    .param pmc param_263 :slurpy
    .param pmc param_264 :optional :named("class")
    .param int has_param_264 :opt_flag
    .param pmc param_266 :slurpy :named
# .annotate "line", 179
    .const 'Sub' $P291 = "22_1268929846.6043" 
    capture_lex $P291
    new $P262, 'ExceptionHandler'
    set_addr $P262, control_261
    $P262."handle_types"(58)
    push_eh $P262
    .lex "@args", param_263
    if has_param_264, optparam_74
    new $P265, "Undef"
    set param_264, $P265
  optparam_74:
    .lex "$class", param_264
    .lex "%opts", param_266
# .annotate "line", 181
    get_global $P267, "%default_type"
    unless_null $P267, vivify_75
    $P267 = root_new ['parrot';'Hash']
    set_global "%default_type", $P267
  vivify_75:
# .annotate "line", 182
    get_global $P268, "%is_sigil"
    unless_null $P268, vivify_76
    $P268 = root_new ['parrot';'Hash']
    set_global "%is_sigil", $P268
  vivify_76:
# .annotate "line", 183
    get_global $P269, "%is_twigil"
    unless_null $P269, vivify_77
    $P269 = root_new ['parrot';'Hash']
    set_global "%is_twigil", $P269
  vivify_77:
# .annotate "line", 179
    get_global $P270, "%default_type"
    get_global $P271, "%is_sigil"
    get_global $P272, "%is_twigil"
# .annotate "line", 185
    find_lex $P274, "$class"
    $P275 = $P274."defined"()
    if $P275, unless_273_end
    $P276 = "caller_namespace"()
    store_lex "$class", $P276
  unless_273_end:
# .annotate "line", 188
    find_lex $P280, "@args"
    set $N281, $P280
    iseq $I282, $N281, 1.0
    if $I282, if_279
    new $P278, 'Integer'
    set $P278, $I282
    goto if_279_end
  if_279:
    find_lex $P283, "@args"
    unless_null $P283, vivify_78
    $P283 = root_new ['parrot';'ResizablePMCArray']
  vivify_78:
    set $P284, $P283[0]
    unless_null $P284, vivify_79
    new $P284, "Undef"
  vivify_79:
    $P285 = $P284."isa"("String")
    isfalse $I286, $P285
    new $P278, 'Integer'
    set $P278, $I286
  if_279_end:
    unless $P278, if_277_end
# .annotate "line", 189
    find_lex $P287, "@args"
    unless_null $P287, vivify_80
    $P287 = root_new ['parrot';'ResizablePMCArray']
  vivify_80:
    set $P288, $P287[0]
    unless_null $P288, vivify_81
    new $P288, "Undef"
  vivify_81:
    store_lex "@args", $P288
  if_277_end:
# .annotate "line", 192
    new $P363, 'ExceptionHandler'
    set_addr $P363, loop362_handler
    $P363."handle_types"(65, 67, 66)
    push_eh $P363
  loop362_test:
    find_lex $P289, "@args"
    unless $P289, loop362_done
  loop362_redo:
    .const 'Sub' $P291 = "22_1268929846.6043" 
    capture_lex $P291
    $P291()
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
# .annotate "line", 228
    get_hll_global $P365, "P6metaclass"
    find_lex $P366, "$class"
    find_lex $P367, "%opts"
    $P368 = $P365."_add_attributes"($P366, $P367)
# .annotate "line", 179
    .return ($P368)
  control_261:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P369, exception, "payload"
    .return ($P369)
.end


.namespace ["P6metaclass"]
.sub "_block290"  :anon :subid("22_1268929846.6043") :outer("21_1268929846.6043")
# .annotate "line", 192
    .const 'Sub' $P303 = "23_1268929846.6043" 
    capture_lex $P303
# .annotate "line", 193
    new $P292, "Undef"
    .lex "$next", $P292
# .annotate "line", 194
    $P293 = root_new ['parrot';'ResizablePMCArray']
    .lex "@words", $P293
# .annotate "line", 193
    find_lex $P294, "@args"
    $P295 = $P294."shift"()
    store_lex "$next", $P295
# .annotate "line", 194
    find_lex $P296, "$next"
    $P297 = $P296."split"(" ")
    store_lex "@words", $P297
# .annotate "line", 196
    find_lex $P299, "@words"
    defined $I300, $P299
    unless $I300, for_undef_82
    iter $P298, $P299
    new $P360, 'ExceptionHandler'
    set_addr $P360, loop359_handler
    $P360."handle_types"(65, 67, 66)
    push_eh $P360
  loop359_test:
    unless $P298, loop359_done
    shift $P301, $P298
  loop359_redo:
    .const 'Sub' $P303 = "23_1268929846.6043" 
    capture_lex $P303
    $P303($P301)
  loop359_next:
    goto loop359_test
  loop359_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P361, exception, 'type'
    eq $P361, 65, loop359_next
    eq $P361, 67, loop359_redo
  loop359_done:
    pop_eh 
  for_undef_82:
# .annotate "line", 192
    .return ($P298)
.end


.namespace ["P6metaclass"]
.sub "_block302"  :anon :subid("23_1268929846.6043") :outer("22_1268929846.6043")
    .param pmc param_308
# .annotate "line", 198
    new $P304, "Undef"
    .lex "$attr", $P304
# .annotate "line", 199
    new $P305, "Undef"
    .lex "$twigil", $P305
# .annotate "line", 200
    new $P306, "Undef"
    .lex "$sigil", $P306
# .annotate "line", 213
    new $P307, "Undef"
    .lex "$base_name", $P307
    .lex "$_", param_308
# .annotate "line", 198
    find_lex $P309, "$_"
    set $S310, $P309
    new $P311, 'String'
    set $P311, $S310
    store_lex "$attr", $P311
# .annotate "line", 199
    new $P312, "String"
    assign $P312, "!"
    store_lex "$twigil", $P312
# .annotate "line", 200
    find_lex $P313, "$attr"
    unless_null $P313, vivify_83
    $P313 = root_new ['parrot';'ResizablePMCArray']
  vivify_83:
    set $P314, $P313[0]
    unless_null $P314, vivify_84
    new $P314, "Undef"
  vivify_84:
    store_lex "$sigil", $P314
# .annotate "line", 202
    find_lex $P316, "$sigil"
    get_global $P317, "%is_sigil"
    unless_null $P317, vivify_85
    $P317 = root_new ['parrot';'Hash']
  vivify_85:
    set $P318, $P317[$P316]
    unless_null $P318, vivify_86
    new $P318, "Undef"
  vivify_86:
    if $P318, if_315
# .annotate "line", 206
    new $P321, "String"
    assign $P321, "$"
    store_lex "$sigil", $P321
# .annotate "line", 205
    goto if_315_end
  if_315:
# .annotate "line", 203
    find_lex $P319, "$attr"
    $P320 = $P319."substr"(1)
    store_lex "$attr", $P320
  if_315_end:
# .annotate "line", 209
    find_lex $P323, "$attr"
    unless_null $P323, vivify_87
    $P323 = root_new ['parrot';'ResizablePMCArray']
  vivify_87:
    set $P324, $P323[0]
    unless_null $P324, vivify_88
    new $P324, "Undef"
  vivify_88:
    get_global $P325, "%is_twigil"
    unless_null $P325, vivify_89
    $P325 = root_new ['parrot';'Hash']
  vivify_89:
    set $P326, $P325[$P324]
    unless_null $P326, vivify_90
    new $P326, "Undef"
  vivify_90:
    if $P326, unless_322_end
# .annotate "line", 210
    new $P327, "String"
    assign $P327, "!"
    find_lex $P328, "$attr"
    concat $P329, $P327, $P328
    store_lex "$attr", $P329
  unless_322_end:
# .annotate "line", 213
    find_lex $P330, "$attr"
    $P331 = $P330."substr"(1)
    store_lex "$base_name", $P331
# .annotate "line", 215
    find_lex $P333, "%opts"
    find_lex $P334, "$base_name"
    $P335 = $P333."contains"($P334)
    unless $P335, if_332_end
# .annotate "line", 216
    new $P336, 'String'
    set $P336, "Re-declaration of attribute '"
    find_lex $P337, "$base_name"
    concat $P338, $P336, $P337
    concat $P339, $P338, "'"
    "die"($P339)
  if_332_end:
# .annotate "line", 219
    get_hll_global $P340, "Hash"
    find_lex $P341, "$base_name"
    find_lex $P342, "$sigil"
    get_global $P343, "%default_type"
    unless_null $P343, vivify_91
    $P343 = root_new ['parrot';'Hash']
  vivify_91:
    set $P344, $P343[$P342]
    unless_null $P344, vivify_92
    new $P344, "Undef"
  vivify_92:
# .annotate "line", 222
    find_lex $P347, "$attr"
    unless_null $P347, vivify_93
    $P347 = root_new ['parrot';'ResizablePMCArray']
  vivify_93:
    set $P348, $P347[0]
    unless_null $P348, vivify_94
    new $P348, "Undef"
  vivify_94:
    set $S349, $P348
    iseq $I350, $S349, "!"
    if $I350, if_346
    new $P352, "Integer"
    assign $P352, 0
    set $P345, $P352
    goto if_346_end
  if_346:
    new $P351, "Integer"
    assign $P351, 1
    set $P345, $P351
  if_346_end:
# .annotate "line", 223
    find_lex $P353, "$sigil"
    find_lex $P354, "$attr"
    concat $P355, $P353, $P354
    $P356 = $P340."new"($P341 :named("accessor"), $P344 :named("default_type"), $P345 :named("is_private"), $P355 :named("name"))
# .annotate "line", 219
    find_lex $P357, "$base_name"
    find_lex $P358, "%opts"
    unless_null $P358, vivify_95
    $P358 = root_new ['parrot';'Hash']
    store_lex "%opts", $P358
  vivify_95:
    set $P358[$P357], $P356
# .annotate "line", 196
    .return ($P356)
.end


.namespace ["P6metaclass"]
.sub "has_vtable"  :subid("24_1268929846.6043") :outer("11_1268929846.6043")
    .param pmc param_373
    .param pmc param_374
    .param pmc param_375 :optional :named("class")
    .param int has_param_375 :opt_flag
# .annotate "line", 231
    new $P372, 'ExceptionHandler'
    set_addr $P372, control_371
    $P372."handle_types"(58)
    push_eh $P372
    .lex "$name", param_373
    .lex "&code", param_374
    if has_param_375, optparam_96
    $P376 = "caller_namespace"()
    $P377 = $P376."get_class"()
    set param_375, $P377
  optparam_96:
    .lex "$class", param_375
# .annotate "line", 232
    new $P378, "Undef"
    .lex "$parrot_class", $P378
    get_hll_global $P379, "P6metaclass"
    find_lex $P380, "$class"
    $P381 = $P379."get_parrotclass"($P380)
    store_lex "$parrot_class", $P381
# .annotate "line", 234
    find_lex $P383, "$parrot_class"
    isnull $I384, $P383
    unless $I384, if_382_end
# .annotate "line", 235
    find_lex $P385, "$class"
    "die"("Undefined class '", $P385, "'")
  if_382_end:
# .annotate "line", 238
    find_lex $P386, "$parrot_class"
    find_lex $P387, "$name"
    find_lex $P388, "&code"
    $P389 = $P386."add_vtable_override"($P387, $P388)
# .annotate "line", 231
    .return ($P389)
  control_371:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P390, exception, "payload"
    .return ($P390)
.end


.namespace ["P6metaclass"]
.sub "register_pmc_type"  :subid("25_1268929846.6043") :outer("11_1268929846.6043")
    .param pmc param_394
# .annotate "line", 283
    new $P393, 'ExceptionHandler'
    set_addr $P393, control_392
    $P393."handle_types"(58)
    push_eh $P393
    .lex "$type", param_394
# .annotate "line", 284
    get_hll_global $P395, "P6metaclass"
    find_lex $P396, "$type"
    $P397 = $P395."register"($P396)
# .annotate "line", 283
    .return ($P397)
  control_392:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P398, exception, "payload"
    .return ($P398)
.end


.namespace ["P6metaclass"]
.sub "_add_attributes"  :subid("26_1268929846.6043") :method :outer("11_1268929846.6043")
    .param pmc param_403
    .param pmc param_404
# .annotate "line", 35
    .const 'Sub' $P414 = "27_1268929846.6043" 
    capture_lex $P414
    new $P402, 'ExceptionHandler'
    set_addr $P402, control_401
    $P402."handle_types"(58)
    push_eh $P402
    .lex "self", self
    .lex "$class", param_403
    .lex "%attrs", param_404
# .annotate "line", 36
    new $P405, "Undef"
    .lex "$parrotclass", $P405
    find_lex $P406, "self"
    find_lex $P407, "$class"
    $P408 = $P406."declare_class"($P407)
    store_lex "$parrotclass", $P408
# .annotate "line", 38
    find_lex $P410, "%attrs"
    defined $I411, $P410
    unless $I411, for_undef_97
    iter $P409, $P410
    new $P428, 'ExceptionHandler'
    set_addr $P428, loop427_handler
    $P428."handle_types"(65, 67, 66)
    push_eh $P428
  loop427_test:
    unless $P409, loop427_done
    shift $P412, $P409
  loop427_redo:
    .const 'Sub' $P414 = "27_1268929846.6043" 
    capture_lex $P414
    $P414($P412)
  loop427_next:
    goto loop427_test
  loop427_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P429, exception, 'type'
    eq $P429, 65, loop427_next
    eq $P429, 67, loop427_redo
  loop427_done:
    pop_eh 
  for_undef_97:
# .annotate "line", 35
    .return ($P409)
  control_401:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P430, exception, "payload"
    .return ($P430)
.end


.namespace ["P6metaclass"]
.sub "_block413"  :anon :subid("27_1268929846.6043") :outer("26_1268929846.6043")
    .param pmc param_416
# .annotate "line", 39
    $P415 = root_new ['parrot';'Hash']
    .lex "%attr_info", $P415
    .lex "$_", param_416
    find_lex $P417, "$_"
    find_lex $P418, "%attrs"
    unless_null $P418, vivify_98
    $P418 = root_new ['parrot';'Hash']
  vivify_98:
    set $P419, $P418[$P417]
    unless_null $P419, vivify_99
    new $P419, "Undef"
  vivify_99:
    store_lex "%attr_info", $P419
# .annotate "line", 41
    find_lex $P420, "$parrotclass"
    find_lex $P421, "%attr_info"
    unless_null $P421, vivify_100
    $P421 = root_new ['parrot';'Hash']
  vivify_100:
    set $P422, $P421["name"]
    unless_null $P422, vivify_101
    new $P422, "Undef"
  vivify_101:
    $P420."add_attribute"($P422)
# .annotate "line", 42
    find_lex $P423, "self"
    find_lex $P424, "$parrotclass"
    find_lex $P425, "%attr_info"
    $P426 = $P423."_make_accessor"($P424, $P425)
# .annotate "line", 38
    .return ($P426)
.end


.namespace ["P6metaclass"]
.sub "_add_parents"  :subid("28_1268929846.6043") :method :outer("11_1268929846.6043")
    .param pmc param_434
    .param pmc param_435
# .annotate "line", 47
    .const 'Sub' $P443 = "29_1268929846.6043" 
    capture_lex $P443
    new $P433, 'ExceptionHandler'
    set_addr $P433, control_432
    $P433."handle_types"(58)
    push_eh $P433
    .lex "self", self
    .lex "$class", param_434
    .lex "@parents", param_435
# .annotate "line", 49
    find_lex $P437, "$class"
    $P438 = $P437."defined"()
    if $P438, unless_436_end
# .annotate "line", 50
    "die"("Cannot add parents to undefined class.")
  unless_436_end:
# .annotate "line", 53
    find_lex $P441, "@parents"
    if $P441, if_440
    set $P439, $P441
    goto if_440_end
  if_440:
    .const 'Sub' $P443 = "29_1268929846.6043" 
    capture_lex $P443
    $P466 = $P443()
    set $P439, $P466
  if_440_end:
# .annotate "line", 47
    .return ($P439)
  control_432:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P467, exception, "payload"
    .return ($P467)
.end


.namespace ["P6metaclass"]
.sub "_block442"  :anon :subid("29_1268929846.6043") :outer("28_1268929846.6043")
# .annotate "line", 53
    .const 'Sub' $P457 = "30_1268929846.6043" 
    capture_lex $P457
# .annotate "line", 54
    new $P444, "Undef"
    .lex "$first", $P444
# .annotate "line", 55
    new $P445, "Undef"
    .lex "$parrotclass", $P445
# .annotate "line", 54
    find_lex $P446, "@parents"
    $P447 = $P446."shift"()
    store_lex "$first", $P447
# .annotate "line", 55
    find_lex $P448, "self"
    find_lex $P449, "$class"
    find_lex $P450, "$first"
    $P451 = $P448."declare_class"($P449, $P450 :named("parent"))
    store_lex "$parrotclass", $P451
# .annotate "line", 57
    find_lex $P453, "@parents"
    defined $I454, $P453
    unless $I454, for_undef_102
    iter $P452, $P453
    new $P464, 'ExceptionHandler'
    set_addr $P464, loop463_handler
    $P464."handle_types"(65, 67, 66)
    push_eh $P464
  loop463_test:
    unless $P452, loop463_done
    shift $P455, $P452
  loop463_redo:
    .const 'Sub' $P457 = "30_1268929846.6043" 
    capture_lex $P457
    $P457($P455)
  loop463_next:
    goto loop463_test
  loop463_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P465, exception, 'type'
    eq $P465, 65, loop463_next
    eq $P465, 67, loop463_redo
  loop463_done:
    pop_eh 
  for_undef_102:
# .annotate "line", 53
    .return ($P452)
.end


.namespace ["P6metaclass"]
.sub "_block456"  :anon :subid("30_1268929846.6043") :outer("29_1268929846.6043")
    .param pmc param_458
# .annotate "line", 57
    .lex "$_", param_458
# .annotate "line", 58
    find_lex $P459, "self"
    find_lex $P460, "$parrotclass"
    find_lex $P461, "$_"
    $P462 = $P459."add_parent"($P460, $P461)
# .annotate "line", 57
    .return ($P462)
.end


.namespace ["P6metaclass"]
.sub "declare_class"  :subid("31_1268929846.6043") :method :outer("11_1268929846.6043")
    .param pmc param_473
    .param pmc param_474 :optional :named("parent")
    .param int has_param_474 :opt_flag
# .annotate "line", 142
    new $P472, 'ExceptionHandler'
    set_addr $P472, control_471
    $P472."handle_types"(58)
    push_eh $P472
    .lex "self", self
    .lex "$class", param_473
    if has_param_474, optparam_103
    new $P475, "Undef"
    set param_474, $P475
  optparam_103:
    .lex "$parent", param_474
# .annotate "line", 144
    new $P476, "Undef"
    .lex "$parrotclass", $P476
# .annotate "line", 143
    find_lex $P478, "$class"
    set $P477, $P478
    defined $I480, $P477
    if $I480, default_479
    $P481 = "die"("Cannot declare undefined class - give me a string name or a namespace")
    set $P477, $P481
  default_479:
    store_lex "$class", $P477
# .annotate "line", 144
    find_lex $P482, "self"
    find_lex $P483, "$class"
    $P484 = $P482."get_parrotclass"($P483)
    store_lex "$parrotclass", $P484
# .annotate "line", 147
    get_hll_global $P488, ["Opcode"], "isnull"
    find_lex $P489, "$parrotclass"
    $P490 = $P488($P489)
    isfalse $I491, $P490
    if $I491, if_487
    new $P486, 'Integer'
    set $P486, $I491
    goto if_487_end
  if_487:
    get_hll_global $P492, ["Opcode"], "isa"
    find_lex $P493, "$parrotclass"
    $P494 = $P492($P493, "P6object")
    set $P486, $P494
  if_487_end:
    if $P486, unless_485_end
# .annotate "line", 148
    find_lex $P498, "$parent"
    new $P499, "String"
    assign $P499, "P6protoobject"
    isa $I500, $P498, $P499
    unless $I500, unless_497
    new $P496, 'Integer'
    set $P496, $I500
    goto unless_497_end
  unless_497:
    get_hll_global $P501, ["Opcode"], "defined"
    find_lex $P502, "$parent"
    $P503 = $P501($P502)
    set $P496, $P503
  unless_497_end:
    if $P496, if_495
# .annotate "line", 152
    find_lex $P507, "self"
    find_lex $P508, "$class"
    $P507."new_class"($P508)
# .annotate "line", 151
    goto if_495_end
  if_495:
# .annotate "line", 149
    find_lex $P504, "self"
    find_lex $P505, "$class"
    find_lex $P506, "$parent"
    $P504."new_class"($P505, $P506 :named("parent"))
  if_495_end:
# .annotate "line", 155
    find_lex $P509, "self"
    find_lex $P510, "$class"
    $P511 = $P509."get_parrotclass"($P510)
    store_lex "$parrotclass", $P511
  unless_485_end:
# .annotate "line", 147
    find_lex $P512, "$parrotclass"
# .annotate "line", 142
    .return ($P512)
  control_471:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P513, exception, "payload"
    .return ($P513)
.end


.namespace ["P6metaclass"]
.sub "_make_accessor"  :subid("32_1268929846.6043") :method :outer("11_1268929846.6043")
    .param pmc param_521
    .param pmc param_522
# .annotate "line", 241
    new $P520, 'ExceptionHandler'
    set_addr $P520, control_519
    $P520."handle_types"(58)
    push_eh $P520
    .lex "self", self
    .lex "$parrotclass", param_521
    .lex "%info", param_522
# .annotate "line", 242
    new $P523, "Undef"
    .lex "$namespace", $P523
# .annotate "line", 244
    $P524 = root_new ['parrot';'Hash']
    .lex "%accessor_details", $P524
# .annotate "line", 255
    new $P525, "Undef"
    .lex "$attr", $P525
# .annotate "line", 256
    new $P526, "Undef"
    .lex "$debug", $P526
# .annotate "line", 242
    find_lex $P527, "$parrotclass"
    $P528 = $P527."get_namespace"()
    store_lex "$namespace", $P528
# .annotate "line", 244
    get_hll_global $P529, "Hash"
    find_lex $P530, "%info"
    unless_null $P530, vivify_104
    $P530 = root_new ['parrot';'Hash']
  vivify_104:
    set $P531, $P530["accessor"]
    unless_null $P531, vivify_105
    new $P531, "Undef"
  vivify_105:
# .annotate "line", 246
    find_lex $P532, "$parrotclass"
    $P533 = $P532."get_namespace"()
    $P534 = $P529."new"($P531 :named("name"), $P533 :named("namespace"), 1 :named("method"))
# .annotate "line", 244
    store_lex "%accessor_details", $P534
# .annotate "line", 252
    new $P535, "ResizablePMCArray"
    push $P535, ".param pmc value :optional"
    push $P535, ".param int has_value :opt_flag"
    find_lex $P536, "%accessor_details"
    unless_null $P536, vivify_106
    $P536 = root_new ['parrot';'Hash']
    store_lex "%accessor_details", $P536
  vivify_106:
    set $P536["params"], $P535
# .annotate "line", 255
    find_lex $P537, "%info"
    unless_null $P537, vivify_107
    $P537 = root_new ['parrot';'Hash']
  vivify_107:
    set $P538, $P537["name"]
    unless_null $P538, vivify_108
    new $P538, "Undef"
  vivify_108:
    store_lex "$attr", $P538
# .annotate "line", 256
    find_lex $P541, "%info"
    unless_null $P541, vivify_109
    $P541 = root_new ['parrot';'Hash']
  vivify_109:
    set $P542, $P541["debug"]
    unless_null $P542, vivify_110
    new $P542, "Undef"
  vivify_110:
    if $P542, if_540
    new $P544, "String"
    assign $P544, "# "
    set $P539, $P544
    goto if_540_end
  if_540:
    new $P543, "String"
    assign $P543, ""
    set $P539, $P543
  if_540_end:
    store_lex "$debug", $P539
# .annotate "line", 258
    get_hll_global $P545, ["Array"], "new"
# .annotate "line", 259
    new $P546, "String"
    assign $P546, "\t"
    concat $P547, $P546, "if has_value goto set_value"
# .annotate "line", 260
    new $P548, "String"
    assign $P548, "\t"
    find_lex $P549, "$debug"
    concat $P550, $P548, $P549
    new $P551, 'String'
    set $P551, "say \"Fetching attribute '"
    find_lex $P552, "$attr"
    concat $P553, $P551, $P552
    concat $P554, $P553, "'\""
    concat $P555, $P550, $P554
# .annotate "line", 261
    new $P556, "String"
    assign $P556, "\t"
    new $P557, 'String'
    set $P557, "value = getattribute self, '"
    find_lex $P558, "$attr"
    concat $P559, $P557, $P558
    concat $P560, $P559, "'"
    concat $P561, $P556, $P560
# .annotate "line", 262
    new $P562, "String"
    assign $P562, "\t"
    concat $P563, $P562, "unless null value goto have_value"
# .annotate "line", 263
    new $P564, "String"
    assign $P564, "\t"
    find_lex $P565, "$debug"
    concat $P566, $P564, $P565
    concat $P567, $P566, "say \"Creating new PMC type: "
    find_lex $P568, "%info"
    unless_null $P568, vivify_111
    $P568 = root_new ['parrot';'Hash']
  vivify_111:
    set $P569, $P568["default_type"]
    unless_null $P569, vivify_112
    new $P569, "Undef"
  vivify_112:
    concat $P570, $P567, $P569
    concat $P571, $P570, "\""
# .annotate "line", 264
    new $P572, "String"
    assign $P572, "\t"
    concat $P573, $P572, "value = new [ '"
    find_lex $P574, "%info"
    unless_null $P574, vivify_113
    $P574 = root_new ['parrot';'Hash']
  vivify_113:
    set $P575, $P574["default_type"]
    unless_null $P575, vivify_114
    new $P575, "Undef"
  vivify_114:
    concat $P576, $P573, $P575
    concat $P577, $P576, "' ]"
# .annotate "line", 265
    new $P578, "String"
    assign $P578, "\t"
    new $P579, 'String'
    set $P579, "setattribute self, '"
    find_lex $P580, "$attr"
    concat $P581, $P579, $P580
    concat $P582, $P581, "', value"
    concat $P583, $P578, $P582
# .annotate "line", 268
    new $P584, "String"
    assign $P584, "\t"
    find_lex $P585, "$debug"
    concat $P586, $P584, $P585
    concat $P587, $P586, "$P0 = get_hll_global [ \"Dumper\" ], \"DUMP_\""
# .annotate "line", 269
    new $P588, "String"
    assign $P588, "\t"
    find_lex $P589, "$debug"
    concat $P590, $P588, $P589
    concat $P591, $P590, "$P0(value)"
# .annotate "line", 270
    new $P592, "String"
    assign $P592, "\t"
    concat $P593, $P592, ".return (value)"
# .annotate "line", 273
    new $P594, "String"
    assign $P594, "\t"
    find_lex $P595, "$debug"
    concat $P596, $P594, $P595
    new $P597, 'String'
    set $P597, "say \"Setting attribute '"
    find_lex $P598, "$attr"
    concat $P599, $P597, $P598
    concat $P600, $P599, "'\""
    concat $P601, $P596, $P600
# .annotate "line", 274
    new $P602, "String"
    assign $P602, "\t"
    find_lex $P603, "$debug"
    concat $P604, $P602, $P603
    concat $P605, $P604, "$P0 = get_hll_global [ \"Dumper\" ], \"DUMP_\""
# .annotate "line", 275
    new $P606, "String"
    assign $P606, "\t"
    find_lex $P607, "$debug"
    concat $P608, $P606, $P607
    concat $P609, $P608, "$P0(value)"
# .annotate "line", 276
    new $P610, "String"
    assign $P610, "\t"
    new $P611, 'String'
    set $P611, "setattribute self, '"
    find_lex $P612, "$attr"
    concat $P613, $P611, $P612
    concat $P614, $P613, "', value"
    concat $P615, $P610, $P614
# .annotate "line", 277
    new $P616, "String"
    assign $P616, "\t"
    concat $P617, $P616, ".return (self)"
    $P618 = $P545($P547, $P555, $P561, $P563, $P571, $P577, $P583, "have_value:", $P587, $P591, $P593, "set_value:", $P601, $P605, $P609, $P615, $P617)
# .annotate "line", 258
    find_lex $P619, "%accessor_details"
    unless_null $P619, vivify_115
    $P619 = root_new ['parrot';'Hash']
    store_lex "%accessor_details", $P619
  vivify_115:
    set $P619["body"], $P618
# .annotate "line", 280
    get_hll_global $P620, ["Parrot"], "call_sub_"
    get_hll_global $P621, ["Pir"], "compile_sub"
    get_hll_global $P622, ["Array"], "new"
    $P623 = $P622()
    find_lex $P624, "%accessor_details"
    $P625 = $P620($P621, $P623, $P624)
# .annotate "line", 241
    .return ($P625)
  control_519:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P626, exception, "payload"
    .return ($P626)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929820.86391")
# .annotate "line", 0
    get_hll_global $P14, ["ComponentMarshaller"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["ComponentMarshaller"], "_block13" 
    capture_lex $P14
    $P118 = $P14()
# .annotate "line", 1
    .return ($P118)
.end


.namespace ["ComponentMarshaller"]
.sub "_block13"  :subid("11_1268929820.86391") :outer("10_1268929820.86391")
# .annotate "line", 7
    .const 'Sub' $P83 = "17_1268929820.86391" 
    capture_lex $P83
    .const 'Sub' $P74 = "16_1268929820.86391" 
    capture_lex $P74
    .const 'Sub' $P67 = "15_1268929820.86391" 
    capture_lex $P67
    .const 'Sub' $P54 = "14_1268929820.86391" 
    capture_lex $P54
    .const 'Sub' $P23 = "13_1268929820.86391" 
    capture_lex $P23
    .const 'Sub' $P15 = "12_1268929820.86391" 
    capture_lex $P15
# .annotate "line", 10
    .const 'Sub' $P15 = "12_1268929820.86391" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 7
    find_lex $P22, "_pre_initload"
# .annotate "line", 47
    .const 'Sub' $P83 = "17_1268929820.86391" 
    capture_lex $P83
# .annotate "line", 7
    .return ($P83)
.end


.namespace ["ComponentMarshaller"]
.sub "_pre_initload"  :subid("12_1268929820.86391") :outer("11_1268929820.86391")
    .param pmc param_18 :slurpy
# .annotate "line", 10
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "@modules_done", param_18
# .annotate "line", 11
    new $P19, "ResizablePMCArray"
    push $P19, "$!name"
    push $P19, "$!queue"
    $P20 = "has"($P19)
# .annotate "line", 10
    .return ($P20)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P21, exception, "payload"
    .return ($P21)
.end


.namespace ["ComponentMarshaller"]
.sub "add_call"  :subid("13_1268929820.86391") :method :outer("11_1268929820.86391")
    .param pmc param_26
    .param pmc param_27 :optional
    .param int has_param_27 :opt_flag
    .param pmc param_29 :optional :named("namespace")
    .param int has_param_29 :opt_flag
    .param pmc param_32 :optional :named("requires")
    .param int has_param_32 :opt_flag
# .annotate "line", 22
    new $P25, 'ExceptionHandler'
    set_addr $P25, control_24
    $P25."handle_types"(58)
    push_eh $P25
    .lex "self", self
    .lex "$sub", param_26
    if has_param_27, optparam_18
    new $P28, "Undef"
    set param_27, $P28
  optparam_18:
    .lex "$name", param_27
    if has_param_29, optparam_19
    get_hll_global $P30, ["Parrot"], "caller_namepace"
    $P31 = $P30()
    set param_29, $P31
  optparam_19:
    .lex "$namespace", param_29
    if has_param_32, optparam_20
    $P33 = root_new ['parrot';'ResizablePMCArray']
    set param_32, $P33
  optparam_20:
    .lex "@requires", param_32
# .annotate "line", 25
    find_lex $P35, "$sub"
    $P36 = $P35."isa"("Sub")
    if $P36, unless_34_end
# .annotate "line", 24
    get_hll_global $P37, ["Parrot"], "qualified_name"
    find_lex $P38, "$sub"
    find_lex $P39, "$namespace"
    $P40 = $P37($P38, $P39 :named("namespace"))
    store_lex "$sub", $P40
  unless_34_end:
# .annotate "line", 28
    find_lex $P42, "$name"
    $P43 = $P42."defined"()
    if $P43, unless_41_end
# .annotate "line", 27
    get_hll_global $P44, ["Parrot"], "qualified_name"
    find_lex $P45, "$sub"
    $P46 = $P44($P45)
    store_lex "$name", $P46
  unless_41_end:
# .annotate "line", 30
    find_lex $P47, "self"
    getattribute $P48, $P47, "$!queue"
    unless_null $P48, vivify_21
    new $P48, "Undef"
  vivify_21:
    find_lex $P49, "$name"
    find_lex $P50, "$sub"
    find_lex $P51, "@requires"
    $P52 = $P48."add_entry"($P49, $P50, $P51)
# .annotate "line", 22
    .return ($P52)
  control_24:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P53, exception, "payload"
    .return ($P53)
.end


.namespace ["ComponentMarshaller"]
.sub "_init_obj"  :subid("14_1268929820.86391") :method :outer("11_1268929820.86391")
    .param pmc param_57 :slurpy
    .param pmc param_58 :slurpy :named
# .annotate "line", 33
    new $P56, 'ExceptionHandler'
    set_addr $P56, control_55
    $P56."handle_types"(58)
    push_eh $P56
    .lex "self", self
    .lex "@pos", param_57
    .lex "%named", param_58
# .annotate "line", 34
    get_hll_global $P59, "DependencyQueue"
    $P60 = $P59."new"()
    find_lex $P61, "self"
    setattribute $P61, "$!queue", $P60
# .annotate "line", 36
    find_lex $P62, "self"
    find_lex $P63, "@pos"
    find_lex $P64, "%named"
    $P65 = $P62."_init_args"($P63 :flat, $P64 :flat)
# .annotate "line", 33
    .return ($P65)
  control_55:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P66, exception, "payload"
    .return ($P66)
.end


.namespace ["ComponentMarshaller"]
.sub "is_empty"  :subid("15_1268929820.86391") :method :outer("11_1268929820.86391")
# .annotate "line", 39
    new $P69, 'ExceptionHandler'
    set_addr $P69, control_68
    $P69."handle_types"(58)
    push_eh $P69
    .lex "self", self
# .annotate "line", 40
    find_lex $P70, "self"
    getattribute $P71, $P70, "$!queue"
    unless_null $P71, vivify_22
    new $P71, "Undef"
  vivify_22:
    $P72 = $P71."is_empty"()
# .annotate "line", 39
    .return ($P72)
  control_68:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P73, exception, "payload"
    .return ($P73)
.end


.namespace ["ComponentMarshaller"]
.sub "mark_as_done"  :subid("16_1268929820.86391") :method :outer("11_1268929820.86391")
    .param pmc param_77
# .annotate "line", 43
    new $P76, 'ExceptionHandler'
    set_addr $P76, control_75
    $P76."handle_types"(58)
    push_eh $P76
    .lex "self", self
    .lex "$name", param_77
# .annotate "line", 44
    find_lex $P78, "self"
    getattribute $P79, $P78, "$!queue"
    unless_null $P79, vivify_23
    new $P79, "Undef"
  vivify_23:
    find_lex $P80, "$name"
    $P81 = $P79."mark_as_done"($P80)
# .annotate "line", 43
    .return ($P81)
  control_75:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P82, exception, "payload"
    .return ($P82)
.end


.namespace ["ComponentMarshaller"]
.sub "process_queue"  :subid("17_1268929820.86391") :method :outer("11_1268929820.86391")
    .param pmc param_86
# .annotate "line", 47
    new $P85, 'ExceptionHandler'
    set_addr $P85, control_84
    $P85."handle_types"(58)
    push_eh $P85
    .lex "self", self
    .lex "$invocant", param_86
# .annotate "line", 48
    new $P87, "Undef"
    .lex "&callee", $P87
# .annotate "line", 47
    find_lex $P88, "&callee"
# .annotate "line", 51
    new $P112, 'ExceptionHandler'
    set_addr $P112, loop111_handler
    $P112."handle_types"(65, 67, 66)
    push_eh $P112
  loop111_test:
    find_lex $P89, "self"
    getattribute $P90, $P89, "$!queue"
    unless_null $P90, vivify_24
    new $P90, "Undef"
  vivify_24:
    $P91 = $P90."is_empty"()
    if $P91, loop111_done
  loop111_redo:
# .annotate "line", 52
    find_lex $P92, "self"
    getattribute $P93, $P92, "$!queue"
    unless_null $P93, vivify_25
    new $P93, "Undef"
  vivify_25:
    $P94 = $P93."next_entry"()
    store_lex "&callee", $P94
# .annotate "line", 55
    find_lex $P96, "&callee"
    $P97 = $P96."isa"("String")
    unless $P97, if_95_end
# .annotate "line", 54
    get_hll_global $P98, ["Parrot"], "get_hll_global"
    find_lex $P99, "&callee"
    $P100 = $P98($P99)
    store_lex "&callee", $P100
  if_95_end:
# .annotate "line", 58
    find_lex $P102, "&callee"
    isnull $I103, $P102
    unless $I103, if_101_end
# .annotate "line", 57
    new $P104, 'String'
    set $P104, "Got null callee while processing "
    find_lex $P105, "self"
    getattribute $P106, $P105, "$!name"
    unless_null $P106, vivify_26
    new $P106, "Undef"
  vivify_26:
    concat $P107, $P104, $P106
    concat $P108, $P107, " queue"
    "die"($P108)
  if_101_end:
# .annotate "line", 60
    find_lex $P109, "&callee"
    find_lex $P110, "$invocant"
    $P109($P110)
  loop111_next:
# .annotate "line", 51
    goto loop111_test
  loop111_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, 'type'
    eq $P113, 65, loop111_next
    eq $P113, 67, loop111_redo
  loop111_done:
    pop_eh 
# .annotate "line", 63
    find_lex $P114, "self"
    getattribute $P115, $P114, "$!queue"
    unless_null $P115, vivify_27
    new $P115, "Undef"
  vivify_27:
    $P116 = $P115."reset"()
# .annotate "line", 47
    .return ($P116)
  control_84:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, "payload"
    .return ($P117)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929898.08508")
# .annotate "line", 0
    get_hll_global $P14, ["Cuculus";"Antiphon"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["Cuculus";"Antiphon"], "_block13" 
    capture_lex $P14
    $P150 = $P14()
# .annotate "line", 1
    .return ($P150)
.end


.namespace []
.sub "" :load :init :subid("post21") :outer("10_1268929898.08508")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268929898.08508" 
    .local pmc block
    set block, $P12
    $P151 = get_root_global ["parrot"], "P6metaclass"
    new $P152, "ResizablePMCArray"
    push $P152, "$!sig_matcher"
    push $P152, "@!side_effects"
    push $P152, "$!throw"
    push $P152, "$!return"
    push $P152, "$!invoke_count"
    $P151."new_class"("Cuculus::Antiphon", $P152 :named("attr"))
.end


.namespace ["Cuculus";"Antiphon"]
.sub "_block13"  :subid("11_1268929898.08508") :outer("10_1268929898.08508")
# .annotate "line", 6
    .const 'Sub' $P142 = "20_1268929898.08508" 
    capture_lex $P142
    .const 'Sub' $P134 = "19_1268929898.08508" 
    capture_lex $P134
    .const 'Sub' $P125 = "18_1268929898.08508" 
    capture_lex $P125
    .const 'Sub' $P99 = "17_1268929898.08508" 
    capture_lex $P99
    .const 'Sub' $P85 = "16_1268929898.08508" 
    capture_lex $P85
    .const 'Sub' $P39 = "14_1268929898.08508" 
    capture_lex $P39
    .const 'Sub' $P24 = "13_1268929898.08508" 
    capture_lex $P24
    .const 'Sub' $P15 = "12_1268929898.08508" 
    capture_lex $P15
# .annotate "line", 66
    .const 'Sub' $P142 = "20_1268929898.08508" 
    capture_lex $P142
# .annotate "line", 6
    .return ($P142)
.end


.namespace ["Cuculus";"Antiphon"]
.sub "matches"  :subid("12_1268929898.08508") :method :outer("11_1268929898.08508")
    .param pmc param_18
# .annotate "line", 12
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
    .lex "$call_sig", param_18
# .annotate "line", 13
    find_lex $P19, "self"
    getattribute $P20, $P19, "$!sig_matcher"
    unless_null $P20, vivify_22
    new $P20, "Undef"
  vivify_22:
    find_lex $P21, "$call_sig"
    $P22 = $P20."matches"($P21)
# .annotate "line", 12
    .return ($P22)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P23, exception, "payload"
    .return ($P23)
.end


.namespace ["Cuculus";"Antiphon"]
.sub "_init_obj"  :subid("13_1268929898.08508") :method :outer("11_1268929898.08508")
    .param pmc param_27 :slurpy
    .param pmc param_28 :slurpy :named
# .annotate "line", 16
    new $P26, 'ExceptionHandler'
    set_addr $P26, control_25
    $P26."handle_types"(58)
    push_eh $P26
    .lex "self", self
    .lex "@pos", param_27
    .lex "%named", param_28
# .annotate "line", 17
    new $P29, "Integer"
    assign $P29, 0
    find_lex $P30, "self"
    setattribute $P30, "$!invoke_count", $P29
# .annotate "line", 18
    get_hll_global $P31, ["Array"], "new"
    $P32 = $P31()
    find_lex $P33, "self"
    setattribute $P33, "@!side_effects", $P32
# .annotate "line", 20
    find_lex $P34, "self"
    find_lex $P35, "@pos"
    find_lex $P36, "%named"
    $P37 = $P34."_init_args"($P35 :flat, $P36 :flat)
# .annotate "line", 16
    .return ($P37)
  control_25:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P38, exception, "payload"
    .return ($P38)
.end


.namespace ["Cuculus";"Antiphon"]
.sub "invoke"  :subid("14_1268929898.08508") :method :outer("11_1268929898.08508")
    .param pmc param_42
# .annotate "line", 23
    .const 'Sub' $P63 = "15_1268929898.08508" 
    capture_lex $P63
    new $P41, 'ExceptionHandler'
    set_addr $P41, control_40
    $P41."handle_types"(58)
    push_eh $P41
    .lex "self", self
    .lex "$callsig", param_42
# .annotate "line", 25
    new $P43, "Undef"
    .lex "$object", $P43
# .annotate "line", 26
    new $P44, "Undef"
    .lex "$result", $P44
# .annotate "line", 27
    $P45 = root_new ['parrot';'ResizablePMCArray']
    .lex "@pos", $P45
# .annotate "line", 28
    $P46 = root_new ['parrot';'Hash']
    .lex "%named", $P46
# .annotate "line", 23
    find_lex $P47, "self"
    getattribute $P48, $P47, "$!invoke_count"
    unless_null $P48, vivify_23
    new $P48, "Undef"
  vivify_23:
    clone $P49, $P48
    inc $P48
# .annotate "line", 25
    find_lex $P50, "$callsig"
    $P51 = $P50."object"()
    store_lex "$object", $P51
# .annotate "line", 26
    find_lex $P52, "$object"
    store_lex "$result", $P52
# .annotate "line", 27
    find_lex $P53, "$callsig"
    $P54 = $P53."positional"()
    store_lex "@pos", $P54
# .annotate "line", 28
    find_lex $P55, "$callsig"
    $P56 = $P55."named"()
    store_lex "%named", $P56
# .annotate "line", 30
    find_lex $P58, "self"
    getattribute $P59, $P58, "@!side_effects"
    unless_null $P59, vivify_24
    $P59 = root_new ['parrot';'ResizablePMCArray']
  vivify_24:
    defined $I60, $P59
    unless $I60, for_undef_25
    iter $P57, $P59
    new $P70, 'ExceptionHandler'
    set_addr $P70, loop69_handler
    $P70."handle_types"(65, 67, 66)
    push_eh $P70
  loop69_test:
    unless $P57, loop69_done
    shift $P61, $P57
  loop69_redo:
    .const 'Sub' $P63 = "15_1268929898.08508" 
    capture_lex $P63
    $P63($P61)
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
  for_undef_25:
# .annotate "line", 34
    find_lex $P73, "self"
    getattribute $P74, $P73, "$!throw"
    unless_null $P74, vivify_26
    new $P74, "Undef"
  vivify_26:
    unless $P74, if_72_end
# .annotate "line", 36
    find_lex $P75, "self"
    getattribute $P76, $P75, "$!throw"
    unless_null $P76, vivify_27
    new $P76, "Undef"
  vivify_27:
    $P76."throw"()
  if_72_end:
# .annotate "line", 39
    find_lex $P78, "self"
    getattribute $P79, $P78, "$!return"
    unless_null $P79, vivify_28
    new $P79, "Undef"
  vivify_28:
    unless $P79, if_77_end
# .annotate "line", 40
    new $P80, "Exception"
    set $P80['type'], 58
    find_lex $P81, "self"
    getattribute $P82, $P81, "$!return"
    unless_null $P82, vivify_29
    new $P82, "Undef"
  vivify_29:
    setattribute $P80, 'payload', $P82
    throw $P80
  if_77_end:
# .annotate "line", 39
    find_lex $P83, "$result"
# .annotate "line", 23
    .return ($P83)
  control_40:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P84, exception, "payload"
    .return ($P84)
.end


.namespace ["Cuculus";"Antiphon"]
.sub "_block62"  :anon :subid("15_1268929898.08508") :outer("14_1268929898.08508")
    .param pmc param_64
# .annotate "line", 30
    .lex "&do", param_64
# .annotate "line", 31
    find_lex $P65, "&do"
    find_lex $P66, "@pos"
    find_lex $P67, "%named"
    $P68 = $P65($P66 :flat, $P67 :flat)
    store_lex "$result", $P68
# .annotate "line", 30
    .return ($P68)
.end


.namespace ["Cuculus";"Antiphon"]
.sub "sig_matcher"  :subid("16_1268929898.08508") :method :outer("11_1268929898.08508")
    .param pmc param_88 :optional
    .param int has_param_88 :opt_flag
# .annotate "line", 46
    new $P87, 'ExceptionHandler'
    set_addr $P87, control_86
    $P87."handle_types"(58)
    push_eh $P87
    .lex "self", self
    if has_param_88, optparam_30
    new $P89, "Undef"
    set param_88, $P89
  optparam_30:
    .lex "$value", param_88
    find_lex $P92, "$value"
    $P93 = $P92."defined"()
    if $P93, if_91
    find_lex $P96, "self"
    getattribute $P97, $P96, "$!sig_matcher"
    unless_null $P97, vivify_31
    new $P97, "Undef"
  vivify_31:
    set $P90, $P97
    goto if_91_end
  if_91:
    find_lex $P94, "$value"
    find_lex $P95, "self"
    setattribute $P95, "$!sig_matcher", $P94
    set $P90, $P94
  if_91_end:
    .return ($P90)
  control_86:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P98, exception, "payload"
    .return ($P98)
.end


.namespace ["Cuculus";"Antiphon"]
.sub "will"  :subid("17_1268929898.08508") :method :outer("11_1268929898.08508")
    .param pmc param_102 :optional :named("do")
    .param int has_param_102 :opt_flag
    .param pmc param_104 :optional :named("return")
    .param int has_param_104 :opt_flag
    .param pmc param_106 :optional :named("throw")
    .param int has_param_106 :opt_flag
# .annotate "line", 48
    new $P101, 'ExceptionHandler'
    set_addr $P101, control_100
    $P101."handle_types"(58)
    push_eh $P101
    .lex "self", self
    if has_param_102, optparam_32
    new $P103, "Undef"
    set param_102, $P103
  optparam_32:
    .lex "&do", param_102
    if has_param_104, optparam_33
    new $P105, "Undef"
    set param_104, $P105
  optparam_33:
    .lex "$return", param_104
    if has_param_106, optparam_34
    new $P107, "Undef"
    set param_106, $P107
  optparam_34:
    .lex "$throw", param_106
# .annotate "line", 49
    find_lex $P109, "&do"
    $P110 = $P109."defined"()
    unless $P110, if_108_end
    find_lex $P111, "self"
    find_lex $P112, "&do"
    $P111."will_do"($P112)
  if_108_end:
# .annotate "line", 50
    find_lex $P114, "$return"
    $P115 = $P114."defined"()
    unless $P115, if_113_end
    find_lex $P116, "self"
    find_lex $P117, "$return"
    $P116."will_return"($P117)
  if_113_end:
# .annotate "line", 51
    find_lex $P119, "$throw"
    $P120 = $P119."defined"()
    unless $P120, if_118_end
    find_lex $P121, "self"
    find_lex $P122, "$throw"
    $P121."will_throw"($P122)
  if_118_end:
    find_lex $P123, "self"
# .annotate "line", 48
    .return ($P123)
  control_100:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P124, exception, "payload"
    .return ($P124)
.end


.namespace ["Cuculus";"Antiphon"]
.sub "will_do"  :subid("18_1268929898.08508") :method :outer("11_1268929898.08508")
    .param pmc param_128
# .annotate "line", 56
    new $P127, 'ExceptionHandler'
    set_addr $P127, control_126
    $P127."handle_types"(58)
    push_eh $P127
    .lex "self", self
    .lex "&closure", param_128
# .annotate "line", 57
    find_lex $P129, "self"
    getattribute $P130, $P129, "@!side_effects"
    unless_null $P130, vivify_35
    $P130 = root_new ['parrot';'ResizablePMCArray']
  vivify_35:
    find_lex $P131, "&closure"
    $P130."push"($P131)
    find_lex $P132, "self"
# .annotate "line", 56
    .return ($P132)
  control_126:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P133, exception, "payload"
    .return ($P133)
.end


.namespace ["Cuculus";"Antiphon"]
.sub "will_return"  :subid("19_1268929898.08508") :method :outer("11_1268929898.08508")
    .param pmc param_137
# .annotate "line", 61
    new $P136, 'ExceptionHandler'
    set_addr $P136, control_135
    $P136."handle_types"(58)
    push_eh $P136
    .lex "self", self
    .lex "$result", param_137
# .annotate "line", 62
    find_lex $P138, "$result"
    find_lex $P139, "self"
    setattribute $P139, "$!return", $P138
    find_lex $P140, "self"
# .annotate "line", 61
    .return ($P140)
  control_135:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P141, exception, "payload"
    .return ($P141)
.end


.namespace ["Cuculus";"Antiphon"]
.sub "will_throw"  :subid("20_1268929898.08508") :method :outer("11_1268929898.08508")
    .param pmc param_145
# .annotate "line", 66
    new $P144, 'ExceptionHandler'
    set_addr $P144, control_143
    $P144."handle_types"(58)
    push_eh $P144
    .lex "self", self
    .lex "$exception", param_145
# .annotate "line", 67
    find_lex $P146, "$exception"
    find_lex $P147, "self"
    setattribute $P147, "$!throw", $P146
    find_lex $P148, "self"
# .annotate "line", 66
    .return ($P148)
  control_143:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P149, exception, "payload"
    .return ($P149)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929828.27403")
# .annotate "line", 0
    get_hll_global $P14, ["Cuculus";"Canorus"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["Cuculus";"Canorus"], "_block13" 
    capture_lex $P14
    $P479 = $P14()
# .annotate "line", 1
    .return ($P479)
.end


.namespace []
.sub "" :load :init :subid("post39") :outer("10_1268929828.27403")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268929828.27403" 
    .local pmc block
    set block, $P12
    $P480 = get_root_global ["parrot"], "P6metaclass"
    new $P481, "ResizablePMCArray"
    push $P481, "@!antiphons"
    push $P481, "@!call_log"
    push $P481, "$!class"
    push $P481, "%!passthrough_antiphons"
    push $P481, "$!verifier"
    $P480."new_class"("Cuculus::Canorus", $P481 :named("attr"))
.end


.namespace ["Cuculus";"Canorus"]
.sub "_block13"  :subid("11_1268929828.27403") :outer("10_1268929828.27403")
# .annotate "line", 6
    .const 'Sub' $P463 = "38_1268929828.27403" 
    capture_lex $P463
    .const 'Sub' $P449 = "37_1268929828.27403" 
    capture_lex $P449
    .const 'Sub' $P435 = "36_1268929828.27403" 
    capture_lex $P435
    .const 'Sub' $P418 = "35_1268929828.27403" 
    capture_lex $P418
    .const 'Sub' $P393 = "34_1268929828.27403" 
    capture_lex $P393
    .const 'Sub' $P349 = "32_1268929828.27403" 
    capture_lex $P349
    .const 'Sub' $P310 = "31_1268929828.27403" 
    capture_lex $P310
    .const 'Sub' $P259 = "28_1268929828.27403" 
    capture_lex $P259
    .const 'Sub' $P243 = "27_1268929828.27403" 
    capture_lex $P243
    .const 'Sub' $P220 = "26_1268929828.27403" 
    capture_lex $P220
    .const 'Sub' $P189 = "25_1268929828.27403" 
    capture_lex $P189
    .const 'Sub' $P183 = "24_1268929828.27403" 
    capture_lex $P183
    .const 'Sub' $P177 = "23_1268929828.27403" 
    capture_lex $P177
    .const 'Sub' $P165 = "22_1268929828.27403" 
    capture_lex $P165
    .const 'Sub' $P153 = "21_1268929828.27403" 
    capture_lex $P153
    .const 'Sub' $P128 = "20_1268929828.27403" 
    capture_lex $P128
    .const 'Sub' $P109 = "18_1268929828.27403" 
    capture_lex $P109
    .const 'Sub' $P46 = "15_1268929828.27403" 
    capture_lex $P46
    .const 'Sub' $P33 = "14_1268929828.27403" 
    capture_lex $P33
    .const 'Sub' $P20 = "13_1268929828.27403" 
    capture_lex $P20
    .const 'Sub' $P15 = "12_1268929828.27403" 
    capture_lex $P15
# .annotate "line", 23
    .const 'Sub' $P15 = "12_1268929828.27403" 
    capture_lex $P15
    .lex "_initload", $P15
# .annotate "line", 49
    .const 'Sub' $P20 = "13_1268929828.27403" 
    capture_lex $P20
    .lex "get_behavior", $P20
# .annotate "line", 58
    .const 'Sub' $P33 = "14_1268929828.27403" 
    capture_lex $P33
    .lex "get_cuckoo", $P33
# .annotate "line", 67
    .const 'Sub' $P46 = "15_1268929828.27403" 
    capture_lex $P46
    .lex "get_passthrough_antiphons", $P46
# .annotate "line", 105
    .const 'Sub' $P109 = "18_1268929828.27403" 
    capture_lex $P109
    .lex "get_rootclass_methods", $P109
# .annotate "line", 206
    .const 'Sub' $P128 = "20_1268929828.27403" 
    capture_lex $P128
    .lex "mock_class_name", $P128
# .annotate "line", 247
    .const 'Sub' $P153 = "21_1268929828.27403" 
    capture_lex $P153
    .lex "new_antiphon", $P153
# .annotate "line", 12
    find_lex $P164, "_initload"
# .annotate "line", 39
    find_lex $P216, "get_behavior"
    find_lex $P217, "get_cuckoo"
    find_lex $P218, "get_passthrough_antiphons"
    find_lex $P219, "get_rootclass_methods"
# .annotate "line", 186
    find_lex $P348, "mock_class_name"
# .annotate "line", 233
    find_lex $P417, "new_antiphon"
# .annotate "line", 275
    .const 'Sub' $P463 = "38_1268929828.27403" 
    capture_lex $P463
# .annotate "line", 6
    .return ($P463)
.end


.namespace ["Cuculus";"Canorus"]
.sub "" :load :init :subid("post40") :outer("11_1268929828.27403")
# .annotate "line", 6
    get_hll_global $P14, ["Cuculus";"Canorus"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 13
    new $P477, "ResizablePMCArray"
    push $P477, "add_antiphon"
    push $P477, "get_behavior"
    push $P477, "get_cuckoo"
    push $P477, "verify_calls"
    "export"($P477)
# .annotate "line", 20
    get_hll_global $P478, ["Kakapo"], "depends_on"
    $P478("Cuculus::SigMatcher")
.end


.namespace ["Cuculus";"Canorus"]
.sub "_initload"  :subid("12_1268929828.27403") :outer("11_1268929828.27403")
# .annotate "line", 23
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 24
    $P18 = "use"("Cuculus::SigMatcher")
# .annotate "line", 23
    .return ($P18)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P19, exception, "payload"
    .return ($P19)
.end


.namespace ["Cuculus";"Canorus"]
.sub "get_behavior"  :subid("13_1268929828.27403") :outer("11_1268929828.27403")
    .param pmc param_23
# .annotate "line", 49
    new $P22, 'ExceptionHandler'
    set_addr $P22, control_21
    $P22."handle_types"(58)
    push_eh $P22
    .lex "$egg", param_23
# .annotate "line", 50
    find_lex $P25, "$egg"
    $P26 = "isa"($P25, "Cuculus::Canorus::Ovum")
    if $P26, unless_24_end
# .annotate "line", 51
    find_lex $P27, "$egg"
    "_dumper"($P27)
# .annotate "line", 52
    "die"("Must be called with a Cuckoo's egg.")
  unless_24_end:
# .annotate "line", 55
    find_lex $P28, "$egg"
    new $P29, "String"
    assign $P29, "&!CUCULUS_BEHAVIOR"
    set $S30, $P29
    getattribute $P31, $P28, $S30
# .annotate "line", 49
    .return ($P31)
  control_21:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P32, exception, "payload"
    .return ($P32)
.end


.namespace ["Cuculus";"Canorus"]
.sub "get_cuckoo"  :subid("14_1268929828.27403") :outer("11_1268929828.27403")
    .param pmc param_36
# .annotate "line", 58
    new $P35, 'ExceptionHandler'
    set_addr $P35, control_34
    $P35."handle_types"(58)
    push_eh $P35
    .lex "$egg", param_36
# .annotate "line", 59
    find_lex $P38, "$egg"
    $P39 = "isa"($P38, "Cuculus::Canorus::Ovum")
    if $P39, unless_37_end
# .annotate "line", 60
    find_lex $P40, "$egg"
    "_dumper"($P40)
# .annotate "line", 61
    "die"("Must be called with a Cuckoo's egg.")
  unless_37_end:
# .annotate "line", 64
    find_lex $P41, "$egg"
    new $P42, "String"
    assign $P42, "$!CUCULUS_CANORUS"
    set $S43, $P42
    getattribute $P44, $P41, $S43
# .annotate "line", 58
    .return ($P44)
  control_34:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P45, exception, "payload"
    .return ($P45)
.end


.namespace ["Cuculus";"Canorus"]
.sub "get_passthrough_antiphons"  :subid("15_1268929828.27403") :outer("11_1268929828.27403")
    .param pmc param_49
# .annotate "line", 67
    .const 'Sub' $P67 = "16_1268929828.27403" 
    capture_lex $P67
    new $P48, 'ExceptionHandler'
    set_addr $P48, control_47
    $P48."handle_types"(58)
    push_eh $P48
    .lex "$parent", param_49
# .annotate "line", 70
    new $P50, "Undef"
    .lex "$pre_class", $P50
# .annotate "line", 75
    $P51 = root_new ['parrot';'Hash']
    .lex "%passthrough", $P51
# .annotate "line", 70
    new $P52, "String"
    assign $P52, "Class"
    set $S53, $P52
    new $P54, $S53
    store_lex "$pre_class", $P54
# .annotate "line", 71
    find_lex $P55, "$pre_class"
    new $P56, "String"
    assign $P56, "P6protoobject"
    set $S57, $P56
    get_class $P58, $S57
    $P55."add_parent"($P58)
# .annotate "line", 73
    find_lex $P59, "$pre_class"
    find_lex $P60, "$parent"
    $P59."add_parent"($P60)
    find_lex $P61, "%passthrough"
# .annotate "line", 77
    $P63 = "get_rootclass_methods"()
    defined $I64, $P63
    unless $I64, for_undef_41
    iter $P62, $P63
    new $P105, 'ExceptionHandler'
    set_addr $P105, loop104_handler
    $P105."handle_types"(65, 67, 66)
    push_eh $P105
  loop104_test:
    unless $P62, loop104_done
    shift $P65, $P62
  loop104_redo:
    .const 'Sub' $P67 = "16_1268929828.27403" 
    capture_lex $P67
    $P67($P65)
  loop104_next:
    goto loop104_test
  loop104_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, 'type'
    eq $P106, 65, loop104_next
    eq $P106, 67, loop104_redo
  loop104_done:
    pop_eh 
  for_undef_41:
    find_lex $P107, "%passthrough"
# .annotate "line", 67
    .return ($P107)
  control_47:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["Cuculus";"Canorus"]
.sub "_block66"  :anon :subid("16_1268929828.27403") :outer("15_1268929828.27403")
    .param pmc param_68
# .annotate "line", 77
    .const 'Sub' $P89 = "17_1268929828.27403" 
    capture_lex $P89
    .lex "$method_name", param_68
# .annotate "line", 79
    new $P69, "Undef"
    .lex "$callsig", $P69
# .annotate "line", 80
    new $P70, "Undef"
    .lex "$antiphon", $P70
# .annotate "line", 79
    get_hll_global $P71, "CallSignature"
    find_lex $P72, "$method_name"
    $P73 = $P71."new"($P72 :named("method"))
    store_lex "$callsig", $P73
# .annotate "line", 80
    find_lex $P74, "$callsig"
    $P75 = "new_antiphon"($P74)
    store_lex "$antiphon", $P75
# .annotate "line", 83
    find_lex $P77, "$method_name"
    set $S78, $P77
    iseq $I79, $S78, "new"
    if $I79, if_76
# .annotate "line", 86
    find_lex $P83, "$method_name"
    set $S84, $P83
    iseq $I85, $S84, "__dump"
    if $I85, if_82
# .annotate "line", 89
    .const 'Sub' $P89 = "17_1268929828.27403" 
    capture_lex $P89
    $P89()
    goto if_82_end
  if_82:
# .annotate "line", 87
    find_lex $P86, "$antiphon"
    get_hll_global $P87, ["P6object"], "__dump"
    $P86."will_do"($P87)
  if_82_end:
# .annotate "line", 86
    goto if_76_end
  if_76:
# .annotate "line", 84
    find_lex $P80, "$antiphon"
    get_hll_global $P81, ["Cuculus";"Canorus"], "mock_new"
    $P80."will_do"($P81)
  if_76_end:
# .annotate "line", 99
    find_lex $P101, "$antiphon"
    find_lex $P102, "$method_name"
    find_lex $P103, "%passthrough"
    unless_null $P103, vivify_42
    $P103 = root_new ['parrot';'Hash']
    store_lex "%passthrough", $P103
  vivify_42:
    set $P103[$P102], $P101
# .annotate "line", 77
    .return ($P101)
.end


.namespace ["Cuculus";"Canorus"]
.sub "_block88"  :anon :subid("17_1268929828.27403") :outer("16_1268929828.27403")
# .annotate "line", 90
    new $P90, "Undef"
    .lex "&method", $P90
    find_lex $P91, "$pre_class"
    find_lex $P92, "$method_name"
    $P93 = $P91."find_method"($P92)
    store_lex "&method", $P93
# .annotate "line", 96
    find_lex $P96, "&method"
    isnull $I97, $P96
    unless $I97, unless_95
    new $P94, 'Integer'
    set $P94, $I97
    goto unless_95_end
  unless_95:
# .annotate "line", 95
    find_lex $P98, "$antiphon"
    find_lex $P99, "&method"
    $P100 = $P98."will_do"($P99)
    set $P94, $P100
  unless_95_end:
# .annotate "line", 89
    .return ($P94)
.end


.namespace ["Cuculus";"Canorus"]
.sub "get_rootclass_methods"  :subid("18_1268929828.27403") :outer("11_1268929828.27403")
# .annotate "line", 105
    .const 'Sub' $P117 = "19_1268929828.27403" 
    capture_lex $P117
    new $P111, 'ExceptionHandler'
    set_addr $P111, control_110
    $P111."handle_types"(58)
    push_eh $P111
# .annotate "line", 107
    get_global $P112, "@_Rootclass_methods"
    unless_null $P112, vivify_43
    $P112 = root_new ['parrot';'ResizablePMCArray']
    set_global "@_Rootclass_methods", $P112
  vivify_43:
# .annotate "line", 108
    new $P113, "Undef"
    .lex "$root_class", $P113
# .annotate "line", 107
    get_global $P115, "@_Rootclass_methods"
    if $P115, unless_114_end
    .const 'Sub' $P117 = "19_1268929828.27403" 
    capture_lex $P117
    $P117()
  unless_114_end:
    get_global $P126, "@_Rootclass_methods"
# .annotate "line", 105
    .return ($P126)
  control_110:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P127, exception, "payload"
    .return ($P127)
.end


.namespace ["Cuculus";"Canorus"]
.sub "_block116"  :anon :subid("19_1268929828.27403") :outer("18_1268929828.27403")
# .annotate "line", 108
    new $P118, "Undef"
    .lex "$root_class", $P118
    get_hll_global $P119, "P6metaclass"
    $P120 = $P119."get_parrotclass"("P6object")
    store_lex "$root_class", $P120
# .annotate "line", 109
    find_lex $P121, "$root_class"
    $P122 = $P121."inspect"("methods")
    $P123 = $P122."keys"()
    set_global "@_Rootclass_methods", $P123
# .annotate "line", 110
    get_global $P124, "@_Rootclass_methods"
    $P125 = $P124."sort"()
# .annotate "line", 107
    .return ($P125)
.end


.namespace ["Cuculus";"Canorus"]
.sub "mock_class_name"  :subid("20_1268929828.27403") :outer("11_1268929828.27403")
    .param pmc param_131
# .annotate "line", 206
    new $P130, 'ExceptionHandler'
    set_addr $P130, control_129
    $P130."handle_types"(58)
    push_eh $P130
    .lex "$parent", param_131
# .annotate "line", 207
    get_global $P132, "$_Next_id"
    unless_null $P132, vivify_44
    new $P132, "Undef"
    set_global "$_Next_id", $P132
  vivify_44:
# .annotate "line", 214
    new $P133, "Undef"
    .lex "$name", $P133
# .annotate "line", 207
    get_global $P135, "$_Next_id"
    if $P135, unless_134_end
    new $P136, "Integer"
    assign $P136, 0
    set_global "$_Next_id", $P136
  unless_134_end:
# .annotate "line", 210
    find_lex $P138, "$parent"
    set $S139, $P138
    iseq $I140, $S139, "P6object"
    unless $I140, if_137_end
# .annotate "line", 211
    new $P141, "String"
    assign $P141, "<anonymous>"
    store_lex "$parent", $P141
  if_137_end:
# .annotate "line", 214
    find_lex $P142, "$parent"
    set $S143, $P142
    new $P144, 'String'
    set $P144, $S143
    new $P145, 'String'
    set $P145, "::<mock"
    get_global $P146, "$_Next_id"
    clone $P147, $P146
    inc $P146
    set $S148, $P147
    concat $P149, $P145, $S148
    concat $P150, $P149, ">"
    concat $P151, $P144, $P150
    store_lex "$name", $P151
# .annotate "line", 206
    .return ($P151)
  control_129:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P152, exception, "payload"
    .return ($P152)
.end


.namespace ["Cuculus";"Canorus"]
.sub "new_antiphon"  :subid("21_1268929828.27403") :outer("11_1268929828.27403")
    .param pmc param_156
# .annotate "line", 247
    new $P155, 'ExceptionHandler'
    set_addr $P155, control_154
    $P155."handle_types"(58)
    push_eh $P155
    .lex "$callsig", param_156
# .annotate "line", 248
    new $P157, "Undef"
    .lex "$antiphon", $P157
    get_hll_global $P158, ["Cuculus"], "Antiphon"
# .annotate "line", 250
    get_hll_global $P159, ["Cuculus"], "SigMatcher"
    find_lex $P160, "$callsig"
    $P161 = $P159."new"($P160 :named("expecting"))
    $P162 = $P158."new"($P161 :named("sig_matcher"))
# .annotate "line", 248
    store_lex "$antiphon", $P162
# .annotate "line", 247
    .return ($P162)
  control_154:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P163, exception, "payload"
    .return ($P163)
.end


.namespace ["Cuculus";"Canorus"]
.sub "add_antiphon"  :subid("22_1268929828.27403") :method :outer("11_1268929828.27403")
    .param pmc param_168
# .annotate "line", 27
    new $P167, 'ExceptionHandler'
    set_addr $P167, control_166
    $P167."handle_types"(58)
    push_eh $P167
    .lex "self", self
    .lex "$callsig", param_168
# .annotate "line", 29
    new $P169, "Undef"
    .lex "$antiphon", $P169
    find_lex $P170, "$callsig"
    $P171 = "new_antiphon"($P170)
    store_lex "$antiphon", $P171
# .annotate "line", 30
    find_lex $P172, "self"
    getattribute $P173, $P172, "@!antiphons"
    unless_null $P173, vivify_45
    $P173 = root_new ['parrot';'ResizablePMCArray']
  vivify_45:
    find_lex $P174, "$antiphon"
    $P173."push"($P174)
    find_lex $P175, "$antiphon"
# .annotate "line", 27
    .return ($P175)
  control_166:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P176, exception, "payload"
    .return ($P176)
.end


.namespace ["Cuculus";"Canorus"]
.sub "antiphons"  :subid("23_1268929828.27403") :method :outer("11_1268929828.27403")
# .annotate "line", 36
    new $P179, 'ExceptionHandler'
    set_addr $P179, control_178
    $P179."handle_types"(58)
    push_eh $P179
    .lex "self", self
    find_lex $P180, "self"
    getattribute $P181, $P180, "@!antiphons"
    unless_null $P181, vivify_46
    $P181 = root_new ['parrot';'ResizablePMCArray']
  vivify_46:
    .return ($P181)
  control_178:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P182, exception, "payload"
    .return ($P182)
.end


.namespace ["Cuculus";"Canorus"]
.sub "call_log"  :subid("24_1268929828.27403") :method :outer("11_1268929828.27403")
# .annotate "line", 37
    new $P185, 'ExceptionHandler'
    set_addr $P185, control_184
    $P185."handle_types"(58)
    push_eh $P185
    .lex "self", self
    find_lex $P186, "self"
    getattribute $P187, $P186, "@!call_log"
    unless_null $P187, vivify_47
    $P187 = root_new ['parrot';'ResizablePMCArray']
  vivify_47:
    .return ($P187)
  control_184:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P188, exception, "payload"
    .return ($P188)
.end


.namespace ["Cuculus";"Canorus"]
.sub "class"  :subid("25_1268929828.27403") :method :outer("11_1268929828.27403")
    .param pmc param_192 :slurpy
# .annotate "line", 39
    new $P191, 'ExceptionHandler'
    set_addr $P191, control_190
    $P191."handle_types"(58)
    push_eh $P191
    .lex "self", self
    .lex "@value", param_192
# .annotate "line", 40
    find_lex $P194, "@value"
    unless $P194, if_193_end
# .annotate "line", 42
    find_lex $P196, "self"
    new $P197, "String"
    assign $P197, "$!class"
    set $S198, $P197
    getattribute $P199, $P196, $S198
    defined $I200, $P199
    unless $I200, if_195_end
# .annotate "line", 41
    new $P201, "String"
    assign $P201, "Cannot reset $!class attribute: already points to "
    new $P202, 'String'
    set $P202, "'"
    find_lex $P203, "self"
    getattribute $P204, $P203, "$!class"
    unless_null $P204, vivify_48
    new $P204, "Undef"
  vivify_48:
    concat $P205, $P202, $P204
    concat $P206, $P205, "'"
    concat $P207, $P201, $P206
    "die"($P207)
  if_195_end:
# .annotate "line", 43
    get_hll_global $P208, "P6metaclass"
    find_lex $P209, "@value"
    $P210 = $P209."shift"()
    $P211 = $P208."get_parrotclass"($P210)
    find_lex $P212, "self"
    setattribute $P212, "$!class", $P211
  if_193_end:
# .annotate "line", 40
    find_lex $P213, "self"
    getattribute $P214, $P213, "$!class"
    unless_null $P214, vivify_49
    new $P214, "Undef"
  vivify_49:
# .annotate "line", 39
    .return ($P214)
  control_190:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P215, exception, "payload"
    .return ($P215)
.end


.namespace ["Cuculus";"Canorus"]
.sub "init_egg"  :subid("26_1268929828.27403") :method :outer("11_1268929828.27403")
    .param pmc param_223
    .param pmc param_224 :optional :named("behavior")
    .param int has_param_224 :opt_flag
# .annotate "line", 116
    new $P222, 'ExceptionHandler'
    set_addr $P222, control_221
    $P222."handle_types"(58)
    push_eh $P222
    .lex "self", self
    .lex "$egg", param_223
    if has_param_224, optparam_50
    get_hll_global $P225, ["Cuculus";"Canorus"], "mock_execute"
    set param_224, $P225
  optparam_50:
    .lex "&behavior", param_224
# .annotate "line", 118
    find_lex $P227, "$egg"
    $P228 = "isa"($P227, "Cuculus::Canorus::Ovum")
    if $P228, unless_226_end
# .annotate "line", 117
    "die"("Must be called with a Cuckoo's egg.")
  unless_226_end:
# .annotate "line", 122
    find_lex $P230, "$egg"
    new $P231, "String"
    assign $P231, "$!CUCULUS_CANORUS"
    set $S232, $P231
    getattribute $P233, $P230, $S232
    isnull $I234, $P233
    unless $I234, if_229_end
# .annotate "line", 123
    get_hll_global $P235, ["Cuculus";"Canorus";"Ovum";"_"], "pop_inits"
    find_lex $P236, "$egg"
    $P235($P236)
  if_229_end:
# .annotate "line", 127
    find_lex $P237, "$egg"
    new $P238, "String"
    assign $P238, "&!CUCULUS_BEHAVIOR"
    set $S239, $P238
    find_lex $P240, "&behavior"
    setattribute $P237, $S239, $P240
    find_lex $P241, "$egg"
# .annotate "line", 116
    .return ($P241)
  control_221:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P242, exception, "payload"
    .return ($P242)
.end


.namespace ["Cuculus";"Canorus"]
.sub "_init_obj"  :subid("27_1268929828.27403") :method :outer("11_1268929828.27403")
    .param pmc param_246 :slurpy
    .param pmc param_247 :slurpy :named
# .annotate "line", 131
    new $P245, 'ExceptionHandler'
    set_addr $P245, control_244
    $P245."handle_types"(58)
    push_eh $P245
    .lex "self", self
    .lex "@pos", param_246
    .lex "%named", param_247
# .annotate "line", 132
    find_lex $P248, "self"
    getattribute $P249, $P248, "@!antiphons"
    unless_null $P249, vivify_51
    $P249 = root_new ['parrot';'ResizablePMCArray']
  vivify_51:
    find_lex $P250, "self"
    setattribute $P250, "@!antiphons", $P249
# .annotate "line", 133
    find_lex $P251, "self"
    getattribute $P252, $P251, "@!call_log"
    unless_null $P252, vivify_52
    $P252 = root_new ['parrot';'ResizablePMCArray']
  vivify_52:
    find_lex $P253, "self"
    setattribute $P253, "@!call_log", $P252
# .annotate "line", 135
    find_lex $P254, "self"
    find_lex $P255, "@pos"
    find_lex $P256, "%named"
    $P254."_init_args"($P255 :flat, $P256 :flat)
    find_lex $P257, "self"
# .annotate "line", 131
    .return ($P257)
  control_244:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P258, exception, "payload"
    .return ($P258)
.end


.namespace ["Cuculus";"Canorus"]
.sub "install_vtable_overrides"  :subid("28_1268929828.27403") :method :outer("11_1268929828.27403")
    .param pmc param_262
# .annotate "line", 140
    .const 'Sub' $P275 = "29_1268929828.27403" 
    capture_lex $P275
    new $P261, 'ExceptionHandler'
    set_addr $P261, control_260
    $P261."handle_types"(58)
    push_eh $P261
    .lex "self", self
    .lex "$proto_egg", param_262
# .annotate "line", 142
    $P263 = root_new ['parrot';'Hash']
    .lex "%vtable_overrides", $P263
# .annotate "line", 144
    $P264 = root_new ['parrot';'ResizablePMCArray']
    .lex "@mro", $P264
# .annotate "line", 154
    new $P265, "Undef"
    .lex "$proto_class", $P265
# .annotate "line", 140
    find_lex $P266, "%vtable_overrides"
# .annotate "line", 144
    find_lex $P267, "$proto_egg"
    class $P268, $P267
    $P269 = $P268."inspect"("all_parents")
    store_lex "@mro", $P269
# .annotate "line", 146
    find_lex $P271, "@mro"
    defined $I272, $P271
    unless $I272, for_undef_53
    iter $P270, $P271
    new $P300, 'ExceptionHandler'
    set_addr $P300, loop299_handler
    $P300."handle_types"(65, 67, 66)
    push_eh $P300
  loop299_test:
    unless $P270, loop299_done
    shift $P273, $P270
  loop299_redo:
    .const 'Sub' $P275 = "29_1268929828.27403" 
    capture_lex $P275
    $P275($P273)
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
  for_undef_53:
# .annotate "line", 154
    find_lex $P302, "$proto_egg"
    class $P303, $P302
    store_lex "$proto_class", $P303
# .annotate "line", 155
    get_hll_global $P304, ["Cuculus";"Canorus";"Ovum";"_"], "VTABLE_find_method"
    find_lex $P305, "$proto_class"
    "has_vtable"("find_method", $P304, $P305)
# .annotate "line", 159
    get_hll_global $P306, ["Cuculus";"Canorus";"Ovum";"_"], "VTABLE_find_method"
    find_lex $P307, "$proto_egg"
    $P308 = "has_vtable"("find_method", $P306, $P307 :named("class"))
# .annotate "line", 140
    .return ($P308)
  control_260:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P309, exception, "payload"
    .return ($P309)
.end


.namespace ["Cuculus";"Canorus"]
.sub "_block274"  :anon :subid("29_1268929828.27403") :outer("28_1268929828.27403")
    .param pmc param_276
# .annotate "line", 146
    .const 'Sub' $P283 = "30_1268929828.27403" 
    capture_lex $P283
    .lex "$parent", param_276
# .annotate "line", 147
    find_lex $P278, "$parent"
    $P279 = $P278."inspect"("vtable_overrides")
    defined $I280, $P279
    unless $I280, for_undef_54
    iter $P277, $P279
    new $P297, 'ExceptionHandler'
    set_addr $P297, loop296_handler
    $P297."handle_types"(65, 67, 66)
    push_eh $P297
  loop296_test:
    unless $P277, loop296_done
    shift $P281, $P277
  loop296_redo:
    .const 'Sub' $P283 = "30_1268929828.27403" 
    capture_lex $P283
    $P283($P281)
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
  for_undef_54:
# .annotate "line", 146
    .return ($P277)
.end


.namespace ["Cuculus";"Canorus"]
.sub "_block282"  :anon :subid("30_1268929828.27403") :outer("29_1268929828.27403")
    .param pmc param_284
# .annotate "line", 147
    .lex "$_", param_284
# .annotate "line", 149
    find_lex $P287, "%vtable_overrides"
    find_lex $P288, "$_"
    $P289 = $P288."key"()
    $P290 = $P287."contains"($P289)
    unless $P290, unless_286
    set $P285, $P290
    goto unless_286_end
  unless_286:
# .annotate "line", 148
    find_lex $P291, "$_"
    $P292 = $P291."value"()
    find_lex $P293, "$_"
    $P294 = $P293."key"()
    find_lex $P295, "%vtable_overrides"
    unless_null $P295, vivify_55
    $P295 = root_new ['parrot';'Hash']
    store_lex "%vtable_overrides", $P295
  vivify_55:
    set $P295[$P294], $P292
    set $P285, $P292
  unless_286_end:
# .annotate "line", 147
    .return ($P285)
.end


.namespace ["Cuculus";"Canorus"]
.sub "mock_class"  :subid("31_1268929828.27403") :method :outer("11_1268929828.27403")
    .param pmc param_313 :optional
    .param int has_param_313 :opt_flag
    .param pmc param_315 :optional :named("named")
    .param int has_param_315 :opt_flag
# .annotate "line", 186
    new $P312, 'ExceptionHandler'
    set_addr $P312, control_311
    $P312."handle_types"(58)
    push_eh $P312
    .lex "self", self
    if has_param_313, optparam_56
    new $P314, "String"
    assign $P314, "P6object"
    set param_313, $P314
  optparam_56:
    .lex "$parent", param_313
    if has_param_315, optparam_57
    new $P316, "Undef"
    set param_315, $P316
  optparam_57:
    .lex "$named", param_315
# .annotate "line", 196
    new $P317, "Undef"
    .lex "$proto_egg", $P317
# .annotate "line", 187
    get_hll_global $P318, "P6metaclass"
    find_lex $P319, "$parent"
    $P320 = $P318."get_parrotclass"($P319)
    store_lex "$parent", $P320
# .annotate "line", 188
    find_lex $P323, "$named"
    unless $P323, unless_322
    set $P321, $P323
    goto unless_322_end
  unless_322:
    find_lex $P324, "$parent"
    $P325 = "mock_class_name"($P324)
    set $P321, $P325
  unless_322_end:
    store_lex "$named", $P321
# .annotate "line", 190
    find_lex $P326, "$parent"
    $P327 = "get_passthrough_antiphons"($P326)
    find_lex $P328, "self"
    setattribute $P328, "%!passthrough_antiphons", $P327
# .annotate "line", 194
    get_hll_global $P329, ["Cuculus";"Canorus";"Ovum";"_"], "push_inits"
    find_lex $P330, "self"
    get_hll_global $P331, ["Cuculus";"Canorus"], "mock_execute"
    $P329($P330 :named("cuckoo"), $P331 :named("behavior"))
# .annotate "line", 196
    get_hll_global $P332, "P6metaclass"
    find_lex $P333, "$named"
    $P334 = $P332."new_class"($P333, "Cuculus::Canorus::Ovum" :named("parent"))
    store_lex "$proto_egg", $P334
# .annotate "line", 197
    get_hll_global $P335, "P6metaclass"
    find_lex $P336, "$proto_egg"
    find_lex $P337, "$parent"
    $P335."add_parent"($P336, $P337)
# .annotate "line", 199
    get_hll_global $P338, "P6metaclass"
    find_lex $P339, "$proto_egg"
    $P340 = $P338."get_parrotclass"($P339)
    find_lex $P341, "self"
    setattribute $P341, "$!class", $P340
# .annotate "line", 200
    find_lex $P342, "self"
    find_lex $P343, "$proto_egg"
    $P342."init_egg"($P343)
# .annotate "line", 202
    find_lex $P344, "self"
    find_lex $P345, "$proto_egg"
    $P344."install_vtable_overrides"($P345)
    find_lex $P346, "$proto_egg"
# .annotate "line", 186
    .return ($P346)
  control_311:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P347, exception, "payload"
    .return ($P347)
.end


.namespace ["Cuculus";"Canorus"]
.sub "mock_execute"  :subid("32_1268929828.27403") :method :outer("11_1268929828.27403")
    .param pmc param_352
# .annotate "line", 217
    .const 'Sub' $P362 = "33_1268929828.27403" 
    capture_lex $P362
    new $P351, 'ExceptionHandler'
    set_addr $P351, control_350
    $P351."handle_types"(58)
    push_eh $P351
    .lex "self", self
    .lex "$callsig", param_352
# .annotate "line", 218
    find_lex $P353, "self"
    getattribute $P354, $P353, "@!call_log"
    unless_null $P354, vivify_58
    $P354 = root_new ['parrot';'ResizablePMCArray']
  vivify_58:
    find_lex $P355, "$callsig"
    $P354."push"($P355)
# .annotate "line", 220
    find_lex $P357, "self"
    getattribute $P358, $P357, "@!antiphons"
    unless_null $P358, vivify_59
    $P358 = root_new ['parrot';'ResizablePMCArray']
  vivify_59:
    defined $I359, $P358
    unless $I359, for_undef_60
    iter $P356, $P358
    new $P374, 'ExceptionHandler'
    set_addr $P374, loop373_handler
    $P374."handle_types"(65, 67, 66)
    push_eh $P374
  loop373_test:
    unless $P356, loop373_done
    shift $P360, $P356
  loop373_redo:
    .const 'Sub' $P362 = "33_1268929828.27403" 
    capture_lex $P362
    $P362($P360)
  loop373_next:
    goto loop373_test
  loop373_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P375, exception, 'type'
    eq $P375, 65, loop373_next
    eq $P375, 67, loop373_redo
  loop373_done:
    pop_eh 
  for_undef_60:
# .annotate "line", 226
    find_lex $P377, "self"
    getattribute $P378, $P377, "%!passthrough_antiphons"
    unless_null $P378, vivify_61
    $P378 = root_new ['parrot';'Hash']
  vivify_61:
    find_lex $P379, "$callsig"
    $P380 = $P379."method"()
    $P381 = $P378."contains"($P380)
    unless $P381, if_376_end
# .annotate "line", 227
    new $P382, "Exception"
    set $P382['type'], 58
    find_lex $P383, "$callsig"
    $P384 = $P383."method"()
    find_lex $P385, "self"
    getattribute $P386, $P385, "%!passthrough_antiphons"
    unless_null $P386, vivify_62
    $P386 = root_new ['parrot';'Hash']
  vivify_62:
    set $P387, $P386[$P384]
    unless_null $P387, vivify_63
    new $P387, "Undef"
  vivify_63:
    find_lex $P388, "$callsig"
    $P389 = $P387."invoke"($P388)
    setattribute $P382, 'payload', $P389
    throw $P382
  if_376_end:
# .annotate "line", 230
    find_lex $P390, "$callsig"
    $P391 = $P390."object"()
# .annotate "line", 217
    .return ($P391)
  control_350:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P392, exception, "payload"
    .return ($P392)
.end


.namespace ["Cuculus";"Canorus"]
.sub "_block361"  :anon :subid("33_1268929828.27403") :outer("32_1268929828.27403")
    .param pmc param_363
# .annotate "line", 220
    .lex "$one", param_363
# .annotate "line", 221
    find_lex $P366, "$one"
    find_lex $P367, "$callsig"
    $P368 = $P366."matches"($P367)
    if $P368, if_365
    set $P364, $P368
    goto if_365_end
  if_365:
# .annotate "line", 222
    new $P369, "Exception"
    set $P369['type'], 58
    find_lex $P370, "$one"
    find_lex $P371, "$callsig"
    $P372 = $P370."invoke"($P371)
    setattribute $P369, 'payload', $P372
    throw $P369
  if_365_end:
# .annotate "line", 220
    .return ($P364)
.end


.namespace ["Cuculus";"Canorus"]
.sub "mock_new"  :subid("34_1268929828.27403") :method :outer("11_1268929828.27403")
    .param pmc param_396 :slurpy
    .param pmc param_397 :slurpy :named
# .annotate "line", 233
    new $P395, 'ExceptionHandler'
    set_addr $P395, control_394
    $P395."handle_types"(58)
    push_eh $P395
    .lex "self", self
    .lex "@pos", param_396
    .lex "%named", param_397
# .annotate "line", 235
    new $P398, "Undef"
    .lex "$cuckoo", $P398
# .annotate "line", 236
    new $P399, "Undef"
    .lex "$new_cuckoo", $P399
# .annotate "line", 240
    new $P400, "Undef"
    .lex "$new_egg", $P400
# .annotate "line", 235
    find_lex $P401, "self"
    getattribute $P402, $P401, "$!CUCULUS_CANORUS"
    unless_null $P402, vivify_64
    new $P402, "Undef"
  vivify_64:
    store_lex "$cuckoo", $P402
# .annotate "line", 236
    find_lex $P403, "$cuckoo"
    $P404 = $P403."WHAT"()
    find_lex $P405, "$cuckoo"
    $P406 = $P405."class"()
    find_lex $P407, "$cuckoo"
    $P408 = $P407."passthrough"()
    $P409 = $P404."new"($P406 :named("class"), $P408 :named("passthrough"))
    store_lex "$new_cuckoo", $P409
# .annotate "line", 240
    find_lex $P410, "$new_cuckoo"
    $P411 = $P410."new_egg"()
    store_lex "$new_egg", $P411
# .annotate "line", 241
    find_lex $P412, "$new_egg"
    find_lex $P413, "@pos"
    find_lex $P414, "%named"
    $P412."_init_obj"($P413 :flat, $P414 :flat)
    find_lex $P415, "$new_egg"
# .annotate "line", 233
    .return ($P415)
  control_394:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P416, exception, "payload"
    .return ($P416)
.end


.namespace ["Cuculus";"Canorus"]
.sub "new_egg"  :subid("35_1268929828.27403") :method :outer("11_1268929828.27403")
    .param pmc param_421 :optional :named("behavior")
    .param int has_param_421 :opt_flag
# .annotate "line", 260
    new $P420, 'ExceptionHandler'
    set_addr $P420, control_419
    $P420."handle_types"(58)
    push_eh $P420
    .lex "self", self
    if has_param_421, optparam_65
    get_hll_global $P422, ["Cuculus";"Canorus"], "mock_execute"
    set param_421, $P422
  optparam_65:
    .lex "&behavior", param_421
# .annotate "line", 263
    new $P423, "Undef"
    .lex "$new_egg", $P423
# .annotate "line", 262
    get_hll_global $P424, ["Cuculus";"Canorus";"Ovum";"_"], "push_inits"
    find_lex $P425, "self"
    get_hll_global $P426, ["Cuculus";"Canorus"], "mock_execute"
    $P424($P425 :named("cuckoo"), $P426 :named("behavior"))
# .annotate "line", 263
    find_lex $P427, "self"
    getattribute $P428, $P427, "$!class"
    unless_null $P428, vivify_66
    new $P428, "Undef"
  vivify_66:
    new $P429, $P428
    store_lex "$new_egg", $P429
# .annotate "line", 264
    find_lex $P430, "self"
    find_lex $P431, "$new_egg"
    find_lex $P432, "&behavior"
    $P433 = $P430."init_egg"($P431, $P432)
# .annotate "line", 260
    .return ($P433)
  control_419:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P434, exception, "payload"
    .return ($P434)
.end


.namespace ["Cuculus";"Canorus"]
.sub "passthrough"  :subid("36_1268929828.27403") :method :outer("11_1268929828.27403")
    .param pmc param_438 :optional
    .param int has_param_438 :opt_flag
# .annotate "line", 267
    new $P437, 'ExceptionHandler'
    set_addr $P437, control_436
    $P437."handle_types"(58)
    push_eh $P437
    .lex "self", self
    if has_param_438, optparam_67
    new $P439, "Undef"
    set param_438, $P439
  optparam_67:
    .lex "$value", param_438
# .annotate "line", 268
    find_lex $P442, "$value"
    $P443 = $P442."defined"()
    if $P443, if_441
    find_lex $P445, "self"
    getattribute $P446, $P445, "%!passthrough_antiphons"
    unless_null $P446, vivify_68
    $P446 = root_new ['parrot';'Hash']
  vivify_68:
    set $P440, $P446
    goto if_441_end
  if_441:
    find_lex $P444, "$value"
    set $P440, $P444
  if_441_end:
# .annotate "line", 269
    find_lex $P447, "self"
    setattribute $P447, "%!passthrough_antiphons", $P440
# .annotate "line", 267
    .return ($P440)
  control_436:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P448, exception, "payload"
    .return ($P448)
.end


.namespace ["Cuculus";"Canorus"]
.sub "verifier"  :subid("37_1268929828.27403") :method :outer("11_1268929828.27403")
    .param pmc param_452 :optional
    .param int has_param_452 :opt_flag
# .annotate "line", 273
    new $P451, 'ExceptionHandler'
    set_addr $P451, control_450
    $P451."handle_types"(58)
    push_eh $P451
    .lex "self", self
    if has_param_452, optparam_69
    new $P453, "Undef"
    set param_452, $P453
  optparam_69:
    .lex "$value", param_452
    find_lex $P456, "$value"
    $P457 = $P456."defined"()
    if $P457, if_455
    find_lex $P460, "self"
    getattribute $P461, $P460, "$!verifier"
    unless_null $P461, vivify_70
    new $P461, "Undef"
  vivify_70:
    set $P454, $P461
    goto if_455_end
  if_455:
    find_lex $P458, "$value"
    find_lex $P459, "self"
    setattribute $P459, "$!verifier", $P458
    set $P454, $P458
  if_455_end:
    .return ($P454)
  control_450:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P462, exception, "payload"
    .return ($P462)
.end


.namespace ["Cuculus";"Canorus"]
.sub "verify_calls"  :subid("38_1268929828.27403") :method :outer("11_1268929828.27403")
    .param pmc param_466
# .annotate "line", 275
    new $P465, 'ExceptionHandler'
    set_addr $P465, control_464
    $P465."handle_types"(58)
    push_eh $P465
    .lex "self", self
    .lex "$callsig", param_466
# .annotate "line", 277
    find_lex $P467, "self"
    getattribute $P468, $P467, "$!verifier"
    unless_null $P468, vivify_71
    new $P468, "Undef"
  vivify_71:
    get_hll_global $P469, ["Cuculus"], "SigMatcher"
    find_lex $P470, "$callsig"
    $P471 = $P469."new"($P470 :named("expecting"))
    $P468."sig_matcher"($P471)
# .annotate "line", 280
    find_lex $P472, "self"
    getattribute $P473, $P472, "$!verifier"
    unless_null $P473, vivify_72
    new $P473, "Undef"
  vivify_72:
    find_lex $P474, "self"
    $P475 = $P473."verify"($P474)
# .annotate "line", 275
    .return ($P475)
  control_464:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P476, exception, "payload"
    .return ($P476)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929901.62513")
# .annotate "line", 0
    get_hll_global $P14, ["Cuckoo"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["Cuckoo"], "_block13" 
    capture_lex $P14
    $P81 = $P14()
# .annotate "line", 1
    .return ($P81)
.end


.namespace ["Cuckoo"]
.sub "_block13"  :subid("11_1268929901.62513") :outer("10_1268929901.62513")
# .annotate "line", 6
    .const 'Sub' $P64 = "16_1268929901.62513" 
    capture_lex $P64
    .const 'Sub' $P43 = "15_1268929901.62513" 
    capture_lex $P43
    .const 'Sub' $P32 = "14_1268929901.62513" 
    capture_lex $P32
    .const 'Sub' $P23 = "13_1268929901.62513" 
    capture_lex $P23
    .const 'Sub' $P15 = "12_1268929901.62513" 
    capture_lex $P15
# .annotate "line", 20
    .const 'Sub' $P15 = "12_1268929901.62513" 
    capture_lex $P15
    .lex "_initload", $P15
# .annotate "line", 27
    .const 'Sub' $P23 = "13_1268929901.62513" 
    capture_lex $P23
    .lex "calling", $P23
# .annotate "line", 31
    .const 'Sub' $P32 = "14_1268929901.62513" 
    capture_lex $P32
    .lex "cuckoo", $P32
# .annotate "line", 35
    .const 'Sub' $P43 = "15_1268929901.62513" 
    capture_lex $P43
    .lex "verify", $P43
# .annotate "line", 48
    .const 'Sub' $P64 = "16_1268929901.62513" 
    capture_lex $P64
    .lex "verify_never", $P64
# .annotate "line", 6
    find_lex $P73, "_initload"
    find_lex $P74, "calling"
    find_lex $P75, "cuckoo"
    find_lex $P76, "verify"
    find_lex $P77, "verify_never"
    .return ($P77)
.end


.namespace ["Cuckoo"]
.sub "" :load :init :subid("post17") :outer("11_1268929901.62513")
# .annotate "line", 6
    get_hll_global $P14, ["Cuckoo"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 7
    new $P78, "ResizablePMCArray"
    push $P78, "calling"
    push $P78, "cuckoo"
    push $P78, "verify"
    push $P78, "verify_never"
    "export"($P78)
# .annotate "line", 14
    get_hll_global $P79, ["Kakapo"], "depends_on"
    new $P80, "ResizablePMCArray"
    push $P80, "Cuculus::Canorus"
    push $P80, "Matcher::CallSig"
    $P79($P80 :flat)
.end


.namespace ["Cuckoo"]
.sub "_initload"  :subid("12_1268929901.62513") :outer("11_1268929901.62513")
# .annotate "line", 20
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 21
    get_hll_global $P18, ["Cuculus"], "Canorus"
    "use"($P18)
# .annotate "line", 22
    get_hll_global $P19, ["Matcher"], "CallSig"
    "use"($P19)
# .annotate "line", 24
    new $P20, "ResizablePMCArray"
    push $P20, "ANY"
    push $P20, "ETC"
    $P21 = "export"($P20, "Matcher::CallSig" :named("namespace"))
# .annotate "line", 20
    .return ($P21)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P22, exception, "payload"
    .return ($P22)
.end


.namespace ["Cuckoo"]
.sub "calling"  :subid("13_1268929901.62513") :outer("11_1268929901.62513")
    .param pmc param_26
# .annotate "line", 27
    new $P25, 'ExceptionHandler'
    set_addr $P25, control_24
    $P25."handle_types"(58)
    push_eh $P25
    .lex "$egg", param_26
# .annotate "line", 28
    find_lex $P27, "$egg"
    $P28 = "get_cuckoo"($P27)
    get_hll_global $P29, ["Cuculus";"Canorus"], "add_antiphon"
    $P30 = $P28."new_egg"($P29 :named("behavior"))
# .annotate "line", 27
    .return ($P30)
  control_24:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P31, exception, "payload"
    .return ($P31)
.end


.namespace ["Cuckoo"]
.sub "cuckoo"  :subid("14_1268929901.62513") :outer("11_1268929901.62513")
    .param pmc param_35
    .param pmc param_36 :slurpy :named
# .annotate "line", 31
    new $P34, 'ExceptionHandler'
    set_addr $P34, control_33
    $P34."handle_types"(58)
    push_eh $P34
    .lex "$class", param_35
    .lex "%named", param_36
# .annotate "line", 32
    get_hll_global $P37, ["Cuculus"], "Canorus"
    $P38 = $P37."new"()
    find_lex $P39, "$class"
    find_lex $P40, "%named"
    $P41 = $P38."mock_class"($P39, $P40 :flat)
# .annotate "line", 31
    .return ($P41)
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P42, exception, "payload"
    .return ($P42)
.end


.namespace ["Cuckoo"]
.sub "verify"  :subid("15_1268929901.62513") :outer("11_1268929901.62513")
    .param pmc param_46
    .param pmc param_47 :slurpy :named
# .annotate "line", 35
    new $P45, 'ExceptionHandler'
    set_addr $P45, control_44
    $P45."handle_types"(58)
    push_eh $P45
    .lex "$egg", param_46
    .lex "%named", param_47
# .annotate "line", 45
    new $P48, "Undef"
    .lex "$new_egg", $P48
# .annotate "line", 37
    find_lex $P50, "%named"
    $P51 = $P50."contains"("at_least")
    if $P51, unless_49_end
# .annotate "line", 36
    new $P52, "Integer"
    assign $P52, 1
    find_lex $P53, "%named"
    unless_null $P53, vivify_18
    $P53 = root_new ['parrot';'Hash']
    store_lex "%named", $P53
  vivify_18:
    set $P53["at_least"], $P52
  unless_49_end:
# .annotate "line", 39
    find_lex $P54, "$egg"
    $P55 = "get_cuckoo"($P54)
# .annotate "line", 40
    get_hll_global $P56, ["Cuculus"], "Verifier"
    find_lex $P57, "%named"
    $P58 = $P56."new"($P57 :named("conditions"))
    $P55."verifier"($P58)
# .annotate "line", 45
    find_lex $P59, "$egg"
    $P60 = "get_cuckoo"($P59)
    get_hll_global $P61, ["Cuculus";"Canorus"], "verify_calls"
    $P62 = $P60."new_egg"($P61 :named("behavior"))
    store_lex "$new_egg", $P62
# .annotate "line", 35
    .return ($P62)
  control_44:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P63, exception, "payload"
    .return ($P63)
.end


.namespace ["Cuckoo"]
.sub "verify_never"  :subid("16_1268929901.62513") :outer("11_1268929901.62513")
    .param pmc param_67
    .param pmc param_68 :slurpy :named
# .annotate "line", 48
    new $P66, 'ExceptionHandler'
    set_addr $P66, control_65
    $P66."handle_types"(58)
    push_eh $P66
    .lex "$egg", param_67
    .lex "%named", param_68
# .annotate "line", 49
    find_lex $P69, "$egg"
    find_lex $P70, "%named"
    $P71 = "verify"($P69, $P70 :flat, 1 :named("never"))
# .annotate "line", 48
    .return ($P71)
  control_65:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P72, exception, "payload"
    .return ($P72)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929862.73455")
# .annotate "line", 0
    get_hll_global $P14, ["Cuculus";"MockFS"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Cuculus";"MockFS"], "_block13" 
    capture_lex $P14
    $P618 = $P14()
# .annotate "line", 1
    .return ($P618)
.end


.namespace []
.sub "" :load :init :subid("post49") :outer("10_1268929862.73455")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268929862.73455" 
    .local pmc block
    set block, $P12
    $P619 = get_root_global ["parrot"], "P6metaclass"
    $P619."new_class"("Cuculus::MockFS")
.end


.namespace ["Cuculus";"MockFS"]
.sub "_block13"  :subid("11_1268929862.73455") :outer("10_1268929862.73455")
# .annotate "line", 7
    .const 'Sub' $P610 = "48_1268929862.73455" 
    capture_lex $P610
    get_hll_global $P49, ["Cuculus";"MockFS";"Unix"], "_block48" 
    capture_lex $P49
    .const 'Sub' $P21 = "13_1268929862.73455" 
    capture_lex $P21
    .const 'Sub' $P15 = "12_1268929862.73455" 
    capture_lex $P15
# .annotate "line", 33
    get_hll_global $P49, ["Cuculus";"MockFS";"Unix"], "_block48" 
    capture_lex $P49
    $P608 = $P49()
# .annotate "line", 7
    .return ($P608)
.end


.namespace ["Cuculus";"MockFS"]
.sub "" :load :init :subid("post50") :outer("11_1268929862.73455")
# .annotate "line", 7
    get_hll_global $P14, ["Cuculus";"MockFS"], "_block13" 
    .local pmc block
    set block, $P14
    .const 'Sub' $P610 = "48_1268929862.73455" 
    capture_lex $P610
    $P610()
    $P616 = get_root_global ["parrot"], "P6metaclass"
    new $P617, "ResizablePMCArray"
    push $P617, "@!cwd_path"
    push $P617, "$!user_id"
    push $P617, "%!user_groups"
    push $P617, "%!volumes"
    $P616."new_class"("Cuculus::MockFS::Unix", "Cuculus::MockFS" :named("parent"), $P617 :named("attr"))
.end


.namespace ["Cuculus";"MockFS"]
.sub "_block609"  :anon :subid("48_1268929862.73455") :outer("11_1268929862.73455")
# .annotate "line", 8
    get_global $P611, "%_Osname_class_map"
    unless_null $P611, vivify_51
    $P611 = root_new ['parrot';'Hash']
    set_global "%_Osname_class_map", $P611
  vivify_51:
    get_hll_global $P612, "Hash"
    get_hll_global $P613, ["Cuculus";"MockFS"], "Unix"
    get_hll_global $P614, ["Cuculus";"MockFS"], "Unix"
    $P615 = $P612."new"($P613 :named("DEFAULT"), $P614 :named("linux"))
    set_global "%_Osname_class_map", $P615
# .annotate "line", 7
    .return ($P615)
.end


.namespace ["Cuculus";"MockFS"]
.sub "get_osname_map"  :subid("12_1268929862.73455") :method :outer("11_1268929862.73455")
# .annotate "line", 14
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
# .annotate "line", 15
    get_global $P18, "%_Osname_class_map"
    unless_null $P18, vivify_52
    $P18 = root_new ['parrot';'Hash']
    set_global "%_Osname_class_map", $P18
  vivify_52:
# .annotate "line", 14
    get_global $P19, "%_Osname_class_map"
    .return ($P19)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P20, exception, "payload"
    .return ($P20)
.end


.namespace ["Cuculus";"MockFS"]
.sub "_init_obj"  :subid("13_1268929862.73455") :method :outer("11_1268929862.73455")
    .param pmc param_24 :slurpy
    .param pmc param_25 :slurpy :named
# .annotate "line", 18
    new $P23, 'ExceptionHandler'
    set_addr $P23, control_22
    $P23."handle_types"(58)
    push_eh $P23
    .lex "self", self
    .lex "@pos", param_24
    .lex "%named", param_25
# .annotate "line", 19
    $P26 = root_new ['parrot';'Hash']
    .lex "%map", $P26
# .annotate "line", 20
    new $P27, "Undef"
    .lex "$osname", $P27
# .annotate "line", 25
    new $P28, "Undef"
    .lex "$class", $P28
# .annotate "line", 26
    new $P29, "Undef"
    .lex "$obj", $P29
# .annotate "line", 19
    find_lex $P30, "self"
    $P31 = $P30."get_osname_map"()
    store_lex "%map", $P31
# .annotate "line", 20
    find_dynamic_lex $P32, "%*VM"
    unless_null $P32, vivify_53
    get_hll_global $P32, "%VM"
    unless_null $P32, vivify_54
    die "Contextual %*VM not found"
  vivify_54:
  vivify_53:
    set $P33, $P32["osname"]
    unless_null $P33, vivify_55
    new $P33, "Undef"
  vivify_55:
    store_lex "$osname", $P33
# .annotate "line", 23
    find_lex $P35, "%map"
    find_lex $P36, "$osname"
    $P37 = $P35."contains"($P36)
    if $P37, unless_34_end
# .annotate "line", 22
    new $P38, "String"
    assign $P38, "DEFAULT"
    store_lex "$osname", $P38
  unless_34_end:
# .annotate "line", 25
    find_lex $P39, "$osname"
    find_lex $P40, "%map"
    unless_null $P40, vivify_56
    $P40 = root_new ['parrot';'Hash']
  vivify_56:
    set $P41, $P40[$P39]
    unless_null $P41, vivify_57
    new $P41, "Undef"
  vivify_57:
    store_lex "$class", $P41
# .annotate "line", 26
    find_lex $P42, "$class"
    find_lex $P43, "@pos"
    find_lex $P44, "%named"
    $P45 = $P42."new"($P43 :flat, $P44 :flat)
    store_lex "$obj", $P45
    find_lex $P46, "$obj"
# .annotate "line", 18
    .return ($P46)
  control_22:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P47, exception, "payload"
    .return ($P47)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "_block48"  :subid("14_1268929862.73455") :outer("11_1268929862.73455")
# .annotate "line", 33
    .const 'Sub' $P573 = "46_1268929862.73455" 
    capture_lex $P573
    .const 'Sub' $P554 = "45_1268929862.73455" 
    capture_lex $P554
    .const 'Sub' $P509 = "44_1268929862.73455" 
    capture_lex $P509
    .const 'Sub' $P483 = "43_1268929862.73455" 
    capture_lex $P483
    .const 'Sub' $P473 = "42_1268929862.73455" 
    capture_lex $P473
    .const 'Sub' $P404 = "40_1268929862.73455" 
    capture_lex $P404
    .const 'Sub' $P396 = "39_1268929862.73455" 
    capture_lex $P396
    .const 'Sub' $P377 = "38_1268929862.73455" 
    capture_lex $P377
    .const 'Sub' $P369 = "37_1268929862.73455" 
    capture_lex $P369
    .const 'Sub' $P361 = "36_1268929862.73455" 
    capture_lex $P361
    .const 'Sub' $P353 = "35_1268929862.73455" 
    capture_lex $P353
    .const 'Sub' $P345 = "34_1268929862.73455" 
    capture_lex $P345
    .const 'Sub' $P333 = "33_1268929862.73455" 
    capture_lex $P333
    .const 'Sub' $P316 = "32_1268929862.73455" 
    capture_lex $P316
    .const 'Sub' $P303 = "31_1268929862.73455" 
    capture_lex $P303
    .const 'Sub' $P248 = "29_1268929862.73455" 
    capture_lex $P248
    .const 'Sub' $P240 = "28_1268929862.73455" 
    capture_lex $P240
    .const 'Sub' $P230 = "27_1268929862.73455" 
    capture_lex $P230
    .const 'Sub' $P219 = "26_1268929862.73455" 
    capture_lex $P219
    .const 'Sub' $P215 = "25_1268929862.73455" 
    capture_lex $P215
    .const 'Sub' $P197 = "23_1268929862.73455" 
    capture_lex $P197
    .const 'Sub' $P187 = "22_1268929862.73455" 
    capture_lex $P187
    .const 'Sub' $P144 = "21_1268929862.73455" 
    capture_lex $P144
    .const 'Sub' $P136 = "20_1268929862.73455" 
    capture_lex $P136
    .const 'Sub' $P126 = "19_1268929862.73455" 
    capture_lex $P126
    .const 'Sub' $P107 = "18_1268929862.73455" 
    capture_lex $P107
    .const 'Sub' $P99 = "17_1268929862.73455" 
    capture_lex $P99
    .const 'Sub' $P62 = "16_1268929862.73455" 
    capture_lex $P62
    .const 'Sub' $P50 = "15_1268929862.73455" 
    capture_lex $P50
# .annotate "line", 271
    .const 'Sub' $P554 = "45_1268929862.73455" 
    capture_lex $P554
# .annotate "line", 33
    .return ($P554)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "" :load :init :subid("post58") :outer("14_1268929862.73455")
# .annotate "line", 33
    get_hll_global $P49, ["Cuculus";"MockFS";"Unix"], "_block48" 
    .local pmc block
    set block, $P49
# .annotate "line", 40
    .const 'Sub' $P573 = "46_1268929862.73455" 
    capture_lex $P573
    $P573()
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "_block572"  :anon :subid("46_1268929862.73455") :outer("14_1268929862.73455")
# .annotate "line", 40
    .const 'Sub' $P581 = "47_1268929862.73455" 
    capture_lex $P581
# .annotate "line", 43
    $P574 = root_new ['parrot';'ResizablePMCArray']
    .lex "@multisubs", $P574
# .annotate "line", 41
    "auto_accessors"(1 :named("private"))
# .annotate "line", 43
    new $P575, "ResizablePMCArray"
    push $P575, "add_entry"
    push $P575, "chdir"
    push $P575, "exists"
    push $P575, "get_contents"
    push $P575, "has_type"
    push $P575, "mkpath"
    store_lex "@multisubs", $P575
# .annotate "line", 52
    find_lex $P577, "@multisubs"
    defined $I578, $P577
    unless $I578, for_undef_59
    iter $P576, $P577
    new $P606, 'ExceptionHandler'
    set_addr $P606, loop605_handler
    $P606."handle_types"(65, 67, 66)
    push_eh $P606
  loop605_test:
    unless $P576, loop605_done
    shift $P579, $P576
  loop605_redo:
    .const 'Sub' $P581 = "47_1268929862.73455" 
    capture_lex $P581
    $P581($P579)
  loop605_next:
    goto loop605_test
  loop605_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P607, exception, 'type'
    eq $P607, 65, loop605_next
    eq $P607, 67, loop605_redo
  loop605_done:
    pop_eh 
  for_undef_59:
# .annotate "line", 40
    .return ($P576)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "_block580"  :anon :subid("47_1268929862.73455") :outer("46_1268929862.73455")
    .param pmc param_582
# .annotate "line", 52
    .lex "$name", param_582
# .annotate "line", 55
    new $P583, "Undef"
    .lex "$string_sub", $P583
# .annotate "line", 53
    get_hll_global $P584, ["Parrot"], "define_multisub"
    find_lex $P585, "$name"
    find_lex $P586, "$name"
    $P584($P585, 1 :named("method"), $P586 :named("starting_with"))
# .annotate "line", 55
    get_hll_global $P587, ["Parrot"], "get_hll_global"
    new $P588, 'String'
    set $P588, "Cuculus::MockFS::Unix::"
    find_lex $P589, "$name"
    set $S590, $P589
    concat $P591, $P588, $S590
    concat $P592, $P591, "__String"
    $P593 = $P587($P592)
    store_lex "$string_sub", $P593
# .annotate "line", 56
    find_lex $P596, "$string_sub"
    $P597 = "is_null"($P596)
    unless $P597, unless_595
    set $P594, $P597
    goto unless_595_end
  unless_595:
# .annotate "line", 57
    get_hll_global $P598, ["Parrot"], "define_multisub"
    find_lex $P599, "$name"
    find_lex $P600, "$string_sub"
    new $P601, "ResizablePMCArray"
    push $P601, $P600
    new $P602, "ResizablePMCArray"
    push $P602, "_"
    push $P602, "string"
    new $P603, "ResizablePMCArray"
    push $P603, $P602
    $P604 = $P598($P599, $P601, $P603 :named("signatures"))
# .annotate "line", 56
    set $P594, $P604
  unless_595_end:
# .annotate "line", 52
    .return ($P594)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "add_entry__String"  :subid("15_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_53
    .param pmc param_54 :slurpy :named
# .annotate "line", 67
    new $P52, 'ExceptionHandler'
    set_addr $P52, control_51
    $P52."handle_types"(58)
    push_eh $P52
    .lex "self", self
    .lex "$path", param_53
    .lex "%named", param_54
# .annotate "line", 68
    find_lex $P55, "self"
    get_hll_global $P56, "Path"
    find_lex $P57, "$path"
    $P58 = $P56."new"($P57)
    find_lex $P59, "%named"
    $P60 = $P55."add_entry"($P58, $P59 :flat)
# .annotate "line", 67
    .return ($P60)
  control_51:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P61, exception, "payload"
    .return ($P61)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "add_entry__Path"  :subid("16_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_65
    .param pmc param_66 :slurpy :named
# .annotate "line", 71
    new $P64, 'ExceptionHandler'
    set_addr $P64, control_63
    $P64."handle_types"(58)
    push_eh $P64
    .lex "self", self
    .lex "$path", param_65
    .lex "%named", param_66
# .annotate "line", 75
    $P67 = root_new ['parrot';'Hash']
    .lex "%path_attrs", $P67
# .annotate "line", 80
    new $P68, "Undef"
    .lex "$entry", $P68
# .annotate "line", 73
    find_lex $P70, "self"
    find_lex $P71, "$path"
    $P72 = $P70."find_path"($P71)
    defined $I73, $P72
    unless $I73, if_69_end
# .annotate "line", 72
    new $P74, 'String'
    set $P74, "Cannot add entry "
    find_lex $P75, "$path"
    concat $P76, $P74, $P75
    concat $P77, $P76, " - that path already exists"
    "die"($P77)
  if_69_end:
# .annotate "line", 75
    find_lex $P78, "%named"
    $P79 = $P78."clone"()
    store_lex "%path_attrs", $P79
# .annotate "line", 76
    find_lex $P80, "%path_attrs"
    $P80."delete"("name")
# .annotate "line", 77
    find_lex $P81, "%path_attrs"
    $P81."delete"("type")
# .annotate "line", 78
    find_lex $P82, "self"
    find_lex $P83, "$path"
    find_lex $P84, "%path_attrs"
    $P82."mkpath"($P83, $P84 :flat)
# .annotate "line", 80
    find_lex $P85, "self"
    find_lex $P86, "$path"
    $P87 = $P85."find_path"($P86)
    store_lex "$entry", $P87
# .annotate "line", 83
    find_lex $P89, "$entry"
    defined $I90, $P89
    if $I90, unless_88_end
# .annotate "line", 82
    new $P91, 'String'
    set $P91, "Failed to add entry "
    find_lex $P92, "$path"
    concat $P93, $P91, $P92
    "die"($P93)
  unless_88_end:
# .annotate "line", 85
    find_lex $P94, "$entry"
    unless_null $P94, vivify_60
    $P94 = root_new ['parrot';'ResizablePMCArray']
  vivify_60:
    set $P95, $P94[-1]
    unless_null $P95, vivify_61
    new $P95, "Undef"
  vivify_61:
    find_lex $P96, "%named"
    $P97 = $P95."merge"($P96, "right" :named("priority"))
# .annotate "line", 71
    .return ($P97)
  control_63:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P98, exception, "payload"
    .return ($P98)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "chdir__ANY"  :subid("17_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_102
# .annotate "line", 88
    new $P101, 'ExceptionHandler'
    set_addr $P101, control_100
    $P101."handle_types"(58)
    push_eh $P101
    .lex "self", self
    .lex "$path", param_102
# .annotate "line", 89
    find_lex $P103, "$path"
    typeof $S104, $P103
    $P105 = "die"("Don't know how to chdir to a(n) ", $S104, ". Use a String or Path.")
# .annotate "line", 88
    .return ($P105)
  control_100:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "chdir__Path"  :subid("18_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_110
# .annotate "line", 92
    new $P109, 'ExceptionHandler'
    set_addr $P109, control_108
    $P109."handle_types"(58)
    push_eh $P109
    .lex "self", self
    .lex "$path", param_110
# .annotate "line", 94
    $P111 = root_new ['parrot';'ResizablePMCArray']
    .lex "@new_wd", $P111
    find_lex $P112, "self"
    find_lex $P113, "$path"
    $P114 = $P112."find_path"($P113)
    store_lex "@new_wd", $P114
# .annotate "line", 96
    find_lex $P117, "@new_wd"
    $P118 = $P117."defined"()
    if $P118, if_116
# .annotate "line", 100
    new $P121, 'String'
    set $P121, "Can't cd to "
    find_lex $P122, "$path"
    concat $P123, $P121, $P122
    $P124 = "die"($P123)
# .annotate "line", 99
    set $P115, $P124
# .annotate "line", 96
    goto if_116_end
  if_116:
# .annotate "line", 97
    find_lex $P119, "@new_wd"
    find_lex $P120, "self"
    setattribute $P120, "@!cwd_path", $P119
# .annotate "line", 96
    set $P115, $P119
  if_116_end:
# .annotate "line", 92
    .return ($P115)
  control_108:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P125, exception, "payload"
    .return ($P125)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "chdir__String"  :subid("19_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_129
# .annotate "line", 104
    new $P128, 'ExceptionHandler'
    set_addr $P128, control_127
    $P128."handle_types"(58)
    push_eh $P128
    .lex "self", self
    .lex "$str", param_129
# .annotate "line", 105
    find_lex $P130, "self"
    get_hll_global $P131, "Path"
    find_lex $P132, "$str"
    $P133 = $P131."new"($P132)
    $P134 = $P130."chdir"($P133)
# .annotate "line", 104
    .return ($P134)
  control_127:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P135, exception, "payload"
    .return ($P135)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "get_contents__ANY"  :subid("20_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_139
# .annotate "line", 108
    new $P138, 'ExceptionHandler'
    set_addr $P138, control_137
    $P138."handle_types"(58)
    push_eh $P138
    .lex "self", self
    .lex "$path", param_139
# .annotate "line", 109
    find_lex $P140, "$path"
    typeof $S141, $P140
    $P142 = "die"("Don't know how to get contents of ", $S141, ". Use a String or Path")
# .annotate "line", 108
    .return ($P142)
  control_137:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P143, exception, "payload"
    .return ($P143)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "get_contents__Path"  :subid("21_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_147
# .annotate "line", 112
    new $P146, 'ExceptionHandler'
    set_addr $P146, control_145
    $P146."handle_types"(58)
    push_eh $P146
    .lex "self", self
    .lex "$path", param_147
# .annotate "line", 113
    $P148 = root_new ['parrot';'ResizablePMCArray']
    .lex "@path", $P148
# .annotate "line", 114
    new $P149, "Undef"
    .lex "$item", $P149
# .annotate "line", 115
    new $P150, "Undef"
    .lex "$type", $P150
# .annotate "line", 113
    find_lex $P151, "self"
    find_lex $P152, "$path"
    $P153 = $P151."find_path"($P152)
    store_lex "@path", $P153
# .annotate "line", 114
    find_lex $P154, "@path"
    unless_null $P154, vivify_62
    $P154 = root_new ['parrot';'ResizablePMCArray']
  vivify_62:
    set $P155, $P154[-1]
    unless_null $P155, vivify_63
    new $P155, "Undef"
  vivify_63:
    store_lex "$item", $P155
# .annotate "line", 115
    find_lex $P156, "$item"
    unless_null $P156, vivify_64
    $P156 = root_new ['parrot';'Hash']
  vivify_64:
    set $P157, $P156["type"]
    unless_null $P157, vivify_65
    new $P157, "Undef"
  vivify_65:
    store_lex "$type", $P157
# .annotate "line", 117
    find_lex $P160, "$type"
    set $S161, $P160
    iseq $I162, $S161, "device"
    if $I162, if_159
# .annotate "line", 120
    find_lex $P169, "$type"
    set $S170, $P169
    iseq $I171, $S170, "directory"
    if $I171, if_168
# .annotate "line", 123
    find_lex $P177, "$type"
    set $S178, $P177
    iseq $I179, $S178, "file"
    if $I179, if_176
# .annotate "line", 128
    new $P182, 'String'
    set $P182, "Cannot get contents of link: "
    find_lex $P183, "$path"
    concat $P184, $P182, $P183
    $P185 = "die"($P184)
# .annotate "line", 126
    set $P175, $P185
# .annotate "line", 123
    goto if_176_end
  if_176:
    find_lex $P180, "$item"
    unless_null $P180, vivify_66
    $P180 = root_new ['parrot';'Hash']
  vivify_66:
    set $P181, $P180["contents"]
    unless_null $P181, vivify_67
    new $P181, "Undef"
  vivify_67:
    set $P175, $P181
  if_176_end:
    set $P167, $P175
# .annotate "line", 120
    goto if_168_end
  if_168:
# .annotate "line", 121
    find_lex $P172, "$item"
    unless_null $P172, vivify_68
    $P172 = root_new ['parrot';'Hash']
  vivify_68:
    set $P173, $P172["contents"]
    unless_null $P173, vivify_69
    new $P173, "Undef"
  vivify_69:
    $P174 = $P173."keys"()
# .annotate "line", 120
    set $P167, $P174
  if_168_end:
    set $P158, $P167
# .annotate "line", 117
    goto if_159_end
  if_159:
# .annotate "line", 118
    new $P163, 'String'
    set $P163, "Cannot get contents of device: "
    find_lex $P164, "$path"
    concat $P165, $P163, $P164
    $P166 = "die"($P165)
# .annotate "line", 117
    set $P158, $P166
  if_159_end:
# .annotate "line", 112
    .return ($P158)
  control_145:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P186, exception, "payload"
    .return ($P186)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "get_contents__String"  :subid("22_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_190
# .annotate "line", 132
    new $P189, 'ExceptionHandler'
    set_addr $P189, control_188
    $P189."handle_types"(58)
    push_eh $P189
    .lex "self", self
    .lex "$path", param_190
# .annotate "line", 133
    find_lex $P191, "self"
    get_hll_global $P192, "Path"
    find_lex $P193, "$path"
    $P194 = $P192."new"($P193)
    $P195 = $P191."get_contents"($P194)
# .annotate "line", 132
    .return ($P195)
  control_188:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P196, exception, "payload"
    .return ($P196)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "cwd"  :subid("23_1268929862.73455") :method :outer("14_1268929862.73455")
# .annotate "line", 136
    .const 'Sub' $P205 = "24_1268929862.73455" 
    capture_lex $P205
    new $P199, 'ExceptionHandler'
    set_addr $P199, control_198
    $P199."handle_types"(58)
    push_eh $P199
    .lex "self", self
# .annotate "line", 137
    $P200 = root_new ['parrot';'ResizablePMCArray']
    .lex "@path", $P200
# .annotate "line", 138
    new $P201, "Undef"
    .lex "$*FileSystem", $P201
# .annotate "line", 137
    find_lex $P202, "self"
    getattribute $P203, $P202, "@!cwd_path"
    unless_null $P203, vivify_70
    $P203 = root_new ['parrot';'ResizablePMCArray']
  vivify_70:
    .const 'Sub' $P205 = "24_1268929862.73455" 
    capture_lex $P205
    $P209 = $P203."map"($P205)
    store_lex "@path", $P209
# .annotate "line", 138
    find_lex $P210, "self"
    store_lex "$*FileSystem", $P210
# .annotate "line", 139
    get_hll_global $P211, "Path"
    find_lex $P212, "@path"
    $P213 = $P211."new"($P212 :flat, 1 :named("absolute"))
# .annotate "line", 136
    .return ($P213)
  control_198:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P214, exception, "payload"
    .return ($P214)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "_block204"  :anon :subid("24_1268929862.73455") :outer("23_1268929862.73455")
    .param pmc param_206
# .annotate "line", 137
    .lex "$part", param_206
    find_lex $P207, "$part"
    unless_null $P207, vivify_71
    $P207 = root_new ['parrot';'Hash']
  vivify_71:
    set $P208, $P207["name"]
    unless_null $P208, vivify_72
    new $P208, "Undef"
  vivify_72:
    .return ($P208)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "directory_separator"  :subid("25_1268929862.73455") :method :outer("14_1268929862.73455")
# .annotate "line", 142
    new $P217, 'ExceptionHandler'
    set_addr $P217, control_216
    $P217."handle_types"(58)
    push_eh $P217
    .lex "self", self
    .return ("/")
  control_216:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P218, exception, "payload"
    .return ($P218)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "exists__Path"  :subid("26_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_222
# .annotate "line", 144
    new $P221, 'ExceptionHandler'
    set_addr $P221, control_220
    $P221."handle_types"(58)
    push_eh $P221
    .lex "self", self
    .lex "$path", param_222
# .annotate "line", 145
    new $P223, "Undef"
    .lex "$item", $P223
    find_lex $P224, "self"
    find_lex $P225, "$path"
    $P226 = $P224."find_path"($P225)
    store_lex "$item", $P226
# .annotate "line", 147
    find_lex $P227, "$item"
    $P228 = $P227."defined"()
# .annotate "line", 144
    .return ($P228)
  control_220:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P229, exception, "payload"
    .return ($P229)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "exists__String"  :subid("27_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_233
# .annotate "line", 150
    new $P232, 'ExceptionHandler'
    set_addr $P232, control_231
    $P232."handle_types"(58)
    push_eh $P232
    .lex "self", self
    .lex "$path", param_233
# .annotate "line", 151
    find_lex $P234, "self"
    get_hll_global $P235, "Path"
    find_lex $P236, "$path"
    $P237 = $P235."new"($P236)
    $P238 = $P234."exists"($P237)
# .annotate "line", 150
    .return ($P238)
  control_231:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P239, exception, "payload"
    .return ($P239)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "exists__ANY"  :subid("28_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_243
# .annotate "line", 154
    new $P242, 'ExceptionHandler'
    set_addr $P242, control_241
    $P242."handle_types"(58)
    push_eh $P242
    .lex "self", self
    .lex "$path", param_243
# .annotate "line", 155
    find_lex $P244, "$path"
    typeof $S245, $P244
    $P246 = "die"("Don't know how to check if ", $S245, " exists. Use a String or Path")
# .annotate "line", 154
    .return ($P246)
  control_241:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P247, exception, "payload"
    .return ($P247)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "find_path"  :subid("29_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_251
# .annotate "line", 158
    .const 'Sub' $P276 = "30_1268929862.73455" 
    capture_lex $P276
    new $P250, 'ExceptionHandler'
    set_addr $P250, control_249
    $P250."handle_types"(58)
    push_eh $P250
    .lex "self", self
    .lex "$path", param_251
# .annotate "line", 159
    $P252 = root_new ['parrot';'ResizablePMCArray']
    .lex "@path", $P252
# .annotate "line", 163
    new $P253, "Undef"
    .lex "$cur", $P253
# .annotate "line", 164
    $P254 = root_new ['parrot';'ResizablePMCArray']
    .lex "@elements", $P254
# .annotate "line", 159
    find_lex $P257, "$path"
    $P258 = $P257."is_absolute"()
    if $P258, if_256
    find_lex $P265, "self"
    getattribute $P266, $P265, "@!cwd_path"
    unless_null $P266, vivify_73
    $P266 = root_new ['parrot';'ResizablePMCArray']
  vivify_73:
    set $P255, $P266
    goto if_256_end
  if_256:
# .annotate "line", 160
    find_lex $P259, "$path"
    $P260 = $P259."volume"()
    find_lex $P261, "self"
    getattribute $P262, $P261, "%!volumes"
    unless_null $P262, vivify_74
    $P262 = root_new ['parrot';'Hash']
  vivify_74:
    set $P263, $P262[$P260]
    unless_null $P263, vivify_75
    new $P263, "Undef"
  vivify_75:
# .annotate "line", 159
    new $P264, "ResizablePMCArray"
    push $P264, $P263
    set $P255, $P264
  if_256_end:
# .annotate "line", 160
    store_lex "@path", $P255
# .annotate "line", 163
    find_lex $P267, "@path"
    unless_null $P267, vivify_76
    $P267 = root_new ['parrot';'ResizablePMCArray']
  vivify_76:
    set $P268, $P267[-1]
    unless_null $P268, vivify_77
    new $P268, "Undef"
  vivify_77:
    store_lex "$cur", $P268
# .annotate "line", 164
    find_lex $P269, "$path"
    $P270 = $P269."elements"()
    store_lex "@elements", $P270
# .annotate "line", 166
    find_lex $P272, "@elements"
    defined $I273, $P272
    unless $I273, for_undef_78
    iter $P271, $P272
    new $P299, 'ExceptionHandler'
    set_addr $P299, loop298_handler
    $P299."handle_types"(65, 67, 66)
    push_eh $P299
  loop298_test:
    unless $P271, loop298_done
    shift $P274, $P271
  loop298_redo:
    .const 'Sub' $P276 = "30_1268929862.73455" 
    capture_lex $P276
    $P276($P274)
  loop298_next:
    goto loop298_test
  loop298_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P300, exception, 'type'
    eq $P300, 65, loop298_next
    eq $P300, 67, loop298_redo
  loop298_done:
    pop_eh 
  for_undef_78:
    find_lex $P301, "@path"
# .annotate "line", 158
    .return ($P301)
  control_249:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P302, exception, "payload"
    .return ($P302)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "_block275"  :anon :subid("30_1268929862.73455") :outer("29_1268929862.73455")
    .param pmc param_277
# .annotate "line", 166
    .lex "$next", param_277
# .annotate "line", 167
    new $P278, "Undef"
    .lex "$undef", $P278
# .annotate "line", 168
    find_lex $P282, "$cur"
    unless_null $P282, vivify_79
    $P282 = root_new ['parrot';'Hash']
  vivify_79:
    set $P283, $P282["type"]
    unless_null $P283, vivify_80
    new $P283, "Undef"
  vivify_80:
    set $S284, $P283
    iseq $I285, $S284, "directory"
    if $I285, if_281
    new $P280, 'Integer'
    set $P280, $I285
    goto if_281_end
  if_281:
    find_lex $P286, "$cur"
    unless_null $P286, vivify_81
    $P286 = root_new ['parrot';'Hash']
  vivify_81:
    set $P287, $P286["contents"]
    unless_null $P287, vivify_82
    new $P287, "Undef"
  vivify_82:
    find_lex $P288, "$next"
    $P289 = $P287."contains"($P288)
    set $P280, $P289
  if_281_end:
    if $P280, unless_279_end
# .annotate "line", 167
    new $P290, "Exception"
    set $P290['type'], 58
    find_lex $P291, "$undef"
    setattribute $P290, 'payload', $P291
    throw $P290
  unless_279_end:
# .annotate "line", 170
    find_lex $P292, "@path"
    find_lex $P293, "$next"
    find_lex $P294, "$cur"
    unless_null $P294, vivify_83
    $P294 = root_new ['parrot';'Hash']
  vivify_83:
    set $P295, $P294["contents"]
    unless_null $P295, vivify_84
    $P295 = root_new ['parrot';'Hash']
  vivify_84:
    set $P296, $P295[$P293]
    unless_null $P296, vivify_85
    new $P296, "Undef"
  vivify_85:
    store_lex "$cur", $P296
    $P297 = $P292."push"($P296)
# .annotate "line", 166
    .return ($P297)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "has_type__ANY"  :subid("31_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_306
    .param pmc param_307
# .annotate "line", 176
    new $P305, 'ExceptionHandler'
    set_addr $P305, control_304
    $P305."handle_types"(58)
    push_eh $P305
    .lex "self", self
    .lex "$path", param_306
    .lex "$type", param_307
# .annotate "line", 177
    find_lex $P308, "$path"
    typeof $S309, $P308
    new $P310, 'String'
    set $P310, " is a "
    find_lex $P311, "$type"
    concat $P312, $P310, $P311
    concat $P313, $P312, ". Use a String or Path"
    $P314 = "die"("Don't know how to check if a(n) ", $S309, $P313)
# .annotate "line", 176
    .return ($P314)
  control_304:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P315, exception, "payload"
    .return ($P315)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "has_type__Path"  :subid("32_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_319
    .param pmc param_320
# .annotate "line", 180
    new $P318, 'ExceptionHandler'
    set_addr $P318, control_317
    $P318."handle_types"(58)
    push_eh $P318
    .lex "self", self
    .lex "$path", param_319
    .lex "$type", param_320
# .annotate "line", 181
    $P321 = root_new ['parrot';'ResizablePMCArray']
    .lex "@path", $P321
    find_lex $P322, "self"
    find_lex $P323, "$path"
    $P324 = $P322."find_path"($P323)
    store_lex "@path", $P324
# .annotate "line", 182
    find_lex $P325, "@path"
    unless_null $P325, vivify_86
    $P325 = root_new ['parrot';'ResizablePMCArray']
  vivify_86:
    set $P326, $P325[-1]
    unless_null $P326, vivify_87
    $P326 = root_new ['parrot';'Hash']
  vivify_87:
    set $P327, $P326["type"]
    unless_null $P327, vivify_88
    new $P327, "Undef"
  vivify_88:
    set $S328, $P327
    find_lex $P329, "$type"
    set $S330, $P329
    iseq $I331, $S328, $S330
# .annotate "line", 180
    .return ($I331)
  control_317:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P332, exception, "payload"
    .return ($P332)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "has_type__String"  :subid("33_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_336
    .param pmc param_337
# .annotate "line", 185
    new $P335, 'ExceptionHandler'
    set_addr $P335, control_334
    $P335."handle_types"(58)
    push_eh $P335
    .lex "self", self
    .lex "$path", param_336
    .lex "$type", param_337
# .annotate "line", 186
    find_lex $P338, "self"
    get_hll_global $P339, "Path"
    find_lex $P340, "$path"
    $P341 = $P339."new"($P340)
    find_lex $P342, "$type"
    $P343 = $P338."has_type"($P341, $P342)
# .annotate "line", 185
    .return ($P343)
  control_334:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P344, exception, "payload"
    .return ($P344)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "is_device"  :subid("34_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_348
# .annotate "line", 189
    new $P347, 'ExceptionHandler'
    set_addr $P347, control_346
    $P347."handle_types"(58)
    push_eh $P347
    .lex "self", self
    .lex "$path", param_348
    find_lex $P349, "self"
    find_lex $P350, "$path"
    $P351 = $P349."has_type"($P350, "device")
    .return ($P351)
  control_346:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P352, exception, "payload"
    .return ($P352)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "is_directory"  :subid("35_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_356
# .annotate "line", 190
    new $P355, 'ExceptionHandler'
    set_addr $P355, control_354
    $P355."handle_types"(58)
    push_eh $P355
    .lex "self", self
    .lex "$path", param_356
    find_lex $P357, "self"
    find_lex $P358, "$path"
    $P359 = $P357."has_type"($P358, "directory")
    .return ($P359)
  control_354:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P360, exception, "payload"
    .return ($P360)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "is_file"  :subid("36_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_364
# .annotate "line", 191
    new $P363, 'ExceptionHandler'
    set_addr $P363, control_362
    $P363."handle_types"(58)
    push_eh $P363
    .lex "self", self
    .lex "$path", param_364
    find_lex $P365, "self"
    find_lex $P366, "$path"
    $P367 = $P365."has_type"($P366, "file")
    .return ($P367)
  control_362:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P368, exception, "payload"
    .return ($P368)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "is_link"  :subid("37_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_372
# .annotate "line", 192
    new $P371, 'ExceptionHandler'
    set_addr $P371, control_370
    $P371."handle_types"(58)
    push_eh $P371
    .lex "self", self
    .lex "$path", param_372
    find_lex $P373, "self"
    find_lex $P374, "$path"
    $P375 = $P373."has_type"($P374, "link")
    .return ($P375)
  control_370:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P376, exception, "payload"
    .return ($P376)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "_init_obj"  :subid("38_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_380 :slurpy
    .param pmc param_381 :slurpy :named
# .annotate "line", 194
    new $P379, 'ExceptionHandler'
    set_addr $P379, control_378
    $P379."handle_types"(58)
    push_eh $P379
    .lex "self", self
    .lex "@pos", param_380
    .lex "%named", param_381
# .annotate "line", 195
    find_lex $P382, "self"
    $P383 = $P382."new_entry"("/" :named("name"), "directory" :named("type"))
    find_lex $P384, "self"
    getattribute $P385, $P384, "%!volumes"
    unless_null $P385, vivify_89
    $P385 = root_new ['parrot';'Hash']
    setattribute $P384, "%!volumes", $P385
  vivify_89:
    set $P385[""], $P383
# .annotate "line", 196
    find_lex $P386, "self"
    getattribute $P387, $P386, "%!volumes"
    unless_null $P387, vivify_90
    $P387 = root_new ['parrot';'Hash']
  vivify_90:
    set $P388, $P387[""]
    unless_null $P388, vivify_91
    new $P388, "Undef"
  vivify_91:
    new $P389, "ResizablePMCArray"
    push $P389, $P388
    find_lex $P390, "self"
    setattribute $P390, "@!cwd_path", $P389
# .annotate "line", 198
    find_lex $P391, "self"
    find_lex $P392, "@pos"
    find_lex $P393, "%named"
    $P394 = $P391."_init_args"($P392 :flat, $P393 :flat)
# .annotate "line", 194
    .return ($P394)
  control_378:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P395, exception, "payload"
    .return ($P395)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "mkpath__ANY"  :subid("39_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_399
# .annotate "line", 201
    new $P398, 'ExceptionHandler'
    set_addr $P398, control_397
    $P398."handle_types"(58)
    push_eh $P398
    .lex "self", self
    .lex "$path", param_399
# .annotate "line", 202
    find_lex $P400, "$path"
    typeof $S401, $P400
    $P402 = "die"("Don't know how to mkpath a(n) ", $S401, ". Use a String or Path")
# .annotate "line", 201
    .return ($P402)
  control_397:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P403, exception, "payload"
    .return ($P403)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "mkpath__Path"  :subid("40_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_407
    .param pmc param_408 :slurpy :named
# .annotate "line", 205
    .const 'Sub' $P433 = "41_1268929862.73455" 
    capture_lex $P433
    new $P406, 'ExceptionHandler'
    set_addr $P406, control_405
    $P406."handle_types"(58)
    push_eh $P406
    .lex "self", self
    .lex "$path", param_407
    .lex "%named", param_408
# .annotate "line", 206
    $P409 = root_new ['parrot';'ResizablePMCArray']
    .lex "@path", $P409
# .annotate "line", 210
    new $P410, "Undef"
    .lex "$cur", $P410
# .annotate "line", 211
    $P411 = root_new ['parrot';'ResizablePMCArray']
    .lex "@elements", $P411
# .annotate "line", 206
    find_lex $P414, "$path"
    $P415 = $P414."is_absolute"()
    if $P415, if_413
    find_lex $P422, "self"
    getattribute $P423, $P422, "@!cwd_path"
    unless_null $P423, vivify_92
    $P423 = root_new ['parrot';'ResizablePMCArray']
  vivify_92:
    set $P412, $P423
    goto if_413_end
  if_413:
# .annotate "line", 207
    find_lex $P416, "$path"
    $P417 = $P416."volume"()
    find_lex $P418, "self"
    getattribute $P419, $P418, "%!volumes"
    unless_null $P419, vivify_93
    $P419 = root_new ['parrot';'Hash']
  vivify_93:
    set $P420, $P419[$P417]
    unless_null $P420, vivify_94
    new $P420, "Undef"
  vivify_94:
# .annotate "line", 206
    new $P421, "ResizablePMCArray"
    push $P421, $P420
    set $P412, $P421
  if_413_end:
# .annotate "line", 207
    store_lex "@path", $P412
# .annotate "line", 210
    find_lex $P424, "@path"
    unless_null $P424, vivify_95
    $P424 = root_new ['parrot';'ResizablePMCArray']
  vivify_95:
    set $P425, $P424[-1]
    unless_null $P425, vivify_96
    new $P425, "Undef"
  vivify_96:
    store_lex "$cur", $P425
# .annotate "line", 211
    find_lex $P426, "$path"
    $P427 = $P426."elements"()
    store_lex "@elements", $P427
# .annotate "line", 213
    find_lex $P429, "@elements"
    defined $I430, $P429
    unless $I430, for_undef_97
    iter $P428, $P429
    new $P469, 'ExceptionHandler'
    set_addr $P469, loop468_handler
    $P469."handle_types"(65, 67, 66)
    push_eh $P469
  loop468_test:
    unless $P428, loop468_done
    shift $P431, $P428
  loop468_redo:
    .const 'Sub' $P433 = "41_1268929862.73455" 
    capture_lex $P433
    $P433($P431)
  loop468_next:
    goto loop468_test
  loop468_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P470, exception, 'type'
    eq $P470, 65, loop468_next
    eq $P470, 67, loop468_redo
  loop468_done:
    pop_eh 
  for_undef_97:
    find_lex $P471, "@path"
# .annotate "line", 205
    .return ($P471)
  control_405:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P472, exception, "payload"
    .return ($P472)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "_block432"  :anon :subid("41_1268929862.73455") :outer("40_1268929862.73455")
    .param pmc param_434
# .annotate "line", 213
    .lex "$next", param_434
# .annotate "line", 214
    find_lex $P437, "$cur"
    unless_null $P437, vivify_98
    $P437 = root_new ['parrot';'Hash']
  vivify_98:
    set $P438, $P437["type"]
    unless_null $P438, vivify_99
    new $P438, "Undef"
  vivify_99:
    set $S439, $P438
    iseq $I440, $S439, "directory"
    if $I440, if_436
# .annotate "line", 222
    new $P458, 'String'
    set $P458, "Cannot mkpath "
    find_lex $P459, "$path"
    concat $P460, $P458, $P459
    concat $P461, $P460, " - element "
    find_lex $P462, "$cur"
    unless_null $P462, vivify_100
    $P462 = root_new ['parrot';'Hash']
  vivify_100:
    set $P463, $P462["name"]
    unless_null $P463, vivify_101
    new $P463, "Undef"
  vivify_101:
    set $S464, $P463
    concat $P465, $P461, $S464
    concat $P466, $P465, " is not a directory"
    $P467 = "die"($P466)
# .annotate "line", 221
    set $P435, $P467
# .annotate "line", 214
    goto if_436_end
  if_436:
# .annotate "line", 215
    find_lex $P442, "$cur"
    unless_null $P442, vivify_102
    $P442 = root_new ['parrot';'Hash']
  vivify_102:
    set $P443, $P442["contents"]
    unless_null $P443, vivify_103
    new $P443, "Undef"
  vivify_103:
    find_lex $P444, "$next"
    $P445 = $P443."contains"($P444)
    if $P445, unless_441_end
# .annotate "line", 216
    find_lex $P446, "self"
    find_lex $P447, "$next"
    $P448 = $P446."new_entry"($P447 :named("name"), "directory" :named("type"))
    find_lex $P449, "$next"
    find_lex $P450, "$cur"
    unless_null $P450, vivify_104
    $P450 = root_new ['parrot';'Hash']
    store_lex "$cur", $P450
  vivify_104:
    set $P451, $P450["contents"]
    unless_null $P451, vivify_105
    $P451 = root_new ['parrot';'Hash']
    set $P450["contents"], $P451
  vivify_105:
    set $P451[$P449], $P448
  unless_441_end:
# .annotate "line", 219
    find_lex $P452, "@path"
    find_lex $P453, "$next"
    find_lex $P454, "$cur"
    unless_null $P454, vivify_106
    $P454 = root_new ['parrot';'Hash']
  vivify_106:
    set $P455, $P454["contents"]
    unless_null $P455, vivify_107
    $P455 = root_new ['parrot';'Hash']
  vivify_107:
    set $P456, $P455[$P453]
    unless_null $P456, vivify_108
    new $P456, "Undef"
  vivify_108:
    store_lex "$cur", $P456
    $P457 = $P452."push"($P456)
# .annotate "line", 214
    set $P435, $P457
  if_436_end:
# .annotate "line", 213
    .return ($P435)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "mkpath__String"  :subid("42_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_476
# .annotate "line", 230
    new $P475, 'ExceptionHandler'
    set_addr $P475, control_474
    $P475."handle_types"(58)
    push_eh $P475
    .lex "self", self
    .lex "$path", param_476
# .annotate "line", 231
    find_lex $P477, "self"
    get_hll_global $P478, "Path"
    find_lex $P479, "$path"
    $P480 = $P478."new"($P479)
    $P481 = $P477."mkpath"($P480)
# .annotate "line", 230
    .return ($P481)
  control_474:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P482, exception, "payload"
    .return ($P482)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "new_entry"  :subid("43_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_486 :optional :named("type")
    .param int has_param_486 :opt_flag
    .param pmc param_488 :slurpy :named
# .annotate "line", 234
    new $P485, 'ExceptionHandler'
    set_addr $P485, control_484
    $P485."handle_types"(58)
    push_eh $P485
    .lex "self", self
    if has_param_486, optparam_109
    new $P487, "String"
    assign $P487, "file"
    set param_486, $P487
  optparam_109:
    .lex "$type", param_486
    .lex "%details", param_488
# .annotate "line", 235
    new $P489, "Undef"
    .lex "$contents", $P489
# .annotate "line", 236
    new $P490, "Undef"
    .lex "$undef", $P490
# .annotate "line", 234
    find_lex $P491, "$contents"
    find_lex $P492, "$undef"
# .annotate "line", 238
    find_lex $P494, "$type"
    set $S495, $P494
    iseq $I496, $S495, "directory"
    unless $I496, if_493_end
# .annotate "line", 239
    get_hll_global $P497, "Hash"
    $P498 = $P497."new"()
    store_lex "$contents", $P498
  if_493_end:
# .annotate "line", 242
    find_lex $P499, "%details"
    get_hll_global $P500, "Hash"
    find_lex $P501, "$contents"
    find_lex $P502, "$undef"
    find_lex $P503, "$undef"
    find_lex $P504, "$type"
    find_lex $P505, "$undef"
    $P506 = $P500."new"($P501 :named("contents"), $P502 :named("group"), $P503 :named("mode"), $P504 :named("type"), $P505 :named("user"))
    $P499."merge"($P506)
    find_lex $P507, "%details"
# .annotate "line", 234
    .return ($P507)
  control_484:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P508, exception, "payload"
    .return ($P508)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "open"  :subid("44_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_512
    .param pmc param_513 :slurpy :named
# .annotate "line", 253
    new $P511, 'ExceptionHandler'
    set_addr $P511, control_510
    $P511."handle_types"(58)
    push_eh $P511
    .lex "self", self
    .lex "$path", param_512
    .lex "%named", param_513
# .annotate "line", 255
    new $P514, "Undef"
    .lex "$fh", $P514
# .annotate "line", 256
    new $P515, "Undef"
    .lex "$mode", $P515
# .annotate "line", 255
    new $P516, "String"
    assign $P516, "FileHandle"
    set $S517, $P516
    new $P518, $S517
    store_lex "$fh", $P518
# .annotate "line", 256
    new $P520, "String"
    assign $P520, ""
    find_lex $P521, "%named"
    unless_null $P521, vivify_110
    $P521 = root_new ['parrot';'Hash']
  vivify_110:
    set $P522, $P521["mode"]
    unless_null $P522, vivify_111
    new $P522, "Undef"
  vivify_111:
    concat $P523, $P520, $P522
    set $P519, $P523
    defined $I525, $P519
    if $I525, default_524
    new $P526, "String"
    assign $P526, "r"
    set $P519, $P526
  default_524:
    store_lex "$mode", $P519
# .annotate "line", 258
    find_lex $P527, "$fh"
    find_lex $P528, "$path"
    set $S529, $P528
    find_lex $P530, "$mode"
    $P527."open"($S529, $P530)
# .annotate "line", 262
    find_lex $P532, "%named"
    $P533 = $P532."contains"("buffer_size")
    unless $P533, if_531_end
# .annotate "line", 261
    find_lex $P534, "$fh"
    find_lex $P535, "%named"
    unless_null $P535, vivify_112
    $P535 = root_new ['parrot';'Hash']
  vivify_112:
    set $P536, $P535["buffer_size"]
    unless_null $P536, vivify_113
    new $P536, "Undef"
  vivify_113:
    set $N537, $P536
    $P534."buffer_size"($N537)
  if_531_end:
# .annotate "line", 264
    find_lex $P539, "%named"
    $P540 = $P539."contains"("buffer_type")
    unless $P540, if_538_end
# .annotate "line", 263
    find_lex $P541, "$fh"
    find_lex $P542, "%named"
    unless_null $P542, vivify_114
    $P542 = root_new ['parrot';'Hash']
  vivify_114:
    set $P543, $P542["buffer_type"]
    unless_null $P543, vivify_115
    new $P543, "Undef"
  vivify_115:
    set $S544, $P543
    $P541."buffer_type"($S544)
  if_538_end:
# .annotate "line", 266
    find_lex $P546, "%named"
    $P547 = $P546."contains"("encoding")
    unless $P547, if_545_end
# .annotate "line", 265
    find_lex $P548, "$fh"
    find_lex $P549, "%named"
    unless_null $P549, vivify_116
    $P549 = root_new ['parrot';'Hash']
  vivify_116:
    set $P550, $P549["encoding"]
    unless_null $P550, vivify_117
    new $P550, "Undef"
  vivify_117:
    set $S551, $P550
    $P548."encoding"($S551)
  if_545_end:
    find_lex $P552, "$fh"
# .annotate "line", 253
    .return ($P552)
  control_510:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P553, exception, "payload"
    .return ($P553)
.end


.namespace ["Cuculus";"MockFS";"Unix"]
.sub "slurp"  :subid("45_1268929862.73455") :method :outer("14_1268929862.73455")
    .param pmc param_557
    .param pmc param_558 :slurpy :named
# .annotate "line", 271
    new $P556, 'ExceptionHandler'
    set_addr $P556, control_555
    $P556."handle_types"(58)
    push_eh $P556
    .lex "self", self
    .lex "$path", param_557
    .lex "%named", param_558
# .annotate "line", 273
    new $P559, "Undef"
    .lex "$fh", $P559
# .annotate "line", 274
    new $P560, "Undef"
    .lex "$slurp", $P560
# .annotate "line", 272
    new $P561, "String"
    assign $P561, "r"
    find_lex $P562, "%named"
    unless_null $P562, vivify_118
    $P562 = root_new ['parrot';'Hash']
    store_lex "%named", $P562
  vivify_118:
    set $P562["mode"], $P561
# .annotate "line", 273
    find_lex $P563, "self"
    find_lex $P564, "$path"
    find_lex $P565, "%named"
    $P566 = $P563."open"($P564, $P565 :flat)
    store_lex "$fh", $P566
# .annotate "line", 274
    find_lex $P567, "$fh"
    $P568 = $P567."readall"()
    store_lex "$slurp", $P568
# .annotate "line", 275
    find_lex $P569, "$fh"
    $P569."close"()
    find_lex $P570, "$slurp"
# .annotate "line", 271
    .return ($P570)
  control_555:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P571, exception, "payload"
    .return ($P571)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929865.09458")
# .annotate "line", 0
    get_hll_global $P14, ["Cuculus";"Canorus";"Ovum"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Cuculus";"Canorus";"Ovum"], "_block13" 
    capture_lex $P14
    $P95 = $P14()
# .annotate "line", 1
    .return ($P95)
.end


.namespace []
.sub "" :load :init :subid("post17") :outer("10_1268929865.09458")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268929865.09458" 
    .local pmc block
    set block, $P12
    $P96 = get_root_global ["parrot"], "P6metaclass"
    new $P97, "ResizablePMCArray"
    push $P97, "&!CUCULUS_BEHAVIOR"
    push $P97, "$!CUCULUS_CANORUS"
    $P96."new_class"("Cuculus::Canorus::Ovum", $P97 :named("attr"))
.end


.namespace ["Cuculus";"Canorus";"Ovum"]
.sub "_block13"  :subid("11_1268929865.09458") :outer("10_1268929865.09458")
# .annotate "line", 7
    get_hll_global $P16, ["Cuculus";"Canorus";"Ovum";"_"], "_block15" 
    capture_lex $P16
# .annotate "line", 23
    get_hll_global $P16, ["Cuculus";"Canorus";"Ovum";"_"], "_block15" 
    capture_lex $P16
    $P94 = $P16()
# .annotate "line", 7
    .return ($P94)
.end


.namespace ["Cuculus";"Canorus";"Ovum"]
.sub "" :load :init :subid("post18") :outer("11_1268929865.09458")
# .annotate "line", 7
    get_hll_global $P14, ["Cuculus";"Canorus";"Ovum"], "_block13" 
    .local pmc block
    set block, $P14
.end


.namespace ["Cuculus";"Canorus";"Ovum";"_"]
.sub "_block15"  :subid("12_1268929865.09458") :outer("11_1268929865.09458")
# .annotate "line", 23
    .const 'Sub' $P79 = "16_1268929865.09458" 
    capture_lex $P79
    .const 'Sub' $P29 = "14_1268929865.09458" 
    capture_lex $P29
    .const 'Sub' $P17 = "13_1268929865.09458" 
    capture_lex $P17
# .annotate "line", 66
    .const 'Sub' $P17 = "13_1268929865.09458" 
    capture_lex $P17
    .lex "push_inits", $P17
# .annotate "line", 54
    find_lex $P93, "push_inits"
# .annotate "line", 23
    .return ($P93)
.end


.namespace ["Cuculus";"Canorus";"Ovum";"_"]
.sub "push_inits"  :subid("13_1268929865.09458") :outer("12_1268929865.09458")
    .param pmc param_20 :named("behavior")
    .param pmc param_21 :named("cuckoo")
# .annotate "line", 66
    new $P19, 'ExceptionHandler'
    set_addr $P19, control_18
    $P19."handle_types"(58)
    push_eh $P19
    .lex "&behavior", param_20
    .lex "$cuckoo", param_21
# .annotate "line", 67
    get_global $P22, "@_Init_stack"
    unless_null $P22, vivify_19
    $P22 = root_new ['parrot';'ResizablePMCArray']
    set_global "@_Init_stack", $P22
  vivify_19:
    get_global $P23, "@_Init_stack"
    find_lex $P24, "$cuckoo"
    $P23."push"($P24)
# .annotate "line", 68
    get_global $P25, "@_Init_stack"
    find_lex $P26, "&behavior"
    $P27 = $P25."push"($P26)
# .annotate "line", 66
    .return ($P27)
  control_18:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P28, exception, "payload"
    .return ($P28)
.end


.namespace ["Cuculus";"Canorus";"Ovum";"_"]
.sub "VTABLE_find_method"  :subid("14_1268929865.09458") :method :outer("12_1268929865.09458")
    .param pmc param_32
# .annotate "line", 23
    .const 'Sub' $P36 = "15_1268929865.09458" 
    capture_lex $P36
    new $P31, 'ExceptionHandler'
    set_addr $P31, control_30
    $P31."handle_types"(58)
    push_eh $P31
    .lex "self", self
    .lex "$name", param_32
# .annotate "line", 27
    new $P33, "Undef"
    .lex "&method", $P33
# .annotate "line", 49
    new $P34, "Undef"
    .lex "&closure", $P34
# .annotate "line", 27
    .const 'Sub' $P36 = "15_1268929865.09458" 
    capture_lex $P36
    store_lex "&method", $P36
# .annotate "line", 49
    find_lex $P72, "&method"
    newclosure $P73, $P72
    store_lex "&closure", $P73
# .annotate "line", 50
    find_lex $P74, "&closure"
    find_lex $P75, "$name"
    set $S76, $P75
    assign $P74, $S76
    find_lex $P77, "&closure"
# .annotate "line", 23
    .return ($P77)
  control_30:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P78, exception, "payload"
    .return ($P78)
.end


.namespace ["Cuculus";"Canorus";"Ovum";"_"]
.sub "_block35"  :anon :subid("15_1268929865.09458") :outer("14_1268929865.09458")
    .param pmc param_37 :slurpy
    .param pmc param_38 :slurpy :named
# .annotate "line", 27
    .lex "@pos", param_37
    .lex "%named", param_38
# .annotate "line", 28
    new $P39, "Undef"
    .lex "$self", $P39
# .annotate "line", 29
    new $P40, "Undef"
    .lex "$callsig", $P40
# .annotate "line", 36
    new $P41, "Undef"
    .lex "$cuckoo", $P41
# .annotate "line", 45
    new $P42, "Undef"
    .lex "&behavior", $P42
# .annotate "line", 28
    find_lex $P43, "@pos"
    unless_null $P43, vivify_20
    $P43 = root_new ['parrot';'ResizablePMCArray']
  vivify_20:
    set $P44, $P43[0]
    unless_null $P44, vivify_21
    new $P44, "Undef"
  vivify_21:
    store_lex "$self", $P44
# .annotate "line", 29
    get_hll_global $P45, "CallSignature"
    find_lex $P46, "$name"
    find_lex $P47, "%named"
    find_lex $P48, "$self"
    find_lex $P49, "@pos"
    $P50 = $P45."new"($P46 :named("method"), $P47 :named("named"), $P48 :named("object"), $P49 :named("positional"))
    store_lex "$callsig", $P50
# .annotate "line", 36
    find_lex $P51, "$self"
    new $P52, "String"
    assign $P52, "$!CUCULUS_CANORUS"
    set $S53, $P52
    getattribute $P54, $P51, $S53
    store_lex "$cuckoo", $P54
# .annotate "line", 38
    find_lex $P56, "$cuckoo"
    isnull $I57, $P56
    unless $I57, if_55_end
# .annotate "line", 41
    get_hll_global $P58, ["Cuculus";"Canorus";"Ovum";"_"], "pop_inits"
    find_lex $P59, "$self"
    $P58($P59)
# .annotate "line", 42
    find_lex $P60, "$self"
    new $P61, "String"
    assign $P61, "$!CUCULUS_CANORUS"
    set $S62, $P61
    getattribute $P63, $P60, $S62
    store_lex "$cuckoo", $P63
  if_55_end:
# .annotate "line", 45
    find_lex $P64, "$self"
    new $P65, "String"
    assign $P65, "&!CUCULUS_BEHAVIOR"
    set $S66, $P65
    getattribute $P67, $P64, $S66
    store_lex "&behavior", $P67
# .annotate "line", 46
    find_lex $P68, "&behavior"
    find_lex $P69, "$cuckoo"
    find_lex $P70, "$callsig"
    $P71 = $P68($P69, $P70)
# .annotate "line", 27
    .return ($P71)
.end


.namespace ["Cuculus";"Canorus";"Ovum";"_"]
.sub "pop_inits"  :subid("16_1268929865.09458") :method :outer("12_1268929865.09458")
# .annotate "line", 54
    new $P81, 'ExceptionHandler'
    set_addr $P81, control_80
    $P81."handle_types"(58)
    push_eh $P81
    .lex "self", self
# .annotate "line", 59
    get_global $P82, "@_Init_stack"
    unless_null $P82, vivify_22
    $P82 = root_new ['parrot';'ResizablePMCArray']
    set_global "@_Init_stack", $P82
  vivify_22:
# .annotate "line", 58
    get_global $P84, "@_Init_stack"
    if $P84, unless_83_end
    "die"("Trying to pop inits, but stack is empty")
  unless_83_end:
# .annotate "line", 61
    get_global $P85, "@_Init_stack"
    $P86 = $P85."pop"()
    find_lex $P87, "self"
    setattribute $P87, "&!CUCULUS_BEHAVIOR", $P86
# .annotate "line", 62
    get_global $P88, "@_Init_stack"
    $P89 = $P88."pop"()
    find_lex $P90, "self"
    setattribute $P90, "$!CUCULUS_CANORUS", $P89
    find_lex $P91, "self"
# .annotate "line", 54
    .return ($P91)
  control_80:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P92, exception, "payload"
    .return ($P92)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929911.27528")
# .annotate "line", 0
    get_hll_global $P14, ["Cuculus";"SigMatcher"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["Cuculus";"SigMatcher"], "_block13" 
    capture_lex $P14
    $P151 = $P14()
# .annotate "line", 1
    .return ($P151)
.end


.namespace ["Cuculus";"SigMatcher"]
.sub "_block13"  :subid("11_1268929911.27528") :outer("10_1268929911.27528")
# .annotate "line", 6
    .const 'Sub' $P61 = "14_1268929911.27528" 
    capture_lex $P61
    .const 'Sub' $P22 = "13_1268929911.27528" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1268929911.27528" 
    capture_lex $P15
# .annotate "line", 10
    .const 'Sub' $P15 = "12_1268929911.27528" 
    capture_lex $P15
    .lex "_initload", $P15
# .annotate "line", 6
    find_lex $P21, "_initload"
# .annotate "line", 28
    .const 'Sub' $P61 = "14_1268929911.27528" 
    capture_lex $P61
# .annotate "line", 6
    .return ($P61)
.end


.namespace ["Cuculus";"SigMatcher"]
.sub "" :load :init :subid("post16") :outer("11_1268929911.27528")
# .annotate "line", 6
    get_hll_global $P14, ["Cuculus";"SigMatcher"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 7
    get_hll_global $P150, ["Kakapo"], "depends_on"
    $P150("Matcher::CallSig")
.end


.namespace ["Cuculus";"SigMatcher"]
.sub "_initload"  :subid("12_1268929911.27528") :outer("11_1268929911.27528")
# .annotate "line", 10
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 11
    get_hll_global $P18, ["Matcher"], "CallSig"
    "extends"($P18)
# .annotate "line", 13
    "use"("Matcher::CallSig")
# .annotate "line", 14
    $P19 = "use"("Cuculus::Canorus")
# .annotate "line", 10
    .return ($P19)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P20, exception, "payload"
    .return ($P20)
.end


.namespace ["Cuculus";"SigMatcher"]
.sub "object_matches"  :subid("13_1268929911.27528") :method :outer("11_1268929911.27528")
    .param pmc param_25
# .annotate "line", 17
    new $P24, 'ExceptionHandler'
    set_addr $P24, control_23
    $P24."handle_types"(58)
    push_eh $P24
    .lex "self", self
    .lex "$actual", param_25
# .annotate "line", 18
    new $P26, "Undef"
    .lex "$exp", $P26
# .annotate "line", 19
    new $P27, "Undef"
    .lex "$act", $P27
# .annotate "line", 18
    find_lex $P28, "self"
    getattribute $P29, $P28, "$!expecting"
    unless_null $P29, vivify_17
    new $P29, "Undef"
  vivify_17:
    $P30 = $P29."object"()
    store_lex "$exp", $P30
# .annotate "line", 19
    find_lex $P31, "$actual"
    $P32 = $P31."object"()
    store_lex "$act", $P32
# .annotate "line", 21
    find_lex $P37, "$exp"
    find_lex $P38, "$act"
    issame $I39, $P37, $P38
    unless $I39, unless_36
    new $P35, 'Integer'
    set $P35, $I39
    goto unless_36_end
  unless_36:
# .annotate "line", 22
    find_lex $P40, "$exp"
    $P41 = "ANY"()
    issame $I42, $P40, $P41
    new $P35, 'Integer'
    set $P35, $I42
  unless_36_end:
    unless $P35, unless_34
    set $P33, $P35
    goto unless_34_end
  unless_34:
# .annotate "line", 23
    find_lex $P47, "$exp"
    get_hll_global $P48, ["Cuculus";"Canorus"], "Ovum"
    $P49 = "isa"($P47, $P48)
    if $P49, if_46
    set $P45, $P49
    goto if_46_end
  if_46:
    find_lex $P50, "$act"
    get_hll_global $P51, ["Cuculus";"Canorus"], "Ovum"
    $P52 = "isa"($P50, $P51)
    set $P45, $P52
  if_46_end:
    if $P45, if_44
    set $P43, $P45
    goto if_44_end
  if_44:
# .annotate "line", 24
    get_hll_global $P53, ["Opcode"], "getattribute"
    find_lex $P54, "$exp"
    $P55 = $P53($P54, "$!CUCULUS_CANORUS")
# .annotate "line", 25
    get_hll_global $P56, ["Opcode"], "getattribute"
    find_lex $P57, "$act"
    $P58 = $P56($P57, "$!CUCULUS_CANORUS")
    issame $I59, $P55, $P58
    new $P43, 'Integer'
    set $P43, $I59
  if_44_end:
# .annotate "line", 24
    set $P33, $P43
  unless_34_end:
# .annotate "line", 17
    .return ($P33)
  control_23:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P60, exception, "payload"
    .return ($P60)
.end


.namespace ["Cuculus";"SigMatcher"]
.sub "positionals_match"  :subid("14_1268929911.27528") :method :outer("11_1268929911.27528")
    .param pmc param_64
# .annotate "line", 28
    .const 'Sub' $P82 = "15_1268929911.27528" 
    capture_lex $P82
    new $P63, 'ExceptionHandler'
    set_addr $P63, control_62
    $P63."handle_types"(58)
    push_eh $P63
    .lex "self", self
    .lex "$actual", param_64
# .annotate "line", 29
    $P65 = root_new ['parrot';'ResizablePMCArray']
    .lex "@wanted", $P65
# .annotate "line", 30
    $P66 = root_new ['parrot';'ResizablePMCArray']
    .lex "@got", $P66
# .annotate "line", 32
    new $P67, "Undef"
    .lex "$count", $P67
# .annotate "line", 33
    new $P68, "Undef"
    .lex "$num_expecting", $P68
# .annotate "line", 29
    find_lex $P69, "self"
    getattribute $P70, $P69, "$!expecting"
    unless_null $P70, vivify_18
    new $P70, "Undef"
  vivify_18:
    $P71 = $P70."positional"()
    store_lex "@wanted", $P71
# .annotate "line", 30
    find_lex $P72, "$actual"
    $P73 = $P72."positional"()
    store_lex "@got", $P73
# .annotate "line", 32
    new $P74, "Integer"
    assign $P74, 0
    store_lex "$count", $P74
# .annotate "line", 33
    find_lex $P75, "@wanted"
    store_lex "$num_expecting", $P75
# .annotate "line", 35
    new $P147, 'ExceptionHandler'
    set_addr $P147, loop146_handler
    $P147."handle_types"(65, 67, 66)
    push_eh $P147
  loop146_test:
    find_lex $P76, "$count"
    set $N77, $P76
    find_lex $P78, "$num_expecting"
    set $N79, $P78
    islt $I80, $N77, $N79
    unless $I80, loop146_done
  loop146_redo:
    .const 'Sub' $P82 = "15_1268929911.27528" 
    capture_lex $P82
    $P82()
  loop146_next:
    goto loop146_test
  loop146_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P148, exception, 'type'
    eq $P148, 65, loop146_next
    eq $P148, 67, loop146_redo
  loop146_done:
    pop_eh 
# .annotate "line", 28
    .return (1)
  control_62:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P149, exception, "payload"
    .return ($P149)
.end


.namespace ["Cuculus";"SigMatcher"]
.sub "_block81"  :anon :subid("15_1268929911.27528") :outer("14_1268929911.27528")
# .annotate "line", 36
    new $P83, "Undef"
    .lex "$want", $P83
# .annotate "line", 40
    new $P84, "Undef"
    .lex "$got", $P84
# .annotate "line", 36
    find_lex $P85, "$count"
    set $I86, $P85
    find_lex $P87, "@wanted"
    unless_null $P87, vivify_19
    $P87 = root_new ['parrot';'ResizablePMCArray']
  vivify_19:
    set $P88, $P87[$I86]
    unless_null $P88, vivify_20
    new $P88, "Undef"
  vivify_20:
    store_lex "$want", $P88
# .annotate "line", 37
    find_lex $P90, "$want"
    $P91 = "ETC"()
    issame $I92, $P90, $P91
    unless $I92, if_89_end
    new $P93, "Exception"
    set $P93['type'], 58
    new $P94, "Integer"
    assign $P94, 1
    setattribute $P93, 'payload', $P94
    throw $P93
  if_89_end:
# .annotate "line", 38
    find_lex $P96, "$count"
    set $N97, $P96
    find_lex $P98, "@got"
    set $N99, $P98
    iseq $I100, $N97, $N99
    unless $I100, if_95_end
    new $P101, "Exception"
    set $P101['type'], 58
    new $P102, "Integer"
    assign $P102, 0
    setattribute $P101, 'payload', $P102
    throw $P101
  if_95_end:
# .annotate "line", 40
    find_lex $P103, "$count"
    set $I104, $P103
    find_lex $P105, "@got"
    unless_null $P105, vivify_21
    $P105 = root_new ['parrot';'ResizablePMCArray']
  vivify_21:
    set $P106, $P105[$I104]
    unless_null $P106, vivify_22
    new $P106, "Undef"
  vivify_22:
    store_lex "$got", $P106
# .annotate "line", 42
    find_lex $P114, "$count"
    set $N115, $P114
    iseq $I116, $N115, 0.0
    if $I116, if_113
    new $P112, 'Integer'
    set $P112, $I116
    goto if_113_end
  if_113:
# .annotate "line", 43
    find_lex $P117, "$want"
    get_hll_global $P118, ["Cuculus";"Canorus"], "Ovum"
    $P119 = "isa"($P117, $P118)
    set $P112, $P119
  if_113_end:
    if $P112, if_111
    set $P110, $P112
    goto if_111_end
  if_111:
    find_lex $P120, "$got"
    get_hll_global $P121, ["Cuculus";"Canorus"], "Ovum"
    $P122 = "isa"($P120, $P121)
    set $P110, $P122
  if_111_end:
    if $P110, if_109
    set $P108, $P110
    goto if_109_end
  if_109:
# .annotate "line", 44
    find_lex $P123, "$want"
    $P124 = "get_cuckoo"($P123)
    find_lex $P125, "$got"
    $P126 = "get_cuckoo"($P125)
    issame $I127, $P124, $P126
    new $P108, 'Integer'
    set $P108, $I127
  if_109_end:
    if $P108, if_107
# .annotate "line", 47
    find_lex $P133, "$want"
    $P134 = "ANY"()
    issame $I135, $P133, $P134
    unless $I135, unless_132
    new $P131, 'Integer'
    set $P131, $I135
    goto unless_132_end
  unless_132:
# .annotate "line", 48
    find_lex $P136, "$want"
    find_lex $P137, "$got"
    issame $I138, $P136, $P137
    new $P131, 'Integer'
    set $P131, $I138
  unless_132_end:
    unless $P131, unless_130
    set $P129, $P131
    goto unless_130_end
  unless_130:
# .annotate "line", 49
    find_lex $P139, "$want"
    find_lex $P140, "$got"
    iseq $I141, $P139, $P140
    new $P129, 'Integer'
    set $P129, $I141
  unless_130_end:
    if $P129, if_128
# .annotate "line", 53
    new $P142, "Exception"
    set $P142['type'], 58
    new $P143, "Integer"
    assign $P143, 0
    setattribute $P142, 'payload', $P143
    throw $P142
# .annotate "line", 52
    goto if_128_end
  if_128:
  if_128_end:
# .annotate "line", 47
    goto if_107_end
  if_107:
  if_107_end:
# .annotate "line", 42
    find_lex $P144, "$count"
    clone $P145, $P144
    inc $P144
# .annotate "line", 35
    .return ($P145)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929929.37555")
# .annotate "line", 0
    get_hll_global $P14, ["Cuculus";"Verifier"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["Cuculus";"Verifier"], "_block13" 
    capture_lex $P14
    $P165 = $P14()
# .annotate "line", 1
    .return ($P165)
.end


.namespace []
.sub "" :load :init :subid("post18") :outer("10_1268929929.37555")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268929929.37555" 
    .local pmc block
    set block, $P12
    $P166 = get_root_global ["parrot"], "P6metaclass"
    new $P167, "ResizablePMCArray"
    push $P167, "$!sig_matcher"
    push $P167, "$!match_count"
    push $P167, "%!conditions"
    $P166."new_class"("Cuculus::Verifier", $P167 :named("attr"))
.end


.namespace ["Cuculus";"Verifier"]
.sub "_block13"  :subid("11_1268929929.37555") :outer("10_1268929929.37555")
# .annotate "line", 6
    .const 'Sub' $P81 = "17_1268929929.37555" 
    capture_lex $P81
    .const 'Sub' $P67 = "16_1268929929.37555" 
    capture_lex $P67
    .const 'Sub' $P36 = "14_1268929929.37555" 
    capture_lex $P36
    .const 'Sub' $P22 = "13_1268929929.37555" 
    capture_lex $P22
    .const 'Sub' $P15 = "12_1268929929.37555" 
    capture_lex $P15
# .annotate "line", 14
    .const 'Sub' $P15 = "12_1268929929.37555" 
    capture_lex $P15
    .lex "_initload", $P15
# .annotate "line", 10
    find_lex $P21, "_initload"
# .annotate "line", 33
    .const 'Sub' $P81 = "17_1268929929.37555" 
    capture_lex $P81
# .annotate "line", 6
    .return ($P81)
.end


.namespace ["Cuculus";"Verifier"]
.sub "" :load :init :subid("post19") :outer("11_1268929929.37555")
# .annotate "line", 6
    get_hll_global $P14, ["Cuculus";"Verifier"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 11
    get_hll_global $P164, ["Kakapo"], "depends_on"
    $P164("UnitTest::Assertions")
.end


.namespace ["Cuculus";"Verifier"]
.sub "_initload"  :subid("12_1268929929.37555") :outer("11_1268929929.37555")
# .annotate "line", 14
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 15
    get_hll_global $P18, ["UnitTest"], "Assertions"
    $P19 = "use"($P18)
# .annotate "line", 14
    .return ($P19)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P20, exception, "payload"
    .return ($P20)
.end


.namespace ["Cuculus";"Verifier"]
.sub "conditions"  :subid("13_1268929929.37555") :method :outer("11_1268929929.37555")
    .param pmc param_25 :optional
    .param int has_param_25 :opt_flag
# .annotate "line", 18
    new $P24, 'ExceptionHandler'
    set_addr $P24, control_23
    $P24."handle_types"(58)
    push_eh $P24
    .lex "self", self
    if has_param_25, optparam_20
    new $P26, "Undef"
    set param_25, $P26
  optparam_20:
    .lex "$value", param_25
    find_lex $P29, "$value"
    $P30 = $P29."defined"()
    if $P30, if_28
    find_lex $P32, "self"
    getattribute $P33, $P32, "%!conditions"
    unless_null $P33, vivify_21
    $P33 = root_new ['parrot';'Hash']
  vivify_21:
    set $P27, $P33
    goto if_28_end
  if_28:
    find_lex $P31, "$value"
    set $P27, $P31
  if_28_end:
    find_lex $P34, "self"
    setattribute $P34, "%!conditions", $P27
    .return ($P27)
  control_23:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P35, exception, "payload"
    .return ($P35)
.end


.namespace ["Cuculus";"Verifier"]
.sub "verify"  :subid("14_1268929929.37555") :method :outer("11_1268929929.37555")
    .param pmc param_39
# .annotate "line", 20
    .const 'Sub' $P52 = "15_1268929929.37555" 
    capture_lex $P52
    new $P38, 'ExceptionHandler'
    set_addr $P38, control_37
    $P38."handle_types"(58)
    push_eh $P38
    .lex "self", self
    .lex "$cuckoo", param_39
# .annotate "line", 21
    new $P40, "Undef"
    .lex "$matcher", $P40
# .annotate "line", 22
    new $P41, "Undef"
    .lex "$count", $P41
# .annotate "line", 21
    find_lex $P42, "self"
    getattribute $P43, $P42, "$!sig_matcher"
    unless_null $P43, vivify_22
    new $P43, "Undef"
  vivify_22:
    store_lex "$matcher", $P43
# .annotate "line", 22
    new $P44, "Integer"
    assign $P44, 0
    find_lex $P45, "self"
    setattribute $P45, "$!match_count", $P44
    store_lex "$count", $P44
# .annotate "line", 24
    find_lex $P47, "$cuckoo"
    $P48 = $P47."call_log"()
    defined $I49, $P48
    unless $I49, for_undef_23
    iter $P46, $P48
    new $P62, 'ExceptionHandler'
    set_addr $P62, loop61_handler
    $P62."handle_types"(65, 67, 66)
    push_eh $P62
  loop61_test:
    unless $P46, loop61_done
    shift $P50, $P46
  loop61_redo:
    .const 'Sub' $P52 = "15_1268929929.37555" 
    capture_lex $P52
    $P52($P50)
  loop61_next:
    goto loop61_test
  loop61_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P63, exception, 'type'
    eq $P63, 65, loop61_next
    eq $P63, 67, loop61_redo
  loop61_done:
    pop_eh 
  for_undef_23:
# .annotate "line", 28
    find_lex $P64, "self"
    $P65 = $P64."was_called"()
# .annotate "line", 20
    .return ($P65)
  control_37:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P66, exception, "payload"
    .return ($P66)
.end


.namespace ["Cuculus";"Verifier"]
.sub "_block51"  :anon :subid("15_1268929929.37555") :outer("14_1268929929.37555")
    .param pmc param_53
# .annotate "line", 24
    .lex "$callsig", param_53
# .annotate "line", 25
    find_lex $P56, "$matcher"
    find_lex $P57, "$callsig"
    $P58 = $P56."matches"($P57)
    if $P58, if_55
    set $P54, $P58
    goto if_55_end
  if_55:
    find_lex $P59, "$count"
    clone $P60, $P59
    inc $P59
    set $P54, $P60
  if_55_end:
# .annotate "line", 24
    .return ($P54)
.end


.namespace ["Cuculus";"Verifier"]
.sub "sig_matcher"  :subid("16_1268929929.37555") :method :outer("11_1268929929.37555")
    .param pmc param_70 :optional
    .param int has_param_70 :opt_flag
# .annotate "line", 31
    new $P69, 'ExceptionHandler'
    set_addr $P69, control_68
    $P69."handle_types"(58)
    push_eh $P69
    .lex "self", self
    if has_param_70, optparam_24
    new $P71, "Undef"
    set param_70, $P71
  optparam_24:
    .lex "$value", param_70
    find_lex $P74, "$value"
    $P75 = $P74."defined"()
    if $P75, if_73
    find_lex $P78, "self"
    getattribute $P79, $P78, "$!sig_matcher"
    unless_null $P79, vivify_25
    new $P79, "Undef"
  vivify_25:
    set $P72, $P79
    goto if_73_end
  if_73:
    find_lex $P76, "$value"
    find_lex $P77, "self"
    setattribute $P77, "$!sig_matcher", $P76
    set $P72, $P76
  if_73_end:
    .return ($P72)
  control_68:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P80, exception, "payload"
    .return ($P80)
.end


.namespace ["Cuculus";"Verifier"]
.sub "was_called"  :subid("17_1268929929.37555") :method :outer("11_1268929929.37555")
    .param pmc param_84 :slurpy :named
# .annotate "line", 33
    new $P83, 'ExceptionHandler'
    set_addr $P83, control_82
    $P83."handle_types"(58)
    push_eh $P83
    .lex "self", self
    .lex "%named", param_84
# .annotate "line", 34
    $P85 = root_new ['parrot';'Hash']
    .lex "%match", $P85
# .annotate "line", 42
    new $P86, "Undef"
    .lex "$count", $P86
# .annotate "line", 34
    get_hll_global $P87, ["Hash"], "merge"
    find_lex $P88, "self"
    getattribute $P89, $P88, "%!conditions"
    unless_null $P89, vivify_26
    $P89 = root_new ['parrot';'Hash']
  vivify_26:
    find_lex $P90, "%named"
    $P91 = $P87($P89, $P90)
    store_lex "%match", $P91
# .annotate "line", 36
    find_lex $P93, "%match"
    $P94 = $P93."contains"("times")
    if $P94, unless_92_end
# .annotate "line", 37
    find_lex $P96, "%match"
    unless_null $P96, vivify_27
    $P96 = root_new ['parrot';'Hash']
  vivify_27:
    set $P97, $P96["once"]
    unless_null $P97, vivify_28
    new $P97, "Undef"
  vivify_28:
    unless $P97, if_95_end
    new $P98, "Integer"
    assign $P98, 1
    find_lex $P99, "%match"
    unless_null $P99, vivify_29
    $P99 = root_new ['parrot';'Hash']
    store_lex "%match", $P99
  vivify_29:
    set $P99["times"], $P98
  if_95_end:
# .annotate "line", 38
    find_lex $P101, "%match"
    unless_null $P101, vivify_30
    $P101 = root_new ['parrot';'Hash']
  vivify_30:
    set $P102, $P101["twice"]
    unless_null $P102, vivify_31
    new $P102, "Undef"
  vivify_31:
    unless $P102, if_100_end
    new $P103, "Integer"
    assign $P103, 2
    find_lex $P104, "%match"
    unless_null $P104, vivify_32
    $P104 = root_new ['parrot';'Hash']
    store_lex "%match", $P104
  vivify_32:
    set $P104["times"], $P103
  if_100_end:
# .annotate "line", 39
    find_lex $P106, "%match"
    unless_null $P106, vivify_33
    $P106 = root_new ['parrot';'Hash']
  vivify_33:
    set $P107, $P106["thrice"]
    unless_null $P107, vivify_34
    new $P107, "Undef"
  vivify_34:
    unless $P107, if_105_end
    new $P108, "Integer"
    assign $P108, 3
    find_lex $P109, "%match"
    unless_null $P109, vivify_35
    $P109 = root_new ['parrot';'Hash']
    store_lex "%match", $P109
  vivify_35:
    set $P109["times"], $P108
  if_105_end:
  unless_92_end:
# .annotate "line", 42
    find_lex $P110, "self"
    getattribute $P111, $P110, "$!match_count"
    unless_null $P111, vivify_36
    new $P111, "Undef"
  vivify_36:
    store_lex "$count", $P111
# .annotate "line", 44
    find_lex $P113, "%match"
    unless_null $P113, vivify_37
    $P113 = root_new ['parrot';'Hash']
  vivify_37:
    set $P114, $P113["never"]
    unless_null $P114, vivify_38
    new $P114, "Undef"
  vivify_38:
    if $P114, if_112
# .annotate "line", 48
    find_lex $P119, "%match"
    $P120 = $P119."contains"("times")
    if $P120, if_118
# .annotate "line", 53
    find_lex $P135, "%match"
    $P136 = $P135."contains"("at_least")
    unless $P136, if_134_end
# .annotate "line", 54
    find_lex $P137, "$count"
    set $N138, $P137
    find_lex $P139, "%match"
    unless_null $P139, vivify_39
    $P139 = root_new ['parrot';'Hash']
  vivify_39:
    set $P140, $P139["at_least"]
    unless_null $P140, vivify_40
    new $P140, "Undef"
  vivify_40:
    set $N141, $P140
    islt $I142, $N138, $N141
# .annotate "line", 55
    new $P143, "String"
    assign $P143, "Too few calls ($count) made to callsig. Expected at least "
    find_lex $P144, "%match"
    unless_null $P144, vivify_41
    $P144 = root_new ['parrot';'Hash']
  vivify_41:
    set $P145, $P144["at_least"]
    unless_null $P145, vivify_42
    new $P145, "Undef"
  vivify_42:
    concat $P146, $P143, $P145
    concat $P147, $P146, "."
    "assert_false"($I142, $P147)
  if_134_end:
# .annotate "line", 58
    find_lex $P149, "%match"
    $P150 = $P149."contains"("at_most")
    unless $P150, if_148_end
# .annotate "line", 59
    find_lex $P151, "$count"
    set $N152, $P151
    find_lex $P153, "%match"
    unless_null $P153, vivify_43
    $P153 = root_new ['parrot';'Hash']
  vivify_43:
    set $P154, $P153["at_most"]
    unless_null $P154, vivify_44
    new $P154, "Undef"
  vivify_44:
    set $N155, $P154
    isgt $I156, $N152, $N155
# .annotate "line", 60
    new $P157, "String"
    assign $P157, "Too many calls ($count) made to callsig. Expected at most "
    find_lex $P158, "%match"
    unless_null $P158, vivify_45
    $P158 = root_new ['parrot';'Hash']
  vivify_45:
    set $P159, $P158["at_most"]
    unless_null $P159, vivify_46
    new $P159, "Undef"
  vivify_46:
    concat $P160, $P157, $P159
    concat $P161, $P160, "."
    "assert_false"($I156, $P161)
  if_148_end:
# .annotate "line", 52
    goto if_118_end
  if_118:
# .annotate "line", 49
    find_lex $P121, "$count"
    set $N122, $P121
    find_lex $P123, "%match"
    unless_null $P123, vivify_47
    $P123 = root_new ['parrot';'Hash']
  vivify_47:
    set $P124, $P123["times"]
    unless_null $P124, vivify_48
    new $P124, "Undef"
  vivify_48:
    set $N125, $P124
    iseq $I126, $N122, $N125
# .annotate "line", 50
    new $P127, 'String'
    set $P127, "Wrong number of calls ("
    find_lex $P128, "$count"
    concat $P129, $P127, $P128
    concat $P130, $P129, ") to callsig. Want exactly "
    find_lex $P131, "%match"
    unless_null $P131, vivify_49
    $P131 = root_new ['parrot';'Hash']
  vivify_49:
    set $P132, $P131["times"]
    unless_null $P132, vivify_50
    new $P132, "Undef"
  vivify_50:
    concat $P133, $P130, $P132
    "assert_true"($I126, $P133)
  if_118_end:
# .annotate "line", 48
    goto if_112_end
  if_112:
# .annotate "line", 45
    find_lex $P115, "$count"
    set $N116, $P115
    iseq $I117, $N116, 0.0
    "assert_true"($I117, "At least one call made to :never callsig.")
  if_112_end:
# .annotate "line", 44
    find_lex $P162, "self"
# .annotate "line", 33
    .return ($P162)
  control_82:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P163, exception, "payload"
    .return ($P163)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929822.90395")
# .annotate "line", 0
    get_hll_global $P14, ["Exception";"DependencyQueue";"AlreadyDone"], "_block13" 
    capture_lex $P14
# .annotate "line", 8
    get_hll_global $P14, ["Exception";"DependencyQueue";"AlreadyDone"], "_block13" 
    capture_lex $P14
    $P257 = $P14()
# .annotate "line", 1
    .return ($P257)
.end


.namespace []
.sub "" :load :init :subid("post27") :outer("10_1268929822.90395")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268929822.90395" 
    .local pmc block
    set block, $P12
    $P258 = get_root_global ["parrot"], "P6metaclass"
    $P258."new_class"("Exception::DependencyQueue::AlreadyDone", "Exception::Wrapper" :named("parent"))
.end


.namespace ["Exception";"DependencyQueue";"AlreadyDone"]
.sub "_block13"  :subid("11_1268929822.90395") :outer("10_1268929822.90395")
# .annotate "line", 8
    get_hll_global $P16, ["DependencyQueue"], "_block15" 
    capture_lex $P16
# .annotate "line", 10
    get_hll_global $P16, ["DependencyQueue"], "_block15" 
    capture_lex $P16
    $P256 = $P16()
# .annotate "line", 8
    .return ($P256)
.end


.namespace ["DependencyQueue"]
.sub "_block15"  :subid("12_1268929822.90395") :outer("11_1268929822.90395")
# .annotate "line", 10
    .const 'Sub' $P173 = "23_1268929822.90395" 
    capture_lex $P173
    .const 'Sub' $P154 = "22_1268929822.90395" 
    capture_lex $P154
    .const 'Sub' $P145 = "21_1268929822.90395" 
    capture_lex $P145
    .const 'Sub' $P118 = "19_1268929822.90395" 
    capture_lex $P118
    .const 'Sub' $P109 = "18_1268929822.90395" 
    capture_lex $P109
    .const 'Sub' $P92 = "17_1268929822.90395" 
    capture_lex $P92
    .const 'Sub' $P74 = "16_1268929822.90395" 
    capture_lex $P74
    .const 'Sub' $P58 = "15_1268929822.90395" 
    capture_lex $P58
    .const 'Sub' $P23 = "14_1268929822.90395" 
    capture_lex $P23
    .const 'Sub' $P17 = "13_1268929822.90395" 
    capture_lex $P17
# .annotate "line", 18
    .const 'Sub' $P17 = "13_1268929822.90395" 
    capture_lex $P17
    .lex "_pre_initload", $P17
# .annotate "line", 10
    find_lex $P22, "_pre_initload"
# .annotate "line", 95
    .const 'Sub' $P173 = "23_1268929822.90395" 
    capture_lex $P173
# .annotate "line", 10
    .return ($P173)
.end


.namespace ["DependencyQueue"]
.sub "_pre_initload"  :subid("13_1268929822.90395") :outer("12_1268929822.90395")
# .annotate "line", 18
    new $P19, 'ExceptionHandler'
    set_addr $P19, control_18
    $P19."handle_types"(58)
    push_eh $P19
# .annotate "line", 20
    $P20 = "has"("%!added", "%!already_done", "%!cycle", "@!cycle_keys", "$!locked", "%!pending", "@!queue")
# .annotate "line", 18
    .return ($P20)
  control_18:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P21, exception, "payload"
    .return ($P21)
.end


.namespace ["DependencyQueue"]
.sub "add_entry"  :subid("14_1268929822.90395") :method :outer("12_1268929822.90395")
    .param pmc param_26
    .param pmc param_27
    .param pmc param_28 :optional :named("requires")
    .param int has_param_28 :opt_flag
# .annotate "line", 30
    new $P25, 'ExceptionHandler'
    set_addr $P25, control_24
    $P25."handle_types"(58)
    push_eh $P25
    .lex "self", self
    .lex "$name", param_26
    .lex "$value", param_27
    if has_param_28, optparam_28
    $P29 = root_new ['parrot';'ResizablePMCArray']
    set param_28, $P29
  optparam_28:
    .lex "@requires", param_28
# .annotate "line", 38
    $P30 = root_new ['parrot';'ResizablePMCArray']
    .lex "@entry", $P30
# .annotate "line", 31
    find_lex $P32, "self"
    $P33 = $P32."already_done"()
    find_lex $P34, "$name"
    $P35 = $P33."contains"($P34)
    unless $P35, if_31_end
# .annotate "line", 32
    get_hll_global $P36, ["Exception";"DependencyQueue"], "AlreadyDone"
    new $P37, 'String'
    set $P37, "Added already-done "
    find_lex $P38, "$name"
    concat $P39, $P37, $P38
    concat $P40, $P39, " to DependencyQueue"
    $P41 = $P36."new"($P40 :named("message"))
    $P41."throw"()
  if_31_end:
# .annotate "line", 37
    find_lex $P43, "@requires"
    $P44 = $P43."isa"("String")
    unless $P44, if_42_end
    get_hll_global $P45, ["Array"], "new"
    find_lex $P46, "@requires"
    $P47 = $P45($P46)
    store_lex "@requires", $P47
  if_42_end:
# .annotate "line", 38
    get_hll_global $P48, ["Array"], "new"
    find_lex $P49, "$name"
    find_lex $P50, "$value"
    find_lex $P51, "@requires"
    $P52 = $P48($P49, $P50, $P51)
    store_lex "@entry", $P52
# .annotate "line", 39
    find_lex $P53, "@entry"
    find_lex $P54, "$name"
    find_lex $P55, "self"
    $P56 = $P55."pending"()
    set $P56[$P54], $P53
# .annotate "line", 30
    .return ($P53)
  control_24:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P57, exception, "payload"
    .return ($P57)
.end


.namespace ["DependencyQueue"]
.sub "already_added"  :subid("15_1268929822.90395") :method :outer("12_1268929822.90395")
    .param pmc param_61
# .annotate "line", 42
    new $P60, 'ExceptionHandler'
    set_addr $P60, control_59
    $P60."handle_types"(58)
    push_eh $P60
    .lex "self", self
    .lex "$name", param_61
# .annotate "line", 43
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
# .annotate "line", 44
    find_lex $P69, "self"
    $P70 = $P69."added"()
    find_lex $P71, "$name"
    $P72 = $P70."contains"($P71)
    set $P63, $P72
  unless_64_end:
    setattribute $P62, 'payload', $P63
    throw $P62
# .annotate "line", 42
    .return ()
  control_59:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P73, exception, "payload"
    .return ($P73)
.end


.namespace ["DependencyQueue"]
.sub "_init_obj"  :subid("16_1268929822.90395") :method :outer("12_1268929822.90395")
    .param pmc param_77 :slurpy
    .param pmc param_78 :slurpy :named
# .annotate "line", 47
    new $P76, 'ExceptionHandler'
    set_addr $P76, control_75
    $P76."handle_types"(58)
    push_eh $P76
    .lex "self", self
    .lex "@pos", param_77
    .lex "%named", param_78
# .annotate "line", 48
    find_lex $P79, "self"
    $P79."locked"(0)
# .annotate "line", 50
    new $P85, 'ExceptionHandler'
    set_addr $P85, loop84_handler
    $P85."handle_types"(65, 67, 66)
    push_eh $P85
  loop84_test:
    find_lex $P80, "@pos"
    unless $P80, loop84_done
  loop84_redo:
# .annotate "line", 51
    find_lex $P81, "self"
    find_lex $P82, "@pos"
    $P83 = $P82."shift"()
    $P81."mark_as_done"($P83)
  loop84_next:
# .annotate "line", 50
    goto loop84_test
  loop84_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P86, exception, 'type'
    eq $P86, 65, loop84_next
    eq $P86, 67, loop84_redo
  loop84_done:
    pop_eh 
# .annotate "line", 54
    find_lex $P87, "self"
    find_lex $P88, "@pos"
    find_lex $P89, "%named"
    $P90 = $P87."_init_args"($P88 :flat, $P89 :flat)
# .annotate "line", 47
    .return ($P90)
  control_75:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P91, exception, "payload"
    .return ($P91)
.end


.namespace ["DependencyQueue"]
.sub "is_empty"  :subid("17_1268929822.90395") :method :outer("12_1268929822.90395")
# .annotate "line", 57
    new $P94, 'ExceptionHandler'
    set_addr $P94, control_93
    $P94."handle_types"(58)
    push_eh $P94
    .lex "self", self
# .annotate "line", 58
    new $P95, "Exception"
    set $P95['type'], 58
    find_lex $P98, "self"
    $P99 = $P98."locked"()
    if $P99, if_97
# .annotate "line", 60
    find_lex $P104, "self"
    $P105 = $P104."pending"()
    $N106 = $P105."elems"()
    iseq $I107, $N106, 0.0
    new $P96, 'Integer'
    set $P96, $I107
# .annotate "line", 58
    goto if_97_end
  if_97:
# .annotate "line", 59
    find_lex $P100, "self"
    $P101 = $P100."queue"()
    $N102 = $P101."elems"()
    iseq $I103, $N102, 0.0
    new $P96, 'Integer'
    set $P96, $I103
  if_97_end:
    setattribute $P95, 'payload', $P96
    throw $P95
# .annotate "line", 57
    .return ()
  control_93:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["DependencyQueue"]
.sub "mark_as_done"  :subid("18_1268929822.90395") :method :outer("12_1268929822.90395")
    .param pmc param_112
# .annotate "line", 63
    new $P111, 'ExceptionHandler'
    set_addr $P111, control_110
    $P111."handle_types"(58)
    push_eh $P111
    .lex "self", self
    .lex "$label", param_112
# .annotate "line", 64
    new $P113, "Integer"
    assign $P113, 1
    find_lex $P114, "$label"
    find_lex $P115, "self"
    $P116 = $P115."already_done"()
    set $P116[$P114], $P113
# .annotate "line", 63
    .return ($P113)
  control_110:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, "payload"
    .return ($P117)
.end


.namespace ["DependencyQueue"]
.sub "next_entry"  :subid("19_1268929822.90395") :method :outer("12_1268929822.90395")
# .annotate "line", 67
    .const 'Sub' $P131 = "20_1268929822.90395" 
    capture_lex $P131
    new $P120, 'ExceptionHandler'
    set_addr $P120, control_119
    $P120."handle_types"(58)
    push_eh $P120
    .lex "self", self
# .annotate "line", 68
    find_lex $P122, "self"
    $P123 = $P122."locked"()
    if $P123, unless_121_end
# .annotate "line", 69
    find_lex $P124, "self"
    $P124."tsort_queue"()
  unless_121_end:
# .annotate "line", 72
    find_lex $P127, "self"
    $P128 = $P127."queue"()
    $P129 = $P128."elems"()
    if $P129, if_126
# .annotate "line", 78
    get_hll_global $P142, "Undef"
    $P143 = $P142."new"()
# .annotate "line", 77
    set $P125, $P143
# .annotate "line", 72
    goto if_126_end
  if_126:
    .const 'Sub' $P131 = "20_1268929822.90395" 
    capture_lex $P131
    $P141 = $P131()
    set $P125, $P141
  if_126_end:
# .annotate "line", 67
    .return ($P125)
  control_119:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P144, exception, "payload"
    .return ($P144)
.end


.namespace ["DependencyQueue"]
.sub "_block130"  :anon :subid("20_1268929822.90395") :outer("19_1268929822.90395")
# .annotate "line", 73
    new $P132, "Undef"
    .lex "$node", $P132
    find_lex $P133, "self"
    $P134 = $P133."queue"()
    $P135 = $P134."shift"()
    store_lex "$node", $P135
# .annotate "line", 74
    find_lex $P136, "self"
    find_lex $P137, "$node"
    unless_null $P137, vivify_29
    $P137 = root_new ['parrot';'ResizablePMCArray']
  vivify_29:
    set $P138, $P137[0]
    unless_null $P138, vivify_30
    new $P138, "Undef"
  vivify_30:
    $P136."mark_as_done"($P138)
    find_lex $P139, "$node"
    unless_null $P139, vivify_31
    $P139 = root_new ['parrot';'ResizablePMCArray']
  vivify_31:
    set $P140, $P139[1]
    unless_null $P140, vivify_32
    new $P140, "Undef"
  vivify_32:
# .annotate "line", 72
    .return ($P140)
.end


.namespace ["DependencyQueue"]
.sub "reset"  :subid("21_1268929822.90395") :method :outer("12_1268929822.90395")
# .annotate "line", 82
    new $P147, 'ExceptionHandler'
    set_addr $P147, control_146
    $P147."handle_types"(58)
    push_eh $P147
    .lex "self", self
# .annotate "line", 83
    find_lex $P148, "self"
    $P148."locked"(0)
# .annotate "line", 84
    find_lex $P149, "self"
    get_hll_global $P150, "Hash"
    $P151 = $P150."new"()
    $P152 = $P149."pending"($P151)
# .annotate "line", 82
    .return ($P152)
  control_146:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P153, exception, "payload"
    .return ($P153)
.end


.namespace ["DependencyQueue"]
.sub "tsort_queue"  :subid("22_1268929822.90395") :method :outer("12_1268929822.90395")
# .annotate "line", 87
    new $P156, 'ExceptionHandler'
    set_addr $P156, control_155
    $P156."handle_types"(58)
    push_eh $P156
    .lex "self", self
# .annotate "line", 88
    find_lex $P157, "self"
    $P157."locked"(1)
# .annotate "line", 89
    find_lex $P158, "self"
    get_hll_global $P159, ["Array"], "new"
    $P160 = $P159()
    $P158."cycle_keys"($P160)
# .annotate "line", 90
    find_lex $P161, "self"
    get_hll_global $P162, "Hash"
    $P163 = $P162."new"()
    $P161."cycle"($P163)
# .annotate "line", 91
    find_lex $P164, "self"
    get_hll_global $P165, "Hash"
    $P166 = $P165."new"()
    $P164."added"($P166)
# .annotate "line", 92
    find_lex $P167, "self"
    find_lex $P168, "self"
    $P169 = $P168."pending"()
    $P170 = $P169."keys"()
    $P171 = $P167."tsort_add_pending_entries"($P170)
# .annotate "line", 87
    .return ($P171)
  control_155:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P172, exception, "payload"
    .return ($P172)
.end


.namespace ["DependencyQueue"]
.sub "tsort_add_pending_entries"  :subid("23_1268929822.90395") :method :outer("12_1268929822.90395")
    .param pmc param_176
# .annotate "line", 95
    .const 'Sub' $P182 = "24_1268929822.90395" 
    capture_lex $P182
    new $P175, 'ExceptionHandler'
    set_addr $P175, control_174
    $P175."handle_types"(58)
    push_eh $P175
    .lex "self", self
    .lex "@list", param_176
# .annotate "line", 98
    find_lex $P178, "@list"
    defined $I179, $P178
    unless $I179, for_undef_33
    iter $P177, $P178
    new $P253, 'ExceptionHandler'
    set_addr $P253, loop252_handler
    $P253."handle_types"(65, 67, 66)
    push_eh $P253
  loop252_test:
    unless $P177, loop252_done
    shift $P180, $P177
  loop252_redo:
    .const 'Sub' $P182 = "24_1268929822.90395" 
    capture_lex $P182
    $P182($P180)
  loop252_next:
    goto loop252_test
  loop252_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P254, exception, 'type'
    eq $P254, 65, loop252_next
    eq $P254, 67, loop252_redo
  loop252_done:
    pop_eh 
  for_undef_33:
# .annotate "line", 95
    .return ($P177)
  control_174:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P255, exception, "payload"
    .return ($P255)
.end


.namespace ["DependencyQueue"]
.sub "_block181"  :anon :subid("24_1268929822.90395") :outer("23_1268929822.90395")
    .param pmc param_185
# .annotate "line", 98
    .const 'Sub' $P226 = "26_1268929822.90395" 
    capture_lex $P226
    .const 'Sub' $P203 = "25_1268929822.90395" 
    capture_lex $P203
# .annotate "line", 99
    new $P183, "Undef"
    .lex "$key", $P183
# .annotate "line", 107
    new $P184, "Undef"
    .lex "$next_index", $P184
    .lex "$_", param_185
# .annotate "line", 99
    find_lex $P186, "$_"
    store_lex "$key", $P186
# .annotate "line", 101
    find_lex $P188, "self"
    find_lex $P189, "$key"
    $P190 = $P188."already_added"($P189)
    unless $P190, if_187_end
# .annotate "line", 102
    "next"()
  if_187_end:
# .annotate "line", 107
    find_lex $P191, "self"
    $P192 = $P191."cycle_keys"()
    $P193 = $P192."elems"()
    store_lex "$next_index", $P193
# .annotate "line", 108
    find_lex $P194, "self"
    $P195 = $P194."cycle_keys"()
    find_lex $P196, "$key"
    $P195."push"($P196)
# .annotate "line", 110
    find_lex $P198, "self"
    $P199 = $P198."cycle"()
    find_lex $P200, "$key"
    $P201 = $P199."contains"($P200)
    unless $P201, if_197_end
    .const 'Sub' $P203 = "25_1268929822.90395" 
    capture_lex $P203
    $P203()
  if_197_end:
# .annotate "line", 116
    find_lex $P215, "$next_index"
    find_lex $P216, "$key"
    find_lex $P217, "self"
    $P218 = $P217."cycle"()
    set $P218[$P216], $P215
# .annotate "line", 120
    find_lex $P221, "self"
    $P222 = $P221."pending"()
    find_lex $P223, "$key"
    $P224 = $P222."contains"($P223)
    if $P224, if_220
# .annotate "line", 133
    find_lex $P249, "$key"
    concat $P250, $P249, " is a requirement, but is not marked done, and not in the pending queue."
    $P251 = "die"($P250)
# .annotate "line", 132
    set $P219, $P251
# .annotate "line", 120
    goto if_220_end
  if_220:
    .const 'Sub' $P226 = "26_1268929822.90395" 
    capture_lex $P226
    $P248 = $P226()
    set $P219, $P248
  if_220_end:
# .annotate "line", 98
    .return ($P219)
.end


.namespace ["DependencyQueue"]
.sub "_block202"  :anon :subid("25_1268929822.90395") :outer("24_1268929822.90395")
# .annotate "line", 111
    $P204 = root_new ['parrot';'ResizablePMCArray']
    .lex "@slice", $P204
    find_lex $P205, "self"
    $P206 = $P205."cycle_keys"()
    find_lex $P207, "$key"
    find_lex $P208, "self"
    $P209 = $P208."cycle"()
    set $P210, $P209[$P207]
    unless_null $P210, vivify_34
    new $P210, "Undef"
  vivify_34:
    $P211 = $P206."slice"($P210 :named("from"))
    store_lex "@slice", $P211
# .annotate "line", 113
    find_lex $P212, "@slice"
    $P213 = $P212."join"(", ")
    $P214 = "die"("Cycle detected in dependencies: ", $P213)
# .annotate "line", 110
    .return ($P214)
.end


.namespace ["DependencyQueue"]
.sub "_block225"  :anon :subid("26_1268929822.90395") :outer("24_1268929822.90395")
# .annotate "line", 121
    new $P227, "Undef"
    .lex "$node", $P227
# .annotate "line", 122
    $P228 = root_new ['parrot';'ResizablePMCArray']
    .lex "@prerequisites", $P228
# .annotate "line", 121
    find_lex $P229, "$key"
    find_lex $P230, "self"
    $P231 = $P230."pending"()
    set $P232, $P231[$P229]
    unless_null $P232, vivify_35
    new $P232, "Undef"
  vivify_35:
    store_lex "$node", $P232
# .annotate "line", 122
    find_lex $P233, "$node"
    unless_null $P233, vivify_36
    $P233 = root_new ['parrot';'ResizablePMCArray']
  vivify_36:
    set $P234, $P233[2]
    unless_null $P234, vivify_37
    new $P234, "Undef"
  vivify_37:
    store_lex "@prerequisites", $P234
# .annotate "line", 124
    find_lex $P236, "@prerequisites"
    set $N237, $P236
    unless $N237, if_235_end
# .annotate "line", 125
    find_lex $P238, "self"
    find_lex $P239, "@prerequisites"
    $P238."tsort_add_pending_entries"($P239)
  if_235_end:
# .annotate "line", 129
    new $P240, "Integer"
    assign $P240, 1
    find_lex $P241, "$key"
    find_lex $P242, "self"
    $P243 = $P242."added"()
    set $P243[$P241], $P240
# .annotate "line", 130
    find_lex $P244, "self"
    $P245 = $P244."queue"()
    find_lex $P246, "$node"
    $P247 = $P245."push"($P246)
# .annotate "line", 120
    .return ($P247)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929893.155")
# .annotate "line", 0
    get_hll_global $P14, ["FileSystem"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["FileSystem"], "_block13" 
    capture_lex $P14
    $P345 = $P14()
# .annotate "line", 1
    .return ($P345)
.end


.namespace []
.sub "" :load :init :subid("post35") :outer("10_1268929893.155")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268929893.155" 
    .local pmc block
    set block, $P12
    $P346 = get_root_global ["parrot"], "P6metaclass"
    $P346."new_class"("FileSystem")
.end


.namespace ["FileSystem"]
.sub "_block13"  :subid("11_1268929893.155") :outer("10_1268929893.155")
# .annotate "line", 7
    .const 'Sub' $P335 = "34_1268929893.155" 
    capture_lex $P335
    get_hll_global $P71, ["FileSystem";"Unix"], "_block70" 
    capture_lex $P71
    .const 'Sub' $P48 = "14_1268929893.155" 
    capture_lex $P48
    .const 'Sub' $P21 = "13_1268929893.155" 
    capture_lex $P21
    .const 'Sub' $P15 = "12_1268929893.155" 
    capture_lex $P15
# .annotate "line", 46
    get_hll_global $P71, ["FileSystem";"Unix"], "_block70" 
    capture_lex $P71
    $P333 = $P71()
# .annotate "line", 7
    .return ($P333)
.end


.namespace ["FileSystem"]
.sub "" :load :init :subid("post36") :outer("11_1268929893.155")
# .annotate "line", 7
    get_hll_global $P14, ["FileSystem"], "_block13" 
    .local pmc block
    set block, $P14
    .const 'Sub' $P335 = "34_1268929893.155" 
    capture_lex $P335
    $P335()
    $P343 = get_root_global ["parrot"], "P6metaclass"
    new $P344, "ResizablePMCArray"
    push $P344, "$!file"
    push $P344, "$!os"
    $P343."new_class"("FileSystem::Unix", "FileSystem" :named("parent"), $P344 :named("attr"))
.end


.namespace ["FileSystem"]
.sub "_block334"  :anon :subid("34_1268929893.155") :outer("11_1268929893.155")
# .annotate "line", 8
    get_global $P336, "%_Osname_class_map"
    unless_null $P336, vivify_37
    $P336 = root_new ['parrot';'Hash']
    set_global "%_Osname_class_map", $P336
  vivify_37:
    get_hll_global $P337, "Hash"
    get_hll_global $P338, ["FileSystem"], "Unix"
    get_hll_global $P339, ["FileSystem"], "Unix"
    $P340 = $P337."new"($P338 :named("DEFAULT"), $P339 :named("linux"))
    set_global "%_Osname_class_map", $P340
# .annotate "line", 13
    get_hll_global $P341, ["Kakapo"], "initload_done"
    $P342 = $P341()
# .annotate "line", 7
    .return ($P342)
.end


.namespace ["FileSystem"]
.sub "get_osname_map"  :subid("12_1268929893.155") :method :outer("11_1268929893.155")
# .annotate "line", 16
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
# .annotate "line", 17
    get_global $P18, "%_Osname_class_map"
    unless_null $P18, vivify_38
    $P18 = root_new ['parrot';'Hash']
    set_global "%_Osname_class_map", $P18
  vivify_38:
# .annotate "line", 16
    get_global $P19, "%_Osname_class_map"
    .return ($P19)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P20, exception, "payload"
    .return ($P20)
.end


.namespace ["FileSystem"]
.sub "_init_obj"  :subid("13_1268929893.155") :method :outer("11_1268929893.155")
    .param pmc param_24 :slurpy
    .param pmc param_25 :slurpy :named
# .annotate "line", 20
    new $P23, 'ExceptionHandler'
    set_addr $P23, control_22
    $P23."handle_types"(58)
    push_eh $P23
    .lex "self", self
    .lex "@pos", param_24
    .lex "%named", param_25
# .annotate "line", 21
    $P26 = root_new ['parrot';'Hash']
    .lex "%map", $P26
# .annotate "line", 22
    new $P27, "Undef"
    .lex "$osname", $P27
# .annotate "line", 27
    new $P28, "Undef"
    .lex "$class", $P28
# .annotate "line", 28
    new $P29, "Undef"
    .lex "$obj", $P29
# .annotate "line", 21
    find_lex $P30, "self"
    $P31 = $P30."get_osname_map"()
    store_lex "%map", $P31
# .annotate "line", 22
    find_dynamic_lex $P32, "%*VM"
    unless_null $P32, vivify_39
    get_hll_global $P32, "%VM"
    unless_null $P32, vivify_40
    die "Contextual %*VM not found"
  vivify_40:
  vivify_39:
    set $P33, $P32["osname"]
    unless_null $P33, vivify_41
    new $P33, "Undef"
  vivify_41:
    store_lex "$osname", $P33
# .annotate "line", 25
    find_lex $P35, "%map"
    find_lex $P36, "$osname"
    $P37 = $P35."contains"($P36)
    if $P37, unless_34_end
# .annotate "line", 24
    new $P38, "String"
    assign $P38, "DEFAULT"
    store_lex "$osname", $P38
  unless_34_end:
# .annotate "line", 27
    find_lex $P39, "$osname"
    find_lex $P40, "%map"
    unless_null $P40, vivify_42
    $P40 = root_new ['parrot';'Hash']
  vivify_42:
    set $P41, $P40[$P39]
    unless_null $P41, vivify_43
    new $P41, "Undef"
  vivify_43:
    store_lex "$class", $P41
# .annotate "line", 28
    find_lex $P42, "$class"
    find_lex $P43, "@pos"
    find_lex $P44, "%named"
    $P45 = $P42."new"($P43 :flat, $P44 :flat)
    store_lex "$obj", $P45
    find_lex $P46, "$obj"
# .annotate "line", 20
    .return ($P46)
  control_22:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P47, exception, "payload"
    .return ($P47)
.end


.namespace ["FileSystem"]
.sub "instance"  :subid("14_1268929893.155") :method :outer("11_1268929893.155")
    .param pmc param_51 :optional
    .param int has_param_51 :opt_flag
# .annotate "line", 32
    .const 'Sub' $P58 = "15_1268929893.155" 
    capture_lex $P58
    new $P50, 'ExceptionHandler'
    set_addr $P50, control_49
    $P50."handle_types"(58)
    push_eh $P50
    .lex "self", self
    if has_param_51, optparam_44
    new $P52, "Undef"
    set param_51, $P52
  optparam_44:
    .lex "$value", param_51
# .annotate "line", 36
    get_global $P53, "$_Instance"
    unless_null $P53, vivify_45
    new $P53, "Undef"
    set_global "$_Instance", $P53
  vivify_45:
# .annotate "line", 33
    find_lex $P55, "$value"
    $P56 = $P55."defined"()
    if $P56, if_54
# .annotate "line", 36
    get_global $P62, "$_Instance"
    $P63 = $P62."defined"()
    isfalse $I64, $P63
    unless $I64, if_61_end
# .annotate "line", 37
    find_lex $P65, "self"
    find_lex $P66, "self"
    $P67 = $P66."new"()
    $P65."instance"($P67)
  if_61_end:
# .annotate "line", 36
    goto if_54_end
  if_54:
# .annotate "line", 33
    .const 'Sub' $P58 = "15_1268929893.155" 
    capture_lex $P58
    $P58()
  if_54_end:
    get_global $P68, "$_Instance"
# .annotate "line", 32
    .return ($P68)
  control_49:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P69, exception, "payload"
    .return ($P69)
.end


.namespace ["FileSystem"]
.sub "_block57"  :anon :subid("15_1268929893.155") :outer("14_1268929893.155")
# .annotate "line", 34
    get_global $P59, "$_Instance"
    unless_null $P59, vivify_46
    new $P59, "Undef"
    set_global "$_Instance", $P59
  vivify_46:
    find_lex $P60, "$value"
    set_global "$_Instance", $P60
# .annotate "line", 33
    .return ($P60)
.end


.namespace ["FileSystem";"Unix"]
.sub "_block70"  :subid("16_1268929893.155") :outer("11_1268929893.155")
# .annotate "line", 46
    .const 'Sub' $P297 = "32_1268929893.155" 
    capture_lex $P297
    .const 'Sub' $P292 = "31_1268929893.155" 
    capture_lex $P292
    .const 'Sub' $P247 = "30_1268929893.155" 
    capture_lex $P247
    .const 'Sub' $P233 = "29_1268929893.155" 
    capture_lex $P233
    .const 'Sub' $P219 = "28_1268929893.155" 
    capture_lex $P219
    .const 'Sub' $P205 = "27_1268929893.155" 
    capture_lex $P205
    .const 'Sub' $P177 = "26_1268929893.155" 
    capture_lex $P177
    .const 'Sub' $P159 = "25_1268929893.155" 
    capture_lex $P159
    .const 'Sub' $P121 = "23_1268929893.155" 
    capture_lex $P121
    .const 'Sub' $P113 = "22_1268929893.155" 
    capture_lex $P113
    .const 'Sub' $P104 = "21_1268929893.155" 
    capture_lex $P104
    .const 'Sub' $P94 = "20_1268929893.155" 
    capture_lex $P94
    .const 'Sub' $P90 = "19_1268929893.155" 
    capture_lex $P90
    .const 'Sub' $P83 = "18_1268929893.155" 
    capture_lex $P83
    .const 'Sub' $P72 = "17_1268929893.155" 
    capture_lex $P72
# .annotate "line", 152
    .const 'Sub' $P292 = "31_1268929893.155" 
    capture_lex $P292
# .annotate "line", 46
    .return ($P292)
.end


.namespace ["FileSystem";"Unix"]
.sub "" :load :init :subid("post47") :outer("16_1268929893.155")
# .annotate "line", 46
    get_hll_global $P71, ["FileSystem";"Unix"], "_block70" 
    .local pmc block
    set block, $P71
# .annotate "line", 49
    .const 'Sub' $P297 = "32_1268929893.155" 
    capture_lex $P297
    $P297()
.end


.namespace ["FileSystem";"Unix"]
.sub "_block296"  :anon :subid("32_1268929893.155") :outer("16_1268929893.155")
# .annotate "line", 49
    .const 'Sub' $P306 = "33_1268929893.155" 
    capture_lex $P306
# .annotate "line", 52
    $P298 = root_new ['parrot';'ResizablePMCArray']
    .lex "@multisubs", $P298
# .annotate "line", 50
    get_hll_global $P299, ["Parrot";"Unix"], "Stat"
    "use"($P299)
# .annotate "line", 52
    new $P300, "ResizablePMCArray"
    push $P300, "exists"
    store_lex "@multisubs", $P300
# .annotate "line", 54
    find_lex $P302, "@multisubs"
    defined $I303, $P302
    unless $I303, for_undef_48
    iter $P301, $P302
    new $P331, 'ExceptionHandler'
    set_addr $P331, loop330_handler
    $P331."handle_types"(65, 67, 66)
    push_eh $P331
  loop330_test:
    unless $P301, loop330_done
    shift $P304, $P301
  loop330_redo:
    .const 'Sub' $P306 = "33_1268929893.155" 
    capture_lex $P306
    $P306($P304)
  loop330_next:
    goto loop330_test
  loop330_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P332, exception, 'type'
    eq $P332, 65, loop330_next
    eq $P332, 67, loop330_redo
  loop330_done:
    pop_eh 
  for_undef_48:
# .annotate "line", 49
    .return ($P301)
.end


.namespace ["FileSystem";"Unix"]
.sub "_block305"  :anon :subid("33_1268929893.155") :outer("32_1268929893.155")
    .param pmc param_307
# .annotate "line", 54
    .lex "$name", param_307
# .annotate "line", 57
    new $P308, "Undef"
    .lex "$string_sub", $P308
# .annotate "line", 55
    get_hll_global $P309, ["Parrot"], "define_multisub"
    find_lex $P310, "$name"
    find_lex $P311, "$name"
    $P309($P310, 1 :named("method"), $P311 :named("starting_with"))
# .annotate "line", 57
    get_hll_global $P312, ["Parrot"], "get_hll_global"
    new $P313, 'String'
    set $P313, "FileSystem::Unix::"
    find_lex $P314, "$name"
    set $S315, $P314
    concat $P316, $P313, $S315
    concat $P317, $P316, "__String"
    $P318 = $P312($P317)
    store_lex "$string_sub", $P318
# .annotate "line", 58
    find_lex $P321, "$string_sub"
    $P322 = "is_null"($P321)
    unless $P322, unless_320
    set $P319, $P322
    goto unless_320_end
  unless_320:
# .annotate "line", 59
    get_hll_global $P323, ["Parrot"], "define_multisub"
    find_lex $P324, "$name"
    find_lex $P325, "$string_sub"
    new $P326, "ResizablePMCArray"
    push $P326, $P325
    new $P327, "ResizablePMCArray"
    push $P327, "_"
    push $P327, "string"
    new $P328, "ResizablePMCArray"
    push $P328, $P327
    $P329 = $P323($P324, $P326, $P328 :named("signatures"))
# .annotate "line", 58
    set $P319, $P329
  unless_320_end:
# .annotate "line", 54
    .return ($P319)
.end


.namespace ["FileSystem";"Unix"]
.sub "chdir"  :subid("17_1268929893.155") :method :outer("16_1268929893.155")
    .param pmc param_75 :optional
    .param int has_param_75 :opt_flag
# .annotate "line", 64
    new $P74, 'ExceptionHandler'
    set_addr $P74, control_73
    $P74."handle_types"(58)
    push_eh $P74
    .lex "self", self
    if has_param_75, optparam_49
    new $P76, "String"
    assign $P76, ""
    set param_75, $P76
  optparam_49:
    .lex "$path", param_75
# .annotate "line", 65
    find_lex $P77, "self"
    getattribute $P78, $P77, "$!os"
    unless_null $P78, vivify_50
    new $P78, "Undef"
  vivify_50:
    find_lex $P79, "$path"
    set $S80, $P79
    $P81 = $P78."chdir"($S80)
# .annotate "line", 64
    .return ($P81)
  control_73:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P82, exception, "payload"
    .return ($P82)
.end


.namespace ["FileSystem";"Unix"]
.sub "cwd"  :subid("18_1268929893.155") :method :outer("16_1268929893.155")
# .annotate "line", 68
    new $P85, 'ExceptionHandler'
    set_addr $P85, control_84
    $P85."handle_types"(58)
    push_eh $P85
    .lex "self", self
# .annotate "line", 69
    find_lex $P86, "self"
    getattribute $P87, $P86, "$!os"
    unless_null $P87, vivify_51
    new $P87, "Undef"
  vivify_51:
    $P88 = $P87."cwd"()
# .annotate "line", 68
    .return ($P88)
  control_84:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P89, exception, "payload"
    .return ($P89)
.end


.namespace ["FileSystem";"Unix"]
.sub "directory_separator"  :subid("19_1268929893.155") :method :outer("16_1268929893.155")
# .annotate "line", 72
    new $P92, 'ExceptionHandler'
    set_addr $P92, control_91
    $P92."handle_types"(58)
    push_eh $P92
    .lex "self", self
    .return ("/")
  control_91:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P93, exception, "payload"
    .return ($P93)
.end


.namespace ["FileSystem";"Unix"]
.sub "exists__Path"  :subid("20_1268929893.155") :method :outer("16_1268929893.155")
    .param pmc param_97
# .annotate "line", 74
    new $P96, 'ExceptionHandler'
    set_addr $P96, control_95
    $P96."handle_types"(58)
    push_eh $P96
    .lex "self", self
    .lex "$path", param_97
# .annotate "line", 75
    find_lex $P98, "self"
    getattribute $P99, $P98, "$!file"
    unless_null $P99, vivify_52
    new $P99, "Undef"
  vivify_52:
    find_lex $P100, "$path"
    set $S101, $P100
    $P102 = $P99."exists"($S101)
# .annotate "line", 74
    .return ($P102)
  control_95:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["FileSystem";"Unix"]
.sub "exists__String"  :subid("21_1268929893.155") :method :outer("16_1268929893.155")
    .param pmc param_107
# .annotate "line", 78
    new $P106, 'ExceptionHandler'
    set_addr $P106, control_105
    $P106."handle_types"(58)
    push_eh $P106
    .lex "self", self
    .lex "$path", param_107
# .annotate "line", 79
    find_lex $P108, "self"
    getattribute $P109, $P108, "$!file"
    unless_null $P109, vivify_53
    new $P109, "Undef"
  vivify_53:
    find_lex $P110, "$path"
    $P111 = $P109."exists"($P110)
# .annotate "line", 78
    .return ($P111)
  control_105:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["FileSystem";"Unix"]
.sub "exists__ANY"  :subid("22_1268929893.155") :method :outer("16_1268929893.155")
    .param pmc param_116
# .annotate "line", 82
    new $P115, 'ExceptionHandler'
    set_addr $P115, control_114
    $P115."handle_types"(58)
    push_eh $P115
    .lex "self", self
    .lex "$ignored", param_116
# .annotate "line", 83
    find_lex $P117, "$ignored"
    typeof $S118, $P117
    $P119 = "die"("Don't know how to check if ", $S118, " exists. Use a String or Path")
# .annotate "line", 82
    .return ($P119)
  control_114:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P120, exception, "payload"
    .return ($P120)
.end


.namespace ["FileSystem";"Unix"]
.sub "get_contents"  :subid("23_1268929893.155") :method :outer("16_1268929893.155")
    .param pmc param_124
    .param pmc param_125 :slurpy :named
# .annotate "line", 86
    .const 'Sub' $P133 = "24_1268929893.155" 
    capture_lex $P133
    new $P123, 'ExceptionHandler'
    set_addr $P123, control_122
    $P123."handle_types"(58)
    push_eh $P123
    .lex "self", self
    .lex "$path", param_124
    .lex "%named", param_125
# .annotate "line", 87
    new $P126, "Undef"
    .lex "$contents", $P126
# .annotate "line", 86
    find_lex $P127, "$contents"
# .annotate "line", 89
    find_lex $P129, "self"
    find_lex $P130, "$path"
    $P131 = $P129."is_file"($P130)
    if $P131, if_128
# .annotate "line", 95
    find_lex $P146, "self"
    find_lex $P147, "$path"
    $P148 = $P146."is_directory"($P147)
    if $P148, if_145
# .annotate "line", 100
    new $P154, 'String'
    set $P154, "Don't know how to get contents of non-file, non-directory: "
    find_lex $P155, "$path"
    concat $P156, $P154, $P155
    "die"($P156)
# .annotate "line", 98
    goto if_145_end
  if_145:
# .annotate "line", 96
    find_lex $P149, "self"
    getattribute $P150, $P149, "$!os"
    unless_null $P150, vivify_54
    new $P150, "Undef"
  vivify_54:
    find_lex $P151, "$path"
    set $S152, $P151
    $P153 = $P150."readdir"($S152)
    store_lex "$contents", $P153
  if_145_end:
# .annotate "line", 95
    goto if_128_end
  if_128:
# .annotate "line", 89
    .const 'Sub' $P133 = "24_1268929893.155" 
    capture_lex $P133
    $P133()
  if_128_end:
    find_lex $P157, "$contents"
# .annotate "line", 86
    .return ($P157)
  control_122:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P158, exception, "payload"
    .return ($P158)
.end


.namespace ["FileSystem";"Unix"]
.sub "_block132"  :anon :subid("24_1268929893.155") :outer("23_1268929893.155")
# .annotate "line", 91
    new $P134, "Undef"
    .lex "$fh", $P134
# .annotate "line", 90
    new $P135, "String"
    assign $P135, "r"
    find_lex $P136, "%named"
    unless_null $P136, vivify_55
    $P136 = root_new ['parrot';'Hash']
    store_lex "%named", $P136
  vivify_55:
    set $P136["mode"], $P135
# .annotate "line", 91
    find_lex $P137, "self"
    find_lex $P138, "$path"
    find_lex $P139, "%named"
    $P140 = $P137."open"($P138, $P139 :flat)
    store_lex "$fh", $P140
# .annotate "line", 92
    find_lex $P141, "$fh"
    $P142 = $P141."readall"()
    store_lex "$contents", $P142
# .annotate "line", 93
    find_lex $P143, "$fh"
    $P144 = $P143."close"()
# .annotate "line", 89
    .return ($P144)
.end


.namespace ["FileSystem";"Unix"]
.sub "_init_obj"  :subid("25_1268929893.155") :method :outer("16_1268929893.155")
    .param pmc param_162 :slurpy
    .param pmc param_163 :slurpy :named
# .annotate "line", 106
    new $P161, 'ExceptionHandler'
    set_addr $P161, control_160
    $P161."handle_types"(58)
    push_eh $P161
    .lex "self", self
    .lex "@pos", param_162
    .lex "%named", param_163
# .annotate "line", 107
    new $P164, "String"
    assign $P164, "File"
    set $S165, $P164
    new $P166, $S165
    find_lex $P167, "self"
    setattribute $P167, "$!file", $P166
# .annotate "line", 108
    new $P168, "String"
    assign $P168, "OS"
    set $S169, $P168
    new $P170, $S169
    find_lex $P171, "self"
    setattribute $P171, "$!os", $P170
# .annotate "line", 110
    find_lex $P172, "self"
    find_lex $P173, "@pos"
    find_lex $P174, "%named"
    $P175 = $P172."_init_args"($P173 :flat, $P174 :flat)
# .annotate "line", 106
    .return ($P175)
  control_160:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P176, exception, "payload"
    .return ($P176)
.end


.namespace ["FileSystem";"Unix"]
.sub "is_device"  :subid("26_1268929893.155") :method :outer("16_1268929893.155")
    .param pmc param_180
# .annotate "line", 113
    new $P179, 'ExceptionHandler'
    set_addr $P179, control_178
    $P179."handle_types"(58)
    push_eh $P179
    .lex "self", self
    .lex "$path", param_180
# .annotate "line", 114
    $P181 = root_new ['parrot';'ResizablePMCArray']
    .lex "@stat", $P181
# .annotate "line", 115
    new $P182, "Undef"
    .lex "$mode", $P182
# .annotate "line", 114
    find_lex $P183, "self"
    getattribute $P184, $P183, "$!os"
    unless_null $P184, vivify_56
    new $P184, "Undef"
  vivify_56:
    find_lex $P185, "$path"
    set $S186, $P185
    $P187 = $P184."stat"($S186)
    store_lex "@stat", $P187
# .annotate "line", 115
    find_lex $P188, "@stat"
    unless_null $P188, vivify_57
    $P188 = root_new ['parrot';'ResizablePMCArray']
  vivify_57:
    set $P189, $P188[2]
    unless_null $P189, vivify_58
    new $P189, "Undef"
  vivify_58:
    store_lex "$mode", $P189
# .annotate "line", 116
    find_lex $P196, "$mode"
    $P197 = "S_ISBLK"($P196)
    unless $P197, unless_195
    set $P194, $P197
    goto unless_195_end
  unless_195:
    find_lex $P198, "$mode"
    $P199 = "S_ISCHR"($P198)
    set $P194, $P199
  unless_195_end:
    unless $P194, unless_193
    set $P192, $P194
    goto unless_193_end
  unless_193:
    find_lex $P200, "$mode"
    $P201 = "S_ISFIFO"($P200)
    set $P192, $P201
  unless_193_end:
    unless $P192, unless_191
    set $P190, $P192
    goto unless_191_end
  unless_191:
    find_lex $P202, "$mode"
    $P203 = "S_ISSOCK"($P202)
    set $P190, $P203
  unless_191_end:
# .annotate "line", 113
    .return ($P190)
  control_178:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P204, exception, "payload"
    .return ($P204)
.end


.namespace ["FileSystem";"Unix"]
.sub "is_directory"  :subid("27_1268929893.155") :method :outer("16_1268929893.155")
    .param pmc param_208
# .annotate "line", 119
    new $P207, 'ExceptionHandler'
    set_addr $P207, control_206
    $P207."handle_types"(58)
    push_eh $P207
    .lex "self", self
    .lex "$path", param_208
# .annotate "line", 120
    $P209 = root_new ['parrot';'ResizablePMCArray']
    .lex "@stat", $P209
    find_lex $P210, "self"
    getattribute $P211, $P210, "$!os"
    unless_null $P211, vivify_59
    new $P211, "Undef"
  vivify_59:
    find_lex $P212, "$path"
    set $S213, $P212
    $P214 = $P211."stat"($S213)
    store_lex "@stat", $P214
# .annotate "line", 121
    find_lex $P215, "@stat"
    unless_null $P215, vivify_60
    $P215 = root_new ['parrot';'ResizablePMCArray']
  vivify_60:
    set $P216, $P215[2]
    unless_null $P216, vivify_61
    new $P216, "Undef"
  vivify_61:
    $P217 = "S_ISDIR"($P216)
# .annotate "line", 119
    .return ($P217)
  control_206:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P218, exception, "payload"
    .return ($P218)
.end


.namespace ["FileSystem";"Unix"]
.sub "is_file"  :subid("28_1268929893.155") :method :outer("16_1268929893.155")
    .param pmc param_222
# .annotate "line", 124
    new $P221, 'ExceptionHandler'
    set_addr $P221, control_220
    $P221."handle_types"(58)
    push_eh $P221
    .lex "self", self
    .lex "$path", param_222
# .annotate "line", 125
    $P223 = root_new ['parrot';'ResizablePMCArray']
    .lex "@stat", $P223
    find_lex $P224, "self"
    getattribute $P225, $P224, "$!os"
    unless_null $P225, vivify_62
    new $P225, "Undef"
  vivify_62:
    find_lex $P226, "$path"
    set $S227, $P226
    $P228 = $P225."stat"($S227)
    store_lex "@stat", $P228
# .annotate "line", 126
    find_lex $P229, "@stat"
    unless_null $P229, vivify_63
    $P229 = root_new ['parrot';'ResizablePMCArray']
  vivify_63:
    set $P230, $P229[2]
    unless_null $P230, vivify_64
    new $P230, "Undef"
  vivify_64:
    $P231 = "S_ISREG"($P230)
# .annotate "line", 124
    .return ($P231)
  control_220:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P232, exception, "payload"
    .return ($P232)
.end


.namespace ["FileSystem";"Unix"]
.sub "is_link"  :subid("29_1268929893.155") :method :outer("16_1268929893.155")
    .param pmc param_236
# .annotate "line", 129
    new $P235, 'ExceptionHandler'
    set_addr $P235, control_234
    $P235."handle_types"(58)
    push_eh $P235
    .lex "self", self
    .lex "$path", param_236
# .annotate "line", 130
    $P237 = root_new ['parrot';'ResizablePMCArray']
    .lex "@stat", $P237
    find_lex $P238, "self"
    getattribute $P239, $P238, "$!os"
    unless_null $P239, vivify_65
    new $P239, "Undef"
  vivify_65:
    find_lex $P240, "$path"
    set $S241, $P240
    $P242 = $P239."lstat"($S241)
    store_lex "@stat", $P242
# .annotate "line", 131
    find_lex $P243, "@stat"
    unless_null $P243, vivify_66
    $P243 = root_new ['parrot';'ResizablePMCArray']
  vivify_66:
    set $P244, $P243[2]
    unless_null $P244, vivify_67
    new $P244, "Undef"
  vivify_67:
    $P245 = "S_ISLNK"($P244)
# .annotate "line", 129
    .return ($P245)
  control_234:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P246, exception, "payload"
    .return ($P246)
.end


.namespace ["FileSystem";"Unix"]
.sub "open"  :subid("30_1268929893.155") :method :outer("16_1268929893.155")
    .param pmc param_250
    .param pmc param_251 :slurpy :named
# .annotate "line", 134
    new $P249, 'ExceptionHandler'
    set_addr $P249, control_248
    $P249."handle_types"(58)
    push_eh $P249
    .lex "self", self
    .lex "$path", param_250
    .lex "%named", param_251
# .annotate "line", 136
    new $P252, "Undef"
    .lex "$fh", $P252
# .annotate "line", 137
    new $P253, "Undef"
    .lex "$mode", $P253
# .annotate "line", 136
    new $P254, "String"
    assign $P254, "FileHandle"
    set $S255, $P254
    new $P256, $S255
    store_lex "$fh", $P256
# .annotate "line", 137
    new $P258, "String"
    assign $P258, ""
    find_lex $P259, "%named"
    unless_null $P259, vivify_68
    $P259 = root_new ['parrot';'Hash']
  vivify_68:
    set $P260, $P259["mode"]
    unless_null $P260, vivify_69
    new $P260, "Undef"
  vivify_69:
    concat $P261, $P258, $P260
    set $P257, $P261
    defined $I263, $P257
    if $I263, default_262
    new $P264, "String"
    assign $P264, "r"
    set $P257, $P264
  default_262:
    store_lex "$mode", $P257
# .annotate "line", 139
    find_lex $P265, "$fh"
    find_lex $P266, "$path"
    set $S267, $P266
    find_lex $P268, "$mode"
    $P265."open"($S267, $P268)
# .annotate "line", 143
    find_lex $P270, "%named"
    $P271 = $P270."contains"("buffer_size")
    unless $P271, if_269_end
# .annotate "line", 142
    find_lex $P272, "$fh"
    find_lex $P273, "%named"
    unless_null $P273, vivify_70
    $P273 = root_new ['parrot';'Hash']
  vivify_70:
    set $P274, $P273["buffer_size"]
    unless_null $P274, vivify_71
    new $P274, "Undef"
  vivify_71:
    set $N275, $P274
    $P272."buffer_size"($N275)
  if_269_end:
# .annotate "line", 145
    find_lex $P277, "%named"
    $P278 = $P277."contains"("buffer_type")
    unless $P278, if_276_end
# .annotate "line", 144
    find_lex $P279, "$fh"
    find_lex $P280, "%named"
    unless_null $P280, vivify_72
    $P280 = root_new ['parrot';'Hash']
  vivify_72:
    set $P281, $P280["buffer_type"]
    unless_null $P281, vivify_73
    new $P281, "Undef"
  vivify_73:
    set $S282, $P281
    $P279."buffer_type"($S282)
  if_276_end:
# .annotate "line", 147
    find_lex $P284, "%named"
    $P285 = $P284."contains"("encoding")
    unless $P285, if_283_end
# .annotate "line", 146
    find_lex $P286, "$fh"
    find_lex $P287, "%named"
    unless_null $P287, vivify_74
    $P287 = root_new ['parrot';'Hash']
  vivify_74:
    set $P288, $P287["encoding"]
    unless_null $P288, vivify_75
    new $P288, "Undef"
  vivify_75:
    set $S289, $P288
    $P286."encoding"($S289)
  if_283_end:
    find_lex $P290, "$fh"
# .annotate "line", 134
    .return ($P290)
  control_248:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P291, exception, "payload"
    .return ($P291)
.end


.namespace ["FileSystem";"Unix"]
.sub "volume_separator"  :subid("31_1268929893.155") :method :outer("16_1268929893.155")
# .annotate "line", 152
    new $P294, 'ExceptionHandler'
    set_addr $P294, control_293
    $P294."handle_types"(58)
    push_eh $P294
    .lex "self", self
    .return (":")
  control_293:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P295, exception, "payload"
    .return ($P295)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929914.72533")
# .annotate "line", 0
    get_hll_global $P14, ["Library"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["Library"], "_block13" 
    capture_lex $P14
    $P130 = $P14()
# .annotate "line", 1
    .return ($P130)
.end


.namespace ["Library"]
.sub "_block13"  :subid("11_1268929914.72533") :outer("10_1268929914.72533")
# .annotate "line", 6
    .const 'Sub' $P118 = "19_1268929914.72533" 
    capture_lex $P118
    .const 'Sub' $P102 = "18_1268929914.72533" 
    capture_lex $P102
    .const 'Sub' $P94 = "17_1268929914.72533" 
    capture_lex $P94
    .const 'Sub' $P86 = "16_1268929914.72533" 
    capture_lex $P86
    .const 'Sub' $P67 = "15_1268929914.72533" 
    capture_lex $P67
    .const 'Sub' $P42 = "14_1268929914.72533" 
    capture_lex $P42
    .const 'Sub' $P23 = "13_1268929914.72533" 
    capture_lex $P23
    .const 'Sub' $P15 = "12_1268929914.72533" 
    capture_lex $P15
# .annotate "line", 9
    .const 'Sub' $P15 = "12_1268929914.72533" 
    capture_lex $P15
    .lex "_pre_initload", $P15
# .annotate "line", 6
    find_lex $P22, "_pre_initload"
# .annotate "line", 44
    .const 'Sub' $P118 = "19_1268929914.72533" 
    capture_lex $P118
# .annotate "line", 6
    .return ($P118)
.end


.namespace ["Library"]
.sub "_pre_initload"  :subid("12_1268929914.72533") :outer("11_1268929914.72533")
    .param pmc param_18 :slurpy
# .annotate "line", 9
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "@modules_done", param_18
# .annotate "line", 10
    new $P19, "ResizablePMCArray"
    push $P19, "$!init_marshaller"
    push $P19, "$!load_marshaller"
    $P20 = "has"($P19)
# .annotate "line", 9
    .return ($P20)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P21, exception, "payload"
    .return ($P21)
.end


.namespace ["Library"]
.sub "at_init"  :subid("13_1268929914.72533") :method :outer("11_1268929914.72533")
    .param pmc param_26
    .param pmc param_27 :optional
    .param int has_param_27 :opt_flag
    .param pmc param_29 :optional :named("namespace")
    .param int has_param_29 :opt_flag
    .param pmc param_32 :optional :named("requires")
    .param int has_param_32 :opt_flag
# .annotate "line", 16
    new $P25, 'ExceptionHandler'
    set_addr $P25, control_24
    $P25."handle_types"(58)
    push_eh $P25
    .lex "self", self
    .lex "$sub", param_26
    if has_param_27, optparam_20
    new $P28, "Undef"
    set param_27, $P28
  optparam_20:
    .lex "$name", param_27
    if has_param_29, optparam_21
    get_hll_global $P30, ["Parrot"], "caller_namespace"
    $P31 = $P30()
    set param_29, $P31
  optparam_21:
    .lex "$namespace", param_29
    if has_param_32, optparam_22
    $P33 = root_new ['parrot';'ResizablePMCArray']
    set param_32, $P33
  optparam_22:
    .lex "@requires", param_32
# .annotate "line", 17
    find_lex $P34, "self"
    getattribute $P35, $P34, "$!init_marshaller"
    unless_null $P35, vivify_23
    new $P35, "Undef"
  vivify_23:
    find_lex $P36, "$sub"
    find_lex $P37, "$name"
    find_lex $P38, "$namespace"
    find_lex $P39, "@requires"
    $P40 = $P35."add_call"($P36, $P37, $P38 :named("namespace"), $P39 :named("requires"))
# .annotate "line", 16
    .return ($P40)
  control_24:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P41, exception, "payload"
    .return ($P41)
.end


.namespace ["Library"]
.sub "at_initload"  :subid("14_1268929914.72533") :method :outer("11_1268929914.72533")
    .param pmc param_45
    .param pmc param_46 :optional
    .param int has_param_46 :opt_flag
    .param pmc param_48 :optional :named("namespace")
    .param int has_param_48 :opt_flag
    .param pmc param_51 :optional :named("requires")
    .param int has_param_51 :opt_flag
# .annotate "line", 20
    new $P44, 'ExceptionHandler'
    set_addr $P44, control_43
    $P44."handle_types"(58)
    push_eh $P44
    .lex "self", self
    .lex "$sub", param_45
    if has_param_46, optparam_24
    new $P47, "Undef"
    set param_46, $P47
  optparam_24:
    .lex "$name", param_46
    if has_param_48, optparam_25
    get_hll_global $P49, ["Parrot"], "caller_namespace"
    $P50 = $P49()
    set param_48, $P50
  optparam_25:
    .lex "$namespace", param_48
    if has_param_51, optparam_26
    $P52 = root_new ['parrot';'ResizablePMCArray']
    set param_51, $P52
  optparam_26:
    .lex "@requires", param_51
# .annotate "line", 21
    find_lex $P53, "self"
    getattribute $P54, $P53, "$!init_marshaller"
    unless_null $P54, vivify_27
    new $P54, "Undef"
  vivify_27:
    find_lex $P55, "$sub"
    find_lex $P56, "$name"
    find_lex $P57, "$namespace"
    find_lex $P58, "@requires"
    $P54."add_call"($P55, $P56, $P57 :named("namespace"), $P58 :named("requires"))
# .annotate "line", 22
    find_lex $P59, "self"
    getattribute $P60, $P59, "$!load_marshaller"
    unless_null $P60, vivify_28
    new $P60, "Undef"
  vivify_28:
    find_lex $P61, "$sub"
    find_lex $P62, "$name"
    find_lex $P63, "$namespace"
    find_lex $P64, "@requires"
    $P65 = $P60."add_call"($P61, $P62, $P63 :named("namespace"), $P64 :named("requires"))
# .annotate "line", 20
    .return ($P65)
  control_43:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P66, exception, "payload"
    .return ($P66)
.end


.namespace ["Library"]
.sub "at_load"  :subid("15_1268929914.72533") :method :outer("11_1268929914.72533")
    .param pmc param_70
    .param pmc param_71 :optional
    .param int has_param_71 :opt_flag
    .param pmc param_73 :optional :named("namespace")
    .param int has_param_73 :opt_flag
    .param pmc param_76 :optional :named("requires")
    .param int has_param_76 :opt_flag
# .annotate "line", 25
    new $P69, 'ExceptionHandler'
    set_addr $P69, control_68
    $P69."handle_types"(58)
    push_eh $P69
    .lex "self", self
    .lex "$sub", param_70
    if has_param_71, optparam_29
    new $P72, "Undef"
    set param_71, $P72
  optparam_29:
    .lex "$name", param_71
    if has_param_73, optparam_30
    get_hll_global $P74, ["Parrot"], "caller_namespace"
    $P75 = $P74()
    set param_73, $P75
  optparam_30:
    .lex "$namespace", param_73
    if has_param_76, optparam_31
    $P77 = root_new ['parrot';'ResizablePMCArray']
    set param_76, $P77
  optparam_31:
    .lex "@requires", param_76
# .annotate "line", 26
    find_lex $P78, "self"
    getattribute $P79, $P78, "$!load_marshaller"
    unless_null $P79, vivify_32
    new $P79, "Undef"
  vivify_32:
    find_lex $P80, "$sub"
    find_lex $P81, "$name"
    find_lex $P82, "$namespace"
    find_lex $P83, "@requires"
    $P84 = $P79."add_call"($P80, $P81, $P82 :named("namespace"), $P83 :named("requires"))
# .annotate "line", 25
    .return ($P84)
  control_68:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P85, exception, "payload"
    .return ($P85)
.end


.namespace ["Library"]
.sub "do_init"  :subid("16_1268929914.72533") :method :outer("11_1268929914.72533")
# .annotate "line", 29
    new $P88, 'ExceptionHandler'
    set_addr $P88, control_87
    $P88."handle_types"(58)
    push_eh $P88
    .lex "self", self
# .annotate "line", 30
    find_lex $P89, "self"
    getattribute $P90, $P89, "$!init_marshaller"
    unless_null $P90, vivify_33
    new $P90, "Undef"
  vivify_33:
    find_lex $P91, "self"
    $P92 = $P90."process_queue"($P91)
# .annotate "line", 29
    .return ($P92)
  control_87:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P93, exception, "payload"
    .return ($P93)
.end


.namespace ["Library"]
.sub "do_load"  :subid("17_1268929914.72533") :method :outer("11_1268929914.72533")
# .annotate "line", 33
    new $P96, 'ExceptionHandler'
    set_addr $P96, control_95
    $P96."handle_types"(58)
    push_eh $P96
    .lex "self", self
# .annotate "line", 34
    find_lex $P97, "self"
    getattribute $P98, $P97, "$!load_marshaller"
    unless_null $P98, vivify_34
    new $P98, "Undef"
  vivify_34:
    find_lex $P99, "self"
    $P100 = $P98."process_queue"($P99)
# .annotate "line", 33
    .return ($P100)
  control_95:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["Library"]
.sub "_init_obj"  :subid("18_1268929914.72533") :method :outer("11_1268929914.72533")
    .param pmc param_105 :slurpy
    .param pmc param_106 :slurpy :named
# .annotate "line", 37
    new $P104, 'ExceptionHandler'
    set_addr $P104, control_103
    $P104."handle_types"(58)
    push_eh $P104
    .lex "self", self
    .lex "@pos", param_105
    .lex "%named", param_106
# .annotate "line", 38
    get_hll_global $P107, "ComponentMarshaller"
    $P108 = $P107."new"("init" :named("name"))
    find_lex $P109, "self"
    setattribute $P109, "$!init_marshaller", $P108
# .annotate "line", 39
    get_hll_global $P110, "ComponentMarshaller"
    $P111 = $P110."new"("load" :named("name"))
    find_lex $P112, "self"
    setattribute $P112, "$!load_marshaller", $P111
# .annotate "line", 41
    find_lex $P113, "self"
    find_lex $P114, "@pos"
    find_lex $P115, "%named"
    $P116 = $P113."_init_args"($P114 :flat, $P115 :flat)
# .annotate "line", 37
    .return ($P116)
  control_103:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, "payload"
    .return ($P117)
.end


.namespace ["Library"]
.sub "module_initload_done"  :subid("19_1268929914.72533") :method :outer("11_1268929914.72533")
    .param pmc param_121
# .annotate "line", 44
    new $P120, 'ExceptionHandler'
    set_addr $P120, control_119
    $P120."handle_types"(58)
    push_eh $P120
    .lex "self", self
    .lex "$name", param_121
# .annotate "line", 45
    find_lex $P122, "self"
    getattribute $P123, $P122, "$!init_marshaller"
    unless_null $P123, vivify_35
    new $P123, "Undef"
  vivify_35:
    find_lex $P124, "$name"
    $P123."mark_as_done"($P124)
# .annotate "line", 46
    find_lex $P125, "self"
    getattribute $P126, $P125, "$!load_marshaller"
    unless_null $P126, vivify_36
    new $P126, "Undef"
  vivify_36:
    find_lex $P127, "$name"
    $P128 = $P126."mark_as_done"($P127)
# .annotate "line", 44
    .return ($P128)
  control_119:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P129, exception, "payload"
    .return ($P129)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929896.66506")
# .annotate "line", 0
    get_hll_global $P14, ["Matcher";"Boolean"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Matcher";"Boolean"], "_block13" 
    capture_lex $P14
    $P82 = $P14()
# .annotate "line", 1
    .return ($P82)
.end


.namespace ["Matcher";"Boolean"]
.sub "_block13"  :subid("11_1268929896.66506") :outer("10_1268929896.66506")
# .annotate "line", 7
    .const 'Sub' $P72 = "18_1268929896.66506" 
    capture_lex $P72
    .const 'Sub' $P59 = "17_1268929896.66506" 
    capture_lex $P59
    .const 'Sub' $P51 = "16_1268929896.66506" 
    capture_lex $P51
    .const 'Sub' $P37 = "15_1268929896.66506" 
    capture_lex $P37
    .const 'Sub' $P30 = "14_1268929896.66506" 
    capture_lex $P30
    .const 'Sub' $P24 = "13_1268929896.66506" 
    capture_lex $P24
    .const 'Sub' $P15 = "12_1268929896.66506" 
    capture_lex $P15
# .annotate "line", 16
    .const 'Sub' $P15 = "12_1268929896.66506" 
    capture_lex $P15
    .lex "_initload", $P15
# .annotate "line", 30
    .const 'Sub' $P24 = "13_1268929896.66506" 
    capture_lex $P24
    .lex "factory_false", $P24
# .annotate "line", 31
    .const 'Sub' $P30 = "14_1268929896.66506" 
    capture_lex $P30
    .lex "factory_true", $P30
# .annotate "line", 9
    find_lex $P36, "_initload"
# .annotate "line", 24
    find_lex $P49, "factory_false"
    find_lex $P50, "factory_true"
# .annotate "line", 43
    .const 'Sub' $P72 = "18_1268929896.66506" 
    capture_lex $P72
# .annotate "line", 7
    .return ($P72)
.end


.namespace ["Matcher";"Boolean"]
.sub "" :load :init :subid("post19") :outer("11_1268929896.66506")
# .annotate "line", 7
    get_hll_global $P14, ["Matcher";"Boolean"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 10
    get_hll_global $P80, ["Kakapo"], "depends_on"
    new $P81, "ResizablePMCArray"
    push $P81, "Matcher"
    push $P81, "Matcher::Factory"
    $P80($P81 :flat)
.end


.namespace ["Matcher";"Boolean"]
.sub "_initload"  :subid("12_1268929896.66506") :outer("11_1268929896.66506")
# .annotate "line", 16
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 17
    "extends"("Matcher")
# .annotate "line", 18
    "has"("$!expected")
# .annotate "line", 20
    get_hll_global $P18, ["Matcher";"Factory"], "export_sub"
    get_hll_global $P19, ["Matcher";"Boolean"], "factory_true"
    $P18($P19, "true" :named("as"))
# .annotate "line", 21
    get_hll_global $P20, ["Matcher";"Factory"], "export_sub"
    get_hll_global $P21, ["Matcher";"Boolean"], "factory_false"
    $P22 = $P20($P21, "false" :named("as"))
# .annotate "line", 16
    .return ($P22)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P23, exception, "payload"
    .return ($P23)
.end


.namespace ["Matcher";"Boolean"]
.sub "factory_false"  :subid("13_1268929896.66506") :outer("11_1268929896.66506")
# .annotate "line", 30
    new $P26, 'ExceptionHandler'
    set_addr $P26, control_25
    $P26."handle_types"(58)
    push_eh $P26
    get_hll_global $P27, ["Matcher"], "Boolean"
    $P28 = $P27."new"(1 :named("false"))
    .return ($P28)
  control_25:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P29, exception, "payload"
    .return ($P29)
.end


.namespace ["Matcher";"Boolean"]
.sub "factory_true"  :subid("14_1268929896.66506") :outer("11_1268929896.66506")
# .annotate "line", 31
    new $P32, 'ExceptionHandler'
    set_addr $P32, control_31
    $P32."handle_types"(58)
    push_eh $P32
    get_hll_global $P33, ["Matcher"], "Boolean"
    $P34 = $P33."new"(1 :named("true"))
    .return ($P34)
  control_31:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P35, exception, "payload"
    .return ($P35)
.end


.namespace ["Matcher";"Boolean"]
.sub "describe_self"  :subid("15_1268929896.66506") :method :outer("11_1268929896.66506")
    .param pmc param_40 :optional
    .param int has_param_40 :opt_flag
# .annotate "line", 24
    new $P39, 'ExceptionHandler'
    set_addr $P39, control_38
    $P39."handle_types"(58)
    push_eh $P39
    .lex "self", self
    if has_param_40, optparam_20
    new $P41, "String"
    assign $P41, ""
    set param_40, $P41
  optparam_20:
    .lex "$previous", param_40
# .annotate "line", 25
    find_lex $P42, "$previous"
    find_lex $P45, "self"
    $P46 = $P45."expected"()
    if $P46, if_44
    set $S43, "a false value"
    goto if_44_end
  if_44:
    set $S43, "a true value"
  if_44_end:
# .annotate "line", 26
    concat $P47, $P42, $S43
# .annotate "line", 24
    .return ($P47)
  control_38:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P48, exception, "payload"
    .return ($P48)
.end


.namespace ["Matcher";"Boolean"]
.sub "false"  :subid("16_1268929896.66506") :method :outer("11_1268929896.66506")
    .param pmc param_54 :optional
    .param int has_param_54 :opt_flag
# .annotate "line", 33
    new $P53, 'ExceptionHandler'
    set_addr $P53, control_52
    $P53."handle_types"(58)
    push_eh $P53
    .lex "self", self
    if has_param_54, optparam_21
    new $P55, "Undef"
    set param_54, $P55
  optparam_21:
    .lex "$ignored", param_54
# .annotate "line", 34
    new $P56, "Integer"
    assign $P56, 0
    find_lex $P57, "self"
    setattribute $P57, "$!expected", $P56
# .annotate "line", 33
    .return ($P56)
  control_52:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P58, exception, "payload"
    .return ($P58)
.end


.namespace ["Matcher";"Boolean"]
.sub "matches"  :subid("17_1268929896.66506") :method :outer("11_1268929896.66506")
    .param pmc param_62
# .annotate "line", 37
    new $P61, 'ExceptionHandler'
    set_addr $P61, control_60
    $P61."handle_types"(58)
    push_eh $P61
    .lex "self", self
    .lex "$item", param_62
# .annotate "line", 39
    find_lex $P65, "$item"
    if $P65, if_64
# .annotate "line", 40
    find_lex $P68, "self"
    $P69 = $P68."expected"()
    isfalse $I70, $P69
    new $P63, 'Integer'
    set $P63, $I70
# .annotate "line", 39
    goto if_64_end
  if_64:
    find_lex $P66, "self"
    $P67 = $P66."expected"()
    set $P63, $P67
  if_64_end:
# .annotate "line", 37
    .return ($P63)
  control_60:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P71, exception, "payload"
    .return ($P71)
.end


.namespace ["Matcher";"Boolean"]
.sub "true"  :subid("18_1268929896.66506") :method :outer("11_1268929896.66506")
    .param pmc param_75 :optional
    .param int has_param_75 :opt_flag
# .annotate "line", 43
    new $P74, 'ExceptionHandler'
    set_addr $P74, control_73
    $P74."handle_types"(58)
    push_eh $P74
    .lex "self", self
    if has_param_75, optparam_22
    new $P76, "Undef"
    set param_75, $P76
  optparam_22:
    .lex "$ignored", param_75
# .annotate "line", 44
    new $P77, "Integer"
    assign $P77, 1
    find_lex $P78, "self"
    setattribute $P78, "$!expected", $P77
# .annotate "line", 43
    .return ($P77)
  control_73:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P79, exception, "payload"
    .return ($P79)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929855.95444")
# .annotate "line", 0
    get_hll_global $P14, ["Matcher";"CallSig"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["Matcher";"CallSig"], "_block13" 
    capture_lex $P14
    $P334 = $P14()
# .annotate "line", 1
    .return ($P334)
.end


.namespace ["Matcher";"CallSig"]
.sub "_block13"  :subid("11_1268929855.95444") :outer("10_1268929855.95444")
# .annotate "line", 6
    .const 'Sub' $P256 = "26_1268929855.95444" 
    capture_lex $P256
    .const 'Sub' $P238 = "25_1268929855.95444" 
    capture_lex $P238
    .const 'Sub' $P195 = "23_1268929855.95444" 
    capture_lex $P195
    .const 'Sub' $P177 = "22_1268929855.95444" 
    capture_lex $P177
    .const 'Sub' $P148 = "21_1268929855.95444" 
    capture_lex $P148
    .const 'Sub' $P107 = "20_1268929855.95444" 
    capture_lex $P107
    .const 'Sub' $P57 = "17_1268929855.95444" 
    capture_lex $P57
    .const 'Sub' $P45 = "16_1268929855.95444" 
    capture_lex $P45
    .const 'Sub' $P33 = "15_1268929855.95444" 
    capture_lex $P33
    .const 'Sub' $P25 = "14_1268929855.95444" 
    capture_lex $P25
    .const 'Sub' $P20 = "13_1268929855.95444" 
    capture_lex $P20
    .const 'Sub' $P15 = "12_1268929855.95444" 
    capture_lex $P15
# .annotate "line", 14
    .const 'Sub' $P15 = "12_1268929855.95444" 
    capture_lex $P15
    .lex "_initload", $P15
# .annotate "line", 21
    .const 'Sub' $P20 = "13_1268929855.95444" 
    capture_lex $P20
    .lex "ANY", $P20
# .annotate "line", 27
    .const 'Sub' $P25 = "14_1268929855.95444" 
    capture_lex $P25
    .lex "ETC", $P25
# .annotate "line", 8
    find_lex $P30, "_initload"
    find_lex $P31, "ANY"
    find_lex $P32, "ETC"
# .annotate "line", 91
    .const 'Sub' $P256 = "26_1268929855.95444" 
    capture_lex $P256
# .annotate "line", 6
    .return ($P256)
.end


.namespace ["Matcher";"CallSig"]
.sub "" :load :init :subid("post27") :outer("11_1268929855.95444")
# .annotate "line", 6
    get_hll_global $P14, ["Matcher";"CallSig"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 9
    get_hll_global $P332, ["Kakapo"], "depends_on"
    $P332("Matcher")
# .annotate "line", 11
    new $P333, "ResizablePMCArray"
    push $P333, "ANY"
    push $P333, "ETC"
    "export"($P333)
.end


.namespace ["Matcher";"CallSig"]
.sub "_initload"  :subid("12_1268929855.95444") :outer("11_1268929855.95444")
# .annotate "line", 14
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 15
    "extends"("Matcher")
# .annotate "line", 16
    $P18 = "has"("$!expecting")
# .annotate "line", 14
    .return ($P18)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P19, exception, "payload"
    .return ($P19)
.end


.namespace ["Matcher";"CallSig"]
.sub "ANY"  :subid("13_1268929855.95444") :outer("11_1268929855.95444")
# .annotate "line", 21
    new $P22, 'ExceptionHandler'
    set_addr $P22, control_21
    $P22."handle_types"(58)
    push_eh $P22
    get_hll_global $P23, ["Matcher";"CallSig"], "ANY"
    .return ($P23)
  control_21:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P24, exception, "payload"
    .return ($P24)
.end


.namespace ["Matcher";"CallSig"]
.sub "ETC"  :subid("14_1268929855.95444") :outer("11_1268929855.95444")
# .annotate "line", 27
    new $P27, 'ExceptionHandler'
    set_addr $P27, control_26
    $P27."handle_types"(58)
    push_eh $P27
    get_hll_global $P28, ["Matcher";"CallSig"], "ETC"
    .return ($P28)
  control_26:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P29, exception, "payload"
    .return ($P29)
.end


.namespace ["Matcher";"CallSig"]
.sub "describe_failure"  :subid("15_1268929855.95444") :method :outer("11_1268929855.95444")
    .param pmc param_36
    .param pmc param_37
# .annotate "line", 31
    new $P35, 'ExceptionHandler'
    set_addr $P35, control_34
    $P35."handle_types"(58)
    push_eh $P35
    .lex "self", self
    .lex "$previous", param_36
    .lex "$item", param_37
# .annotate "line", 32
    find_lex $P38, "$previous"
    concat $P39, $P38, "was a call to "
    find_lex $P40, "self"
    find_lex $P41, "$item"
    $S42 = $P40."format_sig"($P41)
    concat $P43, $P39, $S42
# .annotate "line", 31
    .return ($P43)
  control_34:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P44, exception, "payload"
    .return ($P44)
.end


.namespace ["Matcher";"CallSig"]
.sub "describe_self"  :subid("16_1268929855.95444") :method :outer("11_1268929855.95444")
    .param pmc param_48
# .annotate "line", 35
    new $P47, 'ExceptionHandler'
    set_addr $P47, control_46
    $P47."handle_types"(58)
    push_eh $P47
    .lex "self", self
    .lex "$previous", param_48
# .annotate "line", 36
    find_lex $P49, "$previous"
    concat $P50, $P49, "a call matching "
    find_lex $P51, "self"
    find_lex $P52, "self"
    getattribute $P53, $P52, "$!expecting"
    unless_null $P53, vivify_28
    new $P53, "Undef"
  vivify_28:
    $S54 = $P51."format_sig"($P53)
    concat $P55, $P50, $S54
# .annotate "line", 35
    .return ($P55)
  control_46:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P56, exception, "payload"
    .return ($P56)
.end


.namespace ["Matcher";"CallSig"]
.sub "format_sig"  :subid("17_1268929855.95444") :method :outer("11_1268929855.95444")
    .param pmc param_60
# .annotate "line", 39
    .const 'Sub' $P87 = "19_1268929855.95444" 
    capture_lex $P87
    .const 'Sub' $P75 = "18_1268929855.95444" 
    capture_lex $P75
    new $P59, 'ExceptionHandler'
    set_addr $P59, control_58
    $P59."handle_types"(58)
    push_eh $P59
    .lex "self", self
    .lex "$callsig", param_60
# .annotate "line", 40
    new $P61, "String"
    assign $P61, "CallSignature:{ "
    find_lex $P62, "self"
    find_lex $P63, "$callsig"
    $P64 = $P63."object"()
    $S65 = $P62."format_obj"($P64)
    concat $P66, $P61, $S65
    concat $P67, $P66, "."
# .annotate "line", 41
    find_lex $P68, "$callsig"
    $S69 = $P68."method"()
    concat $P70, $P67, $S69
    concat $P71, $P70, "( "
# .annotate "line", 42
    find_lex $P72, "$callsig"
    $P73 = $P72."positional"()
    .const 'Sub' $P75 = "18_1268929855.95444" 
    capture_lex $P75
    $P80 = $P73."map"($P75)
    $S81 = $P80."join"(", ")
    concat $P82, $P71, $S81
# .annotate "line", 43
    find_lex $P83, "$callsig"
    $P84 = $P83."named"()
    $P85 = $P84."keys"()
    .const 'Sub' $P87 = "19_1268929855.95444" 
    capture_lex $P87
    $P102 = $P85."map"($P87)
    $S103 = $P102."join"(", ")
    concat $P104, $P82, $S103
    concat $P105, $P104, " ) }"
# .annotate "line", 39
    .return ($P105)
  control_58:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["Matcher";"CallSig"]
.sub "_block74"  :anon :subid("18_1268929855.95444") :outer("17_1268929855.95444")
    .param pmc param_76
# .annotate "line", 42
    .lex "$obj", param_76
    find_lex $P77, "self"
    find_lex $P78, "$obj"
    $P79 = $P77."format_obj"($P78)
    .return ($P79)
.end


.namespace ["Matcher";"CallSig"]
.sub "_block86"  :anon :subid("19_1268929855.95444") :outer("17_1268929855.95444")
    .param pmc param_88
# .annotate "line", 43
    .lex "$key", param_88
    new $P89, 'String'
    set $P89, ":"
    find_lex $P90, "$key"
    concat $P91, $P89, $P90
    concat $P92, $P91, "("
    find_lex $P93, "self"
    find_lex $P94, "$key"
    find_lex $P95, "self"
    getattribute $P96, $P95, "$!expecting"
    unless_null $P96, vivify_29
    new $P96, "Undef"
  vivify_29:
    $P97 = $P96."named"()
    set $P98, $P97[$P94]
    unless_null $P98, vivify_30
    new $P98, "Undef"
  vivify_30:
    $S99 = $P93."format_obj"($P98)
    concat $P100, $P92, $S99
    concat $P101, $P100, ")"
    .return ($P101)
.end


.namespace ["Matcher";"CallSig"]
.sub "format_obj"  :subid("20_1268929855.95444") :method :outer("11_1268929855.95444")
    .param pmc param_110
# .annotate "line", 47
    new $P109, 'ExceptionHandler'
    set_addr $P109, control_108
    $P109."handle_types"(58)
    push_eh $P109
    .lex "self", self
    .lex "$obj", param_110
# .annotate "line", 48
    find_lex $P113, "$obj"
    new $P114, "String"
    assign $P114, "String"
    set $S115, $P114
    isa $I116, $P113, $S115
    if $I116, if_112
# .annotate "line", 51
    find_lex $P125, "$obj"
    new $P126, "String"
    assign $P126, "Float"
    set $S127, $P126
    isa $I128, $P125, $S127
    unless $I128, unless_124
    new $P123, 'Integer'
    set $P123, $I128
    goto unless_124_end
  unless_124:
    find_lex $P129, "$obj"
    new $P130, "String"
    assign $P130, "Integer"
    set $S131, $P130
    isa $I132, $P129, $S131
    new $P123, 'Integer'
    set $P123, $I132
  unless_124_end:
    if $P123, if_122
# .annotate "line", 55
    new $P136, "String"
    assign $P136, "["
    get_hll_global $P137, ["Opcode"], "typeof"
    find_lex $P138, "$obj"
    $S139 = $P137($P138)
    concat $P140, $P136, $S139
    concat $P141, $P140, "@"
    get_hll_global $P142, ["Opcode"], "get_addr"
    find_lex $P143, "$obj"
    $S144 = $P142($P143)
    concat $P145, $P141, $S144
    concat $P146, $P145, "]"
# .annotate "line", 54
    set $P121, $P146
# .annotate "line", 51
    goto if_122_end
  if_122:
# .annotate "line", 52
    find_lex $P133, "$obj"
    set $S134, $P133
    new $P135, 'String'
    set $P135, $S134
# .annotate "line", 51
    set $P121, $P135
  if_122_end:
    set $P111, $P121
# .annotate "line", 48
    goto if_112_end
  if_112:
    new $P117, 'String'
    set $P117, "String:'"
    find_lex $P118, "$obj"
    concat $P119, $P117, $P118
    concat $P120, $P119, "'"
    set $P111, $P120
  if_112_end:
# .annotate "line", 47
    .return ($P111)
  control_108:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P147, exception, "payload"
    .return ($P147)
.end


.namespace ["Matcher";"CallSig"]
.sub "matches"  :subid("21_1268929855.95444") :method :outer("11_1268929855.95444")
    .param pmc param_151
# .annotate "line", 59
    new $P150, 'ExceptionHandler'
    set_addr $P150, control_149
    $P150."handle_types"(58)
    push_eh $P150
    .lex "self", self
    .lex "$actual", param_151
# .annotate "line", 60
    find_lex $P154, "self"
    getattribute $P155, $P154, "$!expecting"
    unless_null $P155, vivify_31
    new $P155, "Undef"
  vivify_31:
    $P156 = $P155."defined"()
    isfalse $I157, $P156
    unless $I157, unless_153
    new $P152, 'Integer'
    set $P152, $I157
    goto unless_153_end
  unless_153:
# .annotate "line", 61
    find_lex $P164, "self"
    find_lex $P165, "$actual"
    $P166 = $P164."method_matches"($P165)
    if $P166, if_163
    set $P162, $P166
    goto if_163_end
  if_163:
# .annotate "line", 62
    find_lex $P167, "self"
    find_lex $P168, "$actual"
    $P169 = $P167."object_matches"($P168)
    set $P162, $P169
  if_163_end:
    if $P162, if_161
    set $P160, $P162
    goto if_161_end
  if_161:
# .annotate "line", 63
    find_lex $P170, "self"
    find_lex $P171, "$actual"
    $P172 = $P170."positionals_match"($P171)
    set $P160, $P172
  if_161_end:
    if $P160, if_159
    set $P158, $P160
    goto if_159_end
  if_159:
# .annotate "line", 64
    find_lex $P173, "self"
    find_lex $P174, "$actual"
    $P175 = $P173."named_match"($P174)
    set $P158, $P175
  if_159_end:
    set $P152, $P158
  unless_153_end:
# .annotate "line", 59
    .return ($P152)
  control_149:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P176, exception, "payload"
    .return ($P176)
.end


.namespace ["Matcher";"CallSig"]
.sub "method_matches"  :subid("22_1268929855.95444") :method :outer("11_1268929855.95444")
    .param pmc param_180
# .annotate "line", 67
    new $P179, 'ExceptionHandler'
    set_addr $P179, control_178
    $P179."handle_types"(58)
    push_eh $P179
    .lex "self", self
    .lex "$actual", param_180
# .annotate "line", 68
    find_lex $P183, "self"
    getattribute $P184, $P183, "$!expecting"
    unless_null $P184, vivify_32
    new $P184, "Undef"
  vivify_32:
    $S185 = $P184."method"()
    find_lex $P186, "$actual"
    $S187 = $P186."method"()
    iseq $I188, $S185, $S187
    unless $I188, unless_182
    new $P181, 'Integer'
    set $P181, $I188
    goto unless_182_end
  unless_182:
# .annotate "line", 69
    find_lex $P189, "self"
    getattribute $P190, $P189, "$!expecting"
    unless_null $P190, vivify_33
    new $P190, "Undef"
  vivify_33:
    $P191 = $P190."method"()
    $P192 = "ANY"()
    issame $I193, $P191, $P192
    new $P181, 'Integer'
    set $P181, $I193
  unless_182_end:
# .annotate "line", 67
    .return ($P181)
  control_178:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P194, exception, "payload"
    .return ($P194)
.end


.namespace ["Matcher";"CallSig"]
.sub "named_match"  :subid("23_1268929855.95444") :method :outer("11_1268929855.95444")
    .param pmc param_198
# .annotate "line", 72
    .const 'Sub' $P209 = "24_1268929855.95444" 
    capture_lex $P209
    new $P197, 'ExceptionHandler'
    set_addr $P197, control_196
    $P197."handle_types"(58)
    push_eh $P197
    .lex "self", self
    .lex "$actual", param_198
# .annotate "line", 73
    $P199 = root_new ['parrot';'Hash']
    .lex "%act", $P199
    find_lex $P200, "$actual"
    $P201 = $P200."named"()
    store_lex "%act", $P201
# .annotate "line", 75
    find_lex $P203, "self"
    getattribute $P204, $P203, "$!expecting"
    unless_null $P204, vivify_34
    new $P204, "Undef"
  vivify_34:
    $P205 = $P204."named"()
    defined $I206, $P205
    unless $I206, for_undef_35
    iter $P202, $P205
    new $P235, 'ExceptionHandler'
    set_addr $P235, loop234_handler
    $P235."handle_types"(65, 67, 66)
    push_eh $P235
  loop234_test:
    unless $P202, loop234_done
    shift $P207, $P202
  loop234_redo:
    .const 'Sub' $P209 = "24_1268929855.95444" 
    capture_lex $P209
    $P209($P207)
  loop234_next:
    goto loop234_test
  loop234_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P236, exception, 'type'
    eq $P236, 65, loop234_next
    eq $P236, 67, loop234_redo
  loop234_done:
    pop_eh 
  for_undef_35:
# .annotate "line", 72
    .return (1)
  control_196:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P237, exception, "payload"
    .return ($P237)
.end


.namespace ["Matcher";"CallSig"]
.sub "_block208"  :anon :subid("24_1268929855.95444") :outer("23_1268929855.95444")
    .param pmc param_210
# .annotate "line", 75
    .lex "$exp", param_210
# .annotate "line", 76
    find_lex $P215, "%act"
    find_lex $P216, "$exp"
    $P217 = $P216."key"()
    $P218 = $P215."contains"($P217)
    if $P218, if_214
    set $P213, $P218
    goto if_214_end
  if_214:
# .annotate "line", 77
    find_lex $P221, "$exp"
    $P222 = $P221."value"()
    $P223 = "ANY"()
    issame $I224, $P222, $P223
    unless $I224, unless_220
    new $P219, 'Integer'
    set $P219, $I224
    goto unless_220_end
  unless_220:
# .annotate "line", 78
    find_lex $P225, "$exp"
    $P226 = $P225."value"()
    find_lex $P227, "$exp"
    $P228 = $P227."key"()
    find_lex $P229, "%act"
    unless_null $P229, vivify_36
    $P229 = root_new ['parrot';'Hash']
  vivify_36:
    set $P230, $P229[$P228]
    unless_null $P230, vivify_37
    new $P230, "Undef"
  vivify_37:
    iseq $I231, $P226, $P230
    new $P219, 'Integer'
    set $P219, $I231
  unless_220_end:
    set $P213, $P219
  if_214_end:
# .annotate "line", 77
    unless $P213, unless_212
    set $P211, $P213
    goto unless_212_end
  unless_212:
# .annotate "line", 79
    new $P232, "Exception"
    set $P232['type'], 58
    new $P233, "Integer"
    assign $P233, 0
    setattribute $P232, 'payload', $P233
    throw $P232
  unless_212_end:
# .annotate "line", 75
    .return ($P211)
.end


.namespace ["Matcher";"CallSig"]
.sub "object_matches"  :subid("25_1268929855.95444") :method :outer("11_1268929855.95444")
    .param pmc param_241
# .annotate "line", 86
    new $P240, 'ExceptionHandler'
    set_addr $P240, control_239
    $P240."handle_types"(58)
    push_eh $P240
    .lex "self", self
    .lex "$actual", param_241
# .annotate "line", 87
    find_lex $P244, "self"
    getattribute $P245, $P244, "$!expecting"
    unless_null $P245, vivify_38
    new $P245, "Undef"
  vivify_38:
    $P246 = $P245."object"()
    find_lex $P247, "$actual"
    $P248 = $P247."object"()
    issame $I249, $P246, $P248
    unless $I249, unless_243
    new $P242, 'Integer'
    set $P242, $I249
    goto unless_243_end
  unless_243:
# .annotate "line", 88
    find_lex $P250, "self"
    getattribute $P251, $P250, "$!expecting"
    unless_null $P251, vivify_39
    new $P251, "Undef"
  vivify_39:
    $P252 = $P251."object"()
    $P253 = "ANY"()
    issame $I254, $P252, $P253
    new $P242, 'Integer'
    set $P242, $I254
  unless_243_end:
# .annotate "line", 86
    .return ($P242)
  control_239:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P255, exception, "payload"
    .return ($P255)
.end


.namespace ["Matcher";"CallSig"]
.sub "positionals_match"  :subid("26_1268929855.95444") :method :outer("11_1268929855.95444")
    .param pmc param_259
# .annotate "line", 91
    new $P258, 'ExceptionHandler'
    set_addr $P258, control_257
    $P258."handle_types"(58)
    push_eh $P258
    .lex "self", self
    .lex "$actual", param_259
# .annotate "line", 92
    new $P260, "Undef"
    .lex "$count", $P260
# .annotate "line", 93
    new $P261, "Undef"
    .lex "$num_expecting", $P261
# .annotate "line", 94
    $P262 = root_new ['parrot';'ResizablePMCArray']
    .lex "@wanted", $P262
# .annotate "line", 95
    $P263 = root_new ['parrot';'ResizablePMCArray']
    .lex "@got", $P263
# .annotate "line", 92
    new $P264, "Integer"
    assign $P264, 0
    store_lex "$count", $P264
# .annotate "line", 93
    find_lex $P265, "self"
    getattribute $P266, $P265, "$!expecting"
    unless_null $P266, vivify_40
    new $P266, "Undef"
  vivify_40:
    $P267 = $P266."positional"()
    store_lex "$num_expecting", $P267
# .annotate "line", 94
    find_lex $P268, "self"
    getattribute $P269, $P268, "$!expecting"
    unless_null $P269, vivify_41
    new $P269, "Undef"
  vivify_41:
    $P270 = $P269."positional"()
    store_lex "@wanted", $P270
# .annotate "line", 95
    find_lex $P271, "$actual"
    $P272 = $P271."positional"()
    store_lex "@got", $P272
# .annotate "line", 97
    new $P329, 'ExceptionHandler'
    set_addr $P329, loop328_handler
    $P329."handle_types"(65, 67, 66)
    push_eh $P329
  loop328_test:
    find_lex $P273, "$count"
    set $N274, $P273
    find_lex $P275, "$num_expecting"
    set $N276, $P275
    islt $I277, $N274, $N276
    unless $I277, loop328_done
  loop328_redo:
# .annotate "line", 98
    find_lex $P279, "$count"
    set $I280, $P279
    find_lex $P281, "@wanted"
    unless_null $P281, vivify_42
    $P281 = root_new ['parrot';'ResizablePMCArray']
  vivify_42:
    set $P282, $P281[$I280]
    unless_null $P282, vivify_43
    new $P282, "Undef"
  vivify_43:
    $P283 = "ETC"()
    issame $I284, $P282, $P283
    unless $I284, if_278_end
    new $P285, "Exception"
    set $P285['type'], 58
    new $P286, "Integer"
    assign $P286, 1
    setattribute $P285, 'payload', $P286
    throw $P285
  if_278_end:
# .annotate "line", 99
    find_lex $P288, "$count"
    set $N289, $P288
    find_lex $P290, "@got"
    set $N291, $P290
    iseq $I292, $N289, $N291
    unless $I292, if_287_end
    new $P293, "Exception"
    set $P293['type'], 58
    new $P294, "Integer"
    assign $P294, 0
    setattribute $P293, 'payload', $P294
    throw $P293
  if_287_end:
# .annotate "line", 101
    find_lex $P300, "$count"
    set $I301, $P300
    find_lex $P302, "@wanted"
    unless_null $P302, vivify_44
    $P302 = root_new ['parrot';'ResizablePMCArray']
  vivify_44:
    set $P303, $P302[$I301]
    unless_null $P303, vivify_45
    new $P303, "Undef"
  vivify_45:
    $P304 = "ANY"()
    issame $I305, $P303, $P304
    unless $I305, unless_299
    new $P298, 'Integer'
    set $P298, $I305
    goto unless_299_end
  unless_299:
# .annotate "line", 102
    find_lex $P306, "$count"
    set $I307, $P306
    find_lex $P308, "@wanted"
    unless_null $P308, vivify_46
    $P308 = root_new ['parrot';'ResizablePMCArray']
  vivify_46:
    set $P309, $P308[$I307]
    unless_null $P309, vivify_47
    new $P309, "Undef"
  vivify_47:
    find_lex $P310, "$count"
    set $I311, $P310
    find_lex $P312, "@got"
    unless_null $P312, vivify_48
    $P312 = root_new ['parrot';'ResizablePMCArray']
  vivify_48:
    set $P313, $P312[$I311]
    unless_null $P313, vivify_49
    new $P313, "Undef"
  vivify_49:
    issame $I314, $P309, $P313
    new $P298, 'Integer'
    set $P298, $I314
  unless_299_end:
    unless $P298, unless_297
    set $P296, $P298
    goto unless_297_end
  unless_297:
# .annotate "line", 103
    find_lex $P315, "$count"
    set $I316, $P315
    find_lex $P317, "@wanted"
    unless_null $P317, vivify_50
    $P317 = root_new ['parrot';'ResizablePMCArray']
  vivify_50:
    set $P318, $P317[$I316]
    unless_null $P318, vivify_51
    new $P318, "Undef"
  vivify_51:
    find_lex $P319, "$count"
    set $I320, $P319
    find_lex $P321, "@got"
    unless_null $P321, vivify_52
    $P321 = root_new ['parrot';'ResizablePMCArray']
  vivify_52:
    set $P322, $P321[$I320]
    unless_null $P322, vivify_53
    new $P322, "Undef"
  vivify_53:
    iseq $I323, $P318, $P322
    new $P296, 'Integer'
    set $P296, $I323
  unless_297_end:
    if $P296, unless_295_end
# .annotate "line", 104
    new $P324, "Exception"
    set $P324['type'], 58
    new $P325, "Integer"
    assign $P325, 0
    setattribute $P324, 'payload', $P325
    throw $P324
  unless_295_end:
# .annotate "line", 101
    find_lex $P326, "$count"
    clone $P327, $P326
    inc $P326
  loop328_next:
# .annotate "line", 97
    goto loop328_test
  loop328_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P330, exception, 'type'
    eq $P330, 65, loop328_next
    eq $P330, 67, loop328_redo
  loop328_done:
    pop_eh 
# .annotate "line", 91
    .return (1)
  control_257:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P331, exception, "payload"
    .return ($P331)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929878.81479")
# .annotate "line", 0
    get_hll_global $P14, ["Matcher";"Factory"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Matcher";"Factory"], "_block13" 
    capture_lex $P14
    $P35 = $P14()
# .annotate "line", 1
    .return ($P35)
.end


.namespace ["Matcher";"Factory"]
.sub "_block13"  :subid("11_1268929878.81479") :outer("10_1268929878.81479")
# .annotate "line", 7
    .const 'Sub' $P19 = "13_1268929878.81479" 
    capture_lex $P19
    .const 'Sub' $P15 = "12_1268929878.81479" 
    capture_lex $P15
# .annotate "line", 11
    .const 'Sub' $P15 = "12_1268929878.81479" 
    capture_lex $P15
    .lex "_initload", $P15
# .annotate "line", 22
    .const 'Sub' $P19 = "13_1268929878.81479" 
    capture_lex $P19
    .lex "export_sub", $P19
# .annotate "line", 7
    find_lex $P32, "_initload"
    find_lex $P33, "export_sub"
    .return ($P33)
.end


.namespace ["Matcher";"Factory"]
.sub "" :load :init :subid("post14") :outer("11_1268929878.81479")
# .annotate "line", 7
    get_hll_global $P14, ["Matcher";"Factory"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 8
    get_hll_global $P34, ["Kakapo"], "depends_on"
    $P34("Matcher")
.end


.namespace ["Matcher";"Factory"]
.sub "_initload"  :subid("12_1268929878.81479") :outer("11_1268929878.81479")
# .annotate "line", 11
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


.namespace ["Matcher";"Factory"]
.sub "export_sub"  :subid("13_1268929878.81479") :outer("11_1268929878.81479")
    .param pmc param_22
    .param pmc param_23 :optional :named("as")
    .param int has_param_23 :opt_flag
    .param pmc param_25 :optional :named("tags")
    .param int has_param_25 :opt_flag
# .annotate "line", 22
    new $P21, 'ExceptionHandler'
    set_addr $P21, control_20
    $P21."handle_types"(58)
    push_eh $P21
    .lex "$sub", param_22
    if has_param_23, optparam_15
    new $P24, "Undef"
    set param_23, $P24
  optparam_15:
    .lex "$as", param_23
    if has_param_25, optparam_16
    new $P26, "String"
    assign $P26, "DEFAULT"
    set param_25, $P26
  optparam_16:
    .lex "$tags", param_25
# .annotate "line", 23
    find_lex $P27, "$sub"
    find_lex $P28, "$as"
    find_lex $P29, "$tags"
    $P30 = "export"($P27, $P28 :named("as"), $P29 :named("tags"))
# .annotate "line", 22
    .return ($P30)
  control_20:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P31, exception, "payload"
    .return ($P31)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929833.81411")
# .annotate "line", 0
    get_hll_global $P14, ["Matcher";"InstanceOf"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Matcher";"InstanceOf"], "_block13" 
    capture_lex $P14
    $P102 = $P14()
# .annotate "line", 1
    .return ($P102)
.end


.namespace ["Matcher";"InstanceOf"]
.sub "_block13"  :subid("11_1268929833.81411") :outer("10_1268929833.81411")
# .annotate "line", 7
    .const 'Sub' $P80 = "17_1268929833.81411" 
    capture_lex $P80
    .const 'Sub' $P66 = "16_1268929833.81411" 
    capture_lex $P66
    .const 'Sub' $P53 = "15_1268929833.81411" 
    capture_lex $P53
    .const 'Sub' $P36 = "14_1268929833.81411" 
    capture_lex $P36
    .const 'Sub' $P23 = "13_1268929833.81411" 
    capture_lex $P23
    .const 'Sub' $P15 = "12_1268929833.81411" 
    capture_lex $P15
# .annotate "line", 13
    .const 'Sub' $P15 = "12_1268929833.81411" 
    capture_lex $P15
    .lex "_initload", $P15
# .annotate "line", 31
    .const 'Sub' $P23 = "13_1268929833.81411" 
    capture_lex $P23
    .lex "factory", $P23
# .annotate "line", 9
    find_lex $P35, "_initload"
# .annotate "line", 27
    find_lex $P65, "factory"
# .annotate "line", 41
    .const 'Sub' $P80 = "17_1268929833.81411" 
    capture_lex $P80
# .annotate "line", 7
    .return ($P80)
.end


.namespace ["Matcher";"InstanceOf"]
.sub "" :load :init :subid("post18") :outer("11_1268929833.81411")
# .annotate "line", 7
    get_hll_global $P14, ["Matcher";"InstanceOf"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 10
    get_hll_global $P101, ["Kakapo"], "depends_on"
    $P101("Matcher")
.end


.namespace ["Matcher";"InstanceOf"]
.sub "_initload"  :subid("12_1268929833.81411") :outer("11_1268929833.81411")
# .annotate "line", 13
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 14
    get_hll_global $P18, "Matcher"
    "extends"($P18)
# .annotate "line", 15
    "has"("$!type_name")
# .annotate "line", 17
    get_hll_global $P19, ["Matcher";"Factory"], "export_sub"
    get_hll_global $P20, ["Matcher";"InstanceOf"], "factory"
    $P21 = $P19($P20, "instance_of" :named("as"))
# .annotate "line", 13
    .return ($P21)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P22, exception, "payload"
    .return ($P22)
.end


.namespace ["Matcher";"InstanceOf"]
.sub "factory"  :subid("13_1268929833.81411") :outer("11_1268929833.81411")
    .param pmc param_26
    .param pmc param_27 :slurpy :named
# .annotate "line", 31
    new $P25, 'ExceptionHandler'
    set_addr $P25, control_24
    $P25."handle_types"(58)
    push_eh $P25
    .lex "$type", param_26
    .lex "%named", param_27
# .annotate "line", 33
    new $P28, "Undef"
    .lex "$matcher", $P28
# .annotate "line", 32
    find_lex $P29, "$type"
    find_lex $P30, "%named"
    unless_null $P30, vivify_19
    $P30 = root_new ['parrot';'Hash']
    store_lex "%named", $P30
  vivify_19:
    set $P30["type"], $P29
# .annotate "line", 33
    get_hll_global $P31, ["Matcher"], "InstanceOf"
    find_lex $P32, "%named"
    $P33 = $P31."new"($P32 :flat)
    store_lex "$matcher", $P33
# .annotate "line", 31
    .return ($P33)
  control_24:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P34, exception, "payload"
    .return ($P34)
.end


.namespace ["Matcher";"InstanceOf"]
.sub "describe_failure"  :subid("14_1268929833.81411") :method :outer("11_1268929833.81411")
    .param pmc param_39
    .param pmc param_40
# .annotate "line", 20
    new $P38, 'ExceptionHandler'
    set_addr $P38, control_37
    $P38."handle_types"(58)
    push_eh $P38
    .lex "self", self
    .lex "$item", param_39
    .lex "$description", param_40
# .annotate "line", 22
    find_lex $P41, "$description"
    find_lex $P44, "$item"
    $P45 = "is_null"($P44)
    if $P45, if_43
# .annotate "line", 24
    new $P46, "String"
    assign $P46, "had type: "
    get_hll_global $P47, ["Opcode"], "typeof"
    find_lex $P48, "$item"
    $S49 = $P47($P48)
    concat $P50, $P46, $S49
    set $S42, $P50
# .annotate "line", 22
    goto if_43_end
  if_43:
    set $S42, "was null"
  if_43_end:
# .annotate "line", 23
    concat $P51, $P41, $S42
# .annotate "line", 20
    .return ($P51)
  control_37:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P52, exception, "payload"
    .return ($P52)
.end


.namespace ["Matcher";"InstanceOf"]
.sub "describe_self"  :subid("15_1268929833.81411") :method :outer("11_1268929833.81411")
    .param pmc param_56
# .annotate "line", 27
    new $P55, 'ExceptionHandler'
    set_addr $P55, control_54
    $P55."handle_types"(58)
    push_eh $P55
    .lex "self", self
    .lex "$description", param_56
# .annotate "line", 28
    find_lex $P57, "$description"
    new $P58, 'String'
    set $P58, "an instance of type '"
    find_lex $P59, "self"
    getattribute $P60, $P59, "$!type_name"
    unless_null $P60, vivify_20
    new $P60, "Undef"
  vivify_20:
    concat $P61, $P58, $P60
    concat $P62, $P61, "'"
    concat $P63, $P57, $P62
# .annotate "line", 27
    .return ($P63)
  control_54:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P64, exception, "payload"
    .return ($P64)
.end


.namespace ["Matcher";"InstanceOf"]
.sub "matches"  :subid("16_1268929833.81411") :method :outer("11_1268929833.81411")
    .param pmc param_69
# .annotate "line", 36
    new $P68, 'ExceptionHandler'
    set_addr $P68, control_67
    $P68."handle_types"(58)
    push_eh $P68
    .lex "self", self
    .lex "$item", param_69
# .annotate "line", 37
    find_lex $P72, "$item"
    $P73 = "is_null"($P72)
    isfalse $I74, $P73
    if $I74, if_71
    new $P70, 'Integer'
    set $P70, $I74
    goto if_71_end
  if_71:
# .annotate "line", 38
    find_lex $P75, "$item"
    find_lex $P76, "self"
    getattribute $P77, $P76, "$!type_name"
    unless_null $P77, vivify_21
    new $P77, "Undef"
  vivify_21:
    isa $I78, $P75, $P77
    new $P70, 'Integer'
    set $P70, $I78
  if_71_end:
# .annotate "line", 36
    .return ($P70)
  control_67:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P79, exception, "payload"
    .return ($P79)
.end


.namespace ["Matcher";"InstanceOf"]
.sub "type"  :subid("17_1268929833.81411") :method :outer("11_1268929833.81411")
    .param pmc param_83 :optional
    .param int has_param_83 :opt_flag
# .annotate "line", 41
    new $P82, 'ExceptionHandler'
    set_addr $P82, control_81
    $P82."handle_types"(58)
    push_eh $P82
    .lex "self", self
    if has_param_83, optparam_22
    new $P84, "Undef"
    set param_83, $P84
  optparam_22:
    .lex "$value", param_83
# .annotate "line", 42
    find_lex $P87, "$value"
    if $P87, if_86
# .annotate "line", 48
    find_lex $P98, "self"
    getattribute $P99, $P98, "$!type_name"
    unless_null $P99, vivify_23
    new $P99, "Undef"
  vivify_23:
    set $P85, $P99
# .annotate "line", 42
    goto if_86_end
  if_86:
# .annotate "line", 43
    find_lex $P90, "$value"
    $P91 = $P90."isa"("String")
    if $P91, if_89
# .annotate "line", 45
    find_lex $P93, "$value"
    $P94 = $P93."get_namespace"()
    $P95 = $P94."string_name"()
    set $P88, $P95
# .annotate "line", 43
    goto if_89_end
  if_89:
    find_lex $P92, "$value"
    set $P88, $P92
  if_89_end:
# .annotate "line", 44
    find_lex $P96, "self"
    setattribute $P96, "$!type_name", $P88
# .annotate "line", 43
    find_lex $P97, "self"
# .annotate "line", 42
    set $P85, $P97
  if_86_end:
# .annotate "line", 41
    .return ($P85)
  control_81:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929858.60448")
# .annotate "line", 0
    get_hll_global $P14, ["Matcher"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["Matcher"], "_block13" 
    capture_lex $P14
    $P42 = $P14()
# .annotate "line", 1
    .return ($P42)
.end


.namespace []
.sub "" :load :init :subid("post15") :outer("10_1268929858.60448")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268929858.60448" 
    .local pmc block
    set block, $P12
    $P43 = get_root_global ["parrot"], "P6metaclass"
    $P43."new_class"("Matcher")
.end


.namespace ["Matcher"]
.sub "_block13"  :subid("11_1268929858.60448") :outer("10_1268929858.60448")
# .annotate "line", 6
    .const 'Sub' $P34 = "14_1268929858.60448" 
    capture_lex $P34
    .const 'Sub' $P27 = "13_1268929858.60448" 
    capture_lex $P27
    .const 'Sub' $P15 = "12_1268929858.60448" 
    capture_lex $P15
# .annotate "line", 20
    .const 'Sub' $P34 = "14_1268929858.60448" 
    capture_lex $P34
# .annotate "line", 6
    .return ($P34)
.end


.namespace ["Matcher"]
.sub "" :load :init :subid("post16") :outer("11_1268929858.60448")
# .annotate "line", 6
    get_hll_global $P14, ["Matcher"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 8
    get_hll_global $P41, ["Kakapo"], "initload_done"
    $P41()
.end


.namespace ["Matcher"]
.sub "describe_failure"  :subid("12_1268929858.60448") :method :outer("11_1268929858.60448")
    .param pmc param_18
    .param pmc param_19
# .annotate "line", 13
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
    .lex "$previous", param_18
    .lex "$item", param_19
# .annotate "line", 14
    find_lex $P20, "$previous"
    new $P21, 'String'
    set $P21, "was '"
    find_lex $P22, "$item"
    concat $P23, $P21, $P22
    concat $P24, $P23, "'"
    concat $P25, $P20, $P24
# .annotate "line", 13
    .return ($P25)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P26, exception, "payload"
    .return ($P26)
.end


.namespace ["Matcher"]
.sub "describe_self"  :subid("13_1268929858.60448") :method :outer("11_1268929858.60448")
    .param pmc param_30
# .annotate "line", 19
    new $P29, 'ExceptionHandler'
    set_addr $P29, control_28
    $P29."handle_types"(58)
    push_eh $P29
    .lex "self", self
    .lex "$previous", param_30
    find_lex $P31, "self"
    $P32 = $P31."__ABSTRACT__"()
    .return ($P32)
  control_28:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P33, exception, "payload"
    .return ($P33)
.end


.namespace ["Matcher"]
.sub "matches"  :subid("14_1268929858.60448") :method :outer("11_1268929858.60448")
    .param pmc param_37
# .annotate "line", 20
    new $P36, 'ExceptionHandler'
    set_addr $P36, control_35
    $P36."handle_types"(58)
    push_eh $P36
    .lex "self", self
    .lex "$item", param_37
    find_lex $P38, "self"
    $P39 = $P38."__ABSTRACT__"()
    .return ($P39)
  control_35:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P40, exception, "payload"
    .return ($P40)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929916.47536")
# .annotate "line", 0
    get_hll_global $P14, ["Matcher";"Not"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Matcher";"Not"], "_block13" 
    capture_lex $P14
    $P103 = $P14()
# .annotate "line", 1
    .return ($P103)
.end


.namespace ["Matcher";"Not"]
.sub "_block13"  :subid("11_1268929916.47536") :outer("10_1268929916.47536")
# .annotate "line", 7
    .const 'Sub' $P92 = "20_1268929916.47536" 
    capture_lex $P92
    .const 'Sub' $P82 = "19_1268929916.47536" 
    capture_lex $P82
    .const 'Sub' $P67 = "18_1268929916.47536" 
    capture_lex $P67
    .const 'Sub' $P56 = "17_1268929916.47536" 
    capture_lex $P56
    .const 'Sub' $P46 = "16_1268929916.47536" 
    capture_lex $P46
    .const 'Sub' $P38 = "15_1268929916.47536" 
    capture_lex $P38
    .const 'Sub' $P29 = "14_1268929916.47536" 
    capture_lex $P29
    .const 'Sub' $P20 = "13_1268929916.47536" 
    capture_lex $P20
    .const 'Sub' $P15 = "12_1268929916.47536" 
    capture_lex $P15
# .annotate "line", 13
    .const 'Sub' $P15 = "12_1268929916.47536" 
    capture_lex $P15
    .lex "_initload", $P15
# .annotate "line", 33
    .const 'Sub' $P20 = "13_1268929916.47536" 
    capture_lex $P20
    .lex "_factory_Float", $P20
# .annotate "line", 34
    .const 'Sub' $P29 = "14_1268929916.47536" 
    capture_lex $P29
    .lex "_factory_Integer", $P29
# .annotate "line", 35
    .const 'Sub' $P38 = "15_1268929916.47536" 
    capture_lex $P38
    .lex "_factory_Matcher", $P38
# .annotate "line", 36
    .const 'Sub' $P46 = "16_1268929916.47536" 
    capture_lex $P46
    .lex "_factory_String", $P46
# .annotate "line", 9
    find_lex $P55, "_initload"
# .annotate "line", 29
    find_lex $P78, "_factory_Float"
    find_lex $P79, "_factory_Integer"
    find_lex $P80, "_factory_Matcher"
    find_lex $P81, "_factory_String"
# .annotate "line", 43
    .const 'Sub' $P92 = "20_1268929916.47536" 
    capture_lex $P92
# .annotate "line", 7
    .return ($P92)
.end


.namespace ["Matcher";"Not"]
.sub "" :load :init :subid("post21") :outer("11_1268929916.47536")
# .annotate "line", 7
    get_hll_global $P14, ["Matcher";"Not"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 10
    get_hll_global $P102, ["Kakapo"], "depends_on"
    $P102("Matcher")
.end


.namespace ["Matcher";"Not"]
.sub "_initload"  :subid("12_1268929916.47536") :outer("11_1268929916.47536")
# .annotate "line", 13
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 14
    "extends"("Matcher")
# .annotate "line", 16
    $P18 = "has"("$!child")
# .annotate "line", 13
    .return ($P18)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P19, exception, "payload"
    .return ($P19)
.end


.namespace ["Matcher";"Not"]
.sub "_factory_Float"  :subid("13_1268929916.47536") :outer("11_1268929916.47536")
    .param pmc param_23
# .annotate "line", 33
    new $P22, 'ExceptionHandler'
    set_addr $P22, control_21
    $P22."handle_types"(58)
    push_eh $P22
    .lex "$value", param_23
    get_hll_global $P24, ["Matcher";"factory"], "is"
    find_lex $P25, "$value"
    $P26 = $P24($P25)
    $P27 = "factory"($P26)
    .return ($P27)
  control_21:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P28, exception, "payload"
    .return ($P28)
.end


.namespace ["Matcher";"Not"]
.sub "_factory_Integer"  :subid("14_1268929916.47536") :outer("11_1268929916.47536")
    .param pmc param_32
# .annotate "line", 34
    new $P31, 'ExceptionHandler'
    set_addr $P31, control_30
    $P31."handle_types"(58)
    push_eh $P31
    .lex "$value", param_32
    get_hll_global $P33, ["Matcher";"factory"], "is"
    find_lex $P34, "$value"
    $P35 = $P33($P34)
    $P36 = "factory"($P35)
    .return ($P36)
  control_30:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P37, exception, "payload"
    .return ($P37)
.end


.namespace ["Matcher";"Not"]
.sub "_factory_Matcher"  :subid("15_1268929916.47536") :outer("11_1268929916.47536")
    .param pmc param_41
# .annotate "line", 35
    new $P40, 'ExceptionHandler'
    set_addr $P40, control_39
    $P40."handle_types"(58)
    push_eh $P40
    .lex "$matcher", param_41
    get_hll_global $P42, ["Matcher"], "Not"
    find_lex $P43, "$matcher"
    $P44 = $P42."new"($P43)
    .return ($P44)
  control_39:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P45, exception, "payload"
    .return ($P45)
.end


.namespace ["Matcher";"Not"]
.sub "_factory_String"  :subid("16_1268929916.47536") :outer("11_1268929916.47536")
    .param pmc param_49
# .annotate "line", 36
    new $P48, 'ExceptionHandler'
    set_addr $P48, control_47
    $P48."handle_types"(58)
    push_eh $P48
    .lex "$value", param_49
    get_hll_global $P50, ["Matcher";"factory"], "is"
    find_lex $P51, "$value"
    $P52 = $P50($P51)
    $P53 = "factory"($P52)
    .return ($P53)
  control_47:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P54, exception, "payload"
    .return ($P54)
.end


.namespace ["Matcher";"Not"]
.sub "describe_failure"  :subid("17_1268929916.47536") :method :outer("11_1268929916.47536")
    .param pmc param_59
    .param pmc param_60
# .annotate "line", 24
    new $P58, 'ExceptionHandler'
    set_addr $P58, control_57
    $P58."handle_types"(58)
    push_eh $P58
    .lex "self", self
    .lex "$item", param_59
    .lex "$description", param_60
# .annotate "line", 25
    find_lex $P61, "self"
    getattribute $P62, $P61, "$!child"
    unless_null $P62, vivify_22
    new $P62, "Undef"
  vivify_22:
    find_lex $P63, "$item"
    find_lex $P64, "$description"
    $P65 = $P62."describe_failure"($P63, $P64)
# .annotate "line", 24
    .return ($P65)
  control_57:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P66, exception, "payload"
    .return ($P66)
.end


.namespace ["Matcher";"Not"]
.sub "describe_self"  :subid("18_1268929916.47536") :method :outer("11_1268929916.47536")
    .param pmc param_70 :optional
    .param int has_param_70 :opt_flag
# .annotate "line", 29
    new $P69, 'ExceptionHandler'
    set_addr $P69, control_68
    $P69."handle_types"(58)
    push_eh $P69
    .lex "self", self
    if has_param_70, optparam_23
    new $P71, "String"
    assign $P71, ""
    set param_70, $P71
  optparam_23:
    .lex "$description", param_70
# .annotate "line", 30
    find_lex $P72, "self"
    getattribute $P73, $P72, "$!child"
    unless_null $P73, vivify_24
    new $P73, "Undef"
  vivify_24:
    find_lex $P74, "$description"
    concat $P75, $P74, "not "
    $P76 = $P73."describe_self"($P75)
# .annotate "line", 29
    .return ($P76)
  control_68:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P77, exception, "payload"
    .return ($P77)
.end


.namespace ["Matcher";"Not"]
.sub "_init_obj"  :subid("19_1268929916.47536") :method :outer("11_1268929916.47536")
    .param pmc param_85 :optional
    .param int has_param_85 :opt_flag
    .param pmc param_87 :slurpy :named
# .annotate "line", 38
    new $P84, 'ExceptionHandler'
    set_addr $P84, control_83
    $P84."handle_types"(58)
    push_eh $P84
    .lex "self", self
    if has_param_85, optparam_25
    new $P86, "Undef"
    set param_85, $P86
  optparam_25:
    .lex "$child", param_85
    .lex "%named", param_87
# .annotate "line", 39
    find_lex $P88, "$child"
    find_lex $P89, "self"
    setattribute $P89, "$!child", $P88
    find_lex $P90, "self"
# .annotate "line", 38
    .return ($P90)
  control_83:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P91, exception, "payload"
    .return ($P91)
.end


.namespace ["Matcher";"Not"]
.sub "matches"  :subid("20_1268929916.47536") :method :outer("11_1268929916.47536")
    .param pmc param_95
# .annotate "line", 43
    new $P94, 'ExceptionHandler'
    set_addr $P94, control_93
    $P94."handle_types"(58)
    push_eh $P94
    .lex "self", self
    .lex "$item", param_95
# .annotate "line", 44
    find_lex $P96, "self"
    getattribute $P97, $P96, "$!child"
    unless_null $P97, vivify_26
    new $P97, "Undef"
  vivify_26:
    find_lex $P98, "$item"
    $P99 = $P97."matches"($P98)
    isfalse $I100, $P99
# .annotate "line", 43
    .return ($I100)
  control_93:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929848.77434")
# .annotate "line", 0
    get_hll_global $P14, ["Matcher";"Null"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Matcher";"Null"], "_block13" 
    capture_lex $P14
    $P36 = $P14()
# .annotate "line", 1
    .return ($P36)
.end


.namespace ["Matcher";"Null"]
.sub "_block13"  :subid("11_1268929848.77434") :outer("10_1268929848.77434")
# .annotate "line", 7
    .const 'Sub' $P28 = "14_1268929848.77434" 
    capture_lex $P28
    .const 'Sub' $P21 = "13_1268929848.77434" 
    capture_lex $P21
    .const 'Sub' $P15 = "12_1268929848.77434" 
    capture_lex $P15
# .annotate "line", 11
    .const 'Sub' $P15 = "12_1268929848.77434" 
    capture_lex $P15
    .lex "_initload", $P15
# .annotate "line", 7
    find_lex $P20, "_initload"
# .annotate "line", 19
    .const 'Sub' $P28 = "14_1268929848.77434" 
    capture_lex $P28
# .annotate "line", 7
    .return ($P28)
.end


.namespace ["Matcher";"Null"]
.sub "" :load :init :subid("post15") :outer("11_1268929848.77434")
# .annotate "line", 7
    get_hll_global $P14, ["Matcher";"Null"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 8
    get_hll_global $P35, ["Kakapo"], "depends_on"
    $P35("Matcher")
.end


.namespace ["Matcher";"Null"]
.sub "_initload"  :subid("12_1268929848.77434") :outer("11_1268929848.77434")
# .annotate "line", 11
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 12
    $P18 = "extends"("Matcher")
# .annotate "line", 11
    .return ($P18)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P19, exception, "payload"
    .return ($P19)
.end


.namespace ["Matcher";"Null"]
.sub "describe_self"  :subid("13_1268929848.77434") :method :outer("11_1268929848.77434")
    .param pmc param_24
# .annotate "line", 15
    new $P23, 'ExceptionHandler'
    set_addr $P23, control_22
    $P23."handle_types"(58)
    push_eh $P23
    .lex "self", self
    .lex "$description", param_24
# .annotate "line", 16
    find_lex $P25, "$description"
    concat $P26, $P25, "a null value"
# .annotate "line", 15
    .return ($P26)
  control_22:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P27, exception, "payload"
    .return ($P27)
.end


.namespace ["Matcher";"Null"]
.sub "matches"  :subid("14_1268929848.77434") :method :outer("11_1268929848.77434")
    .param pmc param_31
# .annotate "line", 19
    new $P30, 'ExceptionHandler'
    set_addr $P30, control_29
    $P30."handle_types"(58)
    push_eh $P30
    .lex "self", self
    .lex "$subject", param_31
# .annotate "line", 20
    find_lex $P32, "$subject"
    isnull $I33, $P32
# .annotate "line", 19
    .return ($I33)
  control_29:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P34, exception, "payload"
    .return ($P34)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929920.47542")
# .annotate "line", 0
    get_hll_global $P14, ["Matcher";"PassFail"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Matcher";"PassFail"], "_block13" 
    capture_lex $P14
    $P74 = $P14()
# .annotate "line", 1
    .return ($P74)
.end


.namespace ["Matcher";"PassFail"]
.sub "_block13"  :subid("11_1268929920.47542") :outer("10_1268929920.47542")
# .annotate "line", 7
    .const 'Sub' $P65 = "18_1268929920.47542" 
    capture_lex $P65
    .const 'Sub' $P58 = "17_1268929920.47542" 
    capture_lex $P58
    .const 'Sub' $P51 = "16_1268929920.47542" 
    capture_lex $P51
    .const 'Sub' $P37 = "15_1268929920.47542" 
    capture_lex $P37
    .const 'Sub' $P30 = "14_1268929920.47542" 
    capture_lex $P30
    .const 'Sub' $P24 = "13_1268929920.47542" 
    capture_lex $P24
    .const 'Sub' $P15 = "12_1268929920.47542" 
    capture_lex $P15
# .annotate "line", 16
    .const 'Sub' $P15 = "12_1268929920.47542" 
    capture_lex $P15
    .lex "_initload", $P15
# .annotate "line", 30
    .const 'Sub' $P24 = "13_1268929920.47542" 
    capture_lex $P24
    .lex "factory_fail", $P24
# .annotate "line", 31
    .const 'Sub' $P30 = "14_1268929920.47542" 
    capture_lex $P30
    .lex "factory_pass", $P30
# .annotate "line", 9
    find_lex $P36, "_initload"
# .annotate "line", 24
    find_lex $P49, "factory_fail"
    find_lex $P50, "factory_pass"
# .annotate "line", 35
    .const 'Sub' $P65 = "18_1268929920.47542" 
    capture_lex $P65
# .annotate "line", 7
    .return ($P65)
.end


.namespace ["Matcher";"PassFail"]
.sub "" :load :init :subid("post19") :outer("11_1268929920.47542")
# .annotate "line", 7
    get_hll_global $P14, ["Matcher";"PassFail"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 10
    get_hll_global $P72, ["Kakapo"], "depends_on"
    new $P73, "ResizablePMCArray"
    push $P73, "Matcher"
    push $P73, "Matcher::Factory"
    $P72($P73 :flat)
.end


.namespace ["Matcher";"PassFail"]
.sub "_initload"  :subid("12_1268929920.47542") :outer("11_1268929920.47542")
# .annotate "line", 16
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 17
    "extends"("Matcher")
# .annotate "line", 18
    "has"("$!returning")
# .annotate "line", 20
    get_hll_global $P18, ["Matcher";"Factory"], "export_sub"
    get_hll_global $P19, ["Matcher";"PassFail"], "factory_fail"
    $P18($P19, "fail" :named("as"))
# .annotate "line", 21
    get_hll_global $P20, ["Matcher";"Factory"], "export_sub"
    get_hll_global $P21, ["Matcher";"PassFail"], "factory_pass"
    $P22 = $P20($P21, "pass" :named("as"))
# .annotate "line", 16
    .return ($P22)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P23, exception, "payload"
    .return ($P23)
.end


.namespace ["Matcher";"PassFail"]
.sub "factory_fail"  :subid("13_1268929920.47542") :outer("11_1268929920.47542")
# .annotate "line", 30
    new $P26, 'ExceptionHandler'
    set_addr $P26, control_25
    $P26."handle_types"(58)
    push_eh $P26
    get_hll_global $P27, ["Matcher"], "PassFail"
    $P28 = $P27."new"(1 :named("fail"))
    .return ($P28)
  control_25:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P29, exception, "payload"
    .return ($P29)
.end


.namespace ["Matcher";"PassFail"]
.sub "factory_pass"  :subid("14_1268929920.47542") :outer("11_1268929920.47542")
# .annotate "line", 31
    new $P32, 'ExceptionHandler'
    set_addr $P32, control_31
    $P32."handle_types"(58)
    push_eh $P32
    get_hll_global $P33, ["Matcher"], "PassFail"
    $P34 = $P33."new"(1 :named("pass"))
    .return ($P34)
  control_31:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P35, exception, "payload"
    .return ($P35)
.end


.namespace ["Matcher";"PassFail"]
.sub "describe_self"  :subid("15_1268929920.47542") :method :outer("11_1268929920.47542")
    .param pmc param_40 :optional
    .param int has_param_40 :opt_flag
# .annotate "line", 24
    new $P39, 'ExceptionHandler'
    set_addr $P39, control_38
    $P39."handle_types"(58)
    push_eh $P39
    .lex "self", self
    if has_param_40, optparam_20
    new $P41, "String"
    assign $P41, ""
    set param_40, $P41
  optparam_20:
    .lex "$previous", param_40
# .annotate "line", 25
    find_lex $P42, "$previous"
# .annotate "line", 26
    find_lex $P45, "self"
    getattribute $P46, $P45, "$!returning"
    unless_null $P46, vivify_21
    new $P46, "Undef"
  vivify_21:
    if $P46, if_44
    set $S43, "a \"fail,\" always"
    goto if_44_end
  if_44:
    set $S43, "a \"pass,\" always"
  if_44_end:
    concat $P47, $P42, $S43
# .annotate "line", 24
    .return ($P47)
  control_38:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P48, exception, "payload"
    .return ($P48)
.end


.namespace ["Matcher";"PassFail"]
.sub "matches"  :subid("16_1268929920.47542") :method :outer("11_1268929920.47542")
    .param pmc param_54
# .annotate "line", 32
    new $P53, 'ExceptionHandler'
    set_addr $P53, control_52
    $P53."handle_types"(58)
    push_eh $P53
    .lex "self", self
    .lex "$item", param_54
    find_lex $P55, "self"
    getattribute $P56, $P55, "$!returning"
    unless_null $P56, vivify_22
    new $P56, "Undef"
  vivify_22:
    .return ($P56)
  control_52:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P57, exception, "payload"
    .return ($P57)
.end


.namespace ["Matcher";"PassFail"]
.sub "pass"  :subid("17_1268929920.47542") :method :outer("11_1268929920.47542")
    .param pmc param_61
# .annotate "line", 34
    new $P60, 'ExceptionHandler'
    set_addr $P60, control_59
    $P60."handle_types"(58)
    push_eh $P60
    .lex "self", self
    .lex "$ignore", param_61
    new $P62, "Integer"
    assign $P62, 1
    find_lex $P63, "self"
    setattribute $P63, "$!returning", $P62
    .return ($P62)
  control_59:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P64, exception, "payload"
    .return ($P64)
.end


.namespace ["Matcher";"PassFail"]
.sub "fail"  :subid("18_1268929920.47542") :method :outer("11_1268929920.47542")
    .param pmc param_68
# .annotate "line", 35
    new $P67, 'ExceptionHandler'
    set_addr $P67, control_66
    $P67."handle_types"(58)
    push_eh $P67
    .lex "self", self
    .lex "$ignore", param_68
    new $P69, "Integer"
    assign $P69, 0
    find_lex $P70, "self"
    setattribute $P70, "$!returning", $P69
    .return ($P69)
  control_66:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P71, exception, "payload"
    .return ($P71)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929814.46382")
# .annotate "line", 0
    get_hll_global $P14, ["Path"], "_block13" 
    capture_lex $P14
# .annotate "line", 7
    get_hll_global $P14, ["Path"], "_block13" 
    capture_lex $P14
    $P336 = $P14()
# .annotate "line", 1
    .return ($P336)
.end


.namespace []
.sub "" :load :init :subid("post32") :outer("10_1268929814.46382")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268929814.46382" 
    .local pmc block
    set block, $P12
    $P337 = get_root_global ["parrot"], "P6metaclass"
    $P337."new_class"("Path")
.end


.namespace ["Path"]
.sub "_block13"  :subid("11_1268929814.46382") :outer("10_1268929814.46382")
# .annotate "line", 7
    .const 'Sub' $P328 = "31_1268929814.46382" 
    capture_lex $P328
    get_hll_global $P49, ["Path";"Unix"], "_block48" 
    capture_lex $P49
    .const 'Sub' $P21 = "13_1268929814.46382" 
    capture_lex $P21
    .const 'Sub' $P15 = "12_1268929814.46382" 
    capture_lex $P15
# .annotate "line", 33
    get_hll_global $P49, ["Path";"Unix"], "_block48" 
    capture_lex $P49
    $P326 = $P49()
# .annotate "line", 7
    .return ($P326)
.end


.namespace ["Path"]
.sub "" :load :init :subid("post33") :outer("11_1268929814.46382")
# .annotate "line", 7
    get_hll_global $P14, ["Path"], "_block13" 
    .local pmc block
    set block, $P14
    .const 'Sub' $P328 = "31_1268929814.46382" 
    capture_lex $P328
    $P328()
    $P334 = get_root_global ["parrot"], "P6metaclass"
    new $P335, "ResizablePMCArray"
    push $P335, "@!elements"
    push $P335, "$!filesystem"
    push $P335, "$!volume"
    push $P335, "$!is_relative"
    push $P335, "$!initialized"
    $P334."new_class"("Path::Unix", "Path" :named("parent"), $P335 :named("attr"))
.end


.namespace ["Path"]
.sub "_block327"  :anon :subid("31_1268929814.46382") :outer("11_1268929814.46382")
# .annotate "line", 8
    get_global $P329, "%_Osname_class_map"
    unless_null $P329, vivify_34
    $P329 = root_new ['parrot';'Hash']
    set_global "%_Osname_class_map", $P329
  vivify_34:
    get_hll_global $P330, "Hash"
    get_hll_global $P331, ["Path"], "Unix"
    get_hll_global $P332, ["Path"], "Unix"
    $P333 = $P330."new"($P331 :named("DEFAULT"), $P332 :named("linux"))
    set_global "%_Osname_class_map", $P333
# .annotate "line", 7
    .return ($P333)
.end


.namespace ["Path"]
.sub "get_osname_map"  :subid("12_1268929814.46382") :method :outer("11_1268929814.46382")
# .annotate "line", 14
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
# .annotate "line", 15
    get_global $P18, "%_Osname_class_map"
    unless_null $P18, vivify_35
    $P18 = root_new ['parrot';'Hash']
    set_global "%_Osname_class_map", $P18
  vivify_35:
# .annotate "line", 14
    get_global $P19, "%_Osname_class_map"
    .return ($P19)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P20, exception, "payload"
    .return ($P20)
.end


.namespace ["Path"]
.sub "_init_obj"  :subid("13_1268929814.46382") :method :outer("11_1268929814.46382")
    .param pmc param_24 :slurpy
    .param pmc param_25 :slurpy :named
# .annotate "line", 18
    new $P23, 'ExceptionHandler'
    set_addr $P23, control_22
    $P23."handle_types"(58)
    push_eh $P23
    .lex "self", self
    .lex "@pos", param_24
    .lex "%named", param_25
# .annotate "line", 19
    $P26 = root_new ['parrot';'Hash']
    .lex "%map", $P26
# .annotate "line", 20
    new $P27, "Undef"
    .lex "$osname", $P27
# .annotate "line", 25
    new $P28, "Undef"
    .lex "$class", $P28
# .annotate "line", 26
    new $P29, "Undef"
    .lex "$obj", $P29
# .annotate "line", 19
    find_lex $P30, "self"
    $P31 = $P30."get_osname_map"()
    store_lex "%map", $P31
# .annotate "line", 20
    find_dynamic_lex $P32, "%*VM"
    unless_null $P32, vivify_36
    get_hll_global $P32, "%VM"
    unless_null $P32, vivify_37
    die "Contextual %*VM not found"
  vivify_37:
  vivify_36:
    set $P33, $P32["osname"]
    unless_null $P33, vivify_38
    new $P33, "Undef"
  vivify_38:
    store_lex "$osname", $P33
# .annotate "line", 23
    find_lex $P35, "%map"
    find_lex $P36, "$osname"
    $P37 = $P35."contains"($P36)
    if $P37, unless_34_end
# .annotate "line", 22
    new $P38, "String"
    assign $P38, "DEFAULT"
    store_lex "$osname", $P38
  unless_34_end:
# .annotate "line", 25
    find_lex $P39, "$osname"
    find_lex $P40, "%map"
    unless_null $P40, vivify_39
    $P40 = root_new ['parrot';'Hash']
  vivify_39:
    set $P41, $P40[$P39]
    unless_null $P41, vivify_40
    new $P41, "Undef"
  vivify_40:
    store_lex "$class", $P41
# .annotate "line", 26
    find_lex $P42, "$class"
    find_lex $P43, "@pos"
    find_lex $P44, "%named"
    $P45 = $P42."new"($P43 :flat, $P44 :flat)
    store_lex "$obj", $P45
    find_lex $P46, "$obj"
# .annotate "line", 18
    .return ($P46)
  control_22:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P47, exception, "payload"
    .return ($P47)
.end


.namespace ["Path";"Unix"]
.sub "_block48"  :subid("14_1268929814.46382") :outer("11_1268929814.46382")
# .annotate "line", 33
    .const 'Sub' $P310 = "30_1268929814.46382" 
    capture_lex $P310
    .const 'Sub' $P300 = "29_1268929814.46382" 
    capture_lex $P300
    .const 'Sub' $P292 = "28_1268929814.46382" 
    capture_lex $P292
    .const 'Sub' $P270 = "27_1268929814.46382" 
    capture_lex $P270
    .const 'Sub' $P246 = "26_1268929814.46382" 
    capture_lex $P246
    .const 'Sub' $P206 = "24_1268929814.46382" 
    capture_lex $P206
    .const 'Sub' $P182 = "23_1268929814.46382" 
    capture_lex $P182
    .const 'Sub' $P174 = "22_1268929814.46382" 
    capture_lex $P174
    .const 'Sub' $P145 = "20_1268929814.46382" 
    capture_lex $P145
    .const 'Sub' $P141 = "19_1268929814.46382" 
    capture_lex $P141
    .const 'Sub' $P99 = "18_1268929814.46382" 
    capture_lex $P99
    .const 'Sub' $P70 = "17_1268929814.46382" 
    capture_lex $P70
    .const 'Sub' $P60 = "16_1268929814.46382" 
    capture_lex $P60
    .const 'Sub' $P50 = "15_1268929814.46382" 
    capture_lex $P50
# .annotate "line", 185
    .const 'Sub' $P310 = "30_1268929814.46382" 
    capture_lex $P310
# .annotate "line", 33
    .return ($P310)
.end


.namespace ["Path";"Unix"]
.sub "" :load :init :subid("post41") :outer("14_1268929814.46382")
# .annotate "line", 33
    get_hll_global $P49, ["Path";"Unix"], "_block48" 
    .local pmc block
    set block, $P49
# .annotate "line", 40
    "auto_accessors"(1 :named("private"))
# .annotate "line", 42
    get_hll_global $P320, ["Parrot"], "define_multisub"
    $P320("append", 1 :named("method"), "append" :named("starting_with"))
# .annotate "line", 43
    get_hll_global $P321, ["Parrot"], "define_multisub"
    get_hll_global $P322, ["Path";"Unix"], "append__String"
    new $P323, "ResizablePMCArray"
    push $P323, $P322
    new $P324, "ResizablePMCArray"
    push $P324, "_"
    push $P324, "string"
    new $P325, "ResizablePMCArray"
    push $P325, $P324
    $P321("append", $P323, 1 :named("method"), $P325 :named("signatures"))
.end


.namespace ["Path";"Unix"]
.sub "absolute"  :subid("15_1268929814.46382") :method :outer("14_1268929814.46382")
    .param pmc param_53 :optional
    .param int has_param_53 :opt_flag
# .annotate "line", 46
    new $P52, 'ExceptionHandler'
    set_addr $P52, control_51
    $P52."handle_types"(58)
    push_eh $P52
    .lex "self", self
    if has_param_53, optparam_42
    new $P54, "Integer"
    assign $P54, 1
    set param_53, $P54
  optparam_42:
    .lex "$bool", param_53
    find_lex $P55, "$bool"
    isfalse $I56, $P55
    new $P57, 'Integer'
    set $P57, $I56
    find_lex $P58, "self"
    setattribute $P58, "$!is_relative", $P57
    .return ($P57)
  control_51:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P59, exception, "payload"
    .return ($P59)
.end


.namespace ["Path";"Unix"]
.sub "append__ANY"  :subid("16_1268929814.46382") :method :outer("14_1268929814.46382")
    .param pmc param_63
    .param pmc param_64 :optional :named("dynamic")
    .param int has_param_64 :opt_flag
# .annotate "line", 48
    new $P62, 'ExceptionHandler'
    set_addr $P62, control_61
    $P62."handle_types"(58)
    push_eh $P62
    .lex "self", self
    .lex "$element", param_63
    if has_param_64, optparam_43
    new $P65, "Undef"
    set param_64, $P65
  optparam_43:
    .lex "$dynamic", param_64
# .annotate "line", 49
    find_lex $P66, "$element"
    typeof $S67, $P66
    $P68 = "die"("Can't use a ", $S67, " as part of a Path - use a String or Path instead.")
# .annotate "line", 48
    .return ($P68)
  control_61:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P69, exception, "payload"
    .return ($P69)
.end


.namespace ["Path";"Unix"]
.sub "append__Path"  :subid("17_1268929814.46382") :method :outer("14_1268929814.46382")
    .param pmc param_73
    .param pmc param_74 :optional :named("dynamic")
    .param int has_param_74 :opt_flag
# .annotate "line", 52
    new $P72, 'ExceptionHandler'
    set_addr $P72, control_71
    $P72."handle_types"(58)
    push_eh $P72
    .lex "self", self
    .lex "$element", param_73
    if has_param_74, optparam_44
    new $P75, "Integer"
    assign $P75, 0
    set param_74, $P75
  optparam_44:
    .lex "$dynamic", param_74
# .annotate "line", 54
    find_lex $P77, "self"
    getattribute $P78, $P77, "$!initialized"
    unless_null $P78, vivify_45
    new $P78, "Undef"
  vivify_45:
    if $P78, unless_76_end
# .annotate "line", 55
    find_lex $P79, "$element"
    $P80 = $P79."initialized"()
    find_lex $P81, "self"
    setattribute $P81, "$!initialized", $P80
# .annotate "line", 56
    find_lex $P82, "$element"
    $P83 = $P82."is_relative"()
    find_lex $P84, "self"
    setattribute $P84, "$!is_relative", $P83
# .annotate "line", 57
    find_lex $P85, "$element"
    $P86 = $P85."volume"()
    find_lex $P87, "self"
    setattribute $P87, "$!volume", $P86
  unless_76_end:
# .annotate "line", 61
    find_lex $P89, "$dynamic"
    if $P89, if_88
# .annotate "line", 62
    find_lex $P93, "self"
    getattribute $P94, $P93, "@!elements"
    unless_null $P94, vivify_46
    $P94 = root_new ['parrot';'ResizablePMCArray']
  vivify_46:
    find_lex $P95, "$element"
    $P96 = $P95."elements"()
    $P94."append"($P96)
    goto if_88_end
  if_88:
# .annotate "line", 61
    find_lex $P90, "self"
    getattribute $P91, $P90, "@!elements"
    unless_null $P91, vivify_47
    $P91 = root_new ['parrot';'ResizablePMCArray']
  vivify_47:
    find_lex $P92, "$element"
    $P91."push"($P92)
  if_88_end:
    find_lex $P97, "self"
# .annotate "line", 52
    .return ($P97)
  control_71:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P98, exception, "payload"
    .return ($P98)
.end


.namespace ["Path";"Unix"]
.sub "append__String"  :subid("18_1268929814.46382") :method :outer("14_1268929814.46382")
    .param pmc param_102
    .param pmc param_103 :optional :named("dynamic")
    .param int has_param_103 :opt_flag
# .annotate "line", 72
    new $P101, 'ExceptionHandler'
    set_addr $P101, control_100
    $P101."handle_types"(58)
    push_eh $P101
    .lex "self", self
    .lex "$element", param_102
    if has_param_103, optparam_48
    new $P104, "Integer"
    assign $P104, 0
    set param_103, $P104
  optparam_48:
    .lex "$dynamic", param_103
# .annotate "line", 76
    $P105 = root_new ['parrot';'ResizablePMCArray']
    .lex "@parts", $P105
# .annotate "line", 91
    new $P106, "Undef"
    .lex "$last", $P106
# .annotate "line", 73
    find_lex $P108, "$dynamic"
    unless $P108, if_107_end
    "die"("Cannot use :dynamic with a String, only a Path argument")
  if_107_end:
# .annotate "line", 76
    find_lex $P109, "$element"
    find_lex $P110, "self"
    $P111 = $P110."directory_separator"()
    $P112 = $P109."split"($P111)
    store_lex "@parts", $P112
# .annotate "line", 79
    find_lex $P114, "self"
    getattribute $P115, $P114, "$!initialized"
    unless_null $P115, vivify_49
    new $P115, "Undef"
  vivify_49:
    if $P115, unless_113_end
# .annotate "line", 80
    new $P116, "Integer"
    assign $P116, 1
    find_lex $P117, "self"
    setattribute $P117, "$!initialized", $P116
# .annotate "line", 81
    find_lex $P119, "@parts"
    unless_null $P119, vivify_50
    $P119 = root_new ['parrot';'ResizablePMCArray']
  vivify_50:
    set $P120, $P119[0]
    unless_null $P120, vivify_51
    new $P120, "Undef"
  vivify_51:
    set $S121, $P120
    iseq $I122, $S121, ""
    if $I122, if_118
# .annotate "line", 86
    new $P126, "Integer"
    assign $P126, 1
    find_lex $P127, "self"
    setattribute $P127, "$!is_relative", $P126
# .annotate "line", 85
    goto if_118_end
  if_118:
# .annotate "line", 82
    find_lex $P123, "@parts"
    $P123."shift"()
# .annotate "line", 83
    new $P124, "Integer"
    assign $P124, 0
    find_lex $P125, "self"
    setattribute $P125, "$!is_relative", $P124
  if_118_end:
  unless_113_end:
# .annotate "line", 91
    find_lex $P128, "@parts"
    $P129 = $P128."pop"()
    store_lex "$last", $P129
# .annotate "line", 94
    find_lex $P131, "$last"
    set $S132, $P131
    iseq $I133, $S132, ""
    if $I133, unless_130_end
# .annotate "line", 93
    find_lex $P134, "@parts"
    find_lex $P135, "$last"
    $P134."push"($P135)
  unless_130_end:
# .annotate "line", 96
    find_lex $P136, "self"
    getattribute $P137, $P136, "@!elements"
    unless_null $P137, vivify_52
    $P137 = root_new ['parrot';'ResizablePMCArray']
  vivify_52:
    find_lex $P138, "@parts"
    $P137."append"($P138)
    find_lex $P139, "self"
# .annotate "line", 72
    .return ($P139)
  control_100:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P140, exception, "payload"
    .return ($P140)
.end


.namespace ["Path";"Unix"]
.sub "directory_separator"  :subid("19_1268929814.46382") :method :outer("14_1268929814.46382")
# .annotate "line", 101
    new $P143, 'ExceptionHandler'
    set_addr $P143, control_142
    $P143."handle_types"(58)
    push_eh $P143
    .lex "self", self
    .return ("/")
  control_142:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P144, exception, "payload"
    .return ($P144)
.end


.namespace ["Path";"Unix"]
.sub "elements"  :subid("20_1268929814.46382") :method :outer("14_1268929814.46382")
# .annotate "line", 103
    .const 'Sub' $P156 = "21_1268929814.46382" 
    capture_lex $P156
    new $P147, 'ExceptionHandler'
    set_addr $P147, control_146
    $P147."handle_types"(58)
    push_eh $P147
    .lex "self", self
# .annotate "line", 104
    $P148 = root_new ['parrot';'ResizablePMCArray']
    .lex "@result", $P148
    new $P149, "ResizablePMCArray"
    store_lex "@result", $P149
# .annotate "line", 106
    find_lex $P151, "self"
    getattribute $P152, $P151, "@!elements"
    unless_null $P152, vivify_53
    $P152 = root_new ['parrot';'ResizablePMCArray']
  vivify_53:
    defined $I153, $P152
    unless $I153, for_undef_54
    iter $P150, $P152
    new $P170, 'ExceptionHandler'
    set_addr $P170, loop169_handler
    $P170."handle_types"(65, 67, 66)
    push_eh $P170
  loop169_test:
    unless $P150, loop169_done
    shift $P154, $P150
  loop169_redo:
    .const 'Sub' $P156 = "21_1268929814.46382" 
    capture_lex $P156
    $P156($P154)
  loop169_next:
    goto loop169_test
  loop169_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P171, exception, 'type'
    eq $P171, 65, loop169_next
    eq $P171, 67, loop169_redo
  loop169_done:
    pop_eh 
  for_undef_54:
    find_lex $P172, "@result"
# .annotate "line", 103
    .return ($P172)
  control_146:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P173, exception, "payload"
    .return ($P173)
.end


.namespace ["Path";"Unix"]
.sub "_block155"  :anon :subid("21_1268929814.46382") :outer("20_1268929814.46382")
    .param pmc param_157
# .annotate "line", 106
    .lex "$elt", param_157
# .annotate "line", 107
    find_lex $P160, "$elt"
    $P161 = $P160."isa"("String")
    if $P161, if_159
# .annotate "line", 111
    find_lex $P165, "@result"
    find_lex $P166, "$elt"
    $P167 = $P166."elements"()
    $P168 = $P165."append"($P167)
# .annotate "line", 110
    set $P158, $P168
# .annotate "line", 107
    goto if_159_end
  if_159:
# .annotate "line", 108
    find_lex $P162, "@result"
    find_lex $P163, "$elt"
    $P164 = $P162."push"($P163)
# .annotate "line", 107
    set $P158, $P164
  if_159_end:
# .annotate "line", 106
    .return ($P158)
.end


.namespace ["Path";"Unix"]
.sub "exists"  :subid("22_1268929814.46382") :method :outer("14_1268929814.46382")
# .annotate "line", 118
    new $P176, 'ExceptionHandler'
    set_addr $P176, control_175
    $P176."handle_types"(58)
    push_eh $P176
    .lex "self", self
    find_lex $P177, "self"
    getattribute $P178, $P177, "$!filesystem"
    unless_null $P178, vivify_55
    new $P178, "Undef"
  vivify_55:
    find_lex $P179, "self"
    $P180 = $P178."exists"($P179)
    .return ($P180)
  control_175:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P181, exception, "payload"
    .return ($P181)
.end


.namespace ["Path";"Unix"]
.sub "get_string"  :subid("23_1268929814.46382") :method :outer("14_1268929814.46382")
# .annotate "line", 121
    new $P184, 'ExceptionHandler'
    set_addr $P184, control_183
    $P184."handle_types"(58)
    push_eh $P184
    .lex "self", self
# .annotate "line", 122
    new $P185, "Undef"
    .lex "$slash", $P185
    find_lex $P186, "self"
    $P187 = $P186."directory_separator"()
    store_lex "$slash", $P187
# .annotate "line", 124
    find_lex $P190, "self"
    $P191 = $P190."is_absolute"()
    if $P191, if_189
# .annotate "line", 126
    find_lex $P201, "self"
    $P202 = $P201."elements"()
    find_lex $P203, "$slash"
    $P204 = $P202."join"($P203)
    set $P188, $P204
# .annotate "line", 124
    goto if_189_end
  if_189:
# .annotate "line", 125
    find_lex $P192, "self"
    getattribute $P193, $P192, "$!volume"
    unless_null $P193, vivify_56
    new $P193, "Undef"
  vivify_56:
    find_lex $P194, "$slash"
    concat $P195, $P193, $P194
    find_lex $P196, "self"
    $P197 = $P196."elements"()
    find_lex $P198, "$slash"
    $S199 = $P197."join"($P198)
    concat $P200, $P195, $S199
    set $P188, $P200
  if_189_end:
# .annotate "line", 121
    .return ($P188)
  control_183:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P205, exception, "payload"
    .return ($P205)
.end


.namespace ["Path";"Unix"]
.sub "_init_obj"  :subid("24_1268929814.46382") :method :outer("14_1268929814.46382")
    .param pmc param_209 :slurpy
    .param pmc param_210 :optional :named("dynamic")
    .param int has_param_210 :opt_flag
    .param pmc param_212 :slurpy :named
# .annotate "line", 129
    .const 'Sub' $P231 = "25_1268929814.46382" 
    capture_lex $P231
    new $P208, 'ExceptionHandler'
    set_addr $P208, control_207
    $P208."handle_types"(58)
    push_eh $P208
    .lex "self", self
    .lex "@parts", param_209
    if has_param_210, optparam_57
    new $P211, "Integer"
    assign $P211, 0
    set param_210, $P211
  optparam_57:
    .lex "$dynamic", param_210
    .lex "%named", param_212
# .annotate "line", 130
    find_lex $P213, "self"
    getattribute $P214, $P213, "@!elements"
    unless_null $P214, vivify_58
    $P214 = root_new ['parrot';'ResizablePMCArray']
  vivify_58:
    find_lex $P215, "self"
    setattribute $P215, "@!elements", $P214
# .annotate "line", 131
    find_dynamic_lex $P216, "$*FileSystem"
    unless_null $P216, vivify_59
    get_hll_global $P216, "$FileSystem"
    unless_null $P216, vivify_60
    die "Contextual $*FileSystem not found"
  vivify_60:
  vivify_59:
    find_lex $P217, "self"
    setattribute $P217, "$!filesystem", $P216
# .annotate "line", 132
    new $P218, "Integer"
    assign $P218, 0
    find_lex $P219, "self"
    setattribute $P219, "$!initialized", $P218
# .annotate "line", 133
    new $P220, "Integer"
    assign $P220, 1
    find_lex $P221, "self"
    setattribute $P221, "$!is_relative", $P220
# .annotate "line", 134
    new $P222, "String"
    assign $P222, ""
    find_lex $P223, "self"
    setattribute $P223, "$!volume", $P222
# .annotate "line", 136
    find_lex $P224, "self"
    find_lex $P225, "%named"
    $P224."_init_args"($P225 :flat)
# .annotate "line", 138
    find_lex $P227, "@parts"
    defined $I228, $P227
    unless $I228, for_undef_61
    iter $P226, $P227
    new $P242, 'ExceptionHandler'
    set_addr $P242, loop241_handler
    $P242."handle_types"(65, 67, 66)
    push_eh $P242
  loop241_test:
    unless $P226, loop241_done
    shift $P229, $P226
  loop241_redo:
    .const 'Sub' $P231 = "25_1268929814.46382" 
    capture_lex $P231
    $P231($P229)
  loop241_next:
    goto loop241_test
  loop241_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P243, exception, 'type'
    eq $P243, 65, loop241_next
    eq $P243, 67, loop241_redo
  loop241_done:
    pop_eh 
  for_undef_61:
    find_lex $P244, "self"
# .annotate "line", 129
    .return ($P244)
  control_207:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P245, exception, "payload"
    .return ($P245)
.end


.namespace ["Path";"Unix"]
.sub "_block230"  :anon :subid("25_1268929814.46382") :outer("24_1268929814.46382")
    .param pmc param_232
# .annotate "line", 138
    .lex "$part", param_232
# .annotate "line", 139
    find_lex $P233, "self"
    find_lex $P234, "$part"
    find_lex $P237, "$dynamic"
    if $P237, if_236
    set $P235, $P237
    goto if_236_end
  if_236:
    find_lex $P238, "$part"
    $P239 = $P238."isa"("Path")
    set $P235, $P239
  if_236_end:
    $P240 = $P233."append"($P234, $P235 :named("dynamic"))
# .annotate "line", 138
    .return ($P240)
.end


.namespace ["Path";"Unix"]
.sub "is_absolute"  :subid("26_1268929814.46382") :method :outer("14_1268929814.46382")
# .annotate "line", 145
    new $P248, 'ExceptionHandler'
    set_addr $P248, control_247
    $P248."handle_types"(58)
    push_eh $P248
    .lex "self", self
# .annotate "line", 146
    find_lex $P253, "self"
    getattribute $P254, $P253, "@!elements"
    unless_null $P254, vivify_62
    $P254 = root_new ['parrot';'ResizablePMCArray']
  vivify_62:
    $N255 = $P254."elems"()
    iseq $I256, $N255, 0.0
    unless $I256, unless_252
    new $P251, 'Integer'
    set $P251, $I256
    goto unless_252_end
  unless_252:
    find_lex $P257, "self"
    getattribute $P258, $P257, "@!elements"
    unless_null $P258, vivify_63
    $P258 = root_new ['parrot';'ResizablePMCArray']
  vivify_63:
    set $P259, $P258[0]
    unless_null $P259, vivify_64
    new $P259, "Undef"
  vivify_64:
    $P260 = $P259."isa"("String")
    set $P251, $P260
  unless_252_end:
    if $P251, if_250
# .annotate "line", 150
    find_lex $P265, "self"
    getattribute $P266, $P265, "@!elements"
    unless_null $P266, vivify_65
    $P266 = root_new ['parrot';'ResizablePMCArray']
  vivify_65:
    set $P267, $P266[0]
    unless_null $P267, vivify_66
    new $P267, "Undef"
  vivify_66:
    $P268 = $P267."is_absolute"()
# .annotate "line", 149
    set $P249, $P268
# .annotate "line", 146
    goto if_250_end
  if_250:
# .annotate "line", 147
    find_lex $P261, "self"
    getattribute $P262, $P261, "$!is_relative"
    unless_null $P262, vivify_67
    new $P262, "Undef"
  vivify_67:
    isfalse $I263, $P262
    new $P264, 'Integer'
    set $P264, $I263
# .annotate "line", 146
    set $P249, $P264
  if_250_end:
# .annotate "line", 145
    .return ($P249)
  control_247:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P269, exception, "payload"
    .return ($P269)
.end


.namespace ["Path";"Unix"]
.sub "is_relative"  :subid("27_1268929814.46382") :method :outer("14_1268929814.46382")
# .annotate "line", 154
    new $P272, 'ExceptionHandler'
    set_addr $P272, control_271
    $P272."handle_types"(58)
    push_eh $P272
    .lex "self", self
# .annotate "line", 155
    find_lex $P277, "self"
    getattribute $P278, $P277, "@!elements"
    unless_null $P278, vivify_68
    $P278 = root_new ['parrot';'ResizablePMCArray']
  vivify_68:
    $N279 = $P278."elems"()
    iseq $I280, $N279, 0.0
    unless $I280, unless_276
    new $P275, 'Integer'
    set $P275, $I280
    goto unless_276_end
  unless_276:
    find_lex $P281, "self"
    getattribute $P282, $P281, "@!elements"
    unless_null $P282, vivify_69
    $P282 = root_new ['parrot';'ResizablePMCArray']
  vivify_69:
    set $P283, $P282[0]
    unless_null $P283, vivify_70
    new $P283, "Undef"
  vivify_70:
    $P284 = $P283."isa"("String")
    set $P275, $P284
  unless_276_end:
    if $P275, if_274
# .annotate "line", 159
    find_lex $P287, "self"
    getattribute $P288, $P287, "@!elements"
    unless_null $P288, vivify_71
    $P288 = root_new ['parrot';'ResizablePMCArray']
  vivify_71:
    set $P289, $P288[0]
    unless_null $P289, vivify_72
    new $P289, "Undef"
  vivify_72:
    $P290 = $P289."is_relative"()
# .annotate "line", 158
    set $P273, $P290
# .annotate "line", 155
    goto if_274_end
  if_274:
    find_lex $P285, "self"
    getattribute $P286, $P285, "$!is_relative"
    unless_null $P286, vivify_73
    new $P286, "Undef"
  vivify_73:
    set $P273, $P286
  if_274_end:
# .annotate "line", 154
    .return ($P273)
  control_271:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P291, exception, "payload"
    .return ($P291)
.end


.namespace ["Path";"Unix"]
.sub "relative"  :subid("28_1268929814.46382") :method :outer("14_1268929814.46382")
    .param pmc param_295 :optional
    .param int has_param_295 :opt_flag
# .annotate "line", 163
    new $P294, 'ExceptionHandler'
    set_addr $P294, control_293
    $P294."handle_types"(58)
    push_eh $P294
    .lex "self", self
    if has_param_295, optparam_74
    new $P296, "Integer"
    assign $P296, 1
    set param_295, $P296
  optparam_74:
    .lex "$bool", param_295
    find_lex $P297, "$bool"
    find_lex $P298, "self"
    setattribute $P298, "$!is_relative", $P297
    .return ($P297)
  control_293:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P299, exception, "payload"
    .return ($P299)
.end


.namespace ["Path";"Unix"]
.sub "open"  :subid("29_1268929814.46382") :method :outer("14_1268929814.46382")
    .param pmc param_303 :slurpy :named
# .annotate "line", 181
    new $P302, 'ExceptionHandler'
    set_addr $P302, control_301
    $P302."handle_types"(58)
    push_eh $P302
    .lex "self", self
    .lex "%named", param_303
# .annotate "line", 182
    find_lex $P304, "self"
    getattribute $P305, $P304, "$!filesystem"
    unless_null $P305, vivify_75
    new $P305, "Undef"
  vivify_75:
    find_lex $P306, "self"
    find_lex $P307, "%named"
    $P308 = $P305."open"($P306, $P307 :flat)
# .annotate "line", 181
    .return ($P308)
  control_301:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P309, exception, "payload"
    .return ($P309)
.end


.namespace ["Path";"Unix"]
.sub "slurp"  :subid("30_1268929814.46382") :method :outer("14_1268929814.46382")
    .param pmc param_313 :slurpy :named
# .annotate "line", 185
    new $P312, 'ExceptionHandler'
    set_addr $P312, control_311
    $P312."handle_types"(58)
    push_eh $P312
    .lex "self", self
    .lex "%named", param_313
# .annotate "line", 186
    find_lex $P314, "self"
    getattribute $P315, $P314, "$!filesystem"
    unless_null $P315, vivify_76
    new $P315, "Undef"
  vivify_76:
    find_lex $P316, "self"
    find_lex $P317, "%named"
    $P318 = $P315."slurp"($P316, $P317 :flat)
# .annotate "line", 185
    .return ($P318)
  control_311:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P319, exception, "payload"
    .return ($P319)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929819.18389")
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
    $P349 = $P16()
# .annotate "line", 1
    .return ($P349)
.end


.namespace []
.sub "" :load :init :subid("post33") :outer("10_1268929819.18389")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268929819.18389" 
    .local pmc block
    set block, $P12
    $P350 = get_root_global ["parrot"], "P6metaclass"
    $P350."new_class"("Exception::ProgramExit", "Exception::Wrapper" :named("parent"))
.end


.namespace ["Exception";"ProgramExit"]
.sub "_block13"  :subid("11_1268929819.18389") :outer("10_1268929819.18389")
# .annotate "line", 5
    .return ()
.end


.namespace ["Program"]
.sub "_block15"  :subid("12_1268929819.18389") :outer("10_1268929819.18389")
# .annotate "line", 11
    .const 'Sub' $P344 = "32_1268929819.18389" 
    capture_lex $P344
    .const 'Sub' $P289 = "29_1268929819.18389" 
    capture_lex $P289
    .const 'Sub' $P268 = "28_1268929819.18389" 
    capture_lex $P268
    .const 'Sub' $P249 = "27_1268929819.18389" 
    capture_lex $P249
    .const 'Sub' $P222 = "26_1268929819.18389" 
    capture_lex $P222
    .const 'Sub' $P212 = "25_1268929819.18389" 
    capture_lex $P212
    .const 'Sub' $P202 = "24_1268929819.18389" 
    capture_lex $P202
    .const 'Sub' $P194 = "23_1268929819.18389" 
    capture_lex $P194
    .const 'Sub' $P175 = "22_1268929819.18389" 
    capture_lex $P175
    .const 'Sub' $P156 = "21_1268929819.18389" 
    capture_lex $P156
    .const 'Sub' $P122 = "20_1268929819.18389" 
    capture_lex $P122
    .const 'Sub' $P87 = "18_1268929819.18389" 
    capture_lex $P87
    .const 'Sub' $P77 = "17_1268929819.18389" 
    capture_lex $P77
    .const 'Sub' $P67 = "16_1268929819.18389" 
    capture_lex $P67
    .const 'Sub' $P59 = "15_1268929819.18389" 
    capture_lex $P59
    .const 'Sub' $P44 = "14_1268929819.18389" 
    capture_lex $P44
    .const 'Sub' $P18 = "13_1268929819.18389" 
    capture_lex $P18
# .annotate "line", 21
    get_global $P17, "$_Instance"
    unless_null $P17, vivify_35
    new $P17, "Undef"
    set_global "$_Instance", $P17
  vivify_35:
# .annotate "line", 28
    .const 'Sub' $P18 = "13_1268929819.18389" 
    capture_lex $P18
    .lex "_initload", $P18
# .annotate "line", 72
    .const 'Sub' $P44 = "14_1268929819.18389" 
    capture_lex $P44
    .lex "exit", $P44
# .annotate "line", 80
    .const 'Sub' $P59 = "15_1268929819.18389" 
    capture_lex $P59
    .lex "_exit", $P59
# .annotate "line", 88
    .const 'Sub' $P67 = "16_1268929819.18389" 
    capture_lex $P67
    .lex "global_at_exit", $P67
# .annotate "line", 92
    .const 'Sub' $P77 = "17_1268929819.18389" 
    capture_lex $P77
    .lex "global_at_start", $P77
# .annotate "line", 116
    .const 'Sub' $P87 = "18_1268929819.18389" 
    capture_lex $P87
    .lex "instance", $P87
# .annotate "line", 176
    .const 'Sub' $P122 = "20_1268929819.18389" 
    capture_lex $P122
    .lex "swap_handles", $P122
# .annotate "line", 11
    get_global $P154, "$_Instance"
# .annotate "line", 23
    find_lex $P155, "_initload"
# .annotate "line", 68
    find_lex $P210, "exit"
    find_lex $P211, "_exit"
# .annotate "line", 84
    find_lex $P220, "global_at_exit"
    find_lex $P221, "global_at_start"
# .annotate "line", 108
    find_lex $P267, "instance"
# .annotate "line", 148
    find_lex $P342, "swap_handles"
# .annotate "line", 11
    .return ($P342)
.end


.namespace ["Program"]
.sub "" :load :init :subid("post34") :outer("12_1268929819.18389")
# .annotate "line", 11
    get_hll_global $P16, ["Program"], "_block15" 
    .local pmc block
    set block, $P16
# .annotate "line", 23
    .const 'Sub' $P344 = "32_1268929819.18389" 
    capture_lex $P344
    $P344()
.end


.namespace ["Program"]
.sub "_block343"  :anon :subid("32_1268929819.18389") :outer("12_1268929819.18389")
# .annotate "line", 25
    new $P345, "Undef"
    .lex "$undef", $P345
# .annotate "line", 24
    get_hll_global $P346, ["Kakapo"], "depends_on"
    new $P347, "ResizablePMCArray"
    push $P347, "Library"
    push $P347, "FileSystem"
    $P346($P347)
# .annotate "line", 25
    find_lex $P348, "$undef"
    set_global "$_Instance", $P348
# .annotate "line", 23
    .return ($P348)
.end


.namespace ["Program"]
.sub "_initload"  :subid("13_1268929819.18389") :outer("12_1268929819.18389")
# .annotate "line", 28
    new $P20, 'ExceptionHandler'
    set_addr $P20, control_19
    $P20."handle_types"(58)
    push_eh $P20
# .annotate "line", 43
    new $P21, "Undef"
    .lex "$config", $P21
# .annotate "line", 46
    new $P22, "Undef"
    .lex "$instance", $P22
# .annotate "line", 29
    new $P23, "ResizablePMCArray"
    push $P23, "@!argv"
    push $P23, "$!executable_name"
    push $P23, "$!program_name"
    push $P23, "$!exit_value"
    push $P23, "$!stderr"
    push $P23, "$!stdin"
    push $P23, "$!stdout"
    push $P23, "$!exit_marshaller"
    push $P23, "$!start_marshaller"
    "has"($P23)
# .annotate "line", 43
    getinterp $P24
    set $P25, $P24[6]
    unless_null $P25, vivify_36
    new $P25, "Undef"
  vivify_36:
    store_lex "$config", $P25
# .annotate "line", 44
    new $P26, "String"
    assign $P26, "%VM"
    set $S27, $P26
    find_lex $P28, "$config"
    set_hll_global $S27, $P28
# .annotate "line", 46
    get_hll_global $P29, "FileSystem"
    $P30 = $P29."instance"()
    store_lex "$instance", $P30
# .annotate "line", 47
    new $P31, "String"
    assign $P31, "$FileSystem"
    set $S32, $P31
    find_lex $P33, "$instance"
    set_hll_global $S32, $P33
# .annotate "line", 49
    get_hll_global $P34, ["Global"], "inject_root_symbol"
    get_hll_global $P35, ["Program"], "global_at_exit"
    $P34($P35, "at_exit" :named("as"))
# .annotate "line", 50
    get_hll_global $P36, ["Global"], "inject_root_symbol"
    get_hll_global $P37, ["Program"], "global_at_start"
    $P36($P37, "at_start" :named("as"))
# .annotate "line", 52
    get_hll_global $P38, ["Global"], "inject_root_symbol"
    get_hll_global $P39, ["Program"], "exit"
    $P38($P39)
# .annotate "line", 53
    get_hll_global $P40, ["Global"], "inject_root_symbol"
    get_hll_global $P41, ["Program"], "_exit"
    $P42 = $P40($P41)
# .annotate "line", 28
    .return ($P42)
  control_19:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P43, exception, "payload"
    .return ($P43)
.end


.namespace ["Program"]
.sub "exit"  :subid("14_1268929819.18389") :outer("12_1268929819.18389")
    .param pmc param_47 :optional
    .param int has_param_47 :opt_flag
# .annotate "line", 72
    new $P46, 'ExceptionHandler'
    set_addr $P46, control_45
    $P46."handle_types"(58)
    push_eh $P46
    if has_param_47, optparam_37
    new $P48, "Integer"
    assign $P48, 0
    set param_47, $P48
  optparam_37:
    .lex "$status", param_47
# .annotate "line", 73
    get_hll_global $P49, ["Exception"], "ProgramExit"
    find_lex $P50, "$status"
    new $P51, 'String'
    set $P51, "exit("
    find_lex $P52, "$status"
    concat $P53, $P51, $P52
    concat $P54, $P53, ")"
    find_lex $P55, "$status"
    $P56 = $P49."new"($P50 :named("exit_code"), $P54 :named("message"), $P55 :named("payload"))
    $P57 = $P56."throw"()
# .annotate "line", 72
    .return ($P57)
  control_45:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P58, exception, "payload"
    .return ($P58)
.end


.namespace ["Program"]
.sub "_exit"  :subid("15_1268929819.18389") :outer("12_1268929819.18389")
    .param pmc param_62 :optional
    .param int has_param_62 :opt_flag
# .annotate "line", 80
    new $P61, 'ExceptionHandler'
    set_addr $P61, control_60
    $P61."handle_types"(58)
    push_eh $P61
    if has_param_62, optparam_38
    new $P63, "Integer"
    assign $P63, 1
    set param_62, $P63
  optparam_38:
    .lex "$status", param_62
# .annotate "line", 81
    find_lex $P64, "$status"
    set $I65, $P64
    exit $I65
# .annotate "line", 80
    .return ()
  control_60:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P66, exception, "payload"
    .return ($P66)
.end


.namespace ["Program"]
.sub "global_at_exit"  :subid("16_1268929819.18389") :outer("12_1268929819.18389")
    .param pmc param_70 :slurpy
    .param pmc param_71 :slurpy :named
# .annotate "line", 88
    new $P69, 'ExceptionHandler'
    set_addr $P69, control_68
    $P69."handle_types"(58)
    push_eh $P69
    .lex "@pos", param_70
    .lex "%named", param_71
# .annotate "line", 89
    $P72 = "instance"()
    find_lex $P73, "@pos"
    find_lex $P74, "%named"
    $P75 = $P72."at_exit"($P73 :flat, $P74 :flat)
# .annotate "line", 88
    .return ($P75)
  control_68:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P76, exception, "payload"
    .return ($P76)
.end


.namespace ["Program"]
.sub "global_at_start"  :subid("17_1268929819.18389") :outer("12_1268929819.18389")
    .param pmc param_80 :slurpy
    .param pmc param_81 :slurpy :named
# .annotate "line", 92
    new $P79, 'ExceptionHandler'
    set_addr $P79, control_78
    $P79."handle_types"(58)
    push_eh $P79
    .lex "@pos", param_80
    .lex "%named", param_81
# .annotate "line", 93
    $P82 = "instance"()
    find_lex $P83, "@pos"
    find_lex $P84, "%named"
    $P85 = $P82."at_start"($P83 :flat, $P84 :flat)
# .annotate "line", 92
    .return ($P85)
  control_78:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P86, exception, "payload"
    .return ($P86)
.end


.namespace ["Program"]
.sub "instance"  :subid("18_1268929819.18389") :outer("12_1268929819.18389")
    .param pmc param_90 :slurpy
# .annotate "line", 116
    .const 'Sub' $P96 = "19_1268929819.18389" 
    capture_lex $P96
    new $P89, 'ExceptionHandler'
    set_addr $P89, control_88
    $P89."handle_types"(58)
    push_eh $P89
    .lex "@new", param_90
# .annotate "line", 117
    find_lex $P93, "@new"
    $P94 = $P93."elems"()
    if $P94, if_92
# .annotate "line", 129
    get_global $P118, "$_Instance"
    $P119 = $P118."defined"()
    if $P119, unless_117_end
# .annotate "line", 128
    "die"("No Program::instance set yet")
  unless_117_end:
    get_global $P120, "$_Instance"
# .annotate "line", 127
    set $P91, $P120
# .annotate "line", 117
    goto if_92_end
  if_92:
    .const 'Sub' $P96 = "19_1268929819.18389" 
    capture_lex $P96
    $P116 = $P96()
    set $P91, $P116
  if_92_end:
# .annotate "line", 116
    .return ($P91)
  control_88:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, "payload"
    .return ($P121)
.end


.namespace ["Program"]
.sub "_block95"  :anon :subid("19_1268929819.18389") :outer("18_1268929819.18389")
# .annotate "line", 118
    new $P97, "Undef"
    .lex "$old", $P97
    get_global $P98, "$_Instance"
    store_lex "$old", $P98
# .annotate "line", 120
    find_lex $P102, "$old"
    $P103 = $P102."defined"()
    if $P103, if_101
    set $P100, $P103
    goto if_101_end
  if_101:
# .annotate "line", 121
    find_lex $P106, "$old"
    $P107 = $P106."exit_marshaller"()
    $P108 = $P107."is_empty"()
    isfalse $I109, $P108
    unless $I109, unless_105
    new $P104, 'Integer'
    set $P104, $I109
    goto unless_105_end
  unless_105:
    find_lex $P110, "$old"
    $P111 = $P110."start_marshaller"()
    $P112 = $P111."is_empty"()
    isfalse $I113, $P112
    new $P104, 'Integer'
    set $P104, $I113
  unless_105_end:
    set $P100, $P104
  if_101_end:
    unless $P100, if_99_end
# .annotate "line", 122
    "die"("A previously-registered Program instance has unprocessed marshalling queues.")
  if_99_end:
# .annotate "line", 125
    find_lex $P114, "@new"
    unless_null $P114, vivify_39
    $P114 = root_new ['parrot';'ResizablePMCArray']
  vivify_39:
    set $P115, $P114[0]
    unless_null $P115, vivify_40
    new $P115, "Undef"
  vivify_40:
    set_global "$_Instance", $P115
# .annotate "line", 117
    .return ($P115)
.end


.namespace ["Program"]
.sub "swap_handles"  :subid("20_1268929819.18389") :outer("12_1268929819.18389")
    .param pmc param_125 :slurpy :named
# .annotate "line", 176
    new $P124, 'ExceptionHandler'
    set_addr $P124, control_123
    $P124."handle_types"(58)
    push_eh $P124
    .lex "%handles", param_125
# .annotate "line", 177
    $P126 = root_new ['parrot';'Hash']
    .lex "%save_handles", $P126
# .annotate "line", 176
    find_lex $P127, "%save_handles"
# .annotate "line", 179
    find_lex $P129, "%handles"
    unless_null $P129, vivify_41
    $P129 = root_new ['parrot';'Hash']
  vivify_41:
    set $P130, $P129["stderr"]
    unless_null $P130, vivify_42
    new $P130, "Undef"
  vivify_42:
    defined $I131, $P130
    unless $I131, if_128_end
# .annotate "line", 180
    getstderr $P132
    find_lex $P133, "%save_handles"
    unless_null $P133, vivify_43
    $P133 = root_new ['parrot';'Hash']
    store_lex "%save_handles", $P133
  vivify_43:
    set $P133["stderr"], $P132
# .annotate "line", 181
    find_lex $P134, "%handles"
    unless_null $P134, vivify_44
    $P134 = root_new ['parrot';'Hash']
  vivify_44:
    set $P135, $P134["stderr"]
    unless_null $P135, vivify_45
    new $P135, "Undef"
  vivify_45:
    setstderr $P135
  if_128_end:
# .annotate "line", 184
    find_lex $P137, "%handles"
    unless_null $P137, vivify_46
    $P137 = root_new ['parrot';'Hash']
  vivify_46:
    set $P138, $P137["stdin"]
    unless_null $P138, vivify_47
    new $P138, "Undef"
  vivify_47:
    defined $I139, $P138
    unless $I139, if_136_end
# .annotate "line", 185
    getstdin $P140
    find_lex $P141, "%save_handles"
    unless_null $P141, vivify_48
    $P141 = root_new ['parrot';'Hash']
    store_lex "%save_handles", $P141
  vivify_48:
    set $P141["stdin"], $P140
# .annotate "line", 186
    find_lex $P142, "%handles"
    unless_null $P142, vivify_49
    $P142 = root_new ['parrot';'Hash']
  vivify_49:
    set $P143, $P142["stdin"]
    unless_null $P143, vivify_50
    new $P143, "Undef"
  vivify_50:
    setstdin $P143
  if_136_end:
# .annotate "line", 189
    find_lex $P145, "%handles"
    unless_null $P145, vivify_51
    $P145 = root_new ['parrot';'Hash']
  vivify_51:
    set $P146, $P145["stdout"]
    unless_null $P146, vivify_52
    new $P146, "Undef"
  vivify_52:
    defined $I147, $P146
    unless $I147, if_144_end
# .annotate "line", 190
    getstdout $P148
    find_lex $P149, "%save_handles"
    unless_null $P149, vivify_53
    $P149 = root_new ['parrot';'Hash']
    store_lex "%save_handles", $P149
  vivify_53:
    set $P149["stdout"], $P148
# .annotate "line", 191
    find_lex $P150, "%handles"
    unless_null $P150, vivify_54
    $P150 = root_new ['parrot';'Hash']
  vivify_54:
    set $P151, $P150["stdout"]
    unless_null $P151, vivify_55
    new $P151, "Undef"
  vivify_55:
    setstdout $P151
  if_144_end:
# .annotate "line", 189
    find_lex $P152, "%save_handles"
# .annotate "line", 176
    .return ($P152)
  control_123:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P153, exception, "payload"
    .return ($P153)
.end


.namespace ["Program"]
.sub "at_exit"  :subid("21_1268929819.18389") :method :outer("12_1268929819.18389")
    .param pmc param_159
    .param pmc param_160 :optional
    .param int has_param_160 :opt_flag
    .param pmc param_162 :optional :named("namespace")
    .param int has_param_162 :opt_flag
    .param pmc param_165 :optional :named("requires")
    .param int has_param_165 :opt_flag
# .annotate "line", 56
    new $P158, 'ExceptionHandler'
    set_addr $P158, control_157
    $P158."handle_types"(58)
    push_eh $P158
    .lex "self", self
    .lex "$sub", param_159
    if has_param_160, optparam_56
    new $P161, "Undef"
    set param_160, $P161
  optparam_56:
    .lex "$name", param_160
    if has_param_162, optparam_57
    get_hll_global $P163, ["Parrot"], "caller_namespace"
    $P164 = $P163()
    set param_162, $P164
  optparam_57:
    .lex "$namespace", param_162
    if has_param_165, optparam_58
    $P166 = root_new ['parrot';'ResizablePMCArray']
    set param_165, $P166
  optparam_58:
    .lex "@requires", param_165
# .annotate "line", 57
    find_lex $P167, "self"
    getattribute $P168, $P167, "$!exit_marshaller"
    unless_null $P168, vivify_59
    new $P168, "Undef"
  vivify_59:
    find_lex $P169, "$sub"
    find_lex $P170, "$name"
    find_lex $P171, "$namespace"
    find_lex $P172, "@requires"
    $P173 = $P168."add_call"($P169, $P170, $P171 :named("namespace"), $P172 :named("requires"))
# .annotate "line", 56
    .return ($P173)
  control_157:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P174, exception, "payload"
    .return ($P174)
.end


.namespace ["Program"]
.sub "at_start"  :subid("22_1268929819.18389") :method :outer("12_1268929819.18389")
    .param pmc param_178
    .param pmc param_179 :optional
    .param int has_param_179 :opt_flag
    .param pmc param_181 :optional :named("namespace")
    .param int has_param_181 :opt_flag
    .param pmc param_184 :optional :named("requires")
    .param int has_param_184 :opt_flag
# .annotate "line", 60
    new $P177, 'ExceptionHandler'
    set_addr $P177, control_176
    $P177."handle_types"(58)
    push_eh $P177
    .lex "self", self
    .lex "$sub", param_178
    if has_param_179, optparam_60
    new $P180, "Undef"
    set param_179, $P180
  optparam_60:
    .lex "$name", param_179
    if has_param_181, optparam_61
    get_hll_global $P182, ["Parrot"], "caller_namespace"
    $P183 = $P182()
    set param_181, $P183
  optparam_61:
    .lex "$namespace", param_181
    if has_param_184, optparam_62
    $P185 = root_new ['parrot';'ResizablePMCArray']
    set param_184, $P185
  optparam_62:
    .lex "@requires", param_184
# .annotate "line", 61
    find_lex $P186, "self"
    getattribute $P187, $P186, "$!start_marshaller"
    unless_null $P187, vivify_63
    new $P187, "Undef"
  vivify_63:
    find_lex $P188, "$sub"
    find_lex $P189, "$name"
    find_lex $P190, "$namespace"
    find_lex $P191, "@requires"
    $P192 = $P187."add_call"($P188, $P189, $P190 :named("namespace"), $P191 :named("requires"))
# .annotate "line", 60
    .return ($P192)
  control_176:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P193, exception, "payload"
    .return ($P193)
.end


.namespace ["Program"]
.sub "do_exit"  :subid("23_1268929819.18389") :method :outer("12_1268929819.18389")
# .annotate "line", 64
    new $P196, 'ExceptionHandler'
    set_addr $P196, control_195
    $P196."handle_types"(58)
    push_eh $P196
    .lex "self", self
# .annotate "line", 65
    find_lex $P197, "self"
    getattribute $P198, $P197, "$!exit_marshaller"
    unless_null $P198, vivify_64
    new $P198, "Undef"
  vivify_64:
    find_lex $P199, "self"
    $P200 = $P198."process_queue"($P199)
# .annotate "line", 64
    .return ($P200)
  control_195:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P201, exception, "payload"
    .return ($P201)
.end


.namespace ["Program"]
.sub "do_start"  :subid("24_1268929819.18389") :method :outer("12_1268929819.18389")
# .annotate "line", 68
    new $P204, 'ExceptionHandler'
    set_addr $P204, control_203
    $P204."handle_types"(58)
    push_eh $P204
    .lex "self", self
# .annotate "line", 69
    find_lex $P205, "self"
    getattribute $P206, $P205, "$!start_marshaller"
    unless_null $P206, vivify_65
    new $P206, "Undef"
  vivify_65:
    find_lex $P207, "self"
    $P208 = $P206."process_queue"($P207)
# .annotate "line", 68
    .return ($P208)
  control_203:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P209, exception, "payload"
    .return ($P209)
.end


.namespace ["Program"]
.sub "exit_program"  :subid("25_1268929819.18389") :method :outer("12_1268929819.18389")
    .param pmc param_215 :optional
    .param int has_param_215 :opt_flag
# .annotate "line", 84
    new $P214, 'ExceptionHandler'
    set_addr $P214, control_213
    $P214."handle_types"(58)
    push_eh $P214
    .lex "self", self
    if has_param_215, optparam_66
    new $P216, "Integer"
    assign $P216, 0
    set param_215, $P216
  optparam_66:
    .lex "$status", param_215
# .annotate "line", 85
    find_lex $P217, "$status"
    find_lex $P218, "self"
    setattribute $P218, "$!exit_value", $P217
# .annotate "line", 84
    .return ($P217)
  control_213:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P219, exception, "payload"
    .return ($P219)
.end


.namespace ["Program"]
.sub "_init_obj"  :subid("26_1268929819.18389") :method :outer("12_1268929819.18389")
    .param pmc param_225 :slurpy
    .param pmc param_226 :slurpy :named
# .annotate "line", 96
    new $P224, 'ExceptionHandler'
    set_addr $P224, control_223
    $P224."handle_types"(58)
    push_eh $P224
    .lex "self", self
    .lex "@pos", param_225
    .lex "%named", param_226
# .annotate "line", 97
    find_lex $P227, "self"
    getattribute $P228, $P227, "@!argv"
    unless_null $P228, vivify_67
    $P228 = root_new ['parrot';'ResizablePMCArray']
  vivify_67:
    find_lex $P229, "self"
    setattribute $P229, "@!argv", $P228
# .annotate "line", 98
    find_lex $P230, "self"
    getattribute $P231, $P230, "$!executable_name"
    unless_null $P231, vivify_68
    new $P231, "Undef"
  vivify_68:
    find_lex $P232, "self"
    setattribute $P232, "$!executable_name", $P231
# .annotate "line", 99
    get_hll_global $P233, "ComponentMarshaller"
    $P234 = $P233."new"("exit" :named("name"))
    find_lex $P235, "self"
    setattribute $P235, "$!exit_marshaller", $P234
# .annotate "line", 100
    new $P236, "Integer"
    assign $P236, 0
    find_lex $P237, "self"
    setattribute $P237, "$!exit_value", $P236
# .annotate "line", 101
    find_lex $P238, "self"
    getattribute $P239, $P238, "$!program_name"
    unless_null $P239, vivify_69
    new $P239, "Undef"
  vivify_69:
    find_lex $P240, "self"
    setattribute $P240, "$!program_name", $P239
# .annotate "line", 102
    get_hll_global $P241, "ComponentMarshaller"
    $P242 = $P241."new"("start" :named("name"))
    find_lex $P243, "self"
    setattribute $P243, "$!start_marshaller", $P242
# .annotate "line", 105
    find_lex $P244, "self"
    find_lex $P245, "@pos"
    find_lex $P246, "%named"
    $P247 = $P244."_init_args"($P245 :flat, $P246 :flat)
# .annotate "line", 96
    .return ($P247)
  control_223:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P248, exception, "payload"
    .return ($P248)
.end


.namespace ["Program"]
.sub "from_parrot"  :subid("27_1268929819.18389") :method :outer("12_1268929819.18389")
    .param pmc param_252 :optional
    .param int has_param_252 :opt_flag
# .annotate "line", 108
    new $P251, 'ExceptionHandler'
    set_addr $P251, control_250
    $P251."handle_types"(58)
    push_eh $P251
    .lex "self", self
    if has_param_252, optparam_70
    new $P253, "Undef"
    set param_252, $P253
  optparam_70:
    .lex "$ignored", param_252
# .annotate "line", 109
    new $P254, "Undef"
    .lex "$interp", $P254
    getinterp $P255
    store_lex "$interp", $P255
# .annotate "line", 111
    find_lex $P256, "$interp"
    unless_null $P256, vivify_71
    $P256 = root_new ['parrot';'ResizablePMCArray']
  vivify_71:
    set $P257, $P256[2]
    unless_null $P257, vivify_72
    new $P257, "Undef"
  vivify_72:
    find_lex $P258, "self"
    setattribute $P258, "@!argv", $P257
# .annotate "line", 112
    find_lex $P259, "$interp"
    unless_null $P259, vivify_73
    $P259 = root_new ['parrot';'ResizablePMCArray']
  vivify_73:
    set $P260, $P259[9]
    unless_null $P260, vivify_74
    new $P260, "Undef"
  vivify_74:
    find_lex $P261, "self"
    setattribute $P261, "$!executable_name", $P260
# .annotate "line", 113
    find_lex $P262, "self"
    getattribute $P263, $P262, "@!argv"
    unless_null $P263, vivify_75
    $P263 = root_new ['parrot';'ResizablePMCArray']
  vivify_75:
    $P264 = $P263."shift"()
    find_lex $P265, "self"
    setattribute $P265, "$!program_name", $P264
# .annotate "line", 108
    .return ($P264)
  control_250:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P266, exception, "payload"
    .return ($P266)
.end


.namespace ["Program"]
.sub "main"  :subid("28_1268929819.18389") :method :outer("12_1268929819.18389")
    .param pmc param_271 :slurpy
# .annotate "line", 135
    new $P270, 'ExceptionHandler'
    set_addr $P270, control_269
    $P270."handle_types"(58)
    push_eh $P270
    .lex "self", self
    .lex "@argv", param_271
# .annotate "line", 136
    new $P272, "Undef"
    .lex "&main", $P272
    new $P273, "String"
    assign $P273, "main"
    set $S274, $P273
    get_hll_global $P275, $S274
    store_lex "&main", $P275
# .annotate "line", 139
    find_lex $P277, "&main"
    isnull $I278, $P277
    unless $I278, if_276_end
# .annotate "line", 138
    new $P279, "String"
    assign $P279, "MAIN"
    set $S280, $P279
    get_hll_global $P281, $S280
    store_lex "&main", $P281
  if_276_end:
# .annotate "line", 141
    find_lex $P283, "&main"
    isnull $I284, $P283
    unless $I284, if_282_end
# .annotate "line", 142
    "die"("You must override the '.main' method of your program class.")
  if_282_end:
# .annotate "line", 145
    find_lex $P285, "&main"
    find_lex $P286, "@argv"
    $P287 = $P285($P286)
# .annotate "line", 135
    .return ($P287)
  control_269:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P288, exception, "payload"
    .return ($P288)
.end


.namespace ["Program"]
.sub "run"  :subid("29_1268929819.18389") :method :outer("12_1268929819.18389")
    .param pmc param_292 :optional :named("argv")
    .param int has_param_292 :opt_flag
# .annotate "line", 148
    .const 'Sub' $P307 = "30_1268929819.18389" 
    capture_lex $P307
    new $P291, 'ExceptionHandler'
    set_addr $P291, control_290
    $P291."handle_types"(58)
    push_eh $P291
    .lex "self", self
    if has_param_292, optparam_76
    $P293 = root_new ['parrot';'ResizablePMCArray']
    set param_292, $P293
  optparam_76:
    .lex "@argv", param_292
# .annotate "line", 152
    $P294 = root_new ['parrot';'Hash']
    .lex "%save_fh", $P294
# .annotate "line", 149
    find_lex $P296, "@argv"
    unless $P296, if_295_end
    find_lex $P297, "self"
    find_lex $P298, "@argv"
    $P297."argv"($P298)
  if_295_end:
# .annotate "line", 152
    find_lex $P299, "self"
    getattribute $P300, $P299, "$!stderr"
    unless_null $P300, vivify_77
    new $P300, "Undef"
  vivify_77:
    find_lex $P301, "self"
    getattribute $P302, $P301, "$!stdin"
    unless_null $P302, vivify_78
    new $P302, "Undef"
  vivify_78:
    find_lex $P303, "self"
    getattribute $P304, $P303, "$!stdout"
    unless_null $P304, vivify_79
    new $P304, "Undef"
  vivify_79:
    $P305 = "swap_handles"($P300 :named("stderr"), $P302 :named("stdin"), $P304 :named("stdout"))
    store_lex "%save_fh", $P305
# .annotate "line", 154
    .const 'Sub' $P307 = "30_1268929819.18389" 
    capture_lex $P307
    $P307()
# .annotate "line", 169
    find_lex $P335, "self"
    $P335."do_exit"()
# .annotate "line", 171
    find_lex $P336, "%save_fh"
    "swap_handles"($P336 :flat)
# .annotate "line", 173
    find_lex $P337, "self"
    find_lex $P338, "self"
    getattribute $P339, $P338, "$!exit_value"
    unless_null $P339, vivify_81
    new $P339, "Undef"
  vivify_81:
    $P340 = $P337."exit_program"($P339)
# .annotate "line", 148
    .return ($P340)
  control_290:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P341, exception, "payload"
    .return ($P341)
.end


.namespace ["Program"]
.sub "_block306"  :anon :subid("30_1268929819.18389") :outer("29_1268929819.18389")
# .annotate "line", 154
    .const 'Sub' $P318 = "31_1268929819.18389" 
    capture_lex $P318
    new $P314, 'ExceptionHandler'
    set_addr $P314, control_313
    $P314."handle_types_except"(58, 59, 60, 61, 63, 64, 65, 66, 67)
    push_eh $P314
# .annotate "line", 155
    find_lex $P308, "self"
    $P308."do_start"()
# .annotate "line", 156
    find_lex $P309, "self"
    find_lex $P310, "self"
    getattribute $P311, $P310, "@!argv"
    unless_null $P311, vivify_80
    $P311 = root_new ['parrot';'ResizablePMCArray']
  vivify_80:
    $P309."main"($P311 :flat)
# .annotate "line", 154
    pop_eh 
    goto skip_handler_312
  control_313:
# .annotate "line", 158
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P318 = "31_1268929819.18389" 
    capture_lex $P318
    $P318(exception)
    new $P333, 'Integer'
    set $P333, 1
    set exception["handled"], $P333
    set $I334, exception["handled"]
    ne $I334, 1, nothandled_316
  handled_315:
    .return (exception)
  nothandled_316:
    rethrow exception
  skip_handler_312:
# .annotate "line", 154
    .return ()
.end


.namespace ["Program"]
.sub "_block317"  :anon :subid("31_1268929819.18389") :outer("30_1268929819.18389")
    .param pmc param_319
# .annotate "line", 158
    .lex "$_", param_319
    find_lex $P320, "$_"
    .lex "$!", $P320
# .annotate "line", 159
    find_lex $P323, "$!"
    $N324 = $P323."type"()
    get_hll_global $P325, ["Exception"], "ProgramExit"
    $N326 = $P325."type"()
    iseq $I327, $N324, $N326
    if $I327, if_322
# .annotate "line", 163
    find_lex $P331, "$!"
    $P332 = $P331."rethrow"()
# .annotate "line", 162
    set $P321, $P332
# .annotate "line", 159
    goto if_322_end
  if_322:
# .annotate "line", 160
    find_lex $P328, "$!"
    $P329 = $P328."payload"()
    find_lex $P330, "self"
    setattribute $P330, "$!exit_value", $P329
# .annotate "line", 159
    set $P321, $P329
  if_322_end:
# .annotate "line", 158
    .return ($P321)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929877.33477")
# .annotate "line", 0
    get_hll_global $P14, ["UnitTest";"Assertions"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["UnitTest";"Assertions"], "_block13" 
    capture_lex $P14
    $P459 = $P14()
# .annotate "line", 1
    .return ($P459)
.end


.namespace ["UnitTest";"Assertions"]
.sub "_block13"  :subid("11_1268929877.33477") :outer("10_1268929877.33477")
# .annotate "line", 6
    .const 'Sub' $P423 = "43_1268929877.33477" 
    capture_lex $P423
    .const 'Sub' $P413 = "42_1268929877.33477" 
    capture_lex $P413
    .const 'Sub' $P386 = "41_1268929877.33477" 
    capture_lex $P386
    .const 'Sub' $P375 = "40_1268929877.33477" 
    capture_lex $P375
    .const 'Sub' $P364 = "39_1268929877.33477" 
    capture_lex $P364
    .const 'Sub' $P336 = "36_1268929877.33477" 
    capture_lex $P336
    .const 'Sub' $P297 = "33_1268929877.33477" 
    capture_lex $P297
    .const 'Sub' $P283 = "32_1268929877.33477" 
    capture_lex $P283
    .const 'Sub' $P269 = "31_1268929877.33477" 
    capture_lex $P269
    .const 'Sub' $P257 = "30_1268929877.33477" 
    capture_lex $P257
    .const 'Sub' $P245 = "29_1268929877.33477" 
    capture_lex $P245
    .const 'Sub' $P219 = "27_1268929877.33477" 
    capture_lex $P219
    .const 'Sub' $P193 = "25_1268929877.33477" 
    capture_lex $P193
    .const 'Sub' $P177 = "24_1268929877.33477" 
    capture_lex $P177
    .const 'Sub' $P161 = "23_1268929877.33477" 
    capture_lex $P161
    .const 'Sub' $P144 = "22_1268929877.33477" 
    capture_lex $P144
    .const 'Sub' $P127 = "21_1268929877.33477" 
    capture_lex $P127
    .const 'Sub' $P113 = "20_1268929877.33477" 
    capture_lex $P113
    .const 'Sub' $P99 = "19_1268929877.33477" 
    capture_lex $P99
    .const 'Sub' $P87 = "18_1268929877.33477" 
    capture_lex $P87
    .const 'Sub' $P75 = "17_1268929877.33477" 
    capture_lex $P75
    .const 'Sub' $P60 = "16_1268929877.33477" 
    capture_lex $P60
    .const 'Sub' $P45 = "15_1268929877.33477" 
    capture_lex $P45
    .const 'Sub' $P33 = "14_1268929877.33477" 
    capture_lex $P33
    .const 'Sub' $P21 = "13_1268929877.33477" 
    capture_lex $P21
    .const 'Sub' $P15 = "12_1268929877.33477" 
    capture_lex $P15
# .annotate "line", 10
    .const 'Sub' $P15 = "12_1268929877.33477" 
    capture_lex $P15
    .lex "_initload", $P15
# .annotate "line", 42
    .const 'Sub' $P21 = "13_1268929877.33477" 
    capture_lex $P21
    .lex "assert_block", $P21
# .annotate "line", 46
    .const 'Sub' $P33 = "14_1268929877.33477" 
    capture_lex $P33
    .lex "assert_block_false", $P33
# .annotate "line", 50
    .const 'Sub' $P45 = "15_1268929877.33477" 
    capture_lex $P45
    .lex "assert_can", $P45
# .annotate "line", 54
    .const 'Sub' $P60 = "16_1268929877.33477" 
    capture_lex $P60
    .lex "assert_can_not", $P60
# .annotate "line", 58
    .const 'Sub' $P75 = "17_1268929877.33477" 
    capture_lex $P75
    .lex "assert_defined", $P75
# .annotate "line", 62
    .const 'Sub' $P87 = "18_1268929877.33477" 
    capture_lex $P87
    .lex "assert_not_defined", $P87
# .annotate "line", 66
    .const 'Sub' $P99 = "19_1268929877.33477" 
    capture_lex $P99
    .lex "assert_equal", $P99
# .annotate "line", 70
    .const 'Sub' $P113 = "20_1268929877.33477" 
    capture_lex $P113
    .lex "assert_not_equal", $P113
# .annotate "line", 74
    .const 'Sub' $P127 = "21_1268929877.33477" 
    capture_lex $P127
    .lex "assert_instance_of", $P127
# .annotate "line", 78
    .const 'Sub' $P144 = "22_1268929877.33477" 
    capture_lex $P144
    .lex "assert_not_instance_of", $P144
# .annotate "line", 82
    .const 'Sub' $P161 = "23_1268929877.33477" 
    capture_lex $P161
    .lex "assert_isa", $P161
# .annotate "line", 86
    .const 'Sub' $P177 = "24_1268929877.33477" 
    capture_lex $P177
    .lex "assert_not_isa", $P177
# .annotate "line", 90
    .const 'Sub' $P193 = "25_1268929877.33477" 
    capture_lex $P193
    .lex "assert_match", $P193
# .annotate "line", 98
    .const 'Sub' $P219 = "27_1268929877.33477" 
    capture_lex $P219
    .lex "assert_not_match", $P219
# .annotate "line", 106
    .const 'Sub' $P245 = "29_1268929877.33477" 
    capture_lex $P245
    .lex "assert_null", $P245
# .annotate "line", 110
    .const 'Sub' $P257 = "30_1268929877.33477" 
    capture_lex $P257
    .lex "assert_not_null", $P257
# .annotate "line", 114
    .const 'Sub' $P269 = "31_1268929877.33477" 
    capture_lex $P269
    .lex "assert_same", $P269
# .annotate "line", 118
    .const 'Sub' $P283 = "32_1268929877.33477" 
    capture_lex $P283
    .lex "assert_not_same", $P283
# .annotate "line", 122
    .const 'Sub' $P297 = "33_1268929877.33477" 
    capture_lex $P297
    .lex "assert_throws", $P297
# .annotate "line", 137
    .const 'Sub' $P336 = "36_1268929877.33477" 
    capture_lex $P336
    .lex "assert_throws_nothing", $P336
# .annotate "line", 148
    .const 'Sub' $P364 = "39_1268929877.33477" 
    capture_lex $P364
    .lex "assert_true", $P364
# .annotate "line", 152
    .const 'Sub' $P375 = "40_1268929877.33477" 
    capture_lex $P375
    .lex "assert_false", $P375
# .annotate "line", 156
    .const 'Sub' $P386 = "41_1268929877.33477" 
    capture_lex $P386
    .lex "assert_within_delta", $P386
# .annotate "line", 165
    .const 'Sub' $P413 = "42_1268929877.33477" 
    capture_lex $P413
    .lex "want_fail", $P413
# .annotate "line", 169
    .const 'Sub' $P423 = "43_1268929877.33477" 
    capture_lex $P423
    .lex "want_pass", $P423
# .annotate "line", 6
    find_lex $P432, "_initload"
    find_lex $P433, "assert_block"
    find_lex $P434, "assert_block_false"
    find_lex $P435, "assert_can"
    find_lex $P436, "assert_can_not"
    find_lex $P437, "assert_defined"
    find_lex $P438, "assert_not_defined"
    find_lex $P439, "assert_equal"
    find_lex $P440, "assert_not_equal"
    find_lex $P441, "assert_instance_of"
    find_lex $P442, "assert_not_instance_of"
    find_lex $P443, "assert_isa"
    find_lex $P444, "assert_not_isa"
    find_lex $P445, "assert_match"
    find_lex $P446, "assert_not_match"
    find_lex $P447, "assert_null"
    find_lex $P448, "assert_not_null"
    find_lex $P449, "assert_same"
    find_lex $P450, "assert_not_same"
    find_lex $P451, "assert_throws"
    find_lex $P452, "assert_throws_nothing"
    find_lex $P453, "assert_true"
    find_lex $P454, "assert_false"
    find_lex $P455, "assert_within_delta"
    find_lex $P456, "want_fail"
    find_lex $P457, "want_pass"
    .return ($P457)
.end


.namespace ["UnitTest";"Assertions"]
.sub "" :load :init :subid("post44") :outer("11_1268929877.33477")
# .annotate "line", 6
    get_hll_global $P14, ["UnitTest";"Assertions"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 7
    get_hll_global $P458, ["Kakapo"], "depends_on"
    $P458("UnitTest::Testcase")
.end


.namespace ["UnitTest";"Assertions"]
.sub "_initload"  :subid("12_1268929877.33477") :outer("11_1268929877.33477")
# .annotate "line", 10
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
# .annotate "line", 11
    "use"("UnitTest::Testcase")
# .annotate "line", 13
    new $P18, "ResizablePMCArray"
    push $P18, "assert_block"
    push $P18, "assert_block_false"
    push $P18, "assert_can"
    push $P18, "assert_can_not"
    push $P18, "assert_defined"
    push $P18, "assert_not_defined"
    push $P18, "assert_equal"
    push $P18, "assert_not_equal"
    push $P18, "assert_instance_of"
    push $P18, "assert_not_instance_of"
    push $P18, "assert_isa"
    push $P18, "assert_not_isa"
    push $P18, "assert_match"
    push $P18, "assert_not_match"
    push $P18, "assert_null"
    push $P18, "assert_not_null"
    push $P18, "assert_same"
    push $P18, "assert_not_same"
    push $P18, "assert_throws"
    push $P18, "assert_throws_nothing"
    push $P18, "assert_true"
    push $P18, "assert_false"
    push $P18, "assert_within_delta"
    push $P18, "want_fail"
    push $P18, "want_pass"
    $P19 = "export"($P18)
# .annotate "line", 10
    .return ($P19)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P20, exception, "payload"
    .return ($P20)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_block"  :subid("13_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_24
    .param pmc param_25
# .annotate "line", 42
    new $P23, 'ExceptionHandler'
    set_addr $P23, control_22
    $P23."handle_types"(58)
    push_eh $P23
    .lex "$message", param_24
    .lex "&block", param_25
# .annotate "line", 43
    find_lex $P28, "&block"
    $P29 = $P28()
    unless $P29, unless_27
    set $P26, $P29
    goto unless_27_end
  unless_27:
    find_lex $P30, "$message"
    $P31 = "fail"($P30)
    set $P26, $P31
  unless_27_end:
# .annotate "line", 42
    .return ($P26)
  control_22:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P32, exception, "payload"
    .return ($P32)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_block_false"  :subid("14_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_36
    .param pmc param_37
# .annotate "line", 46
    new $P35, 'ExceptionHandler'
    set_addr $P35, control_34
    $P35."handle_types"(58)
    push_eh $P35
    .lex "$message", param_36
    .lex "&block", param_37
# .annotate "line", 47
    find_lex $P40, "&block"
    $P41 = $P40()
    if $P41, if_39
    set $P38, $P41
    goto if_39_end
  if_39:
    find_lex $P42, "$message"
    $P43 = "fail"($P42)
    set $P38, $P43
  if_39_end:
# .annotate "line", 46
    .return ($P38)
  control_34:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P44, exception, "payload"
    .return ($P44)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_can"  :subid("15_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_48
    .param pmc param_49
    .param pmc param_50
# .annotate "line", 50
    new $P47, 'ExceptionHandler'
    set_addr $P47, control_46
    $P47."handle_types"(58)
    push_eh $P47
    .lex "$obj", param_48
    .lex "$method", param_49
    .lex "$message", param_50
# .annotate "line", 51
    find_lex $P53, "$obj"
    find_lex $P54, "$method"
    set $S55, $P54
    can $I56, $P53, $S55
    unless $I56, unless_52
    new $P51, 'Integer'
    set $P51, $I56
    goto unless_52_end
  unless_52:
    find_lex $P57, "$message"
    $P58 = "fail"($P57)
    set $P51, $P58
  unless_52_end:
# .annotate "line", 50
    .return ($P51)
  control_46:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P59, exception, "payload"
    .return ($P59)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_can_not"  :subid("16_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_63
    .param pmc param_64
    .param pmc param_65
# .annotate "line", 54
    new $P62, 'ExceptionHandler'
    set_addr $P62, control_61
    $P62."handle_types"(58)
    push_eh $P62
    .lex "$obj", param_63
    .lex "$method", param_64
    .lex "$message", param_65
# .annotate "line", 55
    find_lex $P68, "$obj"
    find_lex $P69, "$method"
    set $S70, $P69
    can $I71, $P68, $S70
    if $I71, if_67
    new $P66, 'Integer'
    set $P66, $I71
    goto if_67_end
  if_67:
    find_lex $P72, "$message"
    $P73 = "fail"($P72)
    set $P66, $P73
  if_67_end:
# .annotate "line", 54
    .return ($P66)
  control_61:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P74, exception, "payload"
    .return ($P74)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_defined"  :subid("17_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_78
    .param pmc param_79
# .annotate "line", 58
    new $P77, 'ExceptionHandler'
    set_addr $P77, control_76
    $P77."handle_types"(58)
    push_eh $P77
    .lex "$obj", param_78
    .lex "$message", param_79
# .annotate "line", 59
    find_lex $P82, "$obj"
    defined $I83, $P82
    unless $I83, unless_81
    new $P80, 'Integer'
    set $P80, $I83
    goto unless_81_end
  unless_81:
    find_lex $P84, "$message"
    $P85 = "fail"($P84)
    set $P80, $P85
  unless_81_end:
# .annotate "line", 58
    .return ($P80)
  control_76:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P86, exception, "payload"
    .return ($P86)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_not_defined"  :subid("18_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_90
    .param pmc param_91
# .annotate "line", 62
    new $P89, 'ExceptionHandler'
    set_addr $P89, control_88
    $P89."handle_types"(58)
    push_eh $P89
    .lex "$obj", param_90
    .lex "$message", param_91
# .annotate "line", 63
    find_lex $P94, "$obj"
    defined $I95, $P94
    if $I95, if_93
    new $P92, 'Integer'
    set $P92, $I95
    goto if_93_end
  if_93:
    find_lex $P96, "$message"
    $P97 = "fail"($P96)
    set $P92, $P97
  if_93_end:
# .annotate "line", 62
    .return ($P92)
  control_88:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P98, exception, "payload"
    .return ($P98)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_equal"  :subid("19_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_102
    .param pmc param_103
    .param pmc param_104
# .annotate "line", 66
    new $P101, 'ExceptionHandler'
    set_addr $P101, control_100
    $P101."handle_types"(58)
    push_eh $P101
    .lex "$o1", param_102
    .lex "$o2", param_103
    .lex "$message", param_104
# .annotate "line", 67
    find_lex $P107, "$o2"
    find_lex $P108, "$o1"
    iseq $I109, $P107, $P108
    unless $I109, unless_106
    new $P105, 'Integer'
    set $P105, $I109
    goto unless_106_end
  unless_106:
    find_lex $P110, "$message"
    $P111 = "fail"($P110)
    set $P105, $P111
  unless_106_end:
# .annotate "line", 66
    .return ($P105)
  control_100:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_not_equal"  :subid("20_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_116
    .param pmc param_117
    .param pmc param_118
# .annotate "line", 70
    new $P115, 'ExceptionHandler'
    set_addr $P115, control_114
    $P115."handle_types"(58)
    push_eh $P115
    .lex "$o1", param_116
    .lex "$o2", param_117
    .lex "$message", param_118
# .annotate "line", 71
    find_lex $P121, "$o2"
    find_lex $P122, "$o1"
    iseq $I123, $P121, $P122
    if $I123, if_120
    new $P119, 'Integer'
    set $P119, $I123
    goto if_120_end
  if_120:
    find_lex $P124, "$message"
    $P125 = "fail"($P124)
    set $P119, $P125
  if_120_end:
# .annotate "line", 70
    .return ($P119)
  control_114:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P126, exception, "payload"
    .return ($P126)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_instance_of"  :subid("21_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_130
    .param pmc param_131
    .param pmc param_132
# .annotate "line", 74
    new $P129, 'ExceptionHandler'
    set_addr $P129, control_128
    $P129."handle_types"(58)
    push_eh $P129
    .lex "$obj", param_130
    .lex "$class", param_131
    .lex "$message", param_132
# .annotate "line", 75
    find_lex $P135, "$obj"
    class $P136, $P135
    get_hll_global $P137, "P6metaclass"
    find_lex $P138, "$class"
    $P139 = $P137."get_parrotclass"($P138)
    issame $I140, $P136, $P139
    unless $I140, unless_134
    new $P133, 'Integer'
    set $P133, $I140
    goto unless_134_end
  unless_134:
    find_lex $P141, "$message"
    $P142 = "fail"($P141)
    set $P133, $P142
  unless_134_end:
# .annotate "line", 74
    .return ($P133)
  control_128:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P143, exception, "payload"
    .return ($P143)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_not_instance_of"  :subid("22_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_147
    .param pmc param_148
    .param pmc param_149
# .annotate "line", 78
    new $P146, 'ExceptionHandler'
    set_addr $P146, control_145
    $P146."handle_types"(58)
    push_eh $P146
    .lex "$obj", param_147
    .lex "$class", param_148
    .lex "$message", param_149
# .annotate "line", 79
    find_lex $P152, "$obj"
    class $P153, $P152
    get_hll_global $P154, "P6metaclass"
    find_lex $P155, "$class"
    $P156 = $P154."get_parrotclass"($P155)
    issame $I157, $P153, $P156
    if $I157, if_151
    new $P150, 'Integer'
    set $P150, $I157
    goto if_151_end
  if_151:
    find_lex $P158, "$message"
    $P159 = "fail"($P158)
    set $P150, $P159
  if_151_end:
# .annotate "line", 78
    .return ($P150)
  control_145:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P160, exception, "payload"
    .return ($P160)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_isa"  :subid("23_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_164
    .param pmc param_165
    .param pmc param_166
# .annotate "line", 82
    new $P163, 'ExceptionHandler'
    set_addr $P163, control_162
    $P163."handle_types"(58)
    push_eh $P163
    .lex "$obj", param_164
    .lex "$class", param_165
    .lex "$message", param_166
# .annotate "line", 83
    find_lex $P169, "$obj"
    get_hll_global $P170, "P6metaclass"
    find_lex $P171, "$class"
    $P172 = $P170."get_parrotclass"($P171)
    isa $I173, $P169, $P172
    unless $I173, unless_168
    new $P167, 'Integer'
    set $P167, $I173
    goto unless_168_end
  unless_168:
    find_lex $P174, "$message"
    $P175 = "fail"($P174)
    set $P167, $P175
  unless_168_end:
# .annotate "line", 82
    .return ($P167)
  control_162:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P176, exception, "payload"
    .return ($P176)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_not_isa"  :subid("24_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_180
    .param pmc param_181
    .param pmc param_182
# .annotate "line", 86
    new $P179, 'ExceptionHandler'
    set_addr $P179, control_178
    $P179."handle_types"(58)
    push_eh $P179
    .lex "$obj", param_180
    .lex "$class", param_181
    .lex "$message", param_182
# .annotate "line", 87
    find_lex $P185, "$obj"
    get_hll_global $P186, "P6metaclass"
    find_lex $P187, "$class"
    $P188 = $P186."get_parrotclass"($P187)
    isa $I189, $P185, $P188
    if $I189, if_184
    new $P183, 'Integer'
    set $P183, $I189
    goto if_184_end
  if_184:
    find_lex $P190, "$message"
    $P191 = "fail"($P190)
    set $P183, $P191
  if_184_end:
# .annotate "line", 86
    .return ($P183)
  control_178:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P192, exception, "payload"
    .return ($P192)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_match"  :subid("25_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_196
    .param pmc param_197
    .param pmc param_198
# .annotate "line", 90
    .const 'Sub' $P205 = "26_1268929877.33477" 
    capture_lex $P205
    new $P195, 'ExceptionHandler'
    set_addr $P195, control_194
    $P195."handle_types"(58)
    push_eh $P195
    .lex "$obj", param_196
    .lex "$matcher", param_197
    .lex "$message", param_198
# .annotate "line", 91
    find_lex $P201, "$matcher"
    find_lex $P202, "$obj"
    $P203 = $P201."matches"($P202)
    unless $P203, unless_200
    set $P199, $P203
    goto unless_200_end
  unless_200:
    .const 'Sub' $P205 = "26_1268929877.33477" 
    capture_lex $P205
    $P217 = $P205()
    set $P199, $P217
  unless_200_end:
# .annotate "line", 90
    .return ($P199)
  control_194:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P218, exception, "payload"
    .return ($P218)
.end


.namespace ["UnitTest";"Assertions"]
.sub "_block204"  :anon :subid("26_1268929877.33477") :outer("25_1268929877.33477")
# .annotate "line", 92
    new $P206, "Undef"
    .lex "$explain", $P206
    find_lex $P207, "$matcher"
    $P208 = $P207."describe_self"("\nExpected ")
# .annotate "line", 93
    find_lex $P209, "$matcher"
    find_lex $P210, "$obj"
    $S211 = $P209."describe_failure"("\nbut ", $P210)
    concat $P212, $P208, $S211
    store_lex "$explain", $P212
# .annotate "line", 94
    find_lex $P213, "$message"
    find_lex $P214, "$explain"
    concat $P215, $P213, $P214
    $P216 = "fail"($P215)
# .annotate "line", 91
    .return ($P216)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_not_match"  :subid("27_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_222
    .param pmc param_223
    .param pmc param_224
# .annotate "line", 98
    .const 'Sub' $P231 = "28_1268929877.33477" 
    capture_lex $P231
    new $P221, 'ExceptionHandler'
    set_addr $P221, control_220
    $P221."handle_types"(58)
    push_eh $P221
    .lex "$obj", param_222
    .lex "$matcher", param_223
    .lex "$message", param_224
# .annotate "line", 99
    find_lex $P227, "$matcher"
    find_lex $P228, "$obj"
    $P229 = $P227."matches"($P228)
    if $P229, if_226
    set $P225, $P229
    goto if_226_end
  if_226:
    .const 'Sub' $P231 = "28_1268929877.33477" 
    capture_lex $P231
    $P243 = $P231()
    set $P225, $P243
  if_226_end:
# .annotate "line", 98
    .return ($P225)
  control_220:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P244, exception, "payload"
    .return ($P244)
.end


.namespace ["UnitTest";"Assertions"]
.sub "_block230"  :anon :subid("28_1268929877.33477") :outer("27_1268929877.33477")
# .annotate "line", 100
    new $P232, "Undef"
    .lex "$explain", $P232
    find_lex $P233, "$matcher"
    $P234 = $P233."describe_self"("\nExpected ")
# .annotate "line", 101
    find_lex $P235, "$matcher"
    find_lex $P236, "$obj"
    $S237 = $P235."describe_failure"("\nbut ", $P236)
    concat $P238, $P234, $S237
    store_lex "$explain", $P238
# .annotate "line", 102
    find_lex $P239, "$message"
    find_lex $P240, "$explain"
    concat $P241, $P239, $P240
    $P242 = "fail"($P241)
# .annotate "line", 99
    .return ($P242)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_null"  :subid("29_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_248
    .param pmc param_249
# .annotate "line", 106
    new $P247, 'ExceptionHandler'
    set_addr $P247, control_246
    $P247."handle_types"(58)
    push_eh $P247
    .lex "$obj", param_248
    .lex "$message", param_249
# .annotate "line", 107
    find_lex $P252, "$obj"
    isnull $I253, $P252
    unless $I253, unless_251
    new $P250, 'Integer'
    set $P250, $I253
    goto unless_251_end
  unless_251:
    find_lex $P254, "$message"
    $P255 = "fail"($P254)
    set $P250, $P255
  unless_251_end:
# .annotate "line", 106
    .return ($P250)
  control_246:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P256, exception, "payload"
    .return ($P256)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_not_null"  :subid("30_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_260
    .param pmc param_261
# .annotate "line", 110
    new $P259, 'ExceptionHandler'
    set_addr $P259, control_258
    $P259."handle_types"(58)
    push_eh $P259
    .lex "$obj", param_260
    .lex "$message", param_261
# .annotate "line", 111
    find_lex $P264, "$obj"
    isnull $I265, $P264
    if $I265, if_263
    new $P262, 'Integer'
    set $P262, $I265
    goto if_263_end
  if_263:
    find_lex $P266, "$message"
    $P267 = "fail"($P266)
    set $P262, $P267
  if_263_end:
# .annotate "line", 110
    .return ($P262)
  control_258:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P268, exception, "payload"
    .return ($P268)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_same"  :subid("31_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_272
    .param pmc param_273
    .param pmc param_274
# .annotate "line", 114
    new $P271, 'ExceptionHandler'
    set_addr $P271, control_270
    $P271."handle_types"(58)
    push_eh $P271
    .lex "$o1", param_272
    .lex "$o2", param_273
    .lex "$message", param_274
# .annotate "line", 115
    find_lex $P277, "$o1"
    find_lex $P278, "$o2"
    issame $I279, $P277, $P278
    unless $I279, unless_276
    new $P275, 'Integer'
    set $P275, $I279
    goto unless_276_end
  unless_276:
    find_lex $P280, "$message"
    $P281 = "fail"($P280)
    set $P275, $P281
  unless_276_end:
# .annotate "line", 114
    .return ($P275)
  control_270:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P282, exception, "payload"
    .return ($P282)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_not_same"  :subid("32_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_286
    .param pmc param_287
    .param pmc param_288
# .annotate "line", 118
    new $P285, 'ExceptionHandler'
    set_addr $P285, control_284
    $P285."handle_types"(58)
    push_eh $P285
    .lex "$o1", param_286
    .lex "$o2", param_287
    .lex "$message", param_288
# .annotate "line", 119
    find_lex $P291, "$o1"
    find_lex $P292, "$o2"
    issame $I293, $P291, $P292
    if $I293, if_290
    new $P289, 'Integer'
    set $P289, $I293
    goto if_290_end
  if_290:
    find_lex $P294, "$message"
    $P295 = "fail"($P294)
    set $P289, $P295
  if_290_end:
# .annotate "line", 118
    .return ($P289)
  control_284:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P296, exception, "payload"
    .return ($P296)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_throws"  :subid("33_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_300
    .param pmc param_301
    .param pmc param_302
# .annotate "line", 122
    .const 'Sub' $P308 = "34_1268929877.33477" 
    capture_lex $P308
    new $P299, 'ExceptionHandler'
    set_addr $P299, control_298
    $P299."handle_types"(58)
    push_eh $P299
    .lex "$e_class", param_300
    .lex "$message", param_301
    .lex "&block", param_302
# .annotate "line", 123
    new $P303, "Undef"
    .lex "$ok", $P303
# .annotate "line", 124
    new $P304, "Undef"
    .lex "$exception", $P304
# .annotate "line", 123
    new $P305, "Integer"
    assign $P305, 0
    store_lex "$ok", $P305
    find_lex $P306, "$exception"
# .annotate "line", 126
    .const 'Sub' $P308 = "34_1268929877.33477" 
    capture_lex $P308
    $P308()
# .annotate "line", 132
    find_lex $P326, "$exception"
    $P327 = $P326."defined"()
    if $P327, if_325
    set $P324, $P327
    goto if_325_end
  if_325:
    find_lex $P328, "$exception"
    $N329 = $P328."type"()
    find_lex $P330, "$e_class"
    $N331 = $P330."type"()
    iseq $I332, $N329, $N331
    new $P324, 'Integer'
    set $P324, $I332
  if_325_end:
    unless $P324, unless_323
    set $P322, $P324
    goto unless_323_end
  unless_323:
# .annotate "line", 133
    find_lex $P333, "$message"
    $P334 = "fail"($P333)
# .annotate "line", 132
    set $P322, $P334
  unless_323_end:
# .annotate "line", 122
    .return ($P322)
  control_298:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P335, exception, "payload"
    .return ($P335)
.end


.namespace ["UnitTest";"Assertions"]
.sub "_block307"  :anon :subid("34_1268929877.33477") :outer("33_1268929877.33477")
# .annotate "line", 126
    .const 'Sub' $P316 = "35_1268929877.33477" 
    capture_lex $P316
    new $P312, 'ExceptionHandler'
    set_addr $P312, control_311
    $P312."handle_types_except"(58, 59, 60, 61, 63, 64, 65, 66, 67)
    push_eh $P312
# .annotate "line", 127
    find_lex $P309, "&block"
    $P309()
# .annotate "line", 126
    pop_eh 
    goto skip_handler_310
  control_311:
# .annotate "line", 129
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P316 = "35_1268929877.33477" 
    capture_lex $P316
    $P316(exception)
    new $P320, 'Integer'
    set $P320, 1
    set exception["handled"], $P320
    set $I321, exception["handled"]
    ne $I321, 1, nothandled_314
  handled_313:
    .return (exception)
  nothandled_314:
    rethrow exception
  skip_handler_310:
# .annotate "line", 126
    .return ()
.end


.namespace ["UnitTest";"Assertions"]
.sub "_block315"  :anon :subid("35_1268929877.33477") :outer("34_1268929877.33477")
    .param pmc param_317
# .annotate "line", 129
    .lex "$_", param_317
    find_lex $P318, "$_"
    .lex "$!", $P318
    find_lex $P319, "$!"
    store_lex "$exception", $P319
    .return ($P319)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_throws_nothing"  :subid("36_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_339
    .param pmc param_340
# .annotate "line", 137
    .const 'Sub' $P344 = "37_1268929877.33477" 
    capture_lex $P344
    new $P338, 'ExceptionHandler'
    set_addr $P338, control_337
    $P338."handle_types"(58)
    push_eh $P338
    .lex "$message", param_339
    .lex "&block", param_340
# .annotate "line", 138
    new $P341, "Undef"
    .lex "$ok", $P341
    new $P342, "Integer"
    assign $P342, 1
    store_lex "$ok", $P342
# .annotate "line", 140
    .const 'Sub' $P344 = "37_1268929877.33477" 
    capture_lex $P344
    $P344()
# .annotate "line", 145
    find_lex $P360, "$ok"
    unless $P360, unless_359
    set $P358, $P360
    goto unless_359_end
  unless_359:
    find_lex $P361, "$message"
    $P362 = "fail"($P361)
    set $P358, $P362
  unless_359_end:
# .annotate "line", 137
    .return ($P358)
  control_337:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P363, exception, "payload"
    .return ($P363)
.end


.namespace ["UnitTest";"Assertions"]
.sub "_block343"  :anon :subid("37_1268929877.33477") :outer("36_1268929877.33477")
# .annotate "line", 140
    .const 'Sub' $P352 = "38_1268929877.33477" 
    capture_lex $P352
    new $P348, 'ExceptionHandler'
    set_addr $P348, control_347
    $P348."handle_types_except"(58, 59, 60, 61, 63, 64, 65, 66, 67)
    push_eh $P348
# .annotate "line", 141
    find_lex $P345, "&block"
    $P345()
# .annotate "line", 140
    pop_eh 
    goto skip_handler_346
  control_347:
# .annotate "line", 142
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P352 = "38_1268929877.33477" 
    capture_lex $P352
    $P352(exception)
    new $P356, 'Integer'
    set $P356, 1
    set exception["handled"], $P356
    set $I357, exception["handled"]
    ne $I357, 1, nothandled_350
  handled_349:
    .return (exception)
  nothandled_350:
    rethrow exception
  skip_handler_346:
# .annotate "line", 140
    .return ()
.end


.namespace ["UnitTest";"Assertions"]
.sub "_block351"  :anon :subid("38_1268929877.33477") :outer("37_1268929877.33477")
    .param pmc param_353
# .annotate "line", 142
    .lex "$_", param_353
    find_lex $P354, "$_"
    .lex "$!", $P354
    new $P355, "Integer"
    assign $P355, 0
    store_lex "$ok", $P355
    .return ($P355)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_true"  :subid("39_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_367
    .param pmc param_368
# .annotate "line", 148
    new $P366, 'ExceptionHandler'
    set_addr $P366, control_365
    $P366."handle_types"(58)
    push_eh $P366
    .lex "$bool", param_367
    .lex "$message", param_368
# .annotate "line", 149
    find_lex $P371, "$bool"
    unless $P371, unless_370
    set $P369, $P371
    goto unless_370_end
  unless_370:
    find_lex $P372, "$message"
    $P373 = "fail"($P372)
    set $P369, $P373
  unless_370_end:
# .annotate "line", 148
    .return ($P369)
  control_365:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P374, exception, "payload"
    .return ($P374)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_false"  :subid("40_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_378
    .param pmc param_379
# .annotate "line", 152
    new $P377, 'ExceptionHandler'
    set_addr $P377, control_376
    $P377."handle_types"(58)
    push_eh $P377
    .lex "$bool", param_378
    .lex "$message", param_379
# .annotate "line", 153
    find_lex $P382, "$bool"
    if $P382, if_381
    set $P380, $P382
    goto if_381_end
  if_381:
    find_lex $P383, "$message"
    $P384 = "fail"($P383)
    set $P380, $P384
  if_381_end:
# .annotate "line", 152
    .return ($P380)
  control_376:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P385, exception, "payload"
    .return ($P385)
.end


.namespace ["UnitTest";"Assertions"]
.sub "assert_within_delta"  :subid("41_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_389
    .param pmc param_390
    .param pmc param_391
    .param pmc param_392
# .annotate "line", 156
    new $P388, 'ExceptionHandler'
    set_addr $P388, control_387
    $P388."handle_types"(58)
    push_eh $P388
    .lex "$o1", param_389
    .lex "$o2", param_390
    .lex "$delta", param_391
    .lex "$message", param_392
# .annotate "line", 157
    new $P393, "Undef"
    .lex "$difference", $P393
    find_lex $P394, "$o1"
    find_lex $P395, "$o2"
    sub $P396, $P394, $P395
    store_lex "$difference", $P396
# .annotate "line", 158
    find_lex $P398, "$difference"
    set $N399, $P398
    islt $I400, $N399, 0.0
    unless $I400, if_397_end
    find_lex $P401, "$difference"
    neg $P402, $P401
    store_lex "$difference", $P402
  if_397_end:
# .annotate "line", 159
    find_lex $P405, "$difference"
    set $N406, $P405
    find_lex $P407, "$delta"
    set $N408, $P407
    islt $I409, $N406, $N408
    unless $I409, unless_404
    new $P403, 'Integer'
    set $P403, $I409
    goto unless_404_end
  unless_404:
    find_lex $P410, "$message"
    $P411 = "fail"($P410)
    set $P403, $P411
  unless_404_end:
# .annotate "line", 156
    .return ($P403)
  control_387:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P412, exception, "payload"
    .return ($P412)
.end


.namespace ["UnitTest";"Assertions"]
.sub "want_fail"  :subid("42_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_416
    .param pmc param_417
# .annotate "line", 165
    new $P415, 'ExceptionHandler'
    set_addr $P415, control_414
    $P415."handle_types"(58)
    push_eh $P415
    .lex "$message", param_416
    .lex "&block", param_417
# .annotate "line", 166
    get_hll_global $P418, ["Exception"], "UnitTestFailure"
    find_lex $P419, "$message"
    find_lex $P420, "&block"
    $P421 = "assert_throws"($P418, $P419, $P420)
# .annotate "line", 165
    .return ($P421)
  control_414:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P422, exception, "payload"
    .return ($P422)
.end


.namespace ["UnitTest";"Assertions"]
.sub "want_pass"  :subid("43_1268929877.33477") :outer("11_1268929877.33477")
    .param pmc param_426
    .param pmc param_427
# .annotate "line", 169
    new $P425, 'ExceptionHandler'
    set_addr $P425, control_424
    $P425."handle_types"(58)
    push_eh $P425
    .lex "$message", param_426
    .lex "&block", param_427
# .annotate "line", 170
    find_lex $P428, "$message"
    find_lex $P429, "&block"
    $P430 = "assert_throws_nothing"($P428, $P429)
# .annotate "line", 169
    .return ($P430)
  control_424:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P431, exception, "payload"
    .return ($P431)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929857.65447")
# .annotate "line", 0
    get_hll_global $P36, ["UnitTest";"Listener";"TAP"], "_block35" 
    capture_lex $P36
    get_hll_global $P14, ["UnitTest";"Listener"], "_block13" 
    capture_lex $P14
# .annotate "line", 4
    get_hll_global $P14, ["UnitTest";"Listener"], "_block13" 
    capture_lex $P14
    $P14()
# .annotate "line", 14
    get_hll_global $P36, ["UnitTest";"Listener";"TAP"], "_block35" 
    capture_lex $P36
    $P154 = $P36()
# .annotate "line", 1
    .return ($P154)
.end


.namespace []
.sub "" :load :init :subid("post24") :outer("10_1268929857.65447")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268929857.65447" 
    .local pmc block
    set block, $P12
    $P155 = get_root_global ["parrot"], "P6metaclass"
    $P155."new_class"("UnitTest::Listener")
    $P156 = get_root_global ["parrot"], "P6metaclass"
    new $P157, "ResizablePMCArray"
    push $P157, "$!test_builder"
    $P156."new_class"("UnitTest::Listener::TAP", "UnitTest::Listener" :named("parent"), $P157 :named("attr"))
.end


.namespace ["UnitTest";"Listener"]
.sub "_block13"  :subid("11_1268929857.65447") :outer("10_1268929857.65447")
# .annotate "line", 4
    .const 'Sub' $P30 = "15_1268929857.65447" 
    capture_lex $P30
    .const 'Sub' $P25 = "14_1268929857.65447" 
    capture_lex $P25
    .const 'Sub' $P20 = "13_1268929857.65447" 
    capture_lex $P20
    .const 'Sub' $P15 = "12_1268929857.65447" 
    capture_lex $P15
# .annotate "line", 8
    .const 'Sub' $P30 = "15_1268929857.65447" 
    capture_lex $P30
# .annotate "line", 4
    .return ($P30)
.end


.namespace ["UnitTest";"Listener"]
.sub "add_error"  :subid("12_1268929857.65447") :method :outer("11_1268929857.65447")
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
.sub "add_failure"  :subid("13_1268929857.65447") :method :outer("11_1268929857.65447")
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
.sub "end_test"  :subid("14_1268929857.65447") :method :outer("11_1268929857.65447")
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
.sub "start_test"  :subid("15_1268929857.65447") :method :outer("11_1268929857.65447")
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
.sub "_block35"  :subid("16_1268929857.65447") :outer("10_1268929857.65447")
# .annotate "line", 14
    .const 'Sub' $P139 = "23_1268929857.65447" 
    capture_lex $P139
    .const 'Sub' $P130 = "22_1268929857.65447" 
    capture_lex $P130
    .const 'Sub' $P114 = "21_1268929857.65447" 
    capture_lex $P114
    .const 'Sub' $P100 = "20_1268929857.65447" 
    capture_lex $P100
    .const 'Sub' $P77 = "19_1268929857.65447" 
    capture_lex $P77
    .const 'Sub' $P45 = "18_1268929857.65447" 
    capture_lex $P45
    .const 'Sub' $P37 = "17_1268929857.65447" 
    capture_lex $P37
# .annotate "line", 67
    .const 'Sub' $P139 = "23_1268929857.65447" 
    capture_lex $P139
# .annotate "line", 14
    .return ($P139)
.end


.namespace ["UnitTest";"Listener";"TAP"]
.sub "" :load :init :subid("post25") :outer("16_1268929857.65447")
# .annotate "line", 14
    get_hll_global $P36, ["UnitTest";"Listener";"TAP"], "_block35" 
    .local pmc block
    set block, $P36
# .annotate "line", 17
    load_bytecode "Test/Builder.pbc"
.end


.namespace ["UnitTest";"Listener";"TAP"]
.sub "add_error"  :subid("17_1268929857.65447") :method :outer("16_1268929857.65447")
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
.sub "add_failure"  :subid("18_1268929857.65447") :method :outer("16_1268929857.65447")
    .param pmc param_48
# .annotate "line", 24
    new $P47, 'ExceptionHandler'
    set_addr $P47, control_46
    $P47."handle_types"(58)
    push_eh $P47
    .lex "self", self
    .lex "$failure", param_48
# .annotate "line", 25
    new $P49, "Undef"
    .lex "$test", $P49
# .annotate "line", 26
    new $P50, "Undef"
    .lex "$label", $P50
# .annotate "line", 25
    find_lex $P51, "$failure"
    $P52 = $P51."test_case"()
    store_lex "$test", $P52
# .annotate "line", 26
    find_lex $P53, "self"
    find_lex $P54, "$test"
    $P55 = $P53."get_test_label"($P54)
    store_lex "$label", $P55
# .annotate "line", 28
    find_lex $P57, "$test"
    $P58 = $P57."todo"()
    if $P58, if_56
# .annotate "line", 32
    find_lex $P64, "self"
    getattribute $P65, $P64, "$!test_builder"
    unless_null $P65, vivify_26
    new $P65, "Undef"
  vivify_26:
    find_lex $P66, "self"
    find_lex $P67, "$failure"
    $P68 = $P67."test_case"()
    $P69 = $P66."get_test_label"($P68)
    $P65."ok"(0, $P69)
# .annotate "line", 31
    goto if_56_end
  if_56:
# .annotate "line", 29
    find_lex $P59, "self"
    getattribute $P60, $P59, "$!test_builder"
    unless_null $P60, vivify_27
    new $P60, "Undef"
  vivify_27:
    find_lex $P61, "$label"
    find_lex $P62, "$test"
    $P63 = $P62."todo"()
    $P60."todo"(0, $P61, $P63)
  if_56_end:
# .annotate "line", 35
    find_lex $P70, "self"
    getattribute $P71, $P70, "$!test_builder"
    unless_null $P71, vivify_28
    new $P71, "Undef"
  vivify_28:
    find_lex $P72, "$failure"
    $P73 = $P72."fault"()
    $P74 = $P73."message"()
    $P71."diag"($P74)
    find_lex $P75, "self"
# .annotate "line", 24
    .return ($P75)
  control_46:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P76, exception, "payload"
    .return ($P76)
.end


.namespace ["UnitTest";"Listener";"TAP"]
.sub "end_test"  :subid("19_1268929857.65447") :method :outer("16_1268929857.65447")
    .param pmc param_80
# .annotate "line", 39
    new $P79, 'ExceptionHandler'
    set_addr $P79, control_78
    $P79."handle_types"(58)
    push_eh $P79
    .lex "self", self
    .lex "$test", param_80
# .annotate "line", 40
    new $P81, "Undef"
    .lex "$label", $P81
    find_lex $P82, "self"
    find_lex $P83, "$test"
    $P84 = $P82."get_test_label"($P83)
    store_lex "$label", $P84
# .annotate "line", 42
    find_lex $P86, "$test"
    $P87 = $P86."todo"()
    if $P87, if_85
# .annotate "line", 46
    find_lex $P93, "self"
    getattribute $P94, $P93, "$!test_builder"
    unless_null $P94, vivify_29
    new $P94, "Undef"
  vivify_29:
    find_lex $P95, "self"
    find_lex $P96, "$test"
    $P97 = $P95."get_test_label"($P96)
    $P94."ok"(1, $P97)
# .annotate "line", 45
    goto if_85_end
  if_85:
# .annotate "line", 43
    find_lex $P88, "self"
    getattribute $P89, $P88, "$!test_builder"
    unless_null $P89, vivify_30
    new $P89, "Undef"
  vivify_30:
    find_lex $P90, "$label"
    find_lex $P91, "$test"
    $P92 = $P91."todo"()
    $P89."todo"(1, $P90, $P92)
  if_85_end:
# .annotate "line", 42
    find_lex $P98, "self"
# .annotate "line", 39
    .return ($P98)
  control_78:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P99, exception, "payload"
    .return ($P99)
.end


.namespace ["UnitTest";"Listener";"TAP"]
.sub "get_test_label"  :subid("20_1268929857.65447") :method :outer("16_1268929857.65447")
    .param pmc param_103
# .annotate "line", 52
    new $P102, 'ExceptionHandler'
    set_addr $P102, control_101
    $P102."handle_types"(58)
    push_eh $P102
    .lex "self", self
    .lex "$test", param_103
# .annotate "line", 53
    find_lex $P108, "$test"
    $P109 = $P108."verify"()
    unless $P109, unless_107
    set $P106, $P109
    goto unless_107_end
  unless_107:
    find_lex $P110, "$test"
    $P111 = $P110."name"()
    set $P106, $P111
  unless_107_end:
    unless $P106, unless_105
    set $P104, $P106
    goto unless_105_end
  unless_105:
    new $P112, "String"
    assign $P112, ""
    set $P104, $P112
  unless_105_end:
# .annotate "line", 52
    .return ($P104)
  control_101:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["UnitTest";"Listener";"TAP"]
.sub "_init_obj"  :subid("21_1268929857.65447") :method :outer("16_1268929857.65447")
    .param pmc param_117 :slurpy
    .param pmc param_118 :slurpy :named
# .annotate "line", 56
    new $P116, 'ExceptionHandler'
    set_addr $P116, control_115
    $P116."handle_types"(58)
    push_eh $P116
    .lex "self", self
    .lex "@pos", param_117
    .lex "%named", param_118
# .annotate "line", 58
    find_lex $P120, "%named"
    $P121 = $P120."contains"("test_builder")
    if $P121, unless_119_end
# .annotate "line", 57
    get_hll_global $P122, ["Parrot"], "new"
    $P123 = $P122("Test::Builder")
    find_lex $P124, "%named"
    unless_null $P124, vivify_31
    $P124 = root_new ['parrot';'Hash']
    store_lex "%named", $P124
  vivify_31:
    set $P124["test_builder"], $P123
  unless_119_end:
# .annotate "line", 60
    find_lex $P125, "self"
    find_lex $P126, "@pos"
    find_lex $P127, "%named"
    $P128 = $P125."_init_args"($P126 :flat, $P127 :flat)
# .annotate "line", 56
    .return ($P128)
  control_115:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P129, exception, "payload"
    .return ($P129)
.end


.namespace ["UnitTest";"Listener";"TAP"]
.sub "plan_tests"  :subid("22_1268929857.65447") :method :outer("16_1268929857.65447")
    .param pmc param_133
# .annotate "line", 63
    new $P132, 'ExceptionHandler'
    set_addr $P132, control_131
    $P132."handle_types"(58)
    push_eh $P132
    .lex "self", self
    .lex "$num_tests", param_133
# .annotate "line", 64
    find_lex $P134, "self"
    getattribute $P135, $P134, "$!test_builder"
    unless_null $P135, vivify_32
    new $P135, "Undef"
  vivify_32:
    find_lex $P136, "$num_tests"
    $P137 = $P135."plan"($P136)
# .annotate "line", 63
    .return ($P137)
  control_131:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P138, exception, "payload"
    .return ($P138)
.end


.namespace ["UnitTest";"Listener";"TAP"]
.sub "test_builder"  :subid("23_1268929857.65447") :method :outer("16_1268929857.65447")
    .param pmc param_142 :optional
    .param int has_param_142 :opt_flag
# .annotate "line", 67
    new $P141, 'ExceptionHandler'
    set_addr $P141, control_140
    $P141."handle_types"(58)
    push_eh $P141
    .lex "self", self
    if has_param_142, optparam_33
    new $P143, "Undef"
    set param_142, $P143
  optparam_33:
    .lex "$tb", param_142
# .annotate "line", 68
    find_lex $P146, "$tb"
    defined $I147, $P146
    if $I147, if_145
# .annotate "line", 72
    find_lex $P151, "self"
    getattribute $P152, $P151, "$!test_builder"
    unless_null $P152, vivify_34
    new $P152, "Undef"
  vivify_34:
    set $P144, $P152
# .annotate "line", 68
    goto if_145_end
  if_145:
# .annotate "line", 69
    find_lex $P148, "$tb"
    find_lex $P149, "self"
    setattribute $P149, "$!test_builder", $P148
    find_lex $P150, "self"
# .annotate "line", 68
    set $P144, $P150
  if_145_end:
# .annotate "line", 67
    .return ($P144)
  control_140:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P153, exception, "payload"
    .return ($P153)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929895.34504")
# .annotate "line", 0
    get_hll_global $P14, ["UnitTest";"Loader"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["UnitTest";"Loader"], "_block13" 
    capture_lex $P14
    $P214 = $P14()
# .annotate "line", 1
    .return ($P214)
.end


.namespace []
.sub "" :load :init :subid("post24") :outer("10_1268929895.34504")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268929895.34504" 
    .local pmc block
    set block, $P12
    $P215 = get_root_global ["parrot"], "P6metaclass"
    new $P216, "ResizablePMCArray"
    push $P216, "$!class"
    push $P216, "%!seen_methods"
    push $P216, "$!test_prefix"
    $P215."new_class"("UnitTest::Loader", $P216 :named("attr"))
.end


.namespace ["UnitTest";"Loader"]
.sub "_block13"  :subid("11_1268929895.34504") :outer("10_1268929895.34504")
# .annotate "line", 6
    .const 'Sub' $P201 = "23_1268929895.34504" 
    capture_lex $P201
    .const 'Sub' $P194 = "22_1268929895.34504" 
    capture_lex $P194
    .const 'Sub' $P177 = "21_1268929895.34504" 
    capture_lex $P177
    .const 'Sub' $P142 = "20_1268929895.34504" 
    capture_lex $P142
    .const 'Sub' $P130 = "19_1268929895.34504" 
    capture_lex $P130
    .const 'Sub' $P70 = "16_1268929895.34504" 
    capture_lex $P70
    .const 'Sub' $P63 = "15_1268929895.34504" 
    capture_lex $P63
    .const 'Sub' $P27 = "13_1268929895.34504" 
    capture_lex $P27
    .const 'Sub' $P15 = "12_1268929895.34504" 
    capture_lex $P15
# .annotate "line", 10
    .const 'Sub' $P15 = "12_1268929895.34504" 
    capture_lex $P15
    .lex "compare_methods", $P15
# .annotate "line", 6
    find_lex $P26, "compare_methods"
# .annotate "line", 91
    .const 'Sub' $P201 = "23_1268929895.34504" 
    capture_lex $P201
# .annotate "line", 6
    .return ($P201)
.end


.namespace ["UnitTest";"Loader"]
.sub "compare_methods"  :subid("12_1268929895.34504") :outer("11_1268929895.34504")
    .param pmc param_18
    .param pmc param_19
# .annotate "line", 10
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "$a", param_18
    .lex "$b", param_19
# .annotate "line", 11
    find_lex $P20, "$a"
    set $S21, $P20
    find_lex $P22, "$b"
    set $S23, $P22
    cmp_str $I24, $S21, $S23
# .annotate "line", 10
    .return ($I24)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P25, exception, "payload"
    .return ($P25)
.end


.namespace ["UnitTest";"Loader"]
.sub "configure_suite"  :subid("13_1268929895.34504") :method :outer("11_1268929895.34504")
    .param pmc param_30
    .param pmc param_31 :optional :named("suite")
    .param int has_param_31 :opt_flag
    .param pmc param_33 :slurpy :named
# .annotate "line", 14
    .const 'Sub' $P51 = "14_1268929895.34504" 
    capture_lex $P51
    new $P29, 'ExceptionHandler'
    set_addr $P29, control_28
    $P29."handle_types"(58)
    push_eh $P29
    .lex "self", self
    .lex "@tests", param_30
    if has_param_31, optparam_25
    new $P32, "Undef"
    set param_31, $P32
  optparam_25:
    .lex "$suite", param_31
    .lex "%named", param_33
# .annotate "line", 19
    new $P34, "Undef"
    .lex "$proto", $P34
# .annotate "line", 15
    find_lex $P36, "$suite"
    $P37 = $P36."defined"()
    if $P37, unless_35_end
# .annotate "line", 16
    find_lex $P38, "self"
    $P39 = $P38."default_suite"()
    store_lex "$suite", $P39
  unless_35_end:
# .annotate "line", 19
    new $P40, "String"
    assign $P40, "metaclass"
    set $S41, $P40
    find_lex $P42, "self"
    getattribute $P43, $P42, "$!class"
    unless_null $P43, vivify_26
    new $P43, "Undef"
  vivify_26:
    getprop $P44, $S41, $P43
    $P45 = $P44."WHAT"()
    store_lex "$proto", $P45
# .annotate "line", 21
    find_lex $P47, "@tests"
    defined $I48, $P47
    unless $I48, for_undef_27
    iter $P46, $P47
    new $P59, 'ExceptionHandler'
    set_addr $P59, loop58_handler
    $P59."handle_types"(65, 67, 66)
    push_eh $P59
  loop58_test:
    unless $P46, loop58_done
    shift $P49, $P46
  loop58_redo:
    .const 'Sub' $P51 = "14_1268929895.34504" 
    capture_lex $P51
    $P51($P49)
  loop58_next:
    goto loop58_test
  loop58_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P60, exception, 'type'
    eq $P60, 65, loop58_next
    eq $P60, 67, loop58_redo
  loop58_done:
    pop_eh 
  for_undef_27:
    find_lex $P61, "$suite"
# .annotate "line", 14
    .return ($P61)
  control_28:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P62, exception, "payload"
    .return ($P62)
.end


.namespace ["UnitTest";"Loader"]
.sub "_block50"  :anon :subid("14_1268929895.34504") :outer("13_1268929895.34504")
    .param pmc param_52
# .annotate "line", 21
    .lex "$test", param_52
# .annotate "line", 22
    find_lex $P53, "$suite"
    find_lex $P54, "$proto"
    find_lex $P55, "$test"
    $P56 = $P54."new"($P55 :named("name"))
    $P57 = $P53."add_test"($P56)
# .annotate "line", 21
    .return ($P57)
.end


.namespace ["UnitTest";"Loader"]
.sub "default_suite"  :subid("15_1268929895.34504") :method :outer("11_1268929895.34504")
# .annotate "line", 28
    new $P65, 'ExceptionHandler'
    set_addr $P65, control_64
    $P65."handle_types"(58)
    push_eh $P65
    .lex "self", self
# .annotate "line", 29
    new $P66, "Exception"
    set $P66['type'], 58
    get_hll_global $P67, ["UnitTest"], "Suite"
    $P68 = $P67."new"()
    setattribute $P66, 'payload', $P68
    throw $P66
# .annotate "line", 28
    .return ()
  control_64:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P69, exception, "payload"
    .return ($P69)
.end


.namespace ["UnitTest";"Loader"]
.sub "get_test_methods"  :subid("16_1268929895.34504") :method :outer("11_1268929895.34504")
# .annotate "line", 32
    .const 'Sub' $P85 = "17_1268929895.34504" 
    capture_lex $P85
    new $P72, 'ExceptionHandler'
    set_addr $P72, control_71
    $P72."handle_types"(58)
    push_eh $P72
    .lex "self", self
# .annotate "line", 33
    $P73 = root_new ['parrot';'ResizablePMCArray']
    .lex "@mro", $P73
# .annotate "line", 34
    $P74 = root_new ['parrot';'ResizablePMCArray']
    .lex "@test_methods", $P74
# .annotate "line", 33
    find_lex $P75, "self"
    getattribute $P76, $P75, "$!class"
    unless_null $P76, vivify_28
    new $P76, "Undef"
  vivify_28:
    $P77 = $P76."inspect"("all_parents")
    store_lex "@mro", $P77
# .annotate "line", 34
    get_hll_global $P78, ["Array"], "new"
    $P79 = $P78()
    store_lex "@test_methods", $P79
# .annotate "line", 36
    find_lex $P81, "@mro"
    defined $I82, $P81
    unless $I82, for_undef_29
    iter $P80, $P81
    new $P124, 'ExceptionHandler'
    set_addr $P124, loop123_handler
    $P124."handle_types"(65, 67, 66)
    push_eh $P124
  loop123_test:
    unless $P80, loop123_done
    shift $P83, $P80
  loop123_redo:
    .const 'Sub' $P85 = "17_1268929895.34504" 
    capture_lex $P85
    $P85($P83)
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
  for_undef_29:
# .annotate "line", 50
    find_lex $P126, "self"
    find_lex $P127, "@test_methods"
    $P128 = $P126."order_tests"($P127)
# .annotate "line", 32
    .return ($P128)
  control_71:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P129, exception, "payload"
    .return ($P129)
.end


.namespace ["UnitTest";"Loader"]
.sub "_block84"  :anon :subid("17_1268929895.34504") :outer("16_1268929895.34504")
    .param pmc param_87
# .annotate "line", 36
    .const 'Sub' $P95 = "18_1268929895.34504" 
    capture_lex $P95
# .annotate "line", 37
    $P86 = root_new ['parrot';'Hash']
    .lex "%methods", $P86
    .lex "$_", param_87
    find_lex $P88, "$_"
    $P89 = $P88."inspect"("methods")
    store_lex "%methods", $P89
# .annotate "line", 39
    find_lex $P91, "%methods"
    defined $I92, $P91
    unless $I92, for_undef_30
    iter $P90, $P91
    new $P121, 'ExceptionHandler'
    set_addr $P121, loop120_handler
    $P121."handle_types"(65, 67, 66)
    push_eh $P121
  loop120_test:
    unless $P90, loop120_done
    shift $P93, $P90
  loop120_redo:
    .const 'Sub' $P95 = "18_1268929895.34504" 
    capture_lex $P95
    $P95($P93)
  loop120_next:
    goto loop120_test
  loop120_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P122, exception, 'type'
    eq $P122, 65, loop120_next
    eq $P122, 67, loop120_redo
  loop120_done:
    pop_eh 
  for_undef_30:
# .annotate "line", 36
    .return ($P90)
.end


.namespace ["UnitTest";"Loader"]
.sub "_block94"  :anon :subid("18_1268929895.34504") :outer("17_1268929895.34504")
    .param pmc param_97
# .annotate "line", 40
    new $P96, "Undef"
    .lex "$name", $P96
    .lex "$_", param_97
    find_lex $P98, "$_"
    set $S99, $P98
    new $P100, 'String'
    set $P100, $S99
    store_lex "$name", $P100
# .annotate "line", 42
    find_lex $P105, "self"
    find_lex $P106, "$name"
    $P107 = $P105."is_test_method"($P106)
    if $P107, if_104
    set $P103, $P107
    goto if_104_end
  if_104:
# .annotate "line", 43
    find_lex $P108, "self"
    getattribute $P109, $P108, "%!seen_methods"
    unless_null $P109, vivify_31
    $P109 = root_new ['parrot';'Hash']
  vivify_31:
    find_lex $P110, "$name"
    $P111 = $P109."contains"($P110)
    isfalse $I112, $P111
    new $P103, 'Integer'
    set $P103, $I112
  if_104_end:
    if $P103, if_102
    set $P101, $P103
    goto if_102_end
  if_102:
# .annotate "line", 44
    new $P113, "Integer"
    assign $P113, 1
    find_lex $P114, "$name"
    find_lex $P115, "self"
    getattribute $P116, $P115, "%!seen_methods"
    unless_null $P116, vivify_32
    $P116 = root_new ['parrot';'Hash']
    setattribute $P115, "%!seen_methods", $P116
  vivify_32:
    set $P116[$P114], $P113
# .annotate "line", 45
    find_lex $P117, "@test_methods"
    find_lex $P118, "$name"
    $P119 = $P117."push"($P118)
# .annotate "line", 43
    set $P101, $P119
  if_102_end:
# .annotate "line", 39
    .return ($P101)
.end


.namespace ["UnitTest";"Loader"]
.sub "_init_obj"  :subid("19_1268929895.34504") :method :outer("11_1268929895.34504")
    .param pmc param_133 :slurpy
    .param pmc param_134 :slurpy :named
# .annotate "line", 53
    new $P132, 'ExceptionHandler'
    set_addr $P132, control_131
    $P132."handle_types"(58)
    push_eh $P132
    .lex "self", self
    .lex "@pos", param_133
    .lex "%named", param_134
# .annotate "line", 54
    new $P135, "String"
    assign $P135, "test"
    find_lex $P136, "self"
    setattribute $P136, "$!test_prefix", $P135
# .annotate "line", 56
    find_lex $P137, "self"
    find_lex $P138, "@pos"
    find_lex $P139, "%named"
    $P140 = $P137."_init_args"($P138 :flat, $P139 :flat)
# .annotate "line", 53
    .return ($P140)
  control_131:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P141, exception, "payload"
    .return ($P141)
.end


.namespace ["UnitTest";"Loader"]
.sub "is_test_method"  :subid("20_1268929895.34504") :method :outer("11_1268929895.34504")
    .param pmc param_145
# .annotate "line", 60
    new $P144, 'ExceptionHandler'
    set_addr $P144, control_143
    $P144."handle_types"(58)
    push_eh $P144
    .lex "self", self
    .lex "$name", param_145
# .annotate "line", 61
    find_lex $P149, "$name"
    $N150 = $P149."length"()
    isgt $I151, $N150, 4.0
    if $I151, if_148
    new $P147, 'Integer'
    set $P147, $I151
    goto if_148_end
  if_148:
# .annotate "line", 62
    find_lex $P152, "$name"
    $S153 = $P152."substr"(0, 4)
    iseq $I154, $S153, "test"
    new $P147, 'Integer'
    set $P147, $I154
  if_148_end:
    unless $P147, if_146_end
# .annotate "line", 64
    find_lex $P156, "$name"
    unless_null $P156, vivify_33
    $P156 = root_new ['parrot';'ResizablePMCArray']
  vivify_33:
    set $P157, $P156[4]
    unless_null $P157, vivify_34
    new $P157, "Undef"
  vivify_34:
    set $S158, $P157
    iseq $I159, $S158, "_"
    unless $I159, if_155_end
# .annotate "line", 65
    new $P160, "Exception"
    set $P160['type'], 58
    new $P161, "Integer"
    assign $P161, 1
    setattribute $P160, 'payload', $P161
    throw $P160
  if_155_end:
# .annotate "line", 68
    get_hll_global $P163, ["String"], "is_cclass"
    find_lex $P164, "$name"
    $P165 = $P163("UPPERCASE", $P164, 4 :named("offset"))
    unless $P165, if_162_end
# .annotate "line", 69
    new $P166, "Exception"
    set $P166['type'], 58
    new $P167, "Integer"
    assign $P167, 1
    setattribute $P166, 'payload', $P167
    throw $P166
  if_162_end:
# .annotate "line", 72
    get_hll_global $P169, ["String"], "is_cclass"
    find_lex $P170, "$name"
    $P171 = $P169("NUMERIC", $P170, 4 :named("offset"))
    unless $P171, if_168_end
# .annotate "line", 73
    new $P172, "Exception"
    set $P172['type'], 58
    new $P173, "Integer"
    assign $P173, 1
    setattribute $P172, 'payload', $P173
    throw $P172
  if_168_end:
  if_146_end:
# .annotate "line", 77
    new $P174, "Exception"
    set $P174['type'], 58
    new $P175, "Integer"
    assign $P175, 0
    setattribute $P174, 'payload', $P175
    throw $P174
# .annotate "line", 60
    .return ()
  control_143:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P176, exception, "payload"
    .return ($P176)
.end


.namespace ["UnitTest";"Loader"]
.sub "load_tests_from_testcase"  :subid("21_1268929895.34504") :method :outer("11_1268929895.34504")
    .param pmc param_180
    .param pmc param_181 :slurpy :named
# .annotate "line", 80
    new $P179, 'ExceptionHandler'
    set_addr $P179, control_178
    $P179."handle_types"(58)
    push_eh $P179
    .lex "self", self
    .lex "$class", param_180
    .lex "%named", param_181
# .annotate "line", 82
    $P182 = root_new ['parrot';'ResizablePMCArray']
    .lex "@tests", $P182
# .annotate "line", 81
    get_hll_global $P183, "P6metaclass"
    find_lex $P184, "$class"
    $P185 = $P183."get_parrotclass"($P184)
    find_lex $P186, "self"
    setattribute $P186, "$!class", $P185
# .annotate "line", 82
    find_lex $P187, "self"
    $P188 = $P187."get_test_methods"()
    store_lex "@tests", $P188
# .annotate "line", 84
    find_lex $P189, "self"
    find_lex $P190, "@tests"
    find_lex $P191, "%named"
    $P192 = $P189."configure_suite"($P190, $P191 :flat)
# .annotate "line", 80
    .return ($P192)
  control_178:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P193, exception, "payload"
    .return ($P193)
.end


.namespace ["UnitTest";"Loader"]
.sub "order_tests"  :subid("22_1268929895.34504") :method :outer("11_1268929895.34504")
    .param pmc param_197
# .annotate "line", 87
    new $P196, 'ExceptionHandler'
    set_addr $P196, control_195
    $P196."handle_types"(58)
    push_eh $P196
    .lex "self", self
    .lex "@tests", param_197
# .annotate "line", 88
    find_lex $P198, "@tests"
    $P199 = $P198."unsort"()
# .annotate "line", 87
    .return ($P199)
  control_195:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P200, exception, "payload"
    .return ($P200)
.end


.namespace ["UnitTest";"Loader"]
.sub "test_prefix"  :subid("23_1268929895.34504") :method :outer("11_1268929895.34504")
    .param pmc param_204 :optional
    .param int has_param_204 :opt_flag
# .annotate "line", 91
    new $P203, 'ExceptionHandler'
    set_addr $P203, control_202
    $P203."handle_types"(58)
    push_eh $P203
    .lex "self", self
    if has_param_204, optparam_35
    new $P205, "Undef"
    set param_204, $P205
  optparam_35:
    .lex "$value", param_204
    find_lex $P208, "$value"
    if $P208, if_207
    find_lex $P211, "self"
    getattribute $P212, $P211, "$!test_prefix"
    unless_null $P212, vivify_36
    new $P212, "Undef"
  vivify_36:
    set $P206, $P212
    goto if_207_end
  if_207:
    find_lex $P209, "$value"
    find_lex $P210, "self"
    setattribute $P210, "$!test_prefix", $P209
    set $P206, $P209
  if_207_end:
    .return ($P206)
  control_202:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P213, exception, "payload"
    .return ($P213)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929830.64406")
# .annotate "line", 0
    get_hll_global $P17, ["UnitTest";"Result"], "_block16" 
    capture_lex $P17
    get_hll_global $P14, ["UnitTest";"Failure"], "_block13" 
    capture_lex $P14
# .annotate "line", 4
    get_hll_global $P14, ["UnitTest";"Failure"], "_block13" 
    capture_lex $P14
    $P14()
# .annotate "line", 15
    get_hll_global $P17, ["UnitTest";"Result"], "_block16" 
    capture_lex $P17
    $P202 = $P17()
# .annotate "line", 1
    .return ($P202)
.end


.namespace []
.sub "" :load :init :subid("post28") :outer("10_1268929830.64406")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268929830.64406" 
    .local pmc block
    set block, $P12
    $P203 = get_root_global ["parrot"], "P6metaclass"
    $P203."new_class"("UnitTest::Result")
.end


.namespace ["UnitTest";"Failure"]
.sub "_block13"  :subid("11_1268929830.64406") :outer("10_1268929830.64406")
# .annotate "line", 4
    .return ()
.end


.namespace ["UnitTest";"Failure"]
.sub "" :load :init :subid("post29") :outer("11_1268929830.64406")
# .annotate "line", 4
    get_hll_global $P14, ["UnitTest";"Failure"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 6
    new $P15, "ResizablePMCArray"
    push $P15, "$!fault"
    push $P15, "$!test_case"
    "has"($P15)
.end


.namespace ["UnitTest";"Result"]
.sub "_block16"  :subid("12_1268929830.64406") :outer("10_1268929830.64406")
# .annotate "line", 15
    .const 'Sub' $P189 = "27_1268929830.64406" 
    capture_lex $P189
    .const 'Sub' $P183 = "26_1268929830.64406" 
    capture_lex $P183
    .const 'Sub' $P169 = "25_1268929830.64406" 
    capture_lex $P169
    .const 'Sub' $P163 = "24_1268929830.64406" 
    capture_lex $P163
    .const 'Sub' $P133 = "23_1268929830.64406" 
    capture_lex $P133
    .const 'Sub' $P119 = "22_1268929830.64406" 
    capture_lex $P119
    .const 'Sub' $P94 = "20_1268929830.64406" 
    capture_lex $P94
    .const 'Sub' $P87 = "19_1268929830.64406" 
    capture_lex $P87
    .const 'Sub' $P80 = "18_1268929830.64406" 
    capture_lex $P80
    .const 'Sub' $P72 = "17_1268929830.64406" 
    capture_lex $P72
    .const 'Sub' $P63 = "16_1268929830.64406" 
    capture_lex $P63
    .const 'Sub' $P42 = "15_1268929830.64406" 
    capture_lex $P42
    .const 'Sub' $P30 = "14_1268929830.64406" 
    capture_lex $P30
    .const 'Sub' $P18 = "13_1268929830.64406" 
    capture_lex $P18
# .annotate "line", 106
    .const 'Sub' $P189 = "27_1268929830.64406" 
    capture_lex $P189
# .annotate "line", 15
    .return ($P189)
.end


.namespace ["UnitTest";"Result"]
.sub "" :load :init :subid("post30") :outer("12_1268929830.64406")
# .annotate "line", 15
    get_hll_global $P17, ["UnitTest";"Result"], "_block16" 
    .local pmc block
    set block, $P17
# .annotate "line", 16
    new $P201, "ResizablePMCArray"
    push $P201, "@!errors"
    push $P201, "@!failures"
    push $P201, "@!listeners"
    push $P201, "$.should_stop"
    push $P201, "$.num_tests"
    push $P201, "$.planned_tests"
    "has"($P201)
.end


.namespace ["UnitTest";"Result"]
.sub "add_error"  :subid("13_1268929830.64406") :method :outer("12_1268929830.64406")
    .param pmc param_21
    .param pmc param_22
# .annotate "line", 26
    new $P20, 'ExceptionHandler'
    set_addr $P20, control_19
    $P20."handle_types"(58)
    push_eh $P20
    .lex "self", self
    .lex "$test", param_21
    .lex "$error", param_22
# .annotate "line", 27
    find_lex $P23, "self"
    find_lex $P24, "$test"
    find_lex $P25, "$error"
    find_lex $P26, "self"
    $P27 = $P26."errors"()
    $P28 = $P23."add_fault"($P24, $P25, "add_error" :named("notify"), $P27 :named("queue"))
# .annotate "line", 26
    .return ($P28)
  control_19:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P29, exception, "payload"
    .return ($P29)
.end


.namespace ["UnitTest";"Result"]
.sub "add_failure"  :subid("14_1268929830.64406") :method :outer("12_1268929830.64406")
    .param pmc param_33
    .param pmc param_34
# .annotate "line", 30
    new $P32, 'ExceptionHandler'
    set_addr $P32, control_31
    $P32."handle_types"(58)
    push_eh $P32
    .lex "self", self
    .lex "$test", param_33
    .lex "$failure", param_34
# .annotate "line", 31
    find_lex $P35, "self"
    find_lex $P36, "$test"
    find_lex $P37, "$failure"
    find_lex $P38, "self"
    $P39 = $P38."failures"()
    $P40 = $P35."add_fault"($P36, $P37, "add_failure" :named("notify"), $P39 :named("queue"))
# .annotate "line", 30
    .return ($P40)
  control_31:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P41, exception, "payload"
    .return ($P41)
.end


.namespace ["UnitTest";"Result"]
.sub "add_fault"  :subid("15_1268929830.64406") :method :outer("12_1268929830.64406")
    .param pmc param_45
    .param pmc param_46
    .param pmc param_47 :optional :named("notify")
    .param int has_param_47 :opt_flag
    .param pmc param_49 :optional :named("queue")
    .param int has_param_49 :opt_flag
# .annotate "line", 34
    new $P44, 'ExceptionHandler'
    set_addr $P44, control_43
    $P44."handle_types"(58)
    push_eh $P44
    .lex "self", self
    .lex "$test", param_45
    .lex "$exception", param_46
    if has_param_47, optparam_31
    new $P48, "Undef"
    set param_47, $P48
  optparam_31:
    .lex "$notify", param_47
    if has_param_49, optparam_32
    new $P50, "Undef"
    set param_49, $P50
  optparam_32:
    .lex "$queue", param_49
# .annotate "line", 35
    new $P51, "Undef"
    .lex "$failure", $P51
    get_hll_global $P52, ["UnitTest"], "Failure"
    find_lex $P53, "$exception"
    find_lex $P54, "$test"
    $P55 = $P52."new"($P53 :named("fault"), $P54 :named("test_case"))
    store_lex "$failure", $P55
# .annotate "line", 40
    find_lex $P56, "$queue"
    find_lex $P57, "$failure"
    $P56."push"($P57)
# .annotate "line", 41
    find_lex $P58, "self"
    find_lex $P59, "$notify"
    find_lex $P60, "$failure"
    $P61 = $P58."notify_listeners"($P59, $P60)
# .annotate "line", 34
    .return ($P61)
  control_43:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P62, exception, "payload"
    .return ($P62)
.end


.namespace ["UnitTest";"Result"]
.sub "add_listener"  :subid("16_1268929830.64406") :method :outer("12_1268929830.64406")
    .param pmc param_66
# .annotate "line", 44
    new $P65, 'ExceptionHandler'
    set_addr $P65, control_64
    $P65."handle_types"(58)
    push_eh $P65
    .lex "self", self
    .lex "$listener", param_66
# .annotate "line", 45
    find_lex $P67, "self"
    $P68 = $P67."listeners"()
    find_lex $P69, "$listener"
    $P68."push"($P69)
    find_lex $P70, "self"
# .annotate "line", 44
    .return ($P70)
  control_64:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P71, exception, "payload"
    .return ($P71)
.end


.namespace ["UnitTest";"Result"]
.sub "end_test"  :subid("17_1268929830.64406") :method :outer("12_1268929830.64406")
    .param pmc param_75
# .annotate "line", 49
    new $P74, 'ExceptionHandler'
    set_addr $P74, control_73
    $P74."handle_types"(58)
    push_eh $P74
    .lex "self", self
    .lex "$test", param_75
# .annotate "line", 50
    find_lex $P76, "self"
    find_lex $P77, "$test"
    $P78 = $P76."notify_listeners"("end_test", $P77)
# .annotate "line", 49
    .return ($P78)
  control_73:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P79, exception, "payload"
    .return ($P79)
.end


.namespace ["UnitTest";"Result"]
.sub "error_count"  :subid("18_1268929830.64406") :method :outer("12_1268929830.64406")
# .annotate "line", 53
    new $P82, 'ExceptionHandler'
    set_addr $P82, control_81
    $P82."handle_types"(58)
    push_eh $P82
    .lex "self", self
# .annotate "line", 54
    find_lex $P83, "self"
    $P84 = $P83."errors"()
    $P85 = $P84."elems"()
# .annotate "line", 53
    .return ($P85)
  control_81:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P86, exception, "payload"
    .return ($P86)
.end


.namespace ["UnitTest";"Result"]
.sub "failure_count"  :subid("19_1268929830.64406") :method :outer("12_1268929830.64406")
# .annotate "line", 57
    new $P89, 'ExceptionHandler'
    set_addr $P89, control_88
    $P89."handle_types"(58)
    push_eh $P89
    .lex "self", self
# .annotate "line", 58
    find_lex $P90, "self"
    $P91 = $P90."failures"()
    $P92 = $P91."elems"()
# .annotate "line", 57
    .return ($P92)
  control_88:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P93, exception, "payload"
    .return ($P93)
.end


.namespace ["UnitTest";"Result"]
.sub "notify_listeners"  :subid("20_1268929830.64406") :method :outer("12_1268929830.64406")
    .param pmc param_97
    .param pmc param_98 :slurpy
    .param pmc param_99 :slurpy :named
# .annotate "line", 61
    .const 'Sub' $P106 = "21_1268929830.64406" 
    capture_lex $P106
    new $P96, 'ExceptionHandler'
    set_addr $P96, control_95
    $P96."handle_types"(58)
    push_eh $P96
    .lex "self", self
    .lex "$method", param_97
    .lex "@pos", param_98
    .lex "%named", param_99
# .annotate "line", 62
    find_lex $P101, "self"
    $P102 = $P101."listeners"()
    defined $I103, $P102
    unless $I103, for_undef_33
    iter $P100, $P102
    new $P115, 'ExceptionHandler'
    set_addr $P115, loop114_handler
    $P115."handle_types"(65, 67, 66)
    push_eh $P115
  loop114_test:
    unless $P100, loop114_done
    shift $P104, $P100
  loop114_redo:
    .const 'Sub' $P106 = "21_1268929830.64406" 
    capture_lex $P106
    $P106($P104)
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
  for_undef_33:
    find_lex $P117, "self"
# .annotate "line", 61
    .return ($P117)
  control_95:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, "payload"
    .return ($P118)
.end


.namespace ["UnitTest";"Result"]
.sub "_block105"  :anon :subid("21_1268929830.64406") :outer("20_1268929830.64406")
    .param pmc param_107
# .annotate "line", 62
    .lex "$_", param_107
# .annotate "line", 63
    get_hll_global $P108, ["Parrot"], "call_method_"
    find_lex $P109, "$_"
    find_lex $P110, "$method"
    find_lex $P111, "@pos"
    find_lex $P112, "%named"
    $P113 = $P108($P109, $P110, $P111, $P112)
# .annotate "line", 62
    .return ($P113)
.end


.namespace ["UnitTest";"Result"]
.sub "plan_tests"  :subid("22_1268929830.64406") :method :outer("12_1268929830.64406")
    .param pmc param_122
# .annotate "line", 69
    new $P121, 'ExceptionHandler'
    set_addr $P121, control_120
    $P121."handle_types"(58)
    push_eh $P121
    .lex "self", self
    .lex "$num_tests", param_122
# .annotate "line", 71
    find_lex $P125, "self"
    $P126 = $P125."planned_tests"()
    unless $P126, unless_124
    set $P123, $P126
    goto unless_124_end
  unless_124:
# .annotate "line", 72
    find_lex $P127, "self"
    find_lex $P128, "$num_tests"
    $P127."planned_tests"($P128)
# .annotate "line", 73
    find_lex $P129, "self"
    find_lex $P130, "$num_tests"
    $P131 = $P129."notify_listeners"("plan_tests", $P130)
# .annotate "line", 71
    set $P123, $P131
  unless_124_end:
# .annotate "line", 69
    .return ($P123)
  control_120:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P132, exception, "payload"
    .return ($P132)
.end


.namespace ["UnitTest";"Result"]
.sub "remove_listener"  :subid("23_1268929830.64406") :method :outer("12_1268929830.64406")
    .param pmc param_136
# .annotate "line", 77
    new $P135, 'ExceptionHandler'
    set_addr $P135, control_134
    $P135."handle_types"(58)
    push_eh $P135
    .lex "self", self
    .lex "$listener", param_136
# .annotate "line", 78
    new $P137, "Undef"
    .lex "$index", $P137
    new $P138, "Integer"
    assign $P138, 0
    store_lex "$index", $P138
# .annotate "line", 80
    new $P159, 'ExceptionHandler'
    set_addr $P159, loop158_handler
    $P159."handle_types"(65, 67, 66)
    push_eh $P159
  loop158_test:
    find_lex $P139, "$index"
    set $N140, $P139
    find_lex $P141, "self"
    $P142 = $P141."listeners"()
    $N143 = $P142."elems"()
    islt $I144, $N140, $N143
    unless $I144, loop158_done
  loop158_redo:
# .annotate "line", 81
    find_lex $P146, "$index"
    set $I147, $P146
    find_lex $P148, "self"
    $P149 = $P148."listeners"()
    set $P150, $P149[$I147]
    unless_null $P150, vivify_34
    new $P150, "Undef"
  vivify_34:
    find_lex $P151, "$listener"
    issame $I152, $P150, $P151
    if $I152, if_145
# .annotate "line", 84
    find_lex $P156, "$index"
    clone $P157, $P156
    inc $P156
    goto if_145_end
  if_145:
# .annotate "line", 82
    find_lex $P153, "self"
    $P154 = $P153."listeners"()
    find_lex $P155, "$index"
    $P154."delete"($P155)
  if_145_end:
  loop158_next:
# .annotate "line", 80
    goto loop158_test
  loop158_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P160, exception, 'type'
    eq $P160, 65, loop158_next
    eq $P160, 67, loop158_redo
  loop158_done:
    pop_eh 
    find_lex $P161, "self"
# .annotate "line", 77
    .return ($P161)
  control_134:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P162, exception, "payload"
    .return ($P162)
.end


.namespace ["UnitTest";"Result"]
.sub "run_count"  :subid("24_1268929830.64406") :method :outer("12_1268929830.64406")
# .annotate "line", 92
    new $P165, 'ExceptionHandler'
    set_addr $P165, control_164
    $P165."handle_types"(58)
    push_eh $P165
    .lex "self", self
# .annotate "line", 93
    find_lex $P166, "self"
    $P167 = $P166."num_tests"()
# .annotate "line", 92
    .return ($P167)
  control_164:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P168, exception, "payload"
    .return ($P168)
.end


.namespace ["UnitTest";"Result"]
.sub "start_test"  :subid("25_1268929830.64406") :method :outer("12_1268929830.64406")
    .param pmc param_172
# .annotate "line", 96
    new $P171, 'ExceptionHandler'
    set_addr $P171, control_170
    $P171."handle_types"(58)
    push_eh $P171
    .lex "self", self
    .lex "$test", param_172
# .annotate "line", 97
    find_lex $P173, "self"
    find_lex $P174, "self"
    $P175 = $P174."num_tests"()
    find_lex $P176, "$test"
    $N177 = $P176."num_tests"()
    add $P178, $P175, $N177
    $P173."num_tests"($P178)
# .annotate "line", 98
    find_lex $P179, "self"
    find_lex $P180, "$test"
    $P181 = $P179."notify_listeners"("start_test", $P180)
# .annotate "line", 96
    .return ($P181)
  control_170:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P182, exception, "payload"
    .return ($P182)
.end


.namespace ["UnitTest";"Result"]
.sub "stop"  :subid("26_1268929830.64406") :method :outer("12_1268929830.64406")
# .annotate "line", 101
    new $P185, 'ExceptionHandler'
    set_addr $P185, control_184
    $P185."handle_types"(58)
    push_eh $P185
    .lex "self", self
# .annotate "line", 102
    find_lex $P186, "self"
    $P186."should_stop"(1)
    find_lex $P187, "self"
# .annotate "line", 101
    .return ($P187)
  control_184:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P188, exception, "payload"
    .return ($P188)
.end


.namespace ["UnitTest";"Result"]
.sub "was_successful"  :subid("27_1268929830.64406") :method :outer("12_1268929830.64406")
# .annotate "line", 106
    new $P191, 'ExceptionHandler'
    set_addr $P191, control_190
    $P191."handle_types"(58)
    push_eh $P191
    .lex "self", self
# .annotate "line", 107
    find_lex $P194, "self"
    $N195 = $P194."error_count"()
    iseq $I196, $N195, 0.0
    if $I196, if_193
    new $P192, 'Integer'
    set $P192, $I196
    goto if_193_end
  if_193:
    find_lex $P197, "self"
    $N198 = $P197."failure_count"()
    iseq $I199, $N198, 0.0
    new $P192, 'Integer'
    set $P192, $I199
  if_193_end:
# .annotate "line", 106
    .return ($P192)
  control_190:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P200, exception, "payload"
    .return ($P200)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929870.26466")
# .annotate "line", 0
    get_hll_global $P14, ["UnitTest";"Standalone"], "_block13" 
    capture_lex $P14
# .annotate "line", 8
    get_hll_global $P14, ["UnitTest";"Standalone"], "_block13" 
    capture_lex $P14
    $P110 = $P14()
# .annotate "line", 1
    .return ($P110)
.end


.namespace []
.sub "" :load :init :subid("post20") :outer("10_1268929870.26466")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268929870.26466" 
    .local pmc block
    set block, $P12
    $P111 = get_root_global ["parrot"], "P6metaclass"
    new $P112, "ResizablePMCArray"
    push $P112, "$!name"
    $P111."new_class"("UnitTest::Standalone", $P112 :named("attr"))
.end


.namespace ["UnitTest";"Standalone"]
.sub "_block13"  :subid("11_1268929870.26466") :outer("10_1268929870.26466")
# .annotate "line", 8
    .const 'Sub' $P104 = "19_1268929870.26466" 
    capture_lex $P104
    .const 'Sub' $P96 = "18_1268929870.26466" 
    capture_lex $P96
    .const 'Sub' $P62 = "16_1268929870.26466" 
    capture_lex $P62
    .const 'Sub' $P48 = "15_1268929870.26466" 
    capture_lex $P48
    .const 'Sub' $P41 = "14_1268929870.26466" 
    capture_lex $P41
    .const 'Sub' $P30 = "13_1268929870.26466" 
    capture_lex $P30
    .const 'Sub' $P15 = "12_1268929870.26466" 
    capture_lex $P15
# .annotate "line", 48
    .const 'Sub' $P15 = "12_1268929870.26466" 
    capture_lex $P15
    .lex "sort_cmp", $P15
# .annotate "line", 32
    find_lex $P95, "sort_cmp"
# .annotate "line", 57
    .const 'Sub' $P104 = "19_1268929870.26466" 
    capture_lex $P104
# .annotate "line", 8
    .return ($P104)
.end


.namespace ["UnitTest";"Standalone"]
.sub "" :load :init :subid("post21") :outer("11_1268929870.26466")
# .annotate "line", 8
    get_hll_global $P14, ["UnitTest";"Standalone"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 12
    get_hll_global $P109, ["Kakapo"], "initload_done"
    $P109()
.end


.namespace ["UnitTest";"Standalone"]
.sub "sort_cmp"  :subid("12_1268929870.26466") :outer("11_1268929870.26466")
    .param pmc param_18
    .param pmc param_19
# .annotate "line", 48
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "$a", param_18
    .lex "$b", param_19
# .annotate "line", 49
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
# .annotate "line", 48
    .return ($P20)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P29, exception, "payload"
    .return ($P29)
.end


.namespace ["UnitTest";"Standalone"]
.sub "MAIN"  :subid("13_1268929870.26466") :method :outer("11_1268929870.26466")
# .annotate "line", 15
    new $P32, 'ExceptionHandler'
    set_addr $P32, control_31
    $P32."handle_types"(58)
    push_eh $P32
    .lex "self", self
# .annotate "line", 16
    get_global $P33, "$_Already_running"
    unless_null $P33, vivify_22
    new $P33, "Undef"
    set_global "$_Already_running", $P33
  vivify_22:
    get_global $P36, "$_Already_running"
    unless $P36, unless_35
    set $P34, $P36
    goto unless_35_end
  unless_35:
# .annotate "line", 18
    new $P37, "Integer"
    assign $P37, 1
    set_global "$_Already_running", $P37
# .annotate "line", 20
    find_lex $P38, "self"
    $P39 = $P38."main"()
# .annotate "line", 16
    set $P34, $P39
  unless_35_end:
# .annotate "line", 15
    .return ($P34)
  control_31:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P40, exception, "payload"
    .return ($P40)
.end


.namespace ["UnitTest";"Standalone"]
.sub "main"  :subid("14_1268929870.26466") :method :outer("11_1268929870.26466")
# .annotate "line", 24
    new $P43, 'ExceptionHandler'
    set_addr $P43, control_42
    $P43."handle_types"(58)
    push_eh $P43
    .lex "self", self
# .annotate "line", 27
    find_lex $P44, "self"
    $P45 = $P44."suite"()
    $P46 = $P45."run"()
# .annotate "line", 24
    .return ($P46)
  control_42:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P47, exception, "payload"
    .return ($P47)
.end


.namespace ["UnitTest";"Standalone"]
.sub "name"  :subid("15_1268929870.26466") :method :outer("11_1268929870.26466")
    .param pmc param_51 :optional
    .param int has_param_51 :opt_flag
# .annotate "line", 30
    new $P50, 'ExceptionHandler'
    set_addr $P50, control_49
    $P50."handle_types"(58)
    push_eh $P50
    .lex "self", self
    if has_param_51, optparam_23
    new $P52, "Undef"
    set param_51, $P52
  optparam_23:
    .lex "$value", param_51
    find_lex $P55, "$value"
    $P56 = $P55."defined"()
    if $P56, if_54
    find_lex $P59, "self"
    getattribute $P60, $P59, "$!name"
    unless_null $P60, vivify_24
    new $P60, "Undef"
  vivify_24:
    set $P53, $P60
    goto if_54_end
  if_54:
    find_lex $P57, "$value"
    find_lex $P58, "self"
    setattribute $P58, "$!name", $P57
    set $P53, $P57
  if_54_end:
    .return ($P53)
  control_49:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P61, exception, "payload"
    .return ($P61)
.end


.namespace ["UnitTest";"Standalone"]
.sub "run"  :subid("16_1268929870.26466") :method :outer("11_1268929870.26466")
    .param pmc param_65 :optional
    .param int has_param_65 :opt_flag
# .annotate "line", 32
    .const 'Sub' $P81 = "17_1268929870.26466" 
    capture_lex $P81
    new $P64, 'ExceptionHandler'
    set_addr $P64, control_63
    $P64."handle_types"(58)
    push_eh $P64
    .lex "self", self
    if has_param_65, optparam_25
    new $P66, "Undef"
    set param_65, $P66
  optparam_25:
    .lex "$result", param_65
# .annotate "line", 33
    find_lex $P68, "$result"
    $P69 = $P68."defined"()
    if $P69, unless_67_end
# .annotate "line", 34
    find_lex $P70, "self"
    $P71 = $P70."default_result"()
    store_lex "$result", $P71
  unless_67_end:
# .annotate "line", 37
    find_lex $P72, "$result"
    find_lex $P73, "self"
    $P74 = $P73."num_tests"()
    $P72."plan_tests"($P74)
# .annotate "line", 39
    find_lex $P76, "self"
    $P77 = $P76."members"()
    defined $I78, $P77
    unless $I78, for_undef_26
    iter $P75, $P77
    new $P91, 'ExceptionHandler'
    set_addr $P91, loop90_handler
    $P91."handle_types"(65, 67, 66)
    push_eh $P91
  loop90_test:
    unless $P75, loop90_done
    shift $P79, $P75
  loop90_redo:
    .const 'Sub' $P81 = "17_1268929870.26466" 
    capture_lex $P81
    $P81($P79)
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
  for_undef_26:
    find_lex $P93, "$result"
# .annotate "line", 32
    .return ($P93)
  control_63:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P94, exception, "payload"
    .return ($P94)
.end


.namespace ["UnitTest";"Standalone"]
.sub "_block80"  :anon :subid("17_1268929870.26466") :outer("16_1268929870.26466")
    .param pmc param_82
# .annotate "line", 39
    .lex "$_", param_82
# .annotate "line", 40
    find_lex $P85, "$result"
    $P86 = $P85."should_stop"()
    unless $P86, unless_84
    set $P83, $P86
    goto unless_84_end
  unless_84:
# .annotate "line", 41
    find_lex $P87, "$_"
    find_lex $P88, "$result"
    $P89 = $P87."run"($P88)
# .annotate "line", 40
    set $P83, $P89
  unless_84_end:
# .annotate "line", 39
    .return ($P83)
.end


.namespace ["UnitTest";"Standalone"]
.sub "sort"  :subid("18_1268929870.26466") :method :outer("11_1268929870.26466")
# .annotate "line", 52
    new $P98, 'ExceptionHandler'
    set_addr $P98, control_97
    $P98."handle_types"(58)
    push_eh $P98
    .lex "self", self
# .annotate "line", 53
    find_lex $P99, "self"
    $P100 = $P99."members"()
    get_hll_global $P101, ["UnitTest";"Suite"], "sort_cmp"
    $P100."sort"($P101)
    find_lex $P102, "self"
# .annotate "line", 52
    .return ($P102)
  control_97:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["UnitTest";"Standalone"]
.sub "suite"  :subid("19_1268929870.26466") :method :outer("11_1268929870.26466")
# .annotate "line", 57
    new $P106, 'ExceptionHandler'
    set_addr $P106, control_105
    $P106."handle_types"(58)
    push_eh $P106
    .lex "self", self
    find_lex $P107, "self"
    .return ($P107)
  control_105:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929872.6047")
# .annotate "line", 0
    get_hll_global $P14, ["UnitTest";"Suite"], "_block13" 
    capture_lex $P14
# .annotate "line", 6
    get_hll_global $P14, ["UnitTest";"Suite"], "_block13" 
    capture_lex $P14
    $P124 = $P14()
# .annotate "line", 1
    .return ($P124)
.end


.namespace ["UnitTest";"Suite"]
.sub "_block13"  :subid("11_1268929872.6047") :outer("10_1268929872.6047")
# .annotate "line", 6
    .const 'Sub' $P117 = "20_1268929872.6047" 
    capture_lex $P117
    .const 'Sub' $P109 = "19_1268929872.6047" 
    capture_lex $P109
    .const 'Sub' $P75 = "17_1268929872.6047" 
    capture_lex $P75
    .const 'Sub' $P64 = "16_1268929872.6047" 
    capture_lex $P64
    .const 'Sub' $P45 = "14_1268929872.6047" 
    capture_lex $P45
    .const 'Sub' $P30 = "13_1268929872.6047" 
    capture_lex $P30
    .const 'Sub' $P15 = "12_1268929872.6047" 
    capture_lex $P15
# .annotate "line", 54
    .const 'Sub' $P15 = "12_1268929872.6047" 
    capture_lex $P15
    .lex "sort_cmp", $P15
# .annotate "line", 38
    find_lex $P108, "sort_cmp"
# .annotate "line", 63
    .const 'Sub' $P117 = "20_1268929872.6047" 
    capture_lex $P117
# .annotate "line", 6
    .return ($P117)
.end


.namespace ["UnitTest";"Suite"]
.sub "" :load :init :subid("post21") :outer("11_1268929872.6047")
# .annotate "line", 6
    get_hll_global $P14, ["UnitTest";"Suite"], "_block13" 
    .local pmc block
    set block, $P14
# .annotate "line", 10
    get_hll_global $P122, ["UnitTest"], "Standalone"
    "extends"($P122)
# .annotate "line", 12
    new $P123, "ResizablePMCArray"
    push $P123, "@!members"
    push $P123, "$!num_tests"
    "has"($P123)
.end


.namespace ["UnitTest";"Suite"]
.sub "sort_cmp"  :subid("12_1268929872.6047") :outer("11_1268929872.6047")
    .param pmc param_18
    .param pmc param_19
# .annotate "line", 54
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "$a", param_18
    .lex "$b", param_19
# .annotate "line", 55
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
# .annotate "line", 54
    .return ($P20)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P29, exception, "payload"
    .return ($P29)
.end


.namespace ["UnitTest";"Suite"]
.sub "add_test"  :subid("13_1268929872.6047") :method :outer("11_1268929872.6047")
    .param pmc param_33
# .annotate "line", 18
    new $P32, 'ExceptionHandler'
    set_addr $P32, control_31
    $P32."handle_types"(58)
    push_eh $P32
    .lex "self", self
    .lex "$test", param_33
# .annotate "line", 19
    find_lex $P34, "self"
    $P35 = $P34."members"()
    find_lex $P36, "$test"
    $P35."push"($P36)
# .annotate "line", 20
    find_lex $P37, "self"
    find_lex $P38, "self"
    $P39 = $P38."num_tests"()
    find_lex $P40, "$test"
    $N41 = $P40."num_tests"()
    add $P42, $P39, $N41
    $P37."num_tests"($P42)
    find_lex $P43, "self"
# .annotate "line", 18
    .return ($P43)
  control_31:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P44, exception, "payload"
    .return ($P44)
.end


.namespace ["UnitTest";"Suite"]
.sub "add_tests"  :subid("14_1268929872.6047") :method :outer("11_1268929872.6047")
    .param pmc param_48 :slurpy
# .annotate "line", 24
    .const 'Sub' $P54 = "15_1268929872.6047" 
    capture_lex $P54
    new $P47, 'ExceptionHandler'
    set_addr $P47, control_46
    $P47."handle_types"(58)
    push_eh $P47
    .lex "self", self
    .lex "@tests", param_48
# .annotate "line", 25
    find_lex $P50, "@tests"
    defined $I51, $P50
    unless $I51, for_undef_22
    iter $P49, $P50
    new $P60, 'ExceptionHandler'
    set_addr $P60, loop59_handler
    $P60."handle_types"(65, 67, 66)
    push_eh $P60
  loop59_test:
    unless $P49, loop59_done
    shift $P52, $P49
  loop59_redo:
    .const 'Sub' $P54 = "15_1268929872.6047" 
    capture_lex $P54
    $P54($P52)
  loop59_next:
    goto loop59_test
  loop59_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P61, exception, 'type'
    eq $P61, 65, loop59_next
    eq $P61, 67, loop59_redo
  loop59_done:
    pop_eh 
  for_undef_22:
    find_lex $P62, "self"
# .annotate "line", 24
    .return ($P62)
  control_46:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P63, exception, "payload"
    .return ($P63)
.end


.namespace ["UnitTest";"Suite"]
.sub "_block53"  :anon :subid("15_1268929872.6047") :outer("14_1268929872.6047")
    .param pmc param_55
# .annotate "line", 25
    .lex "$_", param_55
# .annotate "line", 26
    find_lex $P56, "self"
    find_lex $P57, "$_"
    $P58 = $P56."add_test"($P57)
# .annotate "line", 25
    .return ($P58)
.end


.namespace ["UnitTest";"Suite"]
.sub "default_result"  :subid("16_1268929872.6047") :method :outer("11_1268929872.6047")
# .annotate "line", 32
    new $P66, 'ExceptionHandler'
    set_addr $P66, control_65
    $P66."handle_types"(58)
    push_eh $P66
    .lex "self", self
# .annotate "line", 33
    new $P67, "Undef"
    .lex "$result", $P67
    get_hll_global $P68, ["UnitTest"], "Result"
    $P69 = $P68."new"()
    store_lex "$result", $P69
# .annotate "line", 34
    find_lex $P70, "$result"
    get_hll_global $P71, ["UnitTest";"Listener"], "TAP"
    $P72 = $P71."new"()
    $P70."add_listener"($P72)
    find_lex $P73, "$result"
# .annotate "line", 32
    .return ($P73)
  control_65:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P74, exception, "payload"
    .return ($P74)
.end


.namespace ["UnitTest";"Suite"]
.sub "run"  :subid("17_1268929872.6047") :method :outer("11_1268929872.6047")
    .param pmc param_78 :optional
    .param int has_param_78 :opt_flag
# .annotate "line", 38
    .const 'Sub' $P94 = "18_1268929872.6047" 
    capture_lex $P94
    new $P77, 'ExceptionHandler'
    set_addr $P77, control_76
    $P77."handle_types"(58)
    push_eh $P77
    .lex "self", self
    if has_param_78, optparam_23
    new $P79, "Undef"
    set param_78, $P79
  optparam_23:
    .lex "$result", param_78
# .annotate "line", 39
    find_lex $P81, "$result"
    $P82 = $P81."defined"()
    if $P82, unless_80_end
# .annotate "line", 40
    find_lex $P83, "self"
    $P84 = $P83."default_result"()
    store_lex "$result", $P84
  unless_80_end:
# .annotate "line", 43
    find_lex $P85, "$result"
    find_lex $P86, "self"
    $P87 = $P86."num_tests"()
    $P85."plan_tests"($P87)
# .annotate "line", 45
    find_lex $P89, "self"
    $P90 = $P89."members"()
    defined $I91, $P90
    unless $I91, for_undef_24
    iter $P88, $P90
    new $P104, 'ExceptionHandler'
    set_addr $P104, loop103_handler
    $P104."handle_types"(65, 67, 66)
    push_eh $P104
  loop103_test:
    unless $P88, loop103_done
    shift $P92, $P88
  loop103_redo:
    .const 'Sub' $P94 = "18_1268929872.6047" 
    capture_lex $P94
    $P94($P92)
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
  for_undef_24:
    find_lex $P106, "$result"
# .annotate "line", 38
    .return ($P106)
  control_76:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["UnitTest";"Suite"]
.sub "_block93"  :anon :subid("18_1268929872.6047") :outer("17_1268929872.6047")
    .param pmc param_95
# .annotate "line", 45
    .lex "$_", param_95
# .annotate "line", 46
    find_lex $P98, "$result"
    $P99 = $P98."should_stop"()
    unless $P99, unless_97
    set $P96, $P99
    goto unless_97_end
  unless_97:
# .annotate "line", 47
    find_lex $P100, "$_"
    find_lex $P101, "$result"
    $P102 = $P100."run"($P101)
# .annotate "line", 46
    set $P96, $P102
  unless_97_end:
# .annotate "line", 45
    .return ($P96)
.end


.namespace ["UnitTest";"Suite"]
.sub "sort"  :subid("19_1268929872.6047") :method :outer("11_1268929872.6047")
# .annotate "line", 58
    new $P111, 'ExceptionHandler'
    set_addr $P111, control_110
    $P111."handle_types"(58)
    push_eh $P111
    .lex "self", self
# .annotate "line", 59
    find_lex $P112, "self"
    $P113 = $P112."members"()
    get_hll_global $P114, ["UnitTest";"Suite"], "sort_cmp"
    $P113."sort"($P114)
    find_lex $P115, "self"
# .annotate "line", 58
    .return ($P115)
  control_110:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["UnitTest";"Suite"]
.sub "suite"  :subid("20_1268929872.6047") :method :outer("11_1268929872.6047")
# .annotate "line", 63
    new $P119, 'ExceptionHandler'
    set_addr $P119, control_118
    $P119."handle_types"(58)
    push_eh $P119
    .lex "self", self
    find_lex $P120, "self"
    .return ($P120)
  control_118:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, "payload"
    .return ($P121)
.end


.namespace []
.sub "_block11"  :anon :subid("10_1268929900.17511")
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
    $P212 = $P22()
# .annotate "line", 1
    .return ($P212)
.end


.namespace []
.sub "" :load :init :subid("post31") :outer("10_1268929900.17511")
# .annotate "line", 0
    .const 'Sub' $P12 = "10_1268929900.17511" 
    .local pmc block
    set block, $P12
    $P213 = get_root_global ["parrot"], "P6metaclass"
    $P213."new_class"("Exception::UnitTestFailure", "Exception::Wrapper" :named("parent"))
.end


.namespace ["Exception";"UnitTestFailure"]
.sub "_block13"  :subid("11_1268929900.17511") :outer("10_1268929900.17511")
# .annotate "line", 4
    .const 'Sub' $P15 = "12_1268929900.17511" 
    capture_lex $P15
# .annotate "line", 5
    .const 'Sub' $P15 = "12_1268929900.17511" 
    capture_lex $P15
# .annotate "line", 4
    .return ($P15)
.end


.namespace ["Exception";"UnitTestFailure"]
.sub "severity"  :subid("12_1268929900.17511") :method :outer("11_1268929900.17511")
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
.sub "_block21"  :subid("13_1268929900.17511") :outer("10_1268929900.17511")
# .annotate "line", 10
    .const 'Sub' $P201 = "30_1268929900.17511" 
    capture_lex $P201
    .const 'Sub' $P185 = "29_1268929900.17511" 
    capture_lex $P185
    .const 'Sub' $P181 = "28_1268929900.17511" 
    capture_lex $P181
    .const 'Sub' $P172 = "27_1268929900.17511" 
    capture_lex $P172
    .const 'Sub' $P101 = "22_1268929900.17511" 
    capture_lex $P101
    .const 'Sub' $P95 = "21_1268929900.17511" 
    capture_lex $P95
    .const 'Sub' $P80 = "20_1268929900.17511" 
    capture_lex $P80
    .const 'Sub' $P74 = "19_1268929900.17511" 
    capture_lex $P74
    .const 'Sub' $P64 = "18_1268929900.17511" 
    capture_lex $P64
    .const 'Sub' $P54 = "17_1268929900.17511" 
    capture_lex $P54
    .const 'Sub' $P43 = "16_1268929900.17511" 
    capture_lex $P43
    .const 'Sub' $P32 = "15_1268929900.17511" 
    capture_lex $P32
    .const 'Sub' $P23 = "14_1268929900.17511" 
    capture_lex $P23
# .annotate "line", 44
    .const 'Sub' $P23 = "14_1268929900.17511" 
    capture_lex $P23
    .lex "fail", $P23
# .annotate "line", 49
    .const 'Sub' $P32 = "15_1268929900.17511" 
    capture_lex $P32
    .lex "fail_if", $P32
# .annotate "line", 54
    .const 'Sub' $P43 = "16_1268929900.17511" 
    capture_lex $P43
    .lex "fail_unless", $P43
# .annotate "line", 122
    .const 'Sub' $P54 = "17_1268929900.17511" 
    capture_lex $P54
    .lex "todo_test", $P54
# .annotate "line", 126
    .const 'Sub' $P64 = "18_1268929900.17511" 
    capture_lex $P64
    .lex "verify_that", $P64
# .annotate "line", 38
    find_lex $P92, "fail"
    find_lex $P93, "fail_if"
    find_lex $P94, "fail_unless"
# .annotate "line", 120
    find_lex $P205, "todo_test"
    find_lex $P206, "verify_that"
# .annotate "line", 10
    .return ($P206)
.end


.namespace ["UnitTest";"Testcase"]
.sub "" :load :init :subid("post32") :outer("13_1268929900.17511")
# .annotate "line", 10
    get_hll_global $P22, ["UnitTest";"Testcase"], "_block21" 
    .local pmc block
    set block, $P22
# .annotate "line", 14
    get_hll_global $P207, ["UnitTest"], "Standalone"
    "extends"($P207)
# .annotate "line", 17
    new $P208, "ResizablePMCArray"
    push $P208, "$!todo"
    push $P208, "$!verify"
    "has"($P208)
# .annotate "line", 22
    new $P209, "ResizablePMCArray"
    push $P209, "fail"
    push $P209, "fail_if"
    push $P209, "fail_unless"
    push $P209, "verify_that"
    "export"($P209)
# .annotate "line", 29
    get_hll_global $P210, ["UnitTest";"Testcase"], "todo_test"
    "export"($P210, "todo" :named("as"))
# .annotate "line", 31
    get_hll_global $P211, ["Kakapo"], "initload_done"
    $P211()
.end


.namespace ["UnitTest";"Testcase"]
.sub "fail"  :subid("14_1268929900.17511") :outer("13_1268929900.17511")
    .param pmc param_26
# .annotate "line", 44
    new $P25, 'ExceptionHandler'
    set_addr $P25, control_24
    $P25."handle_types"(58)
    push_eh $P25
    .lex "$why", param_26
# .annotate "line", 45
    get_hll_global $P27, ["Exception"], "UnitTestFailure"
    find_lex $P28, "$why"
    $P29 = $P27."new"($P28 :named("message"))
    $P30 = $P29."throw"()
# .annotate "line", 44
    .return ($P30)
  control_24:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P31, exception, "payload"
    .return ($P31)
.end


.namespace ["UnitTest";"Testcase"]
.sub "fail_if"  :subid("15_1268929900.17511") :outer("13_1268929900.17511")
    .param pmc param_35
    .param pmc param_36
# .annotate "line", 49
    new $P34, 'ExceptionHandler'
    set_addr $P34, control_33
    $P34."handle_types"(58)
    push_eh $P34
    .lex "$condition", param_35
    .lex "$why", param_36
# .annotate "line", 50
    find_lex $P39, "$condition"
    if $P39, if_38
    set $P37, $P39
    goto if_38_end
  if_38:
    find_lex $P40, "$why"
    $P41 = "fail"($P40)
    set $P37, $P41
  if_38_end:
# .annotate "line", 49
    .return ($P37)
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P42, exception, "payload"
    .return ($P42)
.end


.namespace ["UnitTest";"Testcase"]
.sub "fail_unless"  :subid("16_1268929900.17511") :outer("13_1268929900.17511")
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
    unless $P50, unless_49
    set $P48, $P50
    goto unless_49_end
  unless_49:
    find_lex $P51, "$why"
    $P52 = "fail"($P51)
    set $P48, $P52
  unless_49_end:
# .annotate "line", 54
    .return ($P48)
  control_44:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P53, exception, "payload"
    .return ($P53)
.end


.namespace ["UnitTest";"Testcase"]
.sub "todo_test"  :subid("17_1268929900.17511") :outer("13_1268929900.17511")
    .param pmc param_57 :slurpy
# .annotate "line", 122
    new $P56, 'ExceptionHandler'
    set_addr $P56, control_55
    $P56."handle_types"(58)
    push_eh $P56
    .lex "@text", param_57
# .annotate "line", 123
    get_hll_global $P58, ["Parrot"], "get_self"
    $P59 = $P58()
    find_lex $P60, "@text"
    $P61 = $P60."join"()
    $P62 = $P59."todo"($P61)
# .annotate "line", 122
    .return ($P62)
  control_55:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P63, exception, "payload"
    .return ($P63)
.end


.namespace ["UnitTest";"Testcase"]
.sub "verify_that"  :subid("18_1268929900.17511") :outer("13_1268929900.17511")
    .param pmc param_67 :slurpy
# .annotate "line", 126
    new $P66, 'ExceptionHandler'
    set_addr $P66, control_65
    $P66."handle_types"(58)
    push_eh $P66
    .lex "@text", param_67
# .annotate "line", 127
    get_hll_global $P68, ["Parrot"], "get_self"
    $P69 = $P68()
    find_lex $P70, "@text"
    $P71 = $P70."join"()
    $P72 = $P69."verify"($P71)
# .annotate "line", 126
    .return ($P72)
  control_65:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P73, exception, "payload"
    .return ($P73)
.end


.namespace ["UnitTest";"Testcase"]
.sub "default_loader"  :subid("19_1268929900.17511") :method :outer("13_1268929900.17511")
# .annotate "line", 34
    new $P76, 'ExceptionHandler'
    set_addr $P76, control_75
    $P76."handle_types"(58)
    push_eh $P76
    .lex "self", self
# .annotate "line", 35
    get_hll_global $P77, ["UnitTest"], "Loader"
    $P78 = $P77."new"()
# .annotate "line", 34
    .return ($P78)
  control_75:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P79, exception, "payload"
    .return ($P79)
.end


.namespace ["UnitTest";"Testcase"]
.sub "default_result"  :subid("20_1268929900.17511") :method :outer("13_1268929900.17511")
# .annotate "line", 38
    new $P82, 'ExceptionHandler'
    set_addr $P82, control_81
    $P82."handle_types"(58)
    push_eh $P82
    .lex "self", self
# .annotate "line", 39
    new $P83, "Undef"
    .lex "$result", $P83
    get_hll_global $P84, ["UnitTest"], "Result"
    $P85 = $P84."new"()
    store_lex "$result", $P85
# .annotate "line", 40
    find_lex $P86, "$result"
    get_hll_global $P87, ["UnitTest";"Listener"], "TAP"
    $P88 = $P87."new"()
    $P86."add_listener"($P88)
# .annotate "line", 41
    new $P89, "Exception"
    set $P89['type'], 58
    find_lex $P90, "$result"
    setattribute $P89, 'payload', $P90
    throw $P89
# .annotate "line", 38
    .return ()
  control_81:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P91, exception, "payload"
    .return ($P91)
.end


.namespace ["UnitTest";"Testcase"]
.sub "num_tests"  :subid("21_1268929900.17511") :method :outer("13_1268929900.17511")
# .annotate "line", 58
    new $P97, 'ExceptionHandler'
    set_addr $P97, control_96
    $P97."handle_types"(58)
    push_eh $P97
    .lex "self", self
# .annotate "line", 59
    new $P98, "Exception"
    set $P98['type'], 58
    new $P99, "Integer"
    assign $P99, 1
    setattribute $P98, 'payload', $P99
    throw $P98
# .annotate "line", 58
    .return ()
  control_96:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["UnitTest";"Testcase"]
.sub "run"  :subid("22_1268929900.17511") :method :outer("13_1268929900.17511")
    .param pmc param_104 :optional
    .param int has_param_104 :opt_flag
# .annotate "line", 63
    .const 'Sub' $P134 = "25_1268929900.17511" 
    capture_lex $P134
    .const 'Sub' $P116 = "23_1268929900.17511" 
    capture_lex $P116
    new $P103, 'ExceptionHandler'
    set_addr $P103, control_102
    $P103."handle_types"(58)
    push_eh $P103
    .lex "self", self
    if has_param_104, optparam_33
    new $P105, "Undef"
    set param_104, $P105
  optparam_33:
    .lex "$result", param_104
# .annotate "line", 69
    new $P106, "Undef"
    .lex "$exception", $P106
# .annotate "line", 64
    find_lex $P108, "$result"
    $P109 = $P108."defined"()
    if $P109, unless_107_end
# .annotate "line", 65
    find_lex $P110, "self"
    $P111 = $P110."default_result"()
    store_lex "$result", $P111
  unless_107_end:
# .annotate "line", 68
    find_lex $P112, "$result"
    find_lex $P113, "self"
    $P112."start_test"($P113)
    find_lex $P114, "$exception"
# .annotate "line", 71
    .const 'Sub' $P116 = "23_1268929900.17511" 
    capture_lex $P116
    $P116()
# .annotate "line", 81
    .const 'Sub' $P134 = "25_1268929900.17511" 
    capture_lex $P134
    $P134()
# .annotate "line", 93
    find_lex $P154, "$exception"
    $P155 = $P154."defined"()
    if $P155, if_153
# .annotate "line", 102
    find_lex $P168, "$result"
    find_lex $P169, "self"
    $P168."end_test"($P169)
# .annotate "line", 101
    goto if_153_end
  if_153:
# .annotate "line", 94
    find_lex $P157, "$exception"
    $N158 = $P157."type"()
    get_hll_global $P159, ["Exception"], "UnitTestFailure"
    $N160 = $P159."type"()
    iseq $I161, $N158, $N160
    if $I161, if_156
# .annotate "line", 98
    find_lex $P165, "$result"
    find_lex $P166, "self"
    find_lex $P167, "$exception"
    $P165."add_error"($P166, $P167)
# .annotate "line", 97
    goto if_156_end
  if_156:
# .annotate "line", 95
    find_lex $P162, "$result"
    find_lex $P163, "self"
    find_lex $P164, "$exception"
    $P162."add_failure"($P163, $P164)
  if_156_end:
  if_153_end:
# .annotate "line", 93
    find_lex $P170, "$result"
# .annotate "line", 63
    .return ($P170)
  control_102:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P171, exception, "payload"
    .return ($P171)
.end


.namespace ["UnitTest";"Testcase"]
.sub "_block115"  :anon :subid("23_1268929900.17511") :outer("22_1268929900.17511")
# .annotate "line", 71
    .const 'Sub' $P125 = "24_1268929900.17511" 
    capture_lex $P125
    new $P121, 'ExceptionHandler'
    set_addr $P121, control_120
    $P121."handle_types_except"(58, 59, 60, 61, 63, 64, 65, 66, 67)
    push_eh $P121
# .annotate "line", 72
    find_lex $P117, "self"
    $P117."set_up"()
# .annotate "line", 73
    find_lex $P118, "self"
    $P118."run_test"()
# .annotate "line", 71
    pop_eh 
    goto skip_handler_119
  control_120:
# .annotate "line", 75
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P125 = "24_1268929900.17511" 
    capture_lex $P125
    $P125(exception)
    new $P131, 'Integer'
    set $P131, 1
    set exception["handled"], $P131
    set $I132, exception["handled"]
    ne $I132, 1, nothandled_123
  handled_122:
    .return (exception)
  nothandled_123:
    rethrow exception
  skip_handler_119:
# .annotate "line", 71
    .return ()
.end


.namespace ["UnitTest";"Testcase"]
.sub "_block124"  :anon :subid("24_1268929900.17511") :outer("23_1268929900.17511")
    .param pmc param_126
# .annotate "line", 75
    .lex "$_", param_126
    find_lex $P127, "$_"
    .lex "$!", $P127
# .annotate "line", 76
    find_lex $P128, "$!"
    store_lex "$exception", $P128
# .annotate "line", 77
    find_lex $P129, "$!"
    $P130 = $P129."handled"(1)
# .annotate "line", 75
    .return ($P130)
.end


.namespace ["UnitTest";"Testcase"]
.sub "_block133"  :anon :subid("25_1268929900.17511") :outer("22_1268929900.17511")
# .annotate "line", 81
    .const 'Sub' $P142 = "26_1268929900.17511" 
    capture_lex $P142
    new $P138, 'ExceptionHandler'
    set_addr $P138, control_137
    $P138."handle_types_except"(58, 59, 60, 61, 63, 64, 65, 66, 67)
    push_eh $P138
# .annotate "line", 82
    find_lex $P135, "self"
    $P135."tear_down"()
# .annotate "line", 81
    pop_eh 
    goto skip_handler_136
  control_137:
# .annotate "line", 84
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P142 = "26_1268929900.17511" 
    capture_lex $P142
    $P142(exception)
    new $P151, 'Integer'
    set $P151, 1
    set exception["handled"], $P151
    set $I152, exception["handled"]
    ne $I152, 1, nothandled_140
  handled_139:
    .return (exception)
  nothandled_140:
    rethrow exception
  skip_handler_136:
# .annotate "line", 81
    .return ()
.end


.namespace ["UnitTest";"Testcase"]
.sub "_block141"  :anon :subid("26_1268929900.17511") :outer("25_1268929900.17511")
    .param pmc param_143
# .annotate "line", 84
    .lex "$_", param_143
    find_lex $P144, "$_"
    .lex "$!", $P144
# .annotate "line", 85
    find_lex $P145, "$!"
    $P145."handled"(1)
# .annotate "line", 87
    find_lex $P148, "$exception"
    $P149 = $P148."defined"()
    unless $P149, unless_147
    set $P146, $P149
    goto unless_147_end
  unless_147:
# .annotate "line", 88
    find_lex $P150, "$!"
    store_lex "$exception", $P150
# .annotate "line", 87
    set $P146, $P150
  unless_147_end:
# .annotate "line", 84
    .return ($P146)
.end


.namespace ["UnitTest";"Testcase"]
.sub "run_test"  :subid("27_1268929900.17511") :method :outer("13_1268929900.17511")
# .annotate "line", 108
    new $P174, 'ExceptionHandler'
    set_addr $P174, control_173
    $P174."handle_types"(58)
    push_eh $P174
    .lex "self", self
# .annotate "line", 109
    get_hll_global $P175, ["Parrot"], "call_method"
    find_lex $P176, "self"
    find_lex $P177, "self"
    $P178 = $P177."name"()
    $P179 = $P175($P176, $P178)
# .annotate "line", 108
    .return ($P179)
  control_173:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P180, exception, "payload"
    .return ($P180)
.end


.namespace ["UnitTest";"Testcase"]
.sub "set_up"  :subid("28_1268929900.17511") :method :outer("13_1268929900.17511")
# .annotate "line", 112
    new $P183, 'ExceptionHandler'
    set_addr $P183, control_182
    $P183."handle_types"(58)
    push_eh $P183
    .lex "self", self
    .return ()
  control_182:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P184, exception, "payload"
    .return ($P184)
.end


.namespace ["UnitTest";"Testcase"]
.sub "suite"  :subid("29_1268929900.17511") :method :outer("13_1268929900.17511")
# .annotate "line", 114
    new $P187, 'ExceptionHandler'
    set_addr $P187, control_186
    $P187."handle_types"(58)
    push_eh $P187
    .lex "self", self
# .annotate "line", 115
    new $P188, "Undef"
    .lex "$suite", $P188
    find_lex $P189, "self"
    $P190 = $P189."default_loader"()
    find_lex $P191, "self"
    $P192 = $P190."load_tests_from_testcase"($P191)
    store_lex "$suite", $P192
# .annotate "line", 116
    find_lex $P193, "$suite"
    new $P194, "String"
    assign $P194, "Test suite for "
    find_lex $P195, "self"
    $P196 = $P195."WHAT"()
    typeof $S197, $P196
    concat $P198, $P194, $S197
    $P193."name"($P198)
    find_lex $P199, "$suite"
# .annotate "line", 114
    .return ($P199)
  control_186:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P200, exception, "payload"
    .return ($P200)
.end


.namespace ["UnitTest";"Testcase"]
.sub "tear_down"  :subid("30_1268929900.17511") :method :outer("13_1268929900.17511")
# .annotate "line", 120
    new $P203, 'ExceptionHandler'
    set_addr $P203, control_202
    $P203."handle_types"(58)
    push_eh $P203
    .lex "self", self
    .return ()
  control_202:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P204, exception, "payload"
    .return ($P204)
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
