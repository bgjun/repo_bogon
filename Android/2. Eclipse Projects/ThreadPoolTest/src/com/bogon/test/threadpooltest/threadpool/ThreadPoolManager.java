package com.bogon.test.threadpooltest.threadpool;

import android.util.Log;

public class ThreadPoolManager {

    private static final String TAG = ThreadPoolManager.class.getSimpleName();

    private static final boolean D = true;
    
    private static ThreadPoolManager sThreadPoolInstance;

    private ThreadPool mThreadPool;
            
    public static synchronized ThreadPoolManager getInstance() {
        if (D) Log.d(TAG, "getInstance");
        if (sThreadPoolInstance == null) {
            sThreadPoolInstance = new ThreadPoolManager();
        }
        else {
            sThreadPoolInstance.reInit();
        }
        return sThreadPoolInstance;
    }
    
    private ThreadPoolManager() {
        if (D) Log.d(TAG, "ThreadPoolManager");
        mThreadPool = new ThreadPool();
    }

    private void reInit() {
        if (mThreadPool == null)
            mThreadPool = new ThreadPool();
    }
    public void executeThread(UnitThread nt) {
        if (D) Log.d(TAG, "execute");
        if (mThreadPool != null)
            mThreadPool.executeUnitThread(nt);
        else
            Log.e(TAG, "ThreadPool is null. please get ThreadPoolManager Instance again..");
    }

    public void notifyThread(int id) {
        if (D) Log.d(TAG, "notify");
        if (mThreadPool != null)
            mThreadPool.notifyUnitThread(id);
        else
            Log.e(TAG, "ThreadPool is null. please get ThreadPoolManager Instance again..");
    }
    
    public void notifyAllThread() {
        if (D) Log.d(TAG, "notifyAllThread");
        if (mThreadPool != null)
            mThreadPool.notifyUnitThreadAll();
        else
            Log.e(TAG, "ThreadPool is null. please get ThreadPoolManager Instance again..");
    }

    public boolean setMaxThreadNumber(int max) {
        if (D) Log.d(TAG, "setMaxThreadNumber");
        if (mThreadPool != null)
            return mThreadPool.setMaxUnitThreadNumber(max);
        Log.e(TAG, "ThreadPool is null. please get ThreadPoolManager Instance again..");
        return false;
    }
    
    public void allowThreadTimeOut(boolean isAllow) {
        if (D) Log.d(TAG, "allowThreadTimeOut");
        if (mThreadPool != null)
            mThreadPool.allowUnitThreadTimeOut(isAllow);
        else
            Log.e(TAG, "ThreadPool is null. please get ThreadPoolManager Instance again..");
    }
    
    public void shutdownThread() {
        if (D) Log.d(TAG, "shutdownThread");
        if (mThreadPool != null) {
            mThreadPool.shutdownUnitThread();
            mThreadPool = null;
        }
    }

    public int getThreadCount() {
        if (D) Log.d(TAG, "getThreadCount");
        if (mThreadPool != null)
            return mThreadPool.getUnitThreadCount();
        Log.e(TAG, "ThreadPool is null. please get ThreadPoolManager Instance again..");
        return -1;
    }
}