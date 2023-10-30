package moe.coreproject

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
        view.setSession(session)
        view.setLayoutParams(ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.MATCH_PARENT))
        session.loadUri("about:buildconfig") // Or any other URL...
    }
}
