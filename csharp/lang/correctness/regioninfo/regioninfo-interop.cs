using System;
using System.Globalization;

public class SamplesRegionInfo  {

   public static void Main()  {

      // Creates a RegionInfo using the ISO 3166 two-letter code.
      RegionInfo myRI1 = new RegionInfo( "US" );

      // Creates a RegionInfo using a CultureInfo.LCID.
      RegionInfo myRI2 = new RegionInfo( new CultureInfo("en-US",false).LCID );

      using (AnonymousPipeServerStream pipeServer =
                  new AnonymousPipeServerStream(PipeDirection.Out,
                  HandleInheritability.Inheritable)){
      using(StreamWriter sw = new StreamWriter(pipeServer)){
         //ruleid: correctness-regioninfo-interop
         sw.WriteLine(myRI1);
         //ok
         sw.WriteLine(myRI2);
      }}
   }
}