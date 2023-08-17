///state_switch_previous()
ds_stack_pop(state_stack);
var _state=ds_stack_top(state_stack);
state_switch(_state,false);

