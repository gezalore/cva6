// Copyright 2021 OpenHW Group
// Copyright 2021 Silicon Labs, Inc.
//
// Licensed under the Solderpad Hardware Licence, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://solderpad.org/licenses/
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


class uvma_isa_mon_c extends uvm_monitor;

  `uvm_component_utils(uvma_isa_mon_c);

  uvma_isa_cntxt_c cntxt;

  extern function new(string name, uvm_component parent);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : uvma_isa_mon_c


function uvma_isa_mon_c::new(string name = "uvma_isa_mon", uvm_component parent = null);

  super.new(name, parent);

endfunction : new


function void uvma_isa_mon_c::build_phase(uvm_phase phase);

  super.build_phase(phase);

  void'(uvm_config_db#(uvma_isa_cntxt_c)::get(this, "", "cntxt", cntxt));
  if (!cntxt) begin
    `uvm_fatal("CNTXT", "Context handle is null")
  end

endfunction : build_phase


task uvma_isa_mon_c::run_phase(uvm_phase phase);

  super.run_phase(phase);

  // TODO if cfg.enabled, while 1, wait cntxt.vif.reset, ...

endtask : run_phase
