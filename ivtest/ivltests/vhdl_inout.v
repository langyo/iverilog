// Copyright (c) 2015-2025 CERN
// @author Maciej Suminski <maciej.suminski@cern.ch>
//
// This source code is free software; you can redistribute it
// and/or modify it in source code form under the terms of the GNU
// General Public License as published by the Free Software
// Foundation; either version 2 of the License, or (at your option)
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA


// Test for port inout mode.

module vhdl_inout_test;
wire a; // An inout port cannot connect to a variable, so make it a wire.
logic b, c;
vhdl_inout dut(a, b, c);

initial begin
    b <= 1'b0;
    #1;
    if(a !== 1'b1 || c !== 1'b0) begin
        $display("FAILED 1");
        $finish();
    end

    b <= 1'b1;
    #1;
    if(a !== 1'b0 || c !== 1'b1) begin
        $display("FAILED 2");
        $finish();
    end

    $display("PASSED");
end
endmodule
