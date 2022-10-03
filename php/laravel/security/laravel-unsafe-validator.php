<?php

namespace App\Http\Controllers\Accounting;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use Illuminate\Support\Facades\Validator;
use PDF;
use Illuminate\Validation\Rule;

class ChartofAccount extends Controller
{
    public function __construct() {
        $this->middleware("auth");
    }
    
    function index(){
        if(Auth::user()->accesslevel == env("ACCTNG_HEAD")){
            $accounts = \App\ChartOfAccount::orderBy("accounting_name")->get();
            return view("accounting.chart_of_accounts.index", compact("accounts"));
        }
    }
    
    function new_account(Request $request){
        if(Auth::user()->accesslevel == env("ACCTNG_HEAD")){
            $validate = Validator::make($request->all(),[
                // ok: laravel-unsafe-validator
                "accounting_code" => "required|unique:chart_of_accounts",
                // ok: laravel-unsafe-validator
                "accounting_name" => "required|unique:chart_of_accounts",
                // ok: laravel-unsafe-validator
                "some_property" => [ Rule::unique("some_column_name")->ignore(Auth::user()->id, "pk_column_name"), "required" ]
            ]);
            
            if($validate->fails()){
                return redirect()->back()->withErrors($validate);
            }
            
            $newaccount = new \App\ChartOfAccount;
            $newaccount->accounting_code = $request->accounting_code;
            $newaccount->accounting_name = $request->accounting_name;
            $newaccount->category = $request->category;
            $newaccount->save();
            
            return redirect()->back()->withSuccess("Successfully created!");
        }
    }
    
    function print_lists(){
        if(Auth::user()->accesslevel == env("ACCTNG_HEAD")){
            $accounts = \App\ChartOfAccount::orderBy("accounting_name")->get();
            $pdf = PDF::loadView('accounting.chart_of_accounts.print_lists',compact('accounts'));
            $pdf->setPaper('letter','portrait');
            return $pdf->stream("chart_of_accounts.pdf");
        }
    }
    
    function delete_account($id){
        if(Auth::user()->accesslevel == env("ACCTNG_HEAD")){
            $account = \App\ChartOfAccount::find($id);
            
            $exists = \App\Accounting::where(function($query) use($account){
                $query->where("accounting_code", $account->accounting_code)
                        ->orWhere("accounting_name", $account->accounting_name);
            })->get();
            
            if($exists->isEmpty()){
                $account->delete();
                
                return redirect()->back()->withSuccess("Account already deleted!");
            }else{
                
                return redirect()->back()->withErrors("The account you are trying to delete already have a record.");
            }
            
        }
    }
    
    function update_account($id){
        if(Auth::user()->accesslevel == env("ACCTNG_HEAD")){
            $account = \App\ChartOfAccount::find($id);
            
            $exists = \App\Accounting::where(function($query) use($account){
                $query->where("accounting_code", $account->accounting_code)
                        ->orWhere("accounting_name", $account->accounting_name);
            })->get();
            
            if($exists->isEmpty()){
                return view("accounting.chart_of_accounts.update_form", compact("id","account"));
            }else{
                return redirect()->back()->withErrors("The account you are trying to update already have a record.");
            }
            
        }
    }
    
    function update_account_post(Request $request){
        $validate = Validator::make($request->all(),[
            // ruleid: laravel-unsafe-validator
            "accounting_code" => [ Rule::unique("chart_of_accounts")->ignore($request->chart_id,"id"), "required" ],
            // ruleid: laravel-unsafe-validator
            "accounting_name" => [ Rule::unique("chart_of_accounts")->ignore($request->chart_id,"id"), "required" ],
        ]);

        if($validate->fails()){
            return redirect(url("/accounting/chart_of_accounts"))->withErrors($validate);
        }

        $newaccount = \App\ChartOfAccount::find($request->chart_id);
        $newaccount->accounting_code = $request->accounting_code;
        $newaccount->accounting_name = $request->accounting_name;
        $newaccount->category = $request->category;
        $newaccount->save();

        return redirect(url("/accounting/chart_of_accounts"))->withSuccess("Successfully updated!");
    }

    function update_account_post2(Request $request){
        $validate = Validator::make($request->all(),[
            "accounting_code" => [
              // ruleid: laravel-unsafe-validator
              Rule::unique("chart_of_accounts")->ignore($id, $request->input('column')),
              "required"
            ],
        ]);

        if($validate->fails()){
            return redirect(url("/accounting/chart_of_accounts"))->withErrors($validate);
        }

        $newaccount = \App\ChartOfAccount::find($request->chart_id);
        $newaccount->accounting_code = $request->accounting_code;
        $newaccount->accounting_name = $request->accounting_name;
        $newaccount->category = $request->category;
        $newaccount->save();

        return redirect(url("/accounting/chart_of_accounts"))->withSuccess("Successfully updated!");
    }
}


use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;


class TestRequest extends FormRequest
{
    public function rules()
    {

      $id = $this->query->get('hello');
      // ruleid: laravel-unsafe-validator
      $test_unique1 = Rule::unique('users')->ignore($id);

      $hello = 1;
      // ruleid: laravel-unsafe-validator
      $test_unique2 = Rule::unique('users')->ignore($hello, $this->input('hello'));

      // ok: laravel-unsafe-validator
      $ok_unique = Rule::unique('users')->ignore($this->user()->id);

      return [
        'title' => [
          'required',
           $test_unique1,
           $test_unique2
        ]
      ];
    }
}
