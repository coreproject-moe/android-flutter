package moe.coreproject

import android.util.Log
import android.os.Bundle
import android.content.Context
import android.graphics.Color
import android.view.View
import android.view.ViewGroup;
import io.flutter.plugin.platform.PlatformView

import org.mozilla.geckoview.GeckoRuntime;
import org.mozilla.geckoview.GeckoSession;
import org.mozilla.geckoview.GeckoView;

internal class PlatformGeckoView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private lateinit var sRuntime: GeckoRuntime
    // internal vals
    private var view : GeckoView
    private  var session : GeckoSession
    private final var EXTENSION_LOCATION = "resource://android/assets/ublock/"

    override fun getView(): View {
        return view
    }

    override fun dispose() {
       // sRuntime.shutdown()
    }

    init{
        view = GeckoView(context);
        session = GeckoSession()

        // Workaround for Bug 1758212
        session.setContentDelegate(object : GeckoSession.ContentDelegate{} )
        // GeckoRuntime can only be initialized once per process
        // https://stackoverflow.com/a/59368968
        sRuntime = GeckoRuntime.getDefault(context);
        session.open(sRuntime)
        sRuntime.getWebExtensionController().ensureBuiltIn(
            EXTENSION_LOCATION,
            "uBlock0@raymondhill.net"
        ).accept(
            { extension ->
                // Use Log to print information about the installed extension
                Log.i("MessageDelegate", "Extension installed: " + extension)
            },
            { e ->
                // Handle error if registering the WebExtension fails
                Log.e("MessageDelegate", "Error registering WebExtension", e)
            }
        )
        view.setSession(session)
        view.setLayoutParams(ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.MATCH_PARENT))
        session.loadUri(creationParams?.getOrDefault("url","about:buildconfig").toString()) // Or any other URL...
    }
}
