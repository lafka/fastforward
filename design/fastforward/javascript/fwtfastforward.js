/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready( function($) {
    $("input[type=text],input[type=password]").focus( function() {
        if ( this.value == this.defaultValue ) {
            this.value = '';
        }
    });
    $("input[type=text]").blur( function() {
       if ( $.trim(this.value) == '' )
       {
           this.value = ( this.defaultValue ? this.defaultValue : '');
       }
    });
} );