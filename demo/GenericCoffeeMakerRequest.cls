Class demo.GenericCoffeeMakerRequest Extends Ens.Request
{

Property Method As %String;

Property URL As %String;

Property Argument1 As %String;

Property Payload As demo.tempCoffeemaker;

Storage Default
{
<Data name="GenericCoffeeMakerRequestDefaultData">
<Subscript>"GenericCoffeeMakerRequest"</Subscript>
<Value name="1">
<Value>Method</Value>
</Value>
<Value name="2">
<Value>URL</Value>
</Value>
<Value name="3">
<Value>String</Value>
</Value>
<Value name="4">
<Value>Argument1</Value>
</Value>
<Value name="5">
<Value>Payload</Value>
</Value>
</Data>
<DefaultData>GenericCoffeeMakerRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

/// This callback method is invoked by the <METHOD>%Delete</METHOD> method to 
/// provide notification that the object specified by <VAR>oid</VAR> is being deleted.
/// 
/// <P>If this method returns an error then the object will not be deleted.
ClassMethod %OnDelete(oid As %ObjectIdentity) As %Status [ Private, ServerOnly = 1 ]
{
	Set tSC = $$$OK, tThis = ##class(demo.GenericCoffeeMakerRequest).%Open(oid)
     If $ISOBJECT(tThis.Payload) {
	    Set tSC = ##class(demo.tempCoffeemaker).%DeleteId(tThis.Payload.%Id())
    	Quit tSC
     }
	Quit $$$OK
}

}
