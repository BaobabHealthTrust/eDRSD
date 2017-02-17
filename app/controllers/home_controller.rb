class HomeController < ApplicationController
  def index
  end

  def tasks
=begin
  var tasks = [
    ['View','View open cases','/tasks'],
    ['Printed','View printed cases','/tasks'],
    ['Dispatched','View dispatched certificates','/tasks'],
    ['Conflict cases','View cases with queries','/tasks'],
    ['Rejected cases','View rejected cases','/tasks'],
    ['Re-printing','View cases approved for re-reprinting','/tasks'],
    ['Potential duplicates','Approve potential duplicates','/tasks']
];

=end

    @tasks = []

    if has_role("View a record")
      @tasks << ['Open cases','View open cases','/open_cases','fa fa-eye','info']
    end

    if has_role("View closed cases")
      @tasks << ['View closed cases','View closed cases','/closed_cases','fa fa-envelope','info']
    end

    if has_role("Manage incomplete records")
      @tasks << ['View incomplete cases','View incomplete cases','/incomplete_cases','fa fa-folder','info']
    end

    if has_role("Manage incomplete records") 
      @tasks << ['Reject cases','Reject cases','/rejected_cases','fa fa-sticky-note-o','info']
    end

    if has_role("View closed cases")
      @tasks << ['Dispatched cases','View dispatched certificates','/dispatched','fa fa-ticket','info']
      @tasks << ['Conflict cases','View cases with queries','/conflict','fa fa-sun-o','info']
    end

    if has_role("Manage incomplete records") 
      @tasks << ['Re-approve cases','Re-approve cases','/re_approved_cases','fa fa-thumps-up','info']
      @tasks << ['Reject/Approve cases','Reject/Approve cases','/rejected_and_approved_cases','fa fa-thumps-down','info']
    end

    if has_role("View closed cases")
      @tasks << ['Cloased cased','View all closed cases','/dispatched','fa fa-circle','info']
      @tasks << ['Conflict cases','View cases with queries','/conflict','fa fa-plus-square','info']
    end

    if has_role("Manage incomplete records")
      @tasks << ['Re-approved cases','View re-approved cases','/re_approved_cases','fa fa-check','info']
      @tasks << ['Rejected/Approved cases','View rejected and approved_cases','/rejected_and_approved_cases','fa fa-thumps-down','info']
    end

    if has_role("Reject a record")
      @tasks << ['Reject record','Reject record','/dm_reject','fa fa-thumps-down','info']
    end

    if has_role("Void outstanding records")
      @tasks << ['Void cases','Void cases','/void_cases','fa fa-trash-o','danger']
      @tasks << ['Voided cases','View void cases','/voided_cases','fa fa-trash','info']
    end

    if has_role("View closed cases")
      @tasks << ['Approve for re-printing','Approve for re-printing','/approve_for_reprinting','fa fa-check-circle','info']
      @tasks << ['Potential duplicates','View potential duplicates','/approve_potential_duplicates','fa fa-file-text','info']
    end

    if has_role("Make ammendments")
      @tasks << ['View requests','View requests','/view_requests','fa fa-question','info']
    end

    if has_role("Authorise printing")
      @tasks << ['Approve for printing','Approve for printing','/approve_for_printing','fa fa-check','info']
      @tasks << ['Print Certificates','Print Certificates','/print','fa fa-print','success']
      @tasks << ['Re-print certificates','Re-print certificates','/re_print','fa fa-print','info']
      @tasks << ['Dispatch print outs','View dispatched print outs','/dispatch_printouts','fa fa-truck','info']
    end 

    if has_role("Authorise reprinting of a certificate")
      @tasks << ['Approve re-printing','Approve for re-printing','/approve_reprint','fa fa-thumbs-o-up','info']
    end

    if has_role(("Assess certificate quality"))
      @tasks << ['Verify certificates','Verify certificates','/verify_certificates','fa fa-check-square-o','info']
    end

  end

end
